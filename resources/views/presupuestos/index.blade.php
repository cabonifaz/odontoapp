@extends('adminlte::page')

@section('title', 'Presupuestos - Vitaldentis')

@section('content_header')
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Presupuestos</h1>
            <!-- Botón que activa el modal -->
            @can('Crear Presupuesto')
            <button type="button" class="btn btn-primary rounded-pill px-4" data-toggle="modal" data-target="#createModal">
                <i class="fas fa-plus-circle"></i> Crear Nuevo Presupuesto
            </button>
            @endcan
        </div>
    </div>
    <div class="card-body">
        <div class="row align-items-center">
            <!-- Campo Fecha Inicial -->
            <div class="col-md-3 d-flex align-items-center">
                <label for="fecha-inicial" class="form-label me-2">Desde:</label>
                <input type="date" id="fecha-inicial" name="fecha_inicial" class="form-control" style="width: 70%;" value="{{ $fechaInicial }}">
            </div>

            <!-- Campo Fecha Final -->
            <div class="col-md-3 d-flex align-items-center">
                <label for="fecha-final" class="form-label me-2">Hasta:</label>
                <input type="date" id="fecha-final" name="fecha_final" class="form-control" style="width: 70%;" value="{{ $fechaFinal }}">
            </div>

            <!-- Campo Paciente -->
            <div class="col-md-6 d-flex align-items-center position-relative">
                <label for="buscar-paciente" class="form-label me-2">Paciente:</label>
                <div class="input-group position-relative">
                    <input type="text" id="buscar-paciente" class="form-control rounded-pill" autocomplete="off" value="{{ $nombrePaciente }}">
                    <input type="hidden" id="id-paciente" name="paciente_id" value="{{ $pacienteId }}"> <!-- Input oculto para el ID del paciente -->
                    <button type="button" class="btn btn-primary rounded-pill px-4 ml-2" id="btn-buscar-paciente">
                        <i class="fas fa-search"></i>
                    </button>
                    <ul id="resultados-busqueda" class="resultados-busqueda" style="display: none;"></ul>
                </div>
            </div>
        </div>
    </div>
    
</div>
@stop

@section('content')
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
            <table id="presupuestosTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Paciente</th>
                        <th>Médico</th>
                        <th>Fecha</th>
                        <th style="text-align: right;">Importe</th>
                        <th style="text-align: center;">Ver Detalle</th>
                        <th style="text-align: center;">Acciones</th>
                        <th style="text-align: center;">Estado</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse ($presupuestos as $presupuesto)
                        <tr>
                            <td>{{ $loop->iteration }}</td> <!-- Usar $loop->iteration para mostrar el número secuencial -->
                            <td>{{ $presupuesto->paciente->ape_paterno }} {{ $presupuesto->paciente->ape_materno }} {{ $presupuesto->paciente->nombres }}</td>
                            <td>{{ $presupuesto->medico->nombre_medico }}</td>
                            <td>{{ \Carbon\Carbon::parse($presupuesto->fecha)->format('d/m/Y') }}</td>
                            @if(auth()->user()->can('Ver importe presupuesto'))
                                <td style="text-align:right;">{{ number_format($presupuesto->importe, 2) }}</td>
                            @else
                                <td style="text-align:right;">*****</td>
                            @endif
                            <td>
                                <center>
                                    <button class="btn btn-sm btn-info" data-toggle="modal" data-target="#detalleModal" 
                                        onclick="cargarDetalle({{ $presupuesto->id }}, '{{ addslashes($presupuesto->paciente->ape_paterno ?? '') }} {{ addslashes($presupuesto->paciente->ape_materno ?? '') }} {{ addslashes($presupuesto->paciente->nombres ?? '') }}', {{ $presupuesto->estado ?? 0 }})">
                                        <i class="fas fa-eye"></i> <!-- Ícono de ver detalle -->
                                    </button>                                    
                                </center>
                            </td>
                            <td>
                                <center>
                                    @if ($presupuesto->estado != 4 && $presupuesto->estado != 1)
                                        @can('Modificar Presupuesto')
                                            <!-- Botón para abrir el modal de edición -->
                                            <button class="btn-edit btn btn-warning btn-sm" data-id="{{ $presupuesto->id }}" data-toggle="modal" data-target="#editModal" data-presupuesto="{{ json_encode($presupuesto) }}">
                                                ✏️
                                            </button>
                                        @endcan
                                    @endif
                                    <!-- Modal de Edición de Presupuesto -->
                                    <div id="editModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content shadow-lg rounded-lg">
                                                <div class="modal-header bg-warning text-white">
                                                    <h5 class="modal-title">Editar Presupuesto</h5>
                                                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form id="editPresupuestoForm" method="POST" action="">
                                                        @csrf
                                                        @method('PUT')
                                                        <div class="form-group position-relative">
                                                            <label for="editPaciente" class="text-left">Paciente</label>
                                                            <input type="text" class="form-control rounded-pill" id="editPaciente" name="paciente" placeholder="Buscar paciente..." autocomplete="off" required>
                                                            <input type="hidden" id="editPaciente_id" name="paciente_id">
                                                            <ul id="editSuggestions" class="list-group position-absolute w-100" style="display: none; z-index: 1050;"></ul>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="row">
                                                                <div class="col-md-8">
                                                                    <label for="editMedico_id" class="text-left">Médico</label>
                                                                    <select id="editMedico_id" name="medico_id" style="font-size: 14px;" class="form-control" required>
                                                                        @foreach ($medicosDatos as $medico)
                                                                            <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                                                        @endforeach
                                                                    </select>
                                                                </div>                                                                
                                                                <div class="col-md-4">
                                                                    <label for="editFecha" class="text-left">Fecha</label>
                                                                    <input type="date" id="editFecha" name="fecha" class="form-control" required>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer bg-light">
                                                    <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                                                    <button type="button" class="btn btn-primary rounded-pill px-4" id="updatePresupuesto">Guardar</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @if ($presupuesto->estado != 1)
                                        @can('Eliminar')
                                        <form action="{{ route('presupuestos.destroy', $presupuesto->id) }}" method="POST" class="d-inline">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="delete-btn btn btn-danger btn-sm">
                                                🗑️
                                            </button>
                                        </form>
                                        @endcan
                                    @endif
                                    @can('Imprimir presupuesto')
                                    <button type="button" class="btn btn-edit btn-sm" onclick="printPresupuesto({{ $presupuesto->id }})">
                                        🖨️
                                    </button>
                                    @endcan
                                </center>
                            </td>
                            <td style="text-align:center;">
                                @switch($presupuesto->estado)
                                    @case(0)
                                        <button class="btn btn-warning btn-sm" onclick="mostrarModalEstado({{ $presupuesto->id }}, {{ $presupuesto->importe }})">
                                            <i class="fas fa-exclamation-circle"></i> Emitido
                                        </button>
                                        @break
                                    @case(1)
                                        <span class="btn btn-success btn-sm">
                                            <i class="fas fa-check-circle"></i> Aprobado
                                        </span>
                                        @break
                                    @case(2)
                                        <span class="btn btn-info btn-sm">
                                            <i class="fas fa-spinner"></i> En Proceso
                                        </span>
                                        @break
                                    @case(3)
                                        <span class="btn btn-secondary btn-sm">
                                            <i class="fas fa-flag-checkered"></i> Culminado
                                        </span>
                                        @break
                                    @case(4)
                                        <span class="btn btn-light text-danger btn-sm">
                                            <i class="fas fa-times-circle"></i> Rechazado
                                        </span>
                                        @break
                                    @default
                                        Desconocido
                                @endswitch
                            </td>
                        </tr>
                        @empty
                            <tr>
                                <td colspan="8" class="text-center">No hay presupuestos disponibles.</td>
                            </tr>
                        @endforelse
                </tbody>
            </table>
        </div>    
    </div>
