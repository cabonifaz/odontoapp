@extends('adminlte::page')

@section('title', 'Historia Clínica')

@section('content')
<div class="card shadow">
    <div class="card-body">
        <div class="row align-items-center mb-4">
            <!-- 🩺 Título -->
            <div class="col-md-3 mb-2 mb-md-0">
                <h1 class="mb-0" style="font-size: 1.8rem;">Historia Clínica</h1>
            </div>

            <!-- 🧑‍⚕️ Label + input + botón (en línea) -->
            <div class="col-md-6">
                <div class="d-flex align-items-center">
                    <label for="buscar_paciente" class="form-label me-2 mb-0">Paciente</label>
                    <input type="text" id="buscar_paciente" class="form-control rounded-pill me-2" placeholder="Nombre, DNI ó Historia" autocomplete="off">
                    <button class="btn btn-primary rounded-pill" id="btnBuscar">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
                <ul id="resultados-busqueda" class="resultados-busqueda" style="display: none;"></ul>
            </div>

            <!-- ➕ Botón registrar historia -->
            <div class="col-md-3 text-md-end mt-3 mt-md-0">
                <a href="#" class="btn btn-success" id="btnRegistrarHistoria" style="display: none;">
                    📝 Registrar Historia
                </a>
            </div>
        </div>

        <!-- 🗂️ Selector de versiones (solo aparece si hay historia) -->
        <div class="card mt-0 mb-3 shadow-sm" id="selectorVersiones" style="display: none;">
            <div class="card-body p-3">
                <div class="d-flex flex-row align-items-center justify-content-between">
                    
                    <!-- Bloque: Selector de versiones -->
                    <div class="d-flex align-items-center gap-2">
                        <label for="selectVersion" class="mb-0">🗂️ <strong>Ver otra versión:</strong></label>
                        <select class="form-control w-auto" id="selectVersion" style="min-width: 200px;"></select>
                    </div>
                    
                    <!-- Bloque: Botón impresión al extremo derecho -->
                    <button id="btnImprimirHistoria" class="btn btn-outline-dark rounded-circle"
                        title="Imprimir Historia" style="font-size: 1.8rem; line-height: 1;">
                        🖨️
                    </button>
                </div>
            </div>
        </div>

        <!-- TABS -->
        <div id="tabsHistoriaContainer" style="display: block;"> {{-- SIEMPRE visible --}}
            <ul class="nav nav-tabs mt-4" id="tabsHistoria" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#tab-paciente" role="tab">🧑‍⚕️ Datos del Paciente</a>
                </li>
                <li class="nav-item" id="tab-enfermedades-item" style="display:none;">
                    <a class="nav-link" data-toggle="tab" href="#tab-enfermedades" role="tab">🩺 Enfermedades</a>
                </li>
                <li class="nav-item" id="tab-clinico-item" style="display:none;">
                    <a class="nav-link" data-toggle="tab" href="#tab-clinico" role="tab">📋 Antecedentes Médicos</a>
                </li>
                <li class="nav-item" id="tab-dental-item" style="display:none;">
                    <a class="nav-link" data-toggle="tab" href="#tab-dental" role="tab">🦷 Datos Dentales</a>
                </li>
                <li class="nav-item" id="tab-citas-item" style="display:none;">
                    <a class="nav-link" data-toggle="tab" href="#tab-citas" role="tab">📅 Citas</a>
                </li>
                <li class="nav-item" id="tab-odontograma-item" style="display:none;">
                    <a class="nav-link" data-toggle="tab" href="#tab-odontograma" role="tab">🦷 Odontograma</a>
                </li>
                <li class="nav-item" id="tab-evolucion-item" style="display: none;">
                    <a class="nav-link" data-toggle="tab" href="#tab-evolucion" role="tab">📘 Ficha de Evolución</a>
                </li>
            </ul>

            <div class="tab-content p-3 border border-top-0" id="tabContent">
                {{-- Tab paciente (siempre visible) --}}
                <div class="tab-pane fade show active" id="tab-paciente" role="tabpanel">
                    <div class="table-responsive">
                        {{-- tabla de datos del paciente aquí --}}
                        <table class="table table-striped table-bordered">
                            <tbody>
                                <tr>
                                    <td><strong>Nombres Completos:</strong></td>
                                    <td colspan="6"><span id="dp_nombres"></span> <span id="dp_ape_paterno"></span> <span id="dp_ape_materno"></span></td>
                                </tr>
                                <tr>
                                    <td><strong>Tipo Documento:</strong></td>
                                    <td><span id="dp_tipo_documento"></span></td>
                                    <td><strong>Número:</strong></td>
                                    <td><span id="dp_dni"></span></td>
                                    <td><strong>Historia:</strong></td>
                                    <td><span id="dp_historia"></span></td>
                                </tr>
                                <tr>
                                    <td><strong>Fecha Nac.:</strong></td>
                                    <td><span id="dp_fecha_nacimiento"></span></td>
                                    <td><strong>Edad:</strong></td>
                                    <td><span id="dp_edad"></span></td>
                                    <td><strong>Teléfono:</strong></td>
                                    <td><span id="dp_telefono"></span></td>
                                </tr>
                                <tr>
                                    <td><strong>Profesión/Ocupación:</strong></td>
                                    <td><span id="dp_profesion"></span></td>
                                    <td><strong>Sexo:</strong></td>
                                    <td><span id="dp_sexo"></span></td>
                                    <td><strong>Estado Civil:</strong></td>
                                    <td><span id="dp_estado"></span></td>
                                </tr>
                                <tr>
                                    <td><strong>Dirección:</strong></td>
                                    <td><span id="dp_direccion"></span></td>
                                    <td><strong>Nacionalidad:</strong></td>
                                    <td><span id="dp_nacionalidad"></span></td>
                                    <td><strong>País Procedencia:</strong></td>
                                    <td><span id="dp_pais"></span></td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
                {{-- Tabs de historia (se muestran dinámicamente) --}}
                <div class="tab-pane fade" id="tab-enfermedades" role="tabpanel">
                    <p><strong>Versión:</strong> <span class="version_historia"></span> |
                    <strong>Fecha:</strong> <span class="fecha_historia"></span></p>
                    <ul id="lista-enfermedades" class="list-group list-group-flush"></ul>
                </div>

                <div class="tab-pane fade" id="tab-clinico" role="tabpanel">
                    <p><strong>Versión:</strong> <span class="version_historia"></span> |
                    <strong>Fecha:</strong> <span class="fecha_historia"></span></p>
                    <div class="row" id="datos-generales"></div>
                </div>

                <div class="tab-pane fade" id="tab-dental" role="tabpanel">
                    <p><strong>Versión:</strong> <span class="version_historia"></span> |
                    <strong>Fecha:</strong> <span class="fecha_historia"></span></p>
                    <div class="row" id="datos-dentales"></div>
                </div>
                <div class="tab-pane fade" id="tab-citas" role="tabpanel">
                    <p>
                        <strong>Versión:</strong> <span class="version_historia"></span> |
                        <strong>Fecha:</strong> <span class="fecha_historia"></span>
                    </p>
                    <div class="citas-scroll">
                        <ul id="lista-citas" class="list-group list-group-flush"></ul>
                    </div>
                </div>

                <div class="tab-pane fade" id="tab-odontograma" role="tabpanel">
                    <p>
                        <strong>Versión:</strong> <span class="version_historia"></span> |
                        <strong>Fecha:</strong> <span class="fecha_historia"></span>
                    </p>

                    @include('partials.odontograma_show') {{-- Aquí cargamos el partial con el odontograma --}}
                </div>
                <div class="tab-pane fade" id="tab-evolucion" role="tabpanel">
                    <p>
                        <strong>Versión:</strong> <span class="version_historia"></span> |
                        <strong>Fecha:</strong> <span class="fecha_historia"></span>
                    </p>

                    <div class="evolucion-scroll">
                        <ul id="lista-evolucion" class="list-group list-group-flush">
                            <li class="list-group-item bg-light font-weight-bold d-flex">
                                <span class="col-3 d-flex align-items-center gap-1"><span>🗓️</span><span>Fecha</span></span>
                                <span class="col-4 d-flex align-items-center gap-1"><span>💊</span><span>Tratamiento</span></span>
                                <span class="col-5 d-flex align-items-center gap-1"><span>📆</span><span>Próxima Cita</span></span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@section('css')
