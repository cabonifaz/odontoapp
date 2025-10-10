@extends('adminlte::auth.auth-page', ['auth_type' => 'login'])

@section('auth_header', __('Autenticarse para iniciar sesión'))

@section('auth_body')
    
{{-- Mostrar mensaje de error si las credenciales son incorrectas --}}
    @if ($errors->any())
        <div class="alert alert-danger alert-dismissible fade show" role="alert" style="font-size: 0.9rem; color: #e74c3c; background-color: #f8d7da; border-color: #f5c6cb;">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ __('Usuario o clave inválidos') }}</li>
                @endforeach
            </ul>
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif
<form action="{{ route('login') }}" method="POST">
    @csrf

    {{-- Email field --}}
    <div class="input-group mb-3">
        <input type="email" name="email" class="form-control" placeholder="{{ __('Email') }}" required autofocus>
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-envelope"></span>
            </div>
        </div>
    </div>

    {{-- Password field --}}
    <div class="input-group mb-3">
        <input type="password" name="password" class="form-control" placeholder="{{ __('Password') }}" required>
        <div class="input-group-append">
            <div class="input-group-text">
                <span class="fas fa-lock"></span>
            </div>
        </div>
    </div>

    {{-- Login button --}}
    <div class="row">
        <div class="col-12">
            <button type="submit" class="btn btn-primary btn-block">{{ __('Iniciar Sesión') }}</button>
        </div>
    </div>
</form>

@endsection

@section('auth_footer')

    {{-- Forgot password link --}}
    {{-- 
    <p class="my-0">
        <a href="{{ route('password.request') }}">
            {{ __('Olvidé mi contraseña') }}
        </a>
    </p>
    --}}

    {{-- Register new account link --}}
    <p class="my-0">
        <a href="{{ route('register') }}">
            {{ __('Crear una nueva cuenta') }}
        </a>
    </p>

@endsection
