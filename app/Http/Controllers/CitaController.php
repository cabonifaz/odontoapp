<?php

namespace App\Http\Controllers;

use App\Models\Cita;
use App\Models\Actividad;
use App\Models\Medico;
use App\Models\Paciente; // Asegúrate de que el modelo esté importado
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use App\Models\ActividadPorServicio;
use App\Models\ActividadesPaciente;
use App\Models\Presupuesto;
use App\Models\DetallePresupuesto;

class CitaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
{
    // Obtener el ID de la empresa del usuario autenticado
    $empresa_id = auth()->user()->empresa_id;

    // Obtener la fecha seleccionada o usar la fecha actual por defecto
    $fechaDesde = $request->input('fecha_agenda', now()->format('Y-m-d'));

    // Formatear la fecha para mostrar en la vista
    $fechaFormateada = Carbon::parse($fechaDesde)->locale('es')->translatedFormat('l d/m/Y');
    $fechaFormateada = ucfirst($fechaFormateada); // Capitalizar la primera letra del día de la semana

    // Obtener los médicos que pertenecen a la empresa
    $medicosDatos = Medico::where('empresa_id', $empresa_id)->get();

    // Obtener las citas de la fecha seleccionada y que pertenezcan a médicos de la empresa
    $citasDatos = Cita::with('paciente', 'servicio', 'medico')
        ->whereHas('medico', function($q) use ($empresa_id) {
            $q->where('empresa_id', $empresa_id);
        })
        ->whereDate('fecha_cita', $fechaDesde)
        ->orderBy('hora_inicio')
        ->get();

    // Calcular la duración total de citas para cada médico
    $totalDuraciones = [];
    foreach ($medicosDatos as $medico) {
        $totalDuraciones[$medico->id] = 0;
        foreach ($citasDatos as $cita) {
            if ($cita->id_medico == $medico->id) {
                $horaInicio = strtotime($cita->hora_inicio);
                $horaFin = strtotime($cita->hora_fin);
                $duracionMinutos = ($horaFin - $horaInicio) / 60;
                $totalDuraciones[$medico->id] += $duracionMinutos;
            }
        }
    }

    // Formatear las duraciones para mostrarlas en formato HH:MM
    $totalDuracionesFormatted = [];
    foreach ($totalDuraciones as $medicoId => $minutos) {
        $horas = floor($minutos / 60);
        $minutos = $minutos % 60;
        $totalDuracionesFormatted[$medicoId] = sprintf('%02d:%02d', $horas, $minutos);
    }

