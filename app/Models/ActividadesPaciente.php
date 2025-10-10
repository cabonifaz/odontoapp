<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ActividadesPaciente extends Model
{
    use HasFactory;

    // Nombre de la tabla
    protected $table = 'actividades_paciente';

    // Campos que son asignables de forma masiva
    protected $fillable = [
        'detalle_presupuesto_id',
        'servicio_id',
        'medico_id',
        'fecha',
        'hora_inicio',
        'hora_fin',
        'estado',
        'user_id',
        'empresa_id',
    ];

    // Relación con la tabla 'citas'

    // Relación con la tabla 'actividades'
    public function actividad()
    {
        return $this->belongsTo(Actividad::class, 'actividad_id');
    }

    // Relación con la tabla 'users'
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    // Relación con la tabla 'empresas'
    public function empresa()
    {
        return $this->belongsTo(Empresa::class, 'empresa_id');
    }
    public function servicio()
    {
        return $this->belongsTo(Servicio::class, 'servicio_id');
    }
}
