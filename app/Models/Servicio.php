<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Servicio extends Model
{
    use HasFactory;
    protected $table = 'servicios'; // Ajusta el nombre de la tabla si es necesario
    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }

    public function actividad()
    {
        return $this->belongsTo(Actividad::class, 'tratamiento_id');
    }

}