    // Pasar las variables a la vista
    return view('citas.index', [
        'fechaDesde' => $fechaDesde,
        'fechaFormateada' => $fechaFormateada,
        'medicosDatos' => $medicosDatos,
        'citasDatos' => $citasDatos,
        'totalDuraciones' => $totalDuracionesFormatted,
        'empresaId' => $empresa_id,
    ]);
}

    /**
     * Convertir minutos a horas y minutos.
     *
     * @param int $minutos
     * @return string
     */
    private function convertir_a_horas_y_minutos($minutos)
    {
        $horas = floor($minutos / 60);
        $minutosRestantes = $minutos % 60;
        return "{$horas}h {$minutosRestantes}m";
    }
    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Validación de los datos recibidos del formulario
        $validated = $request->validate([
            'id_medico' => 'required|integer|exists:medicos,id',
            'id_paciente' => 'required|integer|exists:pacientes,id',
            'fecha' => 'required|date',
            'hora_inicio' => 'required|date_format:H:i',
            'hora_fin' => 'required|date_format:H:i|after:hora_inicio',
            'id_servicio' => 'required|integer|exists:servicios,id',
            
            'condicion' => 'nullable|string|max:255',
            'presupuesto' => 'nullable|integer',
            'tratamiento' => 'nullable|integer',
            'estado' => 'required|integer',
        ], [
            'id_medico.exists' => 'El médico seleccionado no existe.',
            'id_paciente.exists' => 'El paciente seleccionado no existe.',
            'hora_fin.after' => 'La hora de fin debe ser posterior a la hora de inicio.',
        ]);
    
        try {
            // Obtener el ID de la empresa del usuario autenticado
            $empresaId = auth()->user()->empresa_id;
    
            // Crear la cita
            $cita = new Cita();
            $cita->id_medico = $validated['id_medico'];
            $cita->id_paciente = $validated['id_paciente'];
            $cita->fecha_cita = $validated['fecha'];
            $cita->hora_inicio = $validated['hora_inicio'];
            $cita->hora_fin = $validated['hora_fin'];
            $cita->id_servicio = $validated['id_servicio'];
            
            $cita->condicion = $validated['condicion'];
            $cita->presupuesto_id = $validated['presupuesto'];
            $cita->tratamiento_id = $validated['tratamiento'];
            $cita->estado = $validated['estado'];
            $cita->empresa_id = $empresaId; // Asociar cita con la empresa del usuario autenticado
            $cita->user_id = auth()->id(); // Asociar cita con el usuario autenticado
    
            // Guardar la cita en la base de datos
            $cita->save();
    
            // Verificar si presupuesto y tratamiento son diferentes de 0
            if ($validated['presupuesto'] != 0 && $validated['tratamiento'] != 0) {
                // Buscar el detallePresupuestoId con los valores de presupuesto_id y tratamiento_id
                $detallePresupuesto = DetallePresupuesto::where('presupuesto_id', $validated['presupuesto'])
                                                         ->where('tratamiento_id', $validated['tratamiento'])
                                                         ->first();
                
                if ($detallePresupuesto) {
                    $detallePresupuestoId = $detallePresupuesto->id;
    
                    // Actualizar las actividades_paciente relacionadas
                    ActividadesPaciente::where('detalle_presupuesto_id', $detallePresupuestoId)
                                       ->where('servicio_id', $validated['id_servicio'])
                                       ->update([
                                           'nueva_cita_id' => $cita->id,
                                           'medico_id' => $validated['id_medico'],
                                           'fecha' => $validated['fecha'],
                                           'hora_inicio' => $validated['hora_inicio'],
                                           'hora_fin' => $validated['hora_fin'],
                                           'updated_at' => now(),
                                       ]);
                }
            }
    
            // Obtener el ID de la nueva cita
            $nuevaCitaId = $cita->id; // Retornar respuesta JSON para AJAX
            return response()->json(['success' => true, 'cita_id' => $nuevaCitaId, 'message' => 'Cita creada con éxito!']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'error' => 'Error al crear la cita: ' . $e->getMessage()], 500);
        }
    }
    

    /**
     * Display the specified resource.
     */
    public function show(Cita $cita)
    {
        // Convertir fecha_cita a un formato adecuado para JSON si es necesario
        $cita->fecha_cita = Carbon::parse($cita->fecha_cita)->format('Y-m-d');

        // Preparar una respuesta con relaciones incluidas
        return response()->json([
            'success' => true,
            'cita' => [
                'id' => $cita->id,
                'id_medico' => $cita->id_medico,
                'nombre_medico' => $cita->medico->nombre_medico, // Asumiendo que tienes una relación con el modelo Medico
                'id_paciente' => $cita->id_paciente,
                'nombre_paciente' => $cita->paciente->nombre_completo, // Asumiendo que tienes una relación con el modelo Paciente
                'id_servicio' => $cita->id_servicio,
                'nombre_servicio' => $cita->servicio->nombre, // Asumiendo que tienes una relación con el modelo Servicio
                'id_presupuesto' => $cita->presupuesto_id,
                'id_tratamiento' => $cita->tratamiento_id,
                'condicion' => $cita->condicion,
                'fecha_cita' => $cita->fecha_cita,
                'hora_inicio' => $cita->hora_inicio,
                'hora_fin' => $cita->hora_fin,
                
            ],
        ]);
    }

    public function edit(Cita $cita)
    {
        // Cargar las relaciones con paciente y servicio
        $cita->load('paciente', 'servicio');

        return response()->json([
            'success' => true,
            'cita' => [
                'id' => $cita->id,
                'fecha' => $cita->fecha_cita,
                'hora_inicio' => $cita->hora_inicio,
                'hora_fin' => $cita->hora_fin,
                'paciente_id' => $cita->paciente->id,
                'paciente_nombre' => $cita->paciente->nombre_completo, // Usando el accessor del modelo Paciente
                'servicio_id' => $cita->servicio->id,
                'servicio_nombre' => $cita->servicio->nombre_servicio,
                
                // Otros campos necesarios...
            ],
        ]);
    }


    /**
     * Update the specified resource in storage.
     */

    public function update(Request $request, Cita $cita)
    {
        //\Log::info('Datos recibidos:', $());
        $validator = Validator::make($request->all(), [
            'id' => 'required|integer|exists:citas,id',
            'fecha' => 'required|date_format:Y-m-d',
            'hora_inicio' => 'required|date_format:H:i:s',
            'hora_fin' => 'required|date_format:H:i:s|after:hora_inicio',
            'id_medico' => 'required|integer',
            'id_paciente' => 'required|integer',
            'id_servicio' => 'required|integer',
            'presupuesto' => 'nullable|integer',
            'tratamiento' => 'nullable|integer',
            'condicion' => 'required|integer',
            
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => 'Datos inválidos.', 'errors' => $validator->errors()], 400);
        }

        try {
            // Verificar si la cita existe
            $cita = Cita::find($request->input('id'));

            if (!$cita) {
                return response()->json(['error' => 'Cita no encontrada.'], 404);
            }

            $idMedico = $request->input('id_medico');
            $fecha = $request->input('fecha');
            $horaInicio = $request->input('hora_inicio');
            $horaFin = $request->input('hora_fin');
            $empresaId = auth()->user()->empresa_id;
            $userId = auth()->user()->id;

            // Validar que hora_fin no sea menor que hora_inicio
            if (strtotime($horaFin) <= strtotime($horaInicio)) {
                return response()->json(['error' => 'La hora de fin debe ser después de la hora de inicio.'], 400);
            }
            // Verificar citas solapadas
            $citasSolapadas = DB::table('citas')
                ->where('id_medico', $idMedico)
                ->where('empresa_id', $empresaId)
                ->whereDate('fecha_cita', $fecha)  // Comparar solo la fecha
                ->where('id', '<>', $cita->id) // Excluir la cita actual
                ->where(function ($query) use ($horaInicio, $horaFin) {
                    $query->where('hora_inicio', '<', $horaFin)
                        ->where('hora_fin', '>', $horaInicio);
                })
                ->count();

            if ($citasSolapadas > 0) {
                return response()->json(['error' => 'El médico ya tiene una cita en ese horario.'], 400);
            }

            // Si no hay citas solapadas, proceder a actualizar los datos de la cita
            $cita->update([
                'fecha_cita' => $fecha,
                'hora_inicio' => $horaInicio,
                'hora_fin' => $horaFin,
                'id_medico' => $idMedico,
                'id_paciente' => $request->input('id_paciente'),
                'id_servicio' => $request->input('id_servicio'),
                
                'condicion' => $request->input('condicion'),
                
                'empresa_id' => $empresaId,
                'user_id' => $userId,
            ]);

            // Verificar si presupuesto y tratamiento son diferentes de 0
            $presupuesto = $request->input('presupuesto');
            $tratamiento = $request->input('tratamiento');

            if ($presupuesto != 0 && $tratamiento != 0) {
                $detallePresupuesto = DetallePresupuesto::where('presupuesto_id', $presupuesto)
                                                        ->where('tratamiento_id', $tratamiento)
                                                        ->first();

                if ($detallePresupuesto) {
                    $detallePresupuestoId = $detallePresupuesto->id;

                    // Actualizar las actividades_paciente relacionadas
                    ActividadesPaciente::where('detalle_presupuesto_id', $detallePresupuestoId)
                                    ->where('servicio_id', $request->input('id_servicio'))
                                    ->update([
                                        'nueva_cita_id' => $cita->id,
                                        'medico_id' => $idMedico,
                                        'fecha' => $fecha,
                                        'hora_inicio' => $horaInicio,
                                        'hora_fin' => $horaFin,
                                        'updated_at' => now(),
                                    ]);
                }
            }
            return response()->json([
                'success' => true,
                'message' => 'Cita actualizada con éxito.',
                'id_paciente' => $request->input('id_paciente')
            ]);

        } catch (\Exception $e) {
            return response()->json(['error' => 'Error al actualizar la cita: ' . $e->getMessage()], 500);
        }
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        try {
            // Buscar la cita
            $cita = Cita::findOrFail($id);

            // Actualizar actividades_paciente relacionado
            ActividadesPaciente::where('nueva_cita_id', $cita->id)->update([
                'nueva_cita_id' => null,
                'medico_id' => null,
                'fecha' => null,
                'hora_inicio' => null,
                'hora_fin' => null,
            ]);

            // Eliminar la cita
            $cita->delete();

            return response()->json(['success' => true, 'message' => 'Cita eliminada con éxito.']);
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => 'Error al eliminar la cita.'], 500);
        }
    }

    public function verificarDisponibilidad(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'fecha' => 'required|date_format:Y-m-d',
            'hora_inicio' => 'required|date_format:H:i',
            'hora_fin' => 'required|date_format:H:i',
            'id_medico' => 'required|integer',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => 'Datos inválidos.'], 400);
        }

        try {
            $fecha = $request->input('fecha');
            $horaInicio = $request->input('hora_inicio');
            $horaFin = $request->input('hora_fin');
            $idMedico = $request->input('id_medico');
            $empresaId = auth()->user()->empresa_id;


            // Consultar citas que se solapen con el rango solicitado
            $citasSolapadas = DB::table('citas')
                ->where('id_medico', $idMedico)
                ->where('empresa_id', $empresaId)
                ->whereDate('fecha_cita', $fecha) // Comparar solo la fecha
                ->where(function ($query) use ($horaInicio, $horaFin) {
                    $query->where(function ($q) use ($horaInicio, $horaFin) {
                        $q->where('hora_inicio', '<', $horaFin)
                            ->where('hora_fin', '>', $horaInicio);
                    });
                })
                ->get();

            \Log::info("Verificando disponibilidad para médico ID: {$idMedico}, Fecha: {$fecha}, Hora Inicio: {$horaInicio}, Hora Fin: {$horaFin}");
            \Log::info("Número de citas solapadas encontradas: " . $citasSolapadas->count());

            // Mostrar detalles de las citas solapadas
            if ($citasSolapadas->count() > 0) {
                foreach ($citasSolapadas as $cita) {
                    \Log::info("Cita solapada - Inicio: {$cita->hora_inicio}, Fin: {$cita->hora_fin}");
                }
            }

            // Retornar disponibilidad
            $available = $citasSolapadas->count() == 0;
            // Verificar si el usuario tiene permiso para crear una cita usando "can"
            $canCreateCita = $request->user()->can('Crear cita');
            // Retornar disponibilidad y permiso
            return response()->json([
                'available' => $available,
                'canCreateCita' => $canCreateCita
            ]);

        } catch (\Exception $e) {
            return response()->json(['error' => 'Error general: ' . $e->getMessage()], 500);
        }
    }

    public function mostrarCitasPorPaciente(Request $request, $id)
    {
        // Capturar las fechas de la URL o usar la fecha actual
        $fechaInicial = $request->query('fecha_inicial') ?? date('Y-m-d');
        $fechaFinal = $request->query('fecha_final') ?? date('Y-m-d');

        $empresaId = auth()->user()->empresa_id;

        // Filtrar las citas del paciente por rango de fechas y cargar actividades si existen
        $citas = Cita::where('id_paciente', $id)
            ->where('empresa_id', $empresaId)
            ->whereBetween('fecha_cita', [$fechaInicial, $fechaFinal])
            ->with(['medico', 'servicio', 'presupuesto.detalles' => function ($query) {
                $query->exists(); // Verificar si existen detalles
            }])
            ->orderByDesc('fecha_cita')
            ->orderByDesc('hora_inicio')
            ->get();
        
        $paciente = Paciente::find($id);
        if (!$paciente) {
            return redirect()->route('citas.index')->withErrors(['error' => 'Paciente no encontrado.']);
        }

        $nombrePaciente = $paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno;
        $pacienteId = $id;

        return view('citas.consulta', [
            'citas' => $citas,
            'pacienteId' => $pacienteId,
            'nombrePaciente' => $nombrePaciente,
            'fechaInicial' => $fechaInicial,
            'fechaFinal' => $fechaFinal,
        ]);
    }

    
    
    public function vistaImpresion(Request $request)
    {
        // Obtener la fecha seleccionada o usar la fecha actual por defecto
        $fechaDesde = $request->input('fecha', now()->format('Y-m-d'));
    
        // Formatear la fecha para mostrar en la vista
        $fechaFormateada = Carbon::parse($fechaDesde)->locale('es')->translatedFormat('l d/m/Y');
        // Capitalizar la primera letra del día de la semana
        $fechaFormateada = ucfirst($fechaFormateada);
        $empresaId = auth()->user()->empresa_id;
        
        // Obtener datos de los médicos filtrando por empresa_id
         $medicosDatos = Medico::where('empresa_id', $empresaId)->get();
        // Obtener el empresa_id del usuario autenticado
        
       
        // Obtener las citas de la fecha seleccionada filtrando por empresa_id
        $citasDatos = Cita::with('paciente', 'medico')
            ->whereDate('fecha_cita', $fechaDesde)  // Usar la variable correcta $fechaDesde
            ->where('empresa_id', $empresaId) // Filtrar por empresa_id
            ->get();
    
        return view('citas.impresion', [
            'fechaFormateada' => $fechaFormateada, // Formateado correctamente
            'medicosDatos' => $medicosDatos,
            'citasDatos' => $citasDatos,
        ]);
    }
    public function mostrarConsultaPorFecha()
    {
        return view('citas.consulta_por_fecha');
    }

    public function buscarCitas(Request $request)
    {
        // Validar el rango de fechas
        $request->validate([
            'fecha_inicio' => 'required|date',
            'fecha_fin' => 'required|date|after_or_equal:fecha_inicio',
        ]);

        // Obtener las fechas de inicio y fin
        $fechaInicio = Carbon::parse($request->fecha_inicio)->startOfDay();
        $fechaFin = Carbon::parse($request->fecha_fin)->endOfDay();
        // Obtener el ID de la empresa actual (puedes ajustarlo según tu lógica de autenticación)
        $empresaId = auth()->user()->empresa_id;

        // Realizar la consulta
        $citas = DB::table('pacientes')
            ->select(
                DB::raw("CONCAT(pacientes.ape_paterno, ' ', pacientes.ape_materno, ' ', pacientes.nombres) AS nombre_paciente"),
                'citas.fecha_cita',
                'citas.hora_inicio',
                'citas.hora_fin',
                'medicos.nombre_medico AS nombre_medico',
                'servicios.nombre',
                'users.name', // Nombre del usuario que creó la cita
                'citas.created_at',
                'citas.updated_at'
            )
            ->join('citas', 'citas.id_paciente', '=', 'pacientes.id')
            ->join('medicos', 'citas.id_medico', '=', 'medicos.id')
            ->join('servicios', 'citas.id_servicio', '=', 'servicios.id')
            ->join('users', 'citas.user_id', '=', 'users.id') // Asumiendo que tienes una relación para los usuarios
            ->where('citas.empresa_id', $empresaId) // Condición de empresa
            ->where(function ($query) use ($fechaInicio, $fechaFin) {
                $query->whereBetween('citas.created_at', [$fechaInicio, $fechaFin])
                    ->orWhereBetween('citas.updated_at', [$fechaInicio, $fechaFin]);
            })
            ->orderBy('citas.updated_at', 'desc')
            ->get();

        // Retornar la vista con los resultados y las fechas seleccionadas
        return view('citas.consulta_por_fecha', [
            'citas' => $citas,
            'fecha_inicio' => $request->fecha_inicio,
            'fecha_fin' => $request->fecha_fin,
        ]);
    }

    public function getActividades($citaId)
    {
        $cita = Cita::findOrFail($citaId);
        $actividades = ActividadPorServicio::where('servicio_id', $cita->id_servicio)
                    ->with('actividad') // Asegúrate de tener la relación definida en el modelo
                    ->orderBy('orden', 'asc') // Ordenar por el campo 'orden'
                    ->get()
                    ->map(function ($actividadServicio) {
                        return [
                            'id' => $actividadServicio->actividad->id,
                            'nombre' => $actividadServicio->actividad->nombre
                        ];
                    });
        return response()->json($actividades);
    }

    public function cambiarEstado($citaId)
    {
        // Buscar la relación en ActividadesPaciente
        $actividadPaciente = ActividadesPaciente::where('nueva_cita_id', $citaId)
            
            ->first();
    
        if (!$actividadPaciente) {
            return response()->json(['error' => 'Relación no encontrada'], 404);
        }
    
        // Cambiar el estado
        $actividadPaciente->estado = 1; // Cambiar a "Atendido"
        $actividadPaciente->save();
    
        return response()->json(['success' => true, 'message' => 'Estado actualizado correctamente']);
    }
    
    public function updateFechaActividad(Request $request) 
    {
        \Log::info('Datos recibidos:', $request->all());

        $request->validate([
            
            'actividad_id' => 'required|exists:actividades_paciente,id',
            'fecha' => 'required|date|date_format:Y-m-d',
            'nueva_cita_id' => 'required|exists:citas,id',
            'medico_id' => 'required',
        ]);

        $actividad = DB::table('actividades_paciente')
            
            ->where('id', $request->actividad_id)
            ->update([
                'fecha' => $request->fecha,
                'nueva_cita_id' => $request->nueva_cita_id,
                'hora_inicio' => $request->hora_inicio,
                'hora_fin' => $request->hora_fin,
                'medico_id' => $request->medico_id,
                'updated_at' => DB::raw('NOW()'),
            ]);

        if ($actividad) {
            return response()->json(['message' => 'Fecha y nueva cita actualizadas correctamente.']);
        } else {
            return response()->json(['message' => 'No se pudo actualizar la fecha y la nueva cita.'], 500);
        }
    }

    public function verActividades($presupuestoId, $tratamientoId)
    {
        $medicosDatos = Medico::all();
        
        // Buscar el presupuesto con sus detalles y relaciones necesarias
        $presupuesto = Presupuesto::with([
            'detalles.tratamiento',
            'detalles.procedimientos.servicio',
        ])->findOrFail($presupuestoId);

        // Filtrar detalles por tratamiento_id dinámicamente
        $detallesFiltrados = $presupuesto->detalles->filter(function ($detalle) use ($tratamientoId) {
            // Filtrar detalles donde tratamiento_id coincide con el valor pasado
            return $detalle->tratamiento_id == $tratamientoId;
        });

        // Obtener las actividades (procedimientos) de los detalles filtrados
        $actividades = $detallesFiltrados->flatMap(function ($detalle) {
            return $detalle->procedimientos;
        });

        // Calcular progreso
        $actividadesAtendidas = $actividades->where('estado', 1)->count();
        $totalActividades = $actividades->count();
        $porcentajeProgreso = $totalActividades > 0
            ? round(($actividadesAtendidas / $totalActividades) * 100)
            : 0;

        return view('citas.detalles_actividades', [
            'presupuesto' => $presupuesto,
            'actividades' => $actividades,
            'actividadesAtendidas' => $actividadesAtendidas,
            'totalActividades' => $totalActividades,
            'porcentajeProgreso' => $porcentajeProgreso,
            'medicosDatos' => $medicosDatos,
        ]);
    }


}