</div>

<!-- Modal de Creación de Presupuesto -->
<div id="createModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">Crear Nuevo Presupuesto</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="createPresupuestoForm" method="POST" action="{{ route('presupuestos.store') }}">
                    @csrf
                    <div class="form-group position-relative">
                        <label for="paciente">Paciente</label>
                        <input type="text" class="form-control rounded-pill" id="paciente" name="paciente" placeholder="Buscar paciente..." autocomplete="off" required>
                        <input type="hidden" id="id_paciente" name="id_paciente">
                        <ul id="suggestions" class="list-group position-absolute w-100" style="display: none; z-index: 1050;"></ul>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-8">
                                <label for="medico_id">Médico</label>
                                <select id="medico_id" name="medico_id" style="font-size: 14px;" class="form-control" required>
                                    @foreach ($medicosDatos as $medico)
                                        <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="fecha">Fecha</label>
                                <input type="date" id="fecha" name="fecha" class="form-control" value="{{ date('Y-m-d') }}" required>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary rounded-pill px-4" onclick="document.getElementById('createPresupuestoForm').submit()">Guardar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Detalle Presupuesto -->
<div class="modal fade" id="detallePresupuestoModal" tabindex="-1" role="dialog" aria-labelledby="detallePresupuestoModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white d-flex align-items-center">
                <h5 class="modal-title" id="detallePresupuestoModalLabel">Detalle del Presupuesto</h5>
                <input type="hidden" id="presupuesto_id">
                <!-- Botón al extremo derecho para abrir otro modal -->
                <button 
                    type="button" 
                    class="btn btn-success btn-sm ml-auto rounded-pill" 
                    id="openActivitiesModalButton">
                    <i class="fas fa-plus"></i> Agregar Tratamiento
                </button>

                <!-- Botón cerrar -->
                <button 
                    type="button" 
                    class="close text-white ml-2" 
                    data-dismiss="modal" 
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Contenedor para el Importe Total y el DataTable -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div id="dataTableWrapper" class="w-100">
                        <table id="detallePresupuestosTable" class="table table-striped">
                            <thead class="thead-grey">
                                <tr>
                                    <th>#</th>
                                    <th>Tratamiento</th>
                                    <th style="text-align:right;">Cantidad</th>
                                    <th style="text-align:right;">Precio</th>
                                    <th style="text-align:right;">Importe</th>
                                    <th style="text-align:center;">Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="tratamientosList">
                                <!-- Aquí se cargarán los tratamientos asociados dinámicamente -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="activitiesModal" tabindex="-1" aria-labelledby="activitiesModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-warning text-white">
                <h5 class="modal-title" id="activitiesModalLabel">Agregar Tratamiento</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                
                <form id="activitiesForm">
                    <input type="hidden" name="presupuestoId" id="presupuestoId">

                    <!-- Selección de Tratamiento -->
                    <div class="form-group row align-items-center">
                        <label for="tratamiento_select" class="col-md-3 col-form-label">Tratamiento</label>
                        <div class="col-md-9">
                            <select id="tratamiento_select" name="tratamiento_select" class="form-control" onchange="loadServicios(this.value)" style="font-size:14px;">
                                <option value="">Seleccione un tratamiento</option>
                                @foreach($tratamientos as $tratamiento)
                                    <option value="{{ $tratamiento->id }}">{{ $tratamiento->nombre }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>

                   <!-- Precio Base y Precio Final -->
                    <div id="priceFields" style="display: none;">                
                        @if(auth()->user()->can('Ver importe presupuesto'))
                            <div id="divImportes" class="form-group row align-items-center mt-3">
                        @else
                            <div id="divImportes" class="form-group row align-items-center mt-3 hidden">
                        @endif
                            <label for="precio_base" class="col-md-3 col-form-label">Precio Base</label>
                            <div class="col-md-3">
                                <input type="text" id="precio_base" class="form-control" readonly style="font-size:14px;" />
                            </div>

                            <label for="precio_final" class="col-md-3 col-form-label">Precio Final</label>
                            <div class="col-md-3">
                                <input type="text" id="precio_final" name="precio_final" class="form-control" style="font-size:14px;" />
                            </div>
                        </div>                        
                            <!-- Cantidad y Pieza Dental -->
                        <div class="form-group row align-items-center mt-3">
                            <label for="cantidad" class="col-md-3 col-form-label">Cantidad</label>
                            <div class="col-md-3">
                                <input type="number" id="cantidad" name="cantidad" class="form-control text-center" value="1" min="1" style="font-size:14px;" autocomplete="off" oninput="validarCantidad()">
                            </div>
                            <div class="row col-md-6 pieza-dental-field" style="display: flex; align-items: center;"> <!-- Aquí está la clase pieza-dental-field -->
                                <label for="pieza_dental" class="col-md-6 col-form-label">Pieza Dental</label>
                                <div class="col-md-6">
                                    <input type="text" id="pieza_dental" name="pieza_dental" class="form-control text-center" style="font-size:14px;" autocomplete="off" oninput="validarPiezaDental()">
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Cabecera con checkbox para seleccionar todos -->
                    <div class="procedimientos-header mt-3" id="procedimientosHeader" style="display: none;">
                        <div class="d-flex align-items-center">
                            <input type="checkbox" class="form-check-input" id="select_all" onclick="toggleSelectAll(this)">
                            <label class="form-check-label mb-0" for="select_all">Procedimientos Asociados</label>
                        </div>
                    </div>

                    <!-- Contenedor con procedimientos -->
                    <div class="scrollable-activities-list mt-2" id="activitiesList">
                        <!-- Lista de actividades generada dinámicamente -->
                    </div>
                </form>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal" aria-label="Close">Cancelar</button>
                <button type="button" class="btn btn-primary rounded-pill px-4" onclick="generateActivities()">Agregar</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalEditar" tabindex="-1" aria-labelledby="modalEditarLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-warning text-white">
                <h5 class="modal-title" id="modalEditarLabel">Editar Precio y Cantidad</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Tratamiento</label>
                    <div id="tratamientoNombre" class="form-control-plaintext"></div>
                </div>
                <div class="row">
                    <div class="col-4">
                        <label for="cantidad" class="form-label">Cantidad</label>
                        <input type="number" class="form-control" id="cantidad" min="1" step="1">
                    </div>
                    <div class="col-4">
                        <label for="precio" class="form-label">Precio</label>
                        <input 
                            type="text" 
                            class="form-control" 
                            id="precio" 
                            pattern="^[0-9]+(\.[0-9]{1,2})?$" 
                            title="Ingrese un número válido con hasta dos decimales"
                        >
                    </div>
                    <div class="col-4">
                        <label for="importe" class="form-label">Importe</label>
                        <input type="text" class="form-control" id="importe" readonly>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="btnCancelar" data-bs-dismiss="modal">Cancelar</button>
                <button type="button" class="btn btn-primary" id="btnActualizar">Actualizar</button>
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
        $('#presupuestosTable').DataTable({
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

        $('#detallePresupuestosTable').DataTable({
        order: [], // Evita el ordenamiento automático por la primera columna
        pageLength: 5, // Limitar a 5 registros por página
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
            },
            dom: '<"d-flex justify-content-between align-items-center"l<"#importeTotalContainer">>rtip',
            initComplete: function() {
                $('#importeTotalContainer').html('<h5>Importe Total: <span id="importeTotal">0.00</span></h5>');
            }

        });
    });
