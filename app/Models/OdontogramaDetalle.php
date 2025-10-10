<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class OdontogramaDetalle extends Model
{
    protected $table = 'odontogramas_detalle';

    protected $fillable = [
        'historia_clinica_id',
        'tipo',
        'sigla',
        'nombre',
        'descripcion',
        'observaciones',
        'desde_diente',
        'hasta_diente',
        'coordenada_x1',
        'coordenada_y1',
        'coordenada_x2',
        'coordenada_y2',
        'texto_x',
        'texto_y',
        'color',
        'accion',
    ];

    // Relación con historia clínica
    public function historiaClinica()
    {
        return $this->belongsTo(HistoriaClinicaV2::class, 'historia_clinica_id');
    }
}
