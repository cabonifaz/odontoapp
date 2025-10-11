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
    // Permitir acceso sin token desde Railway (su IP interna)
    $ip = $request->ip();
    $token = $request->query('token');
    $expected = env('HEALTH_TOKEN', null);

    // Lista de IPs internas de Railway
    $railwayIps = ['100.64.0.0/10', '127.0.0.1'];

    // Función para validar IP dentro del rango (simple)
    $isRailway = str_starts_with($ip, '100.64.') || $ip === '127.0.0.1';

    if ($expected && !$isRailway && $token !== $expected) {
        return response()->json(['status' => 'unauthorized'], 401);
    }

    try {
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
        return response()->json([
            'status' => 'ERROR',
            'message' => 'Database connection failed',
            'error' => $e->getMessage()
        ], 500);
    }
});

