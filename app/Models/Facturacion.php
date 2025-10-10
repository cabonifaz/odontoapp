<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Facturacion extends Model
{
    use HasFactory;

    protected $table = 'facturaciones';

    protected $fillable = [
        'presupuesto_id',
        'fecha',
        'paciente_id',
        'medico_tratante_id',
        'medico_factura_id',
        'tipodoc',
        'serie',
        'numdoc',
        'subtotal',
        'igv',
        'importe',
        'hash_cpe',
        'estado_sunat',
        'user_id',
        'empresa_id',
        't_doc_iden',
        'num_doc_iden',
        'observaciones',
        'baja',
        'fecha_baja',
        'ident',
        'hash_cpe_baja',
        'medio_pago',
        'facturador_id',
        'mostrar_paciente',
    ];
    protected $casts = [
        'fecha' => 'datetime',
    ];


    // Definir la relación con Cliente
    public function cliente()
    {
        return $this->belongsTo(Cliente::class, 'cliente_id');
    }

    // Definir la relación con Paciente
    public function paciente()
    {
        return $this->belongsTo(Paciente::class, 'paciente_id');
    }
     // Definir la relación con DetalleFacturacion
     public function detalles()
     {
         return $this->hasMany(DetalleFacturacion::class, 'facturaciones_id');
     }
 
     public function medico()
    {
        return $this->belongsTo(Medico::class, 'medico_tratante_id');
    }


}
