{{-- resources/views/pacientes/index.blade.php --}}
@extends('adminlte::page')

@section('title', 'Pacientes - Vitaldentis')

@section('content_header') 
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Pacientes</h1>
            @can('Crear')
            <!-- Botón que activa el modal para crear un nuevo paciente -->
            <button type="button" class="btn btn-primary rounded-pill px-4" data-toggle="modal" data-target="#createModal">
            <img src="{{ asset('img/paciente.png') }}" alt="Doctor" width="30">Crear Nuevo Paciente
            </button>
            @endcan
        </div>
    </div>
</div>
@stop

@section('content')
    
        <div class="card">
            <div class="card-header">
                <!-- Filtro de Pacientes -->
                <form method="GET" action="{{ route('pacientes.index') }}" class="form-inline">
                    <div class="form-group mb-2">
                        <select name="filter" id="filtro-pacientes" class="form-control mr-2 rounded-pill" onchange="updateInputType(this.value)">
                            <option value="nombre">Nombre Paciente</option>
                            <option value="dias">Días desde la última cita</option>
                            <option value="cumpleanos">Cumpleaños en el mes de</option>
                        </select>
                    </div>
                    <div id="input-container" class="form-group mb-2">
                        <!-- El input dinámico se agregará aquí -->
                    </div>
                    <button type="submit" class="btn btn-outline-primary mb-2 ml-2 rounded-pill px-4">
                        <i class="fas fa-search"></i> Buscar
                    </button>
                    
                    <!-- Botón de exportación (se muestra solo para el filtro de cumpleaños) -->
                    <button id="exportButton" class="btn btn-outline-success mb-2 ml-2 rounded-pill px-4" style="display: none;" onclick="exportToExcel(event)">
                        <i class="fas fa-file-excel"></i> Exportar a Excel Cumpleaños
                    </button>
                    <!-- Botón de exportación (se muestra solo para el filtro de cumpleaños) -->
                    <button id="exportButtonPDF" class="btn btn-outline-danger mb-2 ml-2 rounded-pill px-4" style="display: none;" onclick="exportToPDF(event)">
                        <i class="fas fa-file-pdf"></i> Exportar a PDF Cumpleaños
                    </button>
                    <!-- Botón de exportación general de pacientes -->
                    <button id="exportAllButton" class="btn btn-outline-primary mb-2 ml-2 rounded-pill px-4" onclick="exportPacientesGenerales()">
                        <i class="fas fa-file-excel"></i> Exportar Todos los Pacientes
                    </button>

                    <script>
                        function exportPacientesGenerales() {
                            window.open("{{ route('export.pacientes.general') }}");
                        }
                    </script>
                </form>
            </div>
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
                <table id="pacientesTable" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Historia</th>
                            <th>Nombres</th>
                            <th>TipoDoc</th>
                            <th>Número de Documento</th>
                            <th>Teléfono</th>
                            <th>Fecha Nacimiento</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($pacientes as $paciente)
                            <tr>
                                <td>{{ $paciente->historia }}</td>
                                <td>{{ $paciente->nombre_paciente }}</td>
                                <td>{{ $paciente->tipoDocumento->abrev ?? '' }}</td>
                                <td>{{ $paciente->numerodoc }}</td>
                                <td>{{ $paciente->telefono }}</td>
                                
                                <td>{{ \Carbon\Carbon::parse($paciente->fecha_nacimiento)->format('d/m/Y') }}</td>
                                <td>
                                    @can('Modificar')
                                    <button class="btn btn-sm btn-warning edit-btn" 
                                            data-id="{{ $paciente->id }}" 
                                            data-nombres="{{ $paciente->nombres }}" 
                                            data-ape_paterno="{{ $paciente->ape_paterno }}" 
                                            data-ape_materno="{{ $paciente->ape_materno }}" 
                                            data-telefono="{{ $paciente->telefono }}" 
                                            data-fecha_nacimiento="{{ $paciente->fecha_nacimiento }}" 
                                            data-historia="{{ $paciente->historia }}" 
                                            data-email="{{ $paciente->email }}" 
                                            data-tipo_documento="{{ $paciente->tipodocumento }}"
                                            data-dni="{{ $paciente->numerodoc }}" 
                                            data-direccion="{{ $paciente->direccion }}" 
                                            data-profesion="{{ $paciente->profesion }}"
                                            data-nacionalidad="{{ $paciente->nacionalidad }}"
                                            data-pais="{{ $paciente->pais_procedencia }}"
                                            data-sexo="{{ $paciente->sexo }}"
                                            data-estado="{{ $paciente->cod_estciv }}"
                                            data-toggle="modal" 
                                            data-target="#editModal">
                                        <i class="fas fa-edit"></i>
                                    </button>

                                    @endcan
                                    @can('Eliminar')
                                    <form action="{{ route('pacientes.destroy', $paciente->id) }}" method="POST" class="d-inline">
                                        @csrf
                                        @method('DELETE')
                                        <button type="button" class="btn btn-sm btn-danger delete-btn" data-id="{{ $paciente->id }}">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                                    @endcan
                                </td>
                            </tr>    
                        
                        @endforeach
                    </tbody>
                </table>
                    <!-- Enlaces de paginación -->
                    <div class="d-flex justify-content-between">
                        <div>
                            {{ $pacientes->links('vendor.pagination.bootstrap-4') }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
<!-- Modal de creación de nuevo Paciente -->
<div id="createModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="createModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Crear nuevo Paciente</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="createPacienteForm" method="POST" action="{{ route('pacientes.store') }}">
                    @csrf

                    <!-- Pestañas -->
                    <ul class="nav nav-tabs" id="pacienteTabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="datos-paciente-tab" data-toggle="tab" href="#datos-paciente" role="tab">Datos del Paciente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="datos-adicionales-tab" data-toggle="tab" href="#datos-adicionales" role="tab">Otros Datos</a>
                        </li>
                    </ul>

                    <!-- Contenido de las pestañas -->
                    <div class="tab-content mt-3" id="pacienteTabsContent">
                        <!-- Datos del Paciente -->
                        <div class="tab-pane fade show active" id="datos-paciente" role="tabpanel">
                            <!-- Fila para DNI, Historia y Fecha de Nacimiento -->
                            <div class="form-row">
                                <!-- Select para Tipo de Documento -->
                                <div class="form-group col-md-4">
                                    <label for="tipo_documento">Tipo de Documento</label>
                                    <select id="tipo_documento" name="tipo_documento" class="form-control" required>
                                        <option value="" disabled selected>Seleccionar...</option>
                                        @foreach ($tiposDocumento as $tipo)
                                            <option value="{{ $tipo->codigo }}">{{ $tipo->abrev }} - {{ $tipo->descripcion }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <!-- Campo para DNI -->
                                <div class="form-group col-md-4" id="dni-container">
                                    <!-- Aquí se insertará dinámicamente el input y el botón -->
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="create_historia">Historia</label>
                                    <input type="text" id="create_historia" name="historia" class="form-control rounded-pill" required
                                        pattern="[A-Za-z0-9]+" autocomplete="off"
                                        oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '').toUpperCase()">
                                </div>
                            </div>

                            <!-- Nombres y Apellidos -->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="create_nombre_paciente">Nombre Paciente</label>
                                    <input type="text" id="create_nombre_paciente" name="nombre_paciente" class="form-control rounded-pill" required
                                        pattern="[A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]+" autocomplete="off"
                                        oninput="this.value = this.value.replace(/[^A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]/g, '').toUpperCase()">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="create_ape_paterno">Apellido Paterno</label>
                                    <input type="text" id="create_ape_paterno" name="ape_paterno" class="form-control rounded-pill" required
                                        pattern="[A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]+" autocomplete="off"
                                        oninput="this.value = this.value.replace(/[^A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]/g, '').toUpperCase()">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="create_ape_materno" id="ape_materno_label">Apellido Materno</label>
                                    <input type="text" id="create_ape_materno" name="ape_materno" class="form-control rounded-pill"
                                        pattern="[A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]+" autocomplete="off"
                                        oninput="this.value = this.value.replace(/[^A-Za-zÑñÁáÉéÍíÓóÚúÜü\s]/g, '').toUpperCase()">
                                </div>
                            </div>
                            <!-- Teléfono y Email -->
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="create_fecha_nacimiento">Fecha de Nacimiento</label>
                                    <input type="date" id="create_fecha_nacimiento" name="fecha_nacimiento" class="form-control rounded-pill" required>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="create_telefono">Teléfono</label>
                                    <input type="text" id="create_telefono" name="telefono" class="form-control rounded-pill"
                                        inputmode="numeric" pattern="[0-9]*"
                                        oninput="this.value = this.value.replace(/[^0-9]/g, '')" autocomplete="off">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="create_email">Email</label>
                                    <input type="email" id="create_email" name="email" class="form-control rounded-pill"
                                        pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$">
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade" id="datos-adicionales" role="tabpanel">
                            <!--  -->
                            <div class="form-row">
                                <div class="form-group col-md-8">
                                    <label for="create_direccion">Dirección</label>
                                    <input type="text" id="create_direccion" name="direccion" class="form-control rounded-pill">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="create_profesion">Profesión/Ocupación</label>
                                    <input type="text" id="create_profesion" name="profesion" class="form-control rounded-pill"
                                        autocomplete="off">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="create_nacionalidad">Nacionalidad</label>
                                    <select id="create_nacionalidad" name="nacionalidad" class="form-control" required>
                                        <option value="1">Peruano</option>
                                        <option value="2">Extranjero</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="create_pais">País de procedencia</label>
                                    <input type="text" id="create_pais" name="pais" class="form-control rounded-pill"
                                        autocomplete="off">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="create_sexo">Sexo</label>
                                    <select id="create_sexo" name="sexo" class="form-control" required>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="create_estado">Estado Civil</label>
                                    <select id="create_estado" name="estado" class="form-control" required>
                                        <option value="1">Soltero</option>
                                        <option value="2">Casado</option>
                                        <option value="3">Divorciado</option>
                                        <option value="4">Viudo</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                <button type="submit" class="btn btn-primary rounded-pill px-4" form="createPacienteForm">Guardar</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal de Edición -->
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Modificar datos de Paciente</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="editPacienteForm" method="POST">
                    @csrf
                    @method('PUT')
                    <input type="hidden" id="editPacienteId" name="editPacienteId">
                    
                    <!-- Pestañas -->
                    <ul class="nav nav-tabs" id="editTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="edit-datos-paciente-tab" data-toggle="tab" href="#edit-datos-paciente" role="tab">Datos del Paciente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="edit-datos-adicionales-tab" data-toggle="tab" href="#edit-datos-adicionales" role="tab">Otros Datos</a>
                        </li>
                    </ul>
                    
                    <div class="tab-content" id="editTabContent">
                        <!-- Datos del Paciente -->
                        <div class="tab-pane fade show active" id="edit-datos-paciente" role="tabpanel">
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label for="edit_nombres">Nombres</label>
                                    <input type="text" class="form-control rounded-pill" id="edit_nombres" name="edit_nombres">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="edit_ape_paterno">Apellido Paterno</label>
                                    <input type="text" class="form-control rounded-pill" id="edit_ape_paterno" name="edit_ape_paterno">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="edit_ape_materno" id="edit_ape_materno_label">Apellido Materno</label>
                                    <input type="text" class="form-control rounded-pill" id="edit_ape_materno" name="edit_ape_materno">
                                </div>
                            </div>
                            <div class="form-row">
                                <!-- Select para Tipo de Documento -->
                                <div class="form-group col-md-4">
                                    <label for="edit_tipo_documento">Tipo de Documento</label>
                                    <select id="edit_tipo_documento" name="edit_tipo_documento" class="form-control" required>
                                        <option value="" disabled selected>Seleccionar...</option>
                                        @foreach ($tiposDocumento as $tipo)
                                            <option value="{{ $tipo->codigo }}">{{ $tipo->abrev }} - {{ $tipo->descripcion }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <!-- Campo para DNI -->
                                <div class="form-group col-md-4" id="edit_dni-container">
                                    <!-- Aquí se insertará dinámicamente el input y el botón -->
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="edit_historia">Historia Clínica</label>
                                    <input type="text" class="form-control rounded-pill" id="edit_historia" name="edit_historia">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="edit_fecha_nacimiento">Fecha de Nacimiento</label>
                                    <input type="date" class="form-control rounded-pill" id="edit_fecha_nacimiento" name="edit_fecha_nacimiento">
                                </div>

                                <div class="form-group col-md-3">
                                    <label for="edit_telefono">Teléfono</label>
                                    <input type="text" class="form-control rounded-pill" id="edit_telefono" name="edit_telefono">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="edit_email">Email</label>
                                    <input type="email" class="form-control rounded-pill" id="edit_email" name="edit_email">
                                </div>
                            </div>
                            
                        </div>
                    
                    <div class="tab-pane fade" id="edit-datos-adicionales" role="tabpanel">
                            <!--  -->
                            <div class="form-row">
                                <div class="form-group  col-md-8">
                                    <label for="edit_direccion">Dirección</label>
                                    <input type="text" class="form-control rounded-pill" id="edit_direccion" name="edit_direccion">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="edit_profesion">Profesión/Ocupación</label>
                                    <input type="text" id="edit_profesion" name="edit_profesion" class="form-control rounded-pill"
                                        autocomplete="off">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <label for="edit_nacionalidad">Nacionalidad</label>
                                    <select id="edit_nacionalidad" name="edit_nacionalidad" class="form-control" required>
                                        <option value="1">Peruano</option>
                                        <option value="2">Extranjero</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="edit_pais">País de procedencia</label>
                                    <input type="text" id="edit_pais" name="edit_pais" class="form-control rounded-pill"
                                        autocomplete="off">
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="edit_sexo">Sexo</label>
                                    <select id="edit_sexo" name="edit_sexo" class="form-control" required>
                                        <option value="1">Masculino</option>
                                        <option value="2">Femenino</option>
                                    </select>
                                </div>
                                <div class="form-group col-md-3">
                                    <label for="edit_estado">Estado Civil</label>
                                    <select id="edit_estado" name="edit_estado" class="form-control" required>
                                        <option value="1">Soltero</option>
                                        <option value="2">Casado</option>
                                        <option value="3">Divorciado</option>
                                        <option value="4">Viudo</option>
                                    </select>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <!-- Botones de Guardar y Cancelar -->
                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cancelar</button>
                        <button type="submit" id="updatePacienteBtn" class="btn btn-primary rounded-pill px-4">Guardar cambios</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@stop
    
@section('css')
<style>
    .pagination {
        justify-content: center; /* Centrar la paginación */
    }

    .pagination .page-item .page-link {
        padding: 10px 15px; /* Ajustar el padding */
        margin: 0 5px; /* Espaciado entre los enlaces */
        background-color: #007bff; /* Cambiar el color de fondo */
        color: #fff; /* Cambiar el color del texto */
        border-radius: 5px; /* Bordes redondeados */
    }

    .pagination .page-item.active .page-link {
        background-color: #0056b3; /* Color diferente para la página activa */
    }

    .pagination .page-item.disabled .page-link {
        background-color: #ccc; /* Color para elementos deshabilitados */
        color: #666; /* Color de texto para elementos deshabilitados */
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
        font-size: 14px; /* Tamaño de fuente adecuado */
        line-height: 1.5; /* Espaciado interno */
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
    #pacientesTable tbody td,
    #pacientesTable thead th {
        font-size: 0.85rem; /* Tamaño de letra reducido */
        padding-top: 4px;
        padding-bottom: 4px;
        line-height: 1.2;
    }
</style>
@stop
@section('js')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Ejecuta la función al cargar la página para mostrar el input correspondiente
        updateInputType(document.getElementById('filtro-pacientes').value);
    });

    // Mostrar u ocultar el botón de exportación dependiendo de la selección del filtro
    function updateInputType(value) {
        const container = document.getElementById('input-container');
        container.innerHTML = ''; // Limpiar el contenedor

        if (value === 'nombre') {
            const input = document.createElement('input');
            input.type = 'text';
            input.name = 'search';
            input.id = 'input-nombre';
            input.className = 'form-control rounded-pill';
            input.placeholder = 'Ingrese nombre del paciente';
            input.style.width = '300px'; // Asignar el ancho directamente
            container.appendChild(input);

            // Ocultar el botón de exportación si no es el filtro de cumpleaños
            document.getElementById('exportButton').style.display = 'none';
            document.getElementById('exportButtonPDF').style.display = 'none';
        } else if (value === 'dias') {
            const input = document.createElement('input');
            input.type = 'number';
            input.name = 'search';
            input.id = 'input-dias';
            input.className = 'form-control rounded-pill';
            input.style.width = '300px'; // Asignar el ancho directamente
            input.placeholder = 'Ingrese días desde la última cita';
            container.appendChild(input);

            // Ocultar el botón de exportación si no es el filtro de cumpleaños
            document.getElementById('exportButton').style.display = 'none';
            document.getElementById('exportButtonPDF').style.display = 'none';
        } else if (value === 'cumpleanos') {
            const select = document.createElement('select');
            select.name = 'search';
            select.id = 'select-meses';
            select.className = 'form-control rounded-pill';
            select.innerHTML = `
                <option value="1">Enero</option>
                <option value="2">Febrero</option>
                <option value="3">Marzo</option>
                <option value="4">Abril</option>
                <option value="5">Mayo</option>
                <option value="6">Junio</option>
                <option value="7">Julio</option>
                <option value="8">Agosto</option>
                <option value="9">Septiembre</option>
                <option value="10">Octubre</option>
                <option value="11">Noviembre</option>
                <option value="12">Diciembre</option>
            `;
            container.appendChild(select);

            // Mostrar el botón de exportación cuando se seleccione "Cumpleaños en el mes de"
            document.getElementById('exportButton').style.display = 'inline-block';
            document.getElementById('exportButtonPDF').style.display = 'inline-block';
        }
    }

    // Función para manejar el clic en el botón de exportar
    function exportToExcel(event) {
        event.preventDefault(); // Evitar la recarga de la página

        const mes = document.getElementById('select-meses').value; // Obtener el mes seleccionado

        // Verificar si se seleccionó un mes
        if (!mes) {
            alert("Por favor, selecciona un mes para exportar los datos.");
            return;
        }

        // Redirigir al servidor para generar y descargar el archivo Excel
        const url = `/pacientes/exportar-cumpleanos?search=${mes}`;
        window.location.href = url;
    }
    function exportToPDF(event) {
        event.preventDefault(); // Evitar la recarga de la página

        const mes = document.getElementById('select-meses').value; // Obtener el mes seleccionado

        // Verificar si se seleccionó un mes
        if (!mes) {
            alert("Por favor, selecciona un mes para exportar los datos.");
            return;
        }

        // Redirigir al servidor para generar y descargar el archivo Excel
        const url = `/pacientes/exportar-cumpleanos-pdf?search=${mes}`;
        window.location.href = url;
    }

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

