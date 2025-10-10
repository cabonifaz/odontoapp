<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PacienteController;
use App\Http\Controllers\MedicoController;
use App\Http\Controllers\ServicioController;
use App\Http\Controllers\CitaController;
use App\Http\Controllers\VentasController;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\MentorController;
use App\Http\Controllers\ActividadController;
use App\Http\Controllers\EmpresaController;
use App\Http\Controllers\PresupuestoController;
use App\Http\Controllers\FacturacionController;
use App\Http\Controllers\ParametrosController;
use App\Http\Controllers\SunatController;
use App\Http\Controllers\NotaCreditoController;
use App\Http\Controllers\HistoriaClinicaV2Controller;
use App\Http\Controllers\OdontogramaDetalleController;
use App\Http\Controllers\ProductoAlmacenController;
use App\Http\Controllers\MovimientoAlmacenController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// Ruta para la página de inicio
Route::get('/', function () {
    return view('welcome'); // O 'home' si prefieres renombrar la vista de inicio
})->name('home');

// Ruta para el dashboard
Route::get('/dashboard', [VentasController::class, 'index'])
    ->middleware(['auth', 'verified'])
    ->name('dashboard');
    
    Route::get('/api/ventas-ultimos-7-dias', [VentasController::class, 'obtenerVentasUltimos7Dias']);
    Route::get('/api/top-servicios', [VentasController::class, 'obtenerTopServiciosUltimoMes']);
