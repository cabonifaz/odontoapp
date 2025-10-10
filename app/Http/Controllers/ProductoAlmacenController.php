<?php

namespace App\Http\Controllers;

use App\Models\ProductoAlmacen;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\StockMinimoExport;


class ProductoAlmacenController extends Controller
{
    public function index()
    {
        $productos = ProductoAlmacen::orderBy('nombre')->get();
        return view('almacen.productos.index', compact('productos'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|string|max:255',
            'presentacion' => 'nullable|string|max:255',
            'fecha_ingreso' => 'required|date',
            'stock' => 'required|integer|min:0',
            'stock_minimo' => 'nullable|integer|min:0',
            'precio_compra' => 'required|numeric|min:0',
        ]);

        ProductoAlmacen::create([
            'nombre' => $request->nombre,
            'presentacion' => $request->presentacion,
            'fecha_ingreso' => $request->fecha_ingreso,
            'stock' => $request->stock,
            'stock_minimo' => $request->stock_minimo,
            'precio_compra' => $request->precio_compra,
            'usuario_id' => Auth::id()
        ]);

        return redirect()->route('productos_almacen.index')->with('success', 'Producto registrado correctamente.');
    }

    public function edit($id)
    {
        $producto = ProductoAlmacen::findOrFail($id);
        return response()->json($producto);
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'nombre' => 'required|string|max:255',
            'presentacion' => 'nullable|string|max:255',
            'fecha_ingreso' => 'required|date',
            'stock' => 'required|integer|min:0',
            'stock_minimo' => 'nullable|integer|min:0',
            'precio_compra' => 'required|numeric|min:0',
        ]);

        $producto = ProductoAlmacen::findOrFail($id);
        $producto->update([
            'nombre' => $request->nombre,
            'presentacion' => $request->presentacion,
            'fecha_ingreso' => $request->fecha_ingreso,
            'stock' => $request->stock,
            'stock_minimo' => $request->stock_minimo,
            'precio_compra' => $request->precio_compra,
        ]);

        return redirect()->route('productos_almacen.index')->with('success', 'Producto actualizado correctamente.');
    }

    public function destroy($id)
    {
        $producto = ProductoAlmacen::findOrFail($id);
        $producto->delete();

        return redirect()->route('productos_almacen.index')->with('success', 'Producto eliminado correctamente.');
    }

    public function exportarStockMinimo()
    {
        return Excel::download(new StockMinimoExport, 'stock_minimo.xlsx');
    }

}
