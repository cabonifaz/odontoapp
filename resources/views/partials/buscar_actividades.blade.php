<!-- resources/views/partials/buscar_actividades.blade.php -->
@foreach($actividades as $actividad)
    <li class="list-group-item" onclick="selectActivity('{{ $actividad->nombre }}')">
        {{ $actividad->nombre }}
    </li>
@endforeach
