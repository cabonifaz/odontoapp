@extends('adminlte::page')

@section('title', 'Facturación - Vitaldentis')

@section('content')
<div class="container">
    <form id="facturacion-form" action="{{ route('facturacion.store') }}" method="POST">
        @csrf
        <div class="row">
            <!-- Card 1: Datos del Comprobante -->
            <div class="col-md-6">
                <div class="card mt-0 shadow-sm border-primary">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <h5 class="mb-0">Datos del Comprobante</h5>
                        <select id="facturador_id" name="facturador_id" class="form-control ml-2" style="font-size:14px; width: auto; font-weight: bold; background-color: #ffeb3b;" required>
                            <option value="" disabled selected>Seleccione una empresa</option>
                            @foreach ($facturadores as $facturador)
                                <option value="{{ $facturador->id }}">{{ $facturador->razon_social }}</option>
                            @endforeach
                        </select>
                    </div>
                    <div class="card-body">
                        <!-- Tipo Doc, Serie, Correlativo, Médicos, Fecha -->
                        <div class="row mt-0">
                            <div class="col-md-4 form-group">
                                <label for="tipodoc">Tipo Doc.</label>
                                <select name="tipodoc" id="tipodoc" class="form-control" style="font-size: 14px;" required>
                                    <option value="03">Boleta</option>
                                    <option value="01">Factura</option>
                                    <option value="04">Nota de venta</option>
                                </select>
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="serie">Serie</label>
                                <select name="serie" class="form-control" style="font-size: 14px;" required></select>
                            </div>
                            <div class="col-md-4 form-group">
                                <label for="numdoc">Correlativo</label>
                                <input type="text" name="numdoc" class="form-control" style="font-size: 14px;" readonly>
                            </div>
                        </div>

                        <div class="row mt-0">
                            <div class="col-md-6 form-group">
                                <label for="medico_tratante_id">Médico Tratante</label>
                                <select name="medico_tratante_id" class="form-control" style="font-size: 14px;" required>
                                    @foreach($medicos as $medico)
                                        <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-6 form-group">
                                <label for="medico_factura_id">Médico Factura</label>
                                <select name="medico_factura_id" class="form-control" style="font-size: 14px;" required>
                                    @foreach($medicos as $medico)
                                        <option value="{{ $medico->id }}">{{ $medico->nombre_medico }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="row mt-0 align-items-center">
                            <div class="col-md-2">
                                <label for="fecha_presupuesto_display" class="form-label">Emisión:</label>
                            </div>
                            <div class="col-md-4">
                                <input type="date" name="fecha_presupuesto_display" id="fecha_presupuesto_display" class="form-control" required>
                                <input type="hidden" name="fecha_presupuesto" id="fecha_presupuesto">
                            </div>
                            <div class="col-md-2">
                                <label for="medio_pago" class="form-label">Medio de Pago:</label>
                            </div>
                            <div class="col-md-4">
                                <select name="medio_pago" id="medio_pago" class="form-control" style="font-size: 14px;" required>
                                    <option value="1">Efectivo</option>
                                    <option value="2">Tarjeta</option>
                                    <option value="3">Yape</option>
                                    <option value="4">Plin</option>
                                    <option value="5">Transferencia</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 2: Datos del Paciente -->
            <div class="col-md-6">
                <div class="card mt-0 shadow-sm border-primary">
                    <div class="card-header bg-primary text-white">
                        <h5>Datos del Cliente</h5>
                    </div>
                    <div class="card-body">
                        <!-- Paciente -->
                        <div class="row mt-3 align-items-center">
                            <div class="col-md-2">
                                <label for="buscar-paciente" class="form-label">Paciente:</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" id="buscar-paciente" class="form-control" autocomplete="off">
                                <input type="hidden" id="id-paciente" name="paciente_id">
                                <input type="hidden" id="tipodociden" name="tipodociden">
                                <input type="hidden" id="numerodoc" name="numerodoc">
                                <ul id="resultados-busqueda" class="resultados-busqueda" style="display: none;"></ul>
                            </div>
                        </div>
                        <!-- Título antes de RUC -->
                        <div class="row mt-3 align-items-center">
                            <div class="col-md-12">
                                <h5 style="font-weight: bold; text-decoration: underline;">Comprobante a nombre de:</h5>
                            </div>
                        </div>

                        <div class="row mt-3 align-items-center">
                            <div class="col-md-2">
                                <label for="tipo_doc" class="form-label">Tipo Doc:</label>
                            </div>
                            <div class="col-md-3">
                                <select id="tipo_doc" style="font-size: 14px;" name="tipo_doc" class="form-control">
                                    <option value="1">DNI</option>
                                    <option value="6">RUC</option>
                                    <option value="4">CEX</option>
                                    <option value="7">PAS</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <input type="text" id="num_doc" name="num_doc" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <div class="input-group">
                                    <button type="button" class="btn btn-info ml-1" onclick="buscarDocumento()">
                                        <i class="fas fa-search"></i>
                                    </button>
                                    <button type="button" class="btn btn-warning ml-1" onclick="limpiarCampos()">
                                        <i class="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!-- Razón Social -->
                        <div class="row mt-3 align-items-center">
                            <div class="col-md-2">
                                <label for="razon_social" style="font-size: 14px;">RazónSocial</label>
                            </div>
                            <div class="col-md-10 mb-1">
                                <input type="text" id="razon_social" name="razon_social" class="form-control">
                            </div>
                        </div>
                        <!-- Checkbox para mostrar el nombre del paciente en el comprobante -->
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="mostrarNombrePaciente" name="mostrarNombrePaciente">
                            <label class="form-check-label fw-bold text-primary" for="mostrarNombrePaciente">
                                Mostrar Nombre de Paciente en el comprobante
                            </label>
                        </div>
                         <!-- Direccion -->
                         <div class="row mt-3 mb-3 align-items-center" hidden>
                            <div class="col-md-2">
                                <label for="razon_social">Dirección</label>
                            </div>
                            <div class="col-md-10">
                                <input type="text" id="direccion" name="direccion" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 3: Detalle del Comprobante -->
        <div class="row mt-0">
            <div class="col-md-9">
                <div class="card mt-0 shadow-sm border-primary">
                    <div class="card-header bg-primary text-white">
                        <h5>Detalle del Comprobante</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-7">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <label for="presupuesto_id">Presupuesto</label>
                                        <select name="presupuesto_id" class="form-control" id="presupuesto-select" style="font-size: 12px;" required></select>
                                    </div>
                                    <div class="col-md-6 form-group">
                                        <label for="tratamiento_id">Tratamiento</label>
                                        <select name="tratamiento_id" class="form-control" id="tratamiento-select" style="font-size: 14px;" required></select>
                                    </div>
                                </div>
                                <div class="row mt-2">
                                    <div class="col-md-12 form-group">
                                        <label for="observaciones">Observaciones</label>
                                        <input type="text" id="observaciones" name="observaciones" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-5 form-group">
                                <label for="procedimiento_id">Procedimiento</label>
                                <ul class="list-group" id="procedimiento-list" style="font-size: 14px; height: 150px; overflow-y: auto;"></ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Card 4: Detalle de Montos -->
            <div class="col-md-3">
                <div class="card mt-0 shadow-sm border-primary">
                    <div class="card-header bg-primary text-white">
                        <h5>Importe</h5>
                    </div>
                    <div class="card-body">
                        <div class="row mb-1">
                            <div class="col-md-4">
                                <label for="subtotal">SubTotal</label>
                            </div>
                            <div class="col-md-8 text-end">
                                <input type="text" id="subtotal" name="subtotal" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-4">
                                <label for="igv">IGV</label>
                            </div>
                            <div class="col-md-8 text-end">
                                <input type="text" id="igv" name="igv" class="form-control" readonly>
                            </div>
                        </div>
                        <div class="row mb-2">
                            <div class="col-md-4">
                                <label for="total">Total</label>
                            </div>
                            <div class="col-md-8">
                                <input type="number" step="0.01" id="total" name="total" class="form-control">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="d-flex justify-content-end mt-4">
                    <button type="submit" id="btn-guardar" class="btn btn-primary rounded-pill">Guardar</button>
                    <a href="{{ route('facturacion.create') }}" class="btn btn-secondary rounded-pill">Cancelar</a>
                </div>
            </div>
        </div>

        
    </form>
</div>
@stop

@section('js')
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Incluyendo SweetAlert desde un CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
// Función para formatear la fecha en dd/mm/yyyy
function formatearFecha(fecha) {
    const date = new Date(fecha);
    const dia = String(date.getDate()).padStart(2, '0');
    const mes = String(date.getMonth() + 1).padStart(2, '0');
    const anio = date.getFullYear();
    return `${dia}/${mes}/${anio}`;
}

// Variables globales
let pacientes = [];
let presupuestos = [];
let tratamientos = [];

// Función genérica para realizar solicitudes AJAX
function realizarSolicitudAjax(url, tipo, datos, exito, error) {
    $.ajax({
        url: url,
        type: tipo,
        data: datos,
        dataType: 'json',
        success: exito,
        error: error
    });
}

// Cargar pacientes desde el servidor
function cargarPacientes(callback) {
    const empresaId = '{{ $empresaId }}';
    realizarSolicitudAjax('{{ route("pacientes.filtrar") }}', 'GET', { empresa_id: empresaId }, 
        function(data) {
            pacientes = data;
            if (typeof callback === 'function') callback(data);
        }, 
        function(xhr, status, error) {
            console.error('Error al cargar los pacientes:', error, xhr.responseText);
        }
    );
}

// Cargar presupuestos del paciente
function cargarPresupuestos(pacienteId, callback) {
    realizarSolicitudAjax('{{ route("facturacion.obtener") }}', 'GET', { paciente_id: pacienteId, estados: [1, 2, 3] }, 
        function(data) {
            presupuestos = data;
            if (typeof callback === 'function') callback(data);
        },
        function(xhr, status, error) {
            console.error('Error al cargar los presupuestos:', error, xhr.responseText);
        }
    );
}

// Cargar tratamientos según el presupuesto
function cargarTratamientos(presupuestoId = null, callback) {
    let url = presupuestoId ? `/facturacion/${presupuestoId}/tratamientos` : `/obtener-actividades`;
    realizarSolicitudAjax(url, 'GET', {}, 
        function(data) {
            tratamientos = data;
            if (typeof callback === 'function') callback(data);
        },
        function(xhr, status, error) {
            console.error('Error al cargar los tratamientos:', error, xhr.responseText);
        }
    );
}

// Cargar procedimientos según detallePresupuestoId (si existe) o tratamientoId (si no hay presupuesto)
function cargarProcedimientos(detallePresupuestoId, tratamientoId) {
    let url;
    if (detallePresupuestoId) {
        url = `/facturacion/${detallePresupuestoId}/procedimientos`;
        console.log(`Solicitando procedimientos con detallePresupuestoId: ${detallePresupuestoId}`);
    } else if (tratamientoId) {
        url = `/tratamiento/${tratamientoId}/procedimientos`;
        console.log(`Solicitando procedimientos sin presupuesto, solo con tratamientoId: ${tratamientoId}`);
    } else {
        console.warn("No se puede cargar procedimientos: sin detallePresupuestoId ni tratamientoId.");
        return;
    }

    realizarSolicitudAjax(url, 'GET', {}, 
        function(data) {
            mostrarProcedimientos(data);
        },
        function(xhr, status, error) {
            console.error('Error al cargar los procedimientos:', error, xhr.responseText);
        }
    );
}

// Mostrar presupuestos en el select
function mostrarPresupuestos($selectPresupuesto) {
    $selectPresupuesto.empty().append('<option value="">Seleccionar Presupuesto</option>');
    presupuestos.forEach(p => {
        let option = $('<option></option>').val(p.id).text(`${formatearFecha(p.fecha)} - S/. ${p.importe}`);
        $selectPresupuesto.append(option);
    });
}

// Mostrar tratamientos en el select
function mostrarTratamientos($selectTratamiento, tratamientos) {
    $selectTratamiento.empty();
    if (!Array.isArray(tratamientos) || tratamientos.length === 0) {
        $selectTratamiento.append('<option value="">No hay tratamientos disponibles</option>');
        return;
    }

    tratamientos.forEach(t => {
        let option = $('<option></option>')
            .val(t.id)
            .text(t.nombre)
            .attr("data-detalle-presupuesto-id", t.detalle_presupuesto_id);
        $selectTratamiento.append(option);
    });

    $selectTratamiento.prop("selectedIndex", 0).trigger("change");
}

// Mostrar procedimientos en la lista <ul>
function mostrarProcedimientos(procedimientos) {
    let ul = $("#procedimiento-list");
    ul.empty();
    if (!Array.isArray(procedimientos) || procedimientos.length === 0) {
        ul.append('<li class="list-group-item">No hay procedimientos disponibles</li>');
        return;
    }

    procedimientos.forEach(procedimiento => {
        let listItem = `
            <li class="list-group-item">
                <input type="checkbox" class="procedimiento-checkbox" value="${procedimiento.id}">
                ${procedimiento.nombre}
            </li>`;
        ul.append(listItem);
    });
    console.log("Procedimientos mostrados en la lista.");
}

$(document).ready(function() {
    let $selectPresupuesto = $("#presupuesto-select");
    let $selectTratamiento = $("#tratamiento-select");

    // Cargar tratamientos al cambiar el presupuesto
    $selectPresupuesto.on("change", function() {
        let presupuestoId = $(this).val();
        cargarTratamientos(presupuestoId, function(tratamientos) {
            mostrarTratamientos($selectTratamiento, tratamientos);
        });
    });

    // Cargar procedimientos al cambiar el tratamiento
    $selectTratamiento.on("change", function() {
        let tratamientoId = $(this).val();
        let detallePresupuestoId = $(this).find(':selected').data('detalle-presupuesto-id') || null;
        cargarProcedimientos(detallePresupuestoId, tratamientoId);
    });

    // Cargar tratamientos si hay presupuesto seleccionado al cargar la página
    if ($selectPresupuesto.val()) {
        $selectPresupuesto.trigger("change");
    }

    // Cargar pacientes
    cargarPacientes(function() {
        // Buscar paciente
        $('#buscar-paciente').on('input', function() {
            filtrarPacientes($(this), $('#resultados-busqueda'));
        });

        // Seleccionar paciente
        $('#resultados-busqueda').on('click', 'li', function() {
            let pacienteId = $(this).data('id');
            let tipoDocPaciente = $(this).data('tipodociden');
            let numDocPaciente = $(this).data('numerodoc');
            $('#id-paciente').val(pacienteId);
            $('#tipodociden').val(tipoDocPaciente);
            $('#numerodoc').val(numDocPaciente);
            $('#buscar-paciente').val($(this).text());
            $('#resultados-busqueda').hide();
            // Si el tipo de documento es diferente de 0, asignarlo al select y al input
            if (tipoDocPaciente !== "0" && tipoDocPaciente !== 0) {
                $('#tipo_doc').val(tipoDocPaciente); // Asignar el tipo de documento al select
                $('#num_doc').val(numDocPaciente); // Asignar el número de documento al input
                $('#razon_social').val($(this).text()); // Asignar razón social con el nombre del paciente
            } else {
                // Si el tipo de documento es "0", limpiar los campos y establecer el select en DNI (value = 1)
                $('#tipo_doc').val("1"); // Seleccionar DNI por defecto
                $('#num_doc').val(""); // Limpiar número de documento
                $('#razon_social').val(""); // Limpiar razón social
            }
            cargarPresupuestos(pacienteId, function() {
                mostrarPresupuestos($('select[name="presupuesto_id"]'));
                cargarTratamientos(null, function(tratamientos) {
                    mostrarTratamientos($('select[name="tratamiento_id"]'), tratamientos);
                });
            });
        });
    });
});

// Función para filtrar y mostrar pacientes
function filtrarPacientes($searchInput, $resultList) {
    const searchValue = $searchInput.val().toLowerCase();
    $resultList.empty();
    const filteredPacientes = pacientes.filter(paciente =>
        (paciente.nombres + ' ' + paciente.ape_paterno + ' ' + paciente.ape_materno).toLowerCase().includes(searchValue)
    );

    filteredPacientes.forEach(function(paciente) {
        const li = $('<li></li>').text(paciente.nombres + ' ' + paciente.ape_paterno + ' ' + paciente.ape_materno)
                                .data('id', paciente.id)
                                .data('tipodociden', paciente.tipodocumento)
                                .data('numerodoc', paciente.numerodoc);
        $resultList.append(li);
    });

    if (filteredPacientes.length > 0) {
        $resultList.show();
    } else {
        $resultList.hide();
    }
}
</script>

<script>
$(document).ready(function() {
    let timeout; // Variable para evitar múltiples llamadas AJAX innecesarias

    $('input[name="total"]').on('input', function() {
        clearTimeout(timeout); // Limpiar el temporizador anterior

        timeout = setTimeout(() => {
            const total = parseFloat($(this).val()) || 0;
            const subtotal = total / 1.18;
            const igv = subtotal * 0.18;

            $('input[name="subtotal"]').val(subtotal.toFixed(2));
            $('input[name="igv"]').val(igv.toFixed(2));

            // Validar si el total no excede el importe del presupuesto
            const presupuestoId = $('select[name="presupuesto_id"]').val();
            if (presupuestoId) {
                validarTotal(presupuestoId, total);
            }
        }, 300); // Esperar 300ms antes de hacer la validación
    });

    function validarTotal(presupuestoId, totalIngresado) {
        $.ajax({
            url: `/facturacion/${presupuestoId}/total-sumado`,
            method: 'GET',
            dataType: 'json',
            success: function(data) {
                const totalRegistrado = parseFloat(data.total_sumado) || 0;
                const importePresupuesto = parseFloat(data.importe_presupuesto) || 0;

                console.log("Total Registrado:", totalRegistrado);
                console.log("Importe Presupuesto:", importePresupuesto);
                console.log("Total Ingresado:", totalIngresado);

                if ((totalRegistrado + totalIngresado) > importePresupuesto) {
                    Swal.fire({
                        title: 'Error',
                        text: 'El total ingresado excede el importe del presupuesto.',
                        icon: 'error',
                        confirmButtonText: 'Aceptar'
                    });

                    // Limpiar los valores de los campos
                    $('input[name="total"]').val('');
                    $('input[name="subtotal"]').val('');
                    $('input[name="igv"]').val('');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error al validar el total:', error);
                console.error('Estado:', status);
                console.error('Respuesta:', xhr.responseText);
            }
        });
    }
});
</script>

<script>
$(document).ready(function() {
    // Manejar la selección de un facturador_id
    $('select[name="facturador_id"]').on('change', function() {
        const selectedFacturadorId = $(this).val();
        const selectedTipodoc = $('select[name="tipodoc"]').val(); // Obtener el tipodoc seleccionado

        if (selectedTipodoc) {
            cargarSeries(selectedTipodoc, selectedFacturadorId);
        }
    });

    // Manejar la selección de un tipodoc
    $('select[name="tipodoc"]').on('change', function() {
        const selectedTipodoc = $(this).val();
        const facturadorId = document.querySelector('#facturador_id').value; // Obtener el facturador_id

        cargarSeries(selectedTipodoc, facturadorId);
    });

    // Manejar la selección de una serie
    $('select[name="serie"]').on('change', function() {
        const selectedSerie = $(this).val();
        const facturadorId = document.querySelector('#facturador_id').value; // Obtener el facturador_id

        cargarCorrelativo(selectedSerie, facturadorId);
    });

    // Función para cargar las series
    function cargarSeries(tipodoc, facturadorId) {
        $.ajax({
            url: `/parametros/${tipodoc}/series`,
            method: 'GET',
            data: {
                facturador_id: facturadorId // Incluir facturador_id en los datos de la solicitud
            },
            dataType: 'json',
            success: function(data) {
                const $selectSerie = $('select[name="serie"]');
                $selectSerie.empty(); // Limpiar el select de series

                data.series.forEach(function(serie) {
                    const option = $('<option></option>').val(serie).text(serie);
                    $selectSerie.append(option);
                });

                // Cargar el correlativo para la primera serie cargada, si existe
                if (data.series.length > 0) {
                    $selectSerie.val(data.series[0]).change(); // Lanzar el evento change
                }
            },
            error: function(xhr, status, error) {
                console.error('Error al cargar las series:', error);
                console.error('Estado:', status);
                console.error('Respuesta:', xhr.responseText);
            }
        });
    }

    function cargarCorrelativo(serie, facturadorId) {
        $.ajax({
            url: `/facturacion/${serie}/ultimo-numdoc`,
            method: 'GET',
            data: {
                facturador_id: facturadorId // Incluir facturador_id en los datos de la solicitud
            },
            dataType: 'json',
            success: function(data) {
                const siguienteNumdoc = data.ultimo_numdoc;
                $('input[name="numdoc"]').val(siguienteNumdoc.toString().padStart(8, '0'));
            },
            error: function(xhr, status, error) {
                console.error('Error al cargar el correlativo:', error);
                console.error('Estado:', status);
                console.error('Respuesta:', xhr.responseText);
            }
        });
    }
    // Disparar el evento change en tipodoc para cargar las series y el correlativo al cargar la página
    $('select[name="tipodoc"]').trigger('change');
});


</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    let fechaInput = document.getElementById("fecha_presupuesto_display");
    let hoy = new Date();
    let minFecha = new Date();
    minFecha.setDate(hoy.getDate() - 2);

    let formatoHoy = hoy.toISOString().split("T")[0];
    let formatoMinFecha = minFecha.toISOString().split("T")[0];

    fechaInput.setAttribute("max", formatoHoy);
    fechaInput.setAttribute("min", formatoMinFecha);
    fechaInput.value = formatoHoy;
});

