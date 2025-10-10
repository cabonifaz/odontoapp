<?php

namespace App\Http\Controllers;

use App\Models\Presupuesto;
use App\Models\DetallePresupuesto;
use App\Models\ActividadesPaciente;
use App\Models\Medico;
use App\Models\Paciente;
use App\Models\Actividad;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Dompdf\Dompdf;
use Dompdf\Options;

class PresupuestoController extends Controller
{
    public function index(Request $request)
    {
        // Obtener el ID de la empresa del usuario autenticado
        $empresa_id = auth()->user()->empresa_id;
    
        // Capturar las fechas de la URL o usar la fecha actual
        $fechaInicial = $request->query('fecha_inicial') ?? date('Y-m-01'); // Primer día del mes actual
        $fechaFinal = $request->query('fecha_final') ?? date('Y-m-d'); // Fecha actual
        $pacienteId = $request->query('paciente_id'); // Obtener el paciente_id de la URL
        $nombrePaciente = ''; // Inicializar la variable del nombre del paciente
    
        // Obtener los médicos que pertenecen a la empresa
        $medicosDatos = Medico::where('empresa_id', $empresa_id)->get();
    
        // Obtener los tratamientos que pertenecen a la empresa
        $tratamientos = Actividad::where('empresa_id', $empresa_id)
                                 ->orderBy('nombre', 'asc')
                                 ->get();
    
        // Filtrar los presupuestos por fecha y paciente
        $presupuestosQuery = Presupuesto::with(['paciente', 'medico', 'empresa', 'user'])
                                        ->where('empresa_id', $empresa_id)
                                        ->whereBetween('fecha', [$fechaInicial, $fechaFinal]);
    
        if ($pacienteId) {
            $presupuestosQuery->where('paciente_id', $pacienteId);
    
            // Obtener el nombre completo del paciente
            $paciente = Paciente::find($pacienteId);
            if ($paciente) {
                $nombrePaciente = $paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno;
            }
        }
    
        $presupuestos = $presupuestosQuery->get();
    
        return view('presupuestos.index', compact('presupuestos', 'medicosDatos', 'tratamientos', 'empresa_id', 'fechaInicial', 'fechaFinal', 'pacienteId', 'nombrePaciente'));
    }
    

    public function create()
    {
        return view('presupuestos.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'id_paciente' => 'required|exists:pacientes,id',
            'fecha' => 'required|date',
            'medico_id' => 'required|exists:medicos,id',
            
        ]);

        $presupuesto = new Presupuesto();
        $presupuesto->paciente_id = $request->id_paciente;
        $presupuesto->fecha = $request->fecha;
        $presupuesto->medico_id = $request->medico_id;
        
        $presupuesto->empresa_id = auth()->user()->empresa_id; // Obtén el empresa_id del usuario logueado
        $presupuesto->user_id = auth()->user()->id; // Asigna el ID del usuario autenticado
        $presupuesto->save();

