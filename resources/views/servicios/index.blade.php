{{-- resources/views/servivios/index.blade.php --}}
@extends('adminlte::page')

@section('title', 'Procedimientos - Vitaldentis')

@section('content_header') 
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="h5 mb-0">Procedimientos</h1>
            @can('Crear')
            <!-- Botón que activa el modal -->
            <button type="button" class="btn btn-primary rounded-pill  px-4" data-toggle="modal" data-target="#createModal">
            <img src="{{ asset('img/servicios.png') }}" alt="Doctor" width="30">Crear Nuevo Procedimiento
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
        <!-- Tabla de servicios -->
        <table id="serviciosTable" class="table table-striped table-bordered">
                
            <thead class="thead-light">
            <tr>
                <th scope="col">Nombre</th>
                <th scope="col">Abreviatura</th>
                <th scope="col">Tiempo en Minutos</th>
                <th scope="col">Acciones</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($servicios as $servicio)
                <tr>
                    <td>{{ $servicio->nombre }}</td>
                    <td>{{ $servicio->abreviatura }}</td>
                    <td style="text-align:center;">{{ $servicio->tiempominutos }}</td>
                    <td>
                        @can('Modificar')
                        <!-- Botón de editar -->
                        <button class="btn btn-sm btn-primary btn-edit" data-id="{{ $servicio->id }}" data-toggle="modal" data-target="#editModal-{{ $servicio->id }}">
                            ✏️
                        </button>
                        @endcan
                        @can('Eliminar')
                        <!-- Botón de eliminar -->
                        <form action="{{ route('servicios.destroy', $servicio->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger delete-btn">
                                🗑️
                            </button>
                        </form>
                        @endcan
                    </td>
                </tr>
                                <!-- Modal de edición para cada servicio -->
            <div class="modal fade" id="editModal-{{ $servicio->id }}" tabindex="-1" role="dialog" aria-labelledby="editModalLabel-{{ $servicio->id }}" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content shadow-lg rounded-lg">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="exampleModalLabel">Modificar datos del Procedimiento</h5>
                            <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <form action="{{ route('servicios.update', $servicio->id) }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="modal-body">
                                
                                <div class="mb-3">
                                    <label for="nombre-{{ $servicio->id }}" class="form-label">Nombre del Procedimiento</label>
                                    <input type="text" id="nombre-{{ $servicio->id }}" name="nombre" class="form-control" value="{{ $servicio->nombre }}" required>
                                </div>
                                <div class="mb-3 d-flex gap-3">
                                    <div class="flex-grow-1">
                                        <label for="abreviatura-{{ $servicio->id }}" class="form-label">Abreviatura</label>
                                        <input type="text" id="abreviatura-{{ $servicio->id }}" name="abreviatura" class="form-control" value="{{ $servicio->abreviatura }}" required>
                                    </div>
                                    
                                    <div class="flex-grow-1">
                                        <label for="tiempominutos-{{ $servicio->id }}" class="form-label">Tiempo en minutos</label>
                                        <input type="number" id="tiempominutos-{{ $servicio->id }}" name="tiempominutos" class="form-control" value="{{ $servicio->tiempominutos }}" required>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer bg-light">
                                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cerrar</button>
                                <button type="submit" class="btn btn-primary rounded-pill px-4">Actualizar</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            @endforeach
            </tbody>
        </table>
    </div>
    </div>
