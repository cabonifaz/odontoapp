@extends('adminlte::page')

@section('title', 'Detalles de Actividades - Vitaldentis')

@section('content_header')  
<div class="card mb-0">
    <div class="card-header">
        <h2 class="font-semibold text-xl text-gray-800 leading-tight mb-3">
            Detalles de Actividades del Paciente: {{ $presupuesto->paciente->nombres }} {{ $presupuesto->paciente->ape_paterno }} {{ $presupuesto->paciente->ape_materno }}
        </h2>
        <div class="row">
            <!-- Tratamiento -->
            <div class="col-md-4 col-lg-4 mb-3">
                <label for="tratamiento" class="form-label">Tratamiento</label>
                <input type="text" class="form-control" id="tratamiento" 
                    value="{{ $presupuesto->detalles->first()->tratamiento->nombre ?? '' }}" readonly>
            </div>

            <!-- Médico -->
            <div class="col-md-3 col-lg-3 mb-3">
                <label for="medico" class="form-label">Médico</label>
                <input type="text" class="form-control" id="medico_nombre" value="{{ $presupuesto->medico->nombre_medico }}" readonly>
            </div>
            <!-- Fecha -->
            <div class="col-md-2 col-lg-2 mb-3">
                <label for="fecha1" class="form-label">Fecha de la Cita</label>
                <input type="text" class="form-control" id="fecha1" value="{{ \Carbon\Carbon::parse($presupuesto->fecha_cita)->format('d/m/Y') }}" readonly>
            </div>
          <!-- Progreso -->
            <div class="col-md-2 col-lg-3 mb-3">
                <label for="avance" class="form-label">Progreso</label>
                <div class="progress position-relative" id="avance" style="background-color: transparent; border-radius: 10px; height: 30px;">
                    <div class="progress-bar custom-progress-bar" role="progressbar" style="width: {{ $porcentajeProgreso }}%; background-color: #007bff; border-radius: 10px;" aria-valuenow="{{ $porcentajeProgreso }}" aria-valuemin="0" aria-valuemax="100">
                    </div>
                    <div class="position-absolute w-100 text-center" style="top: 0; left: 0; height: 100%; display: flex; align-items: center; justify-content: center; color: black; font-weight: bold; font-size:16px;">
                        {{ $porcentajeProgreso }}% - {{ $actividadesAtendidas }} Actividades de {{ $totalActividades }}
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
@stop

@section('content')

<div class="container">
    <!-- Tabla de actividades -->
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table id="actividadesTable" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <th style="text-align:center;">Item</th>
                            <th>Actividad</th>
                            <th style="text-align:center;">Fecha</th>
                            <th style="text-align:center;">Estado</th>
                        </tr>
                    </thead>
                    <tbody>
                        @php
                            $buttonActivated = false; // Bandera para activar un solo botón
                        @endphp

                        @foreach ($actividades as $index => $actividad)
                            <tr>
                                <!-- Item -->
                                <td class="text-center">{{ $index + 1 }}</td>

                                <!-- Actividad -->
                                <td>{{ $actividad->servicio->nombre }}</td>
                                
                                <td style="text-align:center;" class="fecha">
                                    @if (is_null($actividad->fecha) && !$buttonActivated)
                                        <!-- Botón para programar -->
                                        <button class="btn btn-warning btn-sm rounded-pill px-4 btn-programar" 
                                                data-id="{{ $presupuesto->paciente->id }}"
                                                data-actividad="{{ $actividad->id }}"
                                                data-presupuesto="{{ $presupuesto->id }}"
                                                data-servicio="{{ $actividad->servicio_id }}" 
                                                data-tratamiento="{{ $presupuesto->detalles->first()->tratamiento->id }}"
                                                data-nombres="{{ $presupuesto->paciente->nombres }} {{ $presupuesto->paciente->ape_paterno }} {{ $presupuesto->paciente->ape_materno }}" 
                                                data-toggle="modal" 
                                                data-target="#modal-create">
                                            <i class="fas fa-calendar-alt"></i> Programar
                                        </button>
                                        @php
                                            $buttonActivated = true;
                                        @endphp
                                    @elseif(!is_null($actividad->fecha))
                                        <!-- Botón para editar con la fecha -->
                                        <button class="btn btn-info btn-sm rounded-pill px-4 btn-editar" 
                                                data-id="{{ $presupuesto->paciente->id }}"
                                                data-cita="{{ $actividad->nueva_cita_id }}"
                                                data-actividad="{{ $actividad->id }}"
                                                data-presupuesto="{{ $presupuesto->id }}"
                                                data-servicio="{{ $actividad->servicio_id }}" 
                                                data-nombres="{{ $presupuesto->paciente->nombres }} {{ $presupuesto->paciente->ape_paterno }} {{ $presupuesto->paciente->ape_materno }}" 
                                                data-fecha="{{ $actividad->fecha }}"
                                                data-tratamiento="{{ $presupuesto->detalles->first()->tratamiento->id }}"
                                                data-hora_inicio="{{ $actividad->hora_inicio }}"
                                                data-hora_fin="{{ $actividad->hora_fin }}"
                                                data-medico="{{ $actividad->medico_id }}"
                                                data-toggle="modal" 
                                                data-target="#modal-edit">
                                            <i class="fas fa-edit"></i> {{ \Carbon\Carbon::parse($actividad->fecha)->format('d/m/Y') }}
                                        </button>
                                    @endif
                                </td>

                                <!-- Estado -->
                                <td class="text-center">
                                    @if ($actividad->estado == 0)
                                        @if (is_null($actividad->fecha))
                                            <span class="badge badge-secondary badge-lg rounded-pill px-4">Sin Fecha</span>
                                        @else
                                            <button class="btn btn-warning btn-sm rounded-pill px-4" onclick="cambiarEstado({{ $actividad->nueva_cita_id }})">
                                                <i class="fas fa-clock"></i> Pendiente
                                            </button>
                                        @endif
                                    @else
                                        <span class="badge badge-success badge-lg">Atendido</span>
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


    <!-- Modal para programar cita -->