function validarFormulario() {
    let camposRequeridos = ["tipodoc", "serie", "numdoc", "paciente_id", "medico_tratante_id", "medico_factura_id", "presupuesto_id", "tratamiento_id", "procedimiento_id"];
    let esValido = true;

    camposRequeridos.forEach(function(id) {
        let campo = document.getElementsByName(id)[0];
        if (!campo || campo.value.trim() === "") {
            esValido = false;
            campo.classList.add("is-invalid");
        } else {
            campo.classList.remove("is-invalid");
        }
    });

    return esValido;
}
</script>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const displayInput = document.getElementById('fecha_presupuesto_display');
    const hiddenInput = document.getElementById('fecha_presupuesto');

    // Función para establecer la fecha de displayInput al cargar la página
    function setInitialDate() {
        const currentDateTime = new Date();
        const year = currentDateTime.getFullYear();
        const month = (currentDateTime.getMonth() + 1).toString().padStart(2, '0'); // Los meses en JavaScript son 0-11
        const day = currentDateTime.getDate().toString().padStart(2, '0');
        
        // Configurar el valor inicial de displayInput con la fecha actual
        displayInput.value = `${year}-${month}-${day}`;
        console.log("Fecha inicial de displayInput:", displayInput.value);
    }

    // Función para actualizar el campo oculto con la hora del sistema
    function updateHiddenInput() {
        const dateValue = displayInput.value;
        
        console.log("Fecha de displayInput:", dateValue); // Asegúrate de que esta fecha sea la correcta

        const currentDateTime = new Date();
        const hours = currentDateTime.getHours().toString().padStart(2, '0');
        const minutes = currentDateTime.getMinutes().toString().padStart(2, '0');
        const seconds = currentDateTime.getSeconds().toString().padStart(2, '0');

        // Generar la fecha y hora completa utilizando la fecha de displayInput
        const dateTimeValue = `${dateValue}T${hours}:${minutes}:${seconds}`;
        hiddenInput.value = dateTimeValue;

        // Imprimir la fecha y hora generada en la consola para depuración
        console.log("dateTimeValue", dateTimeValue);
        console.log("Fecha del sistema:", currentDateTime.toISOString());
        console.log("Fecha del sistema local:", currentDateTime.toLocaleString());
    }

    // Ejecutar la función al cambiar el valor del campo de fecha
    displayInput.addEventListener('change', updateHiddenInput);

    // Ejecutar la función para establecer la fecha inicial al cargar la página
    setInitialDate();

    // Ejecutar la función al cargar la página
    updateHiddenInput();

    document.querySelector(".btn-primary").addEventListener("click", function (event) {
        event.preventDefault(); // Evita el envío tradicional del formulario

        let form = document.querySelector("#facturacion-form");
        let formData = new FormData(form);
        var checkbox = document.getElementById('mostrarNombrePaciente');

        // Establecer su valor correctamente en FormData
        formData.set('mostrarNombrePaciente', checkbox.checked ? '1' : '0');

        //console.log("formData", formData);
        // Obtener los valores de los campos
        let fecha_presupuesto = formData.get("fecha_presupuesto");
        //console.log("fecha_presupuesto", fecha_presupuesto);
        let tipodoc = formData.get("tipodoc");
        //let ruc = formData.get("ruc");
        let presupuesto_id = formData.get("presupuesto_id") || "0";
        let paciente_id = formData.get("paciente_id");
        let medico_tratante_id = formData.get("medico_tratante_id");
        let medico_factura_id = formData.get("medico_factura_id");
        let serie = formData.get("serie");
        let numdoc = formData.get("numdoc");
        let igv = formData.get("igv");
        let subtotal = formData.get("subtotal");
        let total = formData.get("total");
        let tratamiento_id = formData.get("tratamiento_id");
        let facturador_id = formData.get("facturador_id");
        let numerodoc = formData.get("num_doc");
        let tipodociden = formData.get("tipo_doc");
        let medio_pago = formData.get("medio_pago");
        let fechaHoraRegex = /^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}$/; // YYYY-MM-DDTHH:MM:SS formato
        // Obtener los valores seleccionados de procedimientos
        let procedimiento_id = $("#procedimiento-list input:checked").map(function() {
            return $(this).val();
        }).get();

        //console.log("procedimiento_id", procedimiento_id); // Verifica en consola
        //console.log("medio_pago", medio_pago);
        // Eliminar antes de agregar al formData
        formData.delete("procedimiento_id"); 

        // Si hay procedimientos seleccionados, agregarlos uno por uno
        procedimiento_id.forEach(id => {
            formData.append("procedimiento_id[]", id);
        });

        if (!fechaHoraRegex.test(fecha_presupuesto)) {
            Swal.fire("Error", "El campo Fecha de Presupuesto debe contener tanto la fecha como la hora en formato 'YYYY-MM-DDTHH:MM:SS'.", "error");
            return;
        }
        // Validar los campos
        let errores = [];

        if (!presupuesto_id) errores.push("Presupuesto ID");
        if (!tratamiento_id) errores.push("Tratamiento ID");
                // Validar si el array de procedimientos está vacío
        if (!procedimiento_id.length) {
            errores.push("Debe seleccionar al menos un procedimiento.");
        }
        if (!fecha_presupuesto) errores.push("Fecha de Presupuesto");
        if (!paciente_id) errores.push("Paciente ID");
        if (!medico_tratante_id) errores.push("Médico Tratante");
        if (!medico_factura_id) errores.push("Médico Factura");
        if (!tipodoc) errores.push("Tipo de Documento");
        if (!serie) errores.push("Serie");
        if (!numdoc) errores.push("Número de Documento");
        if (!igv) errores.push("IGV");
        if (!subtotal) errores.push("Subtotal");
        if (!total) errores.push("Total");
        if (!medio_pago) errores.push("Medio de Pago");
        if (!facturador_id) errores.push("Facturador");
        if (!tipodociden) errores.push("Tipo Documento de Identidad");

        if (errores.length > 0) {
            Swal.fire("Error", "Los siguientes campos son obligatorios:\n" + errores.join(", "), "error");
            return;
        }

        if (tipodoc === "01") { // Factura
            if (tipodociden !== "6" || numerodoc.length !== 11) {
                Swal.fire({
                    icon: "error",
                    title: "Error de Facturación",
                    text: "Para Facturas (Tipo 01), el RUC es obligatorio y debe tener 11 dígitos.",
                });
                return;
            }
        }

        if (tipodoc === "03") { // Boleta
            if (!["1", "4", "6", "7"].includes(tipodociden)) { // Solo permite DNI (1), CEX (4) o RUC (6)
                Swal.fire({
                    icon: "error",
                    title: "Documento inválido",
                    text: "Para Boletas (Tipo 03), el documento debe ser DNI, CEX o RUC.",
                });
                return;
            }

            // Validación de longitud según tipo de documento
            if ((tipodociden === "1" && numerodoc.length !== 8) || 
                (tipodociden === "6" && numerodoc.length !== 11) || 
                (tipodociden === "4" && (numerodoc.length < 8 || numerodoc.length > 20))) {
                Swal.fire({
                    icon: "error",
                    title: "Número de documento inválido",
                    text: "Verifique la cantidad de caracteres según el tipo de documento.",
                });
                return;
            }
        }
        // Verificar si el total es cero
        if (total <= 0 || total === "0") {
            Swal.fire({
                icon: 'error',
                title: 'Monto no válido',
                text: 'Debe ingresar un monto válido antes de proceder.',
            });
            return;
        }
        //console.log("formData",formdata);
        Swal.fire({
            title: "¿Confirmar Facturación y envío a SUNAT?",
            text: "¿Estás seguro de registrar y enviar a SUNAT este comprobante? ¿Ha verificado que los datos sean correctos?",
            icon: "warning",
            showCancelButton: true,
            confirmButtonText: "Sí, Guardar y Enviar a SUNAT",
            cancelButtonText: "Cancelar"
        }).then((result) => {
            if (result.isConfirmed) {
                 // 🔒 Deshabilitar botón para evitar doble envío
                const btnGuardar = document.getElementById("btn-guardar");
                btnGuardar.disabled = true;
                btnGuardar.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status"></span> Guardando...';

                fetch(form.action, {
                    method: "POST",
                    body: formData,
                    headers: {
                        "X-CSRF-TOKEN": document.querySelector('input[name="_token"]').value
                    }
                })
                .then(response => {
                    if (!response.ok) {
                        return response.text().then(text => { throw new Error(text) });
                    }
                    return response.json(); // Procesar JSON
                })
                .then(data => {
                    if (data.success) {
                        const facturaId = data.factura_id; // Capturar el ID de la factura
                        const facturadorId = document.querySelector("#facturador_id").value;

                        // Enviar la solicitud para generar el XML y enviarlo a SUNAT
                        return fetch(`/sunat/generarXML/${facturaId}?tipo=normal`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'Accept': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                            },
                            body: JSON.stringify({ facturadorId })
                        }).then(response => {
                            if (!response.ok) {
                                return response.text().then(text => { throw new Error(text) });
                            }
                            return response.json(); // Procesar la respuesta del envío a SUNAT
                        });
                    } else {
                        throw new Error(data.message || "Ocurrió un error al registrar la factura.");
                    }
                })
                .then(xmlData => {
                    if (xmlData.success) {
                        const facturadorId = document.querySelector("#facturador_id").value;
                        Swal.fire({
                            title: "Éxito",
                            text: "El comprobante fue guardado y enviado con éxito.",
                            icon: "success"
                        }).then(() => {
                            // Redirigir a la bandeja de SUNAT con el facturador_id
                            window.location.href = `{{ route('facturacion.bandejasunat') }}?facturador_id=${facturadorId}`;
                        });
                    } else {
                        throw new Error(xmlData.message || "Error al enviar el comprobante a SUNAT.");
                    }
                })
                .catch(error => {
                    Swal.fire({
                        title: "Error",
                        text: error.message || "No se pudo procesar la solicitud.",
                        icon: "error"
                    });
                    console.error("Error:", error);
                });
            }
        });
    });
});
</script>

