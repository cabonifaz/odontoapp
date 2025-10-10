<?php

namespace App\Http\Controllers;

use App\Models\Actividad;
use App\Models\Servicio;
use App\Models\ActividadPorServicio;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Log;

class ActividadController extends Controller
{
    // Listar todas las actividades
    public function index()
    {
        // Obtener el ID de la empresa del usuario autenticado
        $empresa_id = auth()->user()->empresa_id;

        // Obtener las actividades ordenadas por nombre
        $actividades = Actividad::where('empresa_id', $empresa_id)
            ->orderBy('nombre', 'asc') // Ordenar por nombre en orden ascendente
            ->get();

        return view('actividades.index', compact('actividades'));
    }


    public function store(Request $request)
    {
        $empresa_id = auth()->user()->empresa_id;

        // Registrar los datos de la solicitud en el log
        //Log::info('Datos de la solicitud:', $request->all());

        // Convertir el valor de detalle_pieza a booleano antes de la validación
        $request->merge(['detalle_pieza' => filter_var($request->detalle_pieza, FILTER_VALIDATE_BOOLEAN)]);

        // Validación de los campos
        $request->validate([
            'nombre_actividad' => [
                'required',
                'string',
                'max:255',
                'regex:/^[\pL\s\-]+$/u', // Solo permite letras, espacios y guiones
                Rule::unique('actividades', 'nombre') // Valida el campo nombre en la tabla actividades
                    ->where(function ($query) use ($empresa_id) {
                        return $query->where('empresa_id', $empresa_id);
                    }),
            ],
            'precio_actividad' => [
                'required',
                'numeric',
                'min:0', // El precio debe ser un valor positivo
            ],
            'detalle_pieza' => [
                'boolean', // Validar que sea un booleano (checkbox)
            ],
        ], [
            'nombre_actividad.regex' => 'El nombre del Tratamiento solo puede contener letras, espacios y guiones.',
            'nombre_actividad.unique' => 'El nombre del Tratamiento ya está registrado.',
            'precio_actividad.required' => 'El precio es obligatorio.',
            'precio_actividad.numeric' => 'El precio debe ser un número válido.',
            'precio_actividad.min' => 'El precio debe ser mayor o igual a 0.',
        ]);

        // Crear la actividad
        $actividad = new Actividad();
        $actividad->nombre = strtoupper($request->nombre_actividad); // Convertir a mayúsculas
        $actividad->empresa_id = $empresa_id; // Asociar con la empresa del usuario autenticado
        $actividad->user_id = auth()->id();
        $actividad->precio = $request->precio_actividad; // Guardar el precio enviado
        $actividad->detalle_pieza = $request->detalle_pieza ? 1 : 0; // Guardar el estado del checkbox como entero
        $actividad->save();

        return redirect()->route('actividades.index')->with('success', 'Tratamiento creado con éxito!');
    }


    public function edit(Actividad $actividad)
    {
        // Devuelve los datos del médico como JSON
        return response()->json($actividad);
    }

    // Mostrar un formulario para crear una actividad (opcional)
    public function create()
    {
        return view('actividades.create');
    }

    public function update(Request $request, $id)
    {
        // Registrar los datos de la solicitud en el log
    Log::info('Datos de la solicitud:', $request->all());
        $empresa_id = auth()->user()->empresa_id;

        $request->validate([
            'nombre_actividad_edit' => [
                'required',
                'string',
                'max:255',
                'regex:/^[\pL\s\-]+$/u', // Solo permite letras, espacios y guiones
                Rule::unique('actividades', 'nombre') // Valida el campo nombre en la tabla actividades
                    ->where(function ($query) use ($empresa_id) {
                        return $query->where('empresa_id', $empresa_id);
                    })
                    ->ignore($id), // Ignorar la actividad actual en la validación
            ],
            'precio_actividad_edit' => [
                'required',
                'numeric',
                'min:0', // El precio debe ser un valor positivo
            ],
            'detalle_pieza_edit' => [
                'boolean', // Validar que sea un booleano (checkbox)
            ],
        ], [
            'nombre_actividad_edit.regex' => 'El nombre del Tratamiento solo puede contener letras, espacios y guiones.',
            'nombre_actividad_edit.unique' => 'El nombre del Tratamiento ya está registrado.',
            'precio_actividad_edit.required' => 'El precio es obligatorio.',
            'precio_actividad_edit.numeric' => 'El precio debe ser un número válido.',
            'precio_actividad_edit.min' => 'El precio debe ser mayor o igual a 0.',
        ]);

        // Actualizar la actividad existente
        $actividad = Actividad::findOrFail($id);
        $actividad->nombre = strtoupper($request->nombre_actividad_edit); // Convertir a mayúsculas
        $actividad->empresa_id = $empresa_id; // Asociar con la empresa del usuario autenticado
        $actividad->user_id = auth()->id();
        $actividad->precio = $request->precio_actividad_edit; // Guardar el precio enviado
        $actividad->detalle_pieza = $request->detalle_pieza_edit ? 1 : 0; // Guardar el estado del checkbox
        $actividad->save();

        return redirect()->route('actividades.index')->with('success', 'Tratamiento actualizado con éxito!');
    }