<div class="modal fade" id="modal-create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="activitiesModalLabel">Programar Cita</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-create-cita" method="POST" action="{{ route('citas.store') }}">
                    @csrf <!-- Protección CSRF -->
                    <!-- Paciente -->
                    <div class="form-group">
                         <!-- Campos ocultos -->
                        <input type="hidden" id="paciente_id" name="paciente_id">
                        <input type="hidden" id="servicio_id" name="servicio_id">
                        <input type="hidden" id="presupuesto_id" name="presupuesto_id">
                        <input type="hidden" id="tratamiento_id" name="tratramiento_id">
                        <input type="hidden" id="actividad_id" name="actividad_id">

                        <label for="paciente">Paciente</label>
                        <input style="font-size:20px;" type="text" class="form-control" id="paciente" readonly>
                    </div>

                    <!-- Médico -->
                    <div class="form-group">
                        <label for="medico">Médico</label>
                        <select id="medico" name="id_medico" class="form-control" style="font-size:14px;">
                            @foreach ($medicosDatos as $medico)
                                <option value="{{ $medico->id }}" {{ $medico->id == $presupuesto->medico_id ? 'selected' : '' }}>
                                    {{ $medico->nombre_medico }}
                                </option>
                            @endforeach
                        </select>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="fecha">Fecha</label>
                            <input type="date" class="form-control" id="fecha" name="fecha" value="{{ \Carbon\Carbon::now()->format('Y-m-d') }}">
                        </div>
                        <div class="col-md-4">
                            <label for="hora_inicio">Hora Inicio</label>
                            <input type="time" class="form-control" id="hora_inicio" name="hora_inicio" step="1800">
                        </div>
                        <div class="col-md-4">
                            <label for="hora_fin">Hora Fin</label>
                            <input type="time" class="form-control" id="hora_fin" name="hora_fin" step="1800">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer bg-light">
                <button type="button" class="btn btn-secondary rounded-pill px-4" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary rounded-pill px-4" id="btn-save-cita">Guardar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal para editar cita -->
