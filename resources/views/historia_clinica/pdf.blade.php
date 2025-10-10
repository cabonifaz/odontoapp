<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Historia Clínica</title>
    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 12px;
            color: #333;
        }

        h2, h4 {
            color: #00529B;
            border-bottom: 1px solid #ccc;
            padding-bottom: 4px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            margin: 0 0 10px 0;
        }

        ul li {
            margin-bottom: 5px;
        }

        .odontograma {
            text-align: center;
            margin-top: 10px;
        }

         .odontograma-section {
            page-break-inside: avoid;
            page-break-before: auto;
            margin-bottom: 30px;
        }

        .odontograma img {
            max-width: 100%;
            border: 1px solid #ccc;
            padding: 10px;
            background: #fff;
        }

        h4 {
            margin-top: 0;
        }
        .table-2cols {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        .table-2cols td {
            width: 50%;
            vertical-align: top;
            padding: 4px 6px;
        }

        .label {
            font-weight: bold;
            display: inline-block;
            margin-right: 5px;
        }

        .yes {
            color: green;
            font-weight: bold;
        }

        .no {
            color: red;
            font-weight: bold;
        }
        .campo-valor {
            display: block;
            margin-bottom: 5px;
        }

        .campo-valor .label {
            font-weight: bold;
            color: #333;
        }

        .campo-valor .text {
            display: inline-block;
            margin-top: 2px;
        }
    .section {
        margin-bottom: 25px;
        page-break-inside: avoid;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        font-size: 12px;
    }

    th, td {
        border: 1px solid #ccc;
        padding: 6px;
        text-align: left;
    }

    th {
        background-color: #f0f0f0;
    }

    .page-break-inside-avoid {
        page-break-inside: avoid;
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
                CONSULTORIOS DEL NORTE SAC</b><br>
            AV. LIMA 987<br>
            PIURA - PIURA - PIURA<br>
            Tel. 999 999 999 | Email: consultoriosdelnorte@gmail.com
        </div>
    </div>
<h2>Historia Clínica</h2>

<div class="section">
    <h4>Datos Generales</h4>
    <table width="100%" cellpadding="4" cellspacing="0" style="border-collapse: collapse;">
        <tr>
            <td><strong>Nombres Completos:</strong></td>
            <td colspan="5">{{ $historia->paciente->nombres }} {{ $historia->paciente->ape_paterno }} {{ $historia->paciente->ape_materno }}</td>
        </tr>
        <tr>
            <td><strong>Tipo Documento:</strong></td>
            <td>
                @php
                    $tipoDoc = $historia->paciente->tipodocumento;
                @endphp
                {{ $tipoDoc == '1' ? 'DNI' : ($tipoDoc == '4' ? 'CEX' : 'Otro') }}
            </td>
            <td><strong>Número:</strong></td>
            <td>{{ $historia->paciente->numerodoc }}</td>
            <td><strong>Historia:</strong></td>
            <td>{{ $historia->paciente->historia }}</td>
        </tr>
        <tr>
            <td><strong>Fecha Nac.:</strong></td>
            <td>{{ \Carbon\Carbon::parse($historia->paciente->fecha_nacimiento)->format('d/m/Y') }}</td>
            <td><strong>Edad:</strong></td>
            <td>{{ \Carbon\Carbon::parse($historia->paciente->fecha_nacimiento)->age }} años</td>
            <td><strong>Teléfono:</strong></td>
            <td>{{ $historia->paciente->telefono }}</td>
        </tr>
        <tr>
            <td><strong>Profesión/Ocupación:</strong></td>
            <td>{{ $historia->paciente->profesion }}</td>
            <td><strong>Sexo:</strong></td>
            <td>
                @php $sexo = $historia->paciente->sexo; @endphp
                {{ $sexo == 1 ? 'Masculino' : ($sexo == 2 ? 'Femenino' : 'No especificado') }}
            </td>
            <td><strong>Estado Civil:</strong></td>
            <td>
                @php
                    $estado = $historia->paciente->cod_estciv;
                    $estados = [1 => 'Soltero', 2 => 'Casado', 3 => 'Divorciado', 4 => 'Viudo'];
                @endphp
                {{ $estados[$estado] ?? 'Desconocido' }}
            </td>
        </tr>
        <tr>
            <td><strong>Dirección:</strong></td>
            <td>{{ $historia->paciente->direccion }}</td>
            <td><strong>Nacionalidad:</strong></td>
            <td>
                @php $nac = $historia->paciente->nacionalidad; @endphp
                {{ $nac == 1 ? 'Peruano' : ($nac == 2 ? 'Extranjero' : 'Desconocido') }}
            </td>
            <td><strong>País Procedencia:</strong></td>
            <td>{{ $historia->paciente->pais_procedencia }}</td>
        </tr>
    </table>
</div>


<div class="section">
    <h4>Enfermedades</h4>
    <table width="100%" cellpadding="4" cellspacing="0">
        @foreach ($enfermedades->chunk(4) as $fila)
            <tr>
                @foreach ($fila as $e)
                    <td>&#10004; {{ $e->nombre }}</td> {{-- ✔ --}}
                @endforeach
                {{-- Rellenar las celdas vacías si hay menos de 4 en la fila --}}
                @for ($i = $fila->count(); $i < 4; $i++)
                    <td></td>
                @endfor
            </tr>
        @endforeach
    </table>
</div>
<div class="section">
    <h4>Antecedentes Médicos</h4>
    <table class="table-2cols">
        @php
            $datosGenerales = [];
            foreach ($camposGenerales as $campo => $label) {
                $valor = $historia->$campo;
                if (!is_null($valor) && $valor !== '') {
                    $datosGenerales[$campo] = [
                        'label' => $label,
                        'valor' => $valor
                    ];
                }
            }
            $pares = array_chunk($datosGenerales, 2, true);
        @endphp

        @foreach ($pares as $par)
            <tr>
                @foreach ($par as $campo => $data)
                    <td>
                        <div class="campo-valor">
                            <strong class="label">➤ {{ $data['label'] }}:</strong><br>
                            @php $val = strtolower(trim($data['valor'])); @endphp
                            @if (in_array($val, ['1', 'si', 'sí', 'true']))
                                <span class="yes">✔ Sí</span>
                            @elseif (in_array($val, ['0', 'no', 'false']))
                                <span class="no">✖ No</span>
                            @else
                                <span class="text">{{ $data['valor'] }}</span>
                            @endif
                        </div>
                    </td>
                @endforeach

                @if (count($par) < 2)
                    <td></td>
                @endif
            </tr>
        @endforeach
    </table>
</div>
<div class="section">
    <h4>Datos Dentales</h4>
    <table class="table-2cols">
       @php
            $datosDentales = [];
            foreach ($camposDentales as $campo => $label) {
                $valor = $historia->$campo;
                if (!is_null($valor) && $valor !== '') {
                    $datosDentales[$campo] = [
                        'label' => $label,
                        'valor' => $valor
                    ];
                }
            }
            $pares = array_chunk($datosDentales, 2, true);
        @endphp
        @foreach ($pares as $par)
            <tr>
                @foreach ($par as $campo => $data)
                    <td>
                        <div class="campo-valor">
                            <strong class="label">➤ {{ $data['label'] }}:</strong><br>
                            @php $val = strtolower(trim($data['valor'])); @endphp
                            @if (in_array($val, ['1', 'si', 'sí', 'true']))
                                <span class="yes">✔ Sí</span>
                            @elseif (in_array($val, ['0', 'no', 'false']))
                                <span class="no">✖ No</span>
                            @else
                                <span class="text">{{ $data['valor'] }}</span>
                            @endif
                        </div>
                    </td>
                @endforeach
                @if (count($par) < 2)
                    <td></td>
                @endif
            </tr>
        @endforeach
    </table>
</div>

@if($citas && count($citas) > 0)
    <div class="section page-break-inside-avoid">
        <h4 style="margin-top: 20px;">Citas</h4>
        <table width="100%" border="1" cellspacing="0" cellpadding="5">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Médico</th>
                    <th>Servicio</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($citas as $cita)
                    <tr>
                        <td>{{ \Carbon\Carbon::parse($cita->fecha_cita)->format('d/m/Y') }}</td>
                        <td>{{ $cita->hora_inicio }} - {{ $cita->hora_fin }}</td>
                        <td>{{ $cita->nombre_medico }}</td>
                        <td>{{ $cita->nombre }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endif

@if($evolucion && count($evolucion) > 0)
    <h4 style="margin-top: 20px;">Evolución del Tratamiento</h4>
    <table width="100%" border="1" cellspacing="0" cellpadding="5">
        <thead>
            <tr>
                <th>Fecha</th>
                <th>Tratamiento</th>
                <th>Próxima Cita</th>
            </tr>
        </thead>
        <tbody>
            @foreach($evolucion as $item)
                <tr>
                    <td>{{ \Carbon\Carbon::parse($item['fecha_historia'])->format('d/m/Y') }}</td>
                    <td>{{ $item['tratamiento'] ?? '-' }}</td>
                    <td>
                        @if($item['fecha_cita'] && $item['hora_inicio'])
                            {{ \Carbon\Carbon::parse($item['fecha_cita'])->format('d/m/Y') . ' ' . substr($item['hora_inicio'], 0, 5) }}
                        @else
                            -
                        @endif
                    </td>
                </tr>
            @endforeach
        </tbody>
    </table>
@endif

<div class="section odontograma-section">
    <br>
    <h4>Odontograma</h4>
    <div class="odontograma">
        <img src="{{ $odontogramaImg }}" alt="Odontograma">
    </div>
</div>

</body>
</html>