// Grupo de rutas para usuarios autenticados
Route::middleware('auth')->group(function () {

    // Perfil del usuario (editar)
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');

    // Actualizar el perfil del usuario
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');

    // Eliminar perfil del usuario
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Configuraciones (puedes agregar un controlador si es necesario)
    Route::get('/settings', function () {
        return view('settings'); // Asegúrate de tener una vista 'settings.blade.php'
    })->name('settings');
    // Esta línea agregará todas las rutas necesarias para el CRUD de médicos
    
// Esta línea agregará todas las rutas necesarias para el CRUD de médicos
Route::resource('medicos', MedicoController::class);

Route::resource('empresas', EmpresaController::class);
Route::post('/citas/verificarDisponibilidad', [CitaController::class, 'verificarDisponibilidad'])->name('citas.verificarDisponibilidad');
Route::get('/citas/consulta/{id}', [CitaController::class, 'mostrarCitasPorPaciente'])->name('citas.consulta');
Route::get('/citas/impresion', [CitaController::class, 'vistaImpresion'])->name('citas.impresion');

Route::post('/citas/buscar', [CitaController::class, 'buscarCitas'])->name('citas.buscar');
Route::get('/citas/consulta_por_fecha', [CitaController::class, 'mostrarConsultaPorFecha'])->name('citas.consulta_por_fecha');

Route::get('/citas/{citaId}/actividades', [CitaController::class, 'getActividades']);

Route::get('/citas/{presupuestoId}/detalles-actividades/{tratamientoId}', [CitaController::class, 'verActividades'])->name('citas.detalles_actividades');
Route::post('/actividades-paciente/{citaId}/cambiar-estado', [CitaController::class, 'cambiarEstado']);
Route::post('/actividades-paciente/update-fecha', [CitaController::class, 'updateFechaActividad'])->name('actividades_paciente.updateFecha');

Route::resource('citas', CitaController::class);
Route::post('/buscar-dni-ruc', [ApiController::class, 'buscarDni'])->name('buscar.dni');
Route::post('/buscar-ruc', [ApiController::class, 'buscarRuc'])->name('buscar.ruc');
Route::post('/buscar-paciente', [PacienteController::class, 'buscarPaciente']);

Route::get('/pacientes/exportar-cumpleanos', [PacienteController::class, 'exportPacientesCumpleanos'])
     ->name('pacientes.exportarCumpleanos');

Route::get('/pacientes/exportar-cumpleanos-pdf', [PacienteController::class, 'exportPacientesCumpleanosPDF'])
->name('pacientes.exportarCumpleanosPDF');
Route::get('/exportar/pacientes/general', [PacienteController::class, 'exportPacientesGenerales'])->name('export.pacientes.general');

Route::resource('pacientes', PacienteController::class);
Route::get('/filtrar-pacientes', [PacienteController::class, 'filtrarPacientes'])->name('pacientes.filtrar');
Route::get('/servicios/listado', [ServicioController::class, 'listadoServicios'])->name('servicios.listado');
Route::get('/servicios/consultar_precio_tiempo', [ServicioController::class, 'consultarPrecioTiempo'])->name('servicios.consultar_precio_tiempo');
Route::get('/procedimientos/{tratamientoId}', [ServicioController::class, 'getProcedimientos']);

Route::resource('servicios', ServicioController::class);
Route::resource('roles', \App\Http\Controllers\RoleController::class);
Route::resource('permisos', \App\Http\Controllers\PermisoController::class);
Route::resource('usuarios', \App\Http\Controllers\AsignarController::class)->names('asignar');

Route::post('/buscar-actividades', [ActividadController::class, 'buscarActividades'])->name('buscar.actividades');

Route::post('/actividad/agregar', [ActividadController::class, 'agregarActividad']);

Route::post('/actividad/eliminar', [ActividadController::class, 'eliminarActividad']);

Route::get('/tratamiento/{tratamientoId}/actividades', [ActividadController::class, 'getActivitiesByService']);
Route::get('/tratamiento/{tratamientoId}/procedimientos', [ActividadController::class, 'getProcedimientos']);
Route::post('/actividades/{id}/move', [ActividadController::class, 'moveActivity']);
Route::get('/get-tratamiento-precio/{id}', [ActividadController::class, 'getPrecioBase']);
Route::get('/actividades/{tratamientoId}', [ActividadController::class, 'loadActivities'])->name('activities.load');
Route::get('/obtener-actividades', [ActividadController::class, 'obtenerActividades']);

Route::resource('actividades', ActividadController::class)->parameters([
    'actividades' => 'actividad'
]);
Route::post('/generar-actividades', [PresupuestoController::class, 'generarActividades']);
Route::get('/presupuestos/{id}/detalles', [PresupuestoController::class, 'obtenerDetalles']);
Route::resource('presupuestos', PresupuestoController::class);
Route::get('/presupuestos/{detalleId}/actividades', [PresupuestoController::class, 'getActividades']);
Route::post('/eliminar-detalle/{id}', [PresupuestoController::class, 'eliminarDetalle']);
Route::post('/presupuestos/{id}/actualizar-estado', [PresupuestoController::class, 'actualizarEstado'])->name('presupuestos.actualizarEstado');
Route::get('/pacientes/{pacienteId}/presupuestos-aprobados', [PresupuestoController::class, 'getPresupuestosAprobados']);
Route::get('/presupuestos/{id}/imprimir', [PresupuestoController::class, 'imprimir'])->name('presupuestos.imprimir');
Route::post('/detalle-presupuesto/{detalleId}/actualizar', [PresupuestoController::class, 'actualizarDetalle'])
    ->name('detalle-presupuesto.actualizar');

Route::get('/facturacion/obtener', [FacturacionController::class, 'obtener'])->name('facturacion.obtener');
Route::get('/facturacion/{id}/tratamientos', [FacturacionController::class, 'obtenerTratamientos'])->name('facturacion.tratamientos');
Route::get('/facturacion/{detallePresupuestoId}/procedimientos', [FacturacionController::class, 'obtenerProcedimientos'])->name('facturacion.procedimientos');
Route::get('/facturacion/{presupuestoId}/total-sumado', [FacturacionController::class, 'obtenerTotalSumado'])->name('facturacion.total-sumado');
Route::get('/parametros/{tipodoc}/series', [ParametrosController::class, 'obtenerSeries'])->name('parametros.series');
Route::get('/facturacion/{serie}/ultimo-numdoc', [FacturacionController::class, 'obtenerUltimoNumdoc'])->name('facturacion.ultimo-numdoc');
Route::get('/clientes/buscar_ruc', [FacturacionController::class, 'buscarClienteRuc'])->name('clientes.buscar_ruc');
Route::post('/guardar-clienteruc', [FacturacionController::class, 'guardarClienteRuc'])->name('guardar.clienteruc');
Route::get('/facturacion/bandejasunat', [SunatController::class, 'index'])->name('facturacion.bandejasunat');
Route::post('/sunat/generarXML/{id}', [SunatController::class, 'generarXML']);
Route::post('/generar-pdf-factura/{id}', [FacturacionController::class, 'generarPDFFactura'])->name('generar.pdf.factura');
Route::post('/generar-pdf-notacredito/{id}', [FacturacionController::class, 'generarPDFNotaCredito'])->name('generar.pdf.notacredito');
Route::post('/actualizar-medio-pago', [FacturacionController::class, 'actualizarMedioPago']);

Route::get('/reporte-ventas', [SunatController::class, 'reporteVentas'])->name('reporte.ventas');
Route::get('/reporte-ventas-pdf', [SunatController::class, 'generarReporteVentasPDF'])->name('reporte.ventas.pdf');
Route::get('/reporte-ventas-excel', [SunatController::class, 'exportarReporteVentasExcel'])->name('reporte.ventas.excel');

Route::get('/reportes/reporte-ventas-medico', [FacturacionController::class, 'reporteVentasMedico'])
    ->name('reportes.reporte-ventas-medico');

Route::resource('facturacion', FacturacionController::class);

Route::get('/nota-credito/correlativo', [NotaCreditoController::class, 'obtenerSiguienteCorrelativo']);

Route::post('/nota-credito/guardar', [NotaCreditoController::class, 'guardarNotaCredito']);

Route::get('historia-clinica', [HistoriaClinicaV2Controller::class, 'index'])->name('historia_clinica_v2.index');
Route::get('historia-clinica/{paciente_id}/create', [HistoriaClinicaV2Controller::class, 'create'])->name('historia_clinica_v2.create');
Route::post('historia-clinica/store', [HistoriaClinicaV2Controller::class, 'store'])->name('historia_clinica_v2.store');
Route::get('/historia-clinica/{paciente_id}/json', [HistoriaClinicaV2Controller::class, 'json']);
Route::get('/historia-clinica/version/{id}/enfermedades', [HistoriaClinicaV2Controller::class, 'enfermedadesPorHistoria']);
Route::get('/historia-clinica/version/{id}/hallazgos', [HistoriaClinicaV2Controller::class, 'odontogramaPorHistoria']);
Route::get('/historia-clinica/version/{id}/citas', [HistoriaClinicaV2Controller::class, 'citasPorVersion']);
Route::get('/historia-clinica/version/{id}/evolucion', [HistoriaClinicaV2Controller::class, 'evolucionPorVersion']);

Route::post('/historia-clinica/imprimir', [HistoriaClinicaV2Controller::class, 'generarPDF'])->name('historia.imprimir');


Route::get('/buscar-paciente', [HistoriaClinicaV2Controller::class, 'buscarPaciente']);

Route::get('/odontograma/{historia_id}', [OdontogramaDetalleController::class, 'mostrar']);
Route::post('/odontograma/guardar', [OdontogramaDetalleController::class, 'guardar']);
Route::delete('/odontograma/eliminar', [OdontogramaDetalleController::class, 'eliminar']);

Route::resource('productos_almacen', ProductoAlmacenController::class)->except(['show']);
Route::get('/almacen/movimientos', [MovimientoAlmacenController::class, 'index'])->name('movimientos.index');
Route::post('/almacen/movimientos/entrada', [MovimientoAlmacenController::class, 'registrarEntrada'])->name('movimientos.entrada');

Route::post('/almacen/movimientos/salida', [MovimientoAlmacenController::class, 'registrarSalida'])->name('movimientos.salida');
Route::get('/productos_almacen/exportar-stock-minimo', [ProductoAlmacenController::class, 'exportarStockMinimo'])->name('productos_almacen.export_stock_minimo');

Route::get('/students', [ApiController::class, 'index'])->name('certificados.index');
Route::get('/studentsmentor', [MentorController::class, 'index'])->name('certificadosmentor.index');
Route::post('/generar-certificados', [ApiController::class, 'generarCertificados'])->name('generarCertificados');
Route::post('/generar-certificadosmentor', [MentorController::class, 'generarCertificados'])->name('generarCertificadosMentor');

});

// Archivo de autenticación
require __DIR__.'/auth.php';
