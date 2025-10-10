<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MovimientoAlmacen extends Model
{
    use HasFactory;
    protected $table = 'movimientos_almacen';
    protected $fillable = [
        'producto_id',     // ✅ agrega este campo
        'tipo',
        'cantidad',
        'fecha',
        'motivo',
        'usuario_id'
    ];

    public function producto()
    {
        return $this->belongsTo(ProductoAlmacen::class, 'producto_id');
    }
    public function usuario()
    {
        return $this->belongsTo(\App\Models\User::class, 'usuario_id');
    }

}
