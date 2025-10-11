<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vitaldentis</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

    <!-- Styles -->
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-image: url('{{ asset("img/imgmundosystems.jpg") }}'); /* Cambia la ruta a la imagen de fondo */
            background-size: cover; /* Ajusta la imagen para cubrir toda la página */
            background-position: center; /* Centra la imagen */
            background-repeat: no-repeat; /* Evita que la imagen se repita */
            margin: 0;
            padding: 0;
            color: #333;
        }

        header {
            background-color: rgba(0, 123, 255, 0.8); /* Fondo con transparencia para que se vea el fondo */
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        .welcome-message {
            text-align: center;
            margin-bottom: 40px;
        }

        .welcome-message h1 {
            font-size: 3rem;
            margin-bottom: 10px;
        }

        .welcome-message p {
            font-size: 1.2rem;
        }

        .tech-section {
            display: flex;
            justify-content: space-between; /* Cambiado de space-around a space-between para que las tarjetas estén más cerca */
            flex-wrap: nowrap; /* Asegura que no se envuelvan en una nueva línea */
            margin-top: 40px;
        }

        .tech-card {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            width: 30%; /* Se mantiene el ancho del 30% para cada tarjeta */
            margin: 0; /* Se eliminan los márgenes para evitar espacios adicionales */
            padding: 0; /* Eliminar el padding para hacer que la imagen ocupe todo el espacio */
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            text-align: center;
            height: 300px; /* Asignar una altura fija */
        }

        .tech-card img {
            width: 100%;
            height: 200px; /* Asignar una altura fija para la imagen */
            object-fit: cover; /* Asegura que la imagen cubra el contenedor */
        }

        .tech-card h3 {
            font-size: 1.5rem;
            margin: 10px 0; /* Margen superior e inferior para separación */
        }

        .tech-card p {
            font-size: 1rem;
            color: #555;
            padding: 0 10px; /* Agregar padding lateral para el texto */
        }

        footer {
            background-color: rgba(0, 123, 255, 0.8); /* Fondo con transparencia */
            color: white;
            text-align: center;
            padding: 20px;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
            .tech-section {
                flex-wrap: wrap; /* Cambiar a wrap en pantallas más pequeñas */
            }
            .tech-card {
                width: 100%; /* Cambiar el ancho a 100% en pantallas más pequeñas */
                margin-bottom: 20px; /* Margen inferior para separación entre tarjetas */
            }

            .welcome-message h1 {
                font-size: 2rem;
            }
        }
        header a {
    text-decoration: none; /* Elimina el subrayado */
    color: white; /* Asegúrate de que el color del texto sea blanco */
}

header a:hover {
    color: #e0e0e0; /* Cambia el color al pasar el ratón */
}
.register-link {
    margin-left: 10px; /* Ajusta el tamaño a tu preferencia */
}

    </style>
</head>
<body>

<header style="display: flex; justify-content: space-between; align-items: center; padding: 20px; background-color: rgba(74, 144, 226, 0.8);">
    <h1 style="margin: 0;">Vitaldentis</h1>
    <a href="{{ asset('video/videodemo.mp4') }}" target="_blank">Ver Video Demo</a>
    @if (Route::has('login'))
        <div>
            @auth
                <a href="{{ url('/dashboard') }}" class="font-semibold text-white hover:text-gray-200 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500" style="text-decoration: none;">Panel</a>
            @else
                <a href="{{ route('login') }}" class="font-semibold text-white hover:text-gray-200 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500" style="text-decoration: none;">Ingresar</a>

                @if (Route::has('register'))
                    <a href="{{ route('register') }}" class="ml-4 font-semibold text-white hover:text-gray-200 dark:text-gray-400 dark:hover:text-white focus:outline focus:outline-2 focus:rounded-sm focus:outline-red-500" style="text-decoration: none;">Registrarse</a>
                @endif
            @endauth
        </div>
    @endif
</header>



<div class="container">
    <div class="welcome-message">
        <h1 style="color:white">Bienvenido a la Era de la Tecnología</h1>
        <p style="color:white">Descubre soluciones innovadoras que transforman el futuro digital.</p>
    </div>
   
    <div class="tech-section">
        <!-- Card 1: Desarrollo Web -->
        <div class="tech-card">
            <img src="{{ asset('img/webdevelopment.jpg') }}" alt="Desarrollo Web">
            <h3>Desarrollo Web</h3>
            <p>Aplicaciones y sitios web a medida, utilizando las últimas tecnologías como Laravel, React, y Vue.js.</p>
        </div>

        <!-- Card 2: Seguridad Informática -->
        <div class="tech-card">
            <img src="{{ asset('img/ciberseguridad.jpg') }}" alt="Seguridad Informática">
            <h3>Seguridad Informática</h3>
            <p>Protege tus datos y sistemas con nuestras soluciones avanzadas de ciberseguridad.</p>
        </div>

        <!-- Card 3: Cámaras de Seguridad -->
        <div class="tech-card">
            <img src="{{ asset('img/security-cameras.png') }}" alt="Cámaras de Seguridad">
            <h3>Cámaras de Seguridad</h3>
            <p>Monitorea tus espacios con nuestras avanzadas cámaras de seguridad, ideales para protección y vigilancia.</p>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Geeky Tech. Todos los derechos reservados.</p>
    </footer>
</div>
</body>
</html>
