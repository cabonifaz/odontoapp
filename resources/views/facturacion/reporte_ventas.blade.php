@extends('adminlte::page')

@section('title', 'Reporte de Ventas - Vitaldentis')
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
         <!-- Filtro de Fechas -->
         <form id="filtro-form" class="mb-3" method="GET" action="{{ route('reporte.ventas') }}">
            <div class="row">
                <div class="col-md-4">
                    <label for="facturador_id">Empresa Facturador</label>
                    <select id="facturador_id" name="facturador_id" class="form-control" style="font-size: 14px; font-weight: bold; background-color: #ffeb3b;" onchange="actualizarRuc()">
                        <option value="" disabled {{ !$facturadorId ? 'selected' : '' }}>Seleccione una empresa</option>
                        @foreach ($facturadores as $facturador)
                            <option value="{{ $facturador->id }}" data-ruc="{{ $facturador->ruc }}" {{ $facturadorId == $facturador->id ? 'selected' : '' }}>
                                {{ $facturador->razon_social }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-2">
                    <label for="fecha_inicio">Fecha Inicio</label>
                    <input 
                        type="date" 
                        id="fecha_inicio" 
                        name="fecha_inicio" 
                        class="form-control" 
                        value="{{ $fechaInicio }}" 
                        required
                    >
                </div>
                <div class="col-md-2">
                    <label for="fecha_fin">Fecha Fin</label>
                    <input 
                        type="date" 
                        id="fecha_fin" 
                        name="fecha_fin" 
                        class="form-control" 
                        value="{{ $fechaFin }}" 
                        required
                    >
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary rounded-pill w-100">
                        <i class="fas fa-search"></i> Filtrar
                    </button>
                </div>
                <div class="col-md-1 d-flex align-items-end">
                    <button 
                        type="button" 
                        id="ver-pdf" 
                        class="btn rounded-pill w-100" 
                        style="background-color: #f28b82; color: white;" 
                        onclick="window.open('{{ route('reporte.ventas.pdf', ['fecha_inicio' => $fechaInicio, 'fecha_fin' => $fechaFin, 'facturador_id' => $facturadorId]) }}', '_blank');">
                        <i class="fas fa-file-pdf"></i> PDF
                    </button>
                </div>
                <div class="col-md-1 d-flex align-items-end">
                    <button 
                        type="button" 
                        id="excel" 
                        class="btn rounded-pill w-100" 
                        style="background-color:rgb(55, 110, 68); color: white;" 
                        onclick="window.open('{{ route('reporte.ventas.excel', ['fecha_inicio' => $fechaInicio, 'fecha_fin' => $fechaFin, 'facturador_id' => $facturadorId]) }}', '_blank');">
                        <i class="fas fa-file-excel"></i> XLS
                    </button>
                </div>
            </div>
        </form>

        <div class="table-responsive">
            <!-- Tabla de Resultados -->
            <table id="boletosTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Fecha</th>
                        <th style="width: 100px;">Nro de Documento</th>
                        <th style="width: 180px;">Cliente</th>
                        <th class="text-end">Importe</th>
                        <th class="text-center">Medio de Pago</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Fecha de Baja/Nota</th>
                    </tr>
                </thead>
                <tbody id="tabla-boletos">
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
                            <td class="text-end">{{ number_format($facturacion->importe, 2) }}</td>
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
                        <td colspan="4" class="text-end" style="font-size: 24px;"><strong>Total:</strong></td>
                        <td class="text-end" style="font-size: 24px;"><strong>{{ number_format($totalImporte, 2) }}</strong></td>
                        <td colspan="3"></td>
                    </tr>
                </tfoot>
            </table>
        </div>        
    </div>
</div>

@endsection

@section('js')

    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function() {
            $('#boletosTable').DataTable({
                order: [], // Evita el ordenamiento automático por la primera columna
                language: {
                    "sEmptyTable": "No hay datos disponibles en la tabla",
                    "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                    "sInfoEmpty": "Mostrando 0 a 0 de 0 entradas",
                    "sInfoFiltered": "(filtrado de _MAX_ entradas totales)",
                    "sLengthMenu": "Mostrar _MENU_ entradas",
                    "sLoadingRecords": "Cargando...",
                    "sProcessing": "Procesando...",
                    "sSearch": "Buscar:",
                    "sZeroRecords": "No se encontraron resultados",
                    "oPaginate": {
                        "sFirst": "Primero",
                        "sLast": "Último",
                        "sNext": "Siguiente",
                        "sPrevious": "Anterior"
                    },
                    "oAria": {
                        "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                        "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                    }
                }
            });
        });


    </script>
    

@endsection

@section('css')
<style>

    /* Estilo de hover para las filas del cuerpo de la tabla */
    .table tbody tr:hover {
        background-color: #b1fdb7;
    }

    .text-end {
        text-align: right !important;
    }
    .text-center {
        text-align: center !important;
    }
    .dataTables_length select {
            border-radius: 50px;
            padding: 5px 5px;
        }
        .form-control {
        border-radius: 20px;
        border: 1px solid #ced4da;
        padding: 10px 15px;
    }

    .list-group {
        max-height: 200px;
        overflow-y: auto;
    }

    input:focus, select:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
    }

    button {
        transition: all 0.3s;
    }

    button:hover {
        transform: translateY(-2px);
    }

    .custom-button {
        width: 35px; /* Ajusta el ancho según tus necesidades */
        height: 30px; /* Ajusta la altura según tus necesidades */
        padding: 0; /* Asegúrate de que no haya relleno adicional */
    }
    .custom-button img {
        width: 20px; /* Ajusta el tamaño del ícono según tus necesidades */
        height: 20px; /* Ajusta el tamaño del ícono según tus necesidades */
    }
    .anulado {
        color: red; /* El texto de las filas anuladas será rojo */
        
    }

    .text-danger {
        font-weight: bold; /* Resalta el texto anulado */
    }
    #boletosTable tbody td,
    #boletosTable thead th {
        font-size: 0.85rem; /* Tamaño de letra reducido */
        padding-top: 4px;
        padding-bottom: 4px;
        line-height: 1.2;
    }
</style>
@stop