</script>
<script>
    // Variable global para almacenar pacientes
    let pacientes = [];

    // Función para cargar pacientes desde el servidor
    function cargarPacientes(callback) {
        const empresaId = '{{ $empresa_id }}'; // Asumiendo que pasaste el empresa_id a la vista
        $.ajax({
            url: '{{ route("pacientes.filtrar") }}',
            type: 'GET',
            data: {
                empresa_id: empresaId // Agrega empresa_id a los datos enviados
            },
            dataType: 'json',
            success: function(data) {
                //console.log('Pacientes cargados:', data);
                pacientes = data; // Actualiza la variable global con los datos recibidos
                if (typeof callback === 'function') {
                    callback(data);
                }
            },
            error: function(xhr, status, error) {
                console.error('Error al cargar los pacientes:', error);
                console.error('Estado:', status);
                console.error('Respuesta:', xhr.responseText);
            }
        });
    }

    // Función para filtrar y mostrar pacientes
    function filtrarPacientes($searchInput, $resultList) {
        const searchValue = $searchInput.val().toLowerCase();
        $resultList.empty(); // Limpiar la lista

        // Filtrar y agregar las opciones
        const filteredPacientes = pacientes.filter(paciente =>
            (paciente.nombres + ' ' + paciente.ape_paterno + ' ' + paciente.ape_materno).toLowerCase().includes(searchValue)
        );

        filteredPacientes.forEach(function(paciente) {
            const li = $('<li></li>').text(paciente.nombres + ' ' + paciente.ape_paterno + ' ' + paciente.ape_materno).data('id', paciente.id);
            $resultList.append(li);
        });

        // Mostrar la lista si hay resultados
        if (filteredPacientes.length > 0) {
            $resultList.show();
        } else {
            $resultList.hide();
        }
    }    


    // Función para seleccionar un paciente y actualizar los campos correspondientes
    function selectPaciente(item, modalId) {
        const selectedText = item.text();
        const selectedId = item.data('id');
        console.log("selectedText", selectedText);
        console.log("modalId", modalId);
        
        // Asignar el nombre al input de búsqueda para el modal de creación
        if (modalId === 'createModal') {
            $(`#${modalId} #paciente`).val(selectedText);
            $(`#${modalId} #id_paciente`).val(selectedId);
            // Ocultar la lista después de seleccionar
            $(`#${modalId} #suggestions`).hide();
        }

        // Asignar el nombre al input de búsqueda para el modal de edición
        if (modalId === 'editModal') {
            $('#editPaciente').val(selectedText);
            $('#editPaciente_id').val(selectedId);
            // Ocultar la lista después de seleccionar
            $('#editSuggestions').hide();
        }
    }

        document.addEventListener('DOMContentLoaded', function() {
            $('#createModal').on('show.bs.modal', function() {
                // Configurar pacientes
                const $pacienteSearch = $('#paciente');
                const $pacienteList = $('#suggestions');
                //console.log("$pacienteSearch", $pacienteSearch);
                // Limpiar la lista y cargar pacientes al mostrar el modal
                $pacienteList.empty();
                cargarPacientes(function() {
                    // Filtrar y mostrar pacientes
                    $pacienteSearch.on('input', function() {
                        filtrarPacientes($pacienteSearch, $pacienteList);
                    });

                    // Manejar la selección de un paciente
                    $pacienteList.on('click', 'li', function() {
                        selectPaciente($(this), 'createModal');
                    });
                });

                // Ocultar la lista al hacer clic fuera
                $(document).click(function(event) {
                    if (!$(event.target).closest('#paciente, #suggestions').length) {
                        $pacienteList.hide();
                    }
                });
            });

            // Limpiar los campos al cerrar el modal
            $('#createModal').on('hidden.bs.modal', function() {
                // Limpiar los campos correspondientes
                $('#paciente').val('');
                $('#id_paciente').val('');
                $('#suggestions').empty();
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
    // Manejar la apertura del modal de edición
    $('#editModal').on('show.bs.modal', function(event) {
        const button = $(event.relatedTarget);
        const presupuesto = button.data('presupuesto');

        // Verifica que el presupuesto esté definido
        if (!presupuesto) {
            console.error('El presupuesto no está definido');
            return;
        }

        // Obtener el nombre completo del paciente
        const nombreCompleto = `${presupuesto.paciente.nombres} ${presupuesto.paciente.ape_paterno} ${presupuesto.paciente.ape_materno}`;

        // Rellenar el formulario con los datos existentes
        $('#editPresupuestoForm').attr('action', `/presupuestos/${presupuesto.id}`);
        $('#editPaciente').val(nombreCompleto);
        $('#editPaciente_id').val(presupuesto.paciente_id);
        $('#editMedico_id').val(presupuesto.medico_id);
        $('#editFecha').val(presupuesto.fecha);
        

        // Configurar pacientes
        const $pacienteSearch = $('#editPaciente');
        const $pacienteList = $('#editSuggestions');

        // Limpiar la lista y cargar pacientes al mostrar el modal
        $pacienteList.empty();
        cargarPacientes(function() {
            // Filtrar y mostrar pacientes
            $pacienteSearch.on('input', function() {
                filtrarPacientes($pacienteSearch, $pacienteList);
            });

            // Manejar la selección de un paciente
            $pacienteList.on('click', 'li', function() {
                selectPaciente($(this), 'editModal');
            });
        });

        // Ocultar la lista al hacer clic fuera
        $(document).click(function(event) {
            if (!$(event.target).closest($pacienteSearch).length) {
                $pacienteList.hide();
            }
        });
    });

    // Limpiar los campos al cerrar el modal
    $('#editModal').on('hidden.bs.modal', function() {
        $('#editPresupuestoForm')[0].reset();
        $('#editSuggestions').empty();
    });
    // Validar el formulario antes de enviar
    document.getElementById('updatePresupuesto').addEventListener('click', function() {
            const form = document.getElementById('editPresupuestoForm');
            if (form.checkValidity()) {
                form.submit();
            } else {
                form.reportValidity();
            }
        });    
});
</script>
<script>
    
// Ajusta la función para que reciba `puedeVerImporte` como segundo argumento
function actualizarImporteTotal(detalles, puedeVerImporte) {
    console.log("detalles", detalles);
    console.log("puedeVerImporte", puedeVerImporte);

    let total = detalles.reduce((sum, detalle) => {
        // Solo suma el importe si el usuario tiene permiso para verlo
        return sum + ((detalle.precio * detalle.cantidad) || 0);
    }, 0);

    // Formatea y actualiza el importe total en el HTML
    $('#importeTotal').text(
        puedeVerImporte
            ? new Intl.NumberFormat('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 }).format(total)
            : '*****'
    );
}

function cargarDetalle(presupuestoId, nombrePaciente, estado) {
    let counter = 1; // Inicializar el contador
    $.ajax({
        url: `/presupuestos/${presupuestoId}/detalles`,
        method: 'GET',
        success: function(data) {
            let table = $('#detallePresupuestosTable').DataTable();
            table.clear();

            const puedeVerImporte = data.puedeVerImporte;

            if (data.detalles.length > 0) {
                data.detalles.forEach(detalle => {
                    const detalleId = detalle.id;
                    table.row.add([
                        counter++, 
                        `<div style="display: flex; align-items: center;">
                            <button class="btn btn-primary btn-sm mr-2" onclick="cargarActividades(${detalle.id}, this)">
                                <i class="fas fa-plus"></i>
                            </button>
                            ${detalle.tratamiento.nombre}
                        </div>`,
                        `<div style="text-align: right;">
                            ${new Intl.NumberFormat('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 }).format(detalle.cantidad)}
                        </div>`,
                        `<div style="text-align: right;">
                            ${puedeVerImporte ? 
                                new Intl.NumberFormat('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 }).format(detalle.precio) 
                                : '*****'}
                        </div>`,
                        `<div style="text-align: right;">
                            ${puedeVerImporte ? 
                                new Intl.NumberFormat('en-US', { minimumFractionDigits: 2, maximumFractionDigits: 2 }).format(detalle.precio * detalle.cantidad) 
                                : '*****'}
                        </div>`,
                        `<div style="text-align: center;">
                            ${estado === 0 ? `
                                @can('Ver importe presupuesto')
                                <button class="btn btn-warning btn-sm" onclick="abrirModalEditar(${detalleId}, '${detalle.tratamiento.nombre}', ${detalle.cantidad}, ${detalle.precio})">
                                    <i class="fas fa-edit"></i>
                                </button>
                                @endcan
                                <button class="btn delete-btn btn-sm" onclick="eliminarDetalle(${detalle.id})">
                                    <i class="fas fa-trash"></i>
                                </button>
                            ` : `
                                <button class="btn delete-btn btn-sm" disabled>
                                    <i class="fas fa-trash"></i>
                                </button>
                            `}
                        </div>`
                    ]);
                });
            } else {
                $('#detallePresupuestosTable tbody').append(`
                    <tr>
                        <td colspan="6" style="text-align: center;">
                            <div>No hay tratamientos asociados.</div>
                        </td>
                    </tr>
                `);
            }
            table.draw(false);

            $('#detallePresupuestoModalLabel').text(`Detalle del Presupuesto - ${nombrePaciente}`);
            $('#openActivitiesModalButton').prop('disabled', estado !== 0).toggle(estado === 0);
            $('#presupuesto_id').val(presupuestoId);
            $('#openActivitiesModalButton').attr('onclick', `openActivitiesModal(${presupuestoId})`);
            actualizarImporteTotal(data.detalles, data.puedeVerImporte);
            $('#detallePresupuestoModal').modal('show');
        },
        error: function(xhr) {
            console.error('Error al cargar los detalles:', xhr.responseText);
        }
    });
}
function abrirModalEditar(detalleId, tratamientoNombre, cantidadActual, precioActual) {
    // Llena los campos del modal con los valores actuales
    $('#modalEditar #tratamientoNombre').text(tratamientoNombre);
    $('#modalEditar #cantidad').val(cantidadActual);
    $('#modalEditar #precio').val(precioActual);
    $('#modalEditar #importe').val((cantidadActual * precioActual).toFixed(2));

    // Evento para calcular el importe cuando cambian cantidad o precio
    $('#modalEditar #cantidad, #modalEditar #precio').on('input', function () {
        const cantidad = parseInt($('#modalEditar #cantidad').val()) || 0;
        const precio = parseFloat($('#modalEditar #precio').val()) || 0;

        // Validaciones
        if (cantidad < 1) {
            $('#modalEditar #cantidad').val(1); // Restaura a 1 si es menor
        }
        if (precio < 1) {
            $('#modalEditar #precio').val(1); // Restaura a 1 si es menor
        }

        // Actualiza el importe
        $('#modalEditar #importe').val((cantidad * precio).toFixed(2));
    });

    // Muestra el modal
    $('#modalEditar').modal('show');

    // Evento para manejar la actualización
    $('#btnActualizar').off('click').on('click', function () {
        const nuevaCantidad = parseInt($('#modalEditar #cantidad').val());
        const nuevoPrecio = parseFloat($('#modalEditar #precio').val());

        if (nuevaCantidad >= 1 && nuevoPrecio >= 1) {
            fetch(`/detalle-presupuesto/${detalleId}/actualizar`, {
                method: 'POST', // Cambiar a PUT si sigues buenas prácticas RESTful
                headers: {
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ cantidad: nuevaCantidad, precio: nuevoPrecio })
            })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    Swal.fire('Éxito', data.message, 'success').then(() => {
                        location.reload(); // Actualizar la tabla o recargar la página
                    });
                } else {
                    Swal.fire('Error', data.message, 'error');
                }
            })
            .catch(error => {
                console.error('Error:', error);
                Swal.fire('Error', 'Ocurrió un problema al actualizar el detalle.', 'error');
            });
        } else {
            Swal.fire('Error', 'Valores inválidos. Verifica cantidad y precio.', 'error');
        }
    });


    // Botón Cancelar
    $('#btnCancelar').off('click').on('click', function () {
        $('#modalEditar').modal('hide');
    });
}

