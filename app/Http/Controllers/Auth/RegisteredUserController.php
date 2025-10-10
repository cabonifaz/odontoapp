<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Empresa; // Importamos el modelo Empresa
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(): View
    {
        // Obtener todas las empresas para el select en el formulario
        $empresas = Empresa::all();

        // Pasar las empresas a la vista de registro
        return view('auth.register', compact('empresas'));
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {
        // Validar los datos de registro, incluyendo empresa_id
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'empresa_id' => ['required', 'exists:empresas,id'], // Validamos que empresa_id exista en la tabla empresas
        ]);

        // Crear el nuevo usuario con el ID de la empresa seleccionada
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'empresa_id' => $request->empresa_id, // Guardamos el id de la empresa seleccionada
        ]);

        // Disparar el evento de usuario registrado
        event(new Registered($user));

        // Autenticar al usuario recién creado
        Auth::login($user);

        // Redirigir al usuario a la página de inicio
        return redirect(RouteServiceProvider::HOME);
    }
}
