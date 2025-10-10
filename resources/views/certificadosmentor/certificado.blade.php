<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificado</title>
    <style>
        @page {
            size: landscape;
            margin: 0; /* Eliminar márgenes de la página */
        }
        body {
            font-family: Arial, sans-serif;
            text-align: justify;
            margin: 0; /* Eliminar márgenes del cuerpo */
            padding: 0; /* Eliminar padding del cuerpo */
            position: relative; /* Permitir la posición absoluta del fondo */
            width: 100%; /* Asegurar que el cuerpo ocupe todo el ancho */
            height: 100%; /* Asegurar que el cuerpo ocupe toda la altura */
        }
        .content {
            margin-left: 150px; /* Margen para el texto del certificado */
            margin-right: 150px;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header .left, .header .right {
            display: inline-block;
            vertical-align: middle;
        }
        .header .left {
            float: left;
            width: 120px; /* Aumentar tamaño de logo_minedu */
            height: auto;
            margin-top: 40px; /* Aumentar espacio superior */
            margin-left: 60px; /* Añadir espacio a la izquierda */
        }

        .header .right {
            float: right;
            width: 200px; /* Disminuir tamaño de logo_unp */
            height: auto;
            margin-top: 40px; /* Aumentar espacio superior */
            margin-right: 60px; /* Añadir espacio a la izquierda */
        }

        .centered-title {
            text-align: center;
            width: 100%;
            display: block;
            clear: both;
            margin: 0;
            padding: 0;
        }

        .centered-title b {
            margin: 0; /* Asegúrate de que el margen sea cero */
            padding: 0; /* Asegúrate de que el padding sea cero */
            white-space: nowrap; /* Evita el espacio en blanco adicional */
        }

        h1, h2, h3 {
            font-weight: bold;
            margin: 0;
        }
        h1 {
            font-size: 22px;
        }
        h2 {
            font-size: 24px;
        }
        h3 {
            font-size: 14px;
        }
        p {
            font-size: 8px;
            line-height: 1.6;
            margin: 10px 0;
        }
        
        .signature {
            text-align: center;
            margin-top: 50px;
            white-space: nowrap; /* Evitar que los elementos se rompan en varias líneas */
        }

        .signature div {
            display: inline-block;
            width: 18%; /* Ajustar el ancho para que todas las firmas y logos entren en la misma línea */
            text-align: center;
            vertical-align: top;
            margin: 0 0.5%; /* Espacio entre firmas */
        }

        .signature img {
            width: 120px; /* Tamaño de la firma */
            display: block;
            block;
            position: relative; /* Permite mover la firma sin afectar a otros elementos */
            margin-left: -260px; /* Ajusta este valor según tu necesidad para reducir la separación */
            margin-bottom: -15px;
        }

        .signature p {
            font-size: 12px;
            margin-top: 0; /* Espacio superior */
            margin-bottom: 0; /* Mantiene el texto alineado con la firma */
            margin-left: -245px;
            line-height: 1.2;
        }

        .logo-center {
            display: inline-block; /* Asegurar que los logos estén en línea */
            width: auto;
        }

        .logo-decanato, .logo-pid {
            width: 70px !important; /* Tamaño reducido del logo */
            height: auto;
            display: inline-block; /* Asegurar que los logos estén en línea */
            vertical-align: top;
            margin-top: -8; /* Margen superior */
            margin-right: -220px; /* Margen derecho */
            margin-bottom: 0; /* Margen inferior */
            margin-left: 0; /* Margen izquierdo */
        }


        .spacer {
            width: 100px;
            height: 60px; /* Tamaño de la firma */
            display: inline-block;
        }

        .date {
            text-align: right;
            margin-top: 20px;
            font-size: 14px;
        }

        .background {
            position: absolute;
            top: -5px;
            left: 50%;
            width: 95%; /* Asegurar que el fondo ocupe todo el ancho */
            height: 100%; /* Asegurar que el fondo ocupe toda la altura */
            z-index: -1;
            transform: translateX(-50%); /* Centra el marco horizontalmente */
        }
        .qr-container {
            position: absolute;
            right: 30px; /* Ajusta según necesidad */
            top: 50%;
            transform: translateY(-50%);
            text-align: center;
            background-color: #f8f9fa; /* Fondo gris claro */
            border: 2px solid #d6d6d6; /* Borde gris claro */
            border-radius: 12px; /* Esquinas redondeadas */
            padding: 1px; /* Eliminar espaciado interno */
            display: inline-block; /* Ajuste de tamaño automático */
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1); /* Sombra suave */
        }

        .qr-container img {
            width: 100%; /* Ajusta para ocupar todo el contenedor */
            height: auto;
            margin: 0; /* Eliminar márgenes */
            padding: 0; /* Eliminar padding */
            display: block; /* Asegurar que se comporte como un bloque */
        }

    </style>