<script>
    //PARA RUC
    function buscarRuc() {
        let ruc = $('#num_doc').val().trim();
        if (ruc === '') {
            Swal.fire('Error', 'Ingrese un RUC para buscar', 'error');
            return;
        }

        // Primera llamada AJAX para buscar en el modelo Cliente
        $.ajax({
            url: '{{ route("clientes.buscar_ruc") }}', // Ruta para verificar en la base de datos
            method: 'GET',
            data: { ruc: ruc },
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
            success: function(data) {
                //console.log("Datos devueltos del servidor:", data); // Log para ver qué devuelve el servidor
                if (data.existe) {
                    // Si el cliente ya existe, asigna los datos
                    $('#razon_social').val(data.razonsocial);
                    $('#direccion').val(data.direccion); // Asigna el ID al campo oculto

                } else {
                    //console.log("DNI no encontrado en la base de datos local. Llamando a la API Externa");
                    // Si no existe, llama a la API externa
                    buscarRucAPI(ruc);
                }
            },
            error: function(xhr, status, error) {
                //console.error('Error:', status, error);
                //console.log('Response:', xhr.responseText); // Muestra el texto de respuesta del servidor
                Swal.fire('Error', 'Ocurrió un error al buscar el Ruc. ' + error, 'error');
            }
        });
    }

    function buscarRucAPI(ruc) {
        console.log("Llamando a la API externa con el RUC:", ruc);
        $.ajax({
            url: '{{ route("buscar.ruc") }}', // Ruta para buscar en la API
            method: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({
                valor: ruc,
                request_by: "Sistema Consultorios del norte",
                user_email: '{{ Auth::user()->email }}'
            }),
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
            success: function(data) {
                if (data.razonsocial) {
                    $('#razon_social').val(`${data.razonsocial}`);
                    $('#direccion').val(`${data.direccion}`);
                    guardarClienteRuc(data); // Solo guarda el cliente y deja que el flujo continúe
                } else {
                    Swal.fire('Advertencia', 'No se encontraron datos para el RUC proporcionado', 'warning');
                }
            },
            error: function() {
                Swal.fire('Error', 'Ocurrió un error al buscar el RUC en la API.', 'error');
            }
        });
    }

    function guardarClienteRuc(datosClienteRuc) {
        $.ajax({
            url: '{{ route("guardar.clienteruc") }}',
            method: 'POST',
            data: {
                ruc: $('#num_doc').val(),
                razonsocial: datosClienteRuc.razonsocial,
                direccion: datosClienteRuc.direccion,
                
            },
            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}',
            },
            success: function(response) {
                console.log('Respuesta del servidor:', response); // Depuración
                Swal.fire('Empresa RUC Nuevo Registrado', 'Se ha registrado Nueva empresa con éxito.', 'success');
                
            },
            error: function(xhr, status, error) {
                console.error('Error:', status, error);
                Swal.fire('Error', 'Ocurrió un error al guardar la empresa.', 'error');
            }
        });
    }
    function limpiarCampos() {
        document.getElementById('num_doc').value = '';
        document.getElementById('razon_social').value = '';
        document.getElementById('direccion').value = '';
    }

