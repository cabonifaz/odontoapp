<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMovimientosAlmacenTable extends Migration
{
    public function up()
    {
        Schema::create('movimientos_almacen', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('producto_id');         // Producto afectado
            $table->enum('tipo', ['entrada', 'salida']);        // Tipo de movimiento
            $table->integer('cantidad');                       // Cantidad movida
            $table->decimal('precio_unitario', 10, 2)->nullable(); // Precio referencial (especialmente útil para entradas)
            $table->text('observacion')->nullable();           // Motivo, comentario u origen del movimiento
            $table->date('fecha')->default(now());             // Fecha del movimiento
            $table->unsignedBigInteger('usuario_id');          // Usuario que ejecuta el movimiento
            $table->timestamps();

            // Claves foráneas
            $table->foreign('producto_id')->references('id')->on('productos_almacen')->onDelete('cascade');
            $table->foreign('usuario_id')->references('id')->on('users')->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('movimientos_almacen');
    }
}