function cargarActividades(detalleId, button, marginLeft = '150px') {
    const row = $(button).closest('tr');

    if ($(button).find('i').hasClass('fa-plus')) {
        // Cambiar ícono y expandir
        $(button).find('i').removeClass('fa-plus').addClass('fa-minus');

        $.ajax({
            url: `/presupuestos/${detalleId}/actividades`, // Nueva URL con prefijo
            method: 'GET',
            success: function(actividades) {
                if (actividades.length > 0) {
                    const detalleRow = `
                        <tr class="actividad-detalle">
                            <td colspan="3">
                                <div style="overflow-x: auto;">
                                    <div style="margin-left: ${marginLeft};">
                                        <table class="table table-sm table-bordered mb-0">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Procedimiento</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                ${actividades.map((actividad, index) => `
                                                    <tr>
                                                        <td>${index + 1}</td>
                                                        <td>${actividad.servicio_nombre}</td>
                                                    </tr>
                                                `).join('')}
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </td>
                        </tr>`;
                    // Antes de insertar, asegurarse de eliminar filas duplicadas
                    row.nextAll('.actividad-detalle').remove();
                    $(detalleRow).insertAfter(row);
                } else {
                    const detalleRow = `
                        <tr class="actividad-detalle">
                            <td colspan="3" class="text-center">No hay actividades relacionadas.</td>
                        </tr>`;
                    // Antes de insertar, asegurarse de eliminar filas duplicadas
                    row.nextAll('.actividad-detalle').remove();
                    $(detalleRow).insertAfter(row);
                }
            },
            error: function(xhr) {
                console.error('Error al cargar actividades:', xhr.responseText);
            }
        });
    } else {
        // Cambiar ícono y colapsar
        $(button).find('i').removeClass('fa-minus').addClass('fa-plus');
        row.next('.actividad-detalle').remove();
    }
}


