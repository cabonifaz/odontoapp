@extends('adminlte::page')

@section('title', 'Agenda - Mundo System')

<style>
    .booked {
        background-color: #ffffff;
        color: #000;
        border: 1px solid #007bff;
        padding: 5px;
        border-radius: 4px;
        position: relative; /* Asegura que el submenu se posicione relativo a este elemento */
    }

    /* Estilos para las diferentes condiciones */
    /* Estilos para las diferentes condiciones */
    .condicion-regular {
        background-color: white !important;
    }

    .condicion-kids {
        background-color: #c1fef6 !important;
    }

    .condicion-noacude {
        background-color: yellow !important;
    }

    .condicion-nuevo {
        background-color: orange !important;
    }

    .condicion-noconfirma {
        background-color: lightgreen !important;
    }


    /* Contenedor principal de la agenda */
    .schedule-container {
        display: flex;
        flex-direction: column;
        height: 100vh;
        overflow: hidden;
    }

    /* Cabecera de la tabla con posición fija */
    .schedule-header {
        flex-shrink: 0;
        position: sticky;
        top: 0;
        z-index: 2; /* Mantiene la cabecera por encima del contenido */
        background-color: #f8f9fa;
        border-bottom: 1px solid #dee2e6; /* Opcional: añade un borde inferior para la cabecera */
    }

    /* Contenido de la agenda que permite el scroll */
    .schedule-content {
        flex-grow: 1;
        overflow-y: auto;
    }

    /* Tabla en la cabecera y el contenido */
    .schedule-table {
        width: 100%;
        table-layout: fixed;
        border-collapse: collapse;
    }

    /* Estilos para celdas de la cabecera y del contenido */
    .schedule-table th,
    .schedule-table td {
        padding: 5px;
        text-align: center;
        vertical-align: middle;
        font-size: 12px;
        height: 2vh;
        border: 1px solid #dee2e6;
        box-sizing: border-box;
    }
    /* Estilo específico para celdas con la clase "booked" */
    .schedule-table .booked {
        padding: 0; /* Elimina el padding en las celdas booked */
        margin: 0;  /* Elimina cualquier posible margen */
        border: 1px solid #007bff; /* Borde azul */
        box-sizing: border-box; /* Incluye el borde dentro del tamaño de la celda */
        background-color: #ffffff;
        color: #000;
        border-radius: 4px; /* Ajusta esto si no deseas bordes redondeados */
    }
    .schedule-header th {
        background-color: #f8f9fa; /* Color de fondo para la cabecera */
        z-index: 3; /* Asegura que la cabecera esté sobre el contenido */
    }

    /* Estilos para las filas del contenido */
    .schedule-content tbody tr {
        height: calc(100vh / 20);
    }

    /* Estilo para la columna de las horas */
    .time-cell {
        background-color: #add8e6;
        width: 70px;
        text-align: center;
        font-weight: bold;
        padding: 0;
    }

    /* Estilos para celdas seleccionables */
    .selectable {
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .selectable:hover {
        background-color: #f0f0f0;
    }

    .selected {
        background-color: #007bff;
        color: white;
    }

    /* Estilos adicionales */
    .legend-container {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }

    .legend-label {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .legend-button {
        width: 20px;
        height: 20px;
        border: none;
        border-radius: 4px;
        cursor: default;
    }

    .regular-color {
        background-color: white;
    }

    .nuevo-color {
        background-color: orange;
    }

    .happy-kids-color {
        background-color: #c1fef6;
    }

    .no-acudio-color {
        background-color: yellow;
    }

    .no-confirma-color {
        background-color: lightgreen;
    }

    .content-wrapper {
        background-color: #ffffff; /* El color de fondo que prefieras */
        min-height: calc(100vh - 56px); /* Ajusta según la altura de tu navbar */
    }

    .custom-modal-width {
        max-width: 40%; /* Ajusta el porcentaje según sea necesario */
    }

    /* Estilo para el contenedor del menú */
    .menu-container {
        position: relative;
        display: inline-block;
    }

    /* Estilo para el botón de menú (los tres puntos) */
    .menu-button {
        cursor: pointer;
        font-size: 18px; /* Ajusta el tamaño de fuente de los tres puntos */
        padding: 0; /* Espaciado alrededor de los tres puntos */
        margin: 0; /* Asegura que no haya margen alrededor del botón */
    }

    /* Estilo para el menú desplegable */
    .menu-content {
        display: none;
        position: absolute;
        right: 0;
        top: 100%;
        background-color: #fff;
        border: 1px solid #9e9393;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        z-index: 1000;
        min-width: 100px;
        padding: 0; /* Elimina el padding adicional del menú */
        margin: 0; /* Asegura que no haya margen adicional */
        box-sizing: border-box; /* Incluye el padding y border en el tamaño total */
    }

    /* Espaciado entre los elementos del menú */
    .menu-content a {
        display: block;
        padding: 1px 10px; /* Ajusta el padding entre los elementos del menú */
        text-decoration: none;
        color: #333;
        font-size: 14px; /* Ajusta el tamaño de la fuente en el menú */
        line-height: 1; /* Asegura que la altura de la línea no agregue espaciado extra */
    }

    /* Cambio de fondo en hover */
    .menu-content a:hover {
        background-color: #51b3f6;
    }
    /* CSS para alinear el título y el botón en la misma línea */
    .header-container {
        display: flex; /* Usar flexbox para alinear los elementos */
        justify-content: space-between; /* Espaciado entre el título y el botón */
        align-items: center; /* Alinear verticalmente en el centro */
        margin-bottom: 20px; /* Espacio debajo del contenedor */
    }

    .header-container h3 {
        margin: 0; /* Eliminar margen por defecto */
        text-align: center; /* Centrar el texto del título */
        flex: 1; /* Permite que el título ocupe el espacio disponible */
    }

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
    .wrapper,
    .main-header,
    .content-wrapper,
    .content-header,
    .main-footer {
        background-color: #ffffff !important;
    }
    /* Estilo base del UL */
    #suggestions {
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
    #suggestions li {
        padding: 10px; /* Espaciado interno */
        border-bottom: 1px solid #ddd; /* Separador entre elementos */
        cursor: pointer; /* Cambia el cursor al estilo mano */
        transition: background-color 0.2s ease-in-out; /* Efecto de cambio suave */
    }

    /* El último elemento no tiene borde inferior */
    #suggestions li:last-child {
        border-bottom: none;
    }

    /* Efecto hover */
    #suggestions li:hover {
        background-color: #b1fdb7; /* Cambia el fondo al pasar el mouse */
    }
    /* Estilo base del UL */
    #servicio-list {
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
    #servicio-list li {
        padding: 10px; /* Espaciado interno */
        border-bottom: 1px solid #ddd; /* Separador entre elementos */
        cursor: pointer; /* Cambia el cursor al estilo mano */
        transition: background-color 0.2s ease-in-out; /* Efecto de cambio suave */
    }

    /* El último elemento no tiene borde inferior */
    #servicio-list li:last-child {
        border-bottom: none;
    }

    /* Efecto hover */
    #servicio-list li:hover {
        background-color: #b1fdb7; /* Cambia el fondo al pasar el mouse */
    }
    /* Estilo base del UL */
    #edit-suggestions {
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
    #edit-suggestions li {
        padding: 10px; /* Espaciado interno */
        border-bottom: 1px solid #ddd; /* Separador entre elementos */
        cursor: pointer; /* Cambia el cursor al estilo mano */
        transition: background-color 0.2s ease-in-out; /* Efecto de cambio suave */
    }

    /* El último elemento no tiene borde inferior */
    #edit-suggestions li:last-child {
        border-bottom: none;
    }

    /* Efecto hover */
    #edit-suggestions li:hover {
        background-color: #b1fdb7; /* Cambia el fondo al pasar el mouse */
    }
    /* Estilo base del UL */
    #edit-servicio-list {
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
    #edit-servicio-list li {
        padding: 10px; /* Espaciado interno */
        border-bottom: 1px solid #ddd; /* Separador entre elementos */
        cursor: pointer; /* Cambia el cursor al estilo mano */
        transition: background-color 0.2s ease-in-out; /* Efecto de cambio suave */
    }

    /* El último elemento no tiene borde inferior */
    #edit-servicio-list li:last-child {
        border-bottom: none;
    }

    /* Efecto hover */
    #edit-servicio-list li:hover {
        background-color: #b1fdb7; /* Cambia el fondo al pasar el mouse */
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
    
    /* General modal styling */
    .presupuestos-list {
        display: block; /* Una sola columna */
        padding: 10px;
        width: 100%; /* Aumentar el ancho de la lista */
    }

    /* Tratamientos styling */
    .tratamiento-item {
        width: 100%; /* Tomar el ancho completo */
        border: 1px solid #ccc;
        border-radius: 8px; /* Bordes más suaves */
        padding: 12px;
        background-color: #f8f9fa; /* Color más claro */
        margin-bottom: 15px;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra sutil */
        transition: transform 0.2s ease, background-color 0.2s ease; /* Animación */
    }

    .tratamiento-item:hover {
        background-color: #e9ecef; /* Color claro en hover */
        transform: scale(1.02); /* Ligero aumento en hover */
    }

    .tratamiento-item h6 {
        margin-bottom: 12px;
        font-weight: bold;
        text-align: left;
        border-bottom: 1px solid #ddd;
        padding-bottom: 8px;
        color: #343a40; /* Color de texto */
    }

    /* Procedimientos list styling */
    .procedimientos-list {
        list-style-type: none;
        padding: 0;
        margin: 0 0 0 80px; /* Desplazamiento hacia la derecha */
        max-height: 150px; /* Altura máxima con scroll */
        overflow-y: auto;
        border-top: 1px solid #ddd;
    }

    .procedimientos-list li {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        cursor: pointer;
        transition: background-color 0.3s ease, color 0.3s ease; /* Transición más fluida */
    }

    .procedimientos-list li:hover {
        background-color: #e2f3e8; /* Color en hover */
        color: #28a745; /* Texto verde en hover */
    }

    .procedimientos-list li.selected {
        background-color: #d4edda; /* Verde claro */
        font-weight: bold;
        border-left: 5px solid #28a745; /* Línea indicativa */
    }

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="row">
        <!-- Columna para el título y la selección de fecha -->
        <div class="col-sm-2">
            <h1 class="m-0">Agenda</h1>
            <form action="{{ route('citas.index') }}" method="GET" id="miFormulario" class="mt-2">
                <input type="date" name="fecha_agenda" id="fecha_agenda" class="form-control rounded-pill" value="{{ request()->input('fecha_agenda', $fechaDesde) }}" required>
                <button type="submit" id="btn-buscar" class="btn btn-success mt-2" hidden><i class="fas fa-search"></i></button>
            </form>
            
            <br>
            <label for="">Leyenda - Condición Pacte</label>
            <div class="legend-container">
                <!-- Aquí va el contenido de la leyenda -->

                <div class="legend-container">
                    <div class="legend-label">
                        <label for="">Regular</label>
                        <button class="legend-button regular-color"></button>
                    </div>

                    <div class="legend-label">
                        <label for="">Nuevo</label>
                        <button class="legend-button nuevo-color"></button>
                    </div>

                    <div class="legend-label">
                        <label for="">Happy Kids</label>
                        <button class="legend-button happy-kids-color"></button>
                    </div>
                    <div class="legend-label">
                        <label for="">No confirma</label>
                        <button class="legend-button no-confirma-color"></button>
                    </div>
                    <div class="legend-label">
                        <label for="">No acude</label>
                        <button class="legend-button no-acudio-color"></button>
                    </div>
                </div>

            </div>
        </div>

        <!-- Columna para el cuerpo de la agenda -->
        <div class="col-sm-10">
            <div class="header-container">
                <h3>{{ $fechaFormateada }}</h3>
                <a href="#" class="btn btn-primary rounded-pill px-4" onclick="printAgenda()">Imprimir Agenda</a>
            </div>
            <script>
                function formatDate(dateString) {
                    // Asumiendo que dateString está en el formato dd/mm/yyyy
                    const [day, month, year] = dateString.split('/'); // Dividir por "/"
                    return `${year}-${month}-${day}`; // Formatear a yyyy-mm-dd
                }
                function printAgenda() {
                    var fecha = document.getElementById('fecha_agenda').value;
                    var fecha_con_formato = formatDate(fecha);
                    var url = "{{ route('citas.impresion') }}" + "?fecha=" + encodeURIComponent(fecha);
                    window.open(url, '_blank');
                }
            </script>
            <div class="schedule-container">
                <div class="schedule-header">
                    <table class="table">
                        <thead>
                        <tr>
                            <th style="background-color: #add8e6; color: black; padding: 1px; font-size: 12px;text-align: center;">Hora</th>
                            @foreach ($medicosDatos as $medico)
                                <th style="background-color: #add8e6; color: black; padding: 1px; font-size: 12px; text-align: center;">
                                    {{ $medico['nombre_medico'] }}
                                    <div class="total-horas">
                                        {{ $totalDuraciones[$medico->id] }}
                                    </div>
                                </th>
                            @endforeach
                        </tr>
                        </thead>
                    </table>
                </div>
                <input type="hidden" id="id_medico" name="id_medico" value="{{ $medico['id'] }}"> <!-- Input oculto -->
                <div class="schedule-content">
                    <table class="table schedule-table">
                        <tbody>
                        @php
                            $prevCita = [];
                        @endphp
                        @for ($hour = 8; $hour < 22; $hour++)
                            @for ($minute = 0; $minute < 60; $minute += 30)
                                @php
                                    $time = str_pad($hour, 2, '0', STR_PAD_LEFT) . ":" . str_pad($minute, 2, '0', STR_PAD_LEFT);
                                    $current_time = date('H:i');
                                    $row_class = ($time == $current_time) ? 'current-time-row' : '';
                                @endphp
                                <tr class="{{ $row_class }}">
                                    <td class="time-cell">{{ $time }}</td>
                                    @foreach ($medicosDatos as $medico)
                                        @php
                                            $cita_encontrada = false;
                                            $rowspan = 1;
                                            $cell_class = 'selectable';
                                            $cell_content = '';

                                            if (!isset($prevCita[$medico['id']]) || $prevCita[$medico['id']]['finalizado']) {
                                                foreach ($citasDatos as $cita) {
                                                    $horaInicio = date('H:i', strtotime($cita['hora_inicio']));
                                                    $horaFin = date('H:i', strtotime($cita['hora_fin']));

                                                    if ($cita['id_medico'] == $medico['id'] && $horaInicio == $time) {
                                                            $cita_encontrada = true;

                                                            $hoy = new \DateTime();
                                                            $fecha_nacimiento = new \DateTime($cita->paciente->fecha_nacimiento);
                                                            $edad = $hoy->diff($fecha_nacimiento)->y;

                                                            $duracion_minutos = (strtotime($horaFin) - strtotime($horaInicio)) / 60;
                                                            $rowspan = 1;

                                                            $class = '';
                                                            switch ($cita['condicion']) {
                                                                case 2:
                                                                    $class = 'condicion-nuevo';
                                                                    break;
                                                                case 3:
                                                                    $class = 'condicion-kids';
                                                                    break;
                                                                case 4:
                                                                    $class = 'condicion-noacude';
                                                                    break;
                                                                case 5:
                                                                    $class = 'condicion-noconfirma';
                                                                    break;
                                                            }

                                                            // Concatenar nombres y ape_paterno
                                                            $nombreCompleto = htmlspecialchars($cita->paciente->nombres . ' ' . $cita->paciente->ape_paterno . ' ' . $cita->paciente->ape_materno);


                                                            $cell_content = '<div class="booked ' . $class . ' text-center d-flex justify-content-center align-items-center" style="height: 100%; position: relative; flex-direction: column;">' .
                                                                '<div>' . htmlspecialchars($nombreCompleto) . '</div>' .  // Mostrar el nombre completo aquí
                                                                '<div>' . $edad . ' años - ' . htmlspecialchars($cita->servicio->abreviatura) . '</div>' .
                                                                '<div class="menu-container" style="position: absolute; top: 5px; right: 5px;">' .
                                                                '<div class="menu-button">...</div>' .
                                                                '<div class="menu-content">' .
                                                                '<a href="#" class="view-cita" data-id="' . htmlspecialchars($cita->id) . '">Ver Datos</a><br>';

                                                            // Verificar si el usuario tiene permiso para modificar
                                                            if (auth()->user()->can('Editar cita')) {
                                                                $cell_content .= '<a href="#" class="modify-cita" data-id="' . htmlspecialchars($cita->id) . '">Modificar</a><br>';
                                                            }

                                                            // Verificar si el usuario tiene permiso para eliminar
                                                            if (auth()->user()->can('Eliminar')) {
                                                                $cell_content .= '<a href="#" class="delete-cita" data-id="' . htmlspecialchars($cita->id) . '">Eliminar</a><br>';
                                                            }

                                                            $cell_content .= '<a href="#" class="consult-cita" data-id="' . htmlspecialchars($cita->paciente->id) 
                                                            . '" data-nombre="' . htmlspecialchars($nombreCompleto) . '" 
                                                            id="consultar-cita-enlace">Consultar</a>';

                                                                '</div>' .
                                                                '</div>' .
                                                                '</div>';


                                                        $cell_class = 'booked';
                                                        break;
                                                    }
                                                }

                                                if ($cita_encontrada) {
                                                    echo '<td class="' . $cell_class . '" rowspan="' . $rowspan . '" style="vertical-align: middle; text-align: center;" data-doctor="' . $medico['id_medico'] . '">' . $cell_content . '</td>';
                                                    $prevCita[$medico['id_medico']] = [
                                                        'finalizado' => ($rowspan == 1),
                                                        'duracion_minutos' => $duracion_minutos
                                                    ];
                                                } else {
                                                    echo '<td class="selectable" data-time="' . $time . '" data-doctor="' . $medico['id'] . '"></td>';
                                                    $prevCita[$medico['id_medico']] = [
                                                        'finalizado' => true,
                                                        'duracion_minutos' => 0
                                                    ];
                                                }
                                            } else {
                                                if ($prevCita[$medico['id']]['duracion_minutos'] == 60) {
                                                    $prevCita[$medico['id']]['finalizado'] = true;
                                                }
                                            }
                                        @endphp
                                    @endforeach
                                </tr>
                            @endfor
                        @endfor
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
       
