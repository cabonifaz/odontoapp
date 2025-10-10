<!-- Modal Editar Producto (dinámico) -->

<div id="editProductoModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Editar Producto</h5>
                <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
            </div>
            <form id="editProductoForm" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" name="producto_id" id="edit_producto_id">

                    <div class="form-group">
                        <label>Nombre:</label>
                        <input type="text" name="nombre" id="edit_nombre" class="form-control" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Presentación:</label>
                            <input type="text" name="presentacion" id="edit_presentacion" class="form-control">
                        </div>
                        <div class="form-group col-md-6">
                            <label>Fecha Ingreso:</label>
                            <input type="date" name="fecha_ingreso" id="edit_fecha_ingreso" class="form-control" required>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-4">
                            <label>Stock:</label>
                            <input type="number" name="stock" id="edit_stock" class="form-control" min="0" required>
                        </div>
                        <div class="form-group col-md-4">
                            <label>Stock Mínimo:</label>
                            <input type="number" name="stock_minimo" id="edit_stock_minimo" class="form-control" min="0">
                        </div>
                        <div class="form-group col-md-4">
                            <label>Precio Compra:</label>
                            <input type="number" step="0.01" name="precio_compra" id="edit_precio_compra" class="form-control" required>
                        </div>
                    </div>
                </div>

                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary rounded-pill px-4">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>