</script>

<script>
    const userPermissions = @json(auth()->user()->getAllPermissions()->pluck('name'));

    function openActivitiesModal(presupuestoId) {
        
        // Verificar el permiso
        if (!userPermissions.includes('Crear Presupuesto')) {
            Swal.fire({
                icon: 'error',
                title: 'Permiso denegado',
                text: 'No tienes permiso para realizar esta acción.',
            });
            return; // Detener la ejecución si no tiene permiso
        }

        // Configurar el modal con los datos básicos
        document.getElementById('activitiesModalLabel').innerText = `Agregar Tratamiento`;
        
        document.getElementById('presupuestoId').value = presupuestoId;
        document.getElementById('activitiesList').innerHTML = '';

        // Mostrar el modal
        new bootstrap.Modal(document.getElementById('activitiesModal')).show();
    }

    // Función para cargar los procedimientos asociados a un tratamiento
    function loadServicios(tratamientoId) {
        if (tratamientoId === "") {
            document.getElementById('activitiesList').innerHTML = '';
            document.getElementById('procedimientosHeader').style.display = 'none';
            return;
        }
        // Ocultar los campos de precio si no se selecciona un tratamiento
        if (!tratamientoId) {
                document.getElementById("priceFields").style.display = "none";
                document.getElementById("precio_base").value = "";
                document.getElementById("precio_final").value = "";
                return;
            }

            // Mostrar los campos de precio
            document.getElementById("priceFields").style.display = "block";

            // Realizar una petición AJAX para obtener el precio base
            fetch(`/get-tratamiento-precio/${tratamientoId}`)
                .then(response => response.json())
                .then(data => {
                    if (data && data.precio_base) {
                        document.getElementById("precio_base").value = data.precio_base; // Mostrar precio base
                        document.getElementById("precio_final").value = data.precio_base; // Setear precio final con el valor base
                    } 
                    // Mostrar u ocultar el campo Pieza Dental y su etiqueta basado en detalle_pieza
                    if (data && data.detalle_pieza === 1) {
                        document.querySelector(".pieza-dental-field").style.display = 'flex'; // Mostrar el campo y su etiqueta
                    } else {
                        document.querySelector(".pieza-dental-field").style.display = 'none'; // Ocultar el campo y su etiqueta
                    }
                })
                .catch(error => {
                    console.error("Error al cargar el precio base:", error);
                });
        
            fetch(`/tratamiento/${tratamientoId}/actividades`)
                .then(response => response.json())
                .then(data => {
                    const activitiesList = document.getElementById('activitiesList');
                    activitiesList.innerHTML = ''; // Limpiar la lista actual

                    if (data.length > 0) {
                        document.getElementById('procedimientosHeader').style.display = 'flex';
                    } else {
                        document.getElementById('procedimientosHeader').style.display = 'none';
                        // Ocultar los campos de precios (Precio Base y Precio Final)
                        document.getElementById('priceFields').style.display = 'none';
                    }

                    // Añadir los procedimientos a la lista
                    data.forEach(function(procedimiento) {
                        const div = document.createElement('div');
                        div.classList.add('procedimiento-item');

                        const input = document.createElement('input');
                        input.type = 'checkbox';
                        input.id = `procedimiento${procedimiento.servicio_id}`; // Cambié id
                        input.name = 'procedimientos[]';
                        input.value = procedimiento.servicio_id; // Cambiado a servicio_id

                        const label = document.createElement('label');
                        label.setAttribute('for', `procedimiento${procedimiento.servicio_id}`); // Ajuste en el "for"
                        label.textContent = procedimiento.servicio.nombre;

                        div.appendChild(input);
                        div.appendChild(label);
                        activitiesList.appendChild(div);
                    });
            })
            .catch(error => {
                console.error("Error fetching procedures:", error);
                Swal.fire('Error', 'No se pudieron cargar los procedimientos.', 'error');
            });
    }

    // Función para seleccionar/deseleccionar todos los checkboxes
    function toggleSelectAll(selectAllCheckbox) {
        const checkboxes = document.querySelectorAll('#activitiesList input[type="checkbox"]');
        checkboxes.forEach(checkbox => {
            checkbox.checked = selectAllCheckbox.checked;
        });
    }

    // Función para desmarcar el checkbox general si uno individual se deselecciona
    function monitorCheckboxes() {
        const selectAllCheckbox = document.getElementById('select_all');
        const checkboxes = document.querySelectorAll('#activitiesList input[type="checkbox"]');

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('change', () => {
                // Si alguno no está marcado, desmarcar el checkbox general
                if (![...checkboxes].every(chk => chk.checked)) {
                    selectAllCheckbox.checked = false;
                } else {
                    // Si todos están marcados, marcar el checkbox general
                    selectAllCheckbox.checked = true;
                }
            });
        });
    }

    // Llamar a esta función después de cargar la lista dinámica
    monitorCheckboxes();


    // Limpiar los campos cuando el modal se cierra
    $('#activitiesModal').on('hidden.bs.modal', function () {
        // Limpiar el formulario
        document.getElementById('activitiesForm').reset();
        document.getElementById('activitiesList').innerHTML = '';
        document.getElementById('procedimientosHeader').style.display = 'none';
        // Ocultar los campos de precios (Precio Base y Precio Final)
        document.getElementById('priceFields').style.display = 'none';
    });

    function generateActivities() {
        const tratamientoId = document.getElementById('tratamiento_select').value;
        const presupuestoId = document.getElementById('presupuestoId').value;
        const precioFinal = document.getElementById('precio_final').value;
        const cantidad = document.getElementById('cantidad').value;
        // Verificar si se seleccionó un tratamiento
        if (!tratamientoId) {
            Swal.fire('Error', 'Debes seleccionar un tratamiento.', 'error');
            return;
        }

        // Obtener los checkboxes seleccionados
        const checkboxes = document.querySelectorAll('#activitiesList input[name="procedimientos[]"]:checked');
        const actividades = Array.from(checkboxes).map(checkbox => ({
            actividad_id: checkbox.value
        }));

        // Verificar que al menos un procedimiento esté seleccionado
        if (actividades.length === 0) {
            Swal.fire('Error', 'Debes seleccionar al menos un procedimiento.', 'error');
            return;
        }
        // Verificar si el campo "pieza_dental" está presente y obtener su valor
        const piezaDentalElement = document.getElementById('pieza_dental');
        const piezaDental = piezaDentalElement ? piezaDentalElement.value : null;
        // Preparar los datos para enviar
        const dataToSend = {
            presupuestoId: presupuestoId,
            tratamientoId: tratamientoId,
            precioFinal: precioFinal,
            cantidad: cantidad,
            actividades: actividades,
            ...(piezaDental && { piezaDental }) // Solo incluir si el campo tiene valor
        };

        console.log("Datos enviados:", dataToSend); // Verifica qué se está enviando

        // Enviar los datos al servidor
        fetch('/generar-actividades', {
            method: 'POST',
            headers: {
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(dataToSend)
        })
        .then(response => {
            // Verificar si la respuesta es JSON
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            console.log("Respuesta del servidor:", data); // Verifica qué se está devolviendo
            if (data.success) {
                Swal.fire({
                    title: 'Éxito',
                    text: 'Actividades generadas con éxito',
                    icon: 'success',
                }).then(() => {
                    location.reload();
                });
            } else {
                Swal.fire('Error', data.message || 'No se pudieron generar las actividades.', 'error');
            }
        })
        .catch(error => {
            console.error("Error al generar actividades:", error);
            Swal.fire('Error', 'Ocurrió un problema al generar las actividades.', 'error');
        });
    }

    function eliminarDetalle(id) {
        Swal.fire({
            title: '¿Estás seguro?',
            text: "No podrás revertir esta acción.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            cancelButtonColor: '#3085d6',
            confirmButtonText: 'Sí, eliminarlo!',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                fetch(`/eliminar-detalle/${id}`, {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
                        'Content-Type': 'application/json',
                    }
                })
                .then(response => response.json())
                .then(data => {
                    if (data.success) {
                        Swal.fire(
                            'Eliminado!',
                            'El detalle ha sido eliminado.',
                            'success'
                        );
                        // Elimina la fila correspondiente de la tabla
                        //$('#detallePresupuestosTable').DataTable().row($(`[onclick="eliminarDetalle(${id})"]`).parents('tr')).remove().draw();
                        location.reload();
                    } else {
                        Swal.fire('Error', data.message || 'No se pudo eliminar el detalle.', 'error');
                    }
                })
                .catch(error => {
                    console.error('Error al eliminar el detalle:', error);
                    Swal.fire('Error', 'Ocurrió un problema al eliminar el detalle.', 'error');
                });
            }
        });
    }

