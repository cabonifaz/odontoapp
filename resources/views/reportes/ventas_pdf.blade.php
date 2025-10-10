<html>
<head>
    <style>
        body { font-family: Arial, sans-serif; font-size: 10px; padding: 20px; }
        .titulo { text-align: center; font-size: 12px; font-weight: bold; margin-bottom: 20px; }
        .detalles { border-collapse: collapse; width: 100%; margin-top: 10px; table-layout: auto; }
        .detalles th {
            border: 1px solid black;
            padding: 5px;
            text-align: left;
            background-color: lightblue;
        }
        .detalles td { border: 1px solid black; padding: 5px; text-align: left; }
        .totales { text-align: right; font-weight: bold; }
        .logo-cell {
            width: 70px;
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
        .anulado {
            color: red; /* El texto de las filas anuladas será rojo */
            
        }

        .text-danger {
            font-weight: bold; /* Resalta el texto anulado */
        }
    </style>
</head>
<body>
    <table border="0">
        <tr>
            <td class="logo-cell">
                <img src="{{ $base64 }}" alt="Logo" style="max-width: 100px; height: auto; transform: scale(1.5);">
            </td>
            <td class="info-cell">
                <b>{{ $emisor['nombre_comercial'] }} <br>
                {{ $emisor['razon_social'] }}</b> <br>
                {{ $emisor['direccion'] }}<br>
                {{ $emisor['ubigeo_dpto'] }} - {{ $emisor['ubigeo_provincia'] }} - {{ $emisor['ubigeo_distrito'] }}<br>
                Tel. 969 999 999 | Email: consultoriosdelnorte@gmail.com
            </td>
        </tr>
    </table>

    <h2 class="titulo">Reporte de Ventas</h2>
    <p><strong>Fecha Inicio:</strong> {{ \Carbon\Carbon::parse($fechaInicio)->format('d/m/Y') }} |
        <strong>Fecha Fin:</strong> {{ \Carbon\Carbon::parse($fechaFin)->format('d/m/Y') }}</p>

    <table class="detalles">
        <thead>
            <tr>
                <th style="width: 5%;">#</th>
                <th style="width: 15%;">Fecha</th>
                <th style="width: 15%;">Documento</th>
                <th style="width: 25%;">Cliente</th>
                <th style="width: 10%; text-align: right;">Importe</th>
                <th style="width: 10%;">Medio de Pago</th>
                <th style="width: 10%;">Estado</th>
                <th style="width: 10%;">Fecha Baja/Nota</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($facturaciones as $index => $facturacion)
                @php
                    $esNotaCredito = isset($facturacion->isNotaCredito) && $facturacion->isNotaCredito;
                    $nombreOMostrar = $facturacion->paciente->ape_paterno . ' ' . $facturacion->paciente->ape_materno . ' ' . $facturacion->paciente->nombres;
                    if ($facturacion->ruc) {
                        $nombreOMostrar = $facturacion->razon_social;
                    }
                    // Determinar si es una fila anulada (Nota de Crédito o Comunicación de Baja)
                    $filaAnulada = $esNotaCredito || ($facturacion->baja == 1);
                @endphp
                <tr class="{{ $filaAnulada ? 'anulado' : '' }}">
                    <td>{{ $index + 1 }}</td>
                    <td>{{ \Carbon\Carbon::parse($esNotaCredito ? $facturacion->nota_credito->fecha : $facturacion->fecha)->format('d/m/Y H:i:s') }}</td>
                    <td>{{ $esNotaCredito ? $facturacion->nota_credito->serie . '-' . $facturacion->nota_credito->numdoc : $facturacion->serie . '-' . $facturacion->numdoc }}</td>
                    <td>{{ $nombreOMostrar }}</td>
                    <td style="text-align: right">{{ number_format($facturacion->importe, 2) }}</td>
                    <td class="text-center">
                        @if ($esNotaCredito)
                            No Aplica
                        @else
                            @switch($facturacion->medio_pago)
                                @case(1)
                                    Efectivo
                                    @break
                                @case(2)
                                    Tarjeta
                                    @break
                                @case(3)
                                    Yape
                                    @break
                                @case(4)
                                    Plin
                                    @break
                                @case(5)
                                    Transferencia
                                    @break
                                @default
                                    Desconocido
                            @endswitch
                        @endif
                    </td>
                    <td class="text-center">
                        @if ($esNotaCredito)
                            Activo
                        @else
                            @if ($facturacion->baja == 1)
                                @if ($facturacion->ident)
                                    Comunicación de Baja
                                @else
                                    Anulado con Nota de Crédito
                                @endif
                            @else
                                Activo
                            @endif
                        @endif
                    </td>
                    <td class="text-center">
                        @if ($esNotaCredito)
                            -
                        @else
                            @if ($facturacion->fecha_baja)
                                {{ \Carbon\Carbon::parse($facturacion->fecha_baja)->format('d/m/Y') }}
                            @else
                                -
                            @endif
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
        <tfoot>
            <tr>
                <td colspan="4" class="totales" style="text-align: right; font-size: 24px;">Total:</td>
                <td style="text-align: right; font-size: 24px;" class="totales">{{ number_format($totalImporte, 2) }}</td>
                <td colspan="3"></td>
            </tr>
        </tfoot>
    </table>
</body>
</html>
