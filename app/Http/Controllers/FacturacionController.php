<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Facturacion;
use App\Models\Facturador;
use App\Models\DetalleFacturacion;
use App\Models\Presupuesto;
use App\Models\DetallePresupuesto;
use App\Models\Paciente;
use App\Models\Medico;
use App\Models\Actividad;
use App\Models\ActividadesPaciente;
use App\Models\Servicio;
use App\Models\Cliente;
use App\Models\NotaCredito;
use Illuminate\Support\Facades\Log;
use Barryvdh\DomPDF\Facade\Pdf;
use Dompdf\Dompdf;
use Dompdf\Options;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use BaconQrCode\Renderer\RendererStyle\RendererStyle;
use BaconQrCode\Renderer\ImageRenderer;
use BaconQrCode\Writer;
use BaconQrCode\Renderer\Image\SvgImageBackEnd;
use Illuminate\Support\Facades\Mail;
use App\Mail\FacturaMail;
use App\Helpers\NumeroALetras;
use Illuminate\Support\Facades\DB;

class FacturacionController extends Controller
{
    public function index()
    {
        if (!auth()->user()->hasPermissionTo('Facturar')) {
            abort(403, 'No tienes permiso para acceder a esta página.');
        }
        $facturaciones = Facturacion::all();
        return view('facturacion.create', compact('facturacion'));
    }

    public function create()
    {
        if (!auth()->user()->hasPermissionTo('Facturar')) {
            abort(403, 'No tienes permiso para acceder a esta página.');
        }
        
        $presupuestos = Presupuesto::all();
        $pacientes = Paciente::all();
        $medicos = Medico::all();
        $nombrePaciente = ''; // Este valor debe ser obtenido según tu lógica
        $pacienteId = ''; // Este valor debe ser obtenido según tu lógica
        $empresaId = auth()->user()->empresa_id;

        // Consulta los facturadores asociados a la empresa del usuario
        $facturadores = Facturador::where('empresa_id', $empresaId)->get();

        return view('facturacion.create', compact('presupuestos', 'pacientes', 'medicos', 'nombrePaciente', 'pacienteId', 'empresaId', 'facturadores'));
    }

