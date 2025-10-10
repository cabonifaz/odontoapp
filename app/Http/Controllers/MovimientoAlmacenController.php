<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\MovimientoAlmacen;
use App\Models\ProductoAlmacen;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class MovimientoAlmacenController extends Controller
{
    public function index(Request $request)
    {
        $desde = $request->input('desde', Carbon::now()->startOfMonth()->toDateString());
        $hasta = $request->input('hasta', Carbon::now()->endOfDay()->toDateString());

        $movimientos = MovimientoAlmacen::with(['producto', 'usuario'])
        ->whereBetween('fecha', [$desde, $hasta])
        ->orderBy('producto_id')
        ->orderBy('fecha') // ✅ orden correcto para calcular el stock acumulado
        ->orderBy('id')
        ->get();

        $productos = ProductoAlmacen::orderBy('nombre')->get();

        return view('almacen.movimientos.index', compact('movimientos', 'productos', 'desde', 'hasta'));
    }

    public function registrarEntrada(Request $request)
    {
        $request->validate([
            'entrada_producto_id' => 'required|exists:productos_almacen,id',
            'entrada_cantidad' => 'required|integer|min:1',
            'entrada_motivo' => 'required|string|max:100',
        ]);

        $producto = ProductoAlmacen::findOrFail($request->entrada_producto_id);

        $movimiento = MovimientoAlmacen::create([
            'producto_id' => $producto->id,
            'tipo' => 'entrada',
            'cantidad' => $request->entrada_cantidad,
            'motivo' => $request->entrada_motivo,
            'fecha' => now(),
            'usuario_id' => Auth::id(),
        ]);

        $producto->stock += $request->entrada_cantidad;
        $producto->ultimo_movimiento_id = $movimiento->id;
        $producto->save();

        return redirect()->back()->with('success', 'Entrada registrada correctamente.');
    }

    public function registrarSalida(Request $request)
    {
        $request->validate([
            'salida_producto_id' => 'required|exists:productos_almacen,id',
            'salida_cantidad' => 'required|integer|min:1',
            'salida_motivo' => 'required|string|max:100',
        ]);

        $producto = ProductoAlmacen::findOrFail($request->salida_producto_id);

        if ($producto->stock < $request->salida_cantidad) {
            return redirect()->back()->with('error', 'Stock insuficiente para salida.');
        }

        $movimiento = MovimientoAlmacen::create([
            'producto_id' => $producto->id,
            'tipo' => 'salida',
            'cantidad' => $request->salida_cantidad,
            'motivo' => $request->salida_motivo,
            'fecha' => now(),
            'usuario_id' => Auth::id(),
        ]);

        $producto->stock -= $request->salida_cantidad;
        $producto->ultimo_movimiento_id = $movimiento->id;
        $producto->save();

        // ⚠️ Verificar si queda por debajo del stock mínimo
        if ($producto->stock < $producto->stock_minimo) {
            session()->flash('warning', '¡Atención! El producto "' . $producto->nombre . '" ha quedado por debajo del stock mínimo.');
        }

        return redirect()->back()->with('success', 'Salida registrada correctamente.');
    }
}
