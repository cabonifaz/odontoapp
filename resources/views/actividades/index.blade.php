@extends('adminlte::page')

@section('title', 'Tratamientos - Vitaldentis')

@section('content_header') 
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Tratamientos</h1>
            <!-- Botón que activa el modal -->
            @can('Crear')
            <button type="button" class="btn btn-primary rounded-pill px-4" data-toggle="modal" data-target="#createModal">
                <img src="{{ asset('img/curriculum.png') }}" alt="Doctor" width="30"> Crear Nuevo Tratamiento
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
            <table id="actividadesTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th style="text-align: right;">Precio</th>
                        <th style="text-align: center;">Mostrar Detalle Pieza?</th>
                        <th style="text-align: center;">Procedimientos Asociados</th>
                        <th style="text-align: center;">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($actividades as $actividad)
                        <tr>
                            <td>{{ $actividad->id }}</td>
                            <td>{{ $actividad->nombre }}</td>
                            @if(auth()->user()->can('Ver importe presupuesto'))
                                <td style="text-align: right;">{{ number_format($actividad->precio,2) }}</td>
                            @else
                                <td style="text-align:right;">*****</td>
                            @endif
                            <td style="text-align: center;">
                                {{ $actividad->detalle_pieza == 1 ? 'Sí' : 'No' }}
                            </td>
                            <td style="text-align: center;">
                                <button class="btn btn-info btn-sm" onclick="openActivitiesModal({{ $actividad->id }}, '{{ $actividad->nombre }}')">🔍 Ver Procedimientos
                            </td>
                            <td> <center>
                                @can('Modificar')
                                <button class="edit-btn btn btn-warning btn-sm" data-id="{{ $actividad->id }}" data-toggle="modal" data-target="#editModal-{{ $actividad->id }}">
                                    ✏️
                                </button>
                                @endcan
                                @can('Eliminar')
                                <form action="{{ route('actividades.destroy', $actividad->id) }}" method="POST" class="d-inline">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="delete-btn btn btn-danger btn-sm">
                                        🗑️
                                    </button>
                                </form>
                                @endcan
                                </center>
                            </td>
                        </tr>
                    @endforeach
                </tbody>

            </table>
            </div>    
        </div>
    </div>

<!-- Modal de Creación de Nuevo actividad -->
<div id="createModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Crear Nuevo Tratamiento</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="createactividadForm" method="POST" action="{{ route('actividades.store') }}">
                    @csrf
                    <div class="form-group">
                        <label for="nombre_actividad" class="col-form-label">Nombre Tratamiento:</label>
                        <input type="text" id="nombre_actividad" name="nombre_actividad" class="form-control" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-4">
                            <label for="precio_actividad" class="col-form-label">Precio:</label>
                            <input type="number" id="precio_actividad" name="precio_actividad" class="form-control" step="0.01" required>
                        </div>
                        <div class="form-group col-sm-8 d-flex align-items-center">
                            <label for="detalle_pieza" class="col-form-label mb-0 mr-2 ml-4" style="width: 250px;">Mostrar Detalle de Pieza dental:</label>
                            <input type="checkbox" id="detalle_pieza" name="detalle_pieza">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary rounded-pill px-4" id="guardarButton">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal para editar actividad -->
