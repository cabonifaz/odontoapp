<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificado</title>
    <style>
        @font-face {
            font-family: 'Calibri';
            src: url('{{ storage_path('fonts/calibri.ttf') }}') format('truetype');
        }

        @font-face {
            font-family: 'Arial';
            src: url('{{ storage_path('fonts/arial.ttf') }}') format('truetype');
        }


        @page {
            size: landscape;
        }
        body {
            
            text-align: justify;
        }
        .content {
            margin-left: 180px; /* Margen para el texto del certificado */
            margin-right: 180px;
            margin-top: 130px;
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
            width: 200px; /* Aumentar tamaño de logo_minedu */
            height: auto;
            margin-top: 20px; /* Aumentar espacio superior */
            margin-left: 80px; /* Añadir espacio a la izquierda */
            
        }

        .header .right {
            float: right;
            width: 120px; /* Disminuir tamaño de logo_unp */
            height: auto;
            margin-top: 20px; /* Aumentar espacio superior */
            margin-right: 80px; /* Añadir espacio a la izquierda */
        }


        .centered-title {
            text-align: center;
            width: 100%;
            display: block;
            clear: both;
        }
        h1, h2, h3 {
            font-weight: bold;
            margin: 0;
        }
        h1 {
            font-size: 22px;
        }
        h2 {
            font-family: Arial;
            font-weight: bold;
            font-size: 16px;
            text-align: center; /* Centramos el texto */
            margin: 0; /* Eliminamos márgenes por defecto */
        }


        h3 {
            font-size: 14px;
        }
        p {
            
            line-height: 1.2;
            margin: 10px 0;
        }
        

        .logo-center {
            position: relative; /* Permite posicionar el logo PID */
            width: auto;
        }

        .logo-pid {
            width: 70px !important; /* Tamaño reducido del logo */
            height: auto;
            position: absolute; /* Posicionamiento absoluto respecto a su contenedor */
            bottom: 125px; /* Mover hacia abajo */
            right: auto; /* Eliminar la restricción de la derecha */
            left: 75px; /* Mover hacia la izquierda */
        }
        .logo_reverso-pid {
            width: 70px !important; /* Tamaño reducido del logo */
            height: auto;
            position: absolute; /* Posicionamiento absoluto respecto a su contenedor */
            bottom: -30px; /* Mover hacia abajo */
            right: auto; /* Eliminar la restricción de la derecha */
            left: -125px; /* Mover hacia la izquierda */
        }
        .signature {
            text-align: center;
            margin-top: 50px;
            display: flex;
            justify-content: center; /* Centrar horizontalmente los elementos */
            align-items: flex-start; /* Alinear los elementos en la parte superior */
            gap: 20px; /* Espacio entre las secciones */
            position: relative; /* Permite posicionar elementos hijos */
        }

        .signature div {
            display: inline-block;
            width: auto; /* Ajustar automáticamente según el contenido */
            text-align: center;
            vertical-align: top;
        }

        .signature img {
            width: 120px; /* Tamaño de la firma */
            display: block;
            
            margin-top: 1px;
        }

        .signature p {
            font-size: 12px;
            margin: 0; /* Eliminar espacio entre el texto y la firma */
            line-height: 1.2; /* Reducir el espaciado entre líneas */
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
        .page-break {
            page-break-before: always;
        }
        .competencias {
            text-align: center;
            margin-top: 20px;
            font-size: 10px; /* Tamaño de letra ajustado */
        }

        .competencias h2 {
            margin-bottom: 10px;
            margin-top: 1px;
        }

        .competencias table {
            width: 50%; /* Disminuir el ancho de la tabla */
            margin-left: auto; /* Centramos la tabla */
            margin-right: auto; /* Centramos la tabla */
            border-collapse: collapse;
            font-size: 10px;
        }

        .competencias th, .competencias td {
            width: 50%; /* Asegurar que las columnas tengan el mismo ancho */
            border: 1px solid #000;
            padding: 5px; /* Ajustar padding para mayor legibilidad */
            vertical-align: middle;
            text-align: left; /* Alinear el texto a la izquierda */
        }

        .competencias .empty-cell {
            background-color: #bfbfbf; /* Color plomo (gris) para las celdas vacías */
        }


        .background {
            position: absolute;
            top: -10px; /* Mueve hacia abajo si el marco queda muy arriba */
            left: 50%; /* Posiciona el marco desde el centro */
            width: 95%; /* Ajusta el ancho del marco */
            height: 105%; /* Mantén o ajusta la altura */
            z-index: -1; /* Asegura que el marco esté detrás */
            transform: translateX(-50%); /* Centra el marco horizontalmente */
        }


        .content_reverso {
            display: block; /* Asegura que el contenedor principal sea un bloque */
            text-align: center; /* Centramos el contenido */
            margin-top: 140px; /* Mantener la altura del margen superior */
            margin-bottom: 10px;
            margin-left: 120px; /* Centramos el contenido horizontalmente */
            margin-right: auto;
            width: 90%; /* Ajustar el ancho total del contenedor */
            font-size: 14px !important;
            
        }
        /* Estilo específico para los elementos p dentro de content_reverso */
        .content_reverso p {
            margin-bottom: 0;
            margin-top: 0;
            font-size: 10px; /* Tamaño de fuente específico para content_reverso */
        }

        .content_reverso .col-4 {
            display: inline-block; /* Asegura que los elementos estén en una fila */
            width: 30%; /* Ajusta el ancho según sea necesario */
            vertical-align: top; /* Asegura alineación en la parte superior */
            text-align: left; /* Alineación predeterminada */
            margin: 0 0.5%; /* Espaciado horizontal entre columnas */
            box-sizing: border-box; /* Incluye padding dentro del ancho */
            line-height: 0; /* Elimina el espacio entre líneas */
            
        }

        .content_reverso .col-4:nth-child(2) {
            text-align: left; /* Alineación para la columna del medio */
        }

        .content_reverso .col-4:nth-child(3) {
            text-align: left; /* Alineación para la última columna */
        }

        /* Estilo general para el signature de la página 2 */
        .signature_reverso {
            text-align: right; /* Alinea el contenido a la derecha */
            margin-top: 10px; /* Ajusta el margen superior según sea necesario */
            margin-right: 30px; /* Margen derecho para posicionar la firma */
            margin-left: 400px; /* Margen derecho para posicionar la firma */
            position: relative; /* Posicionamiento relativo para ajustes finos */
        }

        .signature_reverso p {
            text-align: center; /* Centra el contenido del párrafo */
            font-size: 12px;
            margin: 0; /* Eliminar espacio entre el texto y la firma */
            line-height: 1.2; /* Reducir el espaciado entre líneas */
        }
        .signature_reverso img {
            display: block;
            margin: 0 auto 5px auto; /* Centrar la firma y ajustar el espacio con el texto */            
            position: relative;
            margin-top: -50px; /* Ajusta el margen superior según sea necesario */
            margin-left: 150px; /* Margen derecho para posicionar la firma */
            margin-right: 250px; /* Margen derecho para posicionar la firma */
        }

        .competencias_resultados {
            text-align: left; /* Alinear el contenedor a la izquierda */
            margin-left: 160px; /* Ajusta este valor para alinear más a la derecha */
            font-size: 12px;
        }

        .competencias_resultados table {
            width: auto; /* Ajustar el ancho de la tabla automáticamente */
            border-collapse: collapse; /* Combinar bordes */
            border: 1px solid #000; /* Un solo borde general */
            font-size: 14px;
        }

        .competencias_resultados th, .competencias_resultados td {
            border: 1px solid #000; /* Bordes en filas y columnas */
            padding: 5px; /* Añadir padding para mayor legibilidad */
        }

        .competencias_resultados th {
            text-align: left;
            width: 60%; /* Ancho de la primera columna */
            white-space: nowrap; /* Prevenir el salto de línea */
        }

        .competencias_resultados td {
            text-align: left; /* Alinear el texto a la izquierda en las celdas */
            width: 80%; /* Ancho de la segunda columna un poco más amplio que el texto */
            padding: 5px; /* Añadir padding para mayor legibilidad */
        }

        .competencias_resultados .empty-cell {
            background-color: #bfbfbf; /* Color plomo (gris) para las celdas vacías */
        }

    </style>
</head>
<body>
    <!-- Background -->
    <img src="{{ public_path('img/marco.png') }}" alt="marco" class="background">

    <!-- Header -->
    <div class="header">
        <img src="{{ public_path('img/logo_minedu.png') }}" alt="Logo MINEDU" class="left">
        <img src="{{ public_path('img/logo_unp.png') }}" alt="Logo Universidad" class="right">
    </div>
    <div class="content">
        <!-- Certificado -->
        <p class="centered-title" style="font-family: Arial, sans-serif; font-size: 45px; font-weight: bold; margin: 0;">
            <b>CERTIFICADO</b>
        </p>
        <p class="centered-title" style="font-family: Calibri; font-size: 22px; margin-bottom: 20px;">
            Otorgado a:
        </p>
    
        <p class="centered-title" style="font-family: Arial; font-size: 30px; font-weight: bold;">
            <b>{{ mb_convert_case(mb_strtolower($nombre), MB_CASE_TITLE, "UTF-8") }}</b>
        </p>
        <p style="position: relative; top: 5px; font-family: Arial; font-size: 14px;">Por haber aprobado el “Programa de Inducción Docente”, ejecutado por la Dirección de Formación Docente en Servicio (DIFODS) del Ministerio de Educación y la Universidad Nacional de Piura (UNP), según Convenio N° 039-2024-MINEDU, llevado a cabo desde el 03 de junio hasta el 13 de diciembre de 2024, con un total de 283 horas cronológicas de duración.</p>
        <br>
        <p style="font-family: Arial; font-size: 14px;" class="date">Lima, 27 de diciembre de 2024</p>
    </div>
    <!-- Signatures -->
    <div class="signature">
        <div>
            <div class="spacer"></div>
            <p style="font-family: Arial; font-size: 11px; font-weight: bold;">
                ____________________________________________________<br>
                ISMAEL ENRIQUE MAÑUICO ANGELES<br>
                DIRECTOR<br>
                DIRECCIÓN DE FORMACIÓN DOCENTE EN SERVICIO<br>
                MINISTERIO DE EDUCACIÓN
            </p>
        </div>

        <!-- Logo PID con posicionamiento personalizado -->
        <div class="logo-center">
            <img src="{{ public_path('img/logo_pid.png') }}" alt="Logo PID" class="logo-pid">
        </div>

        <div>
            <img src="{{ public_path('img/firma2.png') }}" alt="Firma 2">
            <p style="font-family: Arial; font-size: 11px; font-weight: bold;">
                __________________________________________________<br>
                JANET ALCANTARA MASIAS<br>
                JEFE DEL PROGRAMA PID 2024<br>
                FACULTAD DE CIENCIAS SOCIALES Y EDUCACIÓN<br>
                UNIVERSIDAD NACIONAL DE PIURA
            </p>
        </div>
    </div>


    <div class="page-break"></div>
    <!-- Background for page 2 -->
    <img src="{{ public_path('img/marco.png') }}" alt="marco" class="background">
    <!-- Header -->
    <div class="header">
        <img src="{{ public_path('img/logo_minedu.png') }}" alt="Logo MINEDU" class="left">
        <img src="{{ public_path('img/logo_unp.png') }}" alt="Logo Universidad" class="right">
    </div>

    <div class="content_reverso">
        <div class="col-4">
            <p style="font-family: Calibri; font-size: 12px;">
                Certificado UNP N.° {{ $certificadoNumero }}
            </p>
            <p style="font-family: Calibri; font-size: 12px;">
                Otorgado a:
                
                    {{ $student->ape_paterno }} {{ $student->ape_materno }} {{ $student->nombres }}
                
            </p>
            <br>
            <p style="font-family: Calibri; font-size: 12px;">IFD - UNIVERSIDAD NACIONAL DE PIURA</p>
        </div>
        <div class="col-4">
            <p style="font-family: Calibri; font-size: 12px; margin: 0;">DNI N.° {{ $student->dni }}</p>
            <p style="font-family: Calibri; font-size: 12px; margin: 0;">Código Modular: {{ '10' . $student->dni }}<</p>
            <p style="font-family: Calibri; font-size: 12px; margin: 0;"Ítem 2 - Región - Piura></p>
        </div>
        <div class="col-4">
            <p style="font-family: Calibri; font-size: 12px; margin: 0;">REGISTRO UNP</p>
            <p style="font-family: Calibri; font-size: 12px; margin: 0;">N.° {{ $certificadoNumero }}-{{ $student->dni }}-2024</p>
        </div>
    </div>

    <div class="competencias">
        <h2>COMPETENCIAS, CAPACIDADES Y DESEMPEÑOS ABORDADOS EN EL PROGRAMA</h2>
        <table>
            <tr>
                <th class="col9">Competencias priorizadas del Marco de Buen Desempeño Docente - MBDD</th>
                <th class="col3">Competencias priorizadas del Diseño Curricular Básico Nacional de Formación Inicial Docente DCBN FID</th>
            </tr>
            <tr>
                <td class="col9">
                    <h3>Competencia 1</h3>
                </td>
                <td class="col3">
                    <h3>Competencia 10</h3>
                </td>
            </tr>
            <tr>
                <td class="col9">
                    <h3>Competencia 2</h3>
                </td>
                <td class="col3">
                    <h3>Competencia 11</h3>
                </td>
            </tr>
            <tr>
                <td class="col9">
                    <h3>Competencia 4</h3>
                </td>
                <td class="col3 empty-cell">
                </td>
            </tr>
            <tr>
                <td class="col9">
                    <h3>Competencia 6</h3>
                </td>
                <td class="col3 empty-cell">
                </td>
            </tr>
            <tr>
                <td class="col9">
                    <h3>Competencia 8</h3>
                </td>
                <td class="col3 empty-cell">
                </td>
            </tr>
        </table>
    </div>

    <!-- Tabla de resultados -->
    <div class="competencias_resultados" style="margin-top: 20px;">
        <table>
            <tr>
                <th>Cursos Virtuales</th>
                <td>Aprobados</td>
            </tr>
            <tr>
                <th>Asesorías a la práctica y GIA</th>
                <td>Cumplidos</td>
            </tr>
            <tr>
                <th>Plan de Desarrollo Profesional</th>
                <td>{{ $student->rubrica_fin }}</td>
            </tr>
        </table>
    </div>
            
    <!-- Signature -->
    <div class="signature_reverso">
        <!-- Logo PID con posicionamiento personalizado -->
        <div class="logo-center">
            <img src="{{ public_path('img/logo_pid.png') }}" alt="Logo PID" class="logo_reverso-pid">
        </div>
        <div>
            <img src="{{ public_path('img/firma3.png') }}" alt="Firma 3">
            <p style="font-family: Arial; font-size: 11px; font-weight: bold; margin: 0;">
                __________________________________________________<br>
                ROSA DOLORES CASTRO TESÉN<br>
                COORDINADORA ACADÉMICA - PID 2024<br>
                FACULTAD DE CIENCIAS SOCIALES Y EDUCACIÓN<br>
                UNIVERSIDAD NACIONAL DE PIURA
            </p>
        </div>
    </div>
</body>
</html>
