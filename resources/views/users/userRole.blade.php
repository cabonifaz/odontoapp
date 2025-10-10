@extends('adminlte::page')

@section('title', 'Usuarios y Roles')

@section('content')

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">{{ $user->name }}</h3>
                    </div>
                    <div class="card-body">
                    <h5>Lista de Roles</h5>
                    <form action="{{ route('asignar.update', $user->id) }}" method="POST">
                        @csrf
                        @method('PUT')

                        @foreach ($roles as $role)
                            <div class="form-check">
                                <input 
                                    type="checkbox" 
                                    name="roles[]" 
                                    value="{{ $role->id }}" 
                                    class="form-check-input"
                                    {{ $user->hasAnyRole($role->id) ? 'checked' : '' }}
                                >
                                <label class="form-check-label">
                                    {{ $role->name }}
                                </label>
                            </div>
                        @endforeach
                        
                        <button type="submit" class="btn btn-primary mt-3">Asignar Roles</button>
                    </form>
                </div>

                </div>
            </div>
        </div>
    </div>

@stop
