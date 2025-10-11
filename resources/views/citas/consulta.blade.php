@extends('adminlte::page')

@section('title', 'Seguimiento de Citas - Vitaldentis')

@section('content_header') 
<div class="card mb-0">
    <div class="card-header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            Citas del Paciente: {{ $nombrePaciente }}
        </h2>
    </div>
    <div class="card-body">
        <div class="row align-items-center">
             <!-- Campo Fecha Inicial -->
            <div class="col-md-3 d-flex align-items-center">
                <label for="fecha-inicial" class="form-label me-2 mr-2">Desde:</label>
                <input type="date" id="fecha-inicial" name="fecha-inicial" class="form-control" style="width: 70%;"
                    value="{{ $fechaInicial }}">
            </div>

            <!-- Campo Fecha Final -->
            <div class="col-md-3 d-flex align-items-center">
                <label for="fecha-final" class="form-label me-2 mr-2">Hasta:</label>
                <input type="date" id="fecha-final" name="fecha-final" class="form-control" style="width: 70%;"
                    value="{{ $fechaFinal }}">
            </div>
            <div class="col-md-6 d-flex align-items-center position-relative">
                <label for="buscar-paciente" class="form-label me-2 mr-2">Paciente:</label>
                <div class="input-group position-relative">
                    <input type="text" id="buscar-paciente" class="form-control rounded-pill" value="{{ $nombrePaciente }}" autocomplete="off">
                    <input type="hidden" id="id-paciente" name="id-paciente" value="{{ $pacienteId }}"> <!-- Input oculto para el ID del paciente -->
                    <button class="btn btn-primary rounded-pill px-4 ml-2" id="btn-buscar-paciente">
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

    <div class="container">
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
                <div class="table-responsive">
                <!-- Tabla de citas -->
                <table id="citasTable" class="table table-striped table-bordered">
                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Fecha</th>
                            <th scope="col">Hora Inicio</th>
                            <th scope="col">Hora Fin</th>
                            <th scope="col">Médico</th>
                            <th scope="col">Servicio</th>
                            <th scope="col">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($citas as $cita)
                            <tr>
                                <td>{{ \Carbon\Carbon::parse($cita->fecha_cita)->format('d/m/Y') }}</td>
                                <td>{{ \Carbon\Carbon::parse($cita->hora_inicio)->format('H:i') }}</td>
                                <td>{{ \Carbon\Carbon::parse($cita->hora_fin)->format('H:i') }}</td>
                                <td>{{ $cita->medico->nombre_medico }}</td>
                                <td>{{ $cita->servicio->nombre }}</td>
                                <td class="text-center">
                                    @if ($cita->presupuesto && $cita->presupuesto->detalles->isNotEmpty())
                                        <button 
                                            class="btn btn-success btn-sm rounded-pill px-4" 
                                            onclick="viewActivities({{ $cita->presupuesto_id }}, {{ $cita->tratamiento_id }})"
                                        >
                                            <i class="fas fa-eye"></i> Ver Actividades
                                        </button>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                    </tbody>

                </table>
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
        $('#citasTable').DataTable({
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
    document.addEventListener('DOMContentLoaded', function () {
        const buscarPacienteInput = document.getElementById('buscar-paciente');
        const resultadosBusquedaDiv = document.getElementById('resultados-busqueda');
        const idPacienteInput = document.getElementById('id-paciente');

        buscarPacienteInput.addEventListener('input', function () {
            const term = this.value;

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

        // Manejo del clic en el botón de buscar
        document.getElementById('btn-buscar-paciente').addEventListener('click', function () {
            const fechaInicialInput = document.getElementById('fecha-inicial');
            const fechaFinalInput = document.getElementById('fecha-final');

            const pacienteId = idPacienteInput.value;
            const fechaInicial = fechaInicialInput.value;
            const fechaFinal = fechaFinalInput.value;

            if (pacienteId) {
                if (!fechaInicial || !fechaFinal) {
                    alert('Por favor, selecciona ambas fechas.');
                    return;
                }

                // Redirige a la función que muestra las citas del paciente, incluyendo las fechas
                window.location.href = `/citas/consulta/${pacienteId}?fecha_inicial=${fechaInicial}&fecha_final=${fechaFinal}`;
            } else {
                alert('Por favor, selecciona un paciente.');
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
    function viewActivities(citaId, tratamientoId) {
        const url = `/citas/${citaId}/detalles-actividades/${tratamientoId}`; // URL con los dos parámetros
        window.location.href = url; // Redirigir a la nueva ruta
    }
</script>


@stop
@section('css')
    <style>
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

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .table tbody tr:hover {
            background-color: #b1fdb7;
        }

        .dataTables_length select {
            border-radius: 50px;
            padding: 5px 5px;
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
        font-size: 14px;
        font-weight: bold; /* Texto en normal */
        margin-left: 20px;
    }

    /* Contenedor scrollable para la lista de procedimientos */
    .scrollable-activities-list {
        max-height: 250px; /* Alto fijo para la lista */
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
    #citasTable tbody td,
    #citasTable thead th {
        font-size: 0.85rem; /* Tamaño de letra reducido */
        padding-top: 4px;
        padding-bottom: 4px;
        line-height: 1.2;
    }
    </style>
@endsection