    public function destroy(Actividad $actividad)
    {
        
            // Eliminar el servicio de la base de datos
            $actividad->delete();

            // Retornar una respuesta exitosa
            return redirect()->route('actividades.index')->with('success', 'Tratamiento eliminado con éxito.');
        
    }
    public function buscarActividades(Request $request)
    {
        $empresaId = auth()->user()->empresa_id; // ID de la empresa
        $searchQuery = $request->input('searchQuery');
        
        // Buscar actividades que coincidan con la consulta
        $activities = Servicio::where('nombre', 'LIKE', "%$searchQuery%")
                                ->where('empresa_id', $empresaId)
                                ->get(['id', 'nombre']); // Asegúrate de incluir 'id' y 'nombre'

        // Retornar los resultados como una respuesta JSON o una vista parcial con los datos
        return response()->json($activities);
    }
    
    public function agregarActividad(Request $request)
    {
        // Validar los datos recibidos
        $validatedData = $request->validate([
            'tratamiento_id' => 'required|exists:actividades,id',
            'activity_percentage' => 'required|numeric|min:0|max:100',
            'actividad_id' => 'required|exists:servicios,id',
        ]);

        $empresaId = auth()->user()->empresa_id; // ID de la empresa
        $userId = auth()->id(); // ID del usuario

        // Verificar si ya existe
        $exists = ActividadPorServicio::where('tratamiento_id', $validatedData['tratamiento_id'])
                        ->where('servicio_id', $validatedData['actividad_id'])
                        ->where('empresa_id', $empresaId)
                        ->exists();

        if ($exists) {
            return response()->json([
                'success' => false,
                'message' => 'Este tratamiento ya está asociada a este servicio.',
            ], 400);
        }

        // Obtener el último orden
        $lastOrder = ActividadPorServicio::where('tratamiento_id', $validatedData['tratamiento_id'])
                                        ->where('empresa_id', $empresaId)
                                        ->max('orden');

        $newOrder = is_null($lastOrder) ? 1 : $lastOrder + 1;

        // Crear la actividad
        $actividad = ActividadPorServicio::create([
            'tratamiento_id' => $validatedData['tratamiento_id'],
            'porcentaje' => $validatedData['activity_percentage'],
            'servicio_id' => $validatedData['actividad_id'],
            'empresa_id' => $empresaId,
            'user_id' => $userId,
            'orden' => $newOrder,
        ]);

        return response()->json([
            'success' => true,
            'activity' => [
                'name' => $actividad->nombre,
                'percentage' => $actividad->porcentaje,
                'order' => $newOrder,
            ],
        ]);
    }

    public function eliminarActividad(Request $request)
    {
        $actividadId = $request->input('actividad_id');

        // Buscar la actividad por el ID y eliminarla
        $actividad = ActividadPorServicio::find($actividadId);

        if ($actividad) {
            $actividad->delete();
            return response()->json(['success' => true]);
        }

        return response()->json(['success' => false], 500);
    }
    public function getActivitiesByService($tratamientoId)
    {
        $empresaId = auth()->user()->empresa_id; // ID de la empresa
        // Obtener las actividades asociadas al servicio, ordenadas por el campo 'orden'
        $actividades = ActividadPorServicio::where('tratamiento_id', $tratamientoId)
                                        ->where('empresa_id', $empresaId)
                                        ->with('servicio') // Obtener el nombre de la actividad relacionada
                                        ->orderBy('orden', 'asc') // Ordenar por el campo 'orden'
                                        ->get();

        return response()->json($actividades);
    }
    public function getProcedimientos($tratamientoId)
    {
        $empresaId = auth()->user()->empresa_id; // ID de la empresa
        // Obtener las actividades asociadas al servicio, ordenadas por el campo 'orden'
        $actividadesPorServicio = ActividadPorServicio::where('tratamiento_id', $tratamientoId)
                                    ->where('empresa_id', $empresaId)
                                    ->with('servicio') // Obtener el nombre de la actividad relacionada
                                    ->orderBy('orden', 'asc') // Ordenar por el campo 'orden'
                                    ->get();

        // Crear un array de procedimientos (servicios) asociados
        $procedimientos = [];
        foreach ($actividadesPorServicio as $actividadPorServicio) {
            $servicio = $actividadPorServicio->servicio;
            if ($servicio) {
                $procedimientos[] = [
                    'id' => $servicio->id,
                    'nombre' => $servicio->nombre
                ];
            }
        }

        // Retornar los procedimientos como respuesta JSON
        return response()->json($procedimientos);
    }

