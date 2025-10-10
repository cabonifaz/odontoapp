@extends('adminlte::page')

@section('title', 'Productos - Almacén')

@section('content_header')
<div class="card mb-1">
    <div class="card-header">
        <div class="row align-items-center">
            <div class="col">
                <h5 class="mb-0">📦 Productos del Almacén</h5>
            </div>
            <div class="col-auto">
                @can('Crear')
                <button type="button" class="btn btn-success rounded-pill px-4" data-toggle="modal" data-target="#createProductoModal">
                    🆕 Nuevo Producto
                </button>
                @endcan
                 <a href="{{ route('productos_almacen.export_stock_minimo') }}" class="btn btn-outline-success rounded-pill px-4">
                    🧾 Exportar Stock Mínimo
                </a>
            </div>
        </div>
    </div>
</div>

@stop

@section('content')
<div class="card">
    <div class="card-body">
        @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show">
                {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert">&times;</button>
            </div>
        @endif

        <div class="table-responsive">
            <table id="productosTable" class="table table-striped table-sm small">
                <thead class="bg-light">
                    <tr>
                        <th>Nombre</th>
                        <th>Presentación</th>
                        <th>Fecha Ingreso</th>
                        <th>Stock</th>
                        <th>Stock Mínimo</th>
                        <th>Precio Compra</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($productos as $producto)
                        <tr class="{{ $producto->stock <= $producto->stock_minimo ? 'bg-light-danger' : '' }}">
                            <td>{{ $producto->nombre }}</td>
                            <td>{{ $producto->presentacion }}</td>
                            <td>{{ \Carbon\Carbon::parse($producto->fecha_ingreso)->format('d/m/Y') }}</td>
                            
                            <!-- Stock -->
                            <td class="text-end">
                                @if ($producto->stock < $producto->stock_minimo)
                                    <span class="badge bg-danger px-2 py-1" style="font-size: 0.95rem;">⚠ {{ $producto->stock }}</span>
                                @else
                                    <span class="px-2 d-inline-block" style="font-size: 0.95rem;">{{ $producto->stock }}</span>
                                @endif
                            </td>

                            <!-- Stock mínimo -->
                            <td class="text-end">
                                <span class="badge bg-warning text-dark px-2 py-1" style="font-size: 0.85rem;">{{ $producto->stock_minimo }}</span>
                            </td>

                            <!-- Precio -->
                            <td class="text-end">S/ {{ number_format($producto->precio_compra, 2) }}</td>

                            <!-- Acciones -->
                            <td class="text-center">
                                @can('Modificar')
                                <button class="btn btn-sm btn-outline-primary edit-btn" data-id="{{ $producto->id }}" title="Editar">✏️</button>
                                @endcan
                                @can('Eliminar')
                                <form action="{{ route('productos_almacen.destroy', $producto->id) }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="button" class="btn btn-sm btn-outline-danger delete-btn" title="Eliminar">🗑️</button>
                                </form>
                                @endcan
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>

@include('almacen.productos.modals.create')
@include('almacen.productos.modals.edit')
@stop

@section('js')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
$(document).ready(function() {
    $('#productosTable').DataTable({
        language: {
            url: "//cdn.datatables.net/plug-ins/1.13.6/i18n/es-ES.json"
        }
    });

    $('.edit-btn').click(function () {
        const id = $(this).data('id');
        fetch(`/productos_almacen/${id}/edit`)
            .then(res => res.json())
            .then(data => {
                $('#editProductoForm').attr('action', `/productos_almacen/${id}`);
                $('#edit_producto_id').val(data.id);
                $('#edit_nombre').val(data.nombre);
                $('#edit_presentacion').val(data.presentacion);
                $('#edit_fecha_ingreso').val(data.fecha_ingreso);
                $('#edit_stock').val(data.stock);
                $('#edit_stock_minimo').val(data.stock_minimo);
                $('#edit_precio_compra').val(data.precio_compra);
                $('#editProductoModal').modal('show');
            });
    });

    $('.delete-btn').click(function (e) {
        e.preventDefault();
        const form = $(this).closest('form');
        Swal.fire({
            title: '¿Estás seguro?',
            text: 'Esto eliminará el producto permanentemente.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Sí, eliminar',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                form.submit();
            }
        });
    });
});
</script>
@stop
@section('css')
<style>
    .bg-light-danger {
        background-color: #ffecec !important; /* rojo muy suave */
    }
    .text-end {
        text-align: right !important;
    }
    .table tbody tr:hover {
        background-color: #b1fdb7;
    }
</style>
@stop