<div class="modal fade" id="modal-edit" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="editModalLabel">Modificar Cita</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-edit-cita">
                    @csrf
                    @method('PUT') <!-- Método PUT para actualización -->

                    <!-- Campos ocultos -->
                    <input type="hidden" id="edit_cita_id" name="edit_cita_id">
                    <input type="hidden" id="edit_paciente_id" name="edit_paciente_id">
                    <input type="hidden" id="edit_servicio_id" name="edit_servicio_id">
                    <input type="hidden" id="edit_presupuesto_id" name="edit_presupuesto_id">
                    <input type="hidden" id="edit_actividad_id" name="edit_actividad_id">
                    <input type="hidden" id="edit_tratamiento_id" name="edit_tratramiento_id">
                        
                    <!-- Paciente -->
                    <div class="form-group">
                        <label for="edit_paciente">Paciente</label>
                        <input style="font-size:20px;" type="text" class="form-control" id="edit_paciente" name="paciente" readonly>
                    </div>

                    <!-- Médico -->
                    <div class="form-group">
                        <label for="edit_medico">Médico</label>
                        <select id="edit_medico" name="id_medico" class="form-control" style="font-size:14px;">
                            @foreach ($medicosDatos as $medico)
                                <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                            @endforeach
                        </select>
                    </div>

                    <!-- Fecha y hora -->
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="edit_fecha">Fecha</label>
                            <input type="date" class="form-control" id="edit_fecha" name="fecha">
                        </div>
                        <div class="col-md-4">
                            <label for="edit_hora_inicio">Hora Inicio</label>
                            <input type="time" class="form-control" id="edit_hora_inicio" name="hora_inicio">
                        </div>
                        <div class="col-md-4">
                            <label for="edit_hora_fin">Hora Fin</label>
                            <input type="time" class="form-control" id="edit_hora_fin" name="hora_fin">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" id="save-edit-cita">Guardar Cambios</button>
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
    // Inicialización de DataTable
    $(document).ready(function () {
        $('#actividadesTable').DataTable({
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
    const userPermissions = @json(auth()->user()->getAllPermissions()->pluck('name'));
    // Cambiar estado con confirmación Swal
    function cambiarEstado(citaId) {
        // Verificar el permiso
        if (!userPermissions.includes('Modificar')) {
            Swal.fire({
                icon: 'error',
                title: 'Permiso denegado',
                text: 'No tienes permiso para realizar esta acción.',
            });
            return; // Detener la ejecución si no tiene permiso
        }
        Swal.fire({
            title: '¿Está seguro?',
            text: 'Esta actividad será marcada como Atendida.',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sí, cambiar estado'
        }).then((result) => {
            if (result.isConfirmed) {
                // Enviar solicitud AJAX para cambiar el estado
                $.ajax({
                    url: `/actividades-paciente/${citaId}/cambiar-estado`,
                    method: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}'
                    },
                    success: function (response) {
                        Swal.fire({
                            title: '¡Éxito!',
                            text: response.message,
                            icon: 'success',
                            confirmButtonText: 'Aceptar'
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Recargar la página para reflejar cambios
                                location.reload();
                            }
                        });
                    },

                    error: function () {
                        Swal.fire('Error', 'Hubo un problema al cambiar el estado.', 'error');
                    }
                });
            }
        });
    }
    
    let previousDate = null; // Variable para almacenar la fecha previa
    function formatDate(dateString) {
        // Asumiendo que dateString está en el formato dd/mm/yyyy
        const [day, month, year] = dateString.split('/'); // Dividir por "/"
        return `${year}-${month}-${day}`; // Formatear a yyyy-mm-dd
    }
    // Función para convertir "yyyy-mm-dd" a Date
    function parseISODate(dateString) {
        const parts = dateString.split('-'); // Dividir por "-"
        if (parts.length === 3) {
            const year = parseInt(parts[0], 10); // Año
            const month = parseInt(parts[1], 10) - 1; // Mes (0-11)
            const day = parseInt(parts[2], 10); // Día
            return new Date(year, month, day); // Retornar un objeto Date
        }
        return null; // Retornar null si el formato no es válido
    }
    // Escucha el evento cuando se hace clic en el botón
    $('body').on('click', '.btn-programar', function() {
       // Verificar el permiso
       if (!userPermissions.includes('Crear cita')) {
            Swal.fire({
                icon: 'error',
                title: 'Permiso denegado',
                text: 'No tienes permiso para realizar esta acción.',
            });
            
            return false; // Detener la ejecución si no tiene permiso
        }
        const row = $(this).closest('tr'); // Fila actual
        const rowIndex = row.index(); // Índice de la fila
        //console.log("Fila seleccionada:", rowIndex + 1); // Depuración
        
        if (rowIndex === 0) {
            // Para la primera fila, obtener la fecha del campo `#fecha1`
            const fechaInput = $('#fecha1'); // Suponiendo que #fecha1 está en el DOM
            //console.log("Fecha input (fecha1):", fechaInput);
            if (fechaInput.length) {
            const fechaValue = fechaInput.val(); // Obtener el valor del input
            //console.log("Fecha fechaValue (fecha1):", fechaValue);
            if (fechaValue) {
                previousDate = formatDate(fechaValue); // Convertir a Date
                previousDate = parseISODate(previousDate);
                //console.log("Fecha previa (fecha1):", previousDate);
            } else {
                console.log("Fecha previa (fecha1): No se encontró un valor en #fecha1");
            }
        }
        } else {
            // Para filas posteriores, obtener la fecha del td anterior
            const fechaTd = row.prev('tr').find('td.fecha').text().trim();
            if (fechaTd) {
                previousDate = formatDate(fechaTd);
                previousDate = parseISODate(previousDate);
                //console.log("Fecha previa (td.fecha):", previousDate);
            }
        }
        // Obtiene el ID del paciente y el nombre completo del atributo data-* del botón
        var pacienteId = $(this).data('id');
        var nombrePaciente = $(this).data('nombres');
        var servicioId = $(this).data('servicio');
        var presupuestoId = $(this).data('presupuesto');
        var tratamientoId = $(this).data('tratamiento');
        var actividadId = $(this).data('actividad');
        // Rellena el campo del modal con los datos
        $('#paciente_id').val(pacienteId);  // Campo oculto para el ID del paciente
        $('#paciente').val(nombrePaciente);  // Muestra el nombre completo del paciente
        $('#servicio_id').val(servicioId);  // Campo oculto para el ID del servicio
        $('#presupuesto_id').val(presupuestoId);
        $('#tratamiento_id').val(tratamientoId);
        $('#actividad_id').val(actividadId);
        // Abre el modal
        $('#modal-create').modal('show');
    });

    $('body').on('click', '.btn-editar', function() {
        // Verificar el permiso
       if (!userPermissions.includes('Crear cita')) {
            Swal.fire({
                icon: 'error',
                title: 'Permiso denegado',
                text: 'No tienes permiso para realizar esta acción.',
            });
            
            return false; // Detener la ejecución si no tiene permiso
        }
    // Obtiene los datos del botón
    var citaId = $(this).data('cita');
    var presupuestoId = $(this).data('presupuesto');
    var pacienteId = $(this).data('id');
    var nombrePaciente = $(this).data('nombres');
    var servicioId = $(this).data('servicio');
    var medicoId = $(this).data('medico');
    var fecha = $(this).data('fecha');
    var horaInicio = $(this).data('hora_inicio');
    var horaFin = $(this).data('hora_fin');
    var actividadId = $(this).data('actividad');
    var tratamientoId = $(this).data('tratamiento');
    //console.log("horaInicio",horaInicio);
    //console.log("horaFin",horaFin);
    // Rellena los campos del modal Editar
    $('#edit_cita_id').val(citaId);
    $('#edit_presupuesto_id').val(presupuestoId);
    $('#edit_paciente').val(nombrePaciente);
    $('#edit_medico').val(medicoId);
    $('#edit_actividad_id').val(actividadId);
    $('#edit_tratamiento_id').val(tratamientoId);
    $('#edit_paciente_id').val(pacienteId);
    $('#edit_servicio_id').val(servicioId);
    $('#edit_fecha').val(fecha);
    $('#edit_hora_inicio').val(horaInicio);
    $('#edit_hora_fin').val(horaFin);

    // Abre el modal Editar
    $('#modal-edit').modal('show');
});

    $('#save-edit-cita').on('click', function () {
        var idCita = $('#edit_cita_id').val();
        var fechaCita = $('#edit_fecha').val();
        var horaInicio = $('#edit_hora_inicio').val();
        var horaFin = $('#edit_hora_fin').val();
        var idMedico = $('#edit_medico').val();
        var token = $('input[name="_token"]').val();
        var idServicio = $('#edit_servicio_id').val();
        var idPaciente = $('#edit_paciente_id').val();
        
        console.log("horaInicio",horaInicio);
        console.log("horaFin",horaFin);
        $.ajax({
            url: '{{ route("citas.update", ":id") }}'.replace(':id', idCita),
            type: 'PUT',
            data: {
                _token: token, // CSRF token
                id: idCita,
                fecha: fechaCita,
                hora_inicio: horaInicio + ':00',
                hora_fin: horaFin + ':00',
                id_medico: idMedico,
                id_paciente: idPaciente,
                id_servicio: idServicio,
                precio_final: 0,
                precio_servicio: 0,
                condicion: 1,
                
            },
            success: function (response) {
                // Validar que los campos necesarios existan y tengan valores
                const citaId = $('#edit_cita_id').val();
                
                const actividadId = $('#edit_actividad_id').val();
                const nuevaFecha = $('#edit_fecha').val();
                const horaInicio = $('#edit_hora_inicio').val();
                const horaFin = $('#edit_hora_fin').val();
                const medicoId = $('#edit_medico').val();

                if (!citaId || !actividadId || !nuevaFecha || !horaInicio || !horaFin || !medicoId) {
                    console.error("Faltan datos para actualizar actividades_paciente");
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Faltan datos para actualizar la actividad. Verifica los campos.',
                    });
                    return;
                }

                // Ejecutar el segundo AJAX para actualizar `actividades_paciente`
                $.ajax({
                    url: '{{ route("actividades_paciente.updateFecha") }}',
                    type: 'POST',
                    data: {
                        _token: '{{ csrf_token() }}',
                        
                        actividad_id: actividadId,
                        fecha: nuevaFecha,
                        hora_inicio: horaInicio,
                        hora_fin: horaFin,
                        medico_id: medicoId,
                        nueva_cita_id: citaId,
                    },
                    success: function (updateResponse) {
                        Swal.fire({
                            icon: 'success',
                            title: 'Cita y actividad actualizadas',
                            text: 'La cita y la fecha de la actividad han sido actualizadas correctamente.',
                        }).then((result) => {
                            if (result.isConfirmed) {
                                // Cerrar el modal y recargar la página
                                $('#modal-create').modal('hide');
                                location.reload();
                            }
                        });
                    },
                    error: function (xhr, status, error) {
                        console.error("Error al actualizar actividades_paciente:", status, error);
                        console.error(xhr.responseText);
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'La cita fue guardada, pero no se pudo actualizar la actividad.',
                        });
                    },
                });
            },
            error: function (xhr) {
                console.error(xhr.responseText);
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: `Ocurrió un error al actualizar la cita: ${xhr.responseText}`,
                });
            }
        });
    });

