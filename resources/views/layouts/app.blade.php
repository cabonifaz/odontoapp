<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Mundo System') }}</title>
    <link rel="icon" href="{{ asset('img/logo1.ico') }}" type="image/x-icon"> <!-- Cambia la ruta según donde hayas subido el icono -->
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />

    <!-- Scripts -->
    @vite(['resources/css/app.css', 'resources/js/app.js'])
    <link rel="stylesheet" href="{{ asset('css/custom.css') }}">

</head>
<body class="font-sans antialiased">
    <div class="min-h-screen bg-gray-100 dark:bg-gray-900 flex">
        <!-- Sidebar -->
        <div class="w-54  bg-gray-800 text-white flex-shrink-0">
            <div class="p-4">
                <h2 class="text-xl font-bold mb-4">{{ config('app.name', 'Mundo Systemas') }}</h2>
                <nav x-data="{ open: true, settingsOpen: false }" class="bg-gray-800 text-white h-screen transition-all duration-300" :class="open ? 'w-54' : 'w-20'">
    <!-- Botón tipo "hamburguesa" para colapsar el menú -->
    <div class="flex items-center justify-between px-4 py-4">
        <button @click="open = !open" class="text-gray-300 focus:outline-none">
            <!-- Icono tipo "hamburguesa" -->
            <svg class="w-8 h-8" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16m-7 6h7" />
            </svg>
        </button>
        <span x-show="open" class="text-lg font-semibold">Menú</span>
    </div>

    <!-- Elementos del menú -->
    <ul class="space-y-2">
        <!-- Menú Inicio -->
        <li class="mb-2">
            <a href="{{ route('home') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                <svg class="w-6 h-6 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7m-7-7v18" />
                </svg>
                <span x-show="open" class="transition-all duration-300">Inicio</span>
            </a>
        </li>

        <!-- Menú Perfil -->
        <li class="mb-2">
            <a href="{{ route('profile.edit') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                <svg class="w-6 h-6 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5.121 13.121A4 4 0 016 12V6a4 4 0 118 0v6a4 4 0 01.879 1.121l-4.879 4.879-4.879-4.879z" />
                </svg>
                <span x-show="open" class="transition-all duration-300">Perfil</span>
            </a>
        </li>

        @can('Configurar')
        <!-- Menú Configuraciones -->
        <li class="mb-2">
            <button @click="settingsOpen = !settingsOpen" class="flex items-center w-full px-2 py-2 hover:bg-gray-700 rounded focus:outline-none">
                <svg class="w-6 h-6 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 6.379V4h2v2.379a2 2 0 011.707 1.706L17.5 9h2v2h-2.293l-.707.707a2 2 0 011.293 1.707V15h-2.293l-1.207 1.207A2 2 0 0112 17.293V20h-2v-2.707a2 2 0 01-1.707-1.293L6.5 15H4v-2h2.379L8.086 11H5v-2h3.086l1.707-1.707A2 2 0 0111 6.379z" />
                </svg>
                <span x-show="open" class="transition-all duration-300">Configuraciones</span>
            </button>

            <!-- Submenú colapsable para Configuraciones -->
            <ul x-show="settingsOpen" class="pl-4 mt-2 space-y-2 transition-all duration-300">
                <li>
                    <a href="{{ route('asignar.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                        </svg>
                        <span class="ml-2">Usuarios</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('roles.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a6 6 0 11-12 0 6 6 0 0112 0z" />
                        </svg>
                        <span class="ml-2">Roles</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('permisos.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a6 6 0 11-12 0 6 6 0 0112 0z" />
                        </svg>
                        <span class="ml-2">Permisos</span>
                    </a>
                </li>
            </ul>
        </li>
        @endcan
        <!-- Menú de Gestión de Usuarios -->
        <li class="mb-2">
            <button @click="open = !open" class="flex items-center w-full px-2 py-2 hover:bg-gray-700 rounded focus:outline-none">
                <svg class="w-6 h-6 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2-2-2-2m-6 8h8a4 4 0 001 7.58V20a2 2 0 01-2-2v-2m0-4H9a4 4 0 000-8v0h6" />
                </svg>
                <span x-show="open" class="transition-all duration-300">Gestión Usuarios</span>
            </button>

            <!-- Submenú colapsable -->
            <ul x-show="open" class="pl-4 mt-2 space-y-2 transition-all duration-300">
                <li>
                    <a href="{{ route('medicos.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 13l4 4L19 7" />
                        </svg>
                        <span class="ml-2">Médicos</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('pacientes.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a6 6 0 11-12 0 6 6 0 0112 0z" />
                        </svg>
                        <span class="ml-2">Pacientes</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('servicios.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a6 6 0 11-12 0 6 6 0 0112 0z" />
                        </svg>
                        <span class="ml-2">Servicios</span>
                    </a>
                </li>
                <li>
                    <a href="{{ route('citas.index') }}" class="flex items-center px-2 py-2 hover:bg-gray-700 rounded">
                        <svg class="w-5 h-5 text-gray-400 mr-4" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a6 6 0 11-12 0 6 6 0 0112 0z" />
                        </svg>
                        <span class="ml-2">Programación de Citas</span>
                    </a>
                </li>
            </ul>
        </li>
            </ul>
        </li>
    </ul>
</nav>


            </div>
        </div>

        <!-- Main content -->
        <div class="flex-1">
            <!-- Navigation Bar -->
            @include('layouts.navigation')

            <!-- Page Heading -->
            @if (isset($header))
                <header class="bg-white dark:bg-gray-800 shadow">
                    <div class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
                        {{ $header }}
                    </div>
                </header>
            @endif

            <!-- Page Content -->
            <main>
                {{ $slot }}
            </main>
        </div>
    </div>
</body>
</html>