<div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Modificar Tratamiento</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="editForm" method="POST">
                @csrf
                @method('PUT')
                <input type="hidden" id="actividadId" name="actividadId">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="nombre_actividad_edit">Nombre Tratamiento</label>
                        <input type="text" id="nombre_actividad_edit" name="nombre_actividad_edit" class="form-control" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-sm-4">
                            <label for="precio_actividad_edit" class="col-form-label">Precio:</label>
                            <input type="number" id="precio_actividad_edit" name="precio_actividad_edit" class="form-control" step="0.01" required>
                        </div>
                        <div class="form-group col-sm-8 d-flex align-items-center">
                            <label for="detalle_pieza_edit" class="col-form-label mb-0 mr-2" style="width: 250px;">Mostrar Detalle de Pieza dental:</label>
                            <input type="checkbox" id="detalle_pieza_edit" name="detalle_pieza_edit">
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
<!-- Single Activities Modal -->
<div class="modal fade" id="activitiesModal" tabindex="-1" role="dialog" aria-labelledby="activitiesModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="activitiesModalLabel">Actividades de:</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-inline mb-3" style="position: relative;">
                    <input type="text" id="searchActivity" class="form-control mr-2" placeholder="Buscar actividad" onkeyup="searchActivityAjax()" style="width: 60%;" autocomplete="off">
                    <input type="number" id="activityPercentage" class="form-control mr-2" placeholder="Porcentaje" min="0" max="100" style="width: 25%;">
                    <input type="hidden" id="selectedActivityId" />
                    <input type="hidden" id="tratamientoId" />
                    @can('Crear')
                    <button class="btn btn-success btn-sm" onclick="addActivityToList()">
                        <i class="fas fa-plus-circle"></i>
                    </button>
                    @endcan
                    <ul id="activitySearchResults" class="list-group" style="display: none;">
                        <!-- Resultados de la búsqueda AJAX -->
                    </ul>
                </div>
                <div class="table-responsive">
                    <table class="table" id="serviceActivitiesTable">
                        <thead>
                            <tr>
                                <th>Item</th>
                                <th>Actividad</th>
                                <th>Porcentaje</th>
                                <th>Orden</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="activitiesTableBody">
                            <!-- Contenido cargado dinámicamente -->
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

