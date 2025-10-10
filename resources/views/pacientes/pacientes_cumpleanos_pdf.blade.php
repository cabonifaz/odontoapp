<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pacientes Cumpleaños</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #ADD8E6;
        }
    </style>
</head>
<body>

    <h2 style="text-align: center;">PACIENTES QUE CUMPLEN AÑOS EN EL MES DE: {{ $mesNombre }}</h2>

    <table>
        <thead>
            <tr>
                <!-- Columna de contador -->
                <th>#</th>
                <th>Nombre del Paciente</th>
                <th>Historia</th>
                <th>Tipo Documento</th>
                <th>Nro Documento</th>
                <th>Teléfono</th>
                <th>Email</th>
                <th>Día</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($pacientes as $index => $paciente)
                <tr>
                    <!-- Columna de contador, sumando 1 al índice -->
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ $paciente->nombre_paciente }}</td>
                    <td>{{ $paciente->historia }}</td>
                    <td>
                        @if ($paciente->tipodocumento == 1)
                            DNI
                        @elseif ($paciente->tipodocumento == 4)
                            CEX
                        @elseif ($paciente->tipodocumento == 0)
                            Desconocido
                        @else
                            Otro
                        @endif
                    </td>
                    <td>{{ $paciente->numerodoc }}</td>
                    <td>{{ $paciente->telefono }}</td>
                    <td>{{ $paciente->email }}</td>
                    <td>{{ $paciente->fecha_nacimiento }}</td>
                </tr>
            @endforeach
        </tbody>
    </table>

</body>
</html>
