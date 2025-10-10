<?php

namespace App\Http\Controllers;

use App\Models\Empresa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class EmpresaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        // Obtener la empresa asociada al usuario autenticado
        $user = Auth::user();
        $empresa = Empresa::find($user->empresa_id);

        return view('empresas.index', compact('empresa'));

    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(Empresa $empresa)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Empresa $empresa)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Empresa $empresa)
    {

        $request->validate([
            'nombre_empresa' => 'required|string|max:255',
            'ruc' => 'required|string|max:20',
            'telefono' => 'nullable|string|max:20',
            'direccion' => 'required|string|max:255',
        ]);

        $empresa->update($request->all());

        return redirect()->route('empresas.index')->with('success', 'Datos de la empresa actualizados con éxito.');

    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Empresa $empresa)
    {
        //
    }
}
