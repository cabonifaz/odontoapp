@extends('adminlte::page')

@section('title', 'Bandeja SUNAT - Mundo System')
@section('content_header')
<div class="card mb-1">
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center">
            <h1 class="mb-0">Gestión de Documentos SUNAT</h1>
        </div>
    </div>
</div>
@stop


@section('content')
<div class="card">
    <div class="card-body">
         <!-- Filtro de Fechas -->
         <form id="filtro-form" class="mb-3" method="GET" action="{{ route('facturacion.bandejasunat') }}">
            <div class="row">
                <div class="col-md-4">
                    <label for="facturador_id">Empresa Facturador</label>
                    <select id="facturador_id" name="facturador_id" class="form-control" style="font-size: 14px; font-weight: bold; background-color: #ffeb3b;" onchange="actualizarRuc()">
                        <option value="" disabled {{ !$facturadorId ? 'selected' : '' }}>Seleccione una empresa</option>
                        @foreach ($facturadores as $facturador)
                            <option value="{{ $facturador->id }}" data-ruc="{{ $facturador->ruc }}" {{ $facturadorId == $facturador->id ? 'selected' : '' }}>
                                {{ $facturador->razon_social }}
                            </option>
                        @endforeach
                    </select>
                </div>
                <div class="col-md-2">
                    <label for="fecha_inicio">Fecha Inicio</label>
                    <input 
                        type="date" 
                        id="fecha_inicio" 
                        name="fecha_inicio" 
                        class="form-control" 
                        value="{{ $fechaInicio }}" 
                        required
                    >
                </div>
                <div class="col-md-2">
                    <label for="fecha_fin">Fecha Fin</label>
                    <input 
                        type="date" 
                        id="fecha_fin" 
                        name="fecha_fin" 
                        class="form-control" 
                        value="{{ $fechaFin }}" 
                        required
                    >
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-primary rounded-pill w-100">
                        <i class="fas fa-search"></i> Filtrar
                    </button>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button 
                        type="button" 
                        id="enviar-bloque" 
                        class="btn btn-success rounded-pill w-100">
                        <i class="fas fa-paper-plane"></i> Enviar a SUNAT
                    </button>
                </div>
            </div>
        </form>

        <div class="table-responsive">
            <!-- Tabla de Resultados -->
            <table id="boletosTable" class="table table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Fecha</th>
                        <th style="width: 100px;">Nro de Documento</th>
                        <th style="width: 180px;">Cliente</th>
                        <th class="text-end">Importe</th>
                        <th class="text-center">Medio de Pago</th>
                        <th class="text-center">Acciones</th>
                        <th class="text-center">Estado Sunat</th>
                        <th class="text-center">XML</th>
                        <th class="text-center">CDR</th>
                    </tr>
                </thead>
                <tbody id="tabla-boletos">
                    @foreach ($facturaciones as $index => $facturacion)
                        @php
                            $esNotaCredito = isset($facturacion->isNotaCredito) && $facturacion->isNotaCredito;
                            $nombreOMostrar = $facturacion->razon_social;
                           
                            // Determinar si es una fila anulada (Nota de Crédito o Comunicación de Baja)
                            $filaAnulada = $esNotaCredito || ($facturacion->baja == 1);
                        @endphp
                        <tr class="{{ $filaAnulada ? 'anulado' : '' }}">
                            <td>{{ $index + 1 }}</td>
                            <td>{{ \Carbon\Carbon::parse($esNotaCredito ? $facturacion->nota_credito->fecha : $facturacion->fecha)->format('d/m/Y H:i:s') }}</td>
                            <td>{{ $esNotaCredito ? $facturacion->nota_credito->serie . '-' . $facturacion->nota_credito->numdoc : $facturacion->serie . '-' . $facturacion->numdoc }}</td>
                            <td>{{ $nombreOMostrar }}</td>
                            <td class="text-end">{{ number_format($facturacion->importe, 2) }}</td>
                            <td class="text-center {{ $facturacion->baja == 1 ? '' : 'clickable-td' }}"
                                data-medio_pago="{{ $facturacion->medio_pago }}" 
                                data-facturacion_id="{{ $facturacion->id }}" 
                                data-facturacion_serie="{{ $facturacion->serie }}" 
                                data-facturacion_numdoc="{{ $facturacion->numdoc }}">
                                @if ($esNotaCredito)
                                    No Aplica
                                @else
                                    @switch($facturacion->medio_pago)
                                        @case(1)
                                            Efectivo
                                            @break
                                        @case(2)
                                            Tarjeta
                                            @break
                                        @case(3)
                                            Yape
                                            @break
                                        @case(4)
                                            Plin
                                            @break
                                        @case(5)
                                            Transferencia
                                            @break
                                        @default
                                            Desconocido
                                    @endswitch
                                @endif
                            </td>
                            <td class="text-center">
                                @if (!$esNotaCredito)
                                    <!-- Acciones para facturaciones -->
                                    @if ($facturacion->estado_sunat == 0)
                                        <div class="btn-group">
                                            <button class="btn btn-warning btn-sm btn-enviar custom-button" data-id="{{ $facturacion->id }}">
                                                <img src="/img/sunat.png" alt="XML" style="width: 20px; height: 20px;">
                                            </button>
                                        </div>
                                    @elseif ($facturacion->estado_sunat == 1 && $facturacion->baja == 0)
                                        <div class="btn-group">
                                            @php
                                                $fecha_cdr = new \DateTime($facturacion->fecha_cdr);
                                                $fecha_actual = new \DateTime();
                                                $interval = $fecha_cdr->diff($fecha_actual);
                                                $dias = $interval->days;
                                            @endphp

                                            @if ($dias <= 7)
                                                <button class="btn btn-danger btn-sm custom-button" data-toggle="tooltip" title="Anular Documento" onclick="confirmarAnulacion({{ $facturacion->id }})">
                                                    <i class="fas fa-times"></i>
                                                </button>
                                                <button class="btn btn-warning btn-sm custom-button ml-2" data-toggle="tooltip" title="Generar Nota de Crédito" onclick="mostrarModalNotaCredito('{{ $nombreOMostrar }}', '{{ $facturacion->ruc ?: $facturacion->dni }}', '{{ $facturacion->serie }}-{{ $facturacion->numdoc }}', '{{ \Carbon\Carbon::parse($facturacion->fecha)->format('d/m/Y') }}', '{{ $facturacion->id }}')">
                                                    <i class="fas fa-file-invoice"></i>
                                                </button>
                                            @else
                                                <button class="btn btn-warning btn-sm custom-button" data-toggle="tooltip" title="Generar Nota de Crédito" onclick="mostrarModalNotaCredito('{{ $nombreOMostrar }}', '{{ $facturacion->ruc ?: $facturacion->dni }}', '{{ $facturacion->serie }}-{{ $facturacion->numdoc }}', '{{ \Carbon\Carbon::parse($facturacion->fecha)->format('d/m/Y') }}', '{{ $facturacion->id }}')">
                                                    <i class="fas fa-file-invoice"></i>
                                                </button>
                                            @endif
                                           <!-- Botón para abrir el mensaje con las opciones -->
                                            <button class="btn btn-info btn-sm custom-button ml-2" data-toggle="tooltip" title="Generar PDF" onclick="mostrarMenuContextual({{ $facturacion->id }}, {{ $facturacion->facturador_id }}, '{{ $facturacion->email }}')">
                                                <img src="/img/pdf.png" alt="PDF" style="width: 20px; height: 20px;">
                                            </button>
                                        </div>
                                    @else
                                        <div class="btn-group">
                                            <!-- Botón para abrir el mensaje con las opciones -->
                                            <button class="btn btn-info btn-sm custom-button ml-2" data-toggle="tooltip" title="Generar PDF" onclick="mostrarMenuContextual({{ $facturacion->id }}, {{ $facturacion->facturador_id }}, '{{ $facturacion->email }}')">
                                                <img src="/img/pdf.png" alt="PDF" style="width: 20px; height: 20px;">
                                            </button>
                                        </div>
                                    @endif
                                @else
                                    <!-- Acciones para notas de crédito -->
                                    <button class="btn btn-info btn-sm custom-button" data-toggle="tooltip" title="Generar PDF" onclick="mostrarMenuNotaCredito({{ $facturacion->nota_credito->id }}, {{ $facturacion->nota_credito->facturador_id }}, '{{ $facturacion->email }}')">
                                        <img src="/img/pdf.png" alt="PDF" style="width: 20px; height: 20px;">
                                    </button>
                                @endif
                            </td>
                            <td class="text-center">
                                @if (!$esNotaCredito)
                                    @if ($facturacion->estado_sunat == 0)
                                        <button class="btn btn-warning btn-sm custom-button" data-toggle="tooltip" title="Pendiente de Envío">
                                            <i class="fa fa-clock"></i>
                                        </button>
                                    @elseif ($facturacion->estado_sunat == 1 && $facturacion->baja == 1 && !is_null($facturacion->ident))
                                        <button class="btn btn-danger btn-sm custom-button" data-toggle="tooltip" title="Documento Anulado con Comunicación de Baja">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    @elseif ($facturacion->estado_sunat == 1 && $facturacion->baja == 1 && is_null($facturacion->ident))
                                        <button class="btn btn-danger btn-sm custom-button" data-toggle="tooltip" title="Documento Anulado con Nota de Crédito">
                                            <i class="fa fa-times"></i>
                                        </button>
                                    @elseif ($facturacion->estado_sunat == 1 && $facturacion->baja == 2)
                                        <button class="btn btn-info btn-sm custom-button ml-2" data-toggle="tooltip" title="Se está procesando en Sunat" onclick="anularDocumento({{ $facturacion->id }})">
                                            <i class="fas fa-spinner fa-spin"></i>
                                        </button>
                                    @else
                                        <button class="btn btn-success btn-sm custom-button" data-toggle="tooltip" title="Documento Enviado a SUNAT con éxito">
                                            <i class="fa fa-check"></i>
                                        </button>
                                    @endif
                                @else
                                    <button class="btn btn-success btn-sm custom-button" data-toggle="tooltip" title="Documento Enviado a SUNAT con éxito">
                                        <i class="fa fa-check"></i>
                                    </button>
                                @endif    
                            </td>
                            <td class="text-center">
                                @if ($facturacion->estado_sunat == 1)
                                    <button class="btn btn-primary btn-sm custom-button" data-toggle="tooltip" title="Descargar XML"
                                        onclick="downloadXML(rucSeleccionado, '{{ $esNotaCredito ? $facturacion->nota_credito->tipodoc : $facturacion->tipodoc }}', '{{ $esNotaCredito ? $facturacion->nota_credito->serie : $facturacion->serie }}', '{{ $esNotaCredito ? $facturacion->nota_credito->numdoc : $facturacion->numdoc }}')">
                                        <img src="/img/xml.png" alt="XML" style="width: 20px; height: 20px;">
                                    </button>
                                @endif
                            </td>
                            <td class="text-center">
                                @if ($facturacion->estado_sunat == 1)
                                    <button class="btn btn-secondary btn-sm custom-button" data-toggle="tooltip" title="Descargar CDR" onclick="downloadCDR(rucSeleccionado, '{{ $esNotaCredito ? $facturacion->nota_credito->tipodoc : $facturacion->tipodoc }}', '{{ $esNotaCredito ? $facturacion->nota_credito->serie : $facturacion->serie }}', '{{ $esNotaCredito ? $facturacion->nota_credito->numdoc : $facturacion->numdoc }}')">
                                        <img src="/img/cdr.png" alt="CDR" style="width: 20px; height: 20px;">
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

