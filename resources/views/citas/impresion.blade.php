<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Impresión de Agenda - Vitaldentis</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 90%;
            border-collapse: collapse;
            margin: 0 auto;
            font-size: 12px;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }

        /* Estilos de fondo para las celdas */
        th {
            background-color: #add8e6; /* Azul claro para la cabecera de los médicos */
        }

        td.time-cell {
            background-color: #f0f0f0; /* Fondo gris claro para la columna de horas */
        }

        td.booked {
            background-color: #d1ffd1; /* Verde claro para las citas reservadas */
        }

        td.libre {
            background-color: white; /* Rojo claro para los espacios libres */
        }

        /* Asegura que sólo se impriman los elementos necesarios */
        @media print {
            body {
                font-size: 10px;
            }
            .no-print {
                display: none;
            }
        }
        .button-container {
            text-align: right; /* Alinear el botón a la derecha */
            margin-top: 20px;
            margin-right: 65px;
        }
        .no-print {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
        }

        .no-print:hover {
            background-color: #0056b3; /* Color más oscuro al pasar el cursor */
        }
    </style>
</head>
<body>
<h2>Agenda del {{ $fechaFormateada }}</h2>

<div class="button-container">
    <button class="no-print" onclick="window.print()">Imprimir</button>
</div>

<table>
    <thead>
    <tr>
        <th>Hora</th>
        @foreach ($medicosDatos as $medico)
            <th>{{ $medico['nombre_medico'] }}</th>
        @endforeach
    </tr>
    </thead>
    <tbody>
    @php
        $rowsWithCitas = [];
    @endphp

    @for ($hour = 8; $hour < 22; $hour++)
        @for ($minute = 0; $minute < 60; $minute += 30)
            @php
                // Formatear el tiempo como HH:MM
                $time = str_pad($hour, 2, '0', STR_PAD_LEFT) . ":" . str_pad($minute, 2, '0', STR_PAD_LEFT);
                $hasCitas = false;
                $rowContent = [];
            @endphp
            @foreach ($medicosDatos as $medico)
                @php
                    $cita = $citasDatos->filter(function ($cita) use ($time, $medico) {
                        // Obtener hora de inicio en formato H:i
                        $horaInicio = \Carbon\Carbon::parse($cita->hora_inicio)->format('H:i');
                        return $cita->id_medico == $medico->id && $horaInicio == $time;
                    })->first();
                @endphp
                @if ($cita)
                    @php
                        $hoy = new \DateTime();
                        $fecha_nacimiento = new \DateTime($cita->paciente->fecha_nacimiento);
                        $edad = $hoy->diff($fecha_nacimiento)->y;
                        $abreviaturaServicio = $cita->servicio->abreviatura;
                        $rowContent[$medico->id] = '<td class="booked">' .
                            $cita->paciente->nombres . ' ' . $cita->paciente->ape_paterno . ' ' . $cita->paciente->ape_materno . '<br>' .
                            '(' . $edad . ' años)<br>' .
                            $abreviaturaServicio .
                            '</td>';
                        $hasCitas = true;
                    @endphp
                @else
                    @php
                        $rowContent[$medico->id] = '<td class=""></td>';
                    @endphp
                @endif
            @endforeach

            {{-- @if ($hasCitas) --}}
                <tr>
                    <td class="time-cell">{{ $time }}</td>
                    @foreach ($medicosDatos as $medico)
                        {!! $rowContent[$medico->id] !!}
                    @endforeach
                </tr>
            {{-- @endif --}}
        @endfor
    @endfor
    </tbody>
</table>

</body>
</html>
