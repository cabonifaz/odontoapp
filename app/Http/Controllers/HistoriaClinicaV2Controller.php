<?php

namespace App\Http\Controllers;

use App\Models\HistoriaClinicaV2;
use App\Models\Paciente;
use App\Models\Enfermedad;
use App\Models\Cita;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Carbon;

class HistoriaClinicaV2Controller extends Controller
{
    public function index()
    {
        $pacientes = Paciente::orderBy('ape_paterno')->get(); // Obtiene la lista de pacientes ordenada por nombre
        return view('historia_clinica.index', compact('pacientes')); // Envía la variable a la vista
    }

    public function create($paciente_id)
    {
        $paciente = Paciente::find($paciente_id);
    
        if (!$paciente) {
            return redirect()->back()->with('error', 'Paciente no encontrado.');
        }
    
        // Obtener todas las enfermedades del sistema
        $enfermedades = Enfermedad::orderBy('nombre')->get();
    
        // Obtener la última historia activa del paciente
        $ultimaHistoria = HistoriaClinicaV2::where('paciente_id', $paciente_id)
            ->where('estado', 1)
            ->orderByDesc('version')
            ->first();
    
        // Enfermedades del paciente asociadas a la última historia
        $enfermedadesPaciente = [];
        $hallazgos = [];
        if ($ultimaHistoria) {
            $enfermedadesPaciente = DB::table('paciente_enfermedad')
                ->where('paciente_id', $paciente_id)
                ->where('historia_clinica_id', $ultimaHistoria->id) // FILTRA POR HISTORIA
                ->where('activo', 1)
                ->pluck('enfermedad_id')
                ->toArray();
            // 🔹 Obtener los hallazgos del odontograma de la última historia
            $hallazgos = DB::table('odontogramas_detalle')
                ->where('historia_clinica_id', $ultimaHistoria->id)
                ->select(
                    'historia_clinica_id',
                    'tipo',
                    'sigla',
                    'nombre',
                    'descripcion',
                    'observaciones',
                    'color',
                    'accion',
                    'sentido',
                    'desde_diente',
                    'hasta_diente',
                    'coordenada_x1',
                    'coordenada_y1',
                    'coordenada_x2',
                    'coordenada_y2',
                    'texto_x',
                    'texto_y',
                    'path_svg',
                    'zona_id'
            )
            ->get();
        }

        $medicosDatos = DB::table('medicos')
        ->select('id', 'nombre_medico')
        ->orderBy('nombre_medico')
        ->get();

        return view('historia_clinica.create', compact(
            'paciente',
            'enfermedades',
            'enfermedadesPaciente',
            'ultimaHistoria',
            'hallazgos', // ✅ Ahora también disponible en la vista
            'medicosDatos' // ✅ enviar a la vista
        ));
    }
    

