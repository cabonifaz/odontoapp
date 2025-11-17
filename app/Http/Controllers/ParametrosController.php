<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Parametro;

class ParametrosController extends Controller
{

    public function obtenerSeries($tipodoc, Request $request)
    {
        $facturadorId = $request->input('facturador_id');

        \Log::info('Valor del facturador_id recibido: ' . $facturadorId);

        // Obtener serie + igv
        $series = Parametro::where('tipodoc', $tipodoc)
            ->where('facturador_id', $facturadorId)
            ->get(['serie', 'igv']); // <-- ahora obtenemos ambos campos

        if ($series->isEmpty()) {
            \Log::info('No se encontraron series para el tipodoc: ' . $tipodoc . ' y facturador_id: ' . $facturadorId);
        } else {
            \Log::info('Series encontradas: ' . $series->toJson());
        }

        // Convertir a arreglo simple como el que usabas
        $resultado = $series->map(function ($item) {
            return [
                'serie' => $item->serie,
                'igv'   => $item->igv
            ];
        });

        return response()->json(['series' => $resultado]);
    }



}