</script>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const buscarPacienteInput = document.getElementById('buscar-paciente');
        const resultadosBusquedaDiv = document.getElementById('resultados-busqueda');
        const idPacienteInput = document.getElementById('id-paciente');

        buscarPacienteInput.addEventListener('input', function () {
            const term = this.value;
            // Si el valor del input "buscar-paciente" está vacío, borrar el valor del input oculto "id-paciente"
            if (term === '') {
                    idPacienteInput.value = '';
                }

            // Realiza la petición AJAX para filtrar pacientes
            if (term.length >= 2) {
                fetch(`/filtrar-pacientes?term=${term}`)
                    .then(response => response.json())
                    .then(data => {
                        resultadosBusquedaDiv.innerHTML = ''; // Limpia los resultados

                        if (data.length) {
                            data.forEach(paciente => {
                                const li = document.createElement('li');
                                li.textContent = `${paciente.nombres} ${paciente.ape_paterno} ${paciente.ape_materno}`;
                                li.dataset.id = paciente.id; // Almacena el ID del paciente
                                li.className = 'resultado-paciente'; // Clase para estilos

                                // Al hacer clic, asigna el nombre y el ID
                                li.addEventListener('click', () => {
                                    buscarPacienteInput.value = li.textContent; // Asigna el nombre al input
                                    idPacienteInput.value = li.dataset.id; // Asigna el ID al input oculto
                                    resultadosBusquedaDiv.innerHTML = ''; // Limpia los resultados
                                    resultadosBusquedaDiv.style.display = 'none'; // Oculta el UL si no hay resultados
                                });

                                resultadosBusquedaDiv.appendChild(li);
                            });
                            resultadosBusquedaDiv.style.display = 'block'; // Muestra el UL si hay resultados
                        } else {
                            const li = document.createElement('li');
                            li.textContent = 'No se encontraron pacientes.';
                            li.className = 'sin-resultados'; // Clase para estilos
                            resultadosBusquedaDiv.appendChild(li);
                            resultadosBusquedaDiv.style.display = 'block';
                        }
                    })
                    .catch(error => console.error('Error:', error));
            } else {
                resultadosBusquedaDiv.innerHTML = ''; // Limpia resultados si el input es menor de 2 caracteres
                resultadosBusquedaDiv.style.display = 'none'; // Oculta el UL si no hay resultados
            }
        });

        document.getElementById('btn-buscar-paciente').addEventListener('click', function () {
            const fechaInicialInput = document.getElementById('fecha-inicial');
            const fechaFinalInput = document.getElementById('fecha-final');
            const pacienteIdInput = document.getElementById('id-paciente');
            const nombrePacienteInput = document.getElementById('buscar-paciente');

            const pacienteId = pacienteIdInput.value;
            const fechaInicial = fechaInicialInput.value;
            const fechaFinal = fechaFinalInput.value;
            const nombrePaciente = nombrePacienteInput.value;

            // Verificar que las fechas están seleccionadas
            if (!fechaInicial || !fechaFinal) {
                alert('Por favor, selecciona ambas fechas.');
                return;
            }

            // Construir la URL con los parámetros necesarios
            let url = `/presupuestos?fecha_inicial=${fechaInicial}&fecha_final=${fechaFinal}`;
            
            if (pacienteId) {
                url += `&paciente_id=${pacienteId}&nombre_paciente=${encodeURIComponent(nombrePaciente)}`;
            }

            // Redirigir a la URL construida
            window.location.href = url;
        });

        // Mantener los valores de fecha, paciente y nombre del paciente al recargar la página
        window.addEventListener('load', function() {
            const urlParams = new URLSearchParams(window.location.search);
            const fechaInicial = urlParams.get('fecha_inicial');
            const fechaFinal = urlParams.get('fecha_final');
            const pacienteId = urlParams.get('paciente_id');
            const nombrePaciente = urlParams.get('nombre_paciente');

            if (fechaInicial) {
                document.getElementById('fecha-inicial').value = fechaInicial;
            }
            if (fechaFinal) {
                document.getElementById('fecha-final').value = fechaFinal;
            }
            if (pacienteId) {
                document.getElementById('id-paciente').value = pacienteId;
            }
            if (nombrePaciente) {
                document.getElementById('buscar-paciente').value = decodeURIComponent(nombrePaciente);
            }
        });
    });