        return redirect()->route('presupuestos.index')->with('success', 'Presupuesto creado con éxito.');
    }


    public function show(Presupuesto $presupuesto)
    {
        return view('presupuestos.show', compact('presupuesto'));
    }

    public function edit(Presupuesto $presupuesto)
    {
        return view('presupuestos.edit', compact('presupuesto'));
    }

    public function update(Request $request, Presupuesto $presupuesto)
    {
        $request->validate([
            'paciente_id' => 'required|exists:pacientes,id',
            'fecha' => 'required|date',
            'medico_id' => 'required|exists:medicos,id',
            
        ]);

        $presupuesto->paciente_id = $request->paciente_id;
        $presupuesto->fecha = $request->fecha;
        $presupuesto->medico_id = $request->medico_id;
        
        $presupuesto->empresa_id = auth()->user()->empresa_id; // Obtén el empresa_id del usuario logueado
        $presupuesto->user_id = auth()->user()->id; // Asigna el ID del usuario autenticado

        $presupuesto->save();

        return redirect()->route('presupuestos.index')->with('success', 'Presupuesto actualizado con éxito.');
    }

    public function destroy(Presupuesto $presupuesto)
    {
        $presupuesto->delete();

        return redirect()->route('presupuestos.index')->with('success', 'Presupuesto eliminado con éxito.');
    }

    public function storeDetalle(Request $request)
    {
        $request->validate([
            'presupuesto_id' => 'required|exists:presupuestos,id',
            'tratamiento_id' => 'required|exists:tratamientos,id',
        ]);

        DetallePresupuesto::create([
            'presupuesto_id' => $request->presupuesto_id,
            'tratamiento_id' => $request->tratamiento_id,
            'empresa_id' => auth()->user()->empresa_id,
            'user_id' => auth()->id(),
        ]);

        return redirect()->back()->with('success', 'Detalle agregado correctamente.');
    }

    public function obtenerDetalles($presupuestoId)
    {
        try {
            // Verifica si el usuario tiene el permiso para ver el importe
            $puedeVerImporte = auth()->user()->can('Ver importe presupuesto');
    
            // Obtén los detalles asociados al presupuesto
            $detalles = DetallePresupuesto::where('presupuesto_id', $presupuestoId)
                ->with('tratamiento') // Asegúrate de tener la relación configurada
                ->get();
    
            if ($detalles->isEmpty()) {
                return response()->json([
                    'detalles' => [], 
                    'puedeVerImporte' => $puedeVerImporte
                ], 200); // Devuelve un arreglo vacío si no hay datos
            }
    
            return response()->json([
                'detalles' => $detalles, 
                'puedeVerImporte' => $puedeVerImporte
            ], 200);
        } catch (\Exception $e) {
            // Manejar errores
            return response()->json([
                'message' => 'Error al obtener los detalles del presupuesto',
                'error' => $e->getMessage()
            ], 500);
        }
    }
    
    
    public function generarActividades(Request $request)
    {
        try {
            Log::info('Datos de la solicitud:', $request->all());
            // Validar la solicitud
            $validated = $request->validate([
                'presupuestoId' => 'required|exists:presupuestos,id',
                'tratamientoId' => 'required|exists:actividades,id',
                'actividades' => 'required|array',
                'actividades.*.actividad_id' => 'required|exists:servicios,id',
                'precioFinal' => 'required|numeric',
                'cantidad' => 'required|numeric',
                'piezaDental' => 'nullable|string|max:255' // Validación para pieza_dental
            ]);
    
            // Obtener datos validados
            $presupuestoId = $validated['presupuestoId'];
            $tratamientoId = $validated['tratamientoId'];
            $actividades = $validated['actividades'];
            $precioFinal = $validated['precioFinal'];
            $cantidad = $validated['cantidad'];
            $piezaDental = $validated['piezaDental'] ?? null; // Obtener pieza_dental si está presente
    
            // Verificar si la combinación de presupuesto_id y tratamiento_id ya existe
            $existeDetalle = DetallePresupuesto::where('presupuesto_id', $presupuestoId)
                                               ->where('tratamiento_id', $tratamientoId)
                                               ->exists();
    
            if ($existeDetalle) {
                return response()->json(['success' => false, 'message' => 'El tratamiento ya está asociado a este presupuesto.']);
            }
    
            // Guardar en la tabla detalle_presupuesto
            $detallePresupuesto = DetallePresupuesto::create([
                'presupuesto_id' => $presupuestoId,
                'tratamiento_id' => $tratamientoId,
                'precio' => $precioFinal,
                'cantidad' => $cantidad,
                'detalle_pieza' => $piezaDental, // Guardar pieza_dental si está presente
                'empresa_id' => auth()->user()->empresa_id,
                'user_id' => auth()->id(),
            ]);
    
            // Guardar en la tabla actividades_paciente
            foreach ($actividades as $actividad) {
                ActividadesPaciente::create([
                    'detalle_presupuesto_id' => $detallePresupuesto->id,
                    'servicio_id' => $actividad['actividad_id'],
                    'user_id' => auth()->id(),
                    'empresa_id' => auth()->user()->empresa_id,
                ]);
            }
    
            // Actualizar el campo importe en la tabla presupuestos
            $presupuesto = Presupuesto::findOrFail($presupuestoId);
            $presupuesto->importe += ($precioFinal * $cantidad);
            $presupuesto->save();
    
            // Responder con éxito
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            // Manejar y registrar errores
            return response()->json(['success' => false, 'message' => 'Ocurrió un problema al generar las actividades.']);
        }
    }
    

    
    public function verActividades($id) 
    {
        // Obtener la cita y los datos relacionados
        $cita = Cita::with(['paciente', 'medico', 'servicio'])->findOrFail($id);

        // Obtener el ID de la empresa actual
        $empresaId = auth()->user()->empresa_id;

        // Obtener los médicos que pertenecen a la empresa
        $medicosDatos = Medico::where('empresa_id', $empresaId)->get();

        // Obtener las actividades asociadas a la cita actual con eliminación de duplicados
        $actividades = ActividadesPaciente::where('actividades_paciente.cita_id', $id)
        ->join('actividades', 'actividades.id', '=', 'actividades_paciente.tratamiento_id')
        ->leftJoin('actividades_por_tratamiento', function ($join) {
            $join->on('actividades.id', '=', 'actividades_por_tratamiento.tratamiento_id');
        })
        ->leftJoin('servicios', 'servicios.id', '=', 'actividades_paciente.servicio_id') // Join con servicios
        ->select(
            'actividades.nombre as tratamiento', // Nombre del tratamiento
            'servicios.nombre as actividad', // Nombre del servicio/procedimiento
            'actividades_paciente.id',
            'actividades_paciente.tratamiento_id',
            'actividades_paciente.servicio_id',
            'actividades_paciente.medico_id',
            'actividades_paciente.fecha',
            'actividades_paciente.hora_inicio',
            'actividades_paciente.hora_fin',
            'actividades_paciente.estado',
            'actividades_paciente.nueva_cita_id',
            DB::raw('MAX(actividades_por_tratamiento.porcentaje) as porcentaje') // Garantizar un único valor
        )
        ->groupBy('actividades_paciente.id') // Evitar duplicados
        ->get();

        // Calcular el progreso
        $totalActividades = $actividades->count();
        $actividadesAtendidas = $actividades->where('estado', 1)->count();
        $porcentajeTotal = $actividades->where('estado', 1)->sum('porcentaje');
        $porcentajeProgreso = ($totalActividades > 0) ? round($porcentajeTotal) : 0;

        // Pasar los datos a la vista
        return view('citas.detalles_actividades', [
            'cita' => $cita,
            'medicosDatos' => $medicosDatos,
            'actividades' => $actividades,
            'porcentajeProgreso' => $porcentajeProgreso,
            'actividadesAtendidas' => $actividadesAtendidas,
            'totalActividades' => $totalActividades
        ]);
    }
    public function getActividades($detalleId)
    {
        try {
            // Obtén las actividades relacionadas con el detalle del presupuesto
            $actividades = ActividadesPaciente::where('detalle_presupuesto_id', $detalleId)
                ->join('servicios', 'actividades_paciente.servicio_id', '=', 'servicios.id')
                ->select('actividades_paciente.id as actividad_id', 'servicios.nombre as servicio_nombre')
                ->get();

            return response()->json($actividades, 200);
        } catch (\Exception $e) {
            return response()->json([
                'message' => 'Error al obtener las actividades',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function eliminarDetalle($id)
    {
        try {
            // Encuentra el detalle de presupuesto y el presupuesto asociado
            $detalle = DetallePresupuesto::findOrFail($id);
            $presupuesto = $detalle->presupuesto;  // Asumiendo que hay una relación definida en el modelo DetallePresupuesto
    
            // Elimina el detalle de presupuesto
            $detalle->delete();
    
            // También elimina las actividades asociadas
            ActividadesPaciente::where('detalle_presupuesto_id', $id)->delete();
    
            // Recalcula el importe total del presupuesto
            $importeTotal = $presupuesto->detalles->sum('precio');  // Asumiendo que 'precio' es el nombre del campo en DetallePresupuesto
            $presupuesto->importe = $importeTotal;
            $presupuesto->save();
    
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            Log::error('Error al eliminar el detalle: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Ocurrió un problema al eliminar el detalle.']);
        }
    }
    public function actualizarDetalle(Request $request, $id)
    {
        try {
            // Validar los datos de entrada
            $validated = $request->validate([
                'cantidad' => 'required|integer|min:1', // Cantidad debe ser un número entero >= 1
                'precio' => 'required|numeric|min:1',  // Precio debe ser un número >= 1
            ]);

            // Encuentra el detalle de presupuesto y el presupuesto asociado
            $detalle = DetallePresupuesto::findOrFail($id);
            $presupuesto = $detalle->presupuesto; // Asumiendo que hay una relación definida en el modelo

            // Actualizar los valores del detalle
            $detalle->cantidad = $validated['cantidad'];
            $detalle->precio = $validated['precio'];
            $detalle->save();

            // Recalcular el importe total del presupuesto
            $importeTotal = $presupuesto->detalles->sum(function ($detalle) {
                return $detalle->precio * $detalle->cantidad;
            });
            $presupuesto->importe = $importeTotal;
            $presupuesto->save();

            return response()->json(['success' => true, 'message' => 'Detalle actualizado con éxito.']);
        } catch (\Exception $e) {
            Log::error('Error al actualizar el detalle: ' . $e->getMessage());
            return response()->json(['success' => false, 'message' => 'Ocurrió un problema al actualizar el detalle.']);
        }
    }

    public function actualizarEstado(Request $request, $id)
    {
        // Verificar si el usuario tiene permiso para actualizar el estado
        if (!Auth::user()->can('Aprobar Presupuesto')) {
            return response()->json(['error' => 'No tienes permiso para realizar esta acción.'], 403);
        }

        // Validar el estado
        $request->validate([
            'estado' => 'required|integer|in:1,4', // Asegúrate de que el estado sea 1 (Aprobar) o 4 (Rechazar)
        ]);

        // Buscar el presupuesto por ID
        $presupuesto = Presupuesto::findOrFail($id);

        // Actualizar el estado del presupuesto
        $presupuesto->estado = $request->input('estado');
        $presupuesto->save();

        return response()->json(['success' => 'Estado del presupuesto actualizado con éxito.']);
    }

    public function getPresupuestosAprobados($pacienteId)
    {
        $presupuestos = Presupuesto::where('paciente_id', $pacienteId)
            ->where('estado', 1)
            ->with(['detalles.tratamiento', 'detalles.procedimientos.servicio'])
            ->get();

        $data = $presupuestos->map(function ($presupuesto) {
            return [
                'id' => $presupuesto->id, // Añadir el ID del presupuesto
                'fecha' => $presupuesto->created_at->format('d/m/Y'),
                'tratamientos' => $presupuesto->detalles->map(function ($detalle) {
                    return [
                        'id' => $detalle->tratamiento->id,
                        'nombre' => $detalle->tratamiento->nombre,
                        'detalle_pieza' => $detalle->detalle_pieza,
                        'procedimientos' => $detalle->procedimientos->map(function ($procedimiento) {
                            // Verificar si 'nueva_cita_id' es diferente de null
                            if ($procedimiento->nueva_cita_id !== null) {
                                return [
                                    'id' => $procedimiento->servicio->id,
                                    'nombre' => $procedimiento->servicio->nombre,
                                    'fecha_cita' => $procedimiento->fecha, // Incluir la fecha de la cita
                                ];
                            } else {
                                // Si no tiene 'nueva_cita_id' entonces no mostrar la fecha
                                return [
                                    'id' => $procedimiento->servicio->id,
                                    'nombre' => $procedimiento->servicio->nombre
                                ];
                            }
                        }),
                    ];
                }),
            ];
        });

        return response()->json($data);
    }

        

    public function imprimir($id)
    {
        // Obtener el presupuesto con sus detalles, tratamientos, y procedimientos
        $presupuesto = Presupuesto::where('id', $id)
            ->with(['detalles.tratamiento', 'detalles.procedimientos.servicio', 'medico', 'paciente'])
            ->firstOrFail();
    
        // Mapear los datos de los tratamientos y procedimientos
        $tratamientos = $presupuesto->detalles->map(function ($detalle) {
            return [
                'nombre' => $detalle->tratamiento->nombre,
                'precio' => $detalle->precio, // Precio del tratamiento
                'cantidad' => $detalle->cantidad,
                'detalle_pieza' => $detalle->detalle_pieza,
                'procedimientos' => $detalle->procedimientos->map(function ($procedimiento) {
                    return $procedimiento->servicio->nombre;
                }),
            ];
        });
    
        // Determinar el estado del presupuesto
        $estado = match ($presupuesto->estado) {
            0 => null, // No mostrar si es 0
            1 => ['estado' => 'Aprobado', 'fecha' => $presupuesto->updated_at],
            2 => ['estado' => 'En proceso', 'fecha' => $presupuesto->updated_at],
            3 => ['estado' => 'Culminado', 'fecha' => $presupuesto->updated_at],
            4 => ['estado' => 'Rechazado', 'fecha' => $presupuesto->updated_at],
            default => null,
        };
    
        // Configurar Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $dompdf = new Dompdf($options);
        
        $logoPath = public_path('img/logo.png');
        $type = pathinfo($logoPath, PATHINFO_EXTENSION);
        $logoData = file_get_contents($logoPath);
        $base64Logo = 'data:image/' . $type . ';base64,' . base64_encode($logoData);
        // Renderizar la vista del PDF con los datos
        $html = view('presupuestos.imprimir', compact('presupuesto', 'tratamientos', 'estado', 'base64Logo'))->render();
    
        // Cargar el HTML en Dompdf
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait');
        $dompdf->render();
    
        // Enviar el archivo como descarga
        return $dompdf->stream('Presupuesto_' . $presupuesto->id . '.pdf', ['Attachment' => false]);
    }
        

}


    