</script>
<script>
    document.getElementById('tipo_doc').addEventListener('change', function() {
    var tipoDoc = this.value;
    var inputDoc = document.getElementById('num_doc');

    // Resetear atributos
    inputDoc.value = "";
    inputDoc.removeAttribute("maxlength");
    inputDoc.removeAttribute("pattern");
    inputDoc.removeAttribute("placeholder");

    if (tipoDoc === "1") { // DNI: 8 dígitos, solo números
        inputDoc.setAttribute("maxlength", "8");
        inputDoc.setAttribute("pattern", "\\d{8}");
        inputDoc.setAttribute("title", "Debe ingresar 8 números.");
        inputDoc.setAttribute("placeholder", "8 dígitos");
    } else if (tipoDoc === "6") { // RUC: 11 dígitos, solo números
        inputDoc.setAttribute("maxlength", "11");
        inputDoc.setAttribute("pattern", "\\d{11}");
        inputDoc.setAttribute("title", "Debe ingresar 11 números.");
        inputDoc.setAttribute("placeholder", "11 dígitos");
    } else if (tipoDoc === "4") { // CEX: Hasta 20 caracteres, solo letras y números, sin espacios
        inputDoc.setAttribute("maxlength", "20");
        inputDoc.setAttribute("pattern", "[A-Za-z0-9]{1,20}");
        inputDoc.setAttribute("title", "Máximo 20 caracteres, sin espacios.");
        inputDoc.setAttribute("placeholder", "Hasta 20 caracteres");
    }else if (tipoDoc === "7") { // CEX: Hasta 20 caracteres, solo letras y números, sin espacios
        inputDoc.setAttribute("maxlength", "20");
        inputDoc.setAttribute("pattern", "[A-Za-z0-9]{1,20}");
        inputDoc.setAttribute("title", "Máximo 20 caracteres, sin espacios.");
        inputDoc.setAttribute("placeholder", "Hasta 20 caracteres");
    }
});

