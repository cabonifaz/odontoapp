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

Route::get('/ping', function () {
    return response()->json(['pong' => true], 200);
});

/*
|--------------------------------------------------------------------------
| Health Check
|--------------------------------------------------------------------------
|
| Verifica el estado general del servidor y la conexión a la base de datos.
| - Railway puede acceder sin token (IPs 100.64.x.x)
| - Accesos externos requieren HEALTH_TOKEN en la query (?token=XYZ)
|
*/

Route::get('/health', function (Request $request): JsonResponse {
    $ip = $request->ip();
    $token = $request->query('token');
    $expected = env('HEALTH_TOKEN', null);

    // Detectar si la IP pertenece a Railway (100.64.x.x) o localhost
    $isRailway = str_starts_with($ip, '100.64.') || $ip === '127.0.0.1';

    if ($expected && !$isRailway && $token !== $expected) {
        return response()->json(['status' => 'unauthorized'], 401);
    }

    try {
        // Probar conexión a la base de datos
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
        // Registrar error y devolver detalles
        Log::error('Health Check DB connection failed: ' . $e->getMessage());

        return response()->json([
            'status' => 'ERROR',
            'message' => 'Database connection failed',
            'error' => $e->getMessage(),
        ], 500);
    }
});
