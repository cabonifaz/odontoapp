@extends('adminlte::page')

@section('title', 'Médicos - Mundo System')

@section('content_header') 
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Médicos</h1>
            <!-- Botón que activa el modal -->
            @can('Crear')
            <button type="button" class="btn btn-primary rounded-pill px-4" data-toggle="modal" data-target="#createModal">
                <img src="{{ asset('img/doctor.png') }}" alt="Doctor" width="30"> Crear Nuevo Médico
            </button>
            @endcan
        </div>
    </div>
</div>
@stop

@section('content')
    <div class="card">
        <div class="card-body">
            <!-- Mostrar mensaje de éxito -->
            @if (session('success'))
                <div class="alert alert-success alert-dismissible fade show" role="alert" style="font-size: 0.9rem; color: #155724; background-color: #d4edda; border-color: #c3e6cb;">
                    {{ session('success') }}
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            @endif

            <!-- Mostrar mensajes de error -->
            @if ($errors->any())
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="font-size: 0.9rem; color: #721c24; background-color: #f8d7da; border-color: #f5c6cb;">
                    <ul class="mb-0">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
            @endif

        <div class="table-responsive">
            <table id="medicosTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>COP</th>
                        <th>Teléfono</th>
                        <th>Dirección</th>
                        <th>Fecha Ingreso</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($medicos as $medico)
                        <tr>
                            <td>{{ $medico->nombre_medico }}</td>
                            <td>{{ $medico->cmp }}</td>
                            <td>{{ $medico->telefono }}</td>
                            <td>{{ $medico->direccion }}</td>
                            <td>{{ $medico->fyh_ingreso_formatted }}</td>
                            <td>
                                @can('Modificar')
                                <button class="edit-btn" data-id="{{ $medico->id }}" data-toggle="modal" data-target="#editModal-{{ $medico->id }}">
                                    ✏️
                                </button>
                                @endcan
                                @can('Eliminar')
                                    <form action="{{ route('medicos.destroy', $medico->id) }}" method="POST" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="delete-btn text-danger">
                                            🗑️
                                        </button>
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

    <!-- Modal de Creación de Nuevo Médico -->
<div id="createModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Crear Nuevo Médico</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="createMedicoForm" method="POST" action="{{ route('medicos.store') }}">
                    @csrf
                    <div class="form-group">
                        <label for="nombre_medico" class="col-form-label">Nombre Médico:</label>
                        <input type="text" id="nombre_medico" name="nombre_medico" class="form-control rounded-pill" autocomplete="off" required>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">
                            <label for="cmp" class="col-form-label">COP:</label>
                            <input type="text" id="cmp" name="cmp" class="form-control rounded-pill" autocomplete="off" required>
                        </div>
                        <div class="col-md-6">
                            <label for="telefono" class="col-form-label">Teléfono:</label>
                            <input type="text" id="elefono" name="telefono" class="form-control rounded-pill" autocomplete="off" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="direccion" class="col-form-label">Dirección:</label>
                        <input type="text" id="direccion" name="direccion" class="form-control rounded-pill" autocomplete="off" required>
                    </div>
                    <div class="form-group">
                        <label for="fyh_ingreso" class="col-form-label">Fecha de Ingreso:</label>
                        <input type="date" id="fyh_ingreso" name="fyh_ingreso" class="form-control rounded-pill" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary rounded-pill px-4" onclick="document.getElementById('createMedicoForm').submit()">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para editar médico -->
<div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
    <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Modificar datos del médico</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="editForm" method="POST">
                @csrf
                @method('PUT')
                <input type="hidden" id="medicoId" name="medicoId">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre_medico_edit">Nombre del Médico</label>
                        <input type="text" id="nombre_medico_edit" name="nombre_medico_edit" class="form-control" required>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-6">    
                            <label for="cmp_edit">COP</label>
                            <input type="text" id="cmp_edit" name="cmp_edit" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label for="telefono_edit">Teléfono</label>
                            <input type="text" id="telefono_edit" name="telefono_edit" class="form-control">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="direccion_edit">Dirección</label>
                        <input type="text" id="direccion_edit" name="direccion_edit" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="fyh_ingreso_edit">Fecha y Hora de Ingreso</label>
                        <input type="date" id="fyh_ingreso_edit" name="fyh_ingreso_edit" class="form-control" required>
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
    