</script>


<script>
    $(document).ready(function () {
        $('#buscar-paciente').on('input', function () {
            const $input = $(this);
            const $resultados = $('#resultados-busqueda');

            // Mostrar resultados justo debajo del input
            $resultados.css({
                top: $input.outerHeight() + 'px', // Debajo del input
                left: 0, // Alineado al borde izquierdo del contenedor
                display: 'block', // Mostrar el div
            });
        });

        // Ocultar resultados si se hace clic fuera del input o resultados
        $(document).on('click', function (e) {
            if (!$(e.target).closest('#buscar-paciente, #resultados-busqueda').length) {
                $('#resultados-busqueda').hide();
            }
        });
    });

</script>
<script>
    function mostrarModalEstado(presupuestoId, importe) {
        if (importe <= 0) {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'Debe ingresar primero el tratamiento para poder cambiar el estado.',
        });
        return;
    }
        @can('Aprobar Presupuesto')
            Swal.fire({
                title: 'Actualizar Estado',
                text: 'Selecciona la acción a realizar:',
                icon: 'question',
                showCancelButton: true,
                showDenyButton: true,
                confirmButtonText: 'Aprobar',
                denyButtonText: 'Rechazar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed) {
                    confirmarActualizarEstado(presupuestoId, 1, 'Aprobar');
                } else if (result.isDenied) {
                    confirmarActualizarEstado(presupuestoId, 4, 'Rechazar');
                }
            });
        @else
            Swal.fire({
                icon: 'error',
                title: 'Sin permisos',
                text: 'No tienes permisos para aprobar o rechazar presupuestos.',
            });
        @endcan
    }

    function confirmarActualizarEstado(presupuestoId, nuevoEstado, accion) {
        Swal.fire({
            title: `¿Estás seguro de ${accion.toLowerCase()} este presupuesto?`,
            text: "Esta acción no se puede deshacer.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, confirmar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    url: `/presupuestos/${presupuestoId}/actualizar-estado`,
                    method: 'POST',
                    data: {
                        estado: nuevoEstado,
                        _token: '{{ csrf_token() }}'
                    },
                    success: function(response) {
                        Swal.fire(
                            'Actualizado',
                            'El estado del presupuesto ha sido actualizado.',
                            'success'
                        ).then(() => {
                            location.reload();
                        });
                    },
                    error: function(xhr) {
                        console.error('Error al actualizar el estado:', xhr.responseText);
                        Swal.fire(
                            'Error',
                            'Hubo un problema al actualizar el estado.',
                            'error'
                        );
                    }
                });
            }
        });
    }

    function printPresupuesto(id) {
        // Llamar al servidor para generar y descargar el PDF
        window.open(`/presupuestos/${id}/imprimir`, '_blank');
    }

</script>
<script>
    // Función para validar la cantidad
    function validarCantidad() {
        var input = document.getElementById('cantidad');
        var value = input.value;

        // Eliminar caracteres no numéricos y permitir solo números enteros
        if (!/^\d+$/.test(value)) {
            input.value = value.replace(/\D/g, '');
        }

        // No permitir valores vacíos o nulos
        if (input.value === '' || parseInt(input.value) <= 0) {
            input.value = 1; // Establecer un valor predeterminado de 1 si está vacío o menor o igual a 0
        }
    }

    // Función para validar el campo Pieza Dental
    function validarPiezaDental() {
        var piezaDentalInput = document.getElementById('pieza_dental');
        var value = piezaDentalInput.value;

        // Permitir solo números, un punto, coma, barra y un espacio después de un número
        var validValue = value.replace(/[^0-9.,/ ]/g, ''); // Permitir caracteres válidos
        
        // Eliminar múltiples espacios, puntos, comas, barras
        validValue = validValue.replace(/ +/g, ' ');
        validValue = validValue.replace(/\.{2,}/g, '.');
        validValue = validValue.replace(/,{2,}/g, ',');
        validValue = validValue.replace(/\/{2,}/g, '/');
        
        // Asegurar un solo espacio después de cada carácter válido
        validValue = validValue.replace(/([0-9.,/])\s+/g, '$1 ');

        piezaDentalInput.value = validValue;
    }

    // Llamar a las funciones de validación al cargar la página
    document.addEventListener('DOMContentLoaded', function() {
        validarCantidad();
        validarPiezaDental();

        // Añadir eventos de input para los campos
        document.getElementById('cantidad').addEventListener('input', validarCantidad);
        document.getElementById('pieza_dental').addEventListener('input', validarPiezaDental);
    });