<!-- Modal para agregar nueva cita -->
<div class="modal fade" id="modal-create" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content shadow-lg rounded-lg">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title" id="exampleModalLabel">Crear Cita</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-create-cita" method="POST" action="{{ route('citas.store') }}">
                    @csrf
                    <div class="form-row">
                        <div class="form-group col-md-12">
                            <label for="medico">Médico</label>
                            <input type="hidden" id="id_medico" name="id_medico" value="" class="form-control">
                            <select id="medico" class="form-control rounded-pill" disabled>
                                @foreach ($medicosDatos as $medico)
                                    <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group position-relative">
                        <label for="paciente">Paciente</label>
                        <input type="text" class="form-control rounded-pill" id="paciente" name="paciente" placeholder="Buscar paciente..." autocomplete="off" required>
                        <input type="hidden" id="id_paciente" name="id_paciente">
                        <ul id="suggestions" class="list-group position-absolute w-100" style="display: none; z-index: 1050;"></ul>
                    </div>
                    <div class="form-group row">
                        <label for="condicion" class="col-form-label col-sm-4">Condición Paciente</label>
                        <div class="col-sm-8">
                            <select id="condicion" class="form-control rounded-pill">
                                <option value="1">Regular</option>
                                <option value="2">Nuevo</option>
                                <option value="3">Happy Kids</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group row align-items-center">
                        <label for="servicio" class="col-md-4 col-form-label">Procedimiento</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control rounded-pill" id="servicio-search" placeholder="Buscar procedimiento..." autocomplete="off" required>
                            <ul id="servicio-list" class="list-group position-absolute w-100" style="display: none; z-index: 1050;"></ul>
                            <input type="hidden" id="id_servicio">
                            <input type="hidden" id="id_presupuesto">
                            <input type="hidden" id="id_tratamiento">
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-md-4">
                            <label for="fecha">Fecha</label>
                            <input type="text" class="form-control rounded-pill" id="fecha" name="fecha" value="{{ \Carbon\Carbon::now()->format('d/m/Y') }}" readonly>
                        </div>
                        <div class="col-md-4">
                            <label for="hora_inicio">Hora Inicio</label>
                            <input type="text" class="form-control rounded-pill" id="hora_inicio" name="hora_inicio" readonly>
                        </div>
                        <div class="col-md-4">
                            <label for="hora_fin">Hora Fin</label>
                            <input type="time" class="form-control rounded-pill" id="hora_fin" name="hora_fin" step="1800">
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