    public function getPrecioBase($tratamientoId)
    {
        $actividad = Actividad::find($tratamientoId);
    
        if ($actividad) {
            return response()->json([
                'precio_base' => $actividad->precio,
                'detalle_pieza' => $actividad->detalle_pieza // Incluir detalle_pieza en la respuesta
            ]);
        }
    
        return response()->json(['error' => 'Tratamiento no encontrado.'], 404);
    }
    
    

    public function moveActivity(Request $request, $id)
    {
        $direction = $request->input('direction'); // up or down

        // Obtener la actividad por su ID en la tabla pivot (actividad_por_servicio)
        $actividadPorServicio = ActividadPorServicio::find($id);

        if (!$actividadPorServicio) {
            return response()->json(['success' => false, 'message' => 'Actividad no encontrada']);
        }

        // Obtener la actividad a la que se quiere cambiar el orden
        $currentOrden = $actividadPorServicio->orden;
        $newOrden = null;

        if ($direction === 'up') {
            // Buscar la actividad anterior en el orden (si no es la primera)
            $neighbor = ActividadPorServicio::where('tratamiento_id', $actividadPorServicio->tratamiento_id)
                ->where('orden', '<', $currentOrden)
                ->orderBy('orden', 'desc') // Encontrar la anterior
                ->first();
            
            if ($neighbor) {
                // Intercambiar los valores de 'orden'
                $newOrden = $neighbor->orden;
                $neighbor->orden = $currentOrden;
                $actividadPorServicio->orden = $newOrden;

                // Guardar ambos cambios
                $neighbor->save();
                $actividadPorServicio->save();

                return response()->json(['success' => true, 'message' => 'Actividad movida hacia arriba']);
            }
        } elseif ($direction === 'down') {
            // Buscar la actividad siguiente en el orden (si no es la última)
            $neighbor = ActividadPorServicio::where('tratamiento_id', $actividadPorServicio->tratamiento_id)
                ->where('orden', '>', $currentOrden)
                ->orderBy('orden', 'asc') // Encontrar la siguiente
                ->first();
            
            if ($neighbor) {
                // Intercambiar los valores de 'orden'
                $newOrden = $neighbor->orden;
                $neighbor->orden = $currentOrden;
                $actividadPorServicio->orden = $newOrden;

                // Guardar ambos cambios
                $neighbor->save();
                $actividadPorServicio->save();

                return response()->json(['success' => true, 'message' => 'Actividad movida hacia abajo']);
            }
        }

        return response()->json(['success' => false, 'message' => 'No se pudo mover la actividad']);
    }
    // Función para cargar actividades
    public function loadActivities($tratamientoId)
    {
        // Obtener las actividades del tratamiento
        $activities = ActividadPorServicio::where('tratamiento_id', $tratamientoId)
            ->orderBy('orden', 'asc')
            ->get();

        // Renderizar la vista parcial con las actividades
        $html = view('partials.activities', compact('activities'))->render();

        // Devolver la respuesta en formato JSON
        return response()->json(['html' => $html]);
    }
    public function obtenerActividades()
    {
        // Obtener el ID de la empresa del usuario autenticado
        $empresa_id = auth()->user()->empresa_id;

        // Obtener las actividades ordenadas por nombre
        $actividades = Actividad::where('empresa_id', $empresa_id)
            ->orderBy('nombre', 'asc') // Ordenar por nombre en orden ascendente
            ->get();

        return response()->json($actividades); // Retornar actividades en formato JSON
    }

}
