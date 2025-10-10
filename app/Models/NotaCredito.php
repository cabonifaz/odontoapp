<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NotaCredito extends Model
{
    use HasFactory;

    protected $table = 'nota_credito';

    protected $fillable = [
        'facturacion_id',
        'fecha',
        'tipodoc',
        'serie',
        'numdoc',
        'motivo',
        'estado_sunat',
        'hash_cpe',
        'facturador_id',
        // Otros campos que consideres necesarios
    ];

    // Definir la relación con Facturacion
    public function facturacion()
    {
        return $this->belongsTo(Facturacion::class, 'facturacion_id');
    }
}