<!-- Modal para modificar cita -->
    <div class="modal fade" id="modal-modify" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content shadow-lg rounded-lg">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Modificar datos de la Cita</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form-edit-cita" method="POST" action="">
                        @csrf
                        @method('PUT') <!-- Método PUT para actualización -->
                        <input type="hidden" id="edit-id" name="id">
                        <!-- Médico -->
                        <div class="form-row">
                            <!-- Contenedor del médico -->
                            <div class="form-group col-md-12">
                                <label for="medico_modify">Médico</label>
                                <input type="hidden" id="id_medico_modify" name="id_medico_modify">
                                
                                <select id="medico_modify" class="form-control rounded-pill" name="medico_modify">
                                    <option value="">Seleccionar médico</option>
                                    @foreach ($medicosDatos as $medico)
                                        <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                    @endforeach
                                </select>
                            </div>

                            
                        </div>

                        <div class="form-group position-relative">
                            <label for="paciente_modify">Paciente</label>
                            <input type="text" class="form-control rounded-pill" id="paciente_modify" name="paciente_" placeholder="Buscar paciente..." autocomplete="off" required>
                            <input type="hidden" id="id_paciente_modify" name="id_paciente">
                            <ul id="edit-suggestions" style="display: none;"></ul>
                        </div>

                        <div class="form-group row">
                            <label for="edit-condicion_modify" class="col-form-label col-sm-4">Condición Paciente</label>
                            <div class="col-sm-8">
                                <select id="edit-condicion_modify" class="form-control rounded-pill" name="condicion">
                                    <option value="1">Regular</option>
                                    <option value="2">Nuevo</option>
                                    <option value="3">Happy Kids</option>
                                    <option value="4">No acude</option>
                                    <option value="5">No confirma</option>
                                </select>
                            </div>
                        </div>

                        <!-- Servicio, precio, etc. -->
                        <div class="form-group row align-items-center position-relative">
                            <label for="servicio_search_modify" class="col-md-4 col-form-label">Procedimiento</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control rounded-pill" id="servicio_search_modify" placeholder="Buscar procedimiento..." autocomplete="off" required>
                                <ul id="edit-servicio-list" class="list-group position-absolute w-100" style="display:none;"></ul>
                                <input type="hidden" id="id_servicio_modify" name="id_servicio">
                                <input type="hidden" id="id_presupuesto_modify">
                                <input type="hidden" id="id_tratamiento_modify">
                            </div>
                        </div>
                        <!-- Fecha y horas -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <label for="edit-fecha_modify">Fecha</label>
                                <input type="date" class="form-control rounded-pill" id="edit-fecha_modify" name="fecha">
                            </div>
                            <div class="col-md-4">
                                <label for="hora_inicio_modify">Hora Inicio</label>
                                <input type="time" class="form-control rounded-pill" id="hora_inicio_modify" name="hora_inicio" step="1800">
                            </div>
                            <div class="col-md-4">
                                <label for="hora_fin_modify">Hora Fin</label>
                                <input type="time" class="form-control rounded-pill" id="hora_fin_modify" name="hora_fin" step="1800">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary rounded-pill  px-4" data-dismiss="modal">Cerrar</button>
                    <button type="button" class="btn btn-primary rounded-pill px-4" id="btn-update-cita">Guardar Cambios</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal para ver datos cita -->
    <div class="modal fade" id="modal-view" tabindex="-1" aria-labelledby="viewCitaModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content shadow-lg rounded-lg">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="exampleModalLabel">Datos de la Cita</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form id="form-view-cita">
                        <!-- Campo oculto para el ID de la cita -->
                        <input type="hidden" id="id_cita_" name="id_cita_" class="form-control">

                        <!-- Datos del médico -->
                        <div class="form-row">
                            <!-- Campo Médico -->
                            <div class="form-group col-md-12">
                                <label for="medico_1">Médico</label>
                                <input type="text" id="medico_1" name="medico_1" class="form-control rounded-pill" readonly>
                                <input type="hidden" id="id_medico_1" name="id_medico_1">
                            </div>

                            
                        </div>

                        <!-- Datos del paciente -->
                        <div class="form-group">
                            <label for="paciente_1">Paciente</label>
                            <input type="text" class="form-control rounded-pill" id="paciente_1" name="paciente_1" readonly>
                            <input type="hidden" id="id_paciente_1" name="id_paciente_1" class="form-control">
                        </div>

                        <!-- Condición del paciente -->
                        <div class="form-group row">
                            <label for="condicion_1" class="col-form-label col-sm-4">Condición Paciente</label>
                            <div class="col-sm-8">
                                <select id="condicion_1" name="condicion_1" class="form-control rounded-pill" disabled>
                                    <option value="1">Regular</option>
                                    <option value="2">Nuevo</option>
                                    <option value="3">Happy Kids</option>
                                    <option value="4">No acudió</option>
                                </select>
                            </div>
                        </div>

                        <!-- Datos del servicio y precios -->
                        <div class="form-group row align-items-center">
                            <label for="servicio-search_1" class="col-md-4 col-form-label">Procedimiento</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control rounded-pill" id="servicio-search_1" name="servicio-search_1" readonly>
                                <input type="hidden" id="id_servicio_1" name="id_servicio_1" class="form-control">
                            </div>
                        </div>
                        <!-- Fecha y horas de la cita -->
                        <div class="form-group row">
                            <div class="col-md-4">
                                <label for="fecha_1">Fecha</label>
                                <input type="date" class="form-control rounded-pill" id="fecha_1" name="fecha_1" readonly>
                            </div>
                            <div class="col-md-4">
                                <label for="hora_inicio_1">Hora Inicio</label>
                                <input type="time" class="form-control rounded-pill" id="hora_inicio_1" name="hora_inicio_1" readonly>
                            </div>
                            <div class="col-md-4">
                                <label for="hora_fin_1">Hora Fin</label>
                                <input type="time" class="form-control rounded-pill" id="hora_fin_1" name="hora_fin_1" readonly>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="presupuestos-modal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Presupuestos Aprobados</h5>
                    <button type="button" class="close text-white" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="presupuestos-list"></div>
                </div>
                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        
        // Detectar el cambio en el campo de fecha
        let fechaInput = document.getElementById('fecha_agenda');
        fechaInput.addEventListener('change', function() {
            console.log('Fecha seleccionada: ' + this.value); // Verifica si esto se muestra en la consola
            document.getElementById('miFormulario').submit();
        });

    });
