<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Editar Empresa') }}
        </h2>
    </x-slot>

    <div class="py-3">
        <div class="max-w-5xl mx-auto sm:px-6 lg:px-8 h-auto">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg h-full">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <form method="POST" action="{{ route('empresas.update', $empresa->id) }}" class="space-y-4">
                        @csrf
                        @method('PUT')

                        <!-- Nombre de la empresa y RUC en una fila -->
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                            <div>
                                <label for="nombre_empresa" class="block text-sm font-medium text-gray-700">Nombre de la Empresa</label>
                                <input type="text" name="nombre_empresa" id="nombre_empresa" value="{{ $empresa->nombre_empresa }}" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required>
                            </div>

                            <div>
                                <label for="ruc" class="block text-sm font-medium text-gray-700">RUC</label>
                                <input type="text" name="ruc" id="ruc" value="{{ $empresa->ruc }}" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required>
                            </div>
                        </div>

                        <!-- Email y Teléfono en una fila -->
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 mb-4">
                            <div>
                                <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                <input type="email" name="email" id="email" value="{{ $empresa->email }}" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required>
                            </div>

                            <div>
                                <label for="telefono" class="block text-sm font-medium text-gray-700">Teléfono</label>
                                <input type="text" name="telefono" id="telefono" value="{{ $empresa->telefono }}" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                            </div>
                        </div>

                        <!-- Nombre de contacto -->
                        <div class="mb-4">
                            <label for="nombre_contacto" class="block text-sm font-medium text-gray-700">Nombre de Contacto</label>
                            <input type="text" name="nombre_contacto" id="nombre_contacto" value="{{ $empresa->nombre_contacto }}" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
                        </div>

                        <!-- Dirección -->
                        <div class="mb-4">
                            <label for="direccion" class="block text-sm font-medium text-gray-700">Dirección</label>
                            <input type="text" name="direccion" id="direccion" value="{{ $empresa->direccion }}" class="mt-1 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md" required>
                        </div>

                        <!-- Botón de guardar -->
                        <div class="flex justify-end">
                            <button type="submit" class="px-4 py-2 bg-blue-600 text-white rounded-md shadow-sm hover:bg-blue-700">
                                Guardar Cambios
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
