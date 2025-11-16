<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Vitaldentis</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <!-- Styles -->
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
            --primary-light: #3b82f6;
            --secondary: #0f172a;
            --accent: #06b6d4;
            --text-dark: #1e293b;
            --text-light: #64748b;
            --bg-light: #f8fafc;
            --white: #ffffff;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            background-attachment: fixed;
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Header Moderno */
        header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            padding: 1.5rem 2rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        header h1 {
            font-size: 1.75rem;
            font-weight: 700;
            background: linear-gradient(135deg, var(--primary), var(--accent));
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .nav-links {
            display: flex;
            gap: 1.5rem;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            transition: all 0.3s ease;
            font-size: 0.95rem;
        }

        .nav-links a:hover {
            background: var(--primary);
            color: var(--white);
            transform: translateY(-2px);
        }

        .btn-demo {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: var(--white) !important;
            padding: 0.65rem 1.5rem !important;
            border-radius: 8px;
            font-weight: 600;
            box-shadow: 0 4px 6px -1px rgba(37, 99, 235, 0.3);
        }

        .btn-demo:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 12px -1px rgba(37, 99, 235, 0.4);
        }

        /* Container Principal */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 3rem 2rem;
        }

        /* Hero Section */
        .welcome-message {
            text-align: center;
            margin-bottom: 4rem;
            animation: fadeInUp 0.8s ease;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .welcome-message h1 {
            font-size: 3.5rem;
            font-weight: 700;
            color: var(--white);
            margin-bottom: 1rem;
            text-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            line-height: 1.2;
        }

        .welcome-message p {
            font-size: 1.25rem;
            color: rgba(255, 255, 255, 0.9);
            font-weight: 300;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Tech Cards Section */
        .tech-section {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .tech-card {
            background: var(--white);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            position: relative;
        }

        .tech-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 40px -5px rgba(0, 0, 0, 0.15);
        }

        .tech-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--primary), var(--accent));
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .tech-card:hover::before {
            opacity: 1;
        }

        .tech-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .tech-card:hover img {
            transform: scale(1.05);
        }

        .tech-card-content {
            padding: 1.75rem;
        }

        .tech-card h3 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.75rem;
        }

        .tech-card p {
            font-size: 1rem;
            color: var(--text-light);
            line-height: 1.6;
        }

        /* Footer Moderno */
        footer {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            color: var(--text-dark);
            text-align: center;
            padding: 2rem;
            margin-top: 4rem;
            border-radius: 16px 16px 0 0;
            box-shadow: 0 -4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        footer p {
            font-size: 0.95rem;
            font-weight: 500;
        }

        /* Responsive */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                gap: 1rem;
                padding: 1rem;
            }

            .nav-links {
                flex-wrap: wrap;
                justify-content: center;
                gap: 0.75rem;
            }

            .welcome-message h1 {
                font-size: 2.25rem;
            }

            .welcome-message p {
                font-size: 1.1rem;
            }

            .tech-section {
                grid-template-columns: 1fr;
                gap: 1.5rem;
            }

            .container {
                padding: 2rem 1rem;
            }
        }

        @media (max-width: 480px) {
            .welcome-message h1 {
                font-size: 1.75rem;
            }

            .nav-links a {
                padding: 0.4rem 1rem;
                font-size: 0.9rem;
            }
        }
    </style>
</head>
<body>

<header>
    <h1>Vitaldentis</h1>
    <div class="nav-links">
        <a href="{{ asset('video/videodemo.mp4') }}" target="_blank" class="btn-demo">Ver Video Demo</a>
        @if (Route::has('login'))
            @auth
                <a href="{{ url('/dashboard') }}">Panel</a>
            @else
                <a href="{{ route('login') }}">Ingresar</a>
                @if (Route::has('register'))
                    <a href="{{ route('register') }}">Registrarse</a>
                @endif
            @endauth
        @endif
    </div>
</header>

<div class="container">
    <div class="welcome-message">
        <h1>Bienvenido a la Era de la Tecnología</h1>
        <p>Descubre soluciones innovadoras que transforman el futuro digital.</p>
    </div>
   
    <div class="tech-section">
        <!-- Card 1: Desarrollo Web -->
        <div class="tech-card">
            <img src="{{ asset('img/webdevelopment.jpg') }}" alt="Desarrollo Web">
            <div class="tech-card-content">
                <h3>Desarrollo Web</h3>
                <p>Aplicaciones y sitios web a medida, utilizando las últimas tecnologías como Laravel, React, y Vue.js.</p>
            </div>
        </div>

        <!-- Card 2: Seguridad Informática -->
        <div class="tech-card">
            <img src="{{ asset('img/ciberseguridad.jpg') }}" alt="Seguridad Informática">
            <div class="tech-card-content">
                <h3>Seguridad Informática</h3>
                <p>Protege tus datos y sistemas con nuestras soluciones avanzadas de ciberseguridad.</p>
            </div>
        </div>

        <!-- Card 3: Cámaras de Seguridad -->
        <div class="tech-card">
            <img src="{{ asset('img/security-cameras.png') }}" alt="Cámaras de Seguridad">
            <div class="tech-card-content">
                <h3>Cámaras de Seguridad</h3>
                <p>Monitorea tus espacios con nuestras avanzadas cámaras de seguridad, ideales para protección y vigilancia.</p>
            </div>
        </div>
    </div>

    <footer>
        <p>&copy; 2025 Geeky Tech. Todos los derechos reservados.</p>
    </footer>
</div>
</body>
</html>
