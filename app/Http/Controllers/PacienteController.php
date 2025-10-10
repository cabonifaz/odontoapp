<?php

namespace App\Http\Controllers;

use App\Models\Paciente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\PacientesExport;
use Carbon\Carbon; // Asegúrate de importar Carbon
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Log;
use App\Models\TipoDocIdentidad;
use App\Exports\PacientesGeneralExport;

class PacienteController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        // Obtener el ID de la empresa del usuario autenticado
        $empresa_id = auth()->user()->empresa_id;
    
        // Crear la consulta base para obtener los pacientes que pertenecen a esa empresa
        $query = Paciente::select(
            DB::raw("CONCAT(nombres, ' ', ape_paterno, ' ', COALESCE(ape_materno, '')) AS nombre_paciente"),
            'historia',
            'tipodocumento',
            'numerodoc',
            'telefono',
            'email',
            'fecha_nacimiento',
            'id',
            'nombres',
            'ape_paterno',
            'ape_materno',
            'direccion',
            'profesion',
            'nacionalidad',
            'pais_procedencia',
            'sexo',
            'cod_estciv'

        )->where('empresa_id', $empresa_id); // Filtro por empresa
    
        // Verificar si hay algún filtro en el request
        if ($request->filled('filter') && $request->filled('search')) {
            switch ($request->filter) {
                case 'nombre':
                    // Filtrar por nombre de paciente
                    $query->where(DB::raw("CONCAT(nombres, ' ', ape_paterno, ' ', COALESCE(ape_materno, ''))"), 'like', '%' . $request->search . '%');
                    break;
    
                case 'dias':
                    // Filtrar por días desde la última cita
                    $query->whereHas('citas', function ($q) use ($request) {
                        $q->whereRaw('DATEDIFF(CURDATE(), fecha_cita) <= ?', [$request->search]);
                    });
                    break;
    
                case 'cumpleanos':
                    // Filtrar por mes de cumpleaños
                    $query->whereMonth('fecha_nacimiento', $request->search);
                    break;
    
                default:
                    // No hacer nada si el filtro es desconocido
                    break;
            }
        }
    
        // Ordenar los registros por nombre completo del paciente
        //$pacientes = $query->orderBy('nombre_paciente')->paginate(20); // Paginación para 20 registros
        $pacientes = $query->with('tipoDocumento')->orderBy('nombre_paciente')->paginate(20);

    
        // Obtener los datos de la tabla tipo_doc_identidad
        $tiposDocumento = TipoDocIdentidad::select('codigo', 'abrev', 'descripcion')->get();

        // Devolver la vista con los pacientes y los tipos de documento
        return view('pacientes.index', compact('pacientes', 'tiposDocumento'));

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
        // Validación de los campos requeridos y opcionales
        $request->validate([
            'tipo_documento' => 'required|exists:tipo_doc_identidad,codigo', // Validar que tipo_documento exista
            'dni' => [
                'required',
                function ($attribute, $value, $fail) use ($request) {
                    // Validar formato según el tipo de documento
                    switch ($request->tipo_documento) {
                        case '1': // DNI
                            if (!preg_match('/^[0-9]{8}$/', $value)) {
                                $fail('El DNI debe contener exactamente 8 dígitos numéricos.');
                            }
                            break;
                        case '7': // PAS (Pasaporte)
                            if (!preg_match('/^[A-Z]{1,2}[0-9]{6,7}$/', $value)) {
                                $fail('El Pasaporte debe tener el formato AB123456 o A1234567.');
                            }
                            break;
                        case '4': // CEX (Carnet de Extranjería)
                        case 'A': // CDI (Carnet de Identidad)
                        case 'E': // TAM (Tarjeta de Migración)
                            if (!preg_match('/^[A-Za-z0-9]{1,20}$/', $value)) {
                                $fail('El documento debe tener un máximo de 20 caracteres alfanuméricos sin espacios.');
                            }
                            break;
                        default:
                            $fail('El Tipo de Documento seleccionado no es válido.');
                    }

                    // Validar combinación única de tipo_documento y dni
                    if (Paciente::where('tipodocumento', $request->tipo_documento)
                            ->where('numerodoc', $value)
                            ->exists()) {
                        $fail('La combinación de Tipo de Documento y Número de Documento ya está registrada.');
                    }
                },
            ],
            'nombre_paciente' => 'required|string|max:255',
            'ape_paterno' => 'required|string|max:255',
            'ape_materno' => [
                'nullable', // No es requerido por defecto
                'string',
                'max:255',
                function ($attribute, $value, $fail) use ($request) {
                    if ($request->input('tipo_documento') == '1' && empty($value)) {
                        $fail('El campo Apellido Materno es obligatorio para el tipo de documento DNI.');
                    }
                },
            ],
            'historia' => 'required|string|max:255|unique:pacientes,historia',
            'fecha_nacimiento' => 'nullable|date',
            'telefono' => 'nullable|string|digits_between:7,15',
            'email' => 'nullable|email|max:255',
            'direccion' => 'nullable|string|max:255',
        ], [
            'tipo_documento.required' => 'El campo Tipo de Documento es obligatorio.',
            'tipo_documento.exists' => 'El Tipo de Documento seleccionado no es válido.',
            'dni.required' => 'El campo Documento es obligatorio.',
            'dni.unique' => 'La combinación de Tipo de Documento y Número de Documento ya está registrada.',
        ]);

        try {
            // Creación y almacenamiento del paciente
            $paciente = new Paciente();
            $paciente->numerodoc = $request->dni;
            $paciente->tipodocumento = $request->tipo_documento;
            $paciente->nombres = $request->nombre_paciente;
            $paciente->ape_paterno = $request->ape_paterno;
            $paciente->ape_materno = $request->ape_materno;
            $paciente->historia = $request->historia;

            // Campos opcionales
            $paciente->fecha_nacimiento = $request->fecha_nacimiento ?? null;
            $paciente->telefono = $request->telefono ?? null;
            $paciente->email = $request->email ?? null;
            $paciente->direccion = $request->direccion ?? null;
            $paciente->profesion = $request->profesion ?? null;
            $paciente->nacionalidad = $request->nacionalidad ?? 1;
            $paciente->pais_procedencia = $request->pais ?? null;
            $paciente->sexo = $request->sexo ?? 0;
            $paciente->cod_estciv = $request->estado ?? 0;

            $paciente->empresa_id = auth()->user()->empresa_id; 
            $paciente->user_id = auth()->id();
            
            // Guardar en la base de datos
            $paciente->save();

            return redirect()->route('pacientes.index')->with('success', 'Paciente creado con éxito!');
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Ocurrió un error al guardar el paciente.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }
 

    /**
     * Display the specified resource.
     */
    public function show(Paciente $paciente)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Paciente $paciente)
    {
        // Devuelve los datos del médico como JSON
        return response()->json($paciente);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Paciente $paciente)
    {
        // Registrar los datos de entrada en el log (opcional)
        //Log::info('Solicitud recibida para actualizar paciente:', $request->all());

        // Validar los datos de entrada
        $validator = Validator::make($request->all(), [
            'edit_tipo_documento' => 'required|exists:tipo_doc_identidad,codigo', // Validar existencia en tipo_doc_identidad
            'edit_nombres' => 'required|string|max:255',
            'edit_ape_paterno' => 'required|string|max:255',
            'edit_ape_materno' => [
                'nullable', // No es requerido por defecto
                'string',
                'max:255',
                function ($attribute, $value, $fail) use ($request) {
                    if ($request->input('tipo_documento') == '1' && empty($value)) {
                        $fail('El campo Apellido Materno es obligatorio para el tipo de documento DNI.');
                    }
                },
            ],
            'edit_historia' => [
                'required',
                'string',
                'alpha_num',
                'max:20',
                Rule::unique('pacientes', 'historia')->ignore($paciente->id),
            ],
            'edit_dni' => [
                'required',
                function ($attribute, $value, $fail) use ($request, $paciente) {
                    switch ($request->input('edit_tipo_documento')) {
                        case '1': // DNI
                            if (!preg_match('/^[0-9]{8}$/', $value)) {
                                $fail('El DNI debe contener exactamente 8 dígitos numéricos.');
                            }
                            break;
                        case '7': // PAS (Pasaporte)
                            if (!preg_match('/^[A-Z]{1,2}[0-9]{6,7}$/', $value)) {
                                $fail('El Pasaporte debe tener el formato AB123456 o A1234567.');
                            }
                            break;
                        case '4': // CEX (Carnet de Extranjería)
                        case 'A': // CDI (Carnet de Identidad)
                        case 'E': // TAM (Tarjeta de Migración)
                            if (!preg_match('/^[A-Za-z0-9]{1,20}$/', $value)) {
                                $fail('El documento debe tener un máximo de 20 caracteres alfanuméricos sin espacios.');
                            }
                            break;
                        default:
                            $fail('El Tipo de Documento seleccionado no es válido.');
                    }
        
                    // Validar combinación única de tipo_documento y dni
                    if (Paciente::where('tipodocumento', $request->input('edit_tipo_documento'))
                                ->where('numerodoc', $value)
                                ->where('id', '!=', $paciente->id)
                                ->exists()) {
                        $fail('La combinación de Tipo de Documento y Número de Documento ya está registrada.');
                    }
                },
            ],
            'edit_telefono' => 'nullable|digits_between:7,15',
            'edit_email' => 'nullable|email',
            'edit_direccion' => 'nullable|string|max:255',
            'edit_fecha_nacimiento' => 'nullable|date',
        ]);        

        if ($validator->fails()) {
            //Log::error('Error de validación al actualizar paciente:', $validator->errors()->toArray());
            return redirect()->back()->withErrors($validator)->withInput();
        }

        try {
            // Registrar que la actualización comenzará (opcional)
            //Log::info("Actualizando paciente con ID: {$paciente->id}");

            // Actualizar datos del paciente
            $paciente->tipodocumento = $request->input('edit_tipo_documento'); // Grabar el tipo de documento
            $paciente->nombres = $request->input('edit_nombres');
            $paciente->ape_paterno = $request->input('edit_ape_paterno');
            $paciente->ape_materno = $request->input('edit_ape_materno');
            $paciente->historia = $request->input('edit_historia');
            $paciente->numerodoc = $request->input('edit_dni'); // Asignar el valor de DNI
            $paciente->telefono = $request->input('edit_telefono');
            $paciente->email = $request->input('edit_email');
            $paciente->direccion = $request->input('edit_direccion');
            $paciente->fecha_nacimiento = $request->input('edit_fecha_nacimiento');
            $paciente->profesion = $request->input('edit_profesion');
            $paciente->nacionalidad = $request->input('edit_nacionalidad');
            $paciente->pais_procedencia = $request->input('edit_pais');
            $paciente->sexo = $request->input('edit_sexo');
            $paciente->cod_estciv = $request->input('edit_estado');

            // Asociar empresa y usuario
            $paciente->empresa_id = auth()->user()->empresa_id;
            $paciente->user_id = auth()->id();

            // Guardar los cambios
            if ($paciente->save()) {
                Log::info("Paciente ID {$paciente->id} actualizado con éxito.");
            } else {
                //Log::error("Error al guardar el paciente ID {$paciente->id} en la base de datos.");
            }
        } catch (\Exception $e) {
            Log::error("Excepción al actualizar paciente ID {$paciente->id}: " . $e->getMessage());
            return redirect()->back()->with('error', 'Ocurrió un error al actualizar el paciente.');
        }

        return redirect()->route('pacientes.index')->with('success', 'Paciente actualizado con éxito');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Paciente $paciente)
    {
        $paciente->delete();
        return redirect()->route('pacientes.index')->with('success', 'Paciente eliminado con éxito.');
    }
    public function filtrarPacientes(Request $request) 
    {
        // Obtener el término de búsqueda y el empresa_id
        $term = $request->input('term');
        $empresaId = $request->input('empresa_id');

        // Construir la consulta inicial
        $query = Paciente::query();

        // Si se proporciona empresa_id, filtrar por ello
        if ($empresaId) {
            $query->where('empresa_id', $empresaId);
        }

        // Si se proporciona un término de búsqueda, dividirlo en palabras
        if ($term) {
            $keywords = preg_split('/\s+/', trim($term)); // Dividir por espacios

            $query->where(function ($subQuery) use ($keywords) {
                foreach ($keywords as $keyword) {
                    $subQuery->where(function ($innerQuery) use ($keyword) {
                        $innerQuery->where('nombres', 'LIKE', "%{$keyword}%")
                            ->orWhere('ape_paterno', 'LIKE', "%{$keyword}%")
                            ->orWhere('ape_materno', 'LIKE', "%{$keyword}%");
                    });
                }

                // Agregar un filtro adicional para combinaciones de nombre completo
                if (count($keywords) >= 2) {
                    $subQuery->orWhereRaw("CONCAT(nombres, ' ', ape_paterno) LIKE ?", ["%{$keywords[0]}% {$keywords[1]}%"]);
                    $subQuery->orWhereRaw("CONCAT(ape_paterno, ' ', COALESCE(ape_materno, '')) LIKE ?", ["%{$keywords[0]}% {$keywords[1]}%"]);
                }
            });
        }

        // Ordenar por nombres y apellidos
        $pacientes = $query->orderBy('nombres')
            ->orderBy('ape_paterno')
            ->orderBy('ape_materno')
            ->get()
            ->map(function ($paciente) {
                $paciente->ape_materno = $paciente->ape_materno ?? ''; // Reemplazar NULL con cadena vacía
                return $paciente;
            });

        return response()->json($pacientes);

    }


    public function exportPacientesCumpleanos(Request $request)
    {
        // Log para verificar que estamos recibiendo el mes
        \Log::info('Exportando cumpleaños para el mes: ' . $request->input('search'));

        // Obtener el mes seleccionado
        $mesNumero = $request->input('search');


       // Obtener el nombre del mes en español y convertirlo a mayúsculas
        $mesNombre = Carbon::createFromFormat('m', $mesNumero)
        ->locale('es')  // Establecer el idioma a español
        ->monthName;    // Obtener el nombre completo del mes

        // Convertir a mayúsculas
        $mesNombre = strtoupper($mesNombre);


        // Obtener los pacientes que cumplen años en el mes seleccionado
        $pacientes = DB::table('pacientes')
            ->select(
                DB::raw("CONCAT(nombres, ' ', ape_paterno, ' ', COALESCE(ape_materno, '')) AS nombre_paciente"),
                'historia',
                'tipodocumento',
                'numerodoc',
                'telefono',
                'email',
                'fecha_nacimiento'
            )
            ->whereMonth('fecha_nacimiento', $mesNumero)
            ->where('empresa_id', auth()->user()->empresa_id)  // Asegurar que solo se filtren los pacientes de la empresa del usuario autenticado
            ->get();

        // Pasar la colección de pacientes y el nombre del mes al export
        return Excel::download(new PacientesExport($pacientes, $mesNombre), 'pacientes_cumpleanos_mes_' . $mesNombre . '.xlsx');
    }

    public function exportPacientesCumpleanosPDF(Request $request)
    {
        // Obtener el mes seleccionado
        $mesNumero = $request->input('search');
        Log::info("Mes seleccionado: " . $mesNumero); // 🔍 Registro de depuración
    
        // Obtener el nombre del mes en español y en mayúsculas
        $mesNombre = Carbon::createFromFormat('m', $mesNumero)->locale('es')->monthName;
        Log::info("Nombre del mes: " . strtoupper($mesNombre)); // 🔍 Registro de depuración
    
        // Crear un array vacío para acumular datos
        $pacientesData = [];
    
        // Procesar datos en bloques para evitar sobrecarga
        DB::table('pacientes')
            ->select(
                DB::raw("CONCAT(nombres, ' ', ape_paterno, ' ', COALESCE(ape_materno, '')) AS nombre_paciente"),
                'historia',
                'tipodocumento',
                'numerodoc',
                'telefono',
                'email',
                'fecha_nacimiento'
            )
            ->whereMonth('fecha_nacimiento', $mesNumero)
            ->where('empresa_id', auth()->user()->empresa_id)
            ->orderBy('fecha_nacimiento') // 🔹 Necesario para que lazy() funcione correctamente
            ->lazy()
            ->each(function ($paciente) use (&$pacientesData) {
                // Convertir la fecha de nacimiento al día
                $paciente->fecha_nacimiento = Carbon::parse($paciente->fecha_nacimiento)->day;
                $pacientesData[] = $paciente;
            });
    
        Log::info("Total de pacientes procesados: " . count($pacientesData)); // 🔍 Registro de depuración
    
        // Generar el PDF usando la vista
        $pdf = Pdf::loadView('pacientes/pacientes_cumpleanos_pdf', [
            'pacientes' => $pacientesData,
            'mesNombre' => strtoupper($mesNombre),
        ])->setPaper('a4', 'landscape'); // 🔹 Usa formato horizontal
    
        Log::info("PDF generado correctamente"); // 🔍 Registro de depuración
    
        return $pdf->download("pacientes_cumpleanos_mes_" . strtoupper($mesNombre) . ".pdf");
    }

    public function buscarPaciente(Request $request)
    {
        $tipoDoc = $request->tipo_documento;
        $numDoc = trim($request->numero_documento);

        // Guardar datos recibidos en el log
        Log::info('Solicitud de búsqueda de paciente', [
            'tipo_documento' => $tipoDoc,
            'numero_documento' => $numDoc
        ]);

        $paciente = Paciente::where('tipodocumento', $tipoDoc)
                            ->where('numerodoc', $numDoc)
                            ->first();

        if ($paciente) {
            $response = [
                'success' => true,
                'apellido_paterno' => $paciente->ape_paterno,
                'apellido_materno' => $paciente->ape_materno,
                'nombres' => $paciente->nombres
            ];

            // Guardar respuesta exitosa en el log
            Log::info('Paciente encontrado', ['response' => $response]);

            return response()->json($response);
        } else {
            // Guardar respuesta de error en el log
            Log::warning('Paciente no encontrado', ['tipo_documento' => $tipoDoc, 'numero_documento' => $numDoc]);

            return response()->json(['success' => false]);
        }
    }

    public function exportPacientesGenerales()
    {
        Log::info('Inicio de exportación de pacientes generales');

        try {
            $pacientes = DB::table('pacientes as p')
                ->leftJoin(DB::raw('(SELECT id_paciente, MAX(fecha_cita) as ultima_cita FROM citas GROUP BY id_paciente) as ultimas'), 'p.id', '=', 'ultimas.id_paciente')
                ->leftJoin(DB::raw('(
                    SELECT id_paciente,
                        MAX(CASE WHEN condicion = 2 THEN "NUEVO" 
                                WHEN condicion = 3 THEN "HAPPY KIDS" 
                                ELSE NULL END) as obs
                    FROM citas
                    GROUP BY id_paciente
                ) as obs'), 'p.id', '=', 'obs.id_paciente')
                ->select(
                    'p.historia',
                    'p.tipodocumento',
                    'p.numerodoc',
                    DB::raw("CONCAT(p.ape_paterno, ' ', p.ape_materno, ' ', p.nombres) AS nombre_paciente"),
                    'p.email',
                    'p.direccion',
                    'p.telefono',
                    'p.fecha_nacimiento',
                    'ultimas.ultima_cita',
                    DB::raw("CASE 
                        WHEN EXISTS (SELECT 1 FROM citas c2 WHERE c2.id_paciente = p.id AND c2.condicion = 3) THEN 'HAPPY KIDS'
                        WHEN EXISTS (SELECT 1 FROM citas c2 WHERE c2.id_paciente = p.id AND c2.condicion = 2) THEN 'NUEVO'
                        ELSE ''
                    END AS observacion")
                )
                ->where('p.empresa_id', auth()->user()->empresa_id)
                ->orderBy('p.ape_paterno')
                ->get();

            Log::info('Cantidad de pacientes exportados: ' . $pacientes->count());

            return Excel::download(new PacientesGeneralExport($pacientes), 'pacientes_general.xlsx');

        } catch (\Exception $e) {
            Log::error('Error exportando pacientes generales: ' . $e->getMessage());
            return response()->json(['error' => 'Ocurrió un error al exportar los pacientes'], 500);
        }
    }

}