</head>
<body>
    <!-- Background -->
    <img src="{{ public_path('img/marco.png') }}" alt="marco" class="background">

    <!-- Header -->
    <div class="header">
        <img src="{{ public_path('img/logo_unp.png') }}" alt="Logo Universidad" class="left">
        <img src="{{ public_path('img/logo_minedu.png') }}" alt="Logo MINEDU" class="right">
    </div>
    <div class="content">
        <!-- Certificado -->
        <p class="centered-title" style="font-size: 32px;"><b>UNIVERSIDAD NACIONAL DE PIURA</b></p>
        <p class="centered-title" style="font-size: 22px; line-height: 1.1;">FACULTAD DE CIENCIAS SOCIALES Y EDUCACION <br>PROGRAMA DE INDUCCION DOCENTE 2024<br>(Convenio N° 039-2024-MINEDU-UNP)</p>
        <p class="centered-title" style="font-size: 24px;"><b>CONSTANCIA</b></p>
        <p class="centered-title" style="font-size: 18px;">Otorgada a:</p>
        <p class="centered-title" style="font-size: 24px;"><b><span class="nombre">{{ $nombre }}</span></b></p>
        <p style="position: relative; top: 5px; font-size: 14px;">
            Por haberse desempeñado como <b>{{ $cargo }} en el “Programa de Inducción Docente 2024”, en virtud al Convenio Interinstitucional N° 039-2024-MINEDU-UNP,</b> suscrito entre la Universidad Nacional de Piura y el Ministerio de Educación, {{ $textofinal }}</p>

        
    </div>
    <!-- Signatures -->
    <div class="signature">
        <!-- Logo PID con posicionamiento personalizado -->
        <div class="logo-center">
            <img src="{{ public_path('img/logo_pid.png') }}" alt="Logo PID" class="logo-pid">
        </div>
        <div>
            <img src="{{ public_path('img/firma2.png') }}" alt="Firma 2">
            <p>
                ____________________________________________<br>
                MGTR. JANET ALCANTARA MASIAS<br>
                JEFE DEL PROGRAMA PID 2024<br>
                UNIVERSIDAD NACIONAL DE PIURA
            </p>
        </div>
        <!-- Logo Decanato con posicionamiento personalizado -->
        <div class="logo-center">
            <img src="{{ public_path('img/logo_decanato.png') }}" alt="Logo Decanato" class="logo-decanato">
        </div>             
        <div>
            <img src="{{ public_path('img/firma1.png') }}" alt="Firma 1">
            <p>
                ______________________________________________________<br>
                DRA. MARGARITA TAVARA ALVARADO<br>
                DECANA FACULTAD DE CIENCIAS SOCIALES Y EDUCACION<br>
                UNIVERSIDAD NACIONAL DE PIURA
            </p>
        </div>
    </div>

    <div class="qr-container">
        <img src="{{ $qr }}" alt="QR Code">
    </div>
</body>
</html>
