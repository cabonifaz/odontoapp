<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Medico; // Importa el modelo Medico
use App\Models\Paciente; // Importa el modelo Paciente
use App\Models\Cita; // Importa el modelo Cita
use App\Models\Servicio; // Importa el modelo Servicio
use Carbon\Carbon; // Asegúrate de importar Carbon
use Illuminate\Support\Facades\DB; // Importa el DB facade

class VentasController extends Controller
{
    public function index()
{
    // Obtener el id de la empresa del usuario autenticado
    $empresa_id = auth()->user()->empresa_id;

    // Contar médicos registrados para la empresa del usuario
    $total_medicos = Medico::where('empresa_id', $empresa_id)->count();

    // Contar pacientes registrados para la empresa del usuario
    $total_pacientes = Paciente::where('empresa_id', $empresa_id)->count();

    // Contar citas registradas para la empresa del usuario
    $total_citas = Cita::where('empresa_id', $empresa_id)->count();

    // Llamar a la vista y pasar los datos
    return view('/dashboard', compact('total_medicos', 'total_pacientes', 'total_citas'));
}

public function obtenerVentasUltimos7Dias() 
{
    // Obtener la fecha actual y la fecha de hace 7 días
    $fechaActual = Carbon::now()->format('Y-m-d');
    $fechaHace7Dias = Carbon::now()->subDays(7)->format('Y-m-d');

    // Obtener el id de la empresa del usuario autenticado
    $empresa_id = auth()->user()->empresa_id;

    // Realizar la consulta para obtener las ventas de los últimos 7 días filtradas por empresa
    $ventas_datos = Cita::selectRaw('DATE(fecha_cita) AS fecha, COUNT(fecha_cita) AS total_ventas')
        ->where('empresa_id', $empresa_id) // Filtrar por empresa_id
        ->whereBetween(DB::raw('DATE(fecha_cita)'), [$fechaHace7Dias, $fechaActual])
        ->groupBy('fecha')
        ->orderBy('fecha', 'ASC')
        ->get();

    // Inicializar arrays para las etiquetas y los datos
    $labels = [];
    $data = [];

    // Recorrer los resultados y llenar los arrays
    foreach ($ventas_datos as $venta) {
        $labels[] = $venta->fecha; // Asignar la fecha como etiqueta
        $data[] = $venta->total_ventas; // Asignar el total de ventas como dato
    }

    // Crear un array con los resultados
    $resultados = [
        'labels' => $labels,
        'data' => $data,
    ];

    // Convertir los resultados a JSON
    return response()->json($resultados);
}

public function obtenerTopServiciosUltimoMes()
{
    // Calcular la fecha de hace un mes atrás
    $fechaUnMesAtras = Carbon::now()->subMonth()->format('Y-m-d');

    // Obtener el id de la empresa del usuario autenticado
    $empresa_id = auth()->user()->empresa_id;

    // Realizar la consulta para obtener los top 5 servicios vendidos en el último mes, filtrados por empresa
    $datosProductos = Servicio::select('nombre')
        ->selectRaw('COUNT(c.id_servicio) AS cantidad_ventas')
        ->leftJoin('citas AS c', 'servicios.id', '=', 'c.id_servicio')
        ->where('c.fecha_cita', '>=', $fechaUnMesAtras)
        ->where('servicios.empresa_id', $empresa_id) // Filtrar por empresa_id
        ->groupBy('nombre')
        ->orderBy('cantidad_ventas', 'DESC')
        ->limit(5)
        ->get();

    // Procesar los datos
    $nombresProductos = $datosProductos->pluck('nombre')->toArray();
    $cantidadVentas = $datosProductos->pluck('cantidad_ventas')->toArray();

    // Crear un array de datos para el gráfico
    $datosParaGrafico = [
        'labels' => $nombresProductos,
        'data' => $cantidadVentas,
    ];

    // Convertir el array a formato JSON y devolverlo
    return response()->json($datosParaGrafico);
}


}