<!-- Añadir este script para mostrar el mensaje de éxito -->
    @if(session('success'))
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

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // Al hacer clic en el botón de editar
        $('.edit-btn').on('click', function () {
            var datos = {
        id: $(this).data('id'),
        nombres: $(this).data('nombres'),
        ape_paterno: $(this).data('ape_paterno'),
        ape_materno: $(this).data('ape_materno'),
        telefono: $(this).data('telefono'),
        fecha_nacimiento: $(this).data('fecha_nacimiento'),
        historia: $(this).data('historia'),
        email: $(this).data('email'),
        dni: $(this).data('dni'),
        direccion: $(this).data('direccion'),
        tipoDocumento: $(this).data('tipo_documento'),
        profesion: $(this).data('profesion'),
        nacionalidad: $(this).data('nacionalidad'),
        sexo: $(this).data('sexo'),
        estado: $(this).data('estado')
    };

    console.log("Datos obtenidos:", datos);

            // Obtener los datos del botón
            var id = $(this).data('id');
            var nombres = $(this).data('nombres');
            var ape_paterno = $(this).data('ape_paterno');
            var ape_materno = $(this).data('ape_materno');
            var telefono = $(this).data('telefono');
            var fecha_nacimiento = $(this).data('fecha_nacimiento');
            var historia = $(this).data('historia');
            var email = $(this).data('email');
            var dni = $(this).data('dni');
            var direccion = $(this).data('direccion');
            var tipoDocumento = $(this).data('tipo_documento'); // Obtener tipo de documento
            var profesion = $(this).data('profesion');
            var nacionalidad = $(this).data('nacionalidad');
            var pais = $(this).data('pais');
            var sexo = $(this).data('sexo');
            var estado = $(this).data('estado');
            
            console.log("estado",estado);
            console.log("sexo",sexo);
            // Asignar los datos a los campos del modal
            $('#editPacienteId').val(id);
            $('#edit_nombres').val(nombres);
            $('#edit_ape_paterno').val(ape_paterno);
            $('#edit_ape_materno').val(ape_materno);
            $('#edit_telefono').val(telefono);
            $('#edit_fecha_nacimiento').val(fecha_nacimiento);
            $('#edit_historia').val(historia);
            $('#edit_email').val(email);
            $('#edit_direccion').val(direccion);
            $('#edit_profesion').val(profesion);
            $('#edit_nacionalidad').val(nacionalidad);
            $('#edit_pais').val(pais);
            $('#edit_estado').val(estado);
            $('#edit_sexo').val(sexo);

            // Asignar el valor al select de tipo de documento
            $('#edit_tipo_documento').val(tipoDocumento);

            // Llamar a la función para generar el campo DNI dinámico con su valor
            updateEditDni(tipoDocumento, dni);

            // Mostrar el modal
            $('#editModal').modal('show');
        });

        // Detectar el cambio en el select tipo_documento
        $('#edit_tipo_documento').on('change', function () {
            // Obtener el valor seleccionado del select
            const tipoDocumentoSeleccionado = $(this).val();

            // Llamar a la función para actualizar el campo DNI
            updateEditDni(tipoDocumentoSeleccionado, '');
        });

        // Función para generar el campo DNI dinámicamente con el label
        function updateEditDni(tipoDocumento, dniValue) {
            const container = document.getElementById('edit_dni-container');
            container.innerHTML = ''; // Limpiar el contenedor

            // Crear el label "Documento"
            const dniLabel = document.createElement('label');
            dniLabel.setAttribute('for', 'edit_dni');
            dniLabel.className = 'form-label';
            dniLabel.textContent = 'Documento';

            // Crear el campo DNI
            const dniInput = document.createElement('input');
            dniInput.type = 'text';
            dniInput.name = 'edit_dni';
            dniInput.id = 'edit_dni';
            dniInput.className = 'form-control rounded-pill';
            dniInput.required = true;
            dniInput.value = dniValue; // Asignar el valor del DNI recibido

            // Configuración dinámica según el tipo de documento
            switch (tipoDocumento) {
                case '1': // DNI
                    dniInput.setAttribute('maxlength', '8');
                    dniInput.setAttribute('placeholder', '8 dígitos numéricos');
                    dniInput.addEventListener('input', function () {
                        dniInput.value = dniInput.value.replace(/[^0-9]/g, '').slice(0, 8); // Solo números
                    });
                    break;

                case '7': // PAS (Pasaporte)
                    dniInput.setAttribute('maxlength', '8');
                    dniInput.setAttribute('placeholder', 'Formato: AB123456 o A1234567');
                    dniInput.addEventListener('input', function () {
                        let value = dniInput.value.toUpperCase(); // Convertir a mayúsculas

                        // Validar formato:
                        const firstChar = value.charAt(0).replace(/[^A-Z]/g, ''); // Solo letra en la primera posición
                        const secondChar = value.charAt(1).replace(/[^A-Z0-9]/g, ''); // Letra o número en la segunda posición
                        const rest = value.slice(2).replace(/[^0-9]/g, ''); // Solo números a partir de la tercera posición

                        // Combinar las partes y limitar a 8 caracteres
                        dniInput.value = (firstChar + secondChar + rest).slice(0, 8);
                    });
                    break;

                case '4': // CEX
                case 'A': // CDI
                case 'E': // TAM
                    dniInput.setAttribute('maxlength', '20');
                    dniInput.setAttribute('placeholder', 'Máximo 20 caracteres alfanuméricos sin espacios');
                    dniInput.addEventListener('input', function () {
                        dniInput.value = dniInput.value.replace(/[^A-Za-z0-9]/g, '').slice(0, 20); // Alfanumérico sin espacios
                    });
                    break;

                default:
                    dniInput.setAttribute('maxlength', '20');
                    dniInput.setAttribute('placeholder', 'Ingrese su documento');
                    dniInput.addEventListener('input', function () {
                        dniInput.value = dniInput.value.slice(0, 20);
                    });
                    break;
            }

            // Agregar el label y el input al contenedor
            container.appendChild(dniLabel);
            container.appendChild(dniInput);
        }
    });