</script>

@stop
@section('css')
<style>

    .btn-primary {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        text-decoration: none;
    }

    .btn-primary:hover {
        background-color: #0056b3; /* Color más oscuro al pasar el cursor */
    }
    
    /* Asegúrate de que todos los UL de sugerencias tengan los estilos correctos */
    #suggestions,
    #editSuggestions {
        position: absolute; /* Posición relativa al contenedor padre */
        z-index: 1050; /* Asegura que esté sobre los demás elementos */
        width: 100%; /* Ajusta el ancho al contenedor padre */
        background-color: #fff; /* Fondo blanco */
        border: 1px solid #ddd; /* Bordes */
        border-radius: 4px; /* Bordes redondeados */
        max-height: 150px; /* Alto máximo */
        overflow-y: auto; /* Habilita scroll si excede el alto */
        list-style: none; /* Elimina los puntos de lista */
        margin: 0; /* Sin margen */
        padding: 0; /* Sin padding */
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* Sombra para resaltarlo */
    }

    /* Estilo de cada elemento de la lista */
    #suggestions li,
    #editSuggestions li {
        padding: 10px; /* Espaciado interno */
        border-bottom: 1px solid #ddd; /* Separador entre elementos */
        cursor: pointer; /* Cambia el cursor al estilo mano */
        transition: background-color 0.2s ease-in-out; /* Efecto de cambio suave */
        text-align: left; /* Asegura que el texto esté alineado a la izquierda */
    }

    /* El último elemento no tiene borde inferior */
    #suggestions li:last-child,
    #editSuggestions li:last-child {
        border-bottom: none;
    }

    /* Efecto hover */
    #suggestions li:hover,
    #editSuggestions li:hover {
        background-color: #b1fdb7; /* Cambia el fondo al pasar el mouse */
    }

    /* Asegúrate de que todos los labels estén alineados a la izquierda */
    .text-left {
        text-align: left !important;
        display: block; /* Asegura que los labels se comporten como bloques */
    }

    /* Ajusta todos los labels para que estén alineados a la izquierda */
    label {
        text-align: left;
        display: block;
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
    .dataTables_length select {
        border-radius: 50px;
        padding: 5px 5px;
    }
    /* Estilo de hover para las filas del cuerpo de la tabla */
    .table tbody tr:hover {
        background-color: #b1fdb7;
    }
/* Ajustar el estilo del checkbox en el encabezado */
.procedimientos-header {
        display: flex;
        justify-content: flex-start;
        align-items: center;
        padding: 5px;
        background-color: #f8f9fa;
        border: 1px solid #ddd;
        border-radius: 5px;
        margin-bottom: 10px;
        width: 100%; /* Asegura que ocupe todo el ancho disponible */
    }

    .procedimientos-header .form-check-input {
        margin-left: 2px;
        transform: scale(1.2); /* Aumentar tamaño del checkbox */
        flex-shrink: 0; /* Evitar que el checkbox se comprima */
    }

    .procedimientos-header .form-check-label {
        font-size: 16px;
        font-weight: bold; /* Texto en normal */
        margin-left: 35px;
    }

    /* Contenedor scrollable para la lista de procedimientos */
    .scrollable-activities-list {
        max-height: 210px; /* Alto fijo para la lista */
        overflow-y: auto; /* Activar scroll vertical */
        padding-right: 10px; /* Espacio para scrollbar */
        border: 1px solid #ddd; /* Borde para separar */
        border-radius: 5px;
        background-color: #f8f9fa;
    }

    /* Alternar colores de fondo en las filas */
    .scrollable-activities-list .procedimiento-item:nth-child(odd) {
        background-color: #f2f2f2; /* Color de fondo para filas impares */
    }

    .scrollable-activities-list .procedimiento-item:nth-child(even) {
        background-color: #ffffff; /* Color de fondo para filas pares */
    }

    /* Efecto hover en las filas de la lista */
    .scrollable-activities-list .procedimiento-item:hover {
        background-color: #b1fdb7; /* Color de fondo al pasar el mouse */
        cursor: pointer; /* Cambiar el cursor para indicar que es seleccionable */
        transition: background-color 0.3s ease; /* Transición suave */
    }

    /* Estilo para los checkboxes en la lista */
    .scrollable-activities-list input[type="checkbox"] {
        margin-left: 8px;
        margin-right: 10px; /* Espaciado entre checkbox y texto */
        flex-shrink: 0; /* Evitar que el checkbox se comprima */
    }

    .scrollable-activities-list label {
        font-size: 14px;
        font-weight: normal !important; /* Texto en normal */
    }
    .procedimiento-item {
        display: flex;
        align-items: center; /* Asegura la alineación vertical */
        gap: 8px; /* Espaciado entre el checkbox y el texto */
        margin-bottom: 5px; /* Espaciado entre filas */
    }
    /* Asegúrate de que el contenedor del buscador esté alineado a la derecha */
    .dataTables_filter {
        float: right; /* Alinea el contenedor a la derecha */
        text-align: right !important;
        margin-right: 0.5em; /* Añade un poco de margen a la derecha */
    }

    /* Ajustar el input del buscador para darle un poco de margen y mejor presentación */
    .dataTables_filter input {
        margin-left: 0.5em !important;
        display: inline-block; /* Asegura que el input se muestre correctamente */
        width: auto; /* Ajusta el ancho del input */
    }
    /* Estilo base del UL */
    #resultados-busqueda {
        position: absolute !important;
        z-index: 1050 !important;
        width: 100% !important;
        background-color: #fff !important;
        border: 1px solid #ddd !important;
        border-radius: 4px !important;
        max-height: 150px !important;
        overflow-y: auto !important;
        list-style: none !important;
        margin: 0 !important;
        padding: 0 !important;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1) !important;
    }

    /* Estilo de cada elemento de la lista */
    #resultados-busqueda li {
        padding: 10px !important;
        border-bottom: 1px solid #ddd !important;
        cursor: pointer !important;
        transition: background-color 0.2s ease-in-out !important;
    }

    /* El último elemento no tiene borde inferior */
    #resultados-busqueda li:last-child {
        border-bottom: none !important;
    }

    /* Efecto hover */
    #resultados-busqueda li:hover {
        background-color: #b1fdb7 !important;
    }
    .hidden {
        display: none;
    }
    #presupuestosTable tbody td,
    #presupuestosTable thead th {
        font-size: 0.85rem; /* Tamaño de letra reducido */
        padding-top: 4px;
        padding-bottom: 4px;
        line-height: 1.2;
    }
</style>

@stop