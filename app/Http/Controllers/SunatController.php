<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Carbon\Carbon;
use App\Models\Cliente;
use App\Models\Paciente;
use App\Models\Facturacion;
use App\Models\Facturador;
use App\Models\NotaCredito;
use App\Services\SunatService;
use Illuminate\Support\Facades\Log;
use Dompdf\Dompdf;
use Dompdf\Options;
use App\Exports\VentasExport;
use Maatwebsite\Excel\Facades\Excel;

class SunatController extends Controller
{
    public function index(Request $request)
    {
        if (!auth()->user()->hasPermissionTo('Facturar')) {
            abort(403, 'No tienes permiso para acceder a esta página.');
        }
        // Capturar fechas de la solicitud o usar la fecha actual como predeterminada
        $fechaInicio = $request->input('fecha_inicio', date('Y-m-d'));
        $fechaFin = $request->input('fecha_fin', date('Y-m-d'));
        $facturadorId = $request->input('facturador_id');
    
        // Obtener el empresa_id del usuario autenticado
        $empresaId = auth()->user()->empresa_id;
    
        // Consultar los facturadores asociados al empresa_id del usuario autenticado
        $facturadores = Facturador::where('empresa_id', $empresaId)->get();
        // Si no hay facturador preseleccionado, establecer el primero como predeterminado
        if (!$facturadorId && $facturadores->isNotEmpty()) {
            $facturadorId = $facturadores->first()->id; // Asignar el ID del primer facturador como predeterminado
        }
        // Obtener los IDs de los facturadores
        $facturadorIds = $facturadores->pluck('id');
    
        // Consultar las facturaciones con las fechas actuales y los facturador_id obtenidos
        $facturaciones = Facturacion::with(['cliente', 'paciente'])
            ->whereIn('tipodoc', ['01', '03'])
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->when($facturadorId, function($query) use ($facturadorId) {
                return $query->where('facturador_id', $facturadorId);
            })
            ->get();
    
        // Consultar las notas de crédito con las fechas actuales y los facturador_id obtenidos
        $notasCredito = NotaCredito::with('facturacion.cliente', 'facturacion.paciente')
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->whereHas('facturacion', function($query) use ($facturadorId) {
                $query->when($facturadorId, function($query) use ($facturadorId) {
                    return $query->where('facturador_id', $facturadorId);
                });
            })
            ->get();

        // Unir las notas de crédito a la colección de facturaciones
        $notasCredito->each(function($notaCredito) use ($facturaciones) {
            $facturacion = $notaCredito->facturacion;
            $facturacion->nota_credito = $notaCredito;
            $facturacion->isNotaCredito = true;
            $facturacion->fecha_ordenamiento = $notaCredito->fecha ?? $facturacion->fecha;
            $facturaciones->push($facturacion);
        });

        // Convertir todas las fechas a objetos Carbon antes de ordenar
        $facturaciones = $facturaciones->map(function ($facturacion) {
            $facturacion->fecha_ordenamiento = Carbon::parse($facturacion->fecha_ordenamiento ?? $facturacion->fecha);
            return $facturacion;
        })->sortByDesc('fecha_ordenamiento')->values();
    
        // Añadir RUC, Razón Social y Dirección a las facturaciones
        $facturaciones->each(function($facturacion) {
            // Buscar el paciente relacionado independientemente del RUC
            $paciente = $facturacion->paciente; // Asumiendo relación paciente()->belongsTo(Paciente::class)
            if ($facturacion->t_doc_iden === "6") { // Si es RUC, buscar en clientes
                $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                if ($cliente) {
                    $facturacion->razon_social = strtoupper($cliente->rsocial);
                    $facturacion->direccion = strtoupper($cliente->direccion);
                } else {
                    return response()->json(['error' => 'Cliente no encontrado con este RUC'], 404);
                }
            } elseif ($facturacion->tipodoc === "03") { // Si es Boleta, buscar en pacientes primero
                $paciente = Paciente::where('tipodocumento', $facturacion->t_doc_iden)
                                    ->where('numerodoc', $facturacion->num_doc_iden)
                                    ->first();
            
                if ($paciente) {
                    $facturacion->razon_social = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                    $facturacion->direccion = strtoupper($paciente->direccion ?? '');
                } else {
                    // Si no se encuentra en pacientes, buscar en la tabla de clientes
                    $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                    if ($cliente) {
                        $facturacion->razon_social = strtoupper($cliente->rsocial);
                        $facturacion->direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'No se encontró registro en pacientes ni clientes'], 404);
                    }
                }
            } else {
                return response()->json(['error' => 'Tipo de documento inválido'], 400);
            }
            // Asignar el correo electrónico del paciente
            $facturacion->email = $paciente->email ?? 'Sin correo';
        });
        // Ordenar todas las facturaciones (incluidas las notas de crédito) por fecha
        $facturaciones = $facturaciones->sortByDesc('fecha')->values();

        // Verificar si hay datos
        if ($facturaciones->isEmpty()) {
            Log::info('No se encontraron comprobantes en el rango de fechas: ' . $fechaInicio . ' - ' . $fechaFin);
        }
    
        // Pasar los datos a la vista
        return view('facturacion.bandejasunat', compact('fechaInicio', 'fechaFin', 'facturaciones', 'facturadores', 'facturadorId'));
    }
    public function reporteVentas(Request $request)
    {
        if (!auth()->user()->hasPermissionTo('Facturar')) {
            abort(403, 'No tienes permiso para acceder a esta página.');
        }
        // Capturar fechas de la solicitud o usar la fecha actual como predeterminada
        $fechaInicio = $request->input('fecha_inicio', date('Y-m-d'));
        $fechaFin = $request->input('fecha_fin', date('Y-m-d'));
        $facturadorId = $request->input('facturador_id');

        // Obtener el empresa_id del usuario autenticado
        $empresaId = auth()->user()->empresa_id;

        // Consultar los facturadores asociados al empresa_id del usuario autenticado
        $facturadores = Facturador::where('empresa_id', $empresaId)->get();

        // Si no hay facturador preseleccionado, establecer el primero como predeterminado
        if (!$facturadorId && $facturadores->isNotEmpty()) {
            $facturadorId = $facturadores->first()->id;
        }

        // Obtener las facturaciones
        $facturaciones = Facturacion::with(['cliente', 'paciente'])
            ->whereIn('tipodoc', ['01', '03'])
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->when($facturadorId, function ($query) use ($facturadorId) {
                return $query->where('facturador_id', $facturadorId);
            })
            ->get();

        // Consultar las notas de crédito con importe negativo
        $notasCredito = NotaCredito::with('facturacion.cliente', 'facturacion.paciente')
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->whereHas('facturacion', function ($query) use ($facturadorId) {
                $query->when($facturadorId, function ($query) use ($facturadorId) {
                    return $query->where('facturador_id', $facturadorId);
                });
            })
            ->get();

        // Procesar notas de crédito para incluirlas con importe negativo
        $notasCredito->each(function ($notaCredito) use ($facturaciones) {
            $facturacion = $notaCredito->facturacion;
            $facturacion->nota_credito = $notaCredito;
            $facturacion->isNotaCredito = true;

            // Convertir el importe de las notas de crédito a negativo
            //$facturacion->importe = -abs($facturacion->importe);
            $facturaciones->push($facturacion);
        });

        // Procesar las facturaciones
        $facturaciones->each(function ($facturacion) {
            // Convertir importes negativos si baja = 1 y ident es diferente de null
            //if ($facturacion->baja == 1 && !is_null($facturacion->ident)) {
            //    $facturacion->importe = -abs($facturacion->importe);
            //}

            // Añadir datos adicionales de cliente o paciente
            if ($facturacion->t_doc_iden === "6") { // Si es RUC, buscar en clientes
                $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                if ($cliente) {
                    $facturacion->razon_social = strtoupper($cliente->rsocial);
                    $facturacion->direccion = strtoupper($cliente->direccion);
                } else {
                    return response()->json(['error' => 'Cliente no encontrado con este RUC'], 404);
                }
            } elseif ($facturacion->tipodoc === "03") { // Si es Boleta, buscar en pacientes primero
                $paciente = Paciente::where('tipodocumento', $facturacion->t_doc_iden)
                                    ->where('numerodoc', $facturacion->num_doc_iden)
                                    ->first();
            
                if ($paciente) {
                    $facturacion->razon_social = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                    $facturacion->direccion = strtoupper($paciente->direccion ?? '');
                } else {
                    // Si no se encuentra en pacientes, buscar en la tabla de clientes
                    $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                    if ($cliente) {
                        $facturacion->razon_social = strtoupper($cliente->rsocial);
                        $facturacion->direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'No se encontró registro en pacientes ni clientes'], 404);
                    }
                }
            } else {
                return response()->json(['error' => 'Tipo de documento inválido'], 400);
            }
        });
        // Ordenar todas las facturaciones (incluidas las notas de crédito) por fecha
        $facturaciones = $facturaciones->sortBy('fecha')->values();

        // Verificar si hay datos
        if ($facturaciones->isEmpty()) {
            Log::info('No se encontraron registros de ventas en el rango de fechas: ' . $fechaInicio . ' - ' . $fechaFin);
        }
        // Sumar solo los importes positivos
        $totalImporte = $facturaciones->filter(function ($facturacion) {
            return $facturacion->importe > 0 && $facturacion->baja == 0; // Filtrar solo importes positivos
        })->sum('importe');
        return view('facturacion.reporte_ventas', compact('fechaInicio', 'fechaFin', 'facturaciones', 'facturadores', 'facturadorId', 'totalImporte'));
    }
    

    public function generarReporteVentasPDF(Request $request)
    {
        // Capturar fechas y facturador
        $fechaInicio = $request->input('fecha_inicio', date('Y-m-d'));
        $fechaFin = $request->input('fecha_fin', date('Y-m-d'));
        $facturadorId = $request->input('facturador_id');
        $empresaId = auth()->user()->empresa_id;

        // Obtener facturadores asociados
        $facturadores = Facturador::where('empresa_id', $empresaId)->get();
        if (!$facturadorId && $facturadores->isNotEmpty()) {
            $facturadorId = $facturadores->first()->id;
        }

        // Consultar facturaciones
        $facturaciones = Facturacion::with(['cliente', 'paciente'])
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->when($facturadorId, function ($query) use ($facturadorId) {
                return $query->where('facturador_id', $facturadorId);
            })
            ->get();

        // Consultar notas de crédito
        $notasCredito = NotaCredito::with('facturacion')
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->whereHas('facturacion', function ($query) use ($facturadorId) {
                $query->when($facturadorId, function ($query) use ($facturadorId) {
                    return $query->where('facturador_id', $facturadorId);
                });
            })
            ->get();

        // Procesar notas de crédito y asociarlas a las facturaciones
        $notasCredito->each(function ($notaCredito) use ($facturaciones) {
            $facturacion = $notaCredito->facturacion; // Obtener la facturación original
            if ($facturacion) {
                $facturacion->nota_credito = $notaCredito;
                $facturacion->isNotaCredito = true;

                // El importe de las notas de crédito proviene de la facturación, ajustado a negativo
                //$facturacion->importe = -abs($facturacion->importe);

                // Marcar el estado como "Anulado con Nota de Crédito"
                $facturacion->estado = 'Anulado con Nota de Crédito';

                // Agregar a la colección principal
                $facturaciones->push($facturacion);
            }
        });
        // Ordenar todas las facturaciones (incluidas las notas de crédito) por fecha
        $facturaciones = $facturaciones->sortBy('fecha')->values();

        // Procesar las facturaciones
        $totalImporte = 0;
        $facturaciones->each(function ($facturacion) use (&$totalImporte) {
            // Determinar el estado del documento
            if ($facturacion->baja == 1 && !is_null($facturacion->ident)) {
                $facturacion->estado = 'Comunicación de Baja';
                //$facturacion->importe = -abs($facturacion->importe);
            } elseif (!isset($facturacion->estado)) {
                $facturacion->estado = 'Activo';
            }

            // Acumular solo los importes positivos
            if ($facturacion->importe > 0 && $facturacion->baja == 0) {
                $totalImporte += $facturacion->importe;
            }

            if ($facturacion->t_doc_iden === "6") { // Si es RUC, buscar en clientes
                $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                if ($cliente) {
                    $facturacion->razon_social = strtoupper($cliente->rsocial);
                    $facturacion->direccion = strtoupper($cliente->direccion);
                } else {
                    return response()->json(['error' => 'Cliente no encontrado con este RUC'], 404);
                }
            } elseif ($facturacion->tipodoc === "03") { // Si es Boleta, buscar en pacientes primero
                $paciente = Paciente::where('tipodocumento', $facturacion->t_doc_iden)
                                    ->where('numerodoc', $facturacion->num_doc_iden)
                                    ->first();
            
                if ($paciente) {
                    $facturacion->razon_social = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                    $facturacion->direccion = strtoupper($paciente->direccion ?? '');
                } else {
                    // Si no se encuentra en pacientes, buscar en la tabla de clientes
                    $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                    if ($cliente) {
                        $facturacion->razon_social = strtoupper($cliente->rsocial);
                        $facturacion->direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'No se encontró registro en pacientes ni clientes'], 404);
                    }
                }
            } else {
                return response()->json(['error' => 'Tipo de documento inválido'], 400);
            }
        });

        // Obtener datos del facturador
        $facturador = Facturador::find($facturadorId);
        if (!$facturador) {
            throw new \Exception('Facturador no encontrado con el ID proporcionado.');
        }
        $emisor = [
            'ruc' => $facturador->ruc,
            'razon_social' => $facturador->razon_social,
            'direccion' => $facturador->direccion,
            'nombre_comercial' => $facturador->nombre_comercial,
            'ubigeo_dpto' => $facturador->ubigeo_dpto,
            'ubigeo_provincia' => $facturador->ubigeo_provincia,
            'ubigeo_distrito' => $facturador->ubigeo_distrito,
        ];

        // Procesar el logo en base64
        $logoPath = public_path('img/logo.png');
        $type = pathinfo($logoPath, PATHINFO_EXTENSION);
        $logoData = file_get_contents($logoPath);
        $base64 = 'data:image/' . $type . ';base64,' . base64_encode($logoData);

        // Construir el HTML del reporte
        $html = view('reportes.ventas_pdf', compact('facturaciones', 'totalImporte', 'emisor', 'base64', 'fechaInicio', 'fechaFin'))->render();

        // Configurar Dompdf
        $options = new Options();
        $options->set('isHtml5ParserEnabled', true);
        $options->set('isRemoteEnabled', true);

        $dompdf = new Dompdf($options);
        $dompdf->loadHtml($html);
        $dompdf->setPaper('A4', 'portrait'); // Tamaño y orientación

        // Generar el PDF
        $dompdf->render();

        // Enviar el PDF como descarga
        return $dompdf->stream('Reporte_Ventas.pdf', ['Attachment' => true]);
    }
    
    
    public function exportarReporteVentasExcel(Request $request)
    {
        // Capturar fechas y facturador
        $fechaInicio = $request->input('fecha_inicio', date('Y-m-d'));
        $fechaFin = $request->input('fecha_fin', date('Y-m-d'));
        $facturadorId = $request->input('facturador_id');
        $empresaId = auth()->user()->empresa_id;
    
        // Obtener facturadores asociados
        $facturadores = Facturador::where('empresa_id', $empresaId)->get();
        if (!$facturadorId && $facturadores->isNotEmpty()) {
            $facturadorId = $facturadores->first()->id;
        }
    
        // Consultar facturaciones
        $facturaciones = Facturacion::with(['cliente', 'paciente'])
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->when($facturadorId, function ($query) use ($facturadorId) {
                return $query->where('facturador_id', $facturadorId);
            })
            ->get();
    
        // Consultar notas de crédito
        $notasCredito = NotaCredito::with('facturacion')
            ->whereDate('fecha', '>=', $fechaInicio)
            ->whereDate('fecha', '<=', $fechaFin)
            ->whereHas('facturacion', function ($query) use ($facturadorId) {
                $query->when($facturadorId, function ($query) use ($facturadorId) {
                    return $query->where('facturador_id', $facturadorId);
                });
            })
            ->get();
    
        // Procesar notas de crédito y asociarlas a las facturaciones
        $notasCredito->each(function ($notaCredito) use ($facturaciones) {
            $facturacion = $notaCredito->facturacion; // Obtener la facturación original
            if ($facturacion) {
                $facturacion->nota_credito = $notaCredito;
                $facturacion->isNotaCredito = true;
    
                // El importe de las notas de crédito proviene de la facturación, ajustado a negativo
                //$facturacion->importe = -abs($facturacion->importe);
    
                // Marcar el estado como "Anulado con Nota de Crédito"
                $facturacion->estado = 'Anulado con Nota de Crédito';
    
                // Agregar a la colección principal
                $facturaciones->push($facturacion);
            }
        });
        // Ordenar todas las facturaciones (incluidas las notas de crédito) por fecha
        $facturaciones = $facturaciones->sortBy('fecha')->values();
        // Procesar las facturaciones
        $facturaciones->each(function ($facturacion) {
            // Determinar el estado del documento
            if ($facturacion->baja == 1 && !is_null($facturacion->ident)) {
                $facturacion->estado = 'Comunicación de Baja';
                //$facturacion->importe = -abs($facturacion->importe);
            } elseif (!isset($facturacion->estado)) {
                $facturacion->estado = 'Activo';
            }
    
            // Añadir datos del cliente o paciente
            if ($facturacion->t_doc_iden === "6") { // Si es RUC, buscar en clientes
                $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                if ($cliente) {
                    $facturacion->razon_social = strtoupper($cliente->rsocial);
                    $facturacion->direccion = strtoupper($cliente->direccion);
                } else {
                    return response()->json(['error' => 'Cliente no encontrado con este RUC'], 404);
                }
            } elseif ($facturacion->tipodoc === "03") { // Si es Boleta, buscar en pacientes primero
                $paciente = Paciente::where('tipodocumento', $facturacion->t_doc_iden)
                                    ->where('numerodoc', $facturacion->num_doc_iden)
                                    ->first();
            
                if ($paciente) {
                    $facturacion->razon_social = strtoupper($paciente->nombres . ' ' . $paciente->ape_paterno . ' ' . $paciente->ape_materno);
                    $facturacion->direccion = strtoupper($paciente->direccion ?? '');
                } else {
                    // Si no se encuentra en pacientes, buscar en la tabla de clientes
                    $cliente = Cliente::where('ruc', $facturacion->num_doc_iden)->first();
            
                    if ($cliente) {
                        $facturacion->razon_social = strtoupper($cliente->rsocial);
                        $facturacion->direccion = strtoupper($cliente->direccion);
                    } else {
                        return response()->json(['error' => 'No se encontró registro en pacientes ni clientes'], 404);
                    }
                }
            } else {
                return response()->json(['error' => 'Tipo de documento inválido'], 400);
            }
        });
    
        // Exportar los datos utilizando Maatwebsite Excel
        return Excel::download(new VentasExport($facturaciones, $fechaInicio, $fechaFin), 'Reporte_Ventas.xlsx');

    }
             
    public function generarXML(Request $request, $nroFactura)
    {
        // Obtener el parámetro 'tipo' de la solicitud
        $tipo = $request->query('tipo', 'normal');
        $serieNota = $request->input('serieNota', '');
        $numdocNota = $request->input('numdocNota', '');
        $fechaNota = $request->input('fechaActual', '');
        $motivo = $request->input('motivo', '');
        $facturadorId = $request->input('facturadorId');
        
        // Escribir en el log para ver el valor del facturador_id
        \Log::info('Valor del facturador_id recibido: ' . $facturadorId);
        // Obtener la factura según el número de factura
        $factura = DB::table('facturaciones')->where('id', $nroFactura)->first();

        if (!$factura) {
            return response()->json([
                'success' => false,
                'message' => 'Factura no encontrada.'
            ]);
        }

        // Obtener los detalles de facturación
        $detalle_facturacion = DB::table('detalle_facturacion')->where('facturaciones_id', $factura->id)->get();

        if (!$detalle_facturacion) {
            return response()->json([
                'success' => false,
                'message' => 'Factura no encontrada.'
            ]);
        }

        // Obtener nombres de tratamientos y procedimientos
        foreach ($detalle_facturacion as $detalle) {
            $detalle->tratamiento = DB::table('actividades')->where('id', $detalle->tratamiento_id)->first();
            $detalle->procedimiento = DB::table('servicios')->where('id', $detalle->procedimiento_id)->first();
        }

        // Hacemos la consulta a la tabla facturadores para obtener el registro con el id proporcionado
        $facturador = Facturador::find($facturadorId);
        if (!$facturador) {
            \Log::error('Facturador no encontrado para el ID: ' . $facturadorId);
            return response()->json([
                'success' => false,
                'message' => 'Facturador no encontrado.'
            ]);
        }
        \Log::info('Facturador encontrado: ' . $facturador->razon_social);
        // Datos del emisor
        $emisor = [
            'ruc' => $facturador->ruc,
            'razon_social' => $facturador->razon_social,
            'direccion' => $facturador->direccion,
            'nombre_comercial' => $facturador->nombre_comercial,
            'usuario_emisor' => $facturador->usuario_emisor,
            'clave_emisor' => $facturador->clave_emisor,
            'ubigeo_dpto' => $facturador->ubigeo_dpto,
            'ubigeo_provincia' => $facturador->ubigeo_provincia,
            'ubigeo_distrito' => $facturador->ubigeo_distrito,
        ];

        // Datos del comprobante
        $comprobante = [
            'tipo' => $factura->tipodoc,
            'serie' => $factura->serie,
            'correlativo' => $factura->numdoc,
            'fecha_emision' => Carbon::parse($factura->fecha)->format('Y-m-d'),
            'hora_emision' => Carbon::parse($factura->fecha)->format('H:i:s'),
        ];

        // Verificar y obtener el cliente desde la tabla 'clientes'
        $pacienteDB = DB::table('pacientes')->where('id', $factura->paciente_id)->first();
        if (!$pacienteDB) {
            return response()->json([
                'success' => false,
                'message' => 'Paciente no encontrado.'
            ]);
        }

        // Construcción de datos del cliente
        if ($factura->t_doc_iden === "6") { // Si el tipo de documento es RUC, buscar en clientes
            $clienteRUC = DB::table('clientes')->where('ruc', $factura->num_doc_iden)->first();

            if ($clienteRUC) {
                $cliente = [
                    'nombre' => strtoupper($clienteRUC->rsocial),
                    'documento' => $clienteRUC->ruc,
                    'direccion' => strtoupper($clienteRUC->direccion),
                    'tipo_documento' => '6', // RUC
                ];
            } else {
                return response()->json([
                    'success' => false,
                    'message' => 'Cliente con RUC no encontrado.'
                ]);
            }
        } else { // Si no es RUC, buscar primero en pacientes
            $pacienteDB = DB::table('pacientes')
                            ->where('tipodocumento', $factura->t_doc_iden)
                            ->where('numerodoc', $factura->num_doc_iden)
                            ->first();

            if ($pacienteDB) {
                $cliente = [
                    'nombre' => strtoupper($pacienteDB->nombres . ' ' . $pacienteDB->ape_paterno . ' ' . $pacienteDB->ape_materno),
                    'documento' => $pacienteDB->numerodoc,
                    'direccion' => strtoupper($pacienteDB->direccion),
                    'tipo_documento' => $pacienteDB->tipodocumento,
                ];
            } else {
                // Si no se encuentra en pacientes, buscar en clientes por el número de documento
                $clienteDB = DB::table('clientes')->where('ruc', $factura->num_doc_iden)->first();

                if ($clienteDB) {
                    $cliente = [
                        'nombre' => strtoupper($clienteDB->rsocial),
                        'documento' => $clienteDB->ruc,
                        'direccion' => strtoupper($clienteDB->direccion),
                        'tipo_documento' => $factura->t_doc_iden, // RUC
                    ];
                } else {
                    return response()->json([
                        'success' => false,
                        'message' => 'No se encontró registro en pacientes ni clientes.'
                    ]);
                }
            }
        }

        $total = $factura->importe;
        $subtotal = ($total / 1.18);
        $igv = $subtotal * 0.18;
        $total_convertir = number_format($total, 2, '.', '');
        $montoLiteral = $this->convertirNumerosALetras($total_convertir);

        // Determinar a qué función llamar
        if ($tipo === 'baja') {
            if ($comprobante['tipo'] === '01') {
                // Llamar a crearXML_Baja
                return $this->crearXML_Baja($emisor, $comprobante, $cliente, $nroFactura);
            } else if ($comprobante['tipo'] === '03') {
                return $this->crearXML_Resumen($emisor, $comprobante, $cliente, $nroFactura, $total, $igv, $subtotal);
            }
        } else if ($tipo === 'nota') {
            // Llamar a crearXML_Nota con datos adicionales de la nota
            return $this->crearXML_Nota($emisor, $comprobante, $cliente, $total, $igv, $subtotal, $montoLiteral, $nroFactura, $detalle_facturacion, $serieNota, $numdocNota, $fechaNota, $motivo);
        } else {
            // Llamar al método para crear el XML
            return $this->crearXML($emisor, $comprobante, $cliente, $total, $igv, $subtotal, $montoLiteral, $nroFactura, $detalle_facturacion);
        }
    }


    private function convertirNumerosALetras($numero)
    {
        $unidades = [
            '', 'uno', 'dos', 'tres', 'cuatro', 'cinco', 
            'seis', 'siete', 'ocho', 'nueve'
        ];
        $decenas = [
            1 => 'diez', 2 => 'veinte', 3 => 'treinta', 
            4 => 'cuarenta', 5 => 'cincuenta', 6 => 'sesenta', 
            7 => 'setenta', 8 => 'ochenta', 9 => 'noventa'
        ];
        $centenas = [
            '', 'cien', 'doscientos', 'trescientos', 'cuatrocientos',
            'quinientos', 'seiscientos', 'setecientos', 'ochocientos', 'novecientos'
        ];
        $especiales = [
            11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince',
            16 => 'dieciséis', 17 => 'diecisiete', 18 => 'dieciocho', 19 => 'diecinueve'
        ];
    
        // Separar la parte entera y los decimales
        $partes = explode('.', number_format($numero, 2, '.', ''));
        $entero = intval($partes[0]);
        $decimales = intval($partes[1]);
    
        // Convertir parte entera
        $resultado = $this->convertirParteEntera($entero, $unidades, $decenas, $centenas, $especiales);
    
        // Añadir los decimales como centavos
        $resultado .= " con " . str_pad($decimales, 2, '0', STR_PAD_LEFT) . "/100";
    
        return ucfirst($resultado);
    }
    
    private function convertirParteEntera($numero, $unidades, $decenas, $centenas, $especiales)
    {
        if ($numero == 0) {
            return "cero";
        }
    
        if ($numero >= 1000000) {
            $millones = floor($numero / 1000000);
            $resto = $numero % 1000000;
            return $this->convertirParteEntera($millones, $unidades, $decenas, $centenas, $especiales) . " millón" . 
                ($millones > 1 ? "es" : "") . 
                ($resto > 0 ? " " . $this->convertirParteEntera($resto, $unidades, $decenas, $centenas, $especiales) : "");
        }
    
        if ($numero >= 1000) {
            $miles = floor($numero / 1000);
            $resto = $numero % 1000;
            return ($miles > 1 ? $this->convertirParteEntera($miles, $unidades, $decenas, $centenas, $especiales) . " mil" : "mil") . 
                ($resto > 0 ? " " . $this->convertirParteEntera($resto, $unidades, $decenas, $centenas, $especiales) : "");
        }
    
        if ($numero >= 100) {
            $centena = floor($numero / 100);
            $resto = $numero % 100;
            return ($centena == 1 && $resto == 0 ? "cien" : $centenas[$centena]) . 
                ($resto > 0 ? " " . $this->convertirParteEntera($resto, $unidades, $decenas, $centenas, $especiales) : "");
        }
    
        if ($numero >= 10) {
            if ($numero <= 19) {
                return $especiales[$numero];
            }
    
            $decena = floor($numero / 10);
            $unidad = $numero % 10;
            return $decenas[$decena] . 
                ($unidad > 0 ? " y " . $unidades[$unidad] : "");
        }
    
        return $unidades[$numero];
    }
    

    public function crearXML($emisor, $comprobante, $cliente, $total, $igv, $subtotal, $montoLiteral, $nroFactura, $detalle_facturacion)
    {

    $xml = '<?xml version="1.0" encoding="UTF-8"?>
    <Invoice xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ccts="urn:un:unece:uncefact:documentation:2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:qdt="urn:oasis:names:specification:ubl:schema:xsd:QualifiedDatatypes-2" xmlns:udt="urn:un:unece:uncefact:data:specification:UnqualifiedDataTypesSchemaModule:2" xmlns="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2">
        <ext:UBLExtensions>
            <ext:UBLExtension>
                <ext:ExtensionContent/>
            </ext:UBLExtension>
        </ext:UBLExtensions>
        <cbc:UBLVersionID>2.1</cbc:UBLVersionID>
        <cbc:CustomizationID schemeAgencyName="PE:SUNAT">2.0</cbc:CustomizationID>
        <cbc:ProfileID schemeName="Tipo de Operacion" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo17">0101</cbc:ProfileID>
        <cbc:ID>' . $comprobante['serie'] . '-' . $comprobante['correlativo'] . '</cbc:ID>
        <cbc:IssueDate>' . $comprobante['fecha_emision'] . '</cbc:IssueDate>
        <cbc:IssueTime>' . $comprobante['hora_emision'] . '</cbc:IssueTime>
        <cbc:InvoiceTypeCode listAgencyName="PE:SUNAT" listName="Tipo de Documento" listURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo01" listID="0101" name="Tipo de Operacion">' . $comprobante['tipo'] . '</cbc:InvoiceTypeCode>
    <cbc:Note languageLocaleID="1000">' . $montoLiteral . '</cbc:Note>
        <cbc:DocumentCurrencyCode listID="ISO 4217 Alpha" listName="Currency" listAgencyName="United Nations Economic Commission for Europe">PEN</cbc:DocumentCurrencyCode>
        <cac:Signature>
            <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
            <cac:SignatoryParty>
                <cac:PartyIdentification>
                    <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
                </cac:PartyIdentification>
                <cac:PartyName>
                    <cbc:Name><![CDATA[' . $emisor['razon_social'] . ']]></cbc:Name>
                </cac:PartyName>
            </cac:SignatoryParty>
            <cac:DigitalSignatureAttachment>
                <cac:ExternalReference>
                    <cbc:URI>' . $emisor['ruc'] . '</cbc:URI>
                </cac:ExternalReference>
            </cac:DigitalSignatureAttachment>
        </cac:Signature>
        <cac:AccountingSupplierParty>
            <cac:Party>
                <cac:PartyIdentification>
                    <cbc:ID schemeID="6" schemeName="Documento de Identidad" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo06">' . $emisor['ruc'] . '</cbc:ID>
                </cac:PartyIdentification>
                <cac:PartyName>
                    <cbc:Name><![CDATA[' . $emisor['nombre_comercial'] . ']]></cbc:Name>
                </cac:PartyName>
                <cac:PartyLegalEntity>
                    <cbc:RegistrationName><![CDATA[' . $emisor['razon_social'] . ']]></cbc:RegistrationName>
                    <cac:RegistrationAddress>
                        <cbc:ID schemeName="Ubigeos" schemeAgencyName="PE:INEI">200104</cbc:ID>
                        <cbc:AddressTypeCode listAgencyName="PE:SUNAT" listName="Establecimientos anexos">0000</cbc:AddressTypeCode>
                        <cbc:CityName><![CDATA[' . $emisor['ubigeo_dpto'] . ']]></cbc:CityName>
                        <cbc:CountrySubentity><![CDATA[' . $emisor['ubigeo_provincia'] . ']]></cbc:CountrySubentity>
                        <cbc:District><![CDATA[' . $emisor['ubigeo_distrito'] . ']]></cbc:District>
                        <cac:AddressLine>
                            <cbc:Line><![CDATA[' . $emisor['direccion'] .']]></cbc:Line>
                        </cac:AddressLine>
                        <cac:Country>
                            <cbc:IdentificationCode listID="ISO 3166-1" listAgencyName="United Nations Economic Commission for Europe" listName="Country">PE</cbc:IdentificationCode>
                        </cac:Country>
                    </cac:RegistrationAddress>
                </cac:PartyLegalEntity>
            </cac:Party>
        </cac:AccountingSupplierParty>
        <cac:AccountingCustomerParty>
            <cac:Party>
                <cac:PartyIdentification>
                    <cbc:ID schemeID="' . $cliente['tipo_documento'] . '" schemeName="Documento de Identidad" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo06">' . $cliente['documento'] . '</cbc:ID>
                </cac:PartyIdentification>
                <cac:PartyLegalEntity>
                    <cbc:RegistrationName><![CDATA[' . $cliente['nombre'] . ']]></cbc:RegistrationName>
                </cac:PartyLegalEntity>
            </cac:Party>
        </cac:AccountingCustomerParty>
    <cac:PaymentTerms>
        <cbc:ID>FormaPago</cbc:ID>
        <cbc:PaymentMeansID>Contado</cbc:PaymentMeansID>
    </cac:PaymentTerms>	
        <!-- Inicio Tributos cabecera-->
    <cac:TaxTotal>
            <cbc:TaxAmount currencyID="PEN">' . number_format($igv, 2, '.', '') . '</cbc:TaxAmount>
            <cac:TaxSubtotal>
                <cbc:TaxableAmount currencyID="PEN">' . number_format($subtotal, 2, '.', '') . '</cbc:TaxableAmount>
                <cbc:TaxAmount currencyID="PEN">' . number_format($igv, 2, '.', '') . '</cbc:TaxAmount>
                <cac:TaxCategory>
        <cac:TaxScheme>
        <cbc:ID schemeName="Codigo de tributos" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo05">1000</cbc:ID>
        <cbc:Name>IGV</cbc:Name>
        <cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
        </cac:TaxScheme>
        </cac:TaxCategory>
            </cac:TaxSubtotal>			
        </cac:TaxTotal>
        <!-- Fin Tributos  Cabecera-->
        <cac:LegalMonetaryTotal>
            <cbc:LineExtensionAmount currencyID="PEN">' . number_format($subtotal, 2, '.', '') . '</cbc:LineExtensionAmount>
            <cbc:TaxInclusiveAmount currencyID="PEN">' . number_format($total, 2, '.', '') . '</cbc:TaxInclusiveAmount>
            <cbc:PayableAmount currencyID="PEN">' . number_format($total, 2, '.', '') . '</cbc:PayableAmount>
        </cac:LegalMonetaryTotal>';
        $contador_de_carrito = 1; // Inicialización del contador

        foreach ($detalle_facturacion as $detalle) {
            $descripcion = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
            $subtotal_unitario = $detalle->importe / 1.18;
            $igv_unitario = $subtotal_unitario * 0.18;
            
                    // Generación de XML para cada ítem
                $xml .= '<cac:InvoiceLine>
                <cbc:ID>' . $contador_de_carrito . '</cbc:ID>
                <cbc:InvoicedQuantity unitCode="NIU">1</cbc:InvoicedQuantity>
                <cbc:LineExtensionAmount currencyID="PEN">' . number_format($subtotal_unitario, 2, '.', '') . '</cbc:LineExtensionAmount>
                <cac:PricingReference>
                    <cac:AlternativeConditionPrice>
                        <cbc:PriceAmount currencyID="PEN">' . number_format($detalle->importe, 2, '.', '') . '</cbc:PriceAmount>
                        <cbc:PriceTypeCode listName="Tipo de Precio" listAgencyName="PE:SUNAT" listURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo16">01</cbc:PriceTypeCode>
                    </cac:AlternativeConditionPrice>
                </cac:PricingReference>
                <cac:TaxTotal>
                    <cbc:TaxAmount currencyID="PEN">' . number_format($igv_unitario, 2, '.', '') . '</cbc:TaxAmount>
                    <cac:TaxSubtotal>
                        <cbc:TaxableAmount currencyID="PEN">' . number_format($subtotal_unitario, 2, '.', '') . '</cbc:TaxableAmount>
                        <cbc:TaxAmount currencyID="PEN">' . number_format($igv_unitario, 2, '.', '') . '</cbc:TaxAmount>
                        <cac:TaxCategory>
                            <cbc:Percent>18</cbc:Percent>
                            <cbc:TaxExemptionReasonCode>10</cbc:TaxExemptionReasonCode>
                            <cac:TaxScheme>
                                <cbc:ID>1000</cbc:ID>
                                <cbc:Name>IGV</cbc:Name>
                                <cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
                            </cac:TaxScheme>
                        </cac:TaxCategory>
                    </cac:TaxSubtotal>
                </cac:TaxTotal>
                <cac:Item>
                    <cbc:Description>
                        <![CDATA[' . $descripcion . ']]>
                    </cbc:Description>
                    <cac:SellersItemIdentification>
                        <cbc:ID>-</cbc:ID>
                    </cac:SellersItemIdentification>
                    <cac:CommodityClassification>
                        <cbc:ItemClassificationCode>-</cbc:ItemClassificationCode>
                    </cac:CommodityClassification>
                </cac:Item>
                <cac:Price>
                    <cbc:PriceAmount currencyID="PEN">' . number_format(($detalle->importe / 1.18), 2, '.', '') . '</cbc:PriceAmount>
                </cac:Price>
            </cac:InvoiceLine>';
            $contador_de_carrito++; // Incremento del contador
        }
        $xml .= '</Invoice>';    

        // Generar la ruta completa para el archivo XML en 'public/sunat/xml'
        // Ruta completa del archivo XML en la carpeta pública
        $nombrexml = public_path('sunat_files/xml/') . $emisor['ruc'] . '-' . $comprobante['tipo'] . '-' . $comprobante['serie'] . '-' . $comprobante['correlativo'] . '.xml';
        $nombreArchivo = $emisor['ruc'] . '-' . $comprobante['tipo'] . '-' . $comprobante['serie'] . '-' . $comprobante['correlativo'] . '.xml';
        // Guardar el archivo XML
        file_put_contents($nombrexml, $xml);

         // Verificar si el archivo fue guardado correctamente
        if (file_exists($nombrexml)) {
            // Instanciar la clase SunatService
            $sunatService = new SunatService();

            // Llamar al método firmarYEnviar
            $nroVenta = $nroFactura;
            $resultado = $sunatService->firmarYEnviar($nombreArchivo, $nroVenta, $emisor);

            // Retornar la respuesta de SUNAT
            return response()->json([
                'success' => $resultado['success'],
                'message' => $resultado['message'],
                'file_path' => asset('sunat_files/xml/' . basename($nombrexml)) // Devuelve la URL pública del archivo
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Hubo un problema al guardar el archivo XML.'
            ]);
        }
    }    
    public function crearXML_Baja($emisor, $comprobante, $cliente, $nroFactura)
    {
    // Paso 1: Extraer y formatear la fecha
    $fecha_emision = $comprobante['fecha_emision']; // Asumiendo que la fecha está en el formato 'yyyy-mm-dd'
    // Paso 1: Obtener y formatear la fecha actual
    $fecha_actual_format = date('Y-m-d'); // Formatear a 'yyyymmdd'
    $fecha_actual = date('Ymd'); // Formatear a 'yyyymmdd'

    // Paso 2: Buscar el máximo número correlativo en la base de datos
    $ident_base = 'RA-' . $fecha_actual . '-';
    $max_ident = DB::table('facturaciones')
                   ->where('ident', 'LIKE', $ident_base . '%')
                   ->max(DB::raw('CAST(SUBSTRING(ident, LENGTH("' . $ident_base . '") + 1) AS UNSIGNED)'));

    // Paso 3: Asignar el siguiente número correlativo o el número 1
    $correlativo = $max_ident ? $max_ident + 1 : 1;
    $identificador = $ident_base . $correlativo;
    // Paso 4: Actualizar ident y fecha_baja en la base de datos
    \DB::table('facturaciones')
        ->where('id', $nroFactura)
        ->update([
            'ident' => $identificador,
            'fecha_baja' => date('Y-m-d') // Formatear la fecha actual a 'yyyy-mm-dd'
        ]);

    $xml = '<?xml version="1.0" encoding="UTF-8"?>
    <VoidedDocuments xmlns="urn:sunat:names:specification:ubl:peru:schema:xsd:VoidedDocuments-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" xmlns:ds="http://www.w3.org/2000/09/xmldsig#">
    <ext:UBLExtensions>
            <ext:UBLExtension>
                <ext:ExtensionContent/>
            </ext:UBLExtension>
        </ext:UBLExtensions>
        <cbc:UBLVersionID>2.0</cbc:UBLVersionID>
        <cbc:CustomizationID schemeAgencyName="PE:SUNAT">1.0</cbc:CustomizationID>
        <cbc:ID>' . $identificador . '</cbc:ID>
        <cbc:ReferenceDate>' . $fecha_emision . '</cbc:ReferenceDate>
        <cbc:IssueDate>' . $fecha_actual_format . '</cbc:IssueDate>
        <cac:Signature>
            <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
            <cac:SignatoryParty>
                <cac:PartyIdentification>
                    <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
                </cac:PartyIdentification>
                <cac:PartyName>
                    <cbc:Name><![CDATA[' . $emisor['razon_social'] . ']]></cbc:Name>
                </cac:PartyName>
            </cac:SignatoryParty>
            <cac:DigitalSignatureAttachment>
                <cac:ExternalReference>
                    <cbc:URI>' . $emisor['ruc'] . '</cbc:URI>
                </cac:ExternalReference>
            </cac:DigitalSignatureAttachment>
        </cac:Signature>
        <cac:AccountingSupplierParty>
            <cbc:CustomerAssignedAccountID><![CDATA[' . $emisor['ruc'] . ']]></cbc:CustomerAssignedAccountID>    
            <cbc:AdditionalAccountID>6</cbc:AdditionalAccountID>
            <cac:Party>
                <cac:PartyLegalEntity>
                    <cbc:RegistrationName><![CDATA[' . $emisor['razon_social'] . ']]></cbc:RegistrationName>
                </cac:PartyLegalEntity>
            </cac:Party>
        </cac:AccountingSupplierParty>
        <sac:VoidedDocumentsLine>
            <cbc:LineID>1</cbc:LineID>
            <cbc:DocumentTypeCode>01</cbc:DocumentTypeCode>
            <sac:DocumentSerialID>' . $comprobante['serie'] . '</sac:DocumentSerialID>
            <sac:DocumentNumberID>' . $comprobante['correlativo'] . '</sac:DocumentNumberID>
            <sac:VoidReasonDescription><![CDATA[ERROR DE SISTEMA]]></sac:VoidReasonDescription>
        </sac:VoidedDocumentsLine>
    </VoidedDocuments>';
        

        // Generar la ruta completa para el archivo XML en 'public/sunat/xml'
        // Ruta completa del archivo XML en la carpeta pública
        $nombrexml = public_path('sunat_files/xml/') . $emisor['ruc'] . '-' . $identificador . '.xml';
        $nombreArchivo = $emisor['ruc'] . '-' . $identificador . '.xml';
        // Guardar el archivo XML
        file_put_contents($nombrexml, $xml);

         // Verificar si el archivo fue guardado correctamente
        if (file_exists($nombrexml)) {
            // Instanciar la clase SunatService
            $sunatService = new SunatService();

            // Llamar al método firmarYEnviar
            $nroVenta = $nroFactura;
            $resultado = $sunatService->firmarYEnviar_Baja($nombreArchivo, $nroVenta, $emisor);

            // Retornar la respuesta de SUNAT
            return response()->json([
                'success' => $resultado['success'],
                'message' => $resultado['message'],
                'file_path' => asset('sunat_files/xml/' . basename($nombrexml)) // Devuelve la URL pública del archivo
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Hubo un problema al guardar el archivo XML.'
            ]);
        }
    }

    public function crearXML_Resumen($emisor, $comprobante, $cliente, $nroFactura, $total, $igv, $subtotal)
    {
         // Verificar si ya existe un ticket_baja para la factura
        $factura = DB::table('facturaciones')->where('id', $nroFactura)->first();
    
        if ($factura && !empty($factura->ticket_baja)) {
            // Si ya hay un ticket_baja, consultar el estado en SUNAT en lugar de enviarlo nuevamente
            $sunatService = new SunatService();
            $estado = $sunatService->consultarEstadoSunat($factura->ticket_baja, $emisor);
    
            // Si la consulta devuelve 98 (en proceso), devolver la respuesta sin procesar
            if ($estado == '98') {
                return response()->json([
                    'success' => true,
                    'message' => 'El ticket ya existe y aún está en proceso.',
                    'estado_sunat' => $estado
                ]);
            }
            $nombreXmlBaja = $emisor['ruc'] . '-' . $factura->ident . '.xml';
            // Si la respuesta no es 98, proceder a procesarla
            return $sunatService->procesarRespuestaSunatBaja($estado, $nombreXmlBaja, $nroFactura);
        }
        // Paso 1: Extraer y formatear la fecha
        $fecha_emision = $comprobante['fecha_emision']; // Asumiendo que la fecha está en el formato 'yyyy-mm-dd'
        // Paso 1: Obtener y formatear la fecha actual
        $fecha_actual_format = date('Y-m-d'); // Formatear a 'yyyymmdd'
        $fecha_actual = date('Ymd'); // Formatear a 'yyyymmdd'

        // Paso 2: Buscar el máximo número correlativo en la base de datos
        $ident_base = 'RC-' . $fecha_actual . '-';
        $max_ident = DB::table('facturaciones')
                    ->where('ident', 'LIKE', $ident_base . '%')
                    ->max(DB::raw('CAST(SUBSTRING(ident, LENGTH("' . $ident_base . '") + 1) AS UNSIGNED)'));

        // Paso 3: Asignar el siguiente número correlativo o el número 1
        $correlativo = $max_ident ? $max_ident + 1 : 1;
        $identificador = $ident_base . $correlativo;
        // Paso 4: Actualizar ident y fecha_baja en la base de datos
        \DB::table('facturaciones')
            ->where('id', $nroFactura)
            ->update([
                'ident' => $identificador,
                'fecha_baja' => date('Y-m-d') // Formatear la fecha actual a 'yyyy-mm-dd'
            ]);

            $xml = '<?xml version="1.0" encoding="utf-8"?>
            <SummaryDocuments xmlns="urn:sunat:names:specification:ubl:peru:schema:xsd:SummaryDocuments-1" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1">
                <ext:UBLExtensions>
                    <ext:UBLExtension>
                        <ext:ExtensionContent/>
                    </ext:UBLExtension>
                </ext:UBLExtensions>
                <cbc:UBLVersionID>2.0</cbc:UBLVersionID>
                <cbc:CustomizationID>1.1</cbc:CustomizationID>
                <cbc:ID>' . $identificador . '</cbc:ID>
                <cbc:ReferenceDate>'. $fecha_emision . '</cbc:ReferenceDate>
                <cbc:IssueDate>' . $fecha_actual_format . '</cbc:IssueDate>
                <cac:Signature>
                    <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
                    <cac:SignatoryParty>
                    <cac:PartyIdentification>
                        <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
                    </cac:PartyIdentification>
                    <cac:PartyName>
                        <cbc:Name><![CDATA[' . $emisor['razon_social'] . ']]></cbc:Name>
                    </cac:PartyName>
                    </cac:SignatoryParty>
                    <cac:DigitalSignatureAttachment>
                    <cac:ExternalReference>
                        <cbc:URI>' . $emisor['ruc'] . '</cbc:URI>
                    </cac:ExternalReference>
                    </cac:DigitalSignatureAttachment>
                </cac:Signature>
                <cac:AccountingSupplierParty>
                    <cbc:CustomerAssignedAccountID>' . $emisor['ruc'] . '</cbc:CustomerAssignedAccountID>
                    <cbc:AdditionalAccountID>6</cbc:AdditionalAccountID>
                    <cac:Party>
                        <cac:PartyLegalEntity>
                            <cbc:RegistrationName><![CDATA[' . $emisor['razon_social'] . ']]></cbc:RegistrationName>
                        </cac:PartyLegalEntity>
                    </cac:Party>
                </cac:AccountingSupplierParty>
                 <!-- Boleta anulada -->
                <sac:SummaryDocumentsLine>
                    <cbc:LineID>1</cbc:LineID>
                    <cbc:DocumentTypeCode>03</cbc:DocumentTypeCode>
                    <cbc:ID>' . $comprobante['serie'] . '-' . $comprobante['correlativo'] . '</cbc:ID>
                    <cac:AccountingCustomerParty>
                        <cbc:CustomerAssignedAccountID>' . $cliente['documento'] . '</cbc:CustomerAssignedAccountID>
                        <cbc:AdditionalAccountID>' . $cliente['tipo_documento'] . '</cbc:AdditionalAccountID>
                    </cac:AccountingCustomerParty>
                    <cac:Status>
                        <cbc:ConditionCode>3</cbc:ConditionCode>
                    </cac:Status>
                    <sac:TotalAmount currencyID="PEN">' . number_format($total, 2, '.', '') . '</sac:TotalAmount>
                    <sac:BillingPayment>
                        <cbc:PaidAmount currencyID="PEN">' . number_format($subtotal, 2, '.', '') . '</cbc:PaidAmount>
                        <cbc:InstructionID>01</cbc:InstructionID>
                    </sac:BillingPayment>
                    <cac:TaxTotal>
                        <cbc:TaxAmount currencyID="PEN">' . number_format($igv, 2, '.', '') . '</cbc:TaxAmount>
                        <cac:TaxSubtotal>
                            <cbc:TaxAmount currencyID="PEN">' . number_format($igv, 2, '.', '') . '</cbc:TaxAmount>
                            <cac:TaxCategory>
                                <cac:TaxScheme>
                                    <cbc:ID>1000</cbc:ID>
                                    <cbc:Name>IGV</cbc:Name>
                                    <cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
                                </cac:TaxScheme>
                            </cac:TaxCategory>
                        </cac:TaxSubtotal>
                    </cac:TaxTotal>
                </sac:SummaryDocumentsLine>
            </SummaryDocuments>';

            // Generar la ruta completa para el archivo XML en 'public/sunat/xml'
        // Ruta completa del archivo XML en la carpeta pública
        $nombrexml = public_path('sunat_files/xml/') . $emisor['ruc'] . '-' . $identificador . '.xml';
        $nombreArchivo = $emisor['ruc'] . '-' . $identificador . '.xml';
        // Guardar el archivo XML
        file_put_contents($nombrexml, $xml);

         // Verificar si el archivo fue guardado correctamente
        if (file_exists($nombrexml)) {
            // Instanciar la clase SunatService
            $sunatService = new SunatService();

            // Llamar al método firmarYEnviar
            $nroVenta = $nroFactura;
            $resultado = $sunatService->firmarYEnviar_Baja($nombreArchivo, $nroVenta, $emisor);

            // Retornar la respuesta de SUNAT
            return response()->json([
                'success' => $resultado['success'],
                'message' => $resultado['message'],
                'file_path' => asset('sunat_files/xml/' . basename($nombrexml)) // Devuelve la URL pública del archivo
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Hubo un problema al guardar el archivo XML.'
            ]);
        }

    }

    public function crearXML_Nota($emisor, $comprobante, $cliente, $total, $igv, $subtotal, $montoLiteral, $nroFactura, $detalle_facturacion, $serieNota, $numdocNota, $fechaNota, $motivo)
    {
        // Formatear fechaNota a yyyy-mm-dd
        $fechaNotaFormatted = Carbon::createFromFormat('d/m/Y', $fechaNota)->format('Y-m-d');
        // Crear una variable con la hora actual
        $horaActual = Carbon::now()->format('H:i:s');

        $xml = '<?xml version="1.0" encoding="UTF-8"?>
        <CreditNote xmlns="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2">
            <ext:UBLExtensions>
                <ext:UBLExtension>
                    <ext:ExtensionContent/>
                </ext:UBLExtension>
            </ext:UBLExtensions>
            <cbc:UBLVersionID>2.1</cbc:UBLVersionID>
            <cbc:CustomizationID schemeAgencyName="PE:SUNAT">2.0</cbc:CustomizationID>
            <cbc:ID>' . $serieNota . '-' . $numdocNota . '</cbc:ID>
            <cbc:IssueDate>' . $fechaNotaFormatted . '</cbc:IssueDate>
            <cbc:IssueTime>' . $horaActual . '</cbc:IssueTime>
          <cbc:Note languageLocaleID="1000">' . $montoLiteral . '</cbc:Note>
            <cbc:DocumentCurrencyCode listID="ISO 4217 Alpha" listName="Currency" listAgencyName="United Nations Economic Commission for Europe">PEN</cbc:DocumentCurrencyCode>
                <cac:DiscrepancyResponse> <cbc:ReferenceID>' . $comprobante['serie'] . '-' . $comprobante['correlativo'] . '</cbc:ReferenceID>
                    <cbc:ResponseCode>01</cbc:ResponseCode> <cbc:Description>ANULACION DE DOCUMENTO</cbc:Description>
                </cac:DiscrepancyResponse> 
          <cac:BillingReference> 
            <cac:InvoiceDocumentReference>
                <cbc:ID>' . $comprobante['serie'] . '-' . $comprobante['correlativo'] . '</cbc:ID> 
                <cbc:DocumentTypeCode>' . $comprobante['tipo'] . '</cbc:DocumentTypeCode>
            </cac:InvoiceDocumentReference>
          </cac:BillingReference> 
            <cac:Signature>
                <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
                <cac:SignatoryParty>
                    <cac:PartyIdentification>
                        <cbc:ID>' . $emisor['ruc'] . '</cbc:ID>
                    </cac:PartyIdentification>
                    <cac:PartyName>
                        <cbc:Name><![CDATA[' . $emisor['razon_social'] . ']]></cbc:Name>
                    </cac:PartyName>
                </cac:SignatoryParty>
                <cac:DigitalSignatureAttachment>
                    <cac:ExternalReference>
                        <cbc:URI>' . $emisor['ruc'] . '</cbc:URI>
                    </cac:ExternalReference>
                </cac:DigitalSignatureAttachment>
            </cac:Signature>
            <cac:AccountingSupplierParty>
                <cac:Party>
                    <cac:PartyIdentification>
                        <cbc:ID schemeID="6" schemeName="Documento de Identidad" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo06">' . $emisor['ruc'] . '</cbc:ID>
                    </cac:PartyIdentification>
                    <cac:PartyName>
                        <cbc:Name><![CDATA[' . $emisor['nombre_comercial'] . ']]></cbc:Name>
                    </cac:PartyName>
                    <cac:PartyLegalEntity>
                        <cbc:RegistrationName><![CDATA[' . $emisor['razon_social'] . ']]></cbc:RegistrationName>
                        <cac:RegistrationAddress>
                            <cbc:ID schemeName="Ubigeos" schemeAgencyName="PE:INEI">200104</cbc:ID>
                            <cbc:AddressTypeCode listAgencyName="PE:SUNAT" listName="Establecimientos anexos">0000</cbc:AddressTypeCode>
                            <cbc:CityName><![CDATA[' . $emisor['ubigeo_dpto'] . ']]></cbc:CityName>
                            <cbc:CountrySubentity><![CDATA[' . $emisor['ubigeo_provincia'] . ']]></cbc:CountrySubentity>
                            <cbc:District><![CDATA[' . $emisor['ubigeo_distrito'] . ']]></cbc:District>
                            <cac:AddressLine>
                                <cbc:Line><![CDATA[' . $emisor['direccion'] . ']]></cbc:Line>
                            </cac:AddressLine>
                            <cac:Country>
                                <cbc:IdentificationCode listID="ISO 3166-1" listAgencyName="United Nations Economic Commission for Europe" listName="Country">PE</cbc:IdentificationCode>
                            </cac:Country>
                        </cac:RegistrationAddress>
                    </cac:PartyLegalEntity>
                </cac:Party>
            </cac:AccountingSupplierParty>
            <cac:AccountingCustomerParty>
                <cac:Party>
                    <cac:PartyIdentification>
                        <cbc:ID schemeID="' . $cliente['tipo_documento'] . '" schemeName="Documento de Identidad" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo06">' . $cliente['documento'] . '</cbc:ID>
                    </cac:PartyIdentification>
                    <cac:PartyLegalEntity>
                        <cbc:RegistrationName><![CDATA[' . $cliente['nombre'] . ']]></cbc:RegistrationName>
                    </cac:PartyLegalEntity>
                </cac:Party>
            </cac:AccountingCustomerParty>
           <!-- Inicio Tributos cabecera-->
    <cac:TaxTotal>
            <cbc:TaxAmount currencyID="PEN">' . number_format($igv, 2, '.', '') . '</cbc:TaxAmount>
            <cac:TaxSubtotal>
                <cbc:TaxableAmount currencyID="PEN">' . number_format($subtotal, 2, '.', '') . '</cbc:TaxableAmount>
                <cbc:TaxAmount currencyID="PEN">' . number_format($igv, 2, '.', '') . '</cbc:TaxAmount>
                <cac:TaxCategory>
        <cac:TaxScheme>
        <cbc:ID schemeName="Codigo de tributos" schemeAgencyName="PE:SUNAT" schemeURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo05">1000</cbc:ID>
        <cbc:Name>IGV</cbc:Name>
        <cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
        </cac:TaxScheme>
        </cac:TaxCategory>
            </cac:TaxSubtotal>			
        </cac:TaxTotal>
        <!-- Fin Tributos  Cabecera-->
        <cac:LegalMonetaryTotal>
            <cbc:LineExtensionAmount currencyID="PEN">' . number_format($subtotal, 2, '.', '') . '</cbc:LineExtensionAmount>
            <cbc:TaxInclusiveAmount currencyID="PEN">' . number_format($total, 2, '.', '') . '</cbc:TaxInclusiveAmount>
            <cbc:PayableAmount currencyID="PEN">' . number_format($total, 2, '.', '') . '</cbc:PayableAmount>
        </cac:LegalMonetaryTotal>';
        $contador_de_carrito = 1; // Inicialización del contador

        foreach ($detalle_facturacion as $detalle) {
            $descripcion = $detalle->tratamiento->nombre . ' - ' . $detalle->procedimiento->nombre;
            $subtotal_unitario = $detalle->importe / 1.18;
            $igv_unitario = $subtotal_unitario * 0.18;
            
                    // Generación de XML para cada ítem
                $xml .= '<cac:CreditNoteLine>
                <cbc:ID>' . $contador_de_carrito . '</cbc:ID>
                <cbc:CreditedQuantity unitCode="NIU">1</cbc:CreditedQuantity>
                <cbc:LineExtensionAmount currencyID="PEN">' . number_format($subtotal_unitario, 2, '.', '') . '</cbc:LineExtensionAmount>
                <cac:PricingReference>
                    <cac:AlternativeConditionPrice>
                        <cbc:PriceAmount currencyID="PEN">' . number_format($detalle->importe, 2, '.', '') . '</cbc:PriceAmount>
                        <cbc:PriceTypeCode listName="Tipo de Precio" listAgencyName="PE:SUNAT" listURI="urn:pe:gob:sunat:cpe:see:gem:catalogos:catalogo16">01</cbc:PriceTypeCode>
                    </cac:AlternativeConditionPrice>
                </cac:PricingReference>
                <cac:TaxTotal>
                    <cbc:TaxAmount currencyID="PEN">' . number_format($igv_unitario, 2, '.', '') . '</cbc:TaxAmount>
                    <cac:TaxSubtotal>
                        <cbc:TaxableAmount currencyID="PEN">' . number_format($subtotal_unitario, 2, '.', '') . '</cbc:TaxableAmount>
                        <cbc:TaxAmount currencyID="PEN">' . number_format($igv_unitario, 2, '.', '') . '</cbc:TaxAmount>
                        <cac:TaxCategory>
                            <cbc:Percent>18</cbc:Percent>
                            <cbc:TaxExemptionReasonCode>10</cbc:TaxExemptionReasonCode>
                            <cac:TaxScheme>
                                <cbc:ID>1000</cbc:ID>
                                <cbc:Name>IGV</cbc:Name>
                                <cbc:TaxTypeCode>VAT</cbc:TaxTypeCode>
                            </cac:TaxScheme>
                        </cac:TaxCategory>
                    </cac:TaxSubtotal>
                </cac:TaxTotal>
                <cac:Item>
                    <cbc:Description>
                        <![CDATA[' . $descripcion . ']]>
                    </cbc:Description>
                    <cac:SellersItemIdentification>
                        <cbc:ID>-</cbc:ID>
                    </cac:SellersItemIdentification>
                    <cac:CommodityClassification>
                        <cbc:ItemClassificationCode>-</cbc:ItemClassificationCode>
                    </cac:CommodityClassification>
                </cac:Item>
                <cac:Price>
                    <cbc:PriceAmount currencyID="PEN">' . number_format(($detalle->importe / 1.18), 2, '.', '') . '</cbc:PriceAmount>
                </cac:Price>
            </cac:CreditNoteLine>';
            $contador_de_carrito++; // Incremento del contador
        }
        
        $xml .= '</CreditNote>';
        // Generar la ruta completa para el archivo XML en 'public/sunat/xml'
        // Ruta completa del archivo XML en la carpeta pública
        $nombrexml = public_path('sunat_files/xml/') . $emisor['ruc'] . '-07-' . $serieNota . '-' . $numdocNota . '.xml';
        $nombreArchivo = $emisor['ruc'] . '-07-' . $serieNota . '-' . $numdocNota . '.xml';
        // Guardar el archivo XML
        file_put_contents($nombrexml, $xml);

         // Verificar si el archivo fue guardado correctamente
        if (file_exists($nombrexml)) {
            // Instanciar la clase SunatService
            $sunatService = new SunatService();

            // Llamar al método firmarYEnviar
            $nroVenta = $nroFactura;
            $resultado = $sunatService->firmarYEnviar_Nota($nombreArchivo, $nroVenta, $emisor);

            // Retornar la respuesta de SUNAT
            return response()->json([
                'success' => $resultado['success'],
                'message' => $resultado['message'],
                'file_path' => asset('sunat_files/xml/' . basename($nombrexml)) // Devuelve la URL pública del archivo
            ]);
        } else {
            return response()->json([
                'success' => false,
                'message' => 'Hubo un problema al guardar el archivo XML.'
            ]);
        }
    }
}