</script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Mostrar/ocultar el menú al hacer clic en los tres puntos
            $(document).on('click', '.menu-button', function() {
                $(this).siblings('.menu-content').toggle();
            });

            // Ocultar el menú si se hace clic fuera de él
            $(document).on('click', function(event) {
                if (!$(event.target).closest('.menu-container').length) {
                    $('.menu-content').hide();
                }
            });
// Ver Datos
            $(document).on('click', '.view-cita', function(e) {
                e.preventDefault();
                const idCita = $(this).data('id');
                console.log("id_cita " + idCita);

                $.ajax({
                    url: '{{ url("citas") }}/' + idCita,
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        console.log("response:", response);

                        if (response.success) {
                            const cita = response.cita;

                            $('#id_cita_').val(cita.id);
                            $('#id_paciente_1').val(cita.id_paciente);
                            $('#id_servicio_1').val(cita.id_servicio);
                            $('#paciente_1').val(cita.nombre_paciente);
                            $('#id_medico_1').val(cita.id_medico);
                            $('#medico_1').val(cita.nombre_medico);
                            $('#servicio-search_1').val(cita.nombre_servicio);
                            $('#condicion_1').val(cita.condicion);
                            

                            const datePart = cita.fecha_cita.split(' ')[0];
                            $('#fecha_1').val(datePart);

                            const horaInicio = cita.hora_inicio;
                            const horaFin = cita.hora_fin;
                            const formattedHoraInicio = horaInicio.substring(0, 5);
                            const formattedHoraFin = horaFin.substring(0, 5);

                            $('#hora_inicio_1').val(formattedHoraInicio);
                            $('#hora_fin_1').val(formattedHoraFin);

                            $('#precio_servicio_1').val(cita.precio);
                            $('#precio_final_1').val(cita.precio_final);

                            $('#modal-view').modal('show');
                        } else {
                            Swal.fire('Error!', response.error, 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('Error!', 'Hubo un problema al obtener los datos de la cita.', 'error');
                    }
                });
            });
//modificar
            $(document).on('click', '.modify-cita', function(e) {
                e.preventDefault();
                const idCita = $(this).data('id');

                $.ajax({
                    url: '{{ url("citas") }}/' + idCita, // Ajusta la URL según tu ruta
                    type: 'GET',
                    dataType: 'json',
                    success: function(response) {
                        if (response.success) {
                            const cita = response.cita;
                            console.log("cita", cita);
                            // Asignar los datos al formulario del modal de modificación
                            $('#edit-id').val(cita.id);
                            $('#id_paciente_modify').val(cita.id_paciente);
                            $('#paciente_modify').val(cita.nombre_paciente);

                            // Asignar el médico
                            $('#id_medico_modify').val(cita.id_medico);
                            $('#medico_modify').val(cita.id_medico).trigger('change');

                            $('#id_servicio_modify').val(cita.id_servicio);
                            $('#id_presupuesto_modify').val(cita.id_presupuesto);
                            $('#id_tratamiento_modify').val(cita.id_tratamiento);
                            $('#servicio_search_modify').val(cita.nombre_servicio);
                            $('#precio_servicio_modify').val(cita.precio);
                            $('#precio_final_modify').val(cita.precio_final);

                            // Convertir la fecha de la base de datos a DD/MM/YYYY
                            const fecha = moment(cita.fecha_cita); // Asumiendo que cita.fecha_cita es en formato 'YYYY-MM-DD HH:MM:SS'
                            const fechaFormatted = fecha.format('DD/MM/YYYY'); // Para mostrar solo la fecha
                            const horaFormatted = fecha.format('HH:mm'); // Para mostrar solo la hora

                            $('#edit-fecha_modify').val(cita.fecha_cita);
                            $('#hora_inicio_modify').val(cita.hora_inicio.substring(0, 5)); // Solo "HH:MM"
                            $('#hora_fin_modify').val(cita.hora_fin.substring(0, 5)); // Solo "HH:MM"

                            $('#edit-condicion_modify').val(cita.condicion); // Condición del paciente

                            //$('#estado_cita_modify').val(cita.estado);

                            // Mostrar el modal
                            $('#modal-modify').modal('show');
                        } else {
                            Swal.fire('Error!', response.error, 'error');
                        }
                    },
                    error: function() {
                        Swal.fire('Error!', 'Hubo un problema al obtener los datos de la cita.', 'error');
                    }
                });
            });

// Eliminar
            $(document).on('click', '.delete-cita', function(e) {
                e.preventDefault();
                const idCita = $(this).data('id');
                Swal.fire({
                    title: '¿Estás seguro?',
                    text: "¡No podrás recuperar esta cita después de eliminarla!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Sí, eliminar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: '{{ url("citas") }}/' + idCita,
                            type: 'DELETE',
                            data: {
                                _token: '{{ csrf_token() }}'
                            },
                            success: function(response) {
                                Swal.fire({
                                    title: 'Eliminado!',
                                    text: 'La cita ha sido eliminada.',
                                    icon: 'success',
                                    confirmButtonText: 'OK'
                                }).then(() => {
                                    // Recargar la página
                                    location.reload();
                                });
                            },
                            error: function() {
                                Swal.fire('Error!', 'Hubo un problema al eliminar la cita.', 'error');
                            }
                        });
                    }
                });
            });