</script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Manejar el envío del formulario mediante AJAX
        $('#editPacienteForm').on('submit', function(e) {
            e.preventDefault(); // Evitar el envío normal del formulario

            var formData = $(this).serialize(); // Obtener los datos del formulario

            $.ajax({
                type: 'PUT',
                url: '/pacientes/' + $('#editPacienteId').val(), // Ruta para actualizar
                data: formData,
                success: function(response) {
                    // Manejar la respuesta exitosa
                    // Por ejemplo, puedes cerrar el modal y recargar la tabla de pacientes
                    $('#editModal').modal('hide');
                    //alert('Paciente actualizado con éxito');
                    Swal.fire({
                        icon: 'success',
                        title: 'Éxito',
                        text: 'Paciente actualizado con éxito',
                        confirmButtonText: 'OK'
                    });
                    // Aquí puedes agregar código para actualizar la vista (ej. recargar la tabla)
                    location.reload();
                },
                error: function(xhr) {
                    // Manejar errores
                    //alert('Error al actualizar el paciente');
                    console.log(xhr.responseText);
                    
                    location.reload();
                }
            });
        });
    });
</script>


<script>
    // Función para obtener la fecha actual en formato yyyy-mm-dd
    function getFormattedDate() {
        const date = new Date();
        const day = String(date.getDate()).padStart(2, '0');
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const year = date.getFullYear();
        return `${year}-${month}-${day}`; // Formato yyyy-mm-dd para los inputs tipo date
    }

    document.addEventListener('DOMContentLoaded', function() {// Asignar la fecha actual al input de Fecha de Ingreso
    
        $('#create_fecha_nacimiento').val(getFormattedDate());
    
    });
    
    document.addEventListener('DOMContentLoaded', function() {
        $(document).on('submit', '#createPacienteForm', function(event) {
            event.preventDefault(); // Previene el envío del formulario

            // Validar campos antes de enviar
            let historia = $('#create_historia').val().trim();
            let dni = $('#create_dni').val().trim();
            let tipodocumento = $('#tipo_documento').val(); // Obtener el valor del select tipo_documento
            console.log("tipodocumento",tipodocumento);
            if (tipodocumento === null || tipodocumento === '' || historia === '' || dni === '') {
                Swal.fire('Error', 'Todos los campos, incluido el Tipo de Documento, son obligatorios', 'error');
            } else {
                this.submit(); // Envía el formulario si los campos son válidos
            }
        });
    });


    function buscarDni() {
        let dni = $('#create_dni').val().trim();
        console.log("dni: ",dni);
        if (dni === '') {
            Swal.fire('Error', 'Ingrese un DNI para buscar', 'error');
            return;
        }

        // Llamada AJAX a la ruta de Laravel
        $.ajax({
            url: '{{ route("buscar.dni") }}', // Ruta para buscar en la API
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
            valor: dni,
            request_by: "Sistema Consultorios del norte",
            user_email: '{{ Auth::user()->email }}' // Pasando el email del usuario autenticado
        }),
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
            success: function(data) {
                console.log('Response Data:', data); // Agrega este console.log para ver el resultado del response
                if (data.error) {
                    Swal.fire('Error', data.error, 'error');
                } else {
                    if (data.nombres) {
                        $('#create_nombre_paciente').val(data.nombres || '');
                        $('#create_ape_paterno').val(data.ape_paterno || '');
                        $('#create_ape_materno').val(data.ape_materno || '');
                    } else {
                        Swal.fire('Advertencia', 'No se encontraron datos para el DNI proporcionado', 'warning');
                    }
                }
            },
            error: function(error) {
                console.error('Error:', error);
                Swal.fire('Error', 'Ocurrió un error al buscar el DNI.', 'error');
            }
        });
    }

