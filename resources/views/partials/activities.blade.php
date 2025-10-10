@foreach ($activities as $activity)
    <tr>
        <td>{{ $activity->name }}</td>
        <td>{{ $activity->description }}</td>
        <td>
            <!-- Añade los botones o acciones que necesites para cada actividad -->
            <button onclick="moveActivity({{ $activity->id }}, 'up')">Mover Arriba</button>
            <button onclick="moveActivity({{ $activity->id }}, 'down')">Mover Abajo</button>
        </td>
    </tr>
@endforeach