    public function store(Request $request)
    {
        //Log::info('Request recibido en store:', $request->all());

        DB::beginTransaction();
        try {
            // Si ya existe una historia clínica activa, desactivarla
            $historiaExistente = HistoriaClinicaV2::where('paciente_id', $request->paciente_id)
                ->where('estado', 1)
                ->first();

            $nuevaVersion = 1;
            if ($historiaExistente) {
                $historiaExistente->estado = 0; // Inactivar la anterior
                $historiaExistente->save();
                $nuevaVersion = $historiaExistente->version + 1;
            }

            // Crear nueva historia clínica
            $historia = HistoriaClinicaV2::create([
                'paciente_id' => $request->paciente_id,
                'version' => $nuevaVersion,
                'estado' => 1,
                'fecha_registro' => now(),

                'tratamiento_medico' => $request->tratamiento_medico,
                'medicamentos_actuales' => $request->medicamentos_actuales,
                'problema_cicatrizacion' => $request->problema_cicatrizacion,
                'transfusion' => $request->transfusion,
                'radio_quimio' => $request->radio_quimio,
                'reaccion_medicamento' => $request->reaccion_medicamento,
                'alergia' => $request->alergia,
                'problema_articulaciones' => $request->problema_articulaciones,
                'fumador' => $request->fumador,
                'toma_alchohol' => $request->toma_alchohol,
                'embarazada' => $request->embarazada,
                'ansiedad' => $request->ansiedad,
                'problema_sueno' => $request->problema_sueno,
                'ultimo_tratamiento' => $request->ultimo_tratamiento,
                'complicacion_tratamiento' => $request->complicacion_tratamiento,
                'sonrisa' => $request->sonrisa,
                'restauraciones' => $request->restauraciones,
                'dientes_blancos' => $request->dientes_blancos,
                'dolor_masticar' => $request->dolor_masticar,
                'dolor_musculo' => $request->dolor_musculo,
                'mordida_inestable' => $request->mordida_inestable,
                'molestia_masticar' => $request->molestia_masticar,
                'aprieta_dientes' => $request->aprieta_dientes,
                'uso_placa' => $request->uso_placa,
                'diente_sensible' => $request->diente_sensible,
                'diente_cavidad' => $request->diente_cavidad,
                'caries' => $request->caries,
                'diente_desgaste' => $request->diente_desgaste,
                'usa_hilo' => $request->usa_hilo,
                'hilo_facil' => $request->hilo_facil,
                'boca_seca' => $request->boca_seca,
                'sangra_encia' => $request->sangra_encia,
                'trato_encias' => $request->trato_encias,
                'problema_aliento' => $request->problema_aliento,
                'higiene' => $request->higiene,
                'info_adicional' => $request->info_adicional,
                'obser_enfermedades' => $request->obser_enfermedades,
                'obser_antecedentes' => $request->obser_antecedentes,
            ]);
            // Guardar enfermedades asociadas (si las hay)
            if ($request->has('enfermedades')) {
                //Log::info('Enfermedades recibidas:', $request->enfermedades);
                foreach ($request->enfermedades as $enfermedad_id) {
                    //Log::info('Insertando enfermedad', ['id' => $enfermedad_id]);

                    DB::table('paciente_enfermedad')->insert([
                        'paciente_id' => $request->paciente_id,
                        'historia_clinica_id' => $historia->id,  // vínculo con historia
                        'enfermedad_id' => $enfermedad_id,
                        'fecha_registro' => now(),
                        'activo' => 1,
                        'observaciones' => null,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ]);
                }
            } else {
                Log::warning('No se recibieron enfermedades.');
            }
            // 👉 Aquí insertas los hallazgos del odontograma
            if ($request->has('hallazgos_json')) {
                //Log::info('Hallazgos JSON:', ['raw' => $request->hallazgos_json]);
                $hallazgos = json_decode($request->hallazgos_json, true);

                if (json_last_error() !== JSON_ERROR_NONE) {
                    Log::error('Error al decodificar hallazgos_json:', ['error' => json_last_error_msg()]);
                } else {
                    Log::info('Hallazgos decodificados:', $hallazgos);
                }

                foreach ($hallazgos as $h) {

                    $detalle = [
                        'historia_clinica_id' => $historia->id,
                        'tipo' => $h['tipo'],
                        'sigla' => $h['sigla'] ?? '',
                        'nombre' => $h['nombre'] ?? '',
                        'descripcion' => $h['descripcion'] ?? null,
                        'observaciones' => $h['observaciones'] ?? null,
                        'color' => $h['color'] ?? '#000000',
                        'accion' => 'aplicado',
                        'created_at' => now(),
                        'updated_at' => now()
                    ];

                    if ($h['tipo'] === 'ortodoncia') {
                        $detalle['desde_diente'] = $h['desde'];
                        $detalle['hasta_diente'] = $h['hasta'];
                        $detalle['coordenada_x1'] = $h['coordenadas']['diente1']['x'];
                        $detalle['coordenada_y1'] = $h['coordenadas']['diente1']['y'];
                        $detalle['coordenada_x2'] = $h['coordenadas']['diente2']['x'];
                        $detalle['coordenada_y2'] = $h['coordenadas']['diente2']['y'];
                    } elseif ($h['tipo'] === 'edentulo') {
                        $detalle['desde_diente'] = $h['desde'];
                        $detalle['hasta_diente'] = $h['hasta'];
                        $detalle['coordenada_x1'] = $h['coordenadas']['diente1']['x'];
                        $detalle['coordenada_y1'] = $h['coordenadas']['diente1']['y'];
                        $detalle['coordenada_x2'] = $h['coordenadas']['diente2']['x'];
                        $detalle['coordenada_y2'] = $h['coordenadas']['diente2']['y'];
                    } elseif ($h['tipo'] === 'corona') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del recuadro
                        $detalle['coordenada_x1'] = $h['coordenadas']['diente']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['diente']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['diente']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['diente']['y2'] ?? 0;

                        // Coordenadas del texto (opcional, si las necesitas aparte)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;
                    } elseif ($h['tipo'] === 'dde') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'espigo') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas de la marca del espigo
                        $detalle['coordenada_x1'] = $h['coordenadas']['diente']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['diente']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['diente']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['diente']['y2'] ?? 0;

                        // También puedes guardar la posición del texto, si lo deseas
                        $detalle['texto_x'] = $h['coordenadas']['diente1']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['diente1']['y'] ?? 0;
                    } elseif ($h['tipo'] === 'ffp') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'fractura') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // No hay centro_texto ni diente anidados, se usan directamente las coordenadas
                        $detalle['texto_x'] = 0; // O puedes calcular un promedio si lo deseas
                        $detalle['texto_y'] = 0;