@stop
@section('js')
    <!-- Incluye los scripts de DataTables y Bootstrap -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
    $(document).ready(function() {
        $('#actividadesTable').DataTable({
            pageLength: 5, // Mostrar 5 registros por página
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
                initComplete: function () {
                    // Aplicar la clase 'rounded-pill' al select de sLengthMenu
                    $('select[name="actividadesTable_length"]').addClass('rounded-pill form-control');
                },
                "oAria": {
                    "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                    "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                }
            }
        });
    });

    let activitiesTable; // Variable para la instancia del DataTable

    // Inicializa el DataTable
    function initializeDataTable() {
        if ($.fn.DataTable.isDataTable('#serviceActivitiesTable')) {
            $('#serviceActivitiesTable').DataTable().destroy();
        }
        activitiesTable = $('#serviceActivitiesTable').DataTable({
            pageLength: 5, // Mostrar 5 registros por página
            order: [], // Sin orden automático
            language: {
                sEmptyTable: "No hay datos disponibles en la tabla",
                sInfo: "Mostrando _START_ a _END_ de _TOTAL_ entradas",
                sInfoEmpty: "Mostrando 0 a 0 de 0 entradas",
                sInfoFiltered: "(filtrado de _MAX_ entradas totales)",
                sLengthMenu: "Mostrar _MENU_ entradas",
                sLoadingRecords: "Cargando...",
                sProcessing: "Procesando...",
                sSearch: "Buscar:",
                sZeroRecords: "No se encontraron resultados",
                oPaginate: {
                    sFirst: "Primero",
                    sLast: "Último",
                    sNext: "Siguiente",
                    sPrevious: "Anterior"
                },
                oAria: {
                    sSortAscending: ": Activar para ordenar ascendente",
                    sSortDescending: ": Activar para ordenar descendente"
                }
            }
        });
    }

    // Listar actividades
    function listActivities(tratamientoId) {
        return $.ajax({
            url: `/tratamiento/${tratamientoId}/actividades`,
            type: 'GET',
            success: function (data) {
                // Log para verificar los datos recibidos
                console.log('Datos recibidos:', data);

                // Limpiar la tabla
                activitiesTable.clear();

                if (data.length > 0) {
                    data.forEach(activityData => {
                        console.log('Procesando actividad:', activityData); // Log para verificar cada actividad

                        const isFirst = data.indexOf(activityData) === 0;
                        const isLast = data.indexOf(activityData) === data.length - 1;

                        const upButton = isFirst ? '' : `<button class="btn btn-sm btn-warning" onclick="moveActivity(${activityData.id}, 'up')" style="width: 30px;">⬆️</button>`;
                        const downButton = isLast ? '' : `<button class="btn btn-sm btn-warning" onclick="moveActivity(${activityData.id}, 'down')" style="width: 30px;">⬇️</button>`;

                        activitiesTable.row.add([
                            data.indexOf(activityData) + 1,
                            activityData.servicio.nombre,
                            activityData.porcentaje + '%',
                            `<div style="display: flex; gap: 5px; justify-content: center;">${upButton}${downButton}</div>`,
                            `@can('Eliminar')
                                <button class="btn btn-sm btn-transparent-red" onclick="removeActivity(${activityData.id})">🗑️</button>
                            @endcan`
                        ]).draw(false);
                    });
                } else {
                    activitiesTable.clear().draw(); // Limpiar la tabla si no hay datos
                }

                // Log para verificar la tabla antes de inicializar el DataTable
                console.log('Contenido de la tabla:', $('#serviceActivitiesTable').html());
            },
            error: function () {
                alert('Error al obtener las actividades. Intenta nuevamente.');
            }
        });
    }

    // Abrir modal de actividades
    function openActivitiesModal(tratamientoId, nombre) {
        document.getElementById('tratamientoId').value = tratamientoId;
        $('#activitiesModalLabel').text(`Actividades para ${nombre}`);
        $('#activitiesModal').modal('show');

        $('#activitiesModal').on('shown.bs.modal', function () {
            listActivities(tratamientoId);
        });
        // Limpiar tabla al cerrar el modal
        $('#activitiesModal').on('hidden.bs.modal', function () {
            activitiesTable.clear().draw(); // Limpia la tabla cuando el modal se cierra
        });

    }

    // Inicializar DataTable al cargar la página
    $(document).ready(() => {
        initializeDataTable(); // Inicializa el DataTable vacío
    });


        function searchActivityAjax() {
            const query = document.getElementById('searchActivity').value;

            if (query.length > 2) { // Realizar la búsqueda si hay más de 2 caracteres
                $.ajax({
                    url: '{{ route("buscar.actividades") }}', // Ruta de Laravel para la búsqueda
                    method: 'POST',
                    data: { 
                        searchQuery: query,
                        _token: '{{ csrf_token() }}' // Token CSRF para seguridad
                    },
                    success: function(data) {
                        const resultsContainer = document.getElementById('activitySearchResults');
                        resultsContainer.innerHTML = ''; // Limpiar los resultados anteriores

                        // Recorrer los resultados y agregarlos al contenedor de resultados
                        data.forEach(function(activity) {
                            const li = document.createElement('li');
                            li.textContent = activity.nombre;  // Mostrar el nombre de la actividad
                            li.classList.add('list-group-item');  // Aplicar la clase Bootstrap
                            li.setAttribute('data-id', activity.id);  // Guardar el ID de la actividad en un atributo 'data-id'
                            
                            // Al hacer clic en un elemento de la lista, seleccionamos la actividad
                            li.onclick = function() {
                                selectActivity(activity.id, activity.nombre);  // Pasar tanto el ID como el nombre
                                resultsContainer.style.display = 'none'; // Ocultar la lista después de seleccionar
                            };

                            resultsContainer.appendChild(li);
                        });

                        resultsContainer.style.display = 'block';  // Mostrar los resultados
                    }
                });
            } else {
                document.getElementById('activitySearchResults').style.display = 'none';
            }
        }


        function selectActivity(activityId, activityName) {
            console.log('ID de actividad:', activityId);  // Depurar el ID
            console.log('Nombre de actividad:', activityName);  // Depurar el nombre

            if (activityId && activityName) {
                document.getElementById('selectedActivityId').value = activityId;  // Asignar ID
                document.getElementById('searchActivity').value = activityName;  // Asignar nombre
                document.getElementById('activitySearchResults').style.display = 'none';  // Ocultar resultados
            } else {
                console.log("Error: No se pasaron correctamente los parámetros.");
            }
        }

        function addActivityToList() {
            const activityId = document.getElementById('selectedActivityId').value;  // ID de la actividad seleccionada
            const activityPercentage = document.getElementById('activityPercentage').value;
            const tratamientoId = document.getElementById('tratamientoId').value;  // ID del servicio seleccionado
            console.log("activityId", activityId,
                "tratamientoId",  tratamientoId
            );
            if (activityId && activityPercentage && tratamientoId) {
                // Enviar los datos al servidor usando AJAX
                $.ajax({
                    url: '/actividad/agregar',  // Ruta de tu controlador
                    type: 'POST',
                    data: {
                        actividad_id: activityId, // Enviar el ID de la actividad
                        activity_percentage: activityPercentage,
                        tratamiento_id: tratamientoId,
                        _token: '{{ csrf_token() }}' // Token CSRF para la seguridad
                    },
                    success: function(response) {
                        if (response.success) {
                            // Limpiar los campos de entrada
                            document.getElementById('selectedActivityId').value = '';
                            document.getElementById('activityPercentage').value = '';
                            document.getElementById('searchActivity').value = '';

                            // Actualizar la tabla con la nueva lista de actividades
                            listActivities(tratamientoId);

                            // Mostrar mensaje de éxito usando Swal
                            Swal.fire({
                                icon: 'success',
                                title: 'Actividad Agregada',
                                text: 'La actividad se ha agregado correctamente.',
                            });
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log('Error:', error);

                        // Verificar si el error es debido a una actividad duplicada
                        if (xhr.status === 400 && xhr.responseJSON && xhr.responseJSON.message === 'Esta actividad ya está asociada a este servicio en esta empresa.') {
                            Swal.fire({
                                icon: 'warning',
                                title: 'Actividad Duplicada',
                                text: 'Esta actividad ya está asociada a este servicio en esta empresa.',
                            });
                        } else {
                            // Otro error general
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: 'Hubo un problema al agregar la actividad.',
                            });
                        }
                    }
                });

            } else {
                Swal.fire({
                    icon: 'warning',
                    title: 'Campos Incompletos',
                    text: 'Por favor, complete todos los campos.',
                });
            }
        }

        function removeActivity(actividadId) {
            const tratamientoId = document.getElementById('tratamientoId').value;  // ID del servicio seleccionado
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Esta actividad será eliminada de la lista de actividades para este tratamiento.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Sí, eliminar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Realizar solicitud AJAX para eliminar la actividad
                    $.ajax({
                        url: '/actividad/eliminar',  // Ruta para eliminar la actividad
                        type: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            actividad_id: actividadId  // ID de la actividad a eliminar
                        },
                        success: function(response) {
                            if (response.success) {
                                /// Actualizar la tabla con la nueva lista de actividades
                                listActivities(tratamientoId);
                                Swal.fire('Eliminado', 'La actividad ha sido eliminada del tratamiento.', 'success');
                            } else {
                                Swal.fire('Error', 'Hubo un problema al eliminar la actividad.', 'error');
                            }
                        },
                        error: function(xhr, status, error) {
                            console.error('Error:', error);
                            Swal.fire('Error', 'Hubo un problema al eliminar la actividad.', 'error');
                        }
                    });
                }
            });
        }
        $('#activitiesModal').on('hidden.bs.modal', function () {
            // Limpiar los campos del modal
            $('#searchActivity').val('');
            $('#activityPercentage').val('');
            $('#selectedActivityId').val('');
            $('#servicioId').val('');
            // Si también quieres limpiar la lista de resultados de búsqueda:
            $('#activitySearchResults').empty().hide();
        });


        function moveActivity(activityId, direction) {
            console.log(`Intentando mover la actividad con ID: ${activityId} hacia ${direction}`); // Depuración

            $.ajax({
                url: `/actividades/${activityId}/move`, // Utiliza la URL correcta que incluye el ID de la actividad
                type: 'POST',
                data: {
                    direction: direction, // Enviar solo la dirección
                    _token: $('meta[name="csrf-token"]').attr('content') // Asegúrate de incluir el token CSRF
                },
                success: function(response) {
                    console.log('Respuesta del servidor:', response); // Depuración
                    if (response.success) {
                        Swal.fire({
                            title: 'Éxito!',
                            text: `Actividad movida ${direction === 'up' ? 'arriba' : 'abajo'} correctamente.`,
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then(() => {
                            const tratamientoId = $('#tratamientoId').val();
                            listActivities(tratamientoId);
                        });
                    } else {
                        Swal.fire({
                            title: 'Error!',
                            text: 'Hubo un problema al mover la actividad.',
                            icon: 'error',
                            confirmButtonText: 'Aceptar'
                        });
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error al mover la actividad:', error); // Depuración
                    Swal.fire({
                        title: 'Error!',
                        text: 'Hubo un problema al mover la actividad. Intente nuevamente.',
                        icon: 'error',
                        confirmButtonText: 'Aceptar'
                    });
                }
            });
        }


    </script>

<script>
        document.addEventListener('DOMContentLoaded', function() {
    // Asignar evento de clic a todos los botones de edición
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function () {
            const id = this.dataset.id; // Captura el ID del botón de edición
            console.log("ID capturado:", id);

            // Realiza la solicitud para obtener los datos del médico
            fetch(`/actividades/${id}/edit`)
                .then(response => response.json())
                .then(data => {
                    console.log(data); // Verifica aquí si se están recibiendo los datos correctos
        
                    // Llena los campos del formulario con los datos del médico
                    document.getElementById('actividadId').value = data.id;
                    document.getElementById('nombre_actividad_edit').value = data.nombre;
                    document.getElementById('precio_actividad_edit').value = data.precio;
                    // Asigna el valor del checkbox detalle_pieza
                    document.getElementById('detalle_pieza_edit').checked = data.detalle_pieza === 1;
                    // Establece la acción del formulario con la URL de actualización
                    document.getElementById('editForm').action = `/actividades/${data.id}`;

                    // Muestra el modal de AdminLTE
                    $('#editModal').modal('show');
                })
                .catch(error => console.error('Error al obtener los datos de la actividad:', error));
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
    document.getElementById('editForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevenir el comportamiento predeterminado del formulario

        const nombreactividad = document.getElementById('nombre_actividad_edit').value;
        let precioactividad = document.getElementById('precio_actividad_edit').value;
        const detallePiezaEdit = document.getElementById('detalle_pieza_edit').checked;

        // Crear un campo oculto para enviar el valor del checkbox como booleano
        let hiddenCheckboxInput = document.createElement('input');
        hiddenCheckboxInput.type = 'hidden';
        hiddenCheckboxInput.name = 'detalle_pieza_edit';
        hiddenCheckboxInput.value = detallePiezaEdit ? 1 : 0; // Enviar 1 si está marcado, 0 si no lo está
        this.appendChild(hiddenCheckboxInput);

        // Remover el campo checkbox del envío para evitar conflictos
        document.getElementById('detalle_pieza_edit').disabled = true;

        // Mostrar los datos en la consola
        console.log('Nombre Actividad:', nombreactividad);
        console.log('Precio Actividad:', precioactividad);
        console.log('Mostrar Detalle de Pieza dental:', hiddenCheckboxInput.value);

        // Validación de los campos
        if (nombreactividad.trim() === '' || precioactividad.trim() === '') {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Campo obligatorio',
            });
            return; // Salir de la función si hay campos obligatorios vacíos
        }

        // Validar nombre_actividad (solo letras y espacios)
        if (!/^[A-Za-z\s]+$/.test(nombreactividad)) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'El nombre del tratamiento solo puede contener letras y espacios.',
            });
            return; // Salir de la función si la validación falla
        }

        // Enviar el formulario manualmente si todo es válido
        this.submit();
    });
});

