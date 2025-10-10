<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductosAlmacenTable extends Migration
{
    public function up()
    {
        Schema::create('productos_almacen', function (Blueprint $table) {
            $table->id();
            $table->string('nombre');
            $table->string('presentacion')->nullable();
            $table->date('fecha_ingreso');
            $table->integer('stock')->default(0);
            $table->integer('stock_minimo')->default(0);
            $table->decimal('precio_compra', 10, 2)->default(0);
            $table->unsignedBigInteger('ultimo_movimiento_id')->nullable();
            $table->unsignedBigInteger('usuario_id'); // referencia al usuario que creó o modificó
            $table->timestamps();

            // Opcional: si tienes tablas relacionadas
            $table->foreign('usuario_id')->references('id')->on('users')->onDelete('cascade');
            
        });
    }

    public function down()
    {
        Schema::dropIfExists('productos_almacen');
    }
}