function buscarDocumento() {
    var tipoDoc = document.getElementById('tipo_doc').value;
    var numDoc = document.getElementById('num_doc').value.trim();
    console.log("tipoDoc",tipoDoc);
    console.log("numDoc",numDoc);
    if (numDoc === "") {
        Swal.fire({
            icon: "warning",
            title: "Campo vacío",
            text: "Debe ingresar un número de documento.",
        });
        return;
    }

    if (tipoDoc === "6" && numDoc.length === 11) { // RUC: Se llama directamente a buscarRuc()
        buscarRuc();
    } else if ((tipoDoc === "1" && numDoc.length === 8) || tipoDoc === "4" || tipoDoc === "7") { // DNI o CEX: Buscar primero en pacientes
        console.log("entrando a buscar paciente")
        $.ajax({
            url: "/buscar-paciente", // Ruta Laravel en lugar de un archivo PHP directo
            type: "POST",
            data: {
                tipo_documento: tipoDoc,
                numero_documento: numDoc,
                _token: $('meta[name="csrf-token"]').attr('content') // Agregar CSRF Token
            },
            success: function(response) {
                if (response.success) {
                    console.log("paciente encontrado")
                    var nombreCompleto = response.apellido_paterno + " " + response.apellido_materno + " " + response.nombres;
                    $('#razon_social').val(nombreCompleto);

                    
                } else if (tipoDoc === "1") { // Si no está en pacientes y es DNI, llamar buscarDNI()
                    buscarDNI();
                } else {
                    Swal.fire({
                        icon: "error",
                        title: "No encontrado",
                        text: "No se encontraron registros con este documento.",
                    });
                }
            },
            error: function() {
                Swal.fire({
                    icon: "error",
                    title: "Error de conexión",
                    text: "Hubo un problema al realizar la búsqueda.",
                });
            }
        });
    } else {
        Swal.fire({
            icon: "error",
            title: "Formato inválido",
            text: "El número de documento no tiene el formato correcto.",
        });
    }
}