<!-- Modal para Nota de Crédito -->
<div class="modal fade" id="modalNotaCredito" tabindex="-1" role="dialog" aria-labelledby="modalNotaCreditoLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalNotaCreditoLabel">Crear Nota de Crédito</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formNotaCredito">
                    <div class="form-group row">
                        <div class="col">
                            <label for="serie_nota">Serie de la Nota</label>
                            <input type="text" class="form-control" id="serie_nota" readonly>
                        </div>
                        <div class="col">
                            <label for="numdoc_nota">Correlativo de la Nota</label>
                            <input type="text" class="form-control" id="numdoc_nota" readonly>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="razonSocial">Nombre/Razón Social</label>
                        <input type="text" class="form-control" id="razonSocial" readonly>
                    </div>
                    <input type="hidden" id="rucDni"> <!-- RUC/DNI oculto -->
                    <input type="hidden" id="facturacion_id"> <!-- facturacion_id oculto -->
                    <div class="form-group row">
                        <div class="col">
                            <label for="serieCorrelativo">Nro de Comprobante Rel.</label>
                            <input type="text" class="form-control" id="serieCorrelativo" readonly>
                        </div>
                        <div class="col">
                            <label for="fechaEmision">Fecha Emisión DR</label>
                            <input type="text" class="form-control" id="fechaEmision" readonly>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col">
                            <label for="fechaActual">Fecha Emisión de la Nota</label>
                            <input type="text" class="form-control" id="fechaActual" readonly>
                        </div>
                        <div class="col">
                            <label for="motivo">Motivo</label>
                            <select class="form-control" id="motivo" style="font-size:14px;">
                                <option value="Anulación">Anulación</option>
                                <!-- Agrega otros motivos si es necesario -->
                            </select>
                        </div>
                    </div>
                    <button type="button" class="btn btn-primary" onclick="crearNotaCredito()">Generar y Enviar Nota</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal para enviar WhatsApp -->
