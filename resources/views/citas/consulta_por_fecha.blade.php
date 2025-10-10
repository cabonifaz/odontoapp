@extends('adminlte::page')

@section('title', 'Consulta de Citas - Mundo Systems')

@section('content')
<div class="container-fluid">
    <h2 class="mt-4">Buscar Citas</h2>

    <form action="{{ route('citas.buscar') }}" method="POST">
        @csrf
        <div class="row mb-3">
            <div class="col-md-2">
                <label for="fecha_inicio" class="form-label">Fecha Inicio:</label>
                <input type="date" id="fecha_inicio" name="fecha_inicio" class="form-control" 
                    value="{{ old('fecha_inicio', $fecha_inicio ?? now()->format('Y-m-d')) }}" required>
            </div>
            <div class="col-md-2">
                <label for="fecha_fin" class="form-label">Fecha Fin:</label>
                <input type="date" id="fecha_fin" name="fecha_fin" class="form-control" 
                    value="{{ old('fecha_fin', $fecha_fin ?? now()->format('Y-m-d')) }}" required>
            </div>
            <div class="col-md-2 d-flex align-items-end">
                <button class="btn btn-primary" id="btn-buscar" type="submit">
                    <i class="fas fa-search"></i> Buscar
                </button>
            </div>
        </div>
    </form>

    @if(isset($citas) && $citas->count() > 0)
    <div class="table-responsive">
        <table id="citasTable" class="table table-bordered table-striped">
            <thead class="thead-light">
                <tr>
                    <th scope="col">Paciente</th>
                    <th scope="col">Fecha de Cita</th>
                    <th scope="col">Hora Inicio</th>
                    <th scope="col">Hora Fin</th>
                    <th scope="col">Médico</th>
                    <th scope="col">Servicio</th>
                    <th scope="col">Creado</th>
                    <th scope="col">Actualizado</th>
                    <th scope="col">Registrado Por</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($citas as $cita)
                    <tr>
                        <td>{{ $cita->nombre_paciente }}</td>
                        <td>{{ \Carbon\Carbon::parse($cita->fecha_cita)->format('d/m/Y') }}</td>
                        <td>{{ \Carbon\Carbon::parse($cita->hora_inicio)->format('H:i') }}</td>
                        <td>{{ \Carbon\Carbon::parse($cita->hora_fin)->format('H:i') }}</td>
                        <td>{{ $cita->nombre_medico }}</td>
                        <td>{{ $cita->nombre }}</td>
                        <td>{{ \Carbon\Carbon::parse($cita->created_at)->format('d/m/Y H:i') }}</td>
                        <td>{{ \Carbon\Carbon::parse($cita->updated_at)->format('d/m/Y H:i') }}</td>
                        <td>{{ $cita->name }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
    @else
        <p>No se encontraron citas para el rango de fechas seleccionado.</p>
    @endif
</div>
@endsection

@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<style>
        /* Estilo de hover para las filas del cuerpo de la tabla */
        .table tbody tr:hover {
        background-color: #b1fdb7;
        }
</style>
@endsection

@section('js')
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    $(document).ready(function() {
        $('#citasTable').DataTable({
            "language": {
                "url": "//cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json"
            },
            "ordering": false
        });

        // Setear la fecha mínima de 'fecha_fin' al valor de 'fecha_inicio'
        $('#fecha_inicio').on('change', function() {
            let fechaInicio = $(this).val();
            $('#fecha_fin').attr('min', fechaInicio);

            // Validar que la fecha fin no sea menor que la fecha inicio
            let fechaFin = $('#fecha_fin').val();
            if (fechaFin < fechaInicio) {
                Swal.fire({
                    icon: 'error',
                    title: 'Fecha inválida',
                    text: 'La fecha fin no puede ser menor que la fecha inicio.',
                });
                $('#fecha_fin').val(''); // Limpiar el campo de fecha fin
            }
        });

        // Al hacer clic en buscar, verificar que fecha fin no sea menor que fecha inicio
        $('#btn-buscar').on('click', function(e) {
            let fechaInicio = $('#fecha_inicio').val();
            let fechaFin = $('#fecha_fin').val();
            if (fechaFin < fechaInicio) {
                e.preventDefault();
                Swal.fire({
                    icon: 'error',
                    title: 'Fecha inválida',
                    text: 'La fecha fin no puede ser menor que la fecha inicio.',
                });
            }
        });
    });
</script>
@endsection