</script>
<script>
document.addEventListener('DOMContentLoaded', function () {
    const tipoDocumento = document.getElementById('tipo_documento');
    const container = document.getElementById('dni-container'); // Contenedor para el label, input y botón dinámico

    // Configurar el input al cargar la página, si hay un tipo preseleccionado
    updateDniInput(tipoDocumento.value);

    // Actualizar dinámicamente al cambiar el tipo de documento
    tipoDocumento.addEventListener('change', function () {
        updateDniInput(tipoDocumento.value);
    });

    function updateDniInput(value) {
        // Limpiar el contenedor
        container.innerHTML = '';

        // Crear la etiqueta "Documento"
        const dniLabel = document.createElement('label');
        dniLabel.setAttribute('for', 'create_dni');
        dniLabel.className = 'form-label';
        dniLabel.textContent = 'Documento';

        // Crear estructura según el tipo de documento seleccionado
        switch (value) {
            case '1': // DNI
                // Crear el div contenedor de la clase "input-group"
                const inputGroup = document.createElement('div');
                inputGroup.className = 'input-group';

                // Crear el input para DNI
                const dniInput = document.createElement('input');
                dniInput.type = 'text';
                dniInput.name = 'dni';
                dniInput.id = 'create_dni';
                dniInput.className = 'form-control rounded-pill';
                dniInput.required = true;
                dniInput.setAttribute('maxlength', '8');
                dniInput.setAttribute('placeholder', '8 dígitos numéricos');
                dniInput.addEventListener('input', function () {
                    dniInput.value = dniInput.value.replace(/[^0-9]/g, '').slice(0, 8); // Solo números
                });

                // Crear el botón "Buscar"
                const buscarBtn = document.createElement('button');
                buscarBtn.type = 'button';
                buscarBtn.className = 'btn btn-primary rounded-pill px-4';
                buscarBtn.id = 'buscar_dni';
                buscarBtn.innerHTML = '<i class="fas fa-search"></i>';
                buscarBtn.onclick = buscarDni; // Llamar a la función buscarDni

                // Crear el div para el botón con clase "input-group-append"
                const inputGroupAppend = document.createElement('div');
                inputGroupAppend.className = 'input-group-append';
                inputGroupAppend.appendChild(buscarBtn);

                // Añadir el input y el botón al div "input-group"
                inputGroup.appendChild(dniInput);
                inputGroup.appendChild(inputGroupAppend);

                // Agregar la etiqueta y el grupo al contenedor
                container.appendChild(dniLabel);
                container.appendChild(inputGroup);
                break;

                case '7': // PAS (Pasaporte)
                    // Crear el input para PAS
                    const pasInput = document.createElement('input');
                    pasInput.type = 'text';
                    pasInput.name = 'dni';
                    pasInput.id = 'create_dni';
                    pasInput.className = 'form-control rounded-pill';
                    pasInput.required = true;
                    pasInput.setAttribute('maxlength', '8');
                    pasInput.setAttribute('placeholder', 'Formato: P4 o PA123456');

                    // Validar el formato del pasaporte
                    pasInput.addEventListener('input', function () {
                        let value = pasInput.value.toUpperCase(); // Convertir a mayúsculas
                        const firstChar = value.charAt(0).replace(/[^A-Z]/g, ''); // Solo letra en la primera posición
                        const secondChar = value.charAt(1).replace(/[^A-Z0-9]/g, ''); // Segunda posición puede ser letra o número
                        const rest = value.slice(2).replace(/[^0-9]/g, ''); // Solo números a partir de la tercera posición
                        pasInput.value = (firstChar + secondChar + rest).slice(0, 8); // Combinar y limitar a 8 caracteres
                    });

                    // Agregar la etiqueta y el input al contenedor
                    container.appendChild(dniLabel);
                    container.appendChild(pasInput);
                    break;


            case '4': // CEX
            case 'A': // CDI
            case 'E': // TAM
                // Crear el input para CEX, CDI o TAM
                const genericInput = document.createElement('input');
                genericInput.type = 'text';
                genericInput.name = 'dni';
                genericInput.id = 'create_dni';
                genericInput.className = 'form-control rounded-pill';
                genericInput.required = true;
                genericInput.setAttribute('maxlength', '20');
                genericInput.setAttribute('placeholder', 'Máximo 20 caracteres sin espacios');
                genericInput.addEventListener('input', function () {
                    genericInput.value = genericInput.value.replace(/[^A-Za-z0-9]/g, '').slice(0, 20); // Alfanumérico sin espacios
                });

                // Agregar la etiqueta y el input al contenedor
                container.appendChild(dniLabel);
                container.appendChild(genericInput);
                break;

            default:
                // Crear input genérico por defecto
                const defaultInput = document.createElement('input');
                defaultInput.type = 'text';
                defaultInput.name = 'dni';
                defaultInput.id = 'create_dni';
                defaultInput.className = 'form-control rounded-pill';
                defaultInput.required = true;
                defaultInput.setAttribute('maxlength', '20');
                defaultInput.setAttribute('placeholder', 'Ingrese su documento');
                defaultInput.addEventListener('input', function () {
                    defaultInput.value = defaultInput.value.slice(0, 20); // Restricción genérica
                });

                // Agregar la etiqueta y el input al contenedor
                container.appendChild(dniLabel);
                container.appendChild(defaultInput);
                break;
        }
    }

});
document.addEventListener('DOMContentLoaded', function () {
    // Campos y etiquetas para el formulario de creación
    const tipoDocumentoCreateSelect = document.getElementById('tipo_documento');
    const apeMaternoCreateInput = document.getElementById('create_ape_materno');
    const apeMaternoCreateLabel = document.getElementById('ape_materno_label');

    // Campos y etiquetas para el formulario de edición
    const tipoDocumentoEditSelect = document.getElementById('edit_tipo_documento');
    const apeMaternoEditInput = document.getElementById('edit_ape_materno');
    const apeMaternoEditLabel = document.getElementById('edit_ape_materno_label');

    // Función para manejar la lógica dinámica según el tipo de documento
    function handleApeMaternoValidation(tipoDocumento, apeMaternoInput, apeMaternoLabel) {
        if (tipoDocumento.value === '1') { // Si es DNI
            apeMaternoInput.setAttribute('required', 'required');
            apeMaternoLabel.textContent = 'Apellido Materno (Requerido)';
        } else {
            apeMaternoInput.removeAttribute('required');
            apeMaternoLabel.textContent = 'Apellido Materno (Opcional)';
        }
    }

    // Evento para el select en el formulario de creación
    tipoDocumentoCreateSelect.addEventListener('change', function () {
        handleApeMaternoValidation(tipoDocumentoCreateSelect, apeMaternoCreateInput, apeMaternoCreateLabel);
    });

    // Evento para el select en el formulario de edición
    tipoDocumentoEditSelect.addEventListener('change', function () {
        handleApeMaternoValidation(tipoDocumentoEditSelect, apeMaternoEditInput, apeMaternoEditLabel);
    });

    // Ejecutar la validación inicial para ambos selects (en caso de que ya haya valores seleccionados)
    handleApeMaternoValidation(tipoDocumentoCreateSelect, apeMaternoCreateInput, apeMaternoCreateLabel);
    handleApeMaternoValidation(tipoDocumentoEditSelect, apeMaternoEditInput, apeMaternoEditLabel);
});

</script>

<!-- Incluye los scripts de DataTables y Bootstrap -->
     
<link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            $('#pacientesTable').DataTable({
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