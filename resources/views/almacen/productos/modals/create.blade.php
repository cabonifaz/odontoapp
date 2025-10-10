
<!-- Modal de Crear Producto -->
<div id="createProductoModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Registrar Producto</h5>
                <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
            </div>
            <form method="POST" action="{{ route('productos_almacen.store') }}">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label>Nombre:</label>
                        <input type="text" name="nombre" class="form-control" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Presentación:</label>
                            <input type="text" name="presentacion" class="form-control">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Fecha Ingreso:</label>
                            <input type="date" name="fecha_ingreso" class="form-control" value="{{ date('Y-m-d') }}" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Stock:</label>
                            <input type="number" name="stock" class="form-control" min="0" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Stock Mínimo:</label>
                            <input type="number" name="stock_minimo" class="form-control" min="0" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Precio Compra:</label>
                            <input type="number" step="0.01" name="precio_compra" class="form-control" required>
                        </div>
                    </div>
                </div>

                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-success rounded-pill px-4">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

