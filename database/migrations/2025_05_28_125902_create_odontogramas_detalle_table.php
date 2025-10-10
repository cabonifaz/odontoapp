<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('odontogramas_detalle', function (Blueprint $table) {
            $table->id();
            $table->foreignId('historia_clinica_id')
                ->constrained('historias_clinicas_v2')
                ->onDelete('cascade');

            $table->string('tipo', 50);                 // Ej: ortodoncia
            $table->string('sigla', 10);                // Ej: AOF, AOR
            $table->string('nombre', 100);              // Nombre descriptivo
            $table->text('descripcion')->nullable();
            $table->text('observaciones')->nullable();

            $table->integer('desde_diente');            // Diente inicial
            $table->integer('hasta_diente');            // Diente final

            $table->float('coordenada_x1');             // Coordenada punto 1
            $table->float('coordenada_y1');
            $table->float('coordenada_x2');             // Coordenada punto 2
            $table->float('coordenada_y2');

            $table->string('color', 20);                // Ej: #FF0000 o 'red'
            $table->enum('accion', ['aplicado', 'eliminado'])->default('aplicado');

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('odontogramas_detalle');
    }
};
