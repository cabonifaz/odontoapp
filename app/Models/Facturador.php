<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Facturador extends Model
{
    use HasFactory;

    // Si el nombre de la tabla no sigue la convención plural de Laravel, especifica el nombre de la tabla
    protected $table = 'facturadores';

    // Si no usas timestamps (created_at, updated_at), puedes desactivar esta funcionalidad
    public $timestamps = false;

    // Define los atributos que pueden ser asignados en masa
    protected $fillable = [
        'empresa_id',
        'ruc',
        'razon_social',
        'nombre_comercial',
        'direccion',
        'usuario_emisor',
        'clave_emisor',
        'ruta_certificado',
        'clave_certificado',
        'ubigeo_dpto',
        'ubigeo_provincia',
        'ubigeo_distrito',
    ];

    // Define la relación con el modelo Empresa (asumiendo que tienes un modelo Empresa)
    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }
}
