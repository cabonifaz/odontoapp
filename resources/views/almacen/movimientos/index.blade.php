@extends('adminlte::page')

@section('title', 'Movimientos de Almacén')

@section('content_header')
<div class="card card-outline card-primary mb-3">
    <div class="card-header d-flex justify-content-between align-items-center">
        <h3 class="card-title">Movimientos de Almacén</h3>
        <div class="ml-auto">
            <button class="btn btn-outline-soft-green px-4 mr-2" data-toggle="modal" data-target="#modalEntrada">
                ✅ Nueva Entrada
            </button>
            <button class="btn btn-outline-soft-orange px-4" data-toggle="modal" data-target="#modalSalida">
                🔻 Nueva Salida
            </button>
        </div>
    </div>
</div>
@stop

@section('content')
@if (session('success'))
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
@endif

@if (session('error'))
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        {{ session('error') }}
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
@endif

@if (session('warning'))
    <div class="alert alert-warning alert-dismissible fade show" role="alert">
        {{ session('warning') }}
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
@endif

<div class="card">
    <div class="card-body">
        <form method="GET" class="mb-3">
            <div class="row">
                <div class="col-md-2">
                    <label>Desde:</label>
                    <input type="date" name="desde" class="form-control rounded-pill" value="{{ $desde }}">
                </div>
                <div class="col-md-2">
                    <label>Hasta:</label>
                    <input type="date" name="hasta" class="form-control rounded-pill" value="{{ $hasta }}">
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary rounded-pill px-4">Filtrar</button>
                </div>
            </div>
        </form>

        <div class="table-responsive">
            <table id="movimientosTable" class="table table-hover">
                <thead class="thead-light">
                    <tr>
                        <th>Fecha</th>
                        <th>Producto</th>
                        <th style="text-align: center;">Tipo</th>
                        <th style="text-align: right;">Cantidad</th>
                        <th>Motivo</th>
                        <th style="text-align: right;">Stock Actual</th>
                        <th>Registrado por</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $stocks = []; // para llevar el acumulado por producto_id
                    @endphp

                    @foreach ($movimientos as $mov)
                        @php
                            $id = $mov->producto_id;

                            // Inicializar con 0 si es primera aparición
                            if (!isset($stocks[$id])) {
                                // Calcular el stock antes del rango
                                $stockAntes = \App\Models\MovimientoAlmacen::where('producto_id', $id)
                                    ->where('fecha', '<', $desde)
                                    ->get()
                                    ->reduce(function ($carry, $item) {
                                        return $item->tipo === 'entrada'
                                            ? $carry + $item->cantidad
                                            : $carry - $item->cantidad;
                                    }, 0);

                                $stocks[$id] = $stockAntes;
                            }

                            // Aplicar el movimiento actual
                            if ($mov->tipo === 'entrada') {
                                $stocks[$id] += $mov->cantidad;
                            } else {
                                $stocks[$id] -= $mov->cantidad;
                            }

                            $stockAcumulado = $stocks[$id];
                        @endphp

                        <tr class="{{ $stockAcumulado < $mov->producto->stock_minimo ? 'resalte-kardex' : '' }}">
                            <td>{{ \Carbon\Carbon::parse($mov->fecha)->format('d/m/Y') }}</td>
                            <td>{{ $mov->producto->nombre }}</td>
                            <td>
                                <span class="badge {{ $mov->tipo === 'entrada' ? 'badge-soft-green' : 'badge-soft-orange' }}">
                                    {{ ucfirst($mov->tipo) }}
                                </span>
                            </td>
                            <td class="text-end">{{ $mov->cantidad }}</td>
                            <td>{{ $mov->motivo }}</td>
                            <td class="text-end">
                                <span class="badge {{ $stockAcumulado < $mov->producto->stock_minimo ? 'badge-soft-red' : 'badge-secondary' }}">
                                    {{ $stockAcumulado }}
                                </span>
                            </td>
                            <td>{{ $mov->usuario->name }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- Modal Entrada -->
<div class="modal fade" id="modalEntrada" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-soft-green">
                <h5 class="modal-title">Registrar Entrada</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form method="POST" action="{{ route('movimientos.entrada') }}">
                @csrf
                <input type="hidden" name="tipo" value="entrada">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Producto</label>
                        <select name="entrada_producto_id" class="form-control select2" id="entrada_producto_id" required style="width: 100%">
                            @foreach ($productos as $p)
                                <option value="{{ $p->id }}">{{ $p->nombre }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Cantidad</label>
                            <input type="number" name="entrada_cantidad" class="form-control" min="1" required>
                        </div>
                        <div class="form-group col-md-8">
                            <label>Motivo</label>
                            <input type="text" name="entrada_motivo" class="form-control" placeholder="Ej. Compra" required>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- Modal Salida -->
<div class="modal fade" id="modalSalida" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-soft-orange">
                <h5 class="modal-title">Registrar Salida</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <form id="salidaForm" method="POST" action="{{ route('movimientos.salida') }}">
                @csrf
                <input type="hidden" name="tipo" value="salida">
                <div class="modal-body">
                    <div class="form-group">
                        <label>Producto</label>
                        <select name="salida_producto_id" class="form-control select2" id="salida_producto_id" required style="width: 100%">
                            @foreach ($productos as $p)
                                <option value="{{ $p->id }}" data-stock="{{ $p->stock }}">{{ $p->nombre }} (Stock: {{ $p->stock }})</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Cantidad</label>
                            <input type="number" name="salida_cantidad" id="salida_cantidad" class="form-control" min="1" required>
                        </div>
                        <div class="form-group col-md-8">
                            <label>Motivo</label>
                            <input type="text" name="salida_motivo" class="form-control" placeholder="Ej. Venta, Descarte..." required>
                        </div>
                    </div>
                    <div id="stockAlert" class="text-danger small d-none">⚠️ Stock insuficiente</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-danger" id="btnGuardarSalida">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

@stop

@section('css')
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" />
<style>
    .select2-container .select2-selection--single {
        height: 38px;
        padding: 6px 12px;
    }
    .select2-container {
        width: 100% !important;
    }

    /* Red suave para salida */
    /* Entrada (verde esmeralda suave) */
    .bg-soft-green {
        background-color: #d4edda !important;
        color: #155724 !important;
    }
    .badge-soft-green {
        background-color: #d4edda;
        color: #155724;
        font-weight: bold;
    }

    .btn-outline-soft-green {
        border-color: #28a745;
        color: #28a745;
        background-color: transparent;
        border-radius: 50px;
        transition: all 0.3s ease;
    }
    .btn-outline-soft-green:hover {
        background-color: #28a745;
        color: white;
    }

    /* Salida (naranja suave) */
    .bg-soft-orange {
        background-color: #ffe5b4 !important;
        color: #8a4b00 !important;
    }
    .badge-soft-orange {
        background-color: #ffe5b4;
        color: #8a4b00;
        font-weight: bold;
    }

    .btn-outline-soft-orange {
        border-color: #ff8c00;
        color: #ff8c00;
        background-color: transparent;
        border-radius: 50px;
        transition: all 0.3s ease;
    }
    .btn-outline-soft-orange:hover {
        background-color: #ff8c00;
        color: white;
    }
    /* Stock alineado a la derecha */
    #movimientosTable td:nth-child(6) {
        text-align: right;
    }
/* Stock alineado a la derecha */
    #movimientosTable td:nth-child(4) {
        text-align: right;
    }
    #movimientosTable td:nth-child(3) {
        text-align: center;
    }
    /* Fechas más angostas */
    input[type="date"] {
        max-width: 200px;
        font-size: 0.9rem;
    }

    /* DataTable texto más pequeño */
    table.dataTable td, table.dataTable th {
        font-size: 0.875rem !important;
    }
    .text-end {
        text-align: right !important;
    }
    .table tbody tr:hover {
        background-color: #b1fdb7;
    }
    .resalte-kardex {
        background-color: #fff0f0; /* rojo suave */
    }

</style>
@stop


@section('js')
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
<script>
    $(document).ready(function () {
        $('#movimientosTable').DataTable({
            order: [[0, 'desc']],
            language: {
                url: '//cdn.datatables.net/plug-ins/1.11.5/i18n/es-ES.json'
            }
        });

        // Inicializar select2 con dropdown dentro del modal
        $('#modalEntrada select.select2').select2({
            dropdownParent: $('#modalEntrada')
        });
        $('#modalSalida select.select2').select2({
            dropdownParent: $('#modalSalida')
        });

        // Validación en modal de salida
        $('#salida_producto_id, #salida_cantidad').on('change keyup', function () {
            const selected = $('#salida_producto_id option:selected');
            const stockDisponible = parseInt(selected.data('stock') || 0);
            const cantidad = parseInt($('#salida_cantidad').val()) || 0;

            if (cantidad > stockDisponible) {
                $('#stockAlert').removeClass('d-none');
                $('#btnGuardarSalida').prop('disabled', true);
            } else {
                $('#stockAlert').addClass('d-none');
                $('#btnGuardarSalida').prop('disabled', false);
            }
        });
    });

</script>
@stop
