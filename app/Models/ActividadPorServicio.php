<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActividadPorServicio extends Model
{
    use HasFactory;

    // Especificar la tabla si no sigue la convención de Laravel
    protected $table = 'actividades_por_tratamiento';

    // Definir los campos que se pueden asignar masivamente
    protected $fillable = [
        'tratamiento_id', 'servicio_id', 'porcentaje', 'orden', 'empresa_id', 'user_id'
    ];

    // Relación con el modelo Actividad
    public function actividad()
    {
        return $this->belongsTo(Actividad::class, 'actividad_id');
    }

    // Relación con el modelo Servicio
    public function servicio()
    {
        return $this->belongsTo(Servicio::class, 'servicio_id');
    }

    // Relación con el modelo Empresa
    public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }

    // Relación con el modelo User
    public function usuario()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
}
