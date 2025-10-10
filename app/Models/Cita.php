<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Cita extends Model
{
    use HasFactory;

    protected $table = 'citas';
    // Los campos que se pueden asignar en masa
    protected $fillable = [
        'id_medico',
        'id_paciente',
        'fecha_cita',
        'hora_inicio',
        'hora_fin',
        'id_servicio',
        'precio',
        'precio_final',
        'condicion',
        'presupuesto_id',
        'tratamiento_id',
        'estado',
        'empresa_id', // Añadir estos campos
        'user_id'
    ];

    public function medico()
    {
        return $this->belongsTo(Medico::class, 'id_medico');
    }

    public function paciente()
    {
        return $this->belongsTo(Paciente::class, 'id_paciente');
    }

    public function servicio()
    {
        return $this->belongsTo(Servicio::class, 'id_servicio');
    }
    
    public function presupuesto()
    {
        return $this->belongsTo(Presupuesto::class, 'presupuesto_id');
    }

}
