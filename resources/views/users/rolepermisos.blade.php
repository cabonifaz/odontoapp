@extends('adminlte::page')

@section('title', 'Usuarios y Roles')
@section('content_header')
    <div class="card-header">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <!-- Title on the left -->
            <h2 class="m-0">Asignar Roles</h2>
            
        </div>
    </div>
@stop

@section('content')

    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">{{ $role->name }}</h3>
                    </div>
                    <div class="card-body">
                    <h5>Lista de Permisos</h5>
                    <form action="{{ route('roles.update', $role->id) }}" method="POST">
                        @csrf
                        @method('PUT')

                        @foreach ($permisos as $permiso)
                            <div class="form-check">
                                <input 
                                    type="checkbox" 
                                    name="permisos[]" 
                                    value="{{ $permiso->id }}" 
                                    class="form-check-input"
                                    {{ $role->hasPermissionTo($permiso->id) ? 'checked' : '' }}
                                >
                                <label class="form-check-label">
                                    {{ $permiso->name }}
                                </label>
                            </div>
                        @endforeach
                        
                        <button type="submit" class="btn btn-primary mt-3">Asignar Permiso</button>
                    </form>
                </div>

                </div>
            </div>
        </div>
    </div>
    
@stop