<div class="modal fade" id="modalWhatsApp" tabindex="-1" role="dialog" aria-labelledby="modalWhatsAppLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalWhatsAppLabel">Enviar PDF</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formWhatsApp">
                    <div class="form-group">
                        <label for="numeroWhatsApp">Número de WhatsApp</label>
                        <input type="text" class="form-control" id="numeroWhatsApp" maxlength="9" placeholder="Opción no disponible" readonly>
                        <input type="hidden" class="form-control" id="factura_id">
                        <input type="hidden" class="form-control" id="facturador_id">
                    </div>
                    <div class="form-group">
                        <label for="email">Correo Electrónico</label>
                        <input type="email" class="form-control" id="email" placeholder="Ingrese correo electrónico">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="enviarPDF(document.getElementById('factura_id').value)">Enviar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal para enviar WhatsApp Nota -->
<div class="modal fade" id="modalWhatsAppNota" tabindex="-1" role="dialog" aria-labelledby="modalWhatsAppLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalWhatsAppLabel">Enviar PDF</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formWhatsAppNota">
                    <div class="form-group">
                        <label for="numeroWhatsAppNota">Número de WhatsApp</label>
                        <input type="text" class="form-control" id="numeroWhatsAppNota" maxlength="9" placeholder="Opción no disponible" readonly>
                        <input type="hidden" class="form-control" id="nota_id">
                        <input type="hidden" class="form-control" id="facturador_nota_id">
                    </div>
                    <div class="form-group">
                        <label for="emailNota">Correo Electrónico</label>
                        <input type="email" class="form-control" id="emailNota" placeholder="Ingrese correo electrónico">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="enviarPDFNotaCredito(document.getElementById('nota_id').value)">Enviar</button>
            </div>
        </div>
    </div>
