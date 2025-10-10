<?php

namespace App\Http\Controllers;

use App\Models\Servicio;
use App\Models\Actividad;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ServicioController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Obtener el ID de la empresa del usuario autenticado
        $empresa_id = auth()->user()->empresa_id;

        // Obtener los servicios que pertenecen a esa empresa y cargar la relación actividad
        $servicios = Servicio::where('empresa_id', $empresa_id)->with('actividad')->get();

        // Obtener todos los tratamientos ordenados por nombre
        $tratamientos = Actividad::orderBy('nombre')->get();


        // Pasar los servicios y tratamientos a la vista
        return view('servicios.index', compact('servicios', 'tratamientos'));
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
        // Validar los datos de la solicitud
        $request->validate([
            'nombre' => [
                'required',
                'string',
                'max:50',
                'regex:/^[A-Za-z0-9\s]+$/', // Solo permite letras, números y espacios
                Rule::unique('servicios', 'nombre')
                    ->where('empresa_id', auth()->user()->empresa_id),
            ],
            'abreviatura' => [
                'required',
                'string',
                'max:20',
                'regex:/^[A-Za-z0-9\s]+$/', // Solo permite letras, números y espacios
                Rule::unique('servicios', 'abreviatura')
                    ->where('empresa_id', auth()->user()->empresa_id),
            ],
            
            'tiempominutos' => [
                'required',
                'integer',
                'min:0', // Permite solo números enteros positivos
            ],
        ], [
            'nombre.regex' => 'El nombre solo puede contener letras, números y espacios.',
            'abreviatura.regex' => 'La abreviatura solo puede contener letras, números y espacios.',
            
            'nombre.unique' => 'El nombre del servicio ya está en uso.',
            'abreviatura.unique' => 'La abreviatura del servicio ya está en uso.',
        ]);

        // Crear un nuevo servicio
        $servicio = new Servicio();

        // Transformar los datos antes de guardarlos
        
        $servicio->nombre = strtoupper($request->nombre); // Convertir a mayúsculas
        $servicio->abreviatura = strtoupper($request->abreviatura); // Convertir a mayúsculas
        
        $servicio->tiempominutos = $request->tiempominutos;
        $servicio->empresa_id = auth()->user()->empresa_id; // Asignar empresa_id del usuario autenticado
        $servicio->user_id = auth()->id(); // Asignar user_id del usuario autenticado

        // Guardar el servicio
        $servicio->save();

        return redirect()->route('servicios.index')->with('success', 'Procedimiento creado con éxito!');

    }

    /**
     * Display the specified resource.
     */
    public function show(Servicio $servicio)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Servicio $servicio)
    {
        // Devuelve los datos del médico como JSON
        return response()->json($servicio);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        // Validar los datos de la solicitud
        $request->validate([
            'nombre' => [
                'required',
                'string',
                'max:50',
                'regex:/^[A-Za-z0-9\s]+$/', // Solo permite letras, números y espacios
                Rule::unique('servicios', 'nombre')
                    ->where('empresa_id', auth()->user()->empresa_id)
                    ->ignore($id), // Ignorar el servicio actual para permitir la misma información en la actualización
            ],
            'abreviatura' => [
                'required',
                'string',
                'max:20',
                'regex:/^[A-Za-z0-9\s]+$/', // Solo permite letras, números y espacios
                Rule::unique('servicios', 'abreviatura')
                    ->where('empresa_id', auth()->user()->empresa_id)
                    ->ignore($id), // Ignorar el servicio actual para permitir la misma información en la actualización
            ],
            
            'tiempominutos' => [
                'required',
                'integer',
                'min:0', // Permite solo números enteros positivos
            ],
        ], [
            'nombre.regex' => 'El nombre solo puede contener letras, números y espacios.',
            'abreviatura.regex' => 'La abreviatura solo puede contener letras, números y espacios.',
            
            'nombre.unique' => 'El nombre del Procedimiento ya está en uso.',
            'abreviatura.unique' => 'La abreviatura del Procedimiento ya está en uso.',
        ]);
    
        // Buscar el servicio a actualizar
        $servicio = Servicio::findOrFail($id);
    
        // Actualizar los datos del servicio
        
        $servicio->nombre = strtoupper($request->nombre); // Convertir a mayúsculas
        $servicio->abreviatura = strtoupper($request->abreviatura); // Convertir a mayúsculas
        
        $servicio->tiempominutos = $request->tiempominutos;
        $servicio->empresa_id = auth()->user()->empresa_id; // Asegurar que la empresa es la correcta
        $servicio->user_id = auth()->id(); // Actualizar con el usuario autenticado
    
        // Guardar los cambios
        $servicio->save();
    
        // Redireccionar con un mensaje de éxito
        return redirect()->route('servicios.index')->with('success', 'Procedimiento actualizado con éxito!');
    }
    

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Servicio $servicio)
{
    
        // Eliminar el servicio de la base de datos
        $servicio->delete();

        // Retornar una respuesta exitosa
        return redirect()->route('servicios.index')->with('success', 'Procedimiento eliminado con éxito.');
    
}

    public function listadoServicios()
    {
        // Verifica que el usuario esté autenticado
        if (auth()->check() && auth()->user()->empresa_id) {
            $empresa_id = auth()->user()->empresa_id;

            // Filtra los servicios por el empresa_id del usuario autenticado
            $servicios = Servicio::where('empresa_id', $empresa_id)->get();

            return response()->json($servicios);
        }

        // Si no hay empresa_id o el usuario no está autenticado, devuelve un error
        return response()->json(['message' => 'No autorizado o sin empresa asignada.'], 403);
    }


    public function consultarPrecioTiempo(Request $request)
    {
        $idServicio = $request->query('id_servicio');
        $idMedico = $request->query('id_medico');

        // Consultar el servicio
        $servicio = Servicio::find($idServicio);

        if (!$servicio) {
            return response()->json(['error' => 'Servicio no encontrado'], 404);
        }

        // Retornar datos del servicio
        return response()->json([
            'precio' => $servicio->precio,
            'tiempominutos' => $servicio->tiempominutos,
        ]);
    }

    public function getProcedimientos($tratamientoId)
    {
        $servicios = Servicio::where('tratamiento_id', $tratamientoId)
                            ->orderby('nombre')    
                            ->get();
        return response()->json($servicios);
    }

}
