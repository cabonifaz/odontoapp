@extends('adminlte::page')

@section('title', 'Calendario de Citas')

@section('content_header')
    <h1>Calendario de Citas</h1>
@stop

@section('content')
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">Vista Semanal</h3>
            <div class="card-tools">
                <!-- Filtro rápido por médico -->
                <select id="filtro-medico" class="form-control form-control-sm" style="width: 200px;">
                    <option value="">Todos los Médicos</option>
                    @foreach($medicos as $medico)
                        <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                    @endforeach
                </select>
            </div>
        </div>
        <div class="card-body">
            <div id="calendar"></div>
        </div>
    </div>

    <!-- Modal para ver detalles (Opcional) -->
    <div class="modal fade" id="eventModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalTitle">Detalle de Cita</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p><strong>Paciente:</strong> <span id="modalPaciente"></span></p>
                    <p><strong>Médico:</strong> <span id="modalMedico"></span></p>
                    <p><strong>Hora:</strong> <span id="modalHora"></span></p>
                    <p><strong>Observación:</strong> <span id="modalObservacion"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <!-- <a href="#" id="btnIrCita" class="btn btn-primary">Ver Cita Completa</a> -->
                </div>
            </div>
        </div>
    </div>
@stop

@section('css')
    <!-- FullCalendar CSS -->
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.css' rel='stylesheet' />
    <style>
        .fc-event { cursor: pointer; }
    </style>
@stop

@section('js')
    <!-- FullCalendar JS -->
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/main.min.js'></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.3/locales/es.js'></script>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var calendarEl = document.getElementById('calendar');
            var filtroMedico = document.getElementById('filtro-medico');

            var calendar = new FullCalendar.Calendar(calendarEl, {
                initialView: 'timeGridWeek', // Vista semanal por defecto
                locale: 'es', // Idioma español
                headerToolbar: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay'
                },
                slotMinTime: '08:00:00', // Hora inicio calendario visual
                slotMaxTime: '22:00:00', // Hora fin calendario visual
                allDaySlot: false, // Ocultar fila de "todo el día" si son citas por hora
                height: 'auto',
                events: {
                    url: '{{ route("api.citas.calendario") }}',
                    extraParams: function() {
                        return {
                            medico_id: filtroMedico.value
                        };
                    }
                },
                eventClick: function(info) {
                    // Al hacer clic en una cita
                    var event = info.event;
                    var props = event.extendedProps;

                    $('#modalTitle').text(event.title);
                    $('#modalPaciente').text(event.title.split('-')[0]); // Asumiendo formato "Paciente - Medico"
                    $('#modalMedico').text(props.medico);
                    $('#modalHora').text(event.start.toLocaleString());
                    $('#modalObservacion').text(props.observacion || 'Ninguna');
                    
                    // Enlace para ir a la edición (ajusta la ruta según tu sistema)
                    $('#btnIrCita').attr('href', '/citas/' + event.id + '/edit');
                    
                    $('#eventModal').modal('show');
                }
            });

            calendar.render();

            // Recargar eventos al cambiar el filtro de médico
            filtroMedico.addEventListener('change', function() {
                calendar.refetchEvents();
            });
        });
    </script>
@stop