function buscarDNI() {
        let dni = $('#num_doc').val().trim();
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
                        var nombreCompleto = data.ape_paterno + " " + data.ape_materno + " " + data.nombres;
                        $('#razon_social').val(nombreCompleto || '');
                        // Estructura los datos antes de enviarlos a la función
                        var datosClienteRUC = {
                            ruc: dni, // Guardar el DNI como RUC
                            razonsocial: nombreCompleto, // Razón social con el nombre completo
                            direccion: '-' // Dirección vacía
                        };
                        console.log("datosClienteRUC",);
                        guardarClienteRuc(datosClienteRUC); // Enviar datos a la función de guardado

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


    .text-end input#subtotal,
    .text-end input#igv,
    .text-end input#total {
        text-align: right; /* Alinea los valores dentro del input a la derecha */
        font-size: 16px; /* Tamaño de letra más pequeño */
        padding: 5px 10px; /* Reducir padding */
        //border-radius: 5px; /* Ajustar el borde redondeado */
        border: 1px solid #007bff; /* Cambiar color del borde */
        box-shadow: none; /* Quitar sombra */
    }

    .text-end input#subtotal:focus,
    .text-end input#igv:focus,
    .text-end input#total:focus {
        border-color: #0056b3; /* Color del borde al enfocar */
        box-shadow: 0 0 5px rgba(0, 86, 179, 0.5); /* Sombra al enfocar */
    }
        

    .col-md-6 {
        width: 100%; /* Asegura que cada campo ocupe toda la fila */
    }

    .form-group {
        width: 100%;
    }

    .card-header {
        background-color:rgb(145, 206, 159) !important; /* Verde claro */
        color: #155724; /* Verde oscuro para el texto */
        padding: 0.1rem 0.5rem; /* Reducir el alto */
    }

    .card-body {
        padding-top: 0rem;
        padding: 0.5rem; /* Reducir padding */
    }
    .card {
        border-color: #007bff;
    }

    .shadow-sm {
        box-shadow: 0 .125rem .25rem rgba(0, 0, 0, .075);
    }

    .row {
        margin-top: 0.5rem;
    }

    .datos-empresa {
        margin-top: 0.5rem;
    }

    .my-2 {
        margin-top: 0.25rem; /* Ajustar margen */
    }
    #procedimiento-list {
        height: 150px;
        overflow-y: auto;
        margin-bottom: 0; /* Eliminar margen inferior */
    }

    #observaciones {
        margin-top: 0; /* Eliminar margen superior */
    }

    .mt-2 {
        margin-top: 0 !important; /* Ajustar margen superior de la fila */
    }

</style>

@stop