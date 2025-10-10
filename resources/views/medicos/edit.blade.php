{{-- resources/views/medicos/edit.blade.php --}}

<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Editar Médico') }}
        </h2>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 text-gray-900 dark:text-gray-100">
                    <form method="POST" action="{{ route('medicos.update', $medico->id) }}">
                        @csrf
                        @method('PUT')

                        <!-- Nombre del Médico -->
                        <div class="mb-4">
                            <label for="nombre_medico" class="block text-sm font-medium text-gray-700 dark:text-gray-300">{{ __('Nombre del Médico') }}</label>
                            <input type="text" name="nombre_medico" id="nombre_medico" value="{{ old('nombre_medico', $medico->nombre_medico) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" style="width: 500px;" required>
                        </div>

                        <!-- CMP -->
                        <div class="mb-4">
                            <label for="cmp" class="block text-sm font-medium text-gray-700 dark:text-gray-300">{{ __('CMP') }}</label>
                            <input type="text" name="cmp" id="cmp" value="{{ old('cmp', $medico->cmp) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" style="width: 200px;" required>
                        </div>

                        <!-- Teléfono -->
                        <div class="mb-4">
                            <label for="telefono" class="block text-sm font-medium text-gray-700 dark:text-gray-300">{{ __('Teléfono') }}</label>
                            <input type="text" name="telefono" id="telefono" value="{{ old('telefono', $medico->telefono) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" style="width: 200px;">
                        </div>

                        <!-- Dirección -->
                        <div class="mb-4">
                            <label for="direccion" class="block text-sm font-medium text-gray-700 dark:text-gray-300">{{ __('Dirección') }}</label>
                            <input type="text" name="direccion" id="direccion" value="{{ old('direccion', $medico->direccion) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" style="width: 500px;" required>
                        </div>

                        <!-- Fecha de Ingreso -->
                        <div class="mb-4">
                            <label for="fyh_ingreso" class="block text-sm font-medium text-gray-700 dark:text-gray-300">{{ __('Fecha de Ingreso') }}</label>
                            <input type="datetime-local" name="fyh_ingreso" id="fyh_ingreso" value="{{ old('fyh_ingreso', \Carbon\Carbon::parse($medico->fyh_ingreso)->format('Y-m-d\TH:i')) }}" class="mt-1 block w-full rounded-md border-gray-300 shadow-sm dark:bg-gray-700 dark:border-gray-600 dark:text-white" style="width: 200px;" required>
                        </div>


                        <div class="flex items-center justify-end">
                            <x-primary-button class="ml-4">
                                {{ __('Actualizar Médico') }}
                            </x-primary-button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