</script>

    <!-- Añadir este script para mostrar el mensaje de éxito -->
    @if(session('success'))
        
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
    function openCreateModal() {
        $('#createModal').modal('show'); // Muestra el modal utilizando jQuery de AdminLTE
    }

    function closeCreateModal() {
        $('#createModal').modal('hide'); // Oculta el modal utilizando jQuery de AdminLTE
    }
</script>
  
<script>
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('guardarButton').addEventListener('click', function(event) {
        event.preventDefault(); // Prevenir el envío del formulario

        // Validar campos antes de enviar (nombre_actividad y precio)
        let nombreactividad = document.getElementById('nombre_actividad').value;
        let precioactividad = document.getElementById('precio_actividad').value;
        let detallePieza = document.getElementById('detalle_pieza').checked ? true : false;

        // Validar los campos antes de enviar
        if (nombreactividad.trim() === '' || precioactividad.trim() === '') {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'Campo obligatorio',
            });
            return; // Salir de la función si hay campos obligatorios vacíos
        }

        // Validar nombre_actividad (solo letras y espacios)
        if (!/^[A-Za-z\s]+$/.test(nombreactividad)) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'El nombre del tratamiento solo puede contener letras y espacios.',
            });
            return; // Salir de la función si la validación falla
        }

        // Mostrar los datos en la consola para depuración
        console.log('Formulario a enviar:', {
            nombre_actividad: nombreactividad,
            precio_actividad: precioactividad,
            detalle_pieza: detallePieza
        });

        // Preguntar si se desean enviar los datos
        Swal.fire({
            title: '¿Quieres enviar estos datos?',
            text: `Nombre Actividad: ${nombreactividad}\nPrecio Actividad: ${precioactividad}\nDetalle Pieza: ${detallePieza}`,
            icon: 'question',
            showCancelButton: true,
            confirmButtonText: 'Sí, enviar',
            cancelButtonText: 'No, cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                // Crear un campo oculto para enviar el valor del checkbox como booleano
                let hiddenCheckboxInput = document.createElement('input');
                hiddenCheckboxInput.type = 'hidden';
                hiddenCheckboxInput.name = 'detalle_pieza';
                hiddenCheckboxInput.value = detallePieza;
                document.getElementById('createactividadForm').appendChild(hiddenCheckboxInput);

                // Enviar el formulario manualmente si se confirma
                document.getElementById('createactividadForm').submit();
            } else {
                Swal.fire({
                    icon: 'info',
                    title: 'Envío cancelado',
                    text: 'El envío del formulario ha sido cancelado.'
                });
            }
        });
    });
});

</script>
<style>
    #activitySearchResults {
            position: absolute;  /* Establece la posición relativa al contenedor */
            width: 60%;          /* Alineado con el ancho del input de búsqueda */
            max-height: 120px;   /* Limitar a un máximo de 3 elementos */
            overflow-y: auto;    /* Agregar scroll si hay más de 3 elementos */
            background-color: white; /* Fondo blanco para la lista */
            border: 1px solid #ccc;  /* Bordes de la lista */
            z-index: 1000;       /* Asegurarse de que quede encima de otros elementos */
            padding: 0;
            margin-top: 5px;     /* Espacio entre el input y los resultados */
            list-style-type: none;
            top: 100%;           /* Establece la lista justo debajo del input */
            left: 0;             /* Alinea la lista a la izquierda del contenedor */
        }
        #activitySearchResults li {
            padding: 8px;
            cursor: pointer;
        }
        #activitySearchResults li:hover {
            background-color: #b1fdb7; /* Resalta cuando el mouse pasa sobre un elemento */
        }
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
        #actividadesTable tbody td,
        #actividadesTable thead th {
            font-size: 0.85rem; /* Tamaño de letra reducido */
            padding-top: 4px;
            padding-bottom: 4px;
            line-height: 1.2;
        }
</style>
@stop