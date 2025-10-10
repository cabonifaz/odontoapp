<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Enfermedad extends Model
{
    protected $table = 'enfermedades';
    protected $fillable = ['nombre'];

    public function pacientes()
    {
        return $this->belongsToMany(Paciente::class, 'paciente_enfermedad')
                    ->withPivot(['fecha_diagnostico', 'activo', 'observaciones'])
                    ->withTimestamps();
    }
}