// Consultar
            $(document).on('click', '.consult-cita', function(e) {
                event.preventDefault(); // Evitar la redirección predeterminada del enlace

            // Obtener los valores de las fechas
            var fechaAgenda = document.getElementById('fecha_agenda').value;

            // Verificar que la fecha no esté vacía
            if (!fechaAgenda) {
                alert('Por favor selecciona una fecha en el campo "Fecha Agenda".');
                return;
            }

            // Obtener el ID del paciente desde los datos del enlace
            var pacienteId = this.getAttribute('data-id');
            
            // Construir la URL con las fechas y el ID del paciente
            var nuevaUrl = '/citas/consulta/' + pacienteId + '?fecha_inicial=' + encodeURIComponent(fechaAgenda) + '&fecha_final=' + encodeURIComponent(fechaAgenda);
            console.log("nuevaUrl",nuevaUrl);
            // Redirigir a la nueva URL
            window.location.href = nuevaUrl;
            });
        });

    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Ajusta el ancho de las columnas en el encabezado de la tabla para que coincida con el contenido
            $('.schedule-header th').each(function(index) {
                var contentWidth = $('.schedule-content td:nth-child(' + (index + 1) + ')').width();
                $(this).width(contentWidth);
            });

            // Event listener para el cambio en el campo de fecha
            document.getElementById('fecha').addEventListener('change', function() {
                // Simula el clic en el botón de búsqueda
                document.getElementById('btn-buscar').click();
                // Oculta el botón de búsqueda
                this.style.display = 'none';
            });

        });
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let selectedCell = null; // Variable global para la celda seleccionada

            // Manejo del clic en celdas (ocupadas y seleccionables)
            $('.schedule-table td').on('click', function() {
                // Desmarcar la celda previamente seleccionada
                if (selectedCell) {
                    selectedCell.removeClass('selected');
                }

                // Marcar la nueva celda seleccionada
                selectedCell = $(this);
                selectedCell.addClass('selected');

                // Obtener datos de la celda seleccionada
                const time = selectedCell.data('time');
                const doctor = selectedCell.data('doctor');
                
                // Obtener la fecha seleccionada
                const selectedDate = $('#fecha_agenda').val();
                function formatDate(dateString) {
                    // Asumiendo que dateString está en el formato dd/mm/yyyy
                    const [day, month, year] = dateString.split('/'); // Dividir por "/"
                    return `${year}-${month}-${day}`; // Formatear a yyyy-mm-dd
                }
                console.log("time",time,
                    "doctor",doctor,
                    "selectedDate",selectedDate);
                if (!selectedDate) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Fecha no seleccionada',
                        text: 'Selecciona una fecha para verificar la disponibilidad.',
                    });
                    return;
                }

                // Calcular la hora de fin estimada
                if (time && typeof time === 'string') {
                    let [hours, minutes] = time.split(':').map(Number);
                    minutes += 30; // Ajustar los minutos por defecto a 30, puedes cambiar según necesidad
                    if (minutes >= 60) {
                        minutes -= 60;
                        hours += 1;
                    }
                    if (hours >= 24) {
                        hours -= 24;
                    }
                    const hora_fin = `${String(hours).padStart(2, '0')}:${String(minutes).padStart(2, '0')}`;
                // Función para formatear la fecha
                function formatDateToDDMMYYYY(dateString) {
                        const [year, month, day] = dateString.split('-');  // Dividir por "-"
                        return `${day}/${month}/${year}`;  // Formatear a dd/mm/yyyy
                    }

                    // Formatear la fecha
                    const formattedDate = formatDateToDDMMYYYY(selectedDate);
                    $.ajax({
                        url: '{{ route("citas.verificarDisponibilidad") }}',
                        type: 'POST',
                        data: {
                            _token: '{{ csrf_token() }}',
                            fecha: selectedDate, // Fecha seleccionada
                            hora_inicio: time, // Hora de inicio seleccionada
                            hora_fin: hora_fin, // Hora de fin estimada
                            id_medico: doctor // ID del médico
                        },
                        success: function (response) {
                        if (response.available) {
                            // Verificar si el usuario tiene permiso
                            if (response.canCreateCita) {
                                // Mostrar el modal para agregar cita
                                $('#modal-create').modal('show');
                                $('#hora_inicio').val(time);
                                $('#hora_fin').val(hora_fin); // Establecer la nueva hora de fin
                                $('#medico').val(doctor);
                                $('#fecha').val(formattedDate);
                            } else {
                                // Opcional: Mostrar un mensaje de error o advertencia
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
                        error: function (xhr) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: 'Hubo un problema al verificar la disponibilidad. Detalle: ' + xhr.responseText,
                            });
                        }
                    });
                }
            });
        });
    </script>


    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('hora_inicio_1').addEventListener('input', function() {
                const fechaInput = document.getElementById('fecha_1').value;
                const horaInicioInput = document.getElementById('hora_inicio_1').value;

                if (horaInicioInput === '' || fechaInput === '') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Datos incompletos',
                        text: 'Por favor, asegúrate de seleccionar una fecha y hora de inicio válidas.',
                    });
                    return; // Evita que se continúe con el proceso de actualización
                }

                const selectedDate = new Date(fechaInput + 'T' + horaInicioInput);
                const currentTime = new Date();

                // Si la fecha y hora son menores a la actual, muestra un mensaje
                if (selectedDate < currentTime) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Fecha y hora inválidas',
                        text: 'La fecha y hora de inicio no pueden ser menores a la fecha y hora actuales.',
                    });
                    return; // Evita que se continúe con el proceso de actualización
                }
            });

            document.getElementById('hora_fin_1').addEventListener('input', function (e) {
                var time = e.target.value.split(':');
                var minutes = parseInt(time[1]);

                if (minutes % 30 !== 0) {
                    var newMinutes = Math.round(minutes / 30) * 30;
                    newMinutes = newMinutes === 60 ? 0 : newMinutes; // Evita 60 minutos, lo establece en 0
                    e.target.value = time[0].padStart(2, '0') + ':' + newMinutes.toString().padStart(2, '0');
                }

                var horaInicio = document.getElementById('hora_inicio_1').value;
                var horaFin = e.target.value;

                // Si la hora de fin es menor que la hora de inicio, mostrar mensaje o corregir
                if (horaFin < horaInicio) {
                    alert('La hora de fin no puede ser menor que la hora de inicio.');
                    e.target.value = horaInicio; // Restablecer a la hora de inicio
                }
            });
        });

    </script>
    <script>
        // Variable global para almacenar servicios
        let servicios = [];

        // Función para cargar servicios desde el servidor
        function cargarServicios(callback) {
            $.ajax({
                url: '{{ route("servicios.listado") }}',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    //console.log('Servicios cargados:', data);
                    servicios = data; // Actualiza la variable global con los datos recibidos
                    if (typeof callback === 'function') {
                        callback(data);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error al cargar los servicios:', error);
                    console.error('Estado:', status);
                    console.error('Respuesta:', xhr.responseText);
                }
            });
        }

        // Función para filtrar y mostrar servicios
        function filtrarServicios($searchInput, $resultList) {
            const searchValue = $searchInput.val().toLowerCase();
            $resultList.empty(); // Limpiar la lista

            // Filtrar y agregar las opciones
            const filteredServicios = servicios.filter(servicio =>
                servicio.nombre.toLowerCase().includes(searchValue)
            );

            filteredServicios.forEach(function(servicio) {
                const li = $('<li></li>').text(servicio.nombre).data('id', servicio.id);
                $resultList.append(li);
            });

            // Mostrar la lista si hay resultados
            if (filteredServicios.length > 0) {
                $resultList.show();
            } else {
                $resultList.hide();
            }
        }
        // Variable global para almacenar pacientes
        let pacientes = [];

        // Función para cargar pacientes desde el servidor
        function cargarPacientes(callback) {
            const empresaId = '{{ $empresaId }}'; // Asumiendo que pasaste el empresa_id a la vista
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
        // Función para seleccionar un servicio y actualizar los campos correspondientes
        function selectServicio(item, modalId) {
            const selectedText = item.text();
            const selectedId = item.data('id');
            const idMedico = $(`#${modalId} #medico`).val(); // Obtén el ID del médico del modal actual

            // Asignar el nombre del servicio al input de búsqueda y el ID del servicio
            if (modalId === 'modal-create') {
                $(`#${modalId} #servicio-search`).val(selectedText);
                $(`#${modalId} #id_servicio`).val(selectedId);
            } else if (modalId === 'modal-modify') {
                $(`#${modalId} #servicio_search_modify`).val(selectedText);
                $(`#${modalId} #id_servicio_modify`).val(selectedId);
            }

            console.log("selectedId " + selectedId);
            console.log("idMedico " + idMedico);

            // Hacer una consulta para obtener el precio y el tiempo del servicio seleccionado
            $.ajax({
                url: '{{ route("servicios.consultar_precio_tiempo") }}', // Llamar a la ruta definida en Laravel
                method: 'GET',
                data: {
                    id_servicio: selectedId,
                    id_medico: idMedico
                },
                success: function(response) {
                    try {
                        // Asignar el precio y el tiempo dependiendo del modal
                        if (modalId === 'modal-create') {
                            $(`#${modalId} #precio_servicio`).val(response.precio);
                            $(`#${modalId} #precio_final`).val(response.precio);
                        } else if (modalId === 'modal-modify') {
                            $(`#${modalId} #precio_servicio_modify`).val(response.precio);
                            $(`#${modalId} #precio_final_modify`).val(response.precio);
                        }

                        // Sumar el tiempo a hora_inicio
                        const tiempoMinutos = parseInt(response.tiempominutos); // Convertir a número
                        let horaInicio;

                        if (modalId === 'modal-create') {
                            horaInicio = $(`#${modalId} #hora_inicio`).val(); // Este campo debe contener "HH:mm"
                        } else if (modalId === 'modal-modify') {
                            horaInicio = $(`#${modalId} #hora_inicio_modify`).val();
                        }

                        // Asegúrate de que horaInicio tenga el formato correcto
                        if (horaInicio && /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/.test(horaInicio)) {
                            const nuevaHoraFin = calcularHoraFin(horaInicio, tiempoMinutos);

                            if (modalId === 'modal-create') {
                                $(`#${modalId} #hora_fin`).val(nuevaHoraFin);
                            } else if (modalId === 'modal-modify') {
                                $(`#${modalId} #hora_fin_modify`).val(nuevaHoraFin);
                            }
                        } else {
                            console.error("horaInicio no es válido:", horaInicio);
                        }

                    } catch (e) {
                        console.error('Error al procesar la respuesta:', e, response);
                    }
                },
                error: function(xhr, status, error) {
                    console.error('Error al consultar el precio y tiempo:', error, xhr.responseText);
                }
            });

            // Ocultar la lista después de seleccionar
            if (modalId === 'modal-create') {
                $(`#${modalId} #servicio-list`).hide();
            } else if (modalId === 'modal-modify') {
                $(`#${modalId} #edit-servicio-list`).hide();
            }
        }

        // Función para calcular la nueva hora_fin
        function calcularHoraFin(horaInicio, tiempoMinutos) {
            const [horas, minutos] = horaInicio.split(':').map(Number);
            const totalMinutos = (horas * 60) + minutos + tiempoMinutos;

            const nuevasHoras = Math.floor(totalMinutos / 60) % 24;
            const nuevosMinutos = totalMinutos % 60;

            return `${String(nuevasHoras).padStart(2, '0')}:${String(nuevosMinutos).padStart(2, '0')}`;
        }

        function selectPaciente(item, modalId) {
            const selectedText = item.text();
            const selectedId = item.data('id');

            // Asignar el nombre al input de búsqueda
            if (modalId === 'modal-create') {
                $(`#${modalId} #paciente`).val(selectedText);
                $(`#${modalId} #id_paciente`).val(selectedId);
            } else if (modalId === 'modal-modify') {
                $(`#${modalId} #paciente_modify`).val(selectedText);
                $(`#${modalId} #id_paciente_modify`).val(selectedId);
            }

            // Ocultar la lista después de seleccionar
            if (modalId === 'modal-create') {
                $(`#${modalId} #suggestions`).hide();
            } else if (modalId === 'modal-modify') {
                $(`#${modalId} #edit-suggestions`).hide();
            }

            // Buscar presupuestos aprobados para el paciente
            $.ajax({
                url: `/pacientes/${selectedId}/presupuestos-aprobados`,
                method: 'GET',
                success: function(data) {
                    if (data.length > 0) {
                        let modalContent = `
                            <h5 class="text-center mb-3">Presupuestos aprobados del paciente: <strong>${selectedText}</strong></h5>
                            <div class="tratamientos-container">
                        `;

                        data.forEach((presupuesto, index) => {
                            modalContent += `
                                <h6><strong>Presupuesto del ${presupuesto.fecha}</strong></h6>
                                <div class="tratamientos-list">
                                    ${presupuesto.tratamientos.map((tratamiento, index) => `
                                        <div class="tratamiento-item">
                                            <h6>${index + 1}. <button class="btn btn-sm btn-link" data-tratamiento-id="${tratamiento.id}" onclick="toggleProcedimientos(${tratamiento.id}, '${tratamiento.nombre}')"><i class="fas fa-plus"></i></button> ${tratamiento.nombre} - Pieza Dental: ${tratamiento.detalle_pieza}</h6>
                                            <ul class="procedimientos-list" id="procedimientos-${tratamiento.id}" style="display: none;">
                                                ${tratamiento.procedimientos.map(procedimiento => {
                                                    let procedimientoSeleccionable = true;
                                                    let fechaCita = '';

                                                    if (procedimiento.fecha_cita) {
                                                        procedimientoSeleccionable = false;
                                                        let fecha = new Date(procedimiento.fecha_cita);
                                                        let utcDate = new Date(fecha.getTime() + fecha.getTimezoneOffset() * 60000);
                                                        fechaCita = ('0' + utcDate.getDate()).slice(-2) + '/' + ('0' + (utcDate.getMonth() + 1)).slice(-2) + '/' + utcDate.getFullYear();
                                                    }

                                                    return `
                                                        <li onclick="${procedimientoSeleccionable ? `selectProcedimiento('${presupuesto.id}', '${tratamiento.id}', '${procedimiento.id}', '${procedimiento.nombre.replace(/'/g, "\\'")}')` : ''}" style="${procedimientoSeleccionable ? '' : 'color: gray;'}">
                                                            ${procedimiento.nombre} ${procedimientoSeleccionable ? '' : `<span class="text-muted">- Fecha de cita programada: ${fechaCita}</span>`}
                                                        </li>
                                                    `;
                                                }).join('')}
                                            </ul>
                                        </div>
                                    `).join('')}
                                </div>`;
                        });

                        modalContent += `</div>`;

                        // Mostrar el modal con los presupuestos
                        $('#presupuestos-modal .modal-body .presupuestos-list').html(modalContent);
                        $('#presupuestos-modal').modal('show');
                    } else {
                        //('#presupuestos-modal .modal-body .presupuestos-list').html(`
                        //    <p class="text-center text-muted">El paciente no tiene presupuestos aprobados.</p>
                        //`);
                        //$('#presupuestos-modal').modal('show');
                    }
                },
                error: function(xhr) {
                    console.error('Error al buscar presupuestos aprobados:', xhr.responseText);
                }
            });
        }

        function toggleProcedimientos(tratamientoId, tratamientoNombre) {
            const list = $(`#procedimientos-${tratamientoId}`);
            const button = list.closest('.tratamiento-item').find(`button[data-tratamiento-id="${tratamientoId}"]`);

            // Mostrar el id y el nombre del tratamiento en la consola
            console.log(`Tratamiento ID: ${tratamientoId}, Nombre: ${tratamientoNombre}`);

            if (list.is(':visible')) {
                list.hide();
                button.html('<i class="fas fa-plus"></i>');
            } else {
                list.show();
                button.html('<i class="fas fa-minus"></i>');
            }
        }

        function selectProcedimiento(idPresupuesto, idTratamiento, idProcedimiento, nombre) {
            console.log("idPresupuesto", idPresupuesto, "idTratamiento", idTratamiento, "idProcedimiento", idProcedimiento, "nombre", nombre);
            // Asignar valores a los campos del modal "Crear Cita"
            $('#modal-create #servicio-search').val(nombre);
            $('#modal-create #id_servicio').val(idProcedimiento);
            $('#modal-create #id_presupuesto').val(idPresupuesto); // Asignar el ID del presupuesto
            $('#modal-create #id_tratamiento').val(idTratamiento); // Asignar el ID del tratamiento

            // Cerrar el modal de detalle del presupuesto
            $('#presupuestos-modal').modal('hide');
        }

        document.addEventListener('DOMContentLoaded', function() {
        $('#modal-create').on('show.bs.modal', function() {
            const $servicioSearch = $('#servicio-search');
            const $servicioList = $('#servicio-list');

            // Limpiar la lista y cargar servicios al mostrar el modal
            $servicioList.empty();
            cargarServicios(function() {
                // Filtrar y mostrar servicios
                $servicioSearch.on('input', function() {
                    filtrarServicios($servicioSearch, $servicioList);
                });

                // Manejar la selección de un servicio
                $servicioList.on('click', 'li', function() {
                    selectServicio($(this), 'modal-create');
                });
            });

            // Ocultar la lista al hacer clic fuera
            $(document).click(function(event) {
                if (!$(event.target).closest('#servicio-search, #servicio-list').length) {
                    $servicioList.hide();
                }
            });
            // Configurar pacientes
            const $pacienteSearch = $('#paciente');
            const $pacienteList = $('#suggestions');

            // Limpiar la lista y cargar pacientes al mostrar el modal
            $pacienteList.empty();
            cargarPacientes(function() {
                // Filtrar y mostrar pacientes
                $pacienteSearch.on('input', function() {
                    filtrarPacientes($pacienteSearch, $pacienteList);
                });

                // Manejar la selección de un paciente
                $pacienteList.on('click', 'li', function() {
                    selectPaciente($(this), 'modal-create');
                });
            });

            // Ocultar la lista al hacer clic fuera
            $(document).click(function(event) {
                if (!$(event.target).closest('#paciente, #suggestions').length) {
                    $pacienteList.hide();
                }
            });
        });

        $('#modal-modify').on('show.bs.modal', function() {
            const $servicioSearch = $('#servicio_search_modify');
            const $servicioList = $('#edit-servicio-list');

            // Limpiar la lista y cargar servicios al mostrar el modal
            $servicioList.empty();
            cargarServicios(function() {
                // Filtrar y mostrar servicios
                $servicioSearch.on('input', function() {
                    filtrarServicios($servicioSearch, $servicioList);
                });

                // Manejar la selección de un servicio
                $servicioList.on('click', 'li', function() {
                    selectServicio($(this), 'modal-modify');
                });
            });

            // Ocultar la lista al hacer clic fuera
            $(document).click(function(event) {
                if (!$(event.target).closest('#servicio_search_modify, #edit-servicio-list').length) {
                    $servicioList.hide();
                }
            });

            // Configurar pacientes
            const $pacienteSearch = $('#paciente_modify');
            const $pacienteList = $('#edit-suggestions');

            // Limpiar la lista y cargar pacientes al mostrar el modal
            $pacienteList.empty();
            cargarPacientes(function() {
                // Filtrar y mostrar pacientes
                $pacienteSearch.on('input', function() {
                    filtrarPacientes($pacienteSearch, $pacienteList);
                });

                // Manejar la selección de un paciente
                $pacienteList.on('click', 'li', function() {
                    selectPaciente($(this), 'modal-modify');
                });
            });

            // Ocultar la lista al hacer clic fuera
            $(document).click(function(event) {
                if (!$(event.target).closest('#paciente_modify, #edit-suggestions').length) {
                    $pacienteList.hide();
                }
            });
        });
    });
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            
            
            $('#btn-save-cita').on('click', function() {
                const paciente = $('#paciente').val();
                const servicio1 = $('#servicio-search').val();
                const medico = $('#medico').val();
                const id_paciente = $('#id_paciente').val();
                const fecha = $('#fecha').val();
                const hora_inicio = $('#hora_inicio').val();
                const hora_fin = $('#hora_fin').val();
                const id_servicio = $('#id_servicio').val();
                const precio = $('#precio_servicio').val();
                const precio_final = $('#precio_final').val();
                const condicion = $('#condicion').val();
                const presupuesto = $('#id_presupuesto').val();
                const tratamiento = $('#id_tratamiento').val();
                function formatDate(dateString) {
                // Asumiendo que dateString está en el formato dd/mm/yyyy
                const [day, month, year] = dateString.split('/'); // Dividir por "/"
                return `${year}-${month}-${day}`; // Formatear a yyyy-mm-dd
            }
                if (id_paciente === '') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Campo obligatorio',
                        text: 'El campo paciente es obligatorio.',
                        confirmButtonText: 'OK'
                    });
                    return;
                }

                // Validación para el campo "servicio"
                if (id_servicio === '') {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Campo obligatorio',
                        text: 'El campo servicio es obligatorio.',
                        confirmButtonText: 'OK'
                    });
                    return;
                }

                $.ajax({
                    url: '/citas',
                    type: 'POST',
                    data: {
                        id_medico: $('#medico').val(),
                        id_paciente: $('#id_paciente').val(),
                        fecha: formatDate($('#fecha').val()), // Cambia el formato de fecha
                        hora_inicio: $('#hora_inicio').val(),
                        hora_fin: $('#hora_fin').val(),
                        id_servicio: $('#id_servicio').val(),
                        precio: $('#precio_servicio').val(),
                        precio_final: $('#precio_final').val(),
                        condicion: $('#condicion').val(),
                        presupuesto: $('#id_presupuesto').val() || 0,
                        tratamiento: $('#id_tratamiento').val() || 0,
                        estado: 0,
                        _token: $('meta[name="csrf-token"]').attr('content') // Incluye el token CSRF
                    },
                    success: function(response) {
                        if(response.success) {
                            Swal.fire({
                                icon: 'success',
                                title: 'Cita guardada',
                                text: response.message,
                                confirmButtonText: 'OK'
                            }).then(() => {
                                // Recargar la página o redirigir a otra vista
                                window.location.reload();
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: response.error,
                                confirmButtonText: 'OK'
                            });
                        }
                    },
                    error: function(xhr) {
                        if (xhr.status === 422) {
                            // Muestra los errores de validación
                            let errors = xhr.responseJSON.errors;
                            let errorMessages = '';
                            for (let field in errors) {
                                errorMessages += errors[field].join(', ') + '\n';
                            }
                            Swal.fire({
                                icon: 'error',
                                title: 'Errores de validación',
                                text: errorMessages,
                                confirmButtonText: 'OK'
                            });
                        } else {
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: 'Hubo un problema al procesar la solicitud. Detalle: ' + xhr.responseText,
                                confirmButtonText: 'OK'
                            });
                        }
                    }
                });
            });
            $('#btn-update-cita').click(function() {
                var idCita = $('#edit-id').val();
                var fechaCita = $('#edit-fecha_modify').val(); // Formato YYYY-MM-DD
                var horaInicio = moment($('#hora_inicio_modify').val(), 'HH:mm:ss').format('HH:mm:ss');
                var horaFin = moment($('#hora_fin_modify').val(), 'HH:mm:ss').format('HH:mm:ss');
                var idMedico = $('#medico_modify').val();
                var idPaciente = $('#id_paciente_modify').val();
                var idServicio = $('#id_servicio_modify').val();
                var precioServicio = $('#precio_servicio_modify').val();
                var precioFinal = $('#precio_final_modify').val();
                var condicion = $('#edit-condicion_modify').val();
                var presupuesto = $('#id_presupuesto_modify').val();
                var tratamiento = $('#id_tratamiento_modify').val();
                //var estado = $('#estado_cita_modify').val();
                // Combina la fecha y la hora en un solo campo
                //var fechaHoraCita = fechaCita + ' ' + horaInicio;
                console.log({
                    id: idCita,
                    fecha: fechaCita,
                    hora_inicio: horaInicio,
                    hora_fin: horaFin,
                    id_medico: idMedico,
                    id_paciente: idPaciente,
                    id_servicio: idServicio,
                    precio_servicio: precioServicio,
                    precio_final: precioFinal,
                    presupuesto: presupuesto,
                    tratamiento: tratamiento,
                    condicion: condicion,
                    _token: $('meta[name="csrf-token"]').attr('content') // Incluye el token CSRF
                });

                $.ajax({
                    url: '{{ route("citas.update", ":id") }}'.replace(':id', idCita),
                    type: 'PUT',
                    data: {
                        id: idCita,
                        fecha: fechaCita, // Combine fecha y hora
                        hora_inicio: horaInicio,
                        hora_fin: horaFin,
                        id_medico: idMedico,
                        id_paciente: idPaciente,
                        id_servicio: idServicio,
                        precio_servicio: precioServicio,
                        precio_final: precioFinal,
                        presupuesto: presupuesto || 0,
                        tratamiento: tratamiento || 0,
                        condicion: condicion,
                        _token: $('meta[name="csrf-token"]').attr('content') // Incluye el token CSRF
                    },
                    success: function(response) {
                        Swal.fire({
                            icon: 'success',
                            title: '¡Éxito!',
                            text: response.message,
                            confirmButtonText: 'OK'
                        }).then(() => {
                            // Recarga la página después de mostrar el mensaje
                            location.reload();
                        });
                    },
                    error: function(xhr) {
                        let errorMessage = 'Hubo un problema al actualizar la cita. Detalle: ' + xhr.responseText;

                        if (xhr.status === 400) {
                            // Verificar si el error es por horario ocupado
                            try {
                                let response = JSON.parse(xhr.responseText);
                                if (response.error && response.error.includes('El médico ya tiene una cita en ese horario.')) {
                                    errorMessage = 'El médico ya tiene una cita en ese horario. Por favor, elige otro horario.';
                                }
                            } catch (e) {
                                console.error('Error al parsear la respuesta JSON:', e);
                            }

                            Swal.fire({
                                icon: 'error',
                                title: 'Datos Inválidos',
                                text: errorMessage,
                                confirmButtonText: 'OK'
                            });
                        } else {
                            // Mensaje de error genérico
                            Swal.fire({
                                icon: 'error',
                                title: 'Error',
                                text: errorMessage,
                                confirmButtonText: 'OK'
                            });
                        }
                        console.log('Error en la solicitud:', xhr.responseText);
                    }
                });

            });

        });

    </script>
 @stop

@section('js')

<
<!-- jQuery primero -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<!-- Incluye los scripts de DataTables y Bootstrap -->
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
@stop
