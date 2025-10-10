<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OdontogramaDetalle;
use App\Models\HistoriaClinica;

class OdontogramaDetalleController extends Controller
{
    /**
     * Mostrar el odontograma de una historia clínica.
     */
    public function mostrar($historia_id)
    {
        $detalles = OdontogramaDetalle::where('historia_id', $historia_id)->get();
        return response()->json($detalles);
    }

    /**
     * Guardar o actualizar un detalle de odontograma (cara de diente).
     */
    public function guardar(Request $request)
    {
        $validated = $request->validate([
            'historia_id' => 'required|exists:historias_clinicas_v2,id',
            'numero_diente' => 'required|string|max:10',
            'cara' => 'required|string|max:10',
            'estado' => 'nullable|string|max:50',
            'color' => 'nullable|string|max:20',
            'observaciones' => 'nullable|string|max:255',
        ]);

        // Buscar si ya existe un registro con esa cara del diente para esa historia
        $detalle = OdontogramaDetalle::updateOrCreate(
            [
                'historia_id' => $validated['historia_id'],
                'numero_diente' => $validated['numero_diente'],
                'cara' => $validated['cara']
            ],
            [
                'estado' => $validated['estado'] ?? null,
                'color' => $validated['color'] ?? null,
                'observaciones' => $validated['observaciones'] ?? null
            ]
        );

        return response()->json(['success' => true, 'detalle' => $detalle]);
    }

    /**
     * Eliminar una cara del diente del odontograma.
     */
    public function eliminar(Request $request)
    {
        $validated = $request->validate([
            'historia_id' => 'required|exists:historias_clinicas_v2,id',
            'numero_diente' => 'required|string',
            'cara' => 'required|string'
        ]);

        $deleted = OdontogramaDetalle::where('historia_id', $validated['historia_id'])
            ->where('numero_diente', $validated['numero_diente'])
            ->where('cara', $validated['cara'])
            ->delete();

        return response()->json(['success' => $deleted > 0]);
    }
}