<style>
    .table { font-size: 16px; }
    .nav-tabs .nav-link { font-weight: bold; }
    #datos-generales div, #datos-dentales div {
        background: #fff;
        border: 1px solid #ddd;
        padding: 8px;
        border-radius: 4px;
    }
    .custom-tabs .nav-link {
        border: none;
        color: #555;
        font-weight: 600;
        background-color: #f8f9fa;
        margin-right: 5px;
        border-radius: 5px 5px 0 0;
    }

    .custom-tabs .nav-link.active {
        background-color: #0d6efd;
        color: white;
    }

    .tab-content {
        background-color: #ffffff;
        border-radius: 0 5px 5px 5px;
        border: 1px solid #dee2e6;
    }
    .gap-2 {
        gap: 0.5rem;
    }
    #selectVersion {
        padding: 8px 12px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 6px;
        background-color: #f9f9f9;
        color: #333;
        transition: all 0.3s ease;
        cursor: pointer;
    }

    #selectVersion:hover {
        background-color: #eaeaea;
        border-color: #888;
    }

    #selectVersion:focus {
        outline: none;
        box-shadow: 0 0 5px rgba(100, 150, 250, 0.5);
        border-color: #6496fa;
    }
    .citas-scroll {
        max-height: 250px;
        overflow-y: auto;
        border: 1px solid #ccc;
        border-radius: 5px;
    }
    #lista-citas .list-group-item {
        border: none;
        padding: 10px 15px;
        border-bottom: 1px solid #eee;
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
    .evolucion-scroll {
        max-height: 250px;
        overflow-y: auto;
        border: 1px solid #dee2e6;
        border-radius: 4px;
        margin-top: 10px;
    }
    #lista-evolucion li .col-3,
    #lista-evolucion li .col-4,
    #lista-evolucion li .col-5 {
        padding-left: 8px;
    }




