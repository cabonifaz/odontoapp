<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Parametro;

class ParametrosController extends Controller
{
    public function obtenerSeries($tipodoc, Request $request)
    {
        // Obtener el facturador_id de la solicitud
        $facturadorId = $request->input('facturador_id');

        // Escribir en el log para ver el valor del facturador_id
        \Log::info('Valor del facturador_id recibido: ' . $facturadorId);

        // Obtener las series correspondientes al tipodoc y facturador_id
        $series = Parametro::where('tipodoc', $tipodoc)
            ->where('facturador_id', $facturadorId)
            ->pluck('serie')
            ->all();

        // Verificar si se encontraron series
        if (empty($series)) {
            \Log::info('No se encontraron series para el tipodoc: ' . $tipodoc . ' y facturador_id: ' . $facturadorId);
        } else {
            \Log::info('Series encontradas: ' . implode(', ', $series));
        }

        // Retornar las series como respuesta JSON
        return response()->json(['series' => $series]);
    }

}