</div>
<!-- Modal Actualizar medio de pago -->
<div class="modal fade" id="modalMedioPago" tabindex="-1" role="dialog" aria-labelledby="modalMedioPagoLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="modalMedioPagoLabel">Actualizar medio de pago</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="formMedioPago">
                    <div class="form-group">
                        <label id="numeroDocumentoLabel"></label> <!-- Etiqueta para el número de documento -->
                    </div>
                    <div class="form-group row">
                        <label for="medioPagoSelect" class="col-form-label col-sm-4">Medio de Pago</label>
                        <div class="col-sm-8">
                            <select class="form-control" id="medioPagoSelect" name="medio_pago" style="font-size: 14px;">
                                <option value="1">Efectivo</option>
                                <option value="2">Tarjeta</option>
                                <option value="3">Yape</option>
                                <option value="4">Plin</option>
                                <option value="5">Transferencia</option>
                            </select>
                        </div>
                    </div>
                    <input type="hidden" id="facturacion_id" name="facturacion_id">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary" onclick="actualizarMedioPago()">Guardar cambios</button>
            </div>
        </div>
    </div>
</div>

@endsection

@section('js')

    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.5/css/dataTables.bootstrap5.min.css">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.11.5/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <script>
        $(document).ready(function() {
            $('#boletosTable').DataTable({
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
    // Función para descargar el archivo XML
    function downloadXML(ruc, tipo, serie, correlativo) {
        const xmlUrl = `/sunat_files/xml/${ruc}-${tipo}-${serie}-${correlativo}.xml`;
        
        // Crear un enlace temporal para descargar el archivo
        const link = document.createElement('a');
        link.href = xmlUrl;
        link.download = `${ruc}-${tipo}-${serie}-${correlativo}.xml`;  // Nombre del archivo
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    // Función para descargar el archivo CDR
    function downloadCDR(ruc, tipo, serie, correlativo) {
        const cdrUrl = `/sunat_files/cdr/R-${ruc}-${tipo}-${serie}-${correlativo}.xml`;
        
        // Crear un enlace temporal para descargar el archivo
        const link = document.createElement('a');
        link.href = cdrUrl;
        link.download = `R-${ruc}-${tipo}-${serie}-${correlativo}.xml`;  // Nombre del archivo
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    }

    function generarPDF(id, facturadorId) {
        // URL para la ruta del controlador que maneja el PDF
        const url = `/generar-pdf-factura/${id}`;

        // Enviar una solicitud POST para visualizar el PDF
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ 
            view: true,
            facturadorId: facturadorId // Enviar el facturadorId en el cuerpo de la solicitud
            })
        })
        .then(response => response.blob())
        .then(blob => {
            // Crear una URL para el blob y abrirla en una nueva pestaña
            const newBlob = new Blob([blob], { type: "application/pdf" });
            const pdfUrl = URL.createObjectURL(newBlob);
            window.open(pdfUrl, '_blank');
        })
        .catch(error => console.error('Error al generar el PDF:', error));
    }

    function generarPDFNotaCredito(id, facturadorId) {
        // URL para la ruta del controlador que maneja el PDF
        const url = `/generar-pdf-notacredito/${id}`;

        // Enviar una solicitud POST para visualizar el PDF
        fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
            },
            body: JSON.stringify({ 
            view: true,
            facturadorId: facturadorId // Enviar el facturadorId en el cuerpo de la solicitud
            })
        })
        .then(response => response.blob())
        .then(blob => {
            // Crear una URL para el blob y abrirla en una nueva pestaña
            const newBlob = new Blob([blob], { type: "application/pdf" });
            const pdfUrl = URL.createObjectURL(newBlob);
            window.open(pdfUrl, '_blank');
        })
        .catch(error => console.error('Error al generar el PDF:', error));
    }

    function mostrarMenuContextual(id, facturadorId, email) {
        console.log("ID enviado", id);
        console.log("Email enviado", email);
        // Asignar el id al campo factura_id en el modal
        document.getElementById("factura_id").value = id;
        document.getElementById("facturador_id").value = facturadorId;
        document.getElementById("email").value = email;
        Swal.fire({
            title: "Confirmar acción a realizar",
            text: "Seleccione una opción:",
            icon: "info",
            showCancelButton: true,
            showDenyButton: true,
            confirmButtonText: "Ver PDF",
            denyButtonText: "Enviar PDF",
            cancelButtonText: "Cancelar",
            buttonsStyling: false,
            customClass: {
                confirmButton: 'btn btn-primary mx-1',
                denyButton: 'btn btn-success mx-1',
                cancelButton: 'btn btn-secondary mx-1'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const facturadorId = document.querySelector('#facturador_id').value; // Obtener facturadorId aquí
                generarPDF(id, facturadorId); // Pasar facturadorId a la función
            } else if (result.isDenied) {
                $('#modalWhatsApp').modal('show');
            } else {
                Swal.fire("Acción cancelada.");
            }
        });
    }

    function enviarPDF(id) { 
        const numeroWhatsApp = document.getElementById("numeroWhatsApp").value.trim();
        const email = document.getElementById("email").value.trim();
        const facturadorId = document.getElementById("facturador_id").value.trim();
        // Console log para ver el id que se está enviando
        console.log("ID enviado:", id);
        const esNumeroWhatsAppValido = /^[0-9]{9}$/.test(numeroWhatsApp);
        const esEmailValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

        if (esNumeroWhatsAppValido || esEmailValido) {
            //console.log("numeroWhatsApp", numeroWhatsApp);
            //console.log("email", email);

            fetch(`/generar-pdf-factura/${id}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({ numeroWhatsApp, email, facturadorId })
            })
            .then(response => response.json())
            .then(data => {
                Swal.fire("Éxito", data.message, "success");
                $('#modalWhatsApp').modal('hide');  // Aquí se cierra el modal
            })
            .catch(error => Swal.fire("Error", "No se pudo enviar la factura.", "error"));
        } else {
            Swal.fire("Error", "Ingrese un número de WhatsApp válido (9 dígitos) o un correo electrónico válido.", "error");
        }
    }

    // Función para mostrar el menú contextual de la nota de crédito
    function mostrarMenuNotaCredito(id, facturadorId, email) {
        document.getElementById("nota_id").value = id;
        document.getElementById("facturador_nota_id").value = facturadorId;
        document.getElementById("emailNota").value = email;
        Swal.fire({
            title: "Confirmar acción a realizar",
            text: "Seleccione una opción:",
            icon: "info",
            showCancelButton: true,
            showDenyButton: true,
            confirmButtonText: "Ver PDF",
            denyButtonText: "Enviar PDF",
            cancelButtonText: "Cancelar",
            buttonsStyling: false,
            customClass: {
                confirmButton: 'btn btn-primary mx-1',
                denyButton: 'btn btn-success mx-1',
                cancelButton: 'btn btn-secondary mx-1'
            }
        }).then((result) => {
            if (result.isConfirmed) {
                const facturadorId = document.querySelector('#facturador_id').value; // Obtener facturadorId aquí
                generarPDFNotaCredito(id, facturadorId);
            } else if (result.isDenied) {
                $('#modalWhatsAppNota').modal('show');
            } else {
                Swal.fire("Acción cancelada.");
            }
        });
    }
    function enviarPDFNotaCredito(id) {
        const numeroWhatsApp = document.getElementById("numeroWhatsAppNota").value.trim();
        const email = document.getElementById("emailNota").value.trim();
        const facturadorId = document.getElementById("facturador_nota_id").value.trim();

        const esNumeroWhatsAppValido = /^[0-9]{9}$/.test(numeroWhatsApp);
        const esEmailValido = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

        if (esNumeroWhatsAppValido || esEmailValido) {
            //console.log("numeroWhatsApp", numeroWhatsApp);
            //console.log("email", email);

            fetch(`/generar-pdf-notacredito/${id}`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({ numeroWhatsApp, email, facturadorId })
            })
            .then(response => response.json())
            .then(data => {
                Swal.fire("Éxito", data.message, "success");
                $('#modalWhatsAppNota').modal('hide');  // Aquí se cierra el modal
            })
            .catch(error => Swal.fire("Error", "No se pudo enviar la nota de crédito.", "error"));
        } else {
            Swal.fire("Error", "Ingrese un número de WhatsApp válido (9 dígitos) o un correo electrónico válido.", "error");
        }
    }

</script>
<script>
document.addEventListener('DOMContentLoaded', () => {
    const enviarBloqueBtn = document.querySelector('#enviar-bloque');
    const tablaBoletos = document.querySelector('#tabla-boletos');

    const actualizarEstadoBoton = () => {
        const registrosPendientes = Array.from(tablaBoletos.querySelectorAll('tr')).some(row => {
            return row.querySelector('td.text-center .btn-warning') !== null;
        });

        enviarBloqueBtn.disabled = !registrosPendientes;
    };

    actualizarEstadoBoton();

    enviarBloqueBtn.addEventListener('click', () => {
        const boletosPendientes = [];
        const facturadorId = document.querySelector('#facturador_id').value
        console.log("facturadorId", facturadorId);
        tablaBoletos.querySelectorAll('tr').forEach(row => {
            const estadoSunat = row.querySelector('td.text-center .btn-warning');
            const boletoId = row.querySelector('.btn-enviar')?.getAttribute('data-id');

            if (estadoSunat && boletoId) {
                boletosPendientes.push(boletoId);
            }
        });

        if (boletosPendientes.length === 0) {
            Swal.fire('Información', 'No hay documentos pendientes para enviar.', 'info');
            return;
        }

        Swal.fire({
            title: 'Enviando Documentos',
            html: `Procesando <b>1</b> de <b>${boletosPendientes.length}</b> documentos.`,
            allowOutsideClick: false,
            didOpen: () => {
                Swal.showLoading();
                let enviados = 0;

                const enviarDocumento = (index) => {
                    if (index >= boletosPendientes.length) {
                        Swal.fire({
                            title: 'Proceso Finalizado',
                            text: `Se enviaron ${enviados} documentos a Sunat.`,
                            icon: 'success'
                        }).then(() => {
                            localStorage.setItem('dispararFiltrar', 'true');
                            location.reload();
                        });
                        return;
                    }

                    const boletoId = boletosPendientes[index];

                    fetch(`/sunat/generarXML/${boletoId}?tipo=normal`, {
                        method: 'POST',
                        headers: {
                            'Content-Type': 'application/json',
                            'Accept': 'application/json',
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                        },
                        body: JSON.stringify({ boletoId, facturadorId }) // Incluye facturadorId en el cuerpo
                    })
                    .then(response => response.json())
                    .then(data => {
                        console.log(`Respuesta de Sunat para boleto ${boletoId}:`, data);

                        if (data.success === true) {
                            enviados++;
                        } else {
                            console.warn(`Error al enviar el boleto ${boletoId}: ${data.message}`);
                        }

                        Swal.update({
                            html: `Procesando <b>${index + 1}</b> de <b>${boletosPendientes.length}</b> documentos.`
                        });

                        enviarDocumento(index + 1);
                    })
                    .catch(error => {
                        console.error(`Error en la solicitud para boleto ${boletoId}:`, error);
                        enviarDocumento(index + 1);
                    });
                };

                enviarDocumento(0);
            }
        });
    });

    const observer = new MutationObserver(actualizarEstadoBoton);
    observer.observe(tablaBoletos, { childList: true, subtree: true });
});

function confirmarAnulacion(boletoId) {
    Swal.fire({
        title: '¿Estás seguro?',
        text: 'Esta acción anulará el documento.',
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#3085d6',
        confirmButtonText: 'Sí, anular',
        cancelButtonText: 'Cancelar'
    }).then((result) => {
        if (result.isConfirmed) {
            anularDocumento(boletoId);
        }
    });
}

function anularDocumento(boletoId) {
    // Obtener el facturador_id desde el select
    const facturadorId = document.querySelector('#facturador_id').value
    // Mostrar una alerta de carga
    Swal.fire({
        title: 'Procesando...',
        text: 'Por favor espera mientras se procesa la solicitud.',
        icon: 'info',
        allowOutsideClick: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    fetch(`/sunat/generarXML/${boletoId}?tipo=baja`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ boletoId, facturadorId })
    })
    .then(response => response.json())
    .then(data => {
        console.log(`Respuesta de Sunat para boleto ${boletoId}:`, data);

        // Cerrar la alerta de carga
        Swal.close();

        if (data.success === true) {
            Swal.fire('Éxito', 'El documento ha sido anulado correctamente.', 'success');
            location.reload();
        } else {
            Swal.fire('Error', `Hubo un problema al anular el documento: ${data.message}`, 'error');
        }
    })
    .catch(error => {
        console.error(`Error en la solicitud para boleto ${boletoId}:`, error);
        
        // Cerrar la alerta de carga
        Swal.close();

        Swal.fire('Error', 'Hubo un problema al anular el documento.', 'error');
    });
}

function crearNotaCredito() {
    const facturacionId = document.getElementById('facturacion_id').value;
    const facturadorId = document.getElementById('facturador_id').value;
    const serieNota = document.getElementById('serie_nota').value;
    const numdocNota = document.getElementById('numdoc_nota').value;
    const fechaActual = document.getElementById('fechaActual').value;
    const motivo = document.getElementById('motivo').value;

    // Mostrar un Swal con el mensaje "Procesando"
    Swal.fire({
        title: 'Procesando',
        text: 'Guardando y enviando la Nota de Crédito...',
        allowOutsideClick: false,
        showConfirmButton: false,
        didOpen: () => {
            Swal.showLoading();
        }
    });

    // Guardar la nota de crédito antes de generar el XML
    fetch('/nota-credito/guardar', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({
            facturacionId,
            serieNota,
            numdocNota,
            fechaActual,
            motivo,
            facturadorId
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success === true) {
            // Obtener el facturador_id desde el select
            const facturadorId = document.querySelector('#facturador_id').value;
            // Generar el XML
            fetch(`/sunat/generarXML/${facturacionId}?tipo=nota`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    facturacionId,
                    serieNota,
                    numdocNota,
                    fechaActual,
                    motivo,
                    facturadorId
                })
            })
            .then(response => response.json())
            .then(data => {
                console.log(`Respuesta de Sunat para documento ${facturacionId}:`, data);

                if (data.success === true) {
                    Swal.fire('Éxito', 'Nota de Crédito creada y enviada a SUNAT con éxito.', 'success');
                    location.reload();
                } else {
                    Swal.fire('Error', `Hubo un problema al enviar el documento: ${data.message}`, 'error');
                }
                $('#modalNotaCredito').modal('hide');
            })
            .catch(error => {
                console.error(`Error en la solicitud para documento ${facturacionId}:`, error);
                Swal.fire('Error', 'Hubo un problema al enviar el documento.', 'error');
                $('#modalNotaCredito').modal('hide');
            });
        } else {
            Swal.fire('Error', `Hubo un problema al guardar la nota de crédito: ${data.message}`, 'error');
            $('#modalNotaCredito').modal('hide');
        }
    })
    .catch(error => {
        console.error(`Error en la solicitud para guardar la nota de crédito: ${error}`);
        Swal.fire('Error', 'Hubo un problema al guardar la nota de crédito.', 'error');
        $('#modalNotaCredito').modal('hide');
    });
}

</script>
<script>
function mostrarModalNotaCredito(razonSocial, rucDni, serieCorrelativo, fechaEmision, facturacionId) {
    // Establecer los datos en el formulario del modal
    document.getElementById('razonSocial').value = razonSocial;
    document.getElementById('rucDni').value = rucDni;
    document.getElementById('serieCorrelativo').value = serieCorrelativo;
    document.getElementById('fechaEmision').value = fechaEmision;
    document.getElementById('facturacion_id').value = facturacionId;

    const currentDate = new Date();
    const day = String(currentDate.getDate()).padStart(2, '0'); // Obtener el día y agregar 0 si es necesario
    const month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Los meses en JavaScript son 0-11, así que se suma 1
    const year = currentDate.getFullYear();

    const formattedDate = `${day}/${month}/${year}`; // Formatear la fecha como d/m/y
    document.getElementById('fechaActual').value = formattedDate; // Asignar la fecha formateada al campo

    // Determinar la serie completa basada en el prefijo
    let serieNota = 'FC01';
    if (serieCorrelativo.startsWith('B001')) {
        serieNota = 'BC01';
    } else if (serieCorrelativo.startsWith('B002')) {
        serieNota = 'BC02';
    }

    // Obtener el siguiente correlativo para numdoc
    const facturadorId = document.querySelector('#facturador_id').value; // Obtener el facturador_id

    fetch(`/nota-credito/correlativo?serie=${serieNota}&facturador_id=${facturadorId}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('serie_nota').value = data.serie;
            document.getElementById('numdoc_nota').value = data.numdoc;
        })
        .catch(error => {
            console.error('Error al obtener el siguiente correlativo:', error);
        });

    // Mostrar el modal
    $('#modalNotaCredito').modal('show');
}

