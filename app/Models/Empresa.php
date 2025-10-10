<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Empresa extends Model
{
    use HasFactory;
    // Define los atributos que se pueden asignar masivamente
    protected $fillable = [
        'nombre_empresa',
        'ruc',
        'telefono',
        'direccion',
        'email',
        'nombre_contacto',
        // Agrega más campos aquí según sea necesario
    ];
}
