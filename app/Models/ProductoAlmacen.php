<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProductoAlmacen extends Model
{
    protected $table = 'productos_almacen';

    protected $fillable = [
        'nombre',
        'presentacion',
        'fecha_ingreso',
        'stock',
        'stock_minimo',
        'precio_compra',
        'ultimo_movimiento_id',
        'usuario_id'
    ];

    public function ultimoMovimiento()
    {
        return $this->belongsTo(MovimientoAlmacen::class, 'ultimo_movimiento_id');
    }

    public function movimientos()
    {
        return $this->hasMany(MovimientoAlmacen::class, 'producto_id');
    }

    public function usuario()
    {
        return $this->belongsTo(User::class, 'usuario_id');
    }
}
