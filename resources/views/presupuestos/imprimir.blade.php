<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Presupuesto de Tratamiento Médico</title>
    <style>
    body { font-family: Arial, sans-serif; line-height: 1.6; margin: 0; padding: 20px; }
    
    table { width: 100%; border-collapse: collapse; margin-top: 20px; }
    table, th, td { border: 1px solid #ddd; }
    th, td { padding: 10px; text-align: left; }
    .highlight { font-size: 1.5em; font-weight: bold; text-align: right; }
    .footer { text-align: center; margin-top: 50px; font-size: 0.9em; color: #555; }
    .estado { text-align: center; margin: 20px 0; font-size: 1.2em; font-weight: bold; }
    h1, h2 { 
            text-align: center; 
            margin: 0; /* Elimina los márgenes */
            padding: 0; /* Asegura que no haya relleno */
        }

        h1 {
            margin-bottom: 2px; /* Pequeño margen para separación mínima */
        }

        h2 {
            margin-top: 2px; /* Pequeño margen para evitar que se peguen demasiado */
        }

    /* Ajustes en la cabecera */
    .header {
        display: flex;
        align-items: center;
        justify-content: flex-start; /* Asegura que el contenido no se desplace */
        gap: 20px; /* Espacio entre el logo y los datos */
        margin-bottom: 20px;
    }
    
    .header .logo-cell img { 
        max-width: 120px; /* Ajuste del tamaño del logo */
        height: auto;
    }
    
    .header .info-cell { 
        flex: 1; /* Permite que la información use el espacio disponible */
        font-size: 14px;
        line-height: 1.4;
    }
    
    .header .info-cell b { 
        display: block;
        font-size: 16px;
        margin-bottom: 5px;
    }

    .header .info-cell p { 
        margin: 2px 0;
    }
</style>

</head>
<body>
    <div class="header">
        <div class="logo-cell">
            <img src="{{ $base64Logo }}" alt="Logo de la Clínica">
        </div>
        <div class="info-cell">
            <b>CONSULTORIOS DEL NORTE <br>
                CONSULTORIOS DEL NORTE S.A.C</b>
            AV. LIMA 987<br>
            PIURA - PIURA - PIURA<br>
            Tel. 969 999 999 | Email: consultoriosdelnorte@gmail.com
        </div>
    </div>

    <h1>Presupuesto de Tratamiento Médico</h1>
    <h2>{{ $presupuesto->paciente->nombres }} {{ $presupuesto->paciente->ape_paterno }} {{ $presupuesto->paciente->ape_materno }}</h2>
    <p><strong>Médico:</strong> {{ $presupuesto->medico->nombre_medico }}</p>
    <p><strong>Fecha de emisión:</strong> {{ $presupuesto->created_at->format('d/m/Y H:i') }}</p>

    @if($estado)
        <div class="estado">
            <strong>Estado:</strong> {{ $estado['estado'] }} 
            (Actualizado el {{ $estado['fecha']->format('d/m/Y H:i') }})
        </div>
    @endif

    <p class="highlight"><strong>Importe Total:</strong> S/ {{ number_format($presupuesto->importe, 2) }}</p>

    <table>
        <thead>
            <tr>
                <th>Tratamiento</th>
                <th style="text-align: right;">Precio</th>
                <th style="text-align: center;">Cant.</th>
                <th style="text-align: right;">Importe</th>
                <th>Procedimientos</th>
            </tr>
        </thead>
        <tbody style="font-size: 14px;">
            @foreach ($tratamientos as $tratamiento)
                <tr>
                    <td style="width: 40px;">{{ $tratamiento['nombre'] . ' ' . $tratamiento['detalle_pieza'] }}</td>
                    <td style="text-align: right; width: 80px;">S/ {{ number_format($tratamiento['precio'], 2) }}</td>
                    <td style="text-align: center;">{{ $tratamiento['cantidad'] }}</td>
                    <td style="text-align: right; width: 80px;">S/ {{ number_format(($tratamiento['precio'] * $tratamiento['cantidad']), 2) }}</td>
                    <td>
                        <ul>
                            @foreach ($tratamiento['procedimientos'] as $procedimiento)
                                <li>{{ $procedimiento }}</li>
                            @endforeach
                        </ul>
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>

    <p class="footer">Fecha de impresión: {{ now()->format('d/m/Y H:i:s') }}</p>
</body>
</html>