</div>

    <!-- Modal para crear servicio -->
    <div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content shadow-lg rounded-lg">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Agregar Nuevo Procedimiento</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="{{ route('servicios.store') }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre del Procedimiento</label>
                            <input type="text" id="nombre" name="nombre" class="form-control rounded-pill" required>
                        </div>
                        <div class="mb-3 d-flex gap-3">
                            <div class="flex-grow-1">
                                <label for="abreviatura" class="form-label">Abreviatura</label>
                                <input type="text" id="abreviatura" name="abreviatura" class="form-control rounded-pill" required>
                            </div>
                            
                            <div class="flex-grow-1">
                                <label for="tiempominutos" class="form-label">Tiempo (minutos)</label>
                                <input type="number" id="tiempominutos" name="tiempominutos" class="form-control rounded-pill" required>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cerrar</button>
                        <button type="submit" class="btn btn-primary rounded-pill px-4">Guardar</button>
                    </div>
                </form>
            </div>
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
                            <input type="text" id="searchActivity" class="form-control mr-2" placeholder="Buscar actividad" 
                                onkeyup="searchActivityAjax()" style="width: 60%;" autocomplete="off">
                            <input type="number" id="activityPercentage" class="form-control mr-2" placeholder="Porcentaje" min="0" max="100" style="width: 25%;">
                            
                            <!-- Actividad seleccionada (oculto) -->
                            <input type="hidden" id="selectedActivityId" />
                            <input type="hidden" id="servicioId" />
                            @can('Crear')
                            <button class="btn btn-success btn-sm" onclick="addActivityToList()">
                                <i class="fas fa-plus-circle"></i>
                            </button>
                            @endcan
                            <!-- Resultados de búsqueda -->
                            <ul id="activitySearchResults" class="list-group" style="display: none;">
                                <!-- Resultados de la búsqueda AJAX -->
                            </ul>
                        </div>
                        <!-- Tabla de actividades seleccionadas -->
                        <!-- Contenedor con scroll para la tabla -->
                        <div class="scrollable-table-container">
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

    <script>
        $(document).ready(function() {
            $('#serviciosTable').DataTable({
                //order: [], // Evita el ordenamiento automático por la primera columna
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

        function listActivities(servicioId) {
            return $.ajax({
                url: `/servicio/${servicioId}/actividades`, // URL de la ruta para obtener las actividades
                type: 'GET',
                success: function(data) {
                    const tableBody = document.getElementById('activitiesTableBody');
                    tableBody.innerHTML = ''; // Limpiar la tabla antes de agregar nuevos registros

                    if (data.length > 0) {
                        let counter = 1; // Iniciar el contador en 1
                        data.forEach(function(activityData, index) {
                            const activity = activityData.actividad; // Extraer la actividad
                            const isFirst = index === 0; // Es el primer registro
                            const isLast = index === data.length - 1; // Es el último registro
                            const newRow = document.createElement('tr');

                            // Determinar qué botones mostrar
                            let upButton = '';
                            let downButton = '';
                            if (!isFirst) {
                                upButton = `<button class="btn btn-sm btn-warning" onclick="moveActivity(${activityData.id}, 'up')" style="padding: 2px 8px; width: 30px; display: flex; justify-content: center; align-items: center;">⬆️</button>`;
                            }
                            if (!isLast) {
                                downButton = `<button class="btn btn-sm btn-warning" onclick="moveActivity(${activityData.id}, 'down')" style="padding: 2px 8px; width: 30px; display: flex; justify-content: center; align-items: center;">⬇️</button>`;
                            }

                            newRow.innerHTML = `
                                <td>${counter}</td> <!-- Contador -->
                                <td>${activity.nombre}</td> <!-- Nombre de la actividad -->
                                <td>${activityData.porcentaje}%</td> <!-- Porcentaje -->
                                <td style="display: flex; justify-content: center; gap: 5px;">
                                    ${upButton} ${downButton}  <!-- Botones de subir y bajar -->
                                </td>
                                <td>
                                    @can('Eliminar')
                                    <button class="btn btn-sm btn-transparent-red" 
                                            onclick="removeActivity(${activityData.id})"
                                            data-activity-id="${activityData.id}">🗑️</button>
                                    @endcan
                                </td>
                            `;
                            tableBody.appendChild(newRow);
                            counter++; // Incrementar el contador para la siguiente fila
                        });
                    } else {
                        // Si no hay actividades, mostrar un mensaje en la tabla
                        const newRow = document.createElement('tr');
                        newRow.innerHTML = '<td colspan="5" class="text-center">No hay actividades registradas.</td>';
                        tableBody.appendChild(newRow);
                    }
                },
                error: function() {
                    alert('Error al obtener las actividades. Por favor, intenta nuevamente.');
                }
            });
        }

        function openActivitiesModal(servicioId, nombre) {
            // Asignar el ID del servicio al campo oculto
            document.getElementById('servicioId').value = servicioId;

            $('#activitiesModalLabel').text(`Actividades para ${nombre}`);
            $('#activitiesModal').modal('show');
            // Listar las actividades
            listActivities(servicioId);

        }

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
            const servicioId = document.getElementById('servicioId').value;  // ID del servicio seleccionado

            if (activityId && activityPercentage && servicioId) {
                // Enviar los datos al servidor usando AJAX
                $.ajax({
                    url: '/actividad/agregar',  // Ruta de tu controlador
                    type: 'POST',
                    data: {
                        actividad_id: activityId, // Enviar el ID de la actividad
                        activity_percentage: activityPercentage,
                        servicio_id: servicioId,
                        _token: '{{ csrf_token() }}' // Token CSRF para la seguridad
                    },
                    success: function(response) {
                        if (response.success) {
                            // Limpiar los campos de entrada
                            document.getElementById('selectedActivityId').value = '';
                            document.getElementById('activityPercentage').value = '';
                            document.getElementById('searchActivity').value = '';

                            // Actualizar la tabla con la nueva lista de actividades
                            listActivities(servicioId);

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
            const servicioId = document.getElementById('servicioId').value;  // ID del servicio seleccionado
            Swal.fire({
                title: '¿Estás seguro?',
                text: 'Esta actividad será eliminada de la lista de actividades para este servicio.',
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
                                listActivities(servicioId);
                                Swal.fire('Eliminado', 'La actividad ha sido eliminada del servicio.', 'success');
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
        const userPermissions = @json(auth()->user()->getAllPermissions()->pluck('name'));
        function moveActivity(activityId, direction) {
            //console.log(`Intentando mover la actividad con ID: ${activityId} hacia ${direction}`);  // Depuración
            // Verificar el permiso
            if (!userPermissions.includes('Modificar')) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Permiso denegado',
                        text: 'No tienes permiso para realizar esta acción.',
                    });
                    return; // Detener la ejecución si no tiene permiso
                }
            $.ajax({
                url: `/actividades/${activityId}/move`,  // Utiliza la URL correcta que incluye el ID de la actividad
                type: 'POST',
                data: {
                    direction: direction,  // Enviar solo la dirección
                    _token: $('meta[name="csrf-token"]').attr('content')  // Asegúrate de incluir el token CSRF
                },
                success: function(response) {
                    console.log('Respuesta del servidor:', response);  // Depuración
                    if (response.success) {
                        Swal.fire({
                            title: 'Éxito!',
                            text: `Actividad movida ${direction === 'up' ? 'arriba' : 'abajo'} correctamente.`,
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then(() => {
                            // Volver a cargar las actividades después del movimiento
                            openActivitiesModal($('#servicioId').val(), $('#activitiesModalLabel').text().replace('Actividades para ', ''));
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
                    console.error('Error al mover la actividad:', error);  // Depuración
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
    document.addEventListener('DOMContentLoaded', function () {
    // Asignar evento de clic a todos los botones de edición
    document.querySelectorAll('.edit-btn').forEach(button => {
        button.addEventListener('click', function () {
            const id = this.dataset.id; // Captura el ID del botón de edición
            console.log("ID capturado:", id);

            // Realiza la solicitud para obtener los datos del servicio
            fetch(`/servicios/${id}/edit`)
                .then(response => response.json())
                .then(data => {
                    // Llena los campos del formulario con los datos del servicio
                    document.getElementById('servicioId').value = data.id;
                    
                    document.getElementById('nombre_servicio').value = data.nombre;
                    document.getElementById('abreviatura').value = data.abreviatura;
                    
                    document.getElementById('tiempominutos').value = data.tiempominutos;

                    // Establece la acción del formulario con la URL de actualización
                    document.getElementById('editForm').action = `/servicios/${data.id}`;

                    // Muestra el modal
                    $('#editModal').modal('show'); // Usando jQuery para mostrar el modal
                })
                .catch(error => console.error('Error al obtener los datos del servicio:', error));
        });
    });

    // Cierra el modal cuando se haga clic fuera del modal
    $('#editModal').on('click', function (event) {
        if ($(event.target).is('#editModal')) {
            $('#editModal').modal('hide'); // Usando jQuery para ocultar el modal
        }
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
    document.addEventListener('DOMContentLoaded', function () {
    document.querySelector('form').addEventListener('submit', function(event) {
        const nombreServicio = document.getElementById('nombre_servicio').value.trim();
        const abreviatura = document.getElementById('abreviatura').value.trim();
        

        // Validar nombre_servicio (solo letras, números y espacios)
        if (!/^[A-Za-z0-9\s]+$/.test(nombreServicio)) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'El nombre del servicio solo puede contener letras, números y espacios.',
            });
            event.preventDefault(); // Prevenir el envío del formulario
            return;
        }

        

        // Validar abreviatura (opcional: puedes agregar validaciones si lo necesitas)
        if (abreviatura && !/^[A-Za-z0-9]+$/.test(abreviatura)) {
            Swal.fire({
                icon: 'error',
                title: 'Error',
                text: 'La abreviatura solo puede contener letras y números.',
            });
            event.preventDefault(); // Prevenir el envío del formulario
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
    // Abre el modal para crear un nuevo servicio
    function openCreateModalServicio() {
        $('#createModal').modal('show'); // Usa jQuery para abrir el modal
    }

    // Cierra el modal para crear un nuevo servicio
    function closeCreateModalServicio() {
        $('#createModal').modal('hide'); // Usa jQuery para cerrar el modal
    }
</script>

    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
@stop
@section('css')
    <!-- Estilos CSS para ajustar alto automáticamente -->
    <style>
        #serviciosTable tbody tr {
            height: auto !important; /* Ajuste automático del alto de las filas */
        }

        #serviciosTable tbody td {
            vertical-align: middle !important; /* Centrado vertical */
            white-space: normal !important; /* Permitir que el texto ocupe varias líneas */
            word-wrap: break-word !important; /* Ajuste de palabras largas */
        }

        #serviciosTable thead th {
            vertical-align: middle !important; /* Centrado vertical en encabezados */
            height: auto !important; /* Ajustar la altura de los encabezados */
        }

        #serviciosTable thead {
            white-space: nowrap !important; /* Evitar saltos de línea en encabezados */
        }
       
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
            background-color: #f0f0f0; /* Resalta cuando el mouse pasa sobre un elemento */
        }

        .btn-transparent-red {
            background-color: transparent !important;
            color: #f44336 !important;
            border: 1px solid #f44336 !important;
            transition: all 0.3s ease; /* Suaviza la transición */
        }

        .btn-transparent-red:hover {
            background-color: #f44336 !important; /* Color rojo claro de fondo */
            color: white !important; /* Cambia el color del texto a blanco */
            border-color: #d32f2f !important; /* Un rojo más oscuro para el borde */
            box-shadow: 0 0 8px rgba(244, 67, 54, 0.5); /* Efecto de sombra */
        }
        .delete-btn {
            background-color: transparent !important;
            color: #f44336 !important; /* Rojo para el texto */
            border: 1px solid #f44336 !important; /* Borde rojo */
            transition: all 0.3s ease; /* Suaviza la transición */
        }

        .delete-btn:hover {
            background-color: #f44336 !important; /* Rojo claro en hover */
            color: white !important; /* Blanco para el texto */
            border-color: #d32f2f !important; /* Rojo más oscuro en hover */
            box-shadow: 0 0 8px rgba(244, 67, 54, 0.5); /* Sombra para resaltar */
        }
        .btn-edit {
            background-color: transparent !important;
            color: #007bff !important; /* Azul para el texto */
            border: 1px solid #007bff !important; /* Borde azul */
            transition: all 0.3s ease; /* Suaviza la transición */
        }

        .btn-edit:hover {
            background-color: #007bff !important; /* Azul claro en hover */
            color: white !important; /* Blanco para el texto */
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.5); /* Sombra para resaltar */
        }
        .scrollable-table-container {
            max-height: 270px; /* Ajusta esta altura para 4 filas visibles */
            overflow-y: auto;  /* Habilita el scroll vertical */
            border: 1px solid #ddd; /* Borde opcional */
            margin-bottom: 15px; /* Separación con otros elementos */
        }

        .scrollable-table-container .table {
            margin-bottom: 0; /* Evita márgenes extra en la tabla */
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
        #serviciosTable tbody td,
        #serviciosTable thead th {
            font-size: 0.85rem; /* Tamaño de letra reducido */
            padding-top: 4px;
            padding-bottom: 4px;
            line-height: 1.2;
        }
    </style>
@stop
