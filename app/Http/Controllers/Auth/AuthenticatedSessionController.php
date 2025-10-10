<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use App\Models\Empresa; // Asegúrate de importar el modelo de Empresa

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        // Obtener todas las empresas
        $empresas = Empresa::all();

        // Pasar las empresas a la vista de login
        return view('auth.login', ['empresas' => $empresas]);
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(Request $request)
{
    // Validar los campos de email, password y empresa_id
    $request->validate([
        'email' => ['required', 'email'],
        'password' => ['required'],
        
    ]);

    // Autenticar al usuario
    if (Auth::attempt([
        'email' => $request->email,
        'password' => $request->password,
        
    ], $request->filled('remember'))) {
        $request->session()->regenerate();

        return redirect()->intended('/dashboard');
    }

    return back()->withErrors([
        'email' => 'The provided credentials do not match our records.',
    ])->onlyInput('email');
}

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/login');
    }
}
