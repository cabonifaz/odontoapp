{{-- resources/views/hash_password.blade.php --}}
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Generar hash BCRYPT</title>
    <style>
        body { font-family: Arial, Helvetica, sans-serif; padding: 20px; }
        .box { max-width:700px; margin:0 auto; padding:20px; border:1px solid #e1e1e1; border-radius:8px; }
        pre { background:#f7f7f7; padding:12px; border-radius:6px; overflow-x:auto; }
        label, input, button { display:block; width:100%; margin-top:8px; }
        input { padding:8px; font-size:1rem; }
        button { margin-top:12px; padding:10px; font-size:1rem; cursor:pointer; }
        .note { color:#666; font-size:0.9rem; margin-top:10px; }
    </style>
</head>
<body>
    <div class="box">
        <h2>Generar hash (BCRYPT)</h2>

        {{-- OPCIÓN 1: Clave en plano definida en el archivo (tal como solicitaste) --}}
        @php
            // -> Cambia aquí la clave en plano que necesites hashear:
            $newPassword = "pass123";

            // Genera el hash con BCRYPT
            $hashedPassword = password_hash($newPassword, PASSWORD_BCRYPT);
        @endphp

        <p><strong>Clave en plano (en este archivo):</strong></p>
        <pre>{{ $newPassword }}</pre>

        <p><strong>Hash generado (password_hash, BCRYPT):</strong></p>
        <pre>{{ $hashedPassword }}</pre>

        <hr>

        {{-- OPCIÓN 2: Forma más segura — ingresar la clave desde un formulario (evita hardcode) --}}
        <form method="POST" action="{{ url('/hash-password') }}">
            @csrf
            <label for="pwd">Ingresar clave para hashear (form):</label>
            <input id="pwd" name="password" type="password" placeholder="Escribe la clave aquí">
            <button type="submit">Generar hash</button>
        </form>

        @if(session('hashed_from_form'))
            <p class="note"><strong>Hash result (from form):</strong></p>
            <pre>{{ session('hashed_from_form') }}</pre>
        @endif

        <p class="note">
            Nota: tener la clave en plano en archivos del proyecto no es recomendable en repositorios. 
            Para entornos reales usa variables de entorno, inputs seguros o un endpoint autenticado.
        </p>
    </div>
</body>
</html>
