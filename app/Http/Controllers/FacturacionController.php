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

            // Validación
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
                // Recibimos estos datos solo para gestionar el Cliente, no para la factura
                'razon_social' => 'nullable|string',
                'direccion' => 'nullable|string',
            ]);

            return DB::transaction(function () use ($validatedData, $request) {
                
                // ---------------------------------------------------------
                // 1. GESTIÓN DE CLIENTE (EMPRESA)
                // ---------------------------------------------------------
                // Si es RUC (6) y tenemos Razón Social, aseguramos que el cliente exista en la tabla maestra.
                if ($validatedData['tipo_doc'] === '6' && !empty($request->input('razon_social'))) {
                    
                    // Buscamos por RUC y actualizamos o creamos
                    Cliente::updateOrCreate(
                        ['ruc' => $validatedData['num_doc']], // Clave de búsqueda
                        [
                            'rsocial' => strtoupper($request->input('razon_social')),
                            'direccion' => strtoupper($request->input('direccion') ?? '-'),
                            'empresa_id' => auth()->user()->empresa_id ?? 1,
                            'user_id' => auth()->id()
                        ]
                    );
                    // Ahora el cliente ya existe en la tabla 'clientes' para futuras consultas
                }
                // ---------------------------------------------------------

                $fecha_presupuesto = Carbon::parse($validatedData['fecha_presupuesto'])->setTimezone('America/Lima');
                $validatedData['presupuesto_id'] = $validatedData['presupuesto_id'] ?? 0;

                // 🔐 Obtener correlativos ocupados con bloqueo
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

                // Buscar hueco en correlativos
                $siguienteCorrelativoNum = 1;
                foreach ($correlativosOcupados as $num) {
                    if ($num == $siguienteCorrelativoNum) {
                        $siguienteCorrelativoNum++;
                    } elseif ($num > $siguienteCorrelativoNum) {
                        break;
                    }
                }

                $siguienteCorrelativo = str_pad($siguienteCorrelativoNum, 8, '0', STR_PAD_LEFT);

                // ✅ Crear la factura (Estructura original, sin campos nuevos)
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
                    'message' => 'Comprobante registrado con éxito.',
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

            // 1. Cargar Factura
            $factura = Facturacion::with(['paciente', 'detalles.tratamiento', 'detalles.procedimiento'])->find($id);

            if (!$factura) {
                return response()->json(['error' => 'Factura no encontrada'], 404);
            }

            $facturadorId = $request->input('facturadorId') ?? ($factura->facturador_id ?? null);

            // 2. Lógica de Cliente / Paciente
            $nombre = '';
            $direccion = '';
            $numeroDocumento = $factura->num_doc_iden;
            $tipoDocIdent = $factura->t_doc_iden;

            if ($factura->t_doc_iden === "6") { // RUC
                if (!empty($factura->num_doc_iden) && strlen($factura->num_doc_iden) === 11) {
                    $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
                    if ($cliente) {
                        $nombre = strtoupper($cliente->rsocial);
                        $direccion = strtoupper($cliente->direccion);
                    } else {
                        $nombre = "CLIENTE RUC " . $factura->num_doc_iden; 
                    }
                }
            } elseif (in_array($factura->t_doc_iden, ["1", "4", "7", "0"])) { 
                if ($factura->paciente) {
                    $nombre = strtoupper($factura->paciente->nombres . ' ' . $factura->paciente->ape_paterno . ' ' . $factura->paciente->ape_materno);
                    $direccion = strtoupper($factura->paciente->direccion);
                } else {
                    $paciente = Paciente::where('tipodocumento', $factura->t_doc_iden)
                                        ->where('numerodoc', $factura->num_doc_iden)->first();
                    if ($paciente) {
                        $nombre = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                        $direccion = strtoupper($paciente->direccion);
                    } else {
                        $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
                        if ($cliente) {
                            $nombre = strtoupper($cliente->rsocial);
                            $direccion = strtoupper($cliente->direccion);
                        }
                    }
                }
            }

            // 3. Preparar datos
            $fechaEmision = Carbon::parse($factura->fecha)->format('d/m/Y');
            $correlativo = "$factura->serie-$factura->numdoc";
            $montoLimpio = number_format(floatval($factura->importe), 2, '.', '');
            $montoLiteral = NumeroALetras::convertirMoneda($montoLimpio);

            $tipodoc = (strlen($numeroDocumento) == 11) ? 6 : $tipoDocIdent;
            $labelTD = match((string)$tipodoc) { '1' => 'DNI', '4' => 'CEX', '6' => 'RUC', '7' => 'PAS', default => 'DOC' };
            $tipoDocumento = ($factura->tipodoc == '01') ? 'Factura Electrónica' : 'Boleta de Venta Electrónica';
            $hash_code = $factura->hash_cpe;

            $facturador = Facturador::find($facturadorId) ?? Facturador::first();

            $emisor = [
                'ruc' => $facturador->ruc,
                'razon_social' => $facturador->razon_social,
                'direccion' => $facturador->direccion,
                'nombre_comercial' => $facturador->nombre_comercial,
                'ubigeo_dpto' => $facturador->ubigeo_dpto,
                'ubigeo_provincia' => $facturador->ubigeo_provincia,
                'ubigeo_distrito' => $facturador->ubigeo_distrito,
            ];

            // QR
            $QR = "{$emisor['ruc']}|$factura->tipodoc|$correlativo|$factura->igv|$factura->importe|$fechaEmision|$tipodoc|$numeroDocumento|$hash_code";
            $renderer = new ImageRenderer(new RendererStyle(80), new SvgImageBackEnd());
            $writer = new Writer($renderer);
            $qrCodeBase64 = base64_encode($writer->writeString($QR));

            $logoPath = public_path('img/logo.jpg');
            $base64Logo = file_exists($logoPath) ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath)) : '';

            // 4. HTML
            $html = "
            <html>
            <head>
                <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
                <style>
                    body { font-family: 'DejaVu Sans', sans-serif; font-size: 10px; padding: 20px; }
                    .detalles { border-collapse: collapse; width: 100%; }
                    .detalles th { border: 1px solid black; padding: 5px; background-color: lightblue; }
                    .detalles td { border: 1px solid black; padding: 5px; }
                    .totales { text-align: right; font-weight: bold; }
                    .logo-cell { width: 70px; text-align: center; vertical-align: middle; }
                    .info-cell { font-size: 12px; width: 360px; }
                    .ruc-cell { width: 240px; font-size: 16px; text-align: center !important; vertical-align: top; }
                </style>
            </head>
            <body>
                <table border='0'>
                    <tr>
                        <td class='logo-cell'><img src='$base64Logo' style='max-width: 80px;'></td>
                        <td class='info-cell'>
                            <b>{$emisor['nombre_comercial']} <br> {$emisor['razon_social']}</b> <br>
                            {$emisor['direccion']} <br>
                            {$emisor['ubigeo_dpto']} - {$emisor['ubigeo_provincia']} - {$emisor['ubigeo_distrito']} <br>
                            Tel. 969 826 870 | Email: evolutiondentalcenter@gmail.com
                        </td>
                        <td class='ruc-cell'>
                            <table border='1' width='100%'><tr><td style='text-align: center;'>
                                <b>R.U.C. N° {$emisor['ruc']} <br> $tipoDocumento <br> $correlativo</b>
                            </td></tr></table>
                        </td>
                    </tr>
                </table>
                <hr>
                <table style='font-size: 12px;'>
                    <tr><td width='100'><b>Fecha:</b></td><td width='300'>$fechaEmision</td><td><b>Pago:</b></td><td>Contado</td></tr>
                    <tr><td><b>Señor(es):</b></td><td>$nombre</td></tr>
                    <tr><td><b>$labelTD:</b></td><td>$numeroDocumento</td></tr>
                    <tr><td><b>Dirección:</b></td><td>$direccion</td></tr>
                </table>
                <br>
                <table class='detalles'>
                    <tr><th>Cant.</th><th>Descripción</th><th style='text-align:right;'>Importe</th></tr>";
            
            foreach ($factura->detalles as $detalle) {
                $desc = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
                $imp = number_format($detalle->importe, 2);
                $html .= "<tr><td>1</td><td>$desc</td><td style='text-align:right;'>S/. $imp</td></tr>";
            }

            $html .= "</table>
                <br>
                <table width='100%'>
                    <tr>
                        <td width='70%'>
                            Son: <b>$montoLiteral</b><br>
                            <img src='data:image/svg+xml;base64,$qrCodeBase64'><br>
                            Hash: $hash_code
                        </td>
                        <td>
                            <table width='100%'>
                                <tr><td class='totales'>Subtotal:</td><td style='text-align:right;'>S/. ".number_format($factura->subtotal, 2)."</td></tr>
                                <tr><td class='totales'>IGV:</td><td style='text-align:right;'>S/. ".number_format($factura->igv, 2)."</td></tr>
                                <tr><td class='totales'>Total:</td><td style='text-align:right;'>S/. ".number_format($factura->importe, 2)."</td></tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
            </html>";

            // 5. Generar PDF
            $options = new Options();
            $options->set('isRemoteEnabled', true);
            $options->set('isHtml5ParserEnabled', true);
            $options->set('tempDir', sys_get_temp_dir());
            $options->set('chroot', public_path());

            $dompdf = new Dompdf($options);
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();

            if (ob_get_length() > 0) ob_end_clean();

            $output = $dompdf->output();
            $fileName = "cpe_$correlativo.pdf";

            // Guardar
            try {
                $directory = storage_path('app/public/facturas');
                if (!file_exists($directory)) mkdir($directory, 0777, true);
                $pdfPath = $directory . '/' . $fileName;
                file_put_contents($pdfPath, $output);
            } catch (\Exception $e) {
                $pdfPath = sys_get_temp_dir() . '/' . $fileName;
                file_put_contents($pdfPath, $output);
            }

            if ($request->has('view')) {
                return $dompdf->stream($fileName, ["Attachment" => false]);
            }

            if ($email) {
                // ASUNTO DINÁMICO: "Factura" o "Boleta"
                $tituloCorreo = ($factura->tipodoc == '01' ? 'Factura Electrónica' : 'Boleta de Venta') . ' - ' . $correlativo;
                Mail::to($email)->send(new FacturaMail($pdfPath, $tituloCorreo));
                return response()->json(['message' => 'Documento enviado con éxito.']);
            }

            return response()->file($pdfPath, [
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="' . $fileName . '"',
            ]);

        } catch (\Exception $e) {
            if (ob_get_length() > 0) ob_end_clean();
            Log::error('Error PDF Factura: ' . $e->getMessage());
            return response()->json(['error' => 'Error: ' . $e->getMessage()], 500);
        }
    }

    public function generarPDFNotaCredito(Request $request, $id)
    {
        try {
            $numeroWhatsApp = $request->input('numeroWhatsApp');
            $email = $request->input('email');
            
            $notaCredito = NotaCredito::with(['facturacion', 'facturacion.paciente'])->find($id);

            if (!$notaCredito) {
                return response()->json(['error' => 'Nota de crédito no encontrada'], 404);
            }
            
            $factura = $notaCredito->facturacion;
            $facturadorId = $request->input('facturadorId') ?? ($factura->facturador_id ?? null);

            $nombre = '';
            $direccion = '';
            $numeroDocumento = $factura->num_doc_iden;
            
            if ($factura->paciente) {
                $nombre = strtoupper($factura->paciente->nombres . ' ' . $factura->paciente->ape_paterno);
                $direccion = strtoupper($factura->paciente->direccion);
            } elseif ($factura->num_doc_iden) {
                 $cliente = Cliente::where('ruc', $factura->num_doc_iden)->first();
                 if($cliente) {
                     $nombre = $cliente->rsocial;
                     $direccion = $cliente->direccion;
                 } else {
                     $nombre = "CLIENTE " . $factura->num_doc_iden;
                 }
            }

            $fechaEmision = Carbon::parse($notaCredito->fecha)->format('d/m/Y');
            $correlativo = "$notaCredito->serie-$notaCredito->numdoc";
            $docRef = "$factura->serie-$factura->numdoc";
            
            $montoLimpio = number_format(floatval($factura->importe), 2, '.', '');
            $montoLiteral = NumeroALetras::convertirMoneda($montoLimpio);
            $hash_code = $notaCredito->hash_cpe;

            $facturador = Facturador::find($facturadorId) ?? Facturador::first();
            $rucEmisor = $facturador->ruc;
            
            $QR = "$rucEmisor|07|$correlativo|$factura->igv|$factura->importe|$fechaEmision|{$factura->t_doc_iden}|$numeroDocumento|$hash_code";
            $renderer = new ImageRenderer(new RendererStyle(80), new SvgImageBackEnd());
            $writer = new Writer($renderer);
            $qrCodeBase64 = base64_encode($writer->writeString($QR));

            $logoPath = public_path('img/logo.jpg');
            $base64Logo = file_exists($logoPath) ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath)) : '';

            $html = "
            <html>
            <head>
                <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
                <style>
                    body { font-family: 'DejaVu Sans', sans-serif; font-size: 10px; padding: 20px; }
                    .totales { text-align: right; font-weight: bold; }
                </style>
            </head>
            <body>
                <table border='0' width='100%'>
                    <tr>
                        <td align='center'><img src='$base64Logo' width='80'></td>
                        <td>
                            <h3>NOTA DE CRÉDITO ELECTRÓNICA</h3>
                            <h2>$correlativo</h2>
                            <p><b>Emisor:</b> {$facturador->razon_social}<br>RUC: $rucEmisor</p>
                            <p>Email: evolutiondentalcenter@gmail.com</p>
                        </td>
                    </tr>
                </table>
                <hr>
                <p><b>Cliente:</b> $nombre <br> <b>Documento:</b> $numeroDocumento</p>
                <p><b>Documento que modifica:</b> $docRef</p>
                <p><b>Motivo:</b> Anulación de la operación</p>
                <br>
                <table width='100%' border='1' cellspacing='0' cellpadding='5'>
                    <tr bgcolor='#f2f2f2'><th>Descripción</th><th>Importe</th></tr>
                    <tr>
                        <td>Devolución por anulación</td>
                        <td align='right'>S/. ".number_format($factura->importe, 2)."</td>
                    </tr>
                </table>
                <br>
                <table width='100%'>
                    <tr>
                        <td>
                            <b>Son: $montoLiteral</b><br>
                            <img src='data:image/svg+xml;base64,$qrCodeBase64'>
                        </td>
                        <td align='right'>
                            <b>Total: S/. ".number_format($factura->importe, 2)."</b>
                        </td>
                    </tr>
                </table>
            </body>
            </html>";

            $options = new Options();
            $options->set('isRemoteEnabled', true);
            $options->set('tempDir', sys_get_temp_dir());
            $options->set('chroot', public_path());
            $dompdf = new Dompdf($options);
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();

            if (ob_get_length() > 0) ob_end_clean();
            $output = $dompdf->output();
            $fileName = "nc_$correlativo.pdf";

            try {
                $dir = storage_path('app/public/facturas');
                if (!file_exists($dir)) mkdir($dir, 0777, true);
                $pdfPath = "$dir/$fileName";
                file_put_contents($pdfPath, $output);
            } catch (\Exception $e) {
                $pdfPath = sys_get_temp_dir() . "/$fileName";
                file_put_contents($pdfPath, $output);
            }

            if ($request->has('view')) return $dompdf->stream($fileName, ["Attachment" => false]);

            if ($email) {
                // ASUNTO DINÁMICO: "Nota de Crédito"
                Mail::to($email)->send(new FacturaMail($pdfPath, 'Nota de Crédito - ' . $correlativo));
                return response()->json(['message' => 'Nota enviada.']);
            }

            return response()->file($pdfPath, [
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="' . $fileName . '"',
            ]);

        } catch (\Exception $e) {
            if (ob_get_length() > 0) ob_end_clean();
            Log::error('Error NotaCredito: ' . $e->getMessage());
            return response()->json(['error' => 'Error: ' . $e->getMessage()], 500);
        }
    }

    // Agrega esto en FacturacionController.php
    public function generarPDFNotaVenta(Request $request, $id)
    {
        try {
            $numeroWhatsApp = $request->input('numeroWhatsApp');
            $email = $request->input('email');

            $factura = Facturacion::with(['paciente', 'detalles.tratamiento', 'detalles.procedimiento'])->find($id);

            if (!$factura) {
                return response()->json(['error' => 'Nota de venta no encontrada'], 404);
            }

            $facturadorId = $request->input('facturadorId') ?? ($factura->facturador_id ?? null);

            // Datos Cliente
            $nombre = "CLIENTE GENERAL";
            $direccion = "-";
            $numeroDocumento = $factura->num_doc_iden;
            
            if ($factura->t_doc_iden === "6") {
                $cliente = Cliente::where('ruc', $numeroDocumento)->first();
                if ($cliente) { $nombre = $cliente->rsocial; $direccion = $cliente->direccion; }
            } else {
                $paciente = Paciente::where('numerodoc', $numeroDocumento)->first();
                if ($paciente) { 
                    $nombre = $paciente->nombres . ' ' . $paciente->ape_paterno; 
                    $direccion = $paciente->direccion; 
                }
            }
            if (!empty($factura->razon_social)) $nombre = $factura->razon_social;

            $fechaEmision = Carbon::parse($factura->fecha)->format('d/m/Y');
            $correlativo = "$factura->serie-$factura->numdoc";
            $montoLimpio = number_format(floatval($factura->importe), 2, '.', '');
            $montoLiteral = NumeroALetras::convertirMoneda($montoLimpio);

            $facturador = Facturador::find($facturadorId) ?? Facturador::first();
            $emisor = [
                'ruc' => $facturador->ruc,
                'razon_social' => $facturador->razon_social,
                'direccion' => $facturador->direccion,
                'nombre_comercial' => $facturador->nombre_comercial,
                'ubigeo_dpto' => $facturador->ubigeo_dpto,
                'ubigeo_provincia' => $facturador->ubigeo_provincia,
                'ubigeo_distrito' => $facturador->ubigeo_distrito,
            ];

            $logoPath = public_path('img/logo.jpg');
            $base64Logo = file_exists($logoPath) ? 'data:image/png;base64,' . base64_encode(file_get_contents($logoPath)) : '';

            // QR Simbólico
            $QR = "{$emisor['ruc']}|NV|$correlativo|0|{$factura->importe}|$fechaEmision|0|$numeroDocumento|";
            $renderer = new ImageRenderer(new RendererStyle(80), new SvgImageBackEnd());
            $writer = new Writer($renderer);
            $qrCodeBase64 = base64_encode($writer->writeString($QR));

            $html = "
            <html>
            <head>
                <meta http-equiv='Content-Type' content='text/html; charset=utf-8'/>
                <style>
                    body { font-family: 'DejaVu Sans', sans-serif; font-size: 10px; padding: 20px; }
                    .detalles { border-collapse: collapse; width: 100%; }
                    .detalles th { border: 1px solid black; padding: 5px; background-color: lightblue; }
                    .detalles td { border: 1px solid black; padding: 5px; }
                    .totales { text-align: right; font-weight: bold; }
                    .logo-cell { width: 70px; text-align: center; vertical-align: middle; }
                    .info-cell { font-size: 12px; width: 360px; }
                    .ruc-cell { width: 240px; font-size: 16px; text-align: center !important; vertical-align: top; }
                </style>
            </head>
            <body>
                <table border='0'>
                    <tr>
                        <td class='logo-cell'><img src='$base64Logo' style='max-width: 80px;'></td>
                        <td class='info-cell'>
                            <b>{$emisor['nombre_comercial']} <br> {$emisor['razon_social']}</b> <br>
                            {$emisor['direccion']} <br>
                            {$emisor['ubigeo_dpto']} - {$emisor['ubigeo_provincia']} - {$emisor['ubigeo_distrito']} <br>
                            Tel. 969 826 870 | Email: evolutiondentalcenter@gmail.com
                        </td>
                        <td class='ruc-cell'>
                            <table border='1' width='100%'><tr><td style='text-align: center;'>
                                <b>R.U.C. N° {$emisor['ruc']} <br> NOTA DE VENTA <br> $correlativo</b>
                            </td></tr></table>
                        </td>
                    </tr>
                </table>
                <hr>
                <table style='font-size: 12px;'>
                    <tr><td width='100'><b>Fecha:</b></td><td width='300'>$fechaEmision</td></tr>
                    <tr><td><b>Cliente:</b></td><td>$nombre</td></tr>
                    <tr><td><b>Documento:</b></td><td>$numeroDocumento</td></tr>
                </table>
                <br>
                <table class='detalles'>
                    <tr><th>Cant.</th><th>Descripción</th><th style='text-align:right;'>Importe</th></tr>";
            
            foreach ($factura->detalles as $detalle) {
                $desc = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
                $imp = number_format($detalle->importe, 2);
                $html .= "<tr><td>1</td><td>$desc</td><td style='text-align:right;'>S/. $imp</td></tr>";
            }

            $html .= "</table>
                <br>
                <table width='100%'>
                    <tr>
                        <td width='70%'>
                            Son: <b>$montoLiteral</b><br>
                            <img src='data:image/svg+xml;base64,$qrCodeBase64'><br>
                            (Documento Interno - Sin Valor Fiscal)
                        </td>
                        <td>
                            <table width='100%'>
                                <tr><td class='totales'>Total:</td><td style='text-align:right;'>S/. ".number_format($factura->importe, 2)."</td></tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </body>
            </html>";

            $options = new Options();
            $options->set('isRemoteEnabled', true);
            $options->set('tempDir', sys_get_temp_dir());
            $options->set('chroot', public_path());
            $dompdf = new Dompdf($options);
            $dompdf->loadHtml($html);
            $dompdf->setPaper('A4', 'portrait');
            $dompdf->render();

            if (ob_get_length() > 0) ob_end_clean();

            $fileName = "nv_$correlativo.pdf";
            if ($request->has('view')) return $dompdf->stream($fileName, ["Attachment" => false]);
            
            $pdfPath = sys_get_temp_dir() . '/' . $fileName;
            file_put_contents($pdfPath, $dompdf->output());

            if ($email) {
                 // ASUNTO DINÁMICO: "Nota de Venta"
                 Mail::to($email)->send(new FacturaMail($pdfPath, 'Nota de Venta - ' . $correlativo));
                 return response()->json(['message' => 'Nota de venta enviada.']);
            }

            return response()->file($pdfPath, [
                'Content-Type' => 'application/pdf',
                'Content-Disposition' => 'inline; filename="' . $fileName . '"',
            ]);

        } catch (\Exception $e) {
            if (ob_get_length() > 0) ob_end_clean();
            Log::error('Error PDF Nota Venta: ' . $e->getMessage());
            return response()->json(['error' => 'Error: ' . $e->getMessage()], 500);
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
