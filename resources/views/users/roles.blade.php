{{-- resources/views/medicos/index.blade.php --}}
@extends('adminlte::page')

@section('title', 'Roles')

@section('content_header') 
<div class="d-flex justify-content-between align-items-center">
        <!-- Título al extremo izquierdo -->
        <h2>Roles</h2>
        <!-- Botón al extremo derecho -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createModal">
            Crear Nuevo Role
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

                <!-- Tabla de roles -->
                <table id="rolesTable" class="table table-striped table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($roles as $role)
                            <tr>
                                <td>{{ $role->id }}</td>
                                <td>{{ $role->name }}</td>
                                <td>
                                    <a href="{{ route('roles.edit', $role->id) }}" class="btn btn-sm btn-primary">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="{{ route('roles.destroy', $role->id) }}" method="POST" class="d-inline-block">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-sm btn-danger delete-btn">
                                            <i class="fas fa-trash-alt"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    
</div>

@stop
    <!-- Confirmación Modal -->
<div id="confirmationModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="confirmDeleteLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="confirmDeleteLabel">Confirmar Eliminación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <p>¿Estás seguro de eliminar este rol?</p>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button id="confirmDelete" type="button" class="btn btn-danger">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<!-- Script para manejar la confirmación de eliminación -->
<script>
    let formToSubmit = null;

    // Evento para el botón de eliminar
    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault(); // Previene la acción por defecto del formulario

            // Muestra el modal de confirmación de Bootstrap
            $('#confirmationModal').modal('show');

            // Guarda la referencia al formulario
            formToSubmit = this.closest('form');
        });
    });

    // Evento para confirmar la eliminación
    document.getElementById('confirmDelete').addEventListener('click', function () {
        if (formToSubmit) {
            formToSubmit.submit(); // Envía el formulario
        }
        $('#confirmationModal').modal('hide'); // Oculta el modal
    });

    // Evento para cancelar la eliminación
    document.getElementById('cancelDelete').addEventListener('click', function () {
        $('#confirmationModal').modal('hide'); // Oculta el modal
    });

    // Cerrar el modal si se hace clic fuera de él
    $('#confirmationModal').on('click', function (event) {
        if (event.target === this) {
            $('#confirmationModal').modal('hide');
        }
    });
</script>

<!-- Script para validar el nombre del rol en el formulario -->
<script>
    document.querySelector('form').addEventListener('submit', function(event) {
        const nombreRole = document.getElementById('nombre_role').value;

        // Validar nombre_role (solo letras y números)
        if (!/^[A-Za-z0-9]+$/.test(nombreRole)) {
            alert('El nombre del Rol solo puede contener letras y números.');
            event.preventDefault(); // Previene el envío del formulario
        }
    });
</script>

<!-- SweetAlert2 para mostrar mensajes de éxito -->
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

    <!-- Modal de Creación de Nuevo Rol -->
<div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createRoleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header">
                <h5 class="modal-title" id="createRoleLabel">Crear Nuevo Rol</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <form id="createRoleForm" method="POST" action="{{ route('roles.store') }}">
                    @csrf
                    <div class="form-group">
                        <label for="create_nombre_role" class="col-form-label">Nombre Rol</label>
                        <input type="text" class="form-control" id="create_nombre_role" name="nombre" required>
                    </div>
                </form>
            </div>

            <!-- Modal Footer -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary" form="createRoleForm">Guardar</button>
            </div>
        </div>
    </div>
</div>

    <!-- Script para abrir y cerrar el modal con Bootstrap -->
<script>
    // Abre el modal de creación de roles
    function openCreateModalRole() {
        $('#createModalRole').modal('show'); // Usa el método de Bootstrap para mostrar el modal
    }

    // Cierra el modal de creación de roles
    function closeCreateModalRole() {
        $('#createModalRole').modal('hide'); // Usa el método de Bootstrap para ocultar el modal
    }
</script>

<!-- Script para validación y manejo de SweetAlert2 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    document.getElementById('createRoleForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Previene el envío del formulario

        // Validar campos antes de enviar (nombre)
        let nombreRole = document.getElementById('create_nombre_role').value;

        if (nombreRole.trim() === '') {
            Swal.fire('Error', 'El campo nombre es obligatorio', 'error');
        } else {
            this.submit(); // Envía el formulario si los campos son válidos
        }
    });
</script>
@section('js')
<!-- Incluye los scripts de DataTables y Bootstrap -->
     
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#rolesTable').DataTable({
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