    public function store(Request $request)
    {
        try {
            if (!is_array($request->input('procedimiento_id'))) {
                \Log::error('Error: procedimiento_id no es un array', ['procedimiento_id' => $request->input('procedimiento_id')]);
            }

            // Validación sin 'numdoc'
            $validatedData = $request->validate([
                'presupuesto_id' => 'nullable',
                'fecha_presupuesto' => 'required|date',
                'paciente_id' => 'required',
                'medico_tratante_id' => 'required',
                'medico_factura_id' => 'required',
                'tipodoc' => 'required',
                'serie' => 'required',
                'igv' => 'required|numeric',
                'subtotal' => 'required|numeric',
                'total' => 'required|numeric',
                'num_doc' => 'required',
                'tipo_doc' => 'required',
                'observaciones' => 'nullable|string',
                'tratamiento_id' => 'required',
                'procedimiento_id' => 'required|array',
                'procedimiento_id.*' => 'integer|exists:servicios,id',
                'medio_pago' => 'required',
                'mostrarNombrePaciente' => 'required',
                'facturador_id' => 'required|integer|exists:facturadores,id',
            ]);

            return DB::transaction(function () use ($validatedData, $request) {
                $fecha_presupuesto = Carbon::parse($validatedData['fecha_presupuesto'])->setTimezone('America/Lima');
                $validatedData['presupuesto_id'] = $validatedData['presupuesto_id'] ?? 0;

                // 🔐 Obtener correlativos ocupados con bloqueo para evitar duplicados
                $correlativosOcupados = Facturacion::where('serie', $validatedData['serie'])
                    ->where('facturador_id', $validatedData['facturador_id'])
                    ->lockForUpdate()
                    ->pluck('numdoc')
                    ->map(function ($numdoc) {
                        return (int) ltrim($numdoc, '0');
                    })
                    ->sort()
                    ->values()
                    ->toArray();

                // Buscar el menor número faltante
                $siguienteCorrelativoNum = 1;

                foreach ($correlativosOcupados as $num) {
                    if ($num == $siguienteCorrelativoNum) {
                        $siguienteCorrelativoNum++;
                    } elseif ($num > $siguienteCorrelativoNum) {
                        // Se detecta un hueco
                        break;
                    }
                }

                $siguienteCorrelativo = str_pad($siguienteCorrelativoNum, 8, '0', STR_PAD_LEFT);

                // ✅ Crear la factura
                $facturacion = Facturacion::create([
                    'presupuesto_id' => $validatedData['presupuesto_id'],
                    'fecha' => $fecha_presupuesto,
                    'paciente_id' => $validatedData['paciente_id'],
                    'medico_tratante_id' => $validatedData['medico_tratante_id'],
                    'medico_factura_id' => $validatedData['medico_factura_id'],
                    'tipodoc' => $validatedData['tipodoc'],
                    'serie' => $validatedData['serie'],
                    'numdoc' => $siguienteCorrelativo,
                    'subtotal' => $validatedData['subtotal'],
                    'igv' => $validatedData['igv'],
                    'importe' => $validatedData['total'],
                    'user_id' => auth()->id(),
                    'empresa_id' => auth()->user()->empresa_id ?? 1,
                    't_doc_iden' => $validatedData['tipo_doc'],
                    'num_doc_iden' => $validatedData['num_doc'],
                    'observaciones' => $validatedData['observaciones'] ?? null,
                    'medio_pago' => $validatedData['medio_pago'],
                    'mostrar_paciente' => $validatedData['mostrarNombrePaciente'],
                    'facturador_id' => $validatedData['facturador_id'],
                ]);

                // 🧾 Detalles
                $procedimientos = $validatedData['procedimiento_id'];
                $total_importe = $validatedData['total'];
                $num_procedimientos = count($procedimientos);
                $importe_dividido = floor($total_importe / $num_procedimientos);
                $restante = $total_importe - ($importe_dividido * $num_procedimientos);

                foreach ($procedimientos as $index => $procId) {
                    $importe_final = ($index == 0) ? $importe_dividido + $restante : $importe_dividido;

                    DetalleFacturacion::create([
                        'facturaciones_id' => $facturacion->id,
                        'tratamiento_id' => $validatedData['tratamiento_id'],
                        'procedimiento_id' => $procId,
                        'importe' => $importe_final,
                    ]);
                }

                return response()->json([
                    'success' => true,
                    'message' => 'Comprobante y detalles creados con éxito.',
                    'factura_id' => $facturacion->id,
                ]);
            });

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'success' => false,
                'message' => 'Error de validación.',
                'errors' => $e->errors(),
            ], 422);
        } catch (\Exception $e) {
            \Log::error('Error al registrar factura: ' . $e->getMessage());
            return response()->json([
                'success' => false,
                'message' => 'Error al crear el comprobante.',
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function show($id)
    {
        $facturacion = Facturacion::findOrFail($id);
        return view('facturacion.show', compact('facturacion'));
    }

    public function edit($id)
    {
        $facturacion = Facturacion::findOrFail($id);
        return view('facturacion.edit', compact('facturacion'));
    }

    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'presupuesto_id' => 'required',
            'fecha' => 'required|date',
            'paciente_id' => 'required',
            'medico_tratante_id' => 'required',
            'medico_factura_id' => 'required',
            'tipodoc' => 'required',
            'serie' => 'required',
            'numdoc' => 'required',
            'subtotal' => 'required|numeric',
            'igv' => 'required|numeric',
            'importe' => 'required|numeric',
            'hash_cpe' => 'required',
            'estado_sunat' => 'required',
        ]);

        $facturacion = Facturacion::findOrFail($id);
        $facturacion->update($validatedData);

        return redirect()->route('facturacion.index');
    }

    public function destroy($id)
    {
        $facturacion = Facturacion::findOrFail($id);
        $facturacion->delete();

        return redirect()->route('facturacion.index');
    }

    public function obtener(Request $request)
    {
        
        $pacienteId = $request->input('paciente_id');
        $estados = $request->input('estados', [1, 2, 3]);

        // Verificar los datos recibidos
        \Log::info('paciente_id: ' . $pacienteId);
        \Log::info('estados: ' . implode(',', $estados));

        // Obtener los presupuestos del paciente con los estados especificados
        $presupuestos = Presupuesto::where('paciente_id', $pacienteId)
                                   ->whereIn('estado', $estados)
                                   ->get();

        // Verificar los resultados de la consulta
        \Log::info('Presupuestos encontrados: ' . $presupuestos->count());

        // Retornar los presupuestos como respuesta JSON, incluso si no se encuentran resultados
        return response()->json($presupuestos);
    }

    public function obtenerTratamientos($id)
    {
        // Obtener los detalles del presupuesto
        $detalles = DetallePresupuesto::where('presupuesto_id', $id)->get();

        // Obtener los tratamientos asociados
        $tratamientos = [];
        foreach ($detalles as $detalle) {
            $actividad = Actividad::find($detalle->tratamiento_id);
            if ($actividad) {
                $tratamientos[] = [
                    'detalle_presupuesto_id' => $detalle->id,
                    'id' => $actividad->id,
                    'nombre' => $actividad->nombre
                ];
            }
        }

        // Retornar los tratamientos como respuesta JSON
        return response()->json($tratamientos);
    }


    public function obtenerProcedimientos($detallePresupuestoId)
    {
        // Obtener las actividades del paciente asociadas al detalle del presupuesto
        $actividadesPaciente = ActividadesPaciente::where('detalle_presupuesto_id', $detallePresupuestoId)->get();

        // Obtener los procedimientos (servicios) asociados
        $procedimientos = [];
        foreach ($actividadesPaciente as $actividadPaciente) {
            $servicio = Servicio::find($actividadPaciente->servicio_id);
            if ($servicio) {
                $procedimientos[] = [
                    'id' => $servicio->id,
                    'nombre' => $servicio->nombre
                ];
            }
        }

        // Retornar los procedimientos como respuesta JSON
        return response()->json($procedimientos);
    }
    public function obtenerTotalSumado($presupuestoId)
    {
        // Sumar los totales de las facturaciones existentes con el mismo presupuesto_id
        $totalSumado = Facturacion::where('presupuesto_id', $presupuestoId)->sum('importe');
        
        // Obtener el importe del presupuesto
        $presupuesto = Presupuesto::find($presupuestoId);
        $importePresupuesto = $presupuesto ? $presupuesto->importe : 0;
    
        return response()->json([
            'total_sumado' => $totalSumado,
            'importe_presupuesto' => $importePresupuesto
        ]);
    }

    public function obtenerUltimoNumdoc($serie, Request $request)
    {
        $facturadorId = $request->input('facturador_id');

        // Obtener todos los numdoc de la serie y facturador_id como enteros (sin ceros a la izquierda)
        $numdocs = Facturacion::where('serie', $serie)
            ->where('facturador_id', $facturadorId)
            ->pluck('numdoc')
            ->map(function ($numdoc) {
                return (int) ltrim($numdoc, '0');
            })
            ->sort()
            ->values()
            ->toArray();

        // Buscar el menor número faltante en la secuencia
        $siguiente = 1; // Inicia desde 1

        foreach ($numdocs as $n) {
            if ($n == $siguiente) {
                $siguiente++;
            } elseif ($n > $siguiente) {
                // Encontramos un hueco
                break;
            }
        }

        $siguienteNumdoc = str_pad($siguiente, 8, '0', STR_PAD_LEFT);

        return response()->json(['ultimo_numdoc' => $siguienteNumdoc]);
    }


    public function buscarClienteRuc(Request $request)
    {
        // Validar que se proporciona el DNI
        $request->validate([
            'ruc' => 'required|string|max:11', // Ajusta el tamaño según tus necesidades
        ]);

        // Buscar el cliente por DNI
        $cliente = Cliente::where('ruc', $request->ruc)->first();

        // Log para depuración
        Log::info('Buscando cliente con RUC: ' . $request->ruc); // Ejemplo de uso de Log

        if ($cliente) {
            // Si se encuentra el cliente, retornar su información
            return response()->json([
                'existe' => true,
                'id' => $cliente->id,
                'razonsocial' => $cliente->rsocial,
                'direccion' => $cliente->direccion,
                
            ]);
        } else {
            // Si no se encuentra, retornar una respuesta adecuada
            return response()->json(['existe' => false], 200);
        }
    }

    public function guardarClienteRuc(Request $request)
    {
        // Validar que se proporcionan los datos necesarios
        $request->validate([
            'ruc' => 'required|string|max:11',
            'razonsocial' => 'required|string',
            'direccion' => 'required|string',
        ]);

        try {
            // Lógica para guardar el cliente
            $cliente = new Cliente();
            $cliente->ruc = $request->ruc;
            $cliente->rsocial = $request->razonsocial;
            $cliente->direccion = $request->direccion;
            $cliente->empresa_id = auth()->user()->empresa_id ?? 1;  // Asignar empresa_id desde el usuario autenticado
            
            // Guardar el user_id del usuario autenticado
            $cliente->user_id = auth()->user()->id; // Asegúrate de que el usuario esté autenticado

            $cliente->save();

            return response()->json(['success' => true, 'cliente' => $cliente]);
        } catch (\Exception $e) {
            // Logear el error
            \Log::error('Error al guardar el cliente: ' . $e->getMessage());

            return response()->json(['success' => false, 'message' => 'Error al guardar el cliente'], 500);
        }
    }


    public function generarPDFFactura(Request $request, $id)
    {
        try {

        $numeroWhatsApp = $request->input('numeroWhatsApp');
        $email = $request->input('email');
        $facturadorId = $request->input('facturadorId');
        //Log::info("Iniciando la generación del PDF para la factura con ID: $id");
        //Log::info("Email y Numero WhatsApp recibidos:", ['email' => $email, 'numeroWhatsApp' => $numeroWhatsApp]);
        // Cargar la factura con sus relaciones
        $factura = Facturacion::with(['paciente', 'detalles.tratamiento', 'detalles.procedimiento'])->find($id);

        if (!$factura) {
            //Log::error("Factura no encontrada con el ID: $id");
            return response()->json(['error' => 'Factura no encontrada'], 404);
        }

        //Log::info("Factura encontrada: ", ['factura' => $factura]);

        // Array para almacenar los detalles de la factura
        $detallesFactura = [];

        foreach ($factura->detalles as $detalle) {
            $descripcion = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
            $detallesFactura[] = [
                'cantidad' => 1,
                'descripcion' => $descripcion,
                'importe' => $detalle->importe,
            ];
        }

        //Log::info("Detalles de la factura procesados: ", ['detallesFactura' => $detallesFactura]);
            
            if ($factura->t_doc_iden === "6") { // Si es RUC, buscar en la tabla de clientes
                if (!empty($factura->num_doc_iden) && strlen($factura->num_doc_iden) === 11) {
                    $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
            
                    if ($cliente) {
                        $numeroDocumento = $factura->num_doc_iden;
                        $nombre = strtoupper($cliente->rsocial);
                        $direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'Cliente no encontrado'], 404);
                    }
                } else {
                    return response()->json(['error' => 'El RUC es obligatorio para facturas y debe tener 11 dígitos.'], 400);
                }
            } elseif (in_array($factura->t_doc_iden, ["1", "4"])) { // Si es DNI o CEX, buscar en pacientes primero
                $paciente = Paciente::where('tipodocumento', $factura->t_doc_iden)
                                    ->where('numerodoc', $factura->num_doc_iden)
                                    ->first();
            
                if ($paciente) {
                    $tipoDocIdent = $factura->t_doc_iden;
                    $numeroDocumento = $factura->num_doc_iden;
                    $nombre = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                    $direccion = strtoupper($paciente->direccion);
                } else {
                    // Si no se encuentra en pacientes, buscar en clientes por el mismo número de documento
                    $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
            
                    if ($cliente) {
                        $tipoDocIdent = $factura->t_doc_iden;
                        $numeroDocumento = $cliente->ruc;
                        $nombre = strtoupper($cliente->rsocial);
                        $direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'No se encontró registro en pacientes ni clientes'], 404);
                    }
                }
            } else {
                return response()->json(['error' => 'Tipo de documento no válido.'], 400);
            }
            $fechaEmision = Carbon::parse($factura->fecha)->format('d/m/Y');
            $usuario = Auth::user()->name;
            $correlativo = "$factura->serie-$factura->numdoc";

            $subtotal = number_format($factura->subtotal, 2, '.', ',');
            $igv = number_format($factura->igv, 2, '.', ',');
            $total = number_format($factura->importe, 2, '.', ',');
            $montoLimpio = number_format(floatval($factura->importe), 2, '.', '');
            //$montoLiteral = $this->convertirNumerosALetras($montoLimpio);
            $montoLiteral = NumeroALetras::convertirMoneda($montoLimpio);
            
            $tipodoc = null;
            if (strlen($numeroDocumento) == 11) {
                $tipodoc = 6; // RUC
            } else {
                $tipodoc = $tipoDocIdent;
            }
            if ($tipodoc == '1') {
                $labelTD = 'DNI';
            } else if ($tipodoc == '4') {
                $labelTD = 'CEX';
            } else if ($tipodoc == '6') {
                $labelTD = 'RUC';
            } else if ($tipodoc == '7') {
                $labelTD = 'PAS';
            }
            $tipoDocumento = ($factura->tipodoc == '01') ? 'Factura Electrónica' : 'Boleta de Venta Electrónica';
            $hash_code = $factura->hash_cpe;
            
            $mostrar_paciente = null; // Valor predeterminado
            $obser = $factura->observaciones;
            if ($factura->mostrar_paciente == 1) {
                // Asignar nombre completo del paciente con "Paciente:" incluido
                $mostrar_paciente = strtoupper($factura->paciente->ape_paterno . ' ' . $factura->paciente->ape_materno . ' ' . $factura->paciente->nombres);
            } else {
                $mostrar_paciente = null;
            }
            
            // Hacemos la consulta a la tabla facturadores para obtener el registro con el id proporcionado
            $facturador = Facturador::find($facturadorId);
            if (!$facturador) {
                //\Log::error('Facturador no encontrado para el ID: ' . $facturadorId);
                return response()->json([
                    'success' => false,
                    'message' => 'Facturador no encontrado.'
                ]);
            }
            //\Log::info('Facturador encontrado: ' . $facturador->razon_social);
            // Datos del emisor
            $emisor = [
                'ruc' => $facturador->ruc,
                'razon_social' => $facturador->razon_social,
                'direccion' => $facturador->direccion,
                'nombre_comercial' => $facturador->nombre_comercial,
                'ubigeo_dpto' => $facturador->ubigeo_dpto,
                'ubigeo_provincia' => $facturador->ubigeo_provincia,
                'ubigeo_distrito' => $facturador->ubigeo_distrito,
            ];
            $ruc = $emisor['ruc'];
            $QR = "$ruc|$factura->tipodoc|$correlativo|$igv|$total|$fechaEmision|$tipodoc|$numeroDocumento|$hash_code";
            
            // Usar el nuevo renderer
            $renderer = new ImageRenderer(
                new RendererStyle(80),
                new SvgImageBackEnd()
            );
            $writer = new Writer($renderer);
            $qrCodeData = $writer->writeString($QR);
            $qrCodeBase64 = base64_encode($qrCodeData);

            $logoPath = public_path('img/logo.png');
            $type = pathinfo($logoPath, PATHINFO_EXTENSION);
            $logoData = file_get_contents($logoPath);
            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($logoData);

    
            $html = "
            <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; font-size: 10px; padding: 20px; }
                    .titulo { text-align: center; font-size: 12px; font-weight: bold; }
                    .detalles { border-collapse: collapse; width: 100%; }
                    .detalles th {
                        border: 1px solid black;
                        padding: 5px;
                        text-align: left;
                        background-color: lightblue; /* Relleno color azul claro */
                    }
                    .detalles td { border: 1px solid black; padding: 5px; text-align: left; }
                    .totales { text-align: right; font-weight: bold; }
                </style>
            </head>
            <body>
                
                <style>
                    .logo-cell {
                        width: 70px; /* Ajusta el ancho según tus necesidades */
                        text-align: center;
                        vertical-align: middle;
                    }
                    .info-cell {
                        font-size: 12px;
                        width: 360px;
                    }
                    .ruc-cell {
                        width: 240px;
                        font-size: 16px;
                        text-align: center !important;
                        vertical-align: top;
                    }
                </style>

                <table border='0'>
                    <tr>
                        <td class='logo-cell'>
                            <img src='" . $base64 . "' alt='Logo' style='max-width: 100px; height: auto; transform: scale(1.5);'>
                        </td>
                        <td class='info-cell'>
                            <b>" . $emisor['nombre_comercial'] . " <br>
                                " . $emisor['razon_social'] . "</b> <br>
                                " . $emisor['direccion'] . "
                                <br>
                            " . $emisor['ubigeo_dpto'] . " - " . $emisor['ubigeo_provincia'] . " - " . $emisor['ubigeo_distrito'] . "<br>
                            Tel. 969 826 870 | Email: consultoriosdelnorte@gmail.com
                        </td>
                        <td class='ruc-cell'>
                            <table border='1'>
                                <tr>
                                    <td style='text-align: center;'>
                                        <b>R.U.C. N° " . $emisor['ruc'] . "<br>$tipoDocumento<br>$correlativo</b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <hr>
                <style>
                    .tabla-detalles {
                        font-size: 12px; /* Ajusta este valor según el tamaño de letra deseado */
                    }
                    .fixed-width {
                        width: 350px; /* Ancho fijo para las celdas con esta clase */
                    }
                </style>

                <table class='tabla-detalles'>
                    <tr>
                        <td><b>Fecha:</b></td>
                        <td class='fixed-width'>$fechaEmision</td>
                        <td><b>Forma de Pago:</b></td>
                        <td>Contado</td>
                    </tr>
                    <tr>
                        <td><b>Señor(es):</b></td>
                        <td class='fixed-width'>$nombre</td>
                    </tr>
                    <tr>
                        <td><b>$labelTD:</b></td>
                        <td class='fixed-width'>$numeroDocumento</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td><b>Dirección:</b></td>
                        <td class='fixed-width'>$direccion</td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

                <hr>
                <table class='detalles'>
                    <tr>
                        <th>Cant.</th>
                        <th>Descripción</th>
                        <th style='text-align:right;'>Importe</th>
                    </tr>";
            
                    foreach ($factura->detalles as $detalle) {
                        $descripcion = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
                        $importeFormateado = number_format($detalle->importe, 2, '.', ',');
                        $html .= "<tr>
                                    <td>1</td>
                                    <td>{$descripcion}</td>
                                    <td style='text-align:right;'>S/. {$importeFormateado}</td>
                                  </tr>";
                    }
                    
                                
                    $html .= "
                    </table>
                    <style>
                        .totales {
                            border: 1px solid black;
                            padding: 4px;
                            font-weight: bold;
                            font-size: 12px;
                        }
                        .valor {
                            text-align: right;
                            border: 1px solid black;
                            padding: 4px;
                            font-weight: bold;
                            font-size: 14px;
                        }
                        .tabla-totales {
                            width: 30%;
                            margin-left: auto;
                            margin-right: 0;
                        }
                        .monto-literal {
                            text-align: left;
                            font-weight: bold;
                            font-size: 12px;
                            vertical-align: top;
                        }
                        .tabla-monto-literal {
                            width: 70%;
                            vertical-align: top;
                        }
                        .qr {
                            text-align: left;
                        }
                        .paciente-info {
                            color: #4682B4;
                            font-weight: bold;
                            font-size: 14px;
                            width: 16%;
                            text-align: left;
                            padding: 2px 0;
                        }
                        .paciente-valor {
                            font-size: 14px;
                            font-weight: bold;
                            width: 80%;
                            text-align: left;
                            padding: 2px 0;
                        }
                        .espaciado-corto {
                            margin-bottom: 4px;
                        }
                    </style>";
                
                    if (!empty($mostrar_paciente) || !empty($obser)) {
                        $html .= "<table width='100%' class='espaciado-corto'>";
                        
                        if (!empty($mostrar_paciente)) {
                            $html .= "<tr>
                                        <td class='paciente-info'>Paciente:</td>
                                        <td class='paciente-valor'>$mostrar_paciente</td>
                                      </tr>";
                        }
                    
                        if (!empty($obser)) {
                            $html .= "<tr>
                                        <td class='paciente-info'>Observaciones:</td>
                                        <td class='paciente-valor'>$obser</td>
                                      </tr>";
                        }
                    
                        $html .= "</table>";
                    }
                    $html .= "
                    <table width='100%'>
                        <tr>  
                            <td class='tabla-monto-literal' rowspan='3'>
                                <div class='monto-literal'>
                                    $montoLiteral<br>
                                    <img src='data:image/svg+xml;base64,$qrCodeBase64' alt='QR Code'><br>
                                    <b>$factura->hash_cpe</b>
                                </div>
                            </td>
                            <td class='totales'>Subtotal:</td>
                            <td class='valor'>S/. " . number_format($factura->subtotal, 2, '.', ',') . "</td>
                        </tr>
                        <tr>
                            <td class='totales'>IGV (18%):</td>
                            <td class='valor'>S/. " . number_format($factura->igv, 2, '.', ',') . "</td>
                        </tr>
                        <tr>
                            <td class='totales'>Total:</td>
                            <td class='valor'>S/. " . number_format($factura->importe, 2, '.', ',') . "</td>
                        </tr>
                    </table>

                    <hr>
                    <div style='text-align:center;'>
                        <p style='font-size: 14px;'>Representación impresa de la $tipoDocumento</p>
                    </div>
                    </body>
                    </html>";
                

            // Configurar Dompdf
            $options = new Options();
            $options->set('isRemoteEnabled', true);
            $options->set('isHtml5ParserEnabled', true);

            $dompdf = new Dompdf($options);
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();

            $output = $dompdf->output();
            $pdfPath = storage_path("cpe_$correlativo.pdf");
            file_put_contents($pdfPath, $output);

           // Si la solicitud tiene el parámetro 'view', simplemente muestra el PDF
            if ($request->has('view')) {
                return response($output, 200, [
                    'Content-Type' => 'application/pdf',
                    'Content-Disposition' => 'inline; filename="cpe_'.$correlativo.'.pdf"'
                ]);
            }
            // Añadir depuración para verificar el contenido de $output y $pdfPath
            Log::info('Ruta del PDF:', ['pdfPath' => $pdfPath]);

            $numeroWhatsApp = $request->input('numeroWhatsApp');
            $email = $request->input('email');

            if ($numeroWhatsApp || $email) {
                if ($numeroWhatsApp) {
                    // Log::info('Enviando PDF por WhatsApp a:', ['numeroWhatsApp' => $numeroWhatsApp]);
                    $this->enviarWhatsApp($numeroWhatsApp, $pdfPath);
                }

                if ($email) {
                    // Log::info('Enviando PDF por correo a:', ['email' => $email]);
                    Mail::to($email)->send(new FacturaMail($pdfPath));
                }

                return response()->json(['message' => 'Factura enviada con éxito.']);
            } else {
                Log::warning('No se proporcionó número de WhatsApp ni correo electrónico para enviar la factura.');
            }

            return response()->file($pdfPath, [
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="cpe_' . $correlativo . '.pdf"',
            ]);
        } catch (\Exception $e) {
            Log::error('Error al generar PDF de la factura: ' . $e->getMessage());
            return response()->json(['error' => 'Error al generar el PDF de la factura: ' . $e->getMessage()], 500);
        }
    }

    public function generarPDFNotaCredito(Request $request, $id)
    {
        try {
            //Log::info("Iniciando la generación del PDF para la nota de crédito con ID: $id");
            $numeroWhatsApp = $request->input('numeroWhatsApp');
            $email = $request->input('email');
            $facturadorId = $request->input('facturadorId');
            // Cargar la nota de crédito con sus relaciones
            $notaCredito = NotaCredito::with(['facturacion', 'facturacion.paciente', 'facturacion.detalles.tratamiento', 'facturacion.detalles.procedimiento'])->find($id);

            if (!$notaCredito) {
                Log::error("Nota de crédito no encontrada con el ID: $id");
                return response()->json(['error' => 'Nota de crédito no encontrada'], 404);
            }

            $factura = $notaCredito->facturacion;
            $detallesNota = [];

            foreach ($factura->detalles as $detalle) {
                $descripcion = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
                $detallesNota[] = [
                    'cantidad' => 1,
                    'descripcion' => $descripcion,
                    'importe' => $detalle->importe,
                ];
            }

            if ($factura->t_doc_iden === "6") { // Si es RUC, buscar en la tabla de clientes
                if (!empty($factura->num_doc_iden) && strlen($factura->num_doc_iden) === 11) {
                    $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
            
                    if ($cliente) {
                        $numeroDocumento = $factura->num_doc_iden;
                        $nombre = strtoupper($cliente->rsocial);
                        $direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'Cliente no encontrado'], 404);
                    }
                } else {
                    return response()->json(['error' => 'El RUC es obligatorio para facturas y debe tener 11 dígitos.'], 400);
                }
            } elseif (in_array($factura->t_doc_iden, ["1", "4"])) { // Si es DNI o CEX, buscar en pacientes primero
                $paciente = Paciente::where('tipodocumento', $factura->t_doc_iden)
                                    ->where('numerodoc', $factura->num_doc_iden)
                                    ->first();
            
                if ($paciente) {
                    $tipoDocIdent = $factura->t_doc_iden;
                    $numeroDocumento = $factura->num_doc_iden;
                    $nombre = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                    $direccion = strtoupper($paciente->direccion);
                } else {
                    // Si no se encuentra en pacientes, buscar en clientes por el mismo número de documento
                    $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
            
                    if ($cliente) {
                        $numeroDocumento = $cliente->ruc;
                        $nombre = strtoupper($cliente->rsocial);
                        $direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'No se encontró registro en pacientes ni clientes'], 404);
                    }
                }
            } else {
                return response()->json(['error' => 'Tipo de documento no válido.'], 400);
            }

            $fechaEmision = Carbon::parse($notaCredito->fecha)->format('d/m/Y');
            $usuario = Auth::user()->name;
            $correlativo = "$notaCredito->serie-$notaCredito->numdoc";
            
            $subtotal = number_format($factura->subtotal, 2);
            $igv = number_format($factura->igv, 2);
            $total = number_format($factura->importe, 2);
            //$montoLiteral = $this->convertirNumerosALetras($total);
            $montoLiteral = NumeroALetras::convertirMoneda($montoLimpio);

            $tipodoc = (strlen($numeroDocumento) == 8) ? 1 : ((strlen($numeroDocumento) == 11) ? 6 : null);
            $tipoDocumento = 'Nota de Crédito Electrónica';
            $dr = "$factura->serie-$factura->numdoc";
            $fecha_dr = Carbon::parse($factura->fecha)->format('d/m/Y');
            $hash_code = $notaCredito->hash_cpe;
            // Hacemos la consulta a la tabla facturadores para obtener el registro con el id proporcionado
            $facturador = Facturador::find($facturadorId);
            if (!$facturador) {
                //\Log::error('Facturador no encontrado para el ID: ' . $facturadorId);
                return response()->json([
                    'success' => false,
                    'message' => 'Facturador no encontrado.'
                ]);
            }
            //\Log::info('Facturador encontrado: ' . $facturador->razon_social);
            // Datos del emisor
            $emisor = [
                'ruc' => $facturador->ruc,
                'razon_social' => $facturador->razon_social,
                'direccion' => $facturador->direccion,
                'nombre_comercial' => $facturador->nombre_comercial,
                'ubigeo_dpto' => $facturador->ubigeo_dpto,
                'ubigeo_provincia' => $facturador->ubigeo_provincia,
                'ubigeo_distrito' => $facturador->ubigeo_distrito,
            ];
            $ruc = $emisor['ruc'];
            $QR = "$ruc|07|$correlativo|$igv|$total|$fechaEmision|$tipodoc|$numeroDocumento|$hash_code";

            $renderer = new ImageRenderer(
                new RendererStyle(80),
                new SvgImageBackEnd()
            );
            $writer = new Writer($renderer);
            $qrCodeData = $writer->writeString($QR);
            $qrCodeBase64 = base64_encode($qrCodeData);

            $logoPath = public_path('img/logo.png');
            $type = pathinfo($logoPath, PATHINFO_EXTENSION);
            $logoData = file_get_contents($logoPath);
            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($logoData);
            
            $html = "
            <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; font-size: 10px; padding: 20px; }
                    .titulo { text-align: center; font-size: 12px; font-weight: bold; }
                    .detalles { border-collapse: collapse; width: 100%; }
                    .detalles th {
                        border: 1px solid black;
                        padding: 5px;
                        text-align: left;
                        background-color: lightblue; /* Relleno color azul claro */
                    }
                    .detalles td { border: 1px solid black; padding: 5px; text-align: left; }
                    .totales { text-align: right; font-weight: bold; }
                </style>
            </head>
            <body>
                
                <style>
                    .logo-cell {
                        width: 70px; /* Ajusta el ancho según tus necesidades */
                        text-align: center;
                        vertical-align: middle;
                    }
                    .info-cell {
                        font-size: 12px;
                        width: 360px;
                    }
                    .ruc-cell {
                        width: 240px;
                        font-size: 16px;
                        text-align: center !important;
                        vertical-align: top;
                    }
                </style>

                <table border='0'>
                    <tr>
                        <td class='logo-cell'>
                            <img src='" . $base64 . "' alt='Logo' style='max-width: 100px; height: auto; transform: scale(1.5);'>
                        </td>
                        <td class='info-cell'>
                            <b>" . $emisor['nombre_comercial'] . " <br>
                                " . $emisor['razon_social'] . "</b> <br>
                                " . $emisor['direccion'] . "
                                <br>
                            " . $emisor['ubigeo_dpto'] . " - " . $emisor['ubigeo_provincia'] . " - " . $emisor['ubigeo_distrito'] . "<br>
                            Tel. 969 826 870 | Email: consultoriosdelnorte@gmail.com
                        </td>
                        <td class='ruc-cell'>
                            <table border='1'>
                                <tr>
                                    <td style='text-align: center;'>
                                        <b>R.U.C. N° " . $emisor['ruc'] . "<br>$tipoDocumento<br>$correlativo</b>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>

                <hr>
                <style>
                    .tabla-detalles {
                        font-size: 12px; /* Ajusta este valor según el tamaño de letra deseado */
                    }
                    .fixed-width {
                        width: 350px; /* Ancho fijo para las celdas con esta clase */
                    }
                </style>

                <table class='tabla-detalles'>
                    <tr>
                        <td><b>Fecha:</b></td>
                        <td class='fixed-width'>$fechaEmision</td>
                        <td><b>Docum. Refer.</b></td>
                        <td>$dr</td>
                    </tr>
                    <tr>
                        <td><b>Señor(es):</b></td>
                        <td class='fixed-width'>$nombre</td>
                        <td><b>Fecha Doc. Ref.:</b></td>
                        <td>$fecha_dr</td>
                    </tr>
                    <tr>
                        <td><b>RUC/DNI:</b></td>
                        <td class='fixed-width'>$numeroDocumento</td>
                        <td><b>Atendido por:</b></td>
                        <td>$usuario</td>
                    </tr>
                    <tr>
                        <td><b>Dirección:</b></td>
                        <td class='fixed-width'>$direccion</td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

                <hr>
                <table class='detalles'>
                    <tr>
                        <th>Cant.</th>
                        <th>Descripción</th>
                        <th style='text-align:right;'>Importe</th>
                    </tr>";
            
                    foreach ($factura->detalles as $detalle) {
                        $descripcion = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
                        $importeFormateado = number_format($detalle->importe, 2);
                        $html .= "<tr>
                                    <td>1</td>
                                    <td>{$descripcion}</td>
                                    <td style='text-align:right;'>S/. {$importeFormateado}</td>
                                  </tr>";
                    }
                    
                                
                $html .= "
                </table>
                
                <style>
                    .totales {
                        border: 1px solid black;
                        padding: 8px;
                        font-weight: bold; /* Valores de totales en negrita */
                        font-size: 12px; /* Ajusta este valor según el tamaño de letra deseado */
                    }
                    .valor {
                        text-align: right;
                        border: 1px solid black;
                        padding: 8px;
                        font-weight: bold; /* Valores de totales en negrita */
                        font-size: 14px; /* Ajusta este valor según el tamaño de letra deseado */
                    }
                    .tabla-totales {
                        width: 30%; /* Ancho de la tabla de totales */
                        margin-left: auto; /* Esto alinea la tabla a la derecha */
                        margin-right: 0px;
                    }
                    .monto-literal {
                        text-align: center;
                        font-weight: bold; /* Monto literal en negrita */
                        font-size: 14px; /* Ajusta este valor según el tamaño de letra deseado */
                        vertical-align: middle;
                    }
                    .tabla-monto-literal {
                        width: 70%; /* Ancho de la celda del monto literal */
                        vertical-align: middle;
                    }
                    .qr {
                        text-align: center;
                        
                    }
                </style>

                <table width='100%'>
                    <tr>
                        <td class='tabla-monto-literal' rowspan='4'><b>$montoLiteral</b><br><img src='data:image/svg+xml;base64,$qrCodeBase64' alt='QR Code'><br><b>$hash_code</b></td>
                        <td class='totales'>Subtotal:</td>
                        <td class='valor'>S/. $factura->subtotal</td>
                    </tr>
                    <tr>
                        <td class='totales'>IGV (18%):</td>
                        <td class='valor'>S/. $factura->igv</td>
                    </tr>
                    <tr>
                        <td class='totales'>Total:</td>
                        <td class='valor'>S/. $factura->importe</td>
                    </tr>
                </table>
                <hr>
                <div style='text-align:center;'>
                    <p style='font-size: 14px;'>Representación impresa de la $tipoDocumento</p>
                    <p style='font-size: 14px;'>Gracias por su preferencia.</p>
                </div>
            </body>
            </html>";

            // Configurar Dompdf
            $options = new Options();
            $options->set('isRemoteEnabled', true);
            $options->set('isHtml5ParserEnabled', true);

            $dompdf = new Dompdf($options);
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();

            $output = $dompdf->output();
            $pdfPath = storage_path("cpe_$correlativo.pdf");
            file_put_contents($pdfPath, $output);

            // Si la solicitud tiene el parámetro 'view', simplemente muestra el PDF
            if ($request->has('view')) {
                return response($output, 200, [
                    'Content-Type' => 'application/pdf',
                    'Content-Disposition' => 'inline; filename="cpe_'.$correlativo.'.pdf"'
                ]);
            }
            // Añadir depuración para verificar el contenido de $output y $pdfPath
            // Log::info('Ruta del PDF:', ['pdfPath' => $pdfPath]);

            $numeroWhatsApp = $request->input('numeroWhatsApp');
            $email = $request->input('email');

            if ($numeroWhatsApp || $email) {
                if ($numeroWhatsApp) {
                    // Log::info('Enviando PDF por WhatsApp a:', ['numeroWhatsApp' => $numeroWhatsApp]);
                    $this->enviarWhatsApp($numeroWhatsApp, $pdfPath);
                }

                if ($email) {
                    // Log::info('Enviando PDF por correo a:', ['email' => $email]);
                    Mail::to($email)->send(new FacturaMail($pdfPath));
                }

                return response()->json(['message' => 'Factura enviada con éxito.']);
            } else {
                Log::warning('No se proporcionó número de WhatsApp ni correo electrónico para enviar la factura.');
            }

            return response()->file($pdfPath, [
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="cpe_' . $correlativo . '.pdf"',
            ]);

        } catch (\Exception $e) {
            Log::error('Error al generar PDF de la factura: ' . $e->getMessage());
            return response()->json(['error' => 'Error al generar el PDF de la factura: ' . $e->getMessage()], 500);
        }
    }


    private function enviarWhatsApp($numero, $pdfPath)
    {
        try {
            $mensaje = "Estimado cliente, adjuntamos su factura en PDF.";
            $urlArchivo = url("storage/factura_" . basename($pdfPath));

            // Aquí integrarías tu servicio de envío de WhatsApp, por ejemplo, Twilio
            Http::post('https://api.whatsapp.com/send', [
                'phone' => $numero,
                'message' => $mensaje,
                'media_url' => $urlArchivo
            ]);

            Log::info("Factura enviada por WhatsApp a $numero");
        } catch (\Exception $e) {
            Log::error("Error al enviar factura por WhatsApp: " . $e->getMessage());
        }
    }
    public function actualizarMedioPago(Request $request)
    {
        $facturacionId = $request->input('facturacion_id');
        $medioPago = $request->input('medio_pago');

        // Encuentra la facturación y actualiza el medio de pago
        $facturacion = Facturacion::find($facturacionId);
        if ($facturacion) {
            $facturacion->medio_pago = $medioPago;
            $facturacion->save();
            
            return response()->json(['success' => true]);
        } else {
            return response()->json(['success' => false, 'message' => 'Documento no encontrado.']);
        }
    }
    public function reporteVentasMedico(Request $request)
    {
        // Capturar fechas de la solicitud o usar la fecha actual como predeterminada
        $fechaInicio = $request->input('fecha_inicio', date('Y-m-d'));
        $fechaFin = $request->input('fecha_fin', date('Y-m-d'));
        $facturadorId = $request->input('facturador_id');

        $empresaId = auth()->user()->empresa_id;
        $medicos = Medico::all();
        $actividades = Actividad::all();
        $servicios = Servicio::all();
        // Consulta los facturadores asociados a la empresa del usuario
        $facturadores = Facturador::where('empresa_id', $empresaId)->get();

        // Consultar las facturaciones con las fechas actuales y los facturador_id obtenidos
        $facturaciones = Facturacion::with(['paciente'])
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->when($facturadorId, function($query) use ($facturadorId) {
                return $query->where('facturador_id', $facturadorId);
            })
            ->get();
        // Calcular el total del importe (ajusta el campo según corresponda)
        $totalImporte = $facturaciones->sum('total'); // o 'importe', depende del nombre de tu columna

         return view('reportes.reporte_ventas', compact(
            'fechaInicio', 
            'fechaFin',
            'empresaId',
            'facturaciones',
            'medicos',
            'actividades',
            'servicios',
            'facturadorId',
            'facturadores',
            'totalImporte'
        ));
        
    }

}
