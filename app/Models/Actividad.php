<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Actividad extends Model
{
    use HasFactory;
    protected $table = 'actividades';  // Especificar el nombre correcto de la tabla

    protected $fillable = [
        'nombre',
        'precio',
        'detalle_pieza',
        'empresa_id',
        'user_id',
    ];

    // Relación con el modelo Empresa
    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }

    // Relación con el modelo User
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function servicios()
    {
        return $this->hasMany(Servicio::class, 'tratamiento_id');
    }

}
