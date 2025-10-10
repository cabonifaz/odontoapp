<?php

namespace App\Http\Controllers;

use App\Models\Medico;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\DB; // Importa DB


class MedicoController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
{
    // Obtener el ID de la empresa del usuario autenticado
    $empresa_id = auth()->user()->empresa_id;

    // Obtener los médicos que pertenecen a esa empresa
    $medicos = Medico::where('empresa_id', $empresa_id)->get();

    // Obtener las especialidades disponibles
    $especialidades = DB::table('especialidades')
        ->select('id_especialidad', 'nombre_especialidad')
        ->get();

    // Pasar los médicos y especialidades filtrados a la vista
    return view('medicos.index', compact('medicos', 'especialidades'));
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
        $request->validate([
            'nombre_medico' => [
                'required',
                'string',
                'max:255',
                'regex:/^[\pL\s\-]+$/u', // Solo permite letras, espacios y guiones
                Rule::unique('medicos', 'nombre_medico')
                    ->where(function ($query) use ($request) {
                        return $query->where('empresa_id', $request->empresa_id);
                    }),
            ],
            'cmp' => [
                'required',
                'string',
                'max:255',
                'regex:/^[A-Za-z0-9]+$/', // Solo permite letras y números
                Rule::unique('medicos', 'cmp')
                    ->where(function ($query) use ($request) {
                        return $query->where('empresa_id', $request->empresa_id);
                    }),
            ],
            'telefono' => [
                'nullable',
                'string',
                'max:50',
                'regex:/^[0-9]+$/', // Solo permite números
            ],
            'direccion' => 'required|string|max:255',
            'fyh_ingreso' => 'required|date',
        ], [
            'nombre_medico.regex' => 'El nombre del médico solo puede contener letras, espacios y guiones.',
            'cmp.regex' => 'El CMP solo puede contener letras y números.',
            'telefono.regex' => 'El teléfono solo puede contener números.',
            'nombre_medico.unique' => 'El nombre del médico ya está registrado en esta empresa.',
            'cmp.unique' => 'El CMP ya está registrado en esta empresa.',
        ]);
        

        // Transformar los datos antes de crear el registro
        $medico = new Medico();
        $medico->nombre_medico = strtoupper($request->nombre_medico); // Convertir a mayúsculas
        $medico->cmp = strtoupper($request->cmp); // Convertir a mayúsculas
        $medico->telefono = $request->telefono ? preg_replace('/\D/', '', $request->telefono) : null; // Eliminar caracteres no numéricos
        $medico->direccion = $request->direccion;
        $medico->fyh_ingreso = $request->fyh_ingreso;
        $medico->empresa_id = auth()->user()->empresa_id; // Asociar médico con la empresa del usuario autenticado
        $medico->user_id = auth()->id(); // O cualquier otro valor relevante
        // Guardar el nuevo médico
        $medico->save();
        return redirect()->route('medicos.index')->with('success', 'Médico creado con éxito!');

    }

    /**
     * Display the specified resource.
     */
    public function show(Medico $medico)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Medico $medico)
    {
        // Devuelve los datos del médico como JSON
        return response()->json($medico);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Medico $medico)
    {
        // Validar los datos de la solicitud
        $request->validate([
            'nombre_medico_edit' => [
                'required',
                'string',
                'max:255',
                'regex:/^[\pL\s\-]+$/u', // Solo permite letras, espacios y guiones
                // Verifica que el nombre_medico sea único en la tabla medicos para la misma empresa, excluyendo el registro actual
                Rule::unique('medicos', 'nombre_medico')
                    ->where('empresa_id', auth()->user()->empresa_id)
                    ->ignore($medico->id),
            ],
            'cmp_edit' => [
                'required',
                'string',
                'max:255',
                'regex:/^[A-Za-z0-9]+$/', // Solo permite letras y números
                // Verifica que el cmp sea único en la tabla medicos para la misma empresa, excluyendo el registro actual
                Rule::unique('medicos', 'cmp')
                    ->where('empresa_id', auth()->user()->empresa_id)
                    ->ignore($medico->id),
            ],
            'telefono_edit' => [
                'nullable',
                'string',
                'max:50',
                'regex:/^[0-9]+$/', // Solo permite números
            ],
            'direccion_edit' => 'required|string|max:255',
            'fyh_ingreso_edit' => 'required|date',
        ], [
            'nombre_medico_edit.regex' => 'El nombre del médico solo puede contener letras, espacios y guiones.',
            'cmp_edit.regex' => 'El CMP solo puede contener letras y números.',
            'telefono_edit.regex' => 'El teléfono solo puede contener números.',
            'nombre_medico_edit.unique' => 'El nombre del médico ya está en uso en esta empresa.',
            'cmp_edit.unique' => 'El CMP ya está en uso en esta empresa.',
        ]);

        // Verifica que el médico pertenece a la empresa del usuario autenticado
        if ($medico->empresa_id !== auth()->user()->empresa_id) {
            return redirect()->route('medicos.index')->with('error', 'No tienes permiso para actualizar este médico.');
        }

        // Transformar los datos antes de actualizar
        $medico->nombre_medico = strtoupper($request->nombre_medico_edit); // Convertir a mayúsculas
        $medico->cmp = strtoupper($request->cmp_edit); // Convertir a mayúsculas
        $medico->telefono = $request->telefono_edit ? preg_replace('/\D/', '', $request->telefono_edit) : null; // Eliminar caracteres no numéricos
        $medico->direccion = $request->direccion_edit;
        $medico->fyh_ingreso = $request->fyh_ingreso_edit;

        // Actualizar los datos del médico usando el objeto inyectado directamente
        $medico->save();

        return redirect()->route('medicos.index')->with('success', 'Médico actualizado con éxito!');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Medico $medico)
    {
        // Verifica que el médico pertenece a la empresa del usuario autenticado
        if ($medico->empresa_id !== auth()->user()->empresa_id) {
            return redirect()->route('medicos.index')->with('error', 'No tienes permiso para eliminar este médico.');
        }

        // Eliminar el médico
        $medico->delete();

        return redirect()->route('medicos.index')->with('success', 'Médico eliminado con éxito.');
    }

}
