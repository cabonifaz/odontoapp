{{-- resources/views/usuarios/index.blade.php --}}
@extends('adminlte::page')

@section('title', 'Lista de Usuarios')

@section('content_header')
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <!-- Title on the left -->
            <h2 class="m-0">Administración de Usuarios</h2>
            
        </div>
    </div>
@stop
@section('content')

    <section class="content">
        <div class="container-fluid">
            <!-- Success Message -->
            @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                {{ session('success') }}
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            @endif

            <!-- Error Messages -->
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

            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">Lista de Usuarios</h3>
                </div>
                <!-- /.card-header -->

                <div class="card-body">
                    <table id="usersTable" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nombre</th>
                                <th>Email</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($users as $user)
                            <tr>
                                <td>{{ $user->id }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>
                                    <a href="{{ route('asignar.edit', $user->id) }}" class="btn btn-sm btn-primary edit-btn">
                                        <i class="fas fa-edit"></i>
                                    </a>

                                    <form action="{{ route('asignar.destroy', $user->id) }}" method="POST" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-sm btn-danger delete-btn">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </div>
        <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
<!-- Confirmation Modal -->
<div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="confirmationModalLabel">Confirmar Eliminación</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>¿Estás seguro de eliminar este usuario?</p>
            </div>
            <div class="modal-footer justify-content-end">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                <button type="button" id="confirmDelete" class="btn btn-danger">Eliminar</button>
            </div>
        </div>
    </div>
</div>

<script>
    let formToSubmit = null;

    document.querySelectorAll('.delete-btn').forEach(button => {
        button.addEventListener('click', function (event) {
            event.preventDefault(); // Prevents the default form action

            // Show the modal using AdminLTE's Bootstrap method
            $('#confirmationModal').modal('show');

            // Save a reference to the form to submit later
            formToSubmit = this.closest('form');
        });
    });

    document.getElementById('confirmDelete').addEventListener('click', function () {
        if (formToSubmit) {
            formToSubmit.submit(); // Submit the form
        }
        $('#confirmationModal').modal('hide'); // Hide the modal
    });

    document.getElementById('cancelDelete').addEventListener('click', function () {
        $('#confirmationModal').modal('hide'); // Hide the modal
    });

    // Close the modal if the user clicks outside of it
    $(document).on('click', function (event) {
        if ($(event.target).closest('#confirmationModal').length === 0) {
            $('#confirmationModal').modal('hide');
        }
    });
</script>

@if(session('success'))
    <!-- Include SweetAlert2 if not already included -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            Swal.fire({
                icon: 'success',
                title: 'Éxito',
                text: '{{ session('success') }}',
                confirmButtonText: 'OK'
            });
        });
    </script>
@endif
@stop
    
    
@section('js')
<!-- Incluye los scripts de DataTables y Bootstrap -->
     
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#usersTable').DataTable({
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