@stop
@section('js')
<!-- Incluye los scripts de DataTables y Bootstrap -->
     
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>

    <script>
        $(document).ready(function() {
            $('#medicosTable').DataTable({
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


<script>
        document.addEventListener('DOMContentLoaded', function() {
    // Asignar evento de clic a todos los botones de edición
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function () {
            const id = this.dataset.id; // Captura el ID del botón de edición
            console.log("ID capturado:", id);

            // Realiza la solicitud para obtener los datos del médico
            fetch(`/medicos/${id}/edit`)
                .then(response => response.json())
                .then(data => {
                    console.log(data); // Verifica aquí si se están recibiendo los datos correctos
        
                    // Llena los campos del formulario con los datos del médico
                    document.getElementById('medicoId').value = data.id;
                    document.getElementById('nombre_medico_edit').value = data.nombre_medico;
                    document.getElementById('cmp_edit').value = data.cmp;
                    document.getElementById('telefono_edit').value = data.telefono;
                    document.getElementById('direccion_edit').value = data.direccion;

                    // Convertir la fecha al formato 'yyyy-MM-dd' para el input de tipo 'date'
                    if (data.fyh_ingreso) {
                        const fechaIngreso = new Date(data.fyh_ingreso);
                        const anio = fechaIngreso.getFullYear();
                        const mes = String(fechaIngreso.getMonth() + 1).padStart(2, '0'); // Meses de 0 a 11
                        const dia = String(fechaIngreso.getDate()).padStart(2, '0');
                        const fechaFormateada = `${anio}-${mes}-${dia}`;
                        document.getElementById('fyh_ingreso_edit').value = fechaFormateada;
                    }

                    // Establece la acción del formulario con la URL de actualización
                    document.getElementById('editForm').action = `/medicos/${data.id}`;

                    // Muestra el modal de AdminLTE
                    $('#editModal').modal('show');
                })
                .catch(error => console.error('Error al obtener los datos del médico:', error));
        });
    });

    
});

    </script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Asignar evento de clic a todos los botones de eliminación
        $('.delete-btn').on('click', function(event) {
            event.preventDefault(); // Previene la acción por defecto del formulario

            const formToSubmit = $(this).closest('form'); // Obtén el formulario relacionado

            // Mostrar la alerta de confirmación
            Swal.fire({
                title: '¿Estás seguro?',
                text: "Esta acción no se puede deshacer.",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Si se confirma, envía el formulario
                    formToSubmit.submit();
                }
            });
        });
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        document.querySelector('form').addEventListener('submit', function(event) {
            const nombreMedico = document.getElementById('nombre_medico_edit').value;
            const cmp = document.getElementById('cmp_edit').value;
            const telefono = document.getElementById('telefono_edit').value;

            // Validar nombre_medico (solo letras y espacios)
            if (!/^[A-Za-z\s]+$/.test(nombreMedico)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'El nombre del médico solo puede contener letras y espacios.',
                });
                event.preventDefault(); // Previene el envío del formulario
                return;
            }

            // Validar cmp (solo letras y números)
            if (!/^[A-Za-z0-9]+$/.test(cmp)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'El CMP solo puede contener letras y números.',
                });
                event.preventDefault(); // Previene el envío del formulario
                return;
            }

            // Validar teléfono (solo números)
            if (telefono && !/^[0-9]+$/.test(telefono)) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'El teléfono solo puede contener números.',
                });
                event.preventDefault(); // Previene el envío del formulario
                return;
            }
        });
    });
</script>

    <!-- Añadir este script para mostrar el mensaje de éxito -->
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
    <script>
        // Función para obtener la fecha actual en formato dd/mm/yyyy
        function getFormattedDate() {
            const date = new Date();
            const day = String(date.getDate()).padStart(2, '0');
            const month = String(date.getMonth() + 1).padStart(2, '0'); // Los meses son 0-based en JavaScript
            const year = date.getFullYear();
            return `${year}-${month}-${day}`; // Formato yyyy-mm-dd para los inputs tipo date
        }

        // Asignar la fecha actual al input
        document.addEventListener('DOMContentLoaded', function() {
            document.getElementById('fyh_ingreso').value = getFormattedDate();
        });
    </script>
    <script>
    function openCreateModal() {
        $('#createModal').modal('show'); // Muestra el modal utilizando jQuery de AdminLTE
    }

    function closeCreateModal() {
        $('#createModal').modal('hide'); // Oculta el modal utilizando jQuery de AdminLTE
    }
</script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('createMedicoForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Previene el envío del formulario

            // Validar campos antes de enviar (nombre_medico y cmp)
            let nombreMedico = document.getElementById('nombre_medico').value;
            let cmp = document.getElementById('cmp').value;

            if (nombreMedico.trim() === '' || cmp.trim() === '') {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: 'Todos los campos son obligatorios',
                });
            } else {
                this.submit(); // Envía el formulario si los campos son válidos
            }
        });
    });
</script>
@stop
@section('css')
<style>
    .edit-btn {
        background-color: transparent !important;
        color: #007bff !important; /* Color azul para el ícono */
        border: 1px solid #007bff !important; /* Borde azul */
        border-radius: 4px; /* Bordes ligeramente redondeados */
        transition: all 0.3s ease; /* Transición para un efecto suave */
        padding: 5px 10px; /* Ajustar el tamaño del botón */
    }

    .edit-btn:hover {
        background-color: #007bff !important; /* Fondo azul al pasar el cursor */
        color: white !important; /* Texto blanco en el hover */
        box-shadow: 0 0 8px rgba(0, 123, 255, 0.5); /* Sombra suave para resaltar */
    }
    .delete-btn {
        background-color: transparent !important;
        color: #dc3545 !important; /* Rojo del ícono */
        border: 1px solid #dc3545 !important; /* Borde rojo */
        border-radius: 4px; /* Bordes ligeramente redondeados */
        transition: all 0.3s ease; /* Transición suave */
        padding: 5px 10px; /* Tamaño del botón */
    }

    .delete-btn:hover {
        background-color: #dc3545 !important; /* Fondo rojo al pasar el cursor */
        color: white !important; /* Texto blanco en el hover */
        box-shadow: 0 0 8px rgba(220, 53, 69, 0.5); /* Sombra para resaltar */
    }
    /* Estilo de hover para las filas del cuerpo de la tabla */
    .table tbody tr:hover {
        background-color: #b1fdb7;
    }
    .modal-content {
        border-radius: 10px;
        border: none;
        box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.2);
    }

    .modal-header {
        border-bottom: none;
    }

    .modal-footer {
        border-top: none;
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
    .dataTables_length select {
        border-radius: 50px;
        padding: 5px 5px;
    }
    
    /* Reducir tamaño de letra y alto de filas del DataTable */
    #medicosTable tbody td,
    #medicosTable thead th {
        font-size: 0.85rem; /* Tamaño de letra reducido */
        padding-top: 4px;
        padding-bottom: 4px;
        line-height: 1.2;
    }
</style>
@stop