</style>
@endsection

@section('js')
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
    document.getElementById('btnBuscar').addEventListener('click', function () {
        const query = document.getElementById('buscar_paciente').value.trim();
        if (!query) {
            Swal.fire('Atención', 'Ingrese un dato para buscar.', 'warning');
            return;
        }

        limpiarHistoria(); // Limpia historia anterior

        fetch(`/buscar-paciente?query=${query}`)
            .then(response => response.json())
            .then(data => {
                if (!data.success) {
                    Swal.fire('Error', data.message, 'error');
                    return;
                }

                const paciente = data.paciente;
                 // ✅ Asignar paciente_id globalmente para otras funciones
                window.pacienteSeleccionadoId = paciente.id;

                mostrarDatosPaciente(paciente);

                // Mostrar contenedor de pestañas y activar tab de paciente
                document.getElementById('tabsHistoriaContainer').style.display = 'block';
                activarTabPaciente();

                // Consultar historia clínica
                fetch(`/historia-clinica/${paciente.id}/json`)
                    .then(res => res.json())
                    .then(historia => {
                        if (historia.existe) {
                            limpiarOdontograma(); // 🔹 Limpia el SVG del odontograma anterior
                            mostrarHistoria(historia);
                            } else {
            // Mostrar botón si no tiene historia clínica
            document.getElementById('btnRegistrarHistoria').style.display = 'block';
        
                        }
                    });
            });
    });

    // ✅ Mostrar datos personales del paciente
    function mostrarDatosPaciente(p) {-
        asignarTexto('dp_nombres', p.nombres);
        asignarTexto('dp_ape_paterno', p.ape_paterno);
        asignarTexto('dp_ape_materno', p.ape_materno);
        asignarTexto('dp_tipo_documento', p.tipodocumento == '1' ? 'DNI' : (p.tipodocumento == '4' ? 'CEX' : 'Otro'));
        asignarTexto('dp_dni', p.numerodoc);
        asignarTexto('dp_historia', p.historia);
        
        let fechaObj = new Date(p.fecha_nacimiento + "T00:00:00Z"); 
        let fechaFormateada = `${fechaObj.getUTCDate().toString().padStart(2, '0')}/${(fechaObj.getUTCMonth() + 1).toString().padStart(2, '0')}/${fechaObj.getUTCFullYear()}`;

        asignarTexto('dp_fecha_nacimiento', fechaFormateada);
        
        asignarTexto('dp_edad', calcularEdad(p.fecha_nacimiento));
        asignarTexto('dp_telefono', p.telefono);
        asignarTexto('dp_profesion', p.profesion);
        asignarTexto('dp_direccion', p.direccion);
        asignarTexto('dp_nacionalidad', p.nacionalidad == 1 ? "Peruano" : p.nacionalidad == 2 ? "Extranjero" : "Desconocido");
        asignarTexto('dp_estado', [undefined, "Soltero", "Casado", "Divorciado", "Viudo"][p.cod_estciv] || "Desconocido");
        asignarTexto('dp_sexo', p.sexo == 1 ? "Masculino" : p.sexo == 2 ? "Femenino" : "No especificado");
        asignarTexto('dp_pais', p.pais_procedencia);
        //document.getElementById('nombrePaciente').textContent = `${p.nombres} ${p.ape_paterno} ${p.ape_materno}`;
        // Obtener el botón
        let btnRegistrarHistoria = document.getElementById('btnRegistrarHistoria');

        // Asegurar que el botón siempre sea visible
        btnRegistrarHistoria.style.display = "block"; 

        // Asignar el enlace de creación de historia clínica
        btnRegistrarHistoria.href = `/historia-clinica/${p.id}/create?nombre=${encodeURIComponent(p.nombres)}&historia=${encodeURIComponent(p.historia)}`;
        // Botón para crear historia
        //document.getElementById('btnRegistrarHistoria').href = `/historia-clinica/${p.id}/create?nombre=${encodeURIComponent(p.nombres)}&historia=${encodeURIComponent(p.historia)}`;
    }

    // ✅ Activar siempre el tab Datos del Paciente
    function activarTabPaciente() {
        document.querySelectorAll('#tabsHistoria .nav-link').forEach(el => el.classList.remove('active'));
        document.querySelectorAll('.tab-pane').forEach(el => el.classList.remove('show', 'active'));
        document.querySelector('#tabsHistoria .nav-link[href="#tab-paciente"]').classList.add('active');
        document.getElementById('tab-paciente').classList.add('show', 'active');
    }

    // ✅ Mostrar historia clínica y pestañas extra si existen
    function mostrarHistoria(historia) {
        document.getElementById('tab-enfermedades-item').style.display = 'block';
        document.getElementById('tab-clinico-item').style.display = 'block';
        document.getElementById('tab-dental-item').style.display = 'block';
        
        document.getElementById('tab-odontograma-item').style.display = 'block'; // ← Asegúrate de tener esto

        document.getElementById('tabsHistoriaContainer').style.display = 'block';
        document.getElementById('selectorVersiones').style.display = 'block';

        actualizarVersionFecha(historia.clinica.version, historia.clinica.fecha_registro);
        mostrarEnfermedades(historia.enfermedades || [], historia.clinica.obser_enfermedades);
        renderizarDatos(historia.clinica, 'datos-generales', camposGenerales);
        renderizarDatos(historia.clinica, 'datos-dentales', camposDentales);
        cargarSelectorVersiones(historia.versiones || []);
        if (historia.hallazgos && historia.hallazgos.length > 0) {
            window.hallazgosFromBackend = historia.hallazgos || [];
            renderizarHallazgosOdontograma(historia.hallazgos);
        } else {
            document.getElementById('tab-odontograma-item').style.display = 'none';
            limpiarOdontograma();
        }
        if (historia.citas && historia.citas.length > 0) {
            document.getElementById('tab-citas-item').style.display = 'block';
            mostrarCitas(historia.citas); // ✅ usa la función que definiste correctamente
        } else {
            document.getElementById('tab-citas-item').style.display = 'none';
            document.getElementById('lista-citas').innerHTML = '';
        }
        // Mostrar tab Ficha de Evolución si hay próximas citas
        if (historia.evolucion && historia.evolucion.length > 0) {
            document.getElementById('tab-evolucion-item').style.display = 'block';
            const listaEvolucion = document.getElementById('lista-evolucion');

            // Encabezado con emojis y texto alineado perfectamente
            listaEvolucion.innerHTML = `
                <li class="list-group-item bg-light font-weight-bold">
                    <div class="d-flex">
                        <div class="col-3 d-flex align-items-start">
                            <span class="me-2">🗓️</span>
                            <div><strong>Fecha</strong></div>
                        </div>
                        <div class="col-4 d-flex align-items-start">
                            <span class="me-2">💊</span>
                            <div><strong>Tratamiento</strong></div>
                        </div>
                        <div class="col-5 d-flex align-items-start">
                            <span class="me-2">📆</span>
                            <div><strong>Próxima Cita</strong></div>
                        </div>
                    </div>
                </li>
            `;

            historia.evolucion.forEach(evo => {
                const li = document.createElement('li');
                li.classList.add('list-group-item');

                let fechaFormateada = '-';
                if (evo.fecha_historia) {
                    const fecha = new Date(evo.fecha_historia);
                    fechaFormateada = `${fecha.getDate().toString().padStart(2, '0')}/${(fecha.getMonth() + 1).toString().padStart(2, '0')}/${fecha.getFullYear()}`;
                }

                let proximaCitaFormateada = '-';
                if (evo.fecha_cita && evo.hora_inicio) {
                    const fecha = new Date(evo.fecha_cita);
                    const [hh, mm] = evo.hora_inicio.split(':');
                    proximaCitaFormateada = `${fecha.getDate().toString().padStart(2, '0')}/${(fecha.getMonth() + 1).toString().padStart(2, '0')}/${fecha.getFullYear()} ${hh}:${mm}`;
                }

                li.innerHTML = `
                    <div class="d-flex">
                        <div class="col-3 text-start">${fechaFormateada}</div>
                        <div class="col-4 text-start">${evo.tratamiento || '-'}</div>
                        <div class="col-5 text-start">${proximaCitaFormateada}</div>
                    </div>
                `;

                listaEvolucion.appendChild(li);
            });
        } else {
            document.getElementById('tab-evolucion-item').style.display = 'none';
            document.getElementById('lista-evolucion').innerHTML = '';
        }

    }

    // ✅ Limpiar datos anteriores
    function limpiarHistoria() {
        ['tab-enfermedades-item', 'tab-clinico-item', 'tab-dental-item'].forEach(id => {
            const el = document.getElementById(id);
            if (el) el.style.display = 'none';
        });

        document.getElementById('selectorVersiones').style.display = 'none';
        document.getElementById('tabsHistoriaContainer').style.display = 'none';
        document.getElementById('lista-enfermedades').innerHTML = '';
        document.getElementById('datos-generales').innerHTML = '';
        document.getElementById('datos-dentales').innerHTML = '';
        document.getElementById('selectVersion').innerHTML = '';
    }

    // ✅ Calcular edad desde fecha de nacimiento
    function calcularEdad(fnac) {
        const nacimiento = new Date(fnac);
        const hoy = new Date();
        let edad = hoy.getFullYear() - nacimiento.getFullYear();
        if (hoy.getMonth() < nacimiento.getMonth() || (hoy.getMonth() === nacimiento.getMonth() && hoy.getDate() < nacimiento.getDate())) {
            edad--;
        }
        return edad;
    }

    // ✅ Asignar texto o valor por defecto
    function asignarTexto(id, texto) {
        document.getElementById(id).innerText = texto || 'No disponible';
    }

    // ✅ Mostrar enfermedades en 4 columnas
    function mostrarEnfermedades(lista, observaciones = '') {
        const contenedor = document.getElementById('lista-enfermedades');
        contenedor.innerHTML = '';
        let html = '<div class="row">';
        lista.forEach((e, i) => {
            html += `<div class="col-md-3"><div class="list-group-item">${e.nombre}</div></div>`;
            if ((i + 1) % 4 === 0) html += '</div><div class="row">';
        });
        html += '</div>';

        if (observaciones && observaciones.trim() !== '') {
            html += `
                <div class="mt-3">
                    <div class="d-flex align-items-start">
                        <span class="me-2">📝</span>
                        <div>
                            <strong>Observaciones sobre enfermedades:</strong>
                            <p class="mb-0">${observaciones}</p>
                        </div>
                    </div>
                </div>`;
        }

        contenedor.innerHTML = html;
    }


    function mostrarCitas(citas) {
        const contenedor = document.getElementById('lista-citas');
        contenedor.innerHTML = '';

        if (!citas.length) {
            contenedor.innerHTML = '<li class="list-group-item text-center">No hay citas registradas.</li>';
            return;
        }

        citas.sort((a, b) => new Date(b.fecha_cita) - new Date(a.fecha_cita)); // Orden descendente

        citas.forEach(cita => {
            const fecha = new Date(cita.fecha_cita);
            const fechaFormateada = `${fecha.getDate().toString().padStart(2, '0')}/` +
                                    `${(fecha.getMonth() + 1).toString().padStart(2, '0')}/` +
                                    `${fecha.getFullYear()}`;

            const item = document.createElement('li');
            item.className = 'list-group-item';

            item.innerHTML = `
                <div class="row text-left align-items-center">
                    <div class="col-md-3"><strong>📅 ${fechaFormateada}</strong></div>
                    <div class="col-md-3">🕐 ${cita.hora_inicio} - ${cita.hora_fin}</div>
                    <div class="col-md-3">👨‍⚕️ ${cita.nombre_medico}</div>
                    <div class="col-md-3">💼 ${cita.nombre}</div>
                </div>
            `;
            contenedor.appendChild(item);
        });
    }

    // ✅ Actualizar etiquetas de versión y fecha
    function actualizarVersionFecha(version, fecha) {
        // Convertir la fecha al formato d/m/y sin ajuste de zona horaria
        let fechaObj = new Date(fecha + "T00:00:00Z"); 
        let fechaFormateada = `${fechaObj.getUTCDate().toString().padStart(2, '0')}/${(fechaObj.getUTCMonth() + 1).toString().padStart(2, '0')}/${fechaObj.getUTCFullYear()}`;

        document.querySelectorAll('.version_historia').forEach(el => el.innerText = version);
        document.querySelectorAll('.fecha_historia').forEach(el => el.innerText = fechaFormateada);
    }

    // ✅ Renderizar datos clínicos
    function renderizarDatos(data, contenedorId, campos) {
        const contenedor = document.getElementById(contenedorId);
        contenedor.innerHTML = '';
        Object.entries(campos).forEach(([label, key]) => {
            if (data[key] && data[key].trim()) {
                contenedor.innerHTML += `<div class="col-md-6 mb-2"><strong>${label}:</strong> ${data[key]}</div>`;
            }
        });
    }

    // ✅ Selector de versiones anteriores
    function cargarSelectorVersiones(versiones) {
        const select = document.getElementById('selectVersion');
        select.innerHTML = '';

        versiones.forEach((v, i) => {
            const op = document.createElement('option');
            op.value = v.id;

            // Obtener fecha sin ajuste de zona horaria
            let fechaObj = new Date(v.fecha_registro + "T00:00:00Z"); 
            let fechaFormateada = `${fechaObj.getUTCDate().toString().padStart(2, '0')}/${(fechaObj.getUTCMonth() + 1).toString().padStart(2, '0')}/${fechaObj.getUTCFullYear()}`;

            op.text = `Versión ${v.version} - ${fechaFormateada}`;
            if (i === 0) op.selected = true;
            select.appendChild(op);
        });
        select.onchange = () => {
            const id = select.value;
            const seleccionada = versiones.find(v => v.id == id);
            if (seleccionada) {
                actualizarVersionFecha(seleccionada.version, seleccionada.fecha_registro);
                renderizarDatos(seleccionada, 'datos-generales', camposGenerales);
                renderizarDatos(seleccionada, 'datos-dentales', camposDentales);

                // 🔄 Cargar enfermedades de la historia seleccionada
                fetch(`/historia-clinica/version/${id}/enfermedades`)
                .then(res => res.json())
                .then(data => {
                    mostrarEnfermedades(data.enfermedades || [], data.obser_enfermedades || '');
                });
                // 🔄 Cargar hallazgos para el odontograma
                fetch(`/historia-clinica/version/${id}/hallazgos`)
                    .then(res => res.json())
                    .then(hallazgos => {
                    // Limpiar odontograma anterior si es necesario
                    limpiarOdontograma();
                    // Renderizar hallazgos nuevos
                    renderizarHallazgosOdontograma(hallazgos);
                });
                // 🔄 Cargar citas asociadas a la versión seleccionada
                fetch(`/historia-clinica/version/${id}/citas`)
                    .then(res => res.json())
                    .then(citas => {
                    if (citas.length > 0) {
                        document.getElementById('tab-citas-item').style.display = 'block';
                        mostrarCitas(citas);
                    } else {
                        document.getElementById('tab-citas-item').style.display = 'none';
                        document.getElementById('lista-citas').innerHTML = '';
                    }
                });

                // 🔄 Cargar evolución asociada a la versión seleccionada
                fetch(`/historia-clinica/version/${id}/evolucion`)
                .then(res => res.json())
                .then(evolucion => {
                    const tabEvolucionItem = document.getElementById('tab-evolucion-item');
                    const listaEvolucion = document.getElementById('lista-evolucion');

                    // Encabezado con emojis solo aquí
                    listaEvolucion.innerHTML = `
                        <li class="list-group-item bg-light font-weight-bold d-flex text-center">
                            <div class="col-3 d-flex align-items-center">
                                <span class="me-1">🗓️</span>
                                <span>Fecha</span>
                            </div>
                            <div class="col-4 d-flex align-items-center">
                                <span class="me-1">💊</span>
                                <span>Tratamiento</span>
                            </div>
                            <div class="col-5 d-flex align-items-center">
                                <span class="me-1">📆</span>
                                <span>Próxima Cita</span>
                            </div>
                        </li>
                    `;

                    if (evolucion.length > 0) {
                        tabEvolucionItem.style.display = 'block';

                        evolucion.forEach(evo => {
                            const li = document.createElement('li');
                            li.classList.add('list-group-item', 'd-flex', 'text-center');

                            // Formatear fecha
                            let fechaFormateada = '-';
                            if (evo.fecha_historia) {
                                const [yyyy, mm, dd] = evo.fecha_historia.split('-');
                                fechaFormateada = `${dd}/${mm}/${yyyy}`;
                            }

                            // Formatear próxima cita
                            let proximaCitaFormateada = '-';
                            if (evo.proxima_cita) {
                                const [fechaParte, horaParte] = evo.proxima_cita.split(' ');
                                if (fechaParte && horaParte) {
                                    const [yyyy, mm, dd] = fechaParte.split('-');
                                    const [hh, min] = horaParte.split(':');
                                    proximaCitaFormateada = `${dd}/${mm}/${yyyy} ${hh}:${min}`;
                                }
                            }

                            // ✅ Sin emojis en los valores
                            li.innerHTML = `
                                <div class="col-3 text-center">${fechaFormateada}</div>
                                <div class="col-4 text-center">${evo.tratamiento || '-'}</div>
                                <div class="col-5 text-center">${proximaCitaFormateada}</div>
                            `;

                            listaEvolucion.appendChild(li);
                        });
                    } else {
                        tabEvolucionItem.style.display = 'none';
                    }
                });
            }
        };
    }

    // 🔹 Campos generales y dentales
    const camposGenerales = {
        'Tratamiento médico': 'tratamiento_medico',
        'Medicamentos actuales': 'medicamentos_actuales',
        'Problema de cicatrización': 'problema_cicatrizacion',
        'Transfusión de Sangre': 'transfusion',
        'Radio/Quimioterapia': 'radio_quimio',
        'Reacción a medicamentos': 'reaccion_medicamento',
        'Tiene Alergias': 'alergia',
        'Articulaciones adoloridas': 'problema_articulaciones',
        'Fumador': 'fumador',
        'Toma habitualmente Alcohol?': 'toma_alchohol',
        'Está Embarazada?': 'embarazada',
        'Tiene Ansiedad?': 'ansiedad',
        'Tiene problemas de Sueño?': 'problema_sueno',
        'Último tratamiento odontológico': 'ultimo_tratamiento',
        'Tuvo Complicación en algún tratamiento?': 'complicacion_tratamiento',
        'Info adicional': 'info_adicional',
        'Motivo de la consulta': 'motivo_consulta',
        'Especificaciones': 'obser_antecedentes'
    };

    const camposDentales = {
        '¿Cuándo se hizo su último tratamiento odontológico?': 'ultimo_tratamiento',
        '¿Tiene miedo a algún tratamiento? ¿Tuvo alguna complicación en algún tratamiento anterior?': 'complicacion_tratamiento',
        'Está insatisfecho con su Sonrisa?': 'sonrisa',
        'Tiene Restauraciones que no le agraden?': 'restauraciones',
        'Quisiera tener los Dientes más blancos?': 'dientes_blancos',
        'Tiene Dolor al masticar?': 'dolor_masticar',
        'Tiene Dolor en los músculos de la cara?': 'dolor_musculo',
        'Siente su Mordida inestable?': 'mordida_inestable',
        'Siente Molestia al masticar?': 'molestia_masticar',
        'Tiene hábito de Apretar los dientes?': 'aprieta_dientes',
        'Ha usado placa de relajamiento?': 'uso_placa',
        'Tiene Dientes sensibles?': 'diente_sensible',
        'Siente alguna cavidad en los dientes?': 'diente_cavidad',
        'Tuvo Caries en los últimos 3 años?': 'caries',
        'Notó Desgaste dental recientemente?': 'diente_desgaste',
        'Usa el hilo dental?': 'usa_hilo',
        'El Hilo pasa fácilmente en todos sus dientes?': 'hilo_facil',
        'Siente la Boca seca?': 'boca_seca',
        'Sangrado encías con facilidad?': 'sangra_encia',
        'Ya tuvo Tratamiento de encías?': 'trato_encias',
        'Tiene problema de Mal aliento?': 'problema_aliento',
        'Recibió instrucciones de Higienización?': 'higiene'
    };

    async function exportarOdontogramaComoImagen() {
        const svg = document.querySelector('#svgselect svg');
        const serializer = new XMLSerializer();
        const svgString = serializer.serializeToString(svg);

        const svgBlob = new Blob([svgString], { type: "image/svg+xml;charset=utf-8" });
        const url = URL.createObjectURL(svgBlob);

        return new Promise((resolve) => {
            const img = new Image();
            img.onload = function () {
                const scale = 3;
                const padding = 40;

                const canvas = document.createElement('canvas');
                canvas.width = img.width * scale;
                canvas.height = img.height * scale + padding;

                const ctx = canvas.getContext('2d');

                // Fondo blanco
                ctx.fillStyle = "white";
                ctx.fillRect(0, 0, canvas.width, canvas.height);

                // Dibujar imagen desplazada hacia arriba (dejando padding abajo)
                ctx.drawImage(img, 0, 0, canvas.width, img.height * scale);

                const pngData = canvas.toDataURL('image/png');
                URL.revokeObjectURL(url);
                resolve(pngData);
            };
            img.src = url;
        });
    }

    document.getElementById('btnImprimirHistoria').addEventListener('click', async function () {
        const pacienteId = window.pacienteSeleccionadoId;
        const versionId = document.getElementById('selectVersion').value;

        const imgBase64 = await exportarOdontogramaComoImagen();

        const form = document.createElement('form');
        form.method = 'POST';
        form.action = imprimirUrl; // ✅ Siempre correcto
        form.target = '_blank';

        const token = document.createElement('input');
        token.type = 'hidden';
        token.name = '_token';
        token.value = document.querySelector('meta[name="csrf-token"]').content;
        form.appendChild(token);

        const pacienteInput = document.createElement('input');
        pacienteInput.type = 'hidden';
        pacienteInput.name = 'paciente_id';
        pacienteInput.value = pacienteId;
        form.appendChild(pacienteInput);

        const versionInput = document.createElement('input');
        versionInput.type = 'hidden';
        versionInput.name = 'version_id';
        versionInput.value = versionId;
        form.appendChild(versionInput);

        const imagenInput = document.createElement('input');
        imagenInput.type = 'hidden';
        imagenInput.name = 'imagen_odontograma';
        imagenInput.value = imgBase64;
        form.appendChild(imagenInput);

        document.body.appendChild(form);
        form.submit();
    });

</script>
<script>
    const buscarPacienteInput = document.getElementById('buscar_paciente');
    const resultadosBusquedaDiv = document.getElementById('resultados-busqueda');
    

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

</script>
<script>
    $(document).ready(function () {
        $('#buscar_paciente').on('input', function () {
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
            if (!$(e.target).closest('#buscar_paciente, #resultados-busqueda').length) {
                $('#resultados-busqueda').hide();
            }
        });
    });

</script>
<script>
    const imprimirUrl = "{{ route('historia.imprimir') }}";
</script>

@endsection
