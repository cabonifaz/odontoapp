{{-- resources/views/permisos/index.blade.php --}}
@extends('adminlte::page')

@section('title', 'Permisos')

@section('content_header')
    <div class="d-flex justify-content-between align-items-center">
        <!-- Título al extremo izquierdo -->
        <h2>Permisos</h2>
        <!-- Botón al extremo derecho -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModalPermiso">
                Crear Nuevo Permiso
        </button>
    </div>
@stop
@section('content')
<div class="py-3">
    
        <div class="card">
            <div class="card-body">
                <!-- Mostrar mensaje de éxito -->
                @if (session('success'))
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        {{ session('success') }}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif

                <!-- Mostrar mensajes de error -->
                @if ($errors->any())
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                @endif

                <!-- Tabla de permisos -->
                <table id="permisosTable" class="table table-striped table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($permisos as $permiso)
                            <tr>
                                <td>{{ $permiso->id }}</td>
                                <td>{{ $permiso->name }}</td>
                                <td>
                                    <!-- Botón de editar con modal -->
                                    <button class="btn btn-sm btn-primary" data-id="{{ $permiso->id }}" data-toggle="modal" data-target="#editModal-{{ $permiso->id }}">
                                        <i class="fas fa-edit"></i>
                                    </button>

                                    <!-- Formulario para eliminar -->
                                    <form action="{{ route('permisos.destroy', $permiso->id) }}" method="POST" class="d-inline-block">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-sm btn-danger delete-btn">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>

                            <!-- Modal de edición -->
                            <div class="modal fade" id="editModal-{{ $permiso->id }}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel-{{ $permiso->id }}" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="editModalLabel-{{ $permiso->id }}">Editar Permiso</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- Formulario de edición del permiso -->
                                            <form action="{{ route('permisos.update', $permiso->id) }}" method="POST">
                                                @csrf
                                                @method('PUT')
                                                <div class="form-group">
                                                    <label for="name-{{ $permiso->id }}">Nombre del Permiso</label>
                                                    <input type="text" class="form-control" id="name-{{ $permiso->id }}" name="name" value="{{ $permiso->name }}">
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    
</div>
<!-- Modal HTML adaptado a AdminLTE -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editModalLabel">Editar Permiso</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="editForm" method="POST">
                @csrf
                @method('PUT')
                <div class="modal-body">
                    <input type="hidden" id="permisoId" name="permisoId">
                    <div class="form-group">
                        <label for="nombre_permiso" class="col-form-label">Nombre del Permiso:</label>
                        <input type="text" class="form-control" id="nombre_permiso" name="nombre_permiso" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Actualizar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    // Asignar evento de clic a todos los botones de edición
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function () {
            const id = this.dataset.id; // Captura el ID del botón de edición
            console.log("ID capturado:", id);

            // Realiza la solicitud para obtener los datos del permiso
            fetch(`/permisos/${id}/edit`)
                .then(response => response.json())
                .then(data => {
                    // Llena los campos del formulario con los datos del permiso
                    document.getElementById('permisoId').value = data.id;
                    document.getElementById('nombre_permiso').value = data.name;

                    // Establece la acción del formulario con la URL de actualización
                    document.getElementById('editForm').action = `/permisos/${data.id}`;

                    // Muestra el modal utilizando Bootstrap
                    $('#editModal').modal('show');
                })
                .catch(error => console.error('Error al obtener los datos del permiso:', error));
        });
    });

    // Cierra el modal utilizando Bootstrap
    document.getElementById('closeModal').addEventListener('click', function () {
        $('#editModal').modal('hide');
    });

</script>

<!-- Confirmación Modal adaptado a AdminLTE -->
<div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Confirmar Eliminación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de eliminar este permiso?</p>
            </div>
            <div class="modal-footer">
                <button id="cancelDelete" type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button id="confirmDelete" type="button" class="btn btn-danger">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formToSubmit = null;

    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault(); // Previene la acción por defecto del formulario

            // Muestra el modal utilizando Bootstrap
            $('#confirmationModal').modal('show');

            // Guarda la referencia al formulario
            formToSubmit = this.closest('form');
        });
    });

    document.getElementById('confirmDelete').addEventListener('click', function () {
        if (formToSubmit) {
            formToSubmit.submit(); // Envía el formulario
        }
        $('#confirmationModal').modal('hide'); // Oculta el modal
    });

    document.getElementById('cancelDelete').addEventListener('click', function () {
        $('#confirmationModal').modal('hide'); // Oculta el modal
    });
        
</script>
<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        const nombrePermiso = document.getElementById('nombre_permiso').value;

        // Validar nombre_permiso (solo letras y números)
        if (!/^[A-Za-z0-9]+$/.test(nombrePermiso)) {
            Swal.fire('Error', 'El nombre del Permiso solo puede contener letras y números.', 'error');
            event.preventDefault();
        }
    });
        
</script>
@if(session('success'))
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Éxito',
            text: '{{ session('success') }}',
            confirmButtonText: 'OK'
        });
    </script>
@endif

<!-- Modal de Creación de Permiso adaptado a AdminLTE -->
<div class="modal fade" id="createModalPermiso" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Crear Nuevo Permiso</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="createPermisoForm" method="POST" action="{{ route('permisos.store') }}">
                @csrf
                <div class="modal-body">
                    <div class="form-group">
                        <label for="create_nombre_permiso" class="col-form-label">Nombre del Permiso:</label>
                        <input type="text" class="form-control" id="create_nombre_permiso" name="nombre" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    function openCreateModalPermiso() {
        $('#createModalPermiso').modal('show');
    }

    function closeCreateModalPermiso() {
        $('#createModalPermiso').modal('hide');
    }

    document.getElementById('createPermisoForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Previene el envío del formulario

        let nombrePermiso = document.getElementById('create_nombre_permiso').value;

        if (nombrePermiso.trim() === '') {
            Swal.fire('Error', 'Campo nombre es obligatorio', 'error');
        } else {
            this.submit(); // Envía el formulario si los campos son válidos
        }
    });

</script>

@stop


@section('js')
<!-- Incluye los scripts de DataTables y Bootstrap -->
     
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#permisosTable').DataTable({
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

@stop
