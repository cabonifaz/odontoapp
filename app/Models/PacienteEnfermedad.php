<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PacienteEnfermedad extends Model
{
    protected $table = 'paciente_enfermedad';

    protected $fillable = [
        'paciente_id',
        'enfermedad_id',
        'fecha_diagnostico',
        'activo',
        'observaciones'
    ];

    public function paciente()
    {
        return $this->belongsTo(Paciente::class);
    }

    public function enfermedad()
    {
        return $this->belongsTo(Enfermedad::class);
    }
    public function historiaClinica()
    {
        return $this->belongsTo(HistoriaClinicaV2::class, 'historia_clinica_id');
    }
}