                        $detalle['coordenada_x1'] = $h['coordenadas']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['y2'] ?? 0;
                    // 🔵 Nueva sección: FUSIÓN
                    } elseif ($h['tipo'] === 'fusion') {
                        $detalle['desde_diente'] = $h['desde'];
                        $detalle['hasta_diente'] = $h['hasta'];

                        // Puedes guardar las coordenadas de cada uno si deseas
                        $detalle['texto_x'] = 0;
                        $detalle['texto_y'] = 0;

                        $detalle['coordenada_x1'] = $h['coordenadas']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['y2'] ?? 0;
                    }

                    // 🔵 Nueva sección: GEMINACIÓN
                    elseif ($h['tipo'] === 'geminacion') {
                        $diente = intval(str_replace('P', '', $h['diente']));
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = $diente;

                        $detalle['texto_x'] = $h['coordenadas']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    }
                    elseif ($h['tipo'] === 'giroversion') {
                        $diente = intval(str_replace('P', '', $h['diente']));
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = $diente;

                        $detalle['texto_x'] = 0;
                        $detalle['texto_y'] = 0;

                        // Coordenadas del arco (curva)
                        $detalle['coordenada_x1'] = $h['coordenadas']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['y2'] ?? 0;

                        // Puedes guardar también el sentido si lo vas a usar en el backend
                        $detalle['sentido'] = $h['sentido'] ?? 'horario';
                    } elseif ($h['tipo'] === 'impactacion') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'imp') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'caries') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;

                        // Nuevo: path del SVG para redibujar en la vista
                        $detalle['path_svg'] = $h['path_svg'] ?? null;

                        // Nuevo: zona_id para identificar la mancha concreta
                        $detalle['zona_id'] = $h['zonaId'] ?? null;
                    } elseif ($h['tipo'] === 'mac') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'mic') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'mp') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'ausente') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // Coordenadas del aspa (X azul)
                        $detalle['coordenada_x1'] = $h['coordenadas']['diente']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['diente']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['diente']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['diente']['y2'] ?? 0;
                    } elseif ($h['tipo'] === 'clavija') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'ectopica') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'erupcion') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'extruida') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'intruida') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'supernumeraria') {
                        $detalle['desde_diente'] = intval($h['desde']);
                        $detalle['hasta_diente'] = intval($h['hasta']);
                        $detalle['texto_x'] = $h['coordenadas']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['y'] ?? 0;
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'pulpotomia') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;

                        // Path SVG para redibujar
                        $detalle['path_svg'] = $h['path_svg'] ?? null;

                        // Zona específica si aplica
                        $detalle['zona_id'] = $h['zonaId'] ?? null;

                    } elseif ($h['tipo'] === 'pos_anormal') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'protesis_parcial') {
                        $detalle['desde_diente'] = intval($h['desde']);
                        $detalle['hasta_diente'] = intval($h['hasta']);

                        // Estos valores determinan el trazo del corchete horizontal
                        $detalle['coordenada_x1'] = $h['coordenadas']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['y2'] ?? 0;

                        // No se usa texto flotante (sigla), se puede dejar en 0
                        $detalle['texto_x'] = 0;
                        $detalle['texto_y'] = 0;
                    } elseif ($h['tipo'] === 'protesis_total') {
                        $detalle['desde_diente'] = $h['desde'];
                        $detalle['hasta_diente'] = $h['hasta'];
                        $detalle['coordenada_x1'] = $h['coordenadas']['diente1']['x'];
                        $detalle['coordenada_y1'] = $h['coordenadas']['diente1']['y'];
                        $detalle['coordenada_x2'] = $h['coordenadas']['diente2']['x'];
                        $detalle['coordenada_y2'] = $h['coordenadas']['diente2']['y'];
                    } elseif ($h['tipo'] === 'protesis_removible') {
                        $detalle['desde_diente'] = intval($h['desde']);
                        $detalle['hasta_diente'] = intval($h['hasta']);

                        // Estos valores determinan el trazo del corchete horizontal
                        $detalle['coordenada_x1'] = $h['coordenadas']['x1'] ?? 0;
                        $detalle['coordenada_y1'] = $h['coordenadas']['y1'] ?? 0;
                        $detalle['coordenada_x2'] = $h['coordenadas']['x2'] ?? 0;
                        $detalle['coordenada_y2'] = $h['coordenadas']['y2'] ?? 0;

                        // No se usa texto flotante (sigla), se puede dejar en 0
                        $detalle['texto_x'] = 0;
                        $detalle['texto_y'] = 0;
                    } elseif ($h['tipo'] === 'remanente') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        // Coordenadas del texto (sigla)
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // No se usan coordenadas del recuadro
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'restauracion_definitiva') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;

                        // Path SVG para redibujar
                        $detalle['path_svg'] = $h['path_svg'] ?? null;

                        // Zona específica si aplica
                        $detalle['zona_id'] = $h['zonaId'] ?? null;

                    } elseif ($h['tipo'] === 'restauracion_temporal') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;

                        // Path SVG para redibujar
                        $detalle['path_svg'] = $h['path_svg'] ?? null;

                        // Zona específica si aplica
                        $detalle['zona_id'] = $h['zonaId'] ?? null;

                    } elseif ($h['tipo'] === 'sellante') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;

                        // Path SVG para redibujar
                        $detalle['path_svg'] = $h['path_svg'] ?? null;

                        // Zona específica si aplica
                        $detalle['zona_id'] = $h['zonaId'] ?? null;

                    } elseif ($h['tipo'] === 'desgaste') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));

                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;

                        // Path SVG para redibujar
                        $detalle['path_svg'] = $h['path_svg'] ?? null;

                        // Zona específica si aplica
                        $detalle['zona_id'] = $h['zonaId'] ?? null;
                    } elseif ($h['tipo'] === 'conducto') {
                        $detalle['desde_diente'] = $detalle['hasta_diente'] = intval(str_replace('P', '', $h['diente']));
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;
                        $detalle['coordenada_x1'] = 0;
                        $detalle['coordenada_y1'] = 0;
                        $detalle['coordenada_x2'] = 0;
                        $detalle['coordenada_y2'] = 0;
                    } elseif ($h['tipo'] === 'transposicion') {
                        $detalle['desde_diente'] = intval(str_replace('P', '', $h['desde']));
                        $detalle['hasta_diente'] = intval(str_replace('P', '', $h['hasta']));

                        // Coordenadas del centro del texto
                        $detalle['texto_x'] = $h['coordenadas']['centro_texto']['x'] ?? 0;
                        $detalle['texto_y'] = $h['coordenadas']['centro_texto']['y'] ?? 0;

                        // Coordenadas de la flecha1 (flecha izquierda a derecha)
                        $detalle['coordenada_x1'] = $h['coordenadas']['flecha1']['x1'] ?? 0; // inicio de la flecha
                        $detalle['coordenada_y1'] = $h['coordenadas']['flecha1']['y'] ?? 0;

                        $detalle['coordenada_x2'] = $h['coordenadas']['flecha1']['x2'] ?? 0; // fin de la flecha
                        $detalle['coordenada_y2'] = $h['coordenadas']['flecha1']['y'] ?? 0;

                        // No se guarda flecha2. Se generará automáticamente en drawShow.
                    }

                    //Log::info('Insertando hallazgo odontograma', $detalle);
                    DB::table('odontogramas_detalle')->insert($detalle);
                }
            } else {
                Log::warning('No se recibió hallazgos_json.');
            }
            // Obtener el ID de la empresa del usuario autenticado
            $empresaId = auth()->user()->empresa_id;
            if ($request->filled(['id_medico', 'id_servicio', 'fecha_cita', 'hora_inicio', 'hora_fin'])) {
                $nuevaCita = Cita::create([
                    'id_medico'    => $request->id_medico,
                    'id_paciente'  => $request->paciente_id,
                    'id_servicio'  => $request->id_servicio,
                    'fecha_cita'        => Carbon::parse($request->fecha_cita)->format('Y-m-d'),
                    'hora_inicio'  => $request->hora_inicio,
                    'hora_fin'     => $request->hora_fin,
                    'estado'       => 1, // Programado
                    'empresa_id'   => $empresaId,
                    'user_id'      => auth()->id(),
                ]);
            // Guardar referencia en la historia
                $historia->motivo_consulta = $request->motivo_consulta;
                $historia->proxima_cita = $request->fecha_cita;
                $historia->id_cita = $nuevaCita->id;
                $historia->save();
            }

            DB::commit();

            return redirect()->route('historia_clinica_v2.index')->with('success', 'Historia clínica registrada correctamente.');

        } catch (\Exception $e) {
            DB::rollBack();
            Log::error('Error al guardar historia clínica:', [
                'message' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);
            return back()->with('error', 'Error al guardar: ' . $e->getMessage());
        }

    }
    public function buscarPaciente(Request $request)
    {
        $query = $request->query('query');

        $paciente = Paciente::where('numerodoc', $query)
            ->orWhere('historia', $query)
            ->orWhereRaw("CONCAT(nombres, ' ', ape_paterno, ' ', ape_materno) LIKE ?", ["%{$query}%"])
            ->first();

        if ($paciente) {
            return response()->json([
                'success' => true,
                'paciente' => $paciente
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Paciente no encontrado.'
            ]);
        }
    }
    public function json($paciente_id)
    {
        // Obtener todas las historias clínicas del paciente, ordenadas por fecha descendente
        $historias = HistoriaClinicaV2::where('paciente_id', $paciente_id)
            ->orderBy('fecha_registro', 'desc')
            ->orderBy('version', 'desc')
            ->get();

        if ($historias->isEmpty()) {
            return response()->json(['existe' => false]);
        }

        // Última historia activa (la más reciente)
        $historiaActiva = $historias->firstWhere('estado', 1);

        // Enfermedades activas asociadas a la última historia
        $enfermedades = DB::table('paciente_enfermedad')
            ->join('enfermedades', 'enfermedades.id', '=', 'paciente_enfermedad.enfermedad_id')
            ->where('paciente_enfermedad.paciente_id', $paciente_id)
            ->where('paciente_enfermedad.historia_clinica_id', $historiaActiva->id)
            ->where('paciente_enfermedad.activo', 1)
            ->select('enfermedades.nombre')
            ->get();

        // Hallazgos odontológicos asociados a la historia clínica activa
        $hallazgos = DB::table('odontogramas_detalle')
            ->where('historia_clinica_id', $historiaActiva->id)
            ->select(
                'historia_clinica_id',
                'tipo',
                'sigla',
                'nombre',
                'descripcion',
                'observaciones',
                'color',
                'accion',
                'sentido',
                'desde_diente',
                'hasta_diente',
                'coordenada_x1',
                'coordenada_y1',
                'coordenada_x2',
                'coordenada_y2',
                'texto_x',
                'texto_y',
                'path_svg',
                'zona_id'
            )
            ->get();

        // Citas del paciente hasta la fecha de la historia activa
        $citas = DB::table('citas as c')
            ->join('medicos as m', 'c.id_medico', '=', 'm.id')
            ->join('servicios as s', 'c.id_servicio', '=', 's.id')
            ->where('c.id_paciente', $paciente_id)
            ->whereDate('c.fecha_cita', '<=', $historiaActiva->fecha_registro)
            ->select(
                'c.fecha_cita',
                'c.hora_inicio',
                'c.hora_fin',
                'm.nombre_medico as nombre_medico',
                's.nombre as nombre'
            )
            ->orderByDesc('c.fecha_cita')
            ->get();
        // Evolución: historia + cita asociada
        $evolucion = HistoriaClinicaV2::where('paciente_id', $paciente_id)
            ->whereNotNull('id_cita')
            ->orderByDesc('fecha_registro')
            ->get()
            ->map(function ($historia) {
                $cita = DB::table('citas')
                    ->where('id', $historia->id_cita)
                    ->first();

               return [ 
                    'fecha_historia' => $historia->fecha_registro,
                    'tratamiento'    => $historia->motivo_consulta,
                    'fecha_cita'     => $cita?->fecha_cita,
                    'hora_inicio'    => $cita?->hora_inicio,
                ];

            });

        return response()->json([
            'existe' => true,
            'clinica' => $historiaActiva,
            'versiones' => $historias,
            'enfermedades' => $enfermedades,
            'hallazgos' => $hallazgos,
            'citas' => $citas, // ✅ nuevo
            'evolucion' => $evolucion
        ]);
    }

    public function enfermedadesPorHistoria($historia_id)
    {
        $enfermedades = DB::table('paciente_enfermedad')
            ->join('enfermedades', 'enfermedades.id', '=', 'paciente_enfermedad.enfermedad_id')
            ->where('paciente_enfermedad.historia_clinica_id', $historia_id)
            ->where('paciente_enfermedad.activo', 1)
            ->select('enfermedades.nombre')
            ->get();

        $historia = HistoriaClinicaV2::find($historia_id); // ✅ definir la variable

        return response()->json([
            'enfermedades' => $enfermedades,
            'obser_enfermedades' => $historia?->obser_enfermedades, // safe access
        ]);
    }

    public function odontogramaPorHistoria($historia_id)
    {
         // Hallazgos odontológicos asociados a la historia clínica activa
        $hallazgos = DB::table('odontogramas_detalle')
            ->where('historia_clinica_id', $historia_id)
            ->select(
                'historia_clinica_id',
                'tipo',
                'sigla',
                'nombre',
                'descripcion',
                'observaciones',
                'color',
                'accion',
                'sentido',
                'desde_diente',
                'hasta_diente',
                'coordenada_x1',
                'coordenada_y1',
                'coordenada_x2',
                'coordenada_y2',
                'texto_x',
                'texto_y',
                'path_svg',
                'zona_id'
            )
            ->get();
    
        return response()->json($hallazgos);
    }

    public function citasPorVersion($historia_id)
    {
        $version = HistoriaClinicaV2::findOrFail($historia_id);
        $fecha = $version->fecha_registro;

        $citas = DB::table('citas as c')
            ->join('medicos as m', 'c.id_medico', '=', 'm.id')
            ->join('servicios as s', 'c.id_servicio', '=', 's.id')
            ->where('c.id_paciente', $version->paciente_id)
            ->whereDate('c.fecha_cita', '<=', $fecha)
            ->select(
                'c.fecha_cita',
                'c.hora_inicio',
                'c.hora_fin',
                'm.nombre_medico',
                's.nombre'
            )
            ->orderByDesc('c.fecha_cita')
            ->get();

        return response()->json($citas);
    }

    public function evolucionPorVersion($historia_id)
    {
        $historia = HistoriaClinicaV2::findOrFail($historia_id);

        // Si no hay cita asociada, no hay evolución que mostrar
        if (!$historia->id_cita) {
            return response()->json([]); // ⛔ Array vacío = no mostrar ficha
        }

        $cita = Cita::find($historia->id_cita);

        return response()->json([[
            'fecha_historia' => $historia->fecha_registro,
            'tratamiento' => $historia->motivo_consulta,
            'fecha_cita' => $cita->fecha_cita,
            'hora_inicio' => $cita->hora_inicio,
        ]]);
    }

    public function generarPDF(Request $request)
    {
        try {
            $paciente_id = $request->paciente_id;
            $version_id = $request->version_id;
            $imagen = $request->imagen_odontograma;
            $camposGenerales = [
                'tratamiento_medico' => 'Tratamiento médico',
                'medicamentos_actuales' => 'Medicamentos actuales',
                'problema_cicatrizacion' => 'Problema de cicatrización',
                'transfusion' => 'Transfusión de Sangre',
                'radio_quimio' => 'Radio/Quimioterapia',
                'reaccion_medicamento' => 'Reacción a medicamentos',
                'alergia' => 'Tiene Alergias',
                'problema_articulaciones' => 'Articulaciones adoloridas',
                'fumador' => 'Fumador',
                'toma_alchohol' => 'Toma habitualmente Alcohol?',
                'embarazada' => 'Está Embarazada?',
                'ansiedad' => 'Tiene Ansiedad?',
                'problema_sueno' => 'Tiene problemas de Sueño?',
                'ultimo_tratamiento' => 'Último tratamiento odontológico',
                'complicacion_tratamiento' => 'Tuvo Complicación en algún tratamiento?',
                'info_adicional' => 'Info adicional',
                'motivo_consulta' => 'Motivo de la consulta',
            ];

            $camposDentales = [
                'sonrisa' => 'Está insatisfecho con su Sonrisa?',
                'restauraciones' => 'Tiene Restauraciones que no le agraden?',
                'dientes_blancos' => 'Quisiera tener los Dientes más blancos?',
                'dolor_masticar' => 'Tiene Dolor al masticar?',
                'dolor_musculo' => 'Tiene Dolor en los músculos de la cara?',
                'mordida_inestable' => 'Siente su Mordida inestable?',
                'molestia_masticar' => 'Siente Molestia al masticar?',
                'aprieta_dientes' => 'Tiene hábito de Apretar los dientes?',
                'uso_placa' => 'Ha usado placa de relajamiento?',
                'diente_sensible' => 'Tiene Dientes sensibles?',
                'diente_cavidad' => 'Siente alguna cavidad en los dientes?',
                'caries' => 'Tuvo Caries en los últimos 3 años?',
                'diente_desgaste' => 'Notó Desgaste dental recientemente?',
                'usa_hilo' => 'Usa el hilo dental?',
                'hilo_facil' => 'El Hilo pasa fácilmente en todos sus dientes?',
                'boca_seca' => 'Siente la Boca seca?',
                'sangra_encia' => 'Sangrado encías con facilidad?',
                'trato_encias' => 'Ya tuvo Tratamiento de encías?',
                'problema_aliento' => 'Tiene problema de Mal aliento?',
                'higiene' => 'Recibió instrucciones de Higienización?',
            ];


            $historia = HistoriaClinicaV2::with('paciente')
                ->where('paciente_id', $paciente_id)
                ->where('id', $version_id)
                ->firstOrFail();

            //Log::info('✅ Historia clínica encontrada', ['historia_id' => $historia->id]);

            // Enfermedades
            $enfermedades = DB::table('paciente_enfermedad')
                ->join('enfermedades', 'enfermedades.id', '=', 'paciente_enfermedad.enfermedad_id')
                ->where('paciente_enfermedad.paciente_id', $paciente_id)
                ->where('paciente_enfermedad.historia_clinica_id', $version_id)
                ->where('paciente_enfermedad.activo', 1)
                ->select('enfermedades.nombre')
                ->get();

            //Log::info('🩺 Enfermedades encontradas', ['total' => $enfermedades->count()]);

            // Citas
            $citas = DB::table('citas')
                ->join('servicios', 'citas.id_servicio', '=', 'servicios.id')
                ->join('medicos', 'citas.id_medico', '=', 'medicos.id')
                ->where('citas.id_paciente', $paciente_id)
                ->whereDate('citas.fecha_cita', '<=', $historia->fecha_registro)
                ->select(
                    'citas.fecha_cita',
                    'citas.hora_inicio',
                    'citas.hora_fin',
                    'servicios.nombre',
                    'medicos.nombre_medico as nombre_medico'
                )
                ->get();

            // Evolución: historia + cita asociada
            $evolucion = HistoriaClinicaV2::where('paciente_id', $paciente_id)
                ->whereNotNull('id_cita')
                ->orderByDesc('fecha_registro')
                ->get()
                ->map(function ($historia) {
                    $cita = DB::table('citas')
                        ->where('id', $historia->id_cita)
                        ->first();

                    return [
                        'fecha_historia' => $historia->fecha_registro,
                        'tratamiento'    => $historia->motivo_consulta,
                        'fecha_cita'     => $cita?->fecha_cita,
                        'hora_inicio'    => $cita?->hora_inicio,
                    ];
                });

            //Log::info('📅 Citas encontradas', ['total' => $citas->count()]);
            $logoPath = public_path('img/logo.png');
            $type = pathinfo($logoPath, PATHINFO_EXTENSION);
            $logoData = file_get_contents($logoPath);
            $base64Logo = 'data:image/' . $type . ';base64,' . base64_encode($logoData);
            // PDF
            $pdf = PDF::loadView('historia_clinica.pdf', [
                'historia' => $historia,
                'enfermedades' => $enfermedades,
                'citas' => $citas,
                'odontogramaImg' => $imagen,
                'camposGenerales' => $camposGenerales,
                'camposDentales' => $camposDentales,
                'base64Logo' => $base64Logo, // 👈 aquí lo envías
                'evolucion' => $evolucion // ✅ agregar aquí

            ]);



            //Log::info('🖨️ PDF generado correctamente. Enviando...');

            return $pdf->stream('historia_clinica.pdf');

        } catch (\Throwable $e) {
            Log::error('❌ Error al generar PDF', [
                'mensaje' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json(['error' => 'Error al generar el PDF.'], 500);
        }
    }

}
