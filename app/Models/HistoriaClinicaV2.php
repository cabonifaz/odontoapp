<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HistoriaClinicaV2 extends Model
{
    use HasFactory;

    protected $table = 'historias_clinicas_v2'; // porque la tabla no es el plural automático
    protected $fillable = [
        'paciente_id',
        'version',
        'estado',
        'fecha_registro',
        'tratamiento_medico',
        'medicamentos_actuales',
        'problema_cicatrizacion',
        'transfusion',
        'radio_quimio',
        'reaccion_medicamento',
        'alergia',
        'problema_articulaciones',
        'fumador',
        'toma_alchohol',
        'embarazada',
        'ansiedad',
        'problema_sueno',
        'ultimo_tratamiento',
        'complicacion_tratamiento',
        'sonrisa',
        'restauraciones',
        'dientes_blancos',
        'dolor_masticar',
        'dolor_musculo',
        'mordida_inestable',
        'molestia_masticar',
        'aprieta_dientes',
        'uso_placa',
        'diente_sensible',
        'diente_cavidad',
        'caries',
        'diente_desgaste',
        'usa_hilo',
        'hilo_facil',
        'boca_seca',
        'sangra_encia',
        'trato_encias',
        'problema_aliento',
        'higiene',
        'info_adicional',
        'motivo_consulta',
        'obser_enfermedades',
        'obser_antecedentes',
    ];

    public function paciente()
    {
        return $this->belongsTo(Paciente::class);
    }
    public function enfermedades()
    {
        return $this->hasMany(\App\Models\PacienteEnfermedad::class, 'historia_clinica_id');
    }
    
    public function odontogramasDetalle()
    {
        return $this->hasMany(OdontogramaDetalle::class, 'historia_clinica_id');
    }

}
