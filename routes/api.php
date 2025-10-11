<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Aquí puedes registrar las rutas de la API de tu aplicación. Todas estas
| rutas son cargadas por el RouteServiceProvider dentro del grupo "api"
| middleware. ¡Haz algo grandioso!
|
*/

// Ruta protegida para obtener información del usuario autenticado (Laravel Sanctum)
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

/*
|--------------------------------------------------------------------------
| Health Check
|--------------------------------------------------------------------------
|
| Esta ruta permite verificar el estado del servidor y la conexión con la base
| de datos. Devuelve información básica del entorno, PHP y Laravel.
| Incluye un token opcional para restringir acceso público.
|
*/

Route::get('/health', function (Request $request): JsonResponse {
    // Token opcional para proteger el endpoint
    $token = $request->query('token');
    $expected = env('HEALTH_TOKEN', null);

    if ($expected && $token !== $expected) {
        return response()->json(['status' => 'unauthorized'], 401);
    }

    try {
        // Verificar conexión a la base de datos
        DB::connection()->getPdo();
        $status = DB::select('SELECT NOW() as current_time');

        return response()->json([
            'status' => 'OK',
            'app' => config('app.name'),
            'php_version' => phpversion(),
            'laravel_version' => app()->version(),
            'database' => [
                'connected' => true,
                'time' => $status[0]->current_time ?? null,
            ]
        ], 200);

    } catch (\Exception $e) {
        // Registrar error en el log
        Log::error('Database connection failed: ' . $e->getMessage());

        return response()->json([
            'status' => 'ERROR',
            'message' => 'Database connection failed',
            'error' => $e->getMessage()
        ], 500);
    }
});
