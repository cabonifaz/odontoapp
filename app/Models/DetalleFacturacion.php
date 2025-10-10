<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetalleFacturacion extends Model
{
    use HasFactory;
    protected $table = 'detalle_facturacion';
    protected $fillable = [
        'facturaciones_id',
        'tratamiento_id',
        'procedimiento_id',
        'importe',
    ];

    public function facturacion()
    {
        return $this->belongsTo(Facturacion::class, 'facturaciones_id');
    }

    public function tratamiento()
    {
        return $this->belongsTo(Actividad::class, 'tratamiento_id');
    }

    public function procedimiento()
    {
        return $this->belongsTo(Servicio::class, 'procedimiento_id');
    }
}