</script>
<script>
    $(document).ready(function () {
        
        // Guardar la cita después de verificar disponibilidad
        $('#btn-save-cita').on('click', function () {
            // Obtener la fecha seleccionada en el modal
            const modalFechaInput = $('#fecha'); // Campo de fecha en el modal
            if (!modalFechaInput.length) {
                console.error("No se encontró el campo `fecha` en el modal.");
                return false;
            }
            const currentDate = new Date(modalFechaInput.val());
            console.log("Fecha actual seleccionada:", currentDate);
            console.log("Fecha Anterior:", previousDate);
            
            // Validar que la fecha actual sea posterior a la fecha previa
            if (previousDate && currentDate <= previousDate) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error de validación',
                    text: 'La fecha seleccionada debe ser posterior a la fecha previa.',
                });
                return false; // Detener la acción de guardar
            }

            console.log("Validación exitosa. Continuando con el flujo...");

            // Aquí continúa el proceso de guardar la cita
            const selectedDate = $('#fecha').val(); // Fecha seleccionada
            const time = $('#hora_inicio').val(); // Hora de inicio seleccionada
            const doctor = $('#medico').val(); // ID del médico seleccionado
            const hora_fin = $('#hora_fin').val(); // Hora de fin seleccionada

            function formatDate(dateString) {
                // Asumiendo que dateString está en el formato dd/mm/yyyy
                const [day, month, year] = dateString.split('/'); // Dividir por "/"
                return `${year}-${month}-${day}`; // Formatear a yyyy-mm-dd
            }

            const formattedDate = formatDate(selectedDate);
            console.log("Datos enviados para verificación:", {
                fecha: selectedDate,
                hora_inicio: time,
                hora_fin: hora_fin,
                id_medico: doctor
            });

            // Enviar la solicitud para verificar disponibilidad
            $.ajax({
                url: '{{ route("citas.verificarDisponibilidad") }}',
                type: 'POST',
                data: {
                    _token: '{{ csrf_token() }}',
                    fecha: selectedDate,
                    hora_inicio: time,
                    hora_fin: hora_fin,
                    id_medico: doctor,
                },
                success: function (response) {
                    console.log("Respuesta del servidor:", response);
                    if (response.available) {
                        if (response.canCreateCita) {
                            // Si la disponibilidad es correcta, proceder a guardar la cita
                            const citaData = {
                                id_medico: doctor,
                                id_paciente: $('#paciente_id').val(),
                                fecha: selectedDate,
                                hora_inicio: time,
                                hora_fin: hora_fin,
                                id_servicio: $('#servicio_id').val(),
                                presupuesto:$('#presupuesto_id').val(),
                                tratamiento:$('#tratamiento_id').val(),
                                precio: 0,
                                precio_final: 0,
                                condicion: 1,
                                estado: 9,
                                _token: '{{ csrf_token() }}'
                            };

                            console.log("Datos enviados para guardar cita:", citaData);

                            $.ajax({
                                url: $('#form-create-cita').attr('action'),
                                type: 'POST',
                                data: citaData,
                                success: function (response) {
                                    console.log("Respuesta al guardar cita:", response);

                                    const nuevaCitaId = response.cita_id; // ID de la nueva cita
                                    const actividadId = $('#actividad_id').val();
                                    const nuevaFecha = selectedDate;
                                    const horaInicio = time;
                                    const medicoId = doctor;

                                    console.log("Datos para actualizar actividades_paciente:", {
                                        presupuesto_id: $('#presupuesto_id').val(),
                                        actividad_id: actividadId,
                                        fecha: nuevaFecha,
                                        hora_inicio: horaInicio,
                                        hora_fin: hora_fin,
                                        medico_id: medicoId,
                                        nueva_cita_id: nuevaCitaId,
                                    });

                                    // Enviar solicitud para actualizar actividades_paciente
                                    $.ajax({
                                        url: '{{ route("actividades_paciente.updateFecha") }}',
                                        type: 'POST',
                                        data: {
                                            _token: '{{ csrf_token() }}',
                                            presupuesto_id: $('#presupuesto_id').val(),
                                            actividad_id: actividadId,
                                            fecha: nuevaFecha,
                                            hora_inicio: horaInicio,
                                            hora_fin: hora_fin,
                                            medico_id: medicoId,
                                            nueva_cita_id: nuevaCitaId,
                                        },
                                        success: function (updateResponse) {
                                            Swal.fire({
                                                icon: 'success',
                                                title: 'Cita y actividad actualizadas',
                                                text: 'La cita y la fecha de la actividad han sido actualizadas correctamente.',
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    $('#modal-create').modal('hide');
                                                    location.reload();
                                                }
                                            });
                                        },
                                        error: function (xhr, status, error) {
                                            console.error("Error al actualizar actividades_paciente:", {
                                                status: status,
                                                error: error,
                                                response: xhr.responseText
                                            });
                                            Swal.fire({
                                                icon: 'error',
                                                title: 'Error',
                                                text: 'La cita fue guardada, pero no se pudo actualizar la actividad.',
                                            });
                                        }
                                    });
                                },
                                error: function (xhr, status, error) {
                                    console.error("Error al guardar cita:", {
                                        status: status,
                                        error: error,
                                        response: xhr.responseText
                                    });

                                    let errorMessage = 'No se pudo registrar la cita. Por favor, verifica los datos.';
                                    try {
                                        const response = JSON.parse(xhr.responseText);
                                        if (response.message) {
                                            errorMessage = response.message;
                                        }
                                    } catch (e) {
                                        console.warn("No se pudo parsear la respuesta del servidor.");
                                    }

                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Error',
                                        text: errorMessage,
                                    });
                                }
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Permiso denegado',
                                text: 'No tienes permiso para crear citas.',
                            });
                        }
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: 'Horario no disponible',
                            text: 'El horario seleccionado no está disponible para el médico en esta fecha.',
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error al verificar disponibilidad:", {
                        status: status,
                        error: error,
                        response: xhr.responseText
                    });
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: 'Ocurrió un problema al verificar la disponibilidad.',
                    });
                },
            });
        });
    });
</script>

@stop
@section('css')
<style>
    .badge-lg {
    font-size: 1.0rem; /* Ajusta el tamaño del texto */
    padding: 10px 15px; /* Ajusta el espacio interno */
    border-radius: 0.5rem; /* Ajusta la forma del badge si es necesario */
    }
    /* Estilo de hover para las filas del cuerpo de la tabla */
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
    
/* Si necesitas un CSS personalizado adicional */
.custom-progress-bar {
    background-color: #007bff; /* Color de fondo azul */
    color: black; /* Color del texto */
    white-space: nowrap; /* Evita que el texto se divida en varias líneas */
    overflow: hidden; /* Oculta el texto que exceda el ancho */
    text-overflow: ellipsis; /* Añade "..." si el texto es muy largo */
    padding: 5px; /* Ajusta el padding según sea necesario */
    height: 30px; /* Asegura que la barra tenga suficiente altura */
    line-height: 30px; /* Alinea el texto verticalmente */
    border-radius: 10px; /* Bordes redondeados */
}



</style>
@stop
