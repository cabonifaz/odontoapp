<?php
namespace App\Http\Controllers;

use App\Models\NotaCredito;
use Illuminate\Http\Request;

class NotaCreditoController extends Controller
{
    public function obtenerSiguienteCorrelativo(Request $request)
    {
        $serie = $request->query('serie', 'FC01'); // Obtener la serie completa desde la solicitud
        $facturadorId = $request->query('facturador_id'); // Obtener el facturador_id desde la solicitud

        // Escribir en el log para ver el valor del facturador_id y serie
        //\Log::info('Valor del facturador_id recibido: ' . $facturadorId);
        //\Log::info('Serie recibida: ' . $serie);

        // Obtener el último numdoc de la serie específica y facturador_id en la tabla nota_credito
        $ultimaNotaCredito = NotaCredito::where('serie', $serie)
            ->where('facturador_id', $facturadorId)
            ->orderBy('id', 'desc')
            ->first();

        if ($ultimaNotaCredito) {
            // Obtener el correlativo actual y sumarle 1
            $ultimoCorrelativo = (int)substr($ultimaNotaCredito->numdoc, -8); // Asumiendo que los últimos 8 caracteres son el correlativo
            $nuevoCorrelativo = str_pad($ultimoCorrelativo + 1, 8, '0', STR_PAD_LEFT);
        } else {
            // Si no hay notas de crédito previas, empezamos con 00000001
            $nuevoCorrelativo = '00000001';
        }

        return response()->json(['serie' => $serie, 'numdoc' => $nuevoCorrelativo]);
    }


    public function guardarNotaCredito(Request $request)
    {
        $data = $request->validate([
            'facturacionId' => 'required|integer',
            'serieNota' => 'required|string',
            'numdocNota' => 'required|string',
            'fechaActual' => 'required|date_format:d/m/Y',
            'motivo' => 'required|string',
            'facturadorId' => 'required|integer',
        ]);
        // Formatear fechaActual a yyyy-mm-dd H:i:s
        $fechaActualFormatted = \Carbon\Carbon::createFromFormat('d/m/Y', $data['fechaActual'])->format('Y-m-d H:i:s');
        // Guardar la nota de crédito
        $notaCredito = new NotaCredito();
        $notaCredito->facturacion_id = $data['facturacionId'];
        $notaCredito->serie = $data['serieNota'];
        $notaCredito->numdoc = $data['numdocNota'];
        $notaCredito->fecha = $fechaActualFormatted;
        $notaCredito->motivo = $data['motivo'];
        $notaCredito->facturador_id = $data['facturadorId'];
        $notaCredito->save();

        return response()->json(['success' => true, 'message' => 'Nota de Crédito guardada con éxito.']);
    }
}



