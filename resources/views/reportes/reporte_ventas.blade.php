@extends('adminlte::page')

@section('title', 'Reporte de Ventas - Mundo System')

@section('content_header')
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="mb-0">Reporte de Ventas</h1>
        </div>
    </div>
</div>
@stop

@section('content')
<div class="card">
    <div class="card-body">
         <!-- Filtro -->
         <form id="filtro-form" class="mb-3" method="GET" action="{{ route('reportes.reporte-ventas-medico') }}">
            <div class="row g-2">
                <!-- Empresa Facturador -->
                <div class="col-md-3">
                    <label for="facturador_id">Empresa Facturador</label>
                    <select id="facturador_id" name="facturador_id" class="form-control" onchange="actualizarRuc()">
                        <option value="">Seleccione</option>
                        @foreach ($facturadores as $facturador)
                            <option value="{{ $facturador->id }}" {{ $facturadorId == $facturador->id ? 'selected' : '' }}>
                                {{ $facturador->razon_social }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Fechas -->
                <div class="col-md-2">
                    <label for="fecha_inicio">Fecha Inicio</label>
                    <input type="date" id="fecha_inicio" name="fecha_inicio" class="form-control" 
                           value="{{ $fechaInicio }}" required>
                </div>
                <div class="col-md-2">
                    <label for="fecha_fin">Fecha Fin</label>
                    <input type="date" id="fecha_fin" name="fecha_fin" class="form-control" 
                           value="{{ $fechaFin }}" required>
                </div>

                <!-- Médico -->
                <div class="col-md-2">
                    <label for="medico_id">Médico</label>
                    <select id="medico_id" name="medico_id" class="form-control">
                        <option value="">Todos</option>
                        @foreach ($medicos as $medico)
                            <option value="{{ $medico->id }}" {{ request('medico_id') == $medico->id ? 'selected' : '' }}>
                                {{ $medico->nombre_medico }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Tratamiento -->
                <div class="col-md-2">
                    <label for="tratamiento_id">Tratamiento</label>
                    <select id="tratamiento_id" name="tratamiento_id" class="form-control">
                        <option value="">Todos</option>
                        @foreach ($actividades as $actividad)
                            <option value="{{ $actividad->id }}" {{ request('tratamiento_id') == $actividad->id ? 'selected' : '' }}>
                                {{ $actividad->nombre }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Procedimiento -->
                <div class="col-md-2">
                    <label for="procedimiento_id">Procedimiento</label>
                    <select id="procedimiento_id" name="procedimiento_id" class="form-control">
                        <option value="">Todos</option>
                        @foreach ($servicios as $servicio)
                            <option value="{{ $servicio->id }}" {{ request('procedimiento_id') == $servicio->id ? 'selected' : '' }}>
                                {{ $servicio->nombre }}
                            </option>
                        @endforeach
                    </select>
                </div>

                <!-- Botones -->
                <div class="col-md-1 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary w-100">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <div class="col-md-1 d-flex align-items-end">
                    <a href="{{ route('reporte.ventas.pdf', request()->all()) }}" target="_blank" 
                       class="btn btn-danger w-100">
                        <i class="fas fa-file-pdf"></i>
                    </a>
                </div>
                <div class="col-md-1 d-flex align-items-end">
                    <a href="{{ route('reporte.ventas.excel', request()->all()) }}" target="_blank" 
                       class="btn btn-success w-100">
                        <i class="fas fa-file-excel"></i>
                    </a>
                </div>
            </div>
        </form>

        <!-- Tabla -->
        <div class="table-responsive">
            <table id="ventasTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Fecha</th>
                        <th>Doc</th>
                        <th>Cliente</th>
                        <th>Médico</th>
                        <th>Tratamiento</th>
                        <th>Procedimiento</th>
                        <th class="text-end">Importe</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($facturaciones as $i => $facturacion)
                        @foreach ($facturacion->detalles as $detalle)
                        <tr>
                            <td>{{ $i+1 }}</td>
                            <td>{{ $facturacion->fecha->format('d/m/Y H:i') }}</td>
                            <td>{{ $facturacion->serie }}-{{ $facturacion->numdoc }}</td>
                            <td>{{ $facturacion->paciente->nombre_completo }}</td>
                            <td>{{ $facturacion->medico?->nombre_medico }}</td>
                            <td>{{ $detalle->tratamiento?->nombre }}</td>
                            <td>{{ $detalle->procedimiento?->nombre }}</td>
                            <td class="text-end">{{ number_format($detalle->importe,2) }}</td>
                        </tr>
                        @endforeach
                    @endforeach
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="7" class="text-end fw-bold">Total:</td>
                        <td class="text-end fw-bold">{{ number_format($totalImporte, 2) }}</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
@endsection
@section('css')
    {{-- DataTables CSS --}}
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.5.0/css/responsive.bootstrap5.min.css">
    <style>
        /* Reducir tamaño de letra del DataTable */
table.dataTable {
    font-size: 13px;   /* Ajusta según lo necesites */
}

table.dataTable thead th,
table.dataTable tbody td {
    padding: 6px 8px; /* Reduce también el espaciado */
}

    </style>
@endsection

@section('js')
    {{-- DataTables JS --}}
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.5.0/js/responsive.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#ventasTable').DataTable({
                responsive: true,
                language: {
                    url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"
                },
                order: [[1, 'desc']], // ordenar por fecha
                pageLength: 25
            });
        });
    </script>
@endsection