</script>
<script>
    $(document).ready(function () {
        // Asignar evento de clic al <td> con clase clickable-td
        $('td.clickable-td').on('click', function () {
            var td = $(this); // El elemento <td> que fue clicado
            var medioPago = td.data('medio_pago'); // Extraer información de los datos
            var facturacionId = td.data('facturacion_id');
            var facturacionSerie = td.data('facturacion_serie');
            var facturacionNumdoc = td.data('facturacion_numdoc');

            // Asignar a la variable ndoc los valores separados por un guion
            var ndoc = facturacionSerie + '-' + facturacionNumdoc;

            // Obtener el modal y pasarle los datos
            var modal = $('#modalMedioPago');
            modal.find('.modal-title').text('Actualizar medio de pago para el documento');
            modal.find('#numeroDocumentoLabel').text('Número de Documento: ' + ndoc); // Mostrar número de documento
            modal.find('#medioPagoSelect').val(medioPago); // Seleccionar el medio de pago actual
            modal.find('#facturacion_id').val(facturacionId); // Guardar el facturacion_id

            // Mostrar el modal
            modal.modal('show');
        });

        // Función para actualizar el medio de pago
        
        window.actualizarMedioPago = function () {
            var form = $('#formMedioPago');
            var medioPago = form.find('#medioPagoSelect').val();
            var facturacionId = form.find('#facturacion_id').val();

            // Enviar los datos al servidor con Ajax
            $.ajax({
                url: '/actualizar-medio-pago',
                method: 'POST',
                data: {
                    _token: $('meta[name="csrf-token"]').attr('content'),
                    facturacion_id: facturacionId,
                    medio_pago: medioPago
                },
                success: function (response) {
                    if (response.success) {
                        Swal.fire({
                            title: 'Éxito',
                            text: 'Medio de pago actualizado correctamente.',
                            icon: 'success'
                        }).then(() => {
                            location.reload();
                        });
                    } else {
                        Swal.fire({
                            title: 'Error',
                            text: 'Error al actualizar el medio de pago: ' + response.message,
                            icon: 'error'
                        });
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error al actualizar el medio de pago:', error);
                    Swal.fire({
                        title: 'Error',
                        text: 'Error al actualizar el medio de pago.',
                        icon: 'error'
                    });
                }
            });
        }
    });
</script>
<script>
    // Declarar la variable globalmente
    let rucSeleccionado = '';

    // Función para actualizar el valor de rucSeleccionado
    function actualizarRuc() {
        const select = document.getElementById('facturador_id'); // Obtener el select
        const selectedOption = select.options[select.selectedIndex]; // Obtener la opción seleccionada
        rucSeleccionado = selectedOption.getAttribute('data-ruc'); // Obtener el valor del atributo data-ruc

        //console.log('RUC seleccionado:', rucSeleccionado); // Mostrar en consola para verificar
    }

    // Ejecutar la función al cargar la página por si ya hay una selección
    document.addEventListener('DOMContentLoaded', () => {
        actualizarRuc(); // Inicializar el valor de rucSeleccionado
    });
</script>

@endsection

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

    .text-end {
        text-align: right !important;
    }
    .text-center {
        text-align: center !important;
    }
    .dataTables_length select {
            border-radius: 50px;
            padding: 5px 5px;
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

    .custom-button {
        width: 35px; /* Ajusta el ancho según tus necesidades */
        height: 30px; /* Ajusta la altura según tus necesidades */
        padding: 0; /* Asegúrate de que no haya relleno adicional */
    }
    .custom-button img {
        width: 20px; /* Ajusta el tamaño del ícono según tus necesidades */
        height: 20px; /* Ajusta el tamaño del ícono según tus necesidades */
    }
    #menu-contextual {
        display: none;
        position: absolute;
        z-index: 1000;
    }
    td.clickable-td {
        position: relative;
        cursor: pointer;
        color: #007bff; /* Color de texto base resaltante (azul) */
        font-weight: bold; /* Opcional: hacer el texto más llamativo */
        transition: color 0.3s ease; /* Suavizar la transición del color */
    }

    td.clickable-td:hover {
        color: #ff5733; /* Cambiar el color del texto al pasar el mouse (naranja) */
    }

    td.clickable-td::after {
        content: '✏️'; /* Ícono de edición */
        position: absolute;
        top: 50%;
        right: 10px;
        transform: translateY(-50%);
        font-size: 0.9rem;
        color: #aaa;
        opacity: 0;
        transition: opacity 0.3s ease, color 0.3s ease; /* Suavizar el cambio de opacidad y color */
    }

    td.clickable-td:hover::after {
        opacity: 1; /* Mostrar el ícono al hacer hover */
        color: #ff5733; /* Cambiar el color del ícono junto con el texto */
    }
    .anulado {
        color: red; /* El texto de las filas anuladas será rojo */
        
    }

    .text-danger {
        font-weight: bold; /* Resalta el texto anulado */
    }
    #boletosTable tbody td,
    #boletosTable thead th {
        font-size: 0.85rem; /* Tamaño de letra reducido */
        padding-top: 4px;
        padding-bottom: 4px;
        line-height: 1.2;
    }
</style>
@stop
