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
| Aquí puedes registrar las rutas de la API de tu aplicación.
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


// === HEALTH CHECK CON DEBUG DETALLADO ===
Route::get('/health', function (Request $request): JsonResponse {

    // Mostrar variables de entorno que Laravel está leyendo
    $env = [
        'DB_CONNECTION' => env('DB_CONNECTION'),
        'DB_HOST'       => env('DB_HOST'),
        'DB_PORT'       => env('DB_PORT'),
        'DB_DATABASE'   => env('DB_DATABASE'),
        'DB_USERNAME'   => env('DB_USERNAME'),
        'DB_PASSWORD'   => env('DB_PASSWORD'),
        'APP_ENV'       => env('APP_ENV'),
        'APP_DEBUG'     => env('APP_DEBUG'),
    ];

    try {
        // Forzar intento de conexión
        $pdo = DB::connection()->getPdo();
        $status = DB::select('SELECT NOW() AS `current_time`');

        return response()->json([
            'status' => 'OK',
            'app' => env('APP_NAME'),
            'php_version' => PHP_VERSION,
            'laravel_version' => app()->version(),
            'database' => [
                'connected' => true,
                'time' => $status[0]->current_time ?? null,
            ],
            'env' => $env,
        ], 200);
    } catch (\Exception $e) {
        Log::error('DB Connection Failed: ' . $e->getMessage());
        return response()->json([
            'status' => 'ERROR',
            'message' => 'Database connection failed',
            'error' => $e->getMessage(),
            'env' => $env,
        ], 500);
    }
});
