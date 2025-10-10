<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Paciente extends Model
{
    use HasFactory;

    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }
// Método para obtener el nombre completo del paciente
    public function getNombreCompletoAttribute()
    {
        return $this->nombres . ' ' . $this->ape_paterno . ' ' . $this->ape_materno;
    }
    public function citas()
    {
        return $this->hasMany(Cita::class, 'id_paciente'); // Asegúrate de usar la clave foránea correcta
    }
    public function tipoDocumento()
    {
        return $this->belongsTo(TipoDocIdentidad::class, 'tipodocumento', 'codigo');
    }

}
