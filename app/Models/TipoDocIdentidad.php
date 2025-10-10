<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TipoDocIdentidad extends Model
{
    use HasFactory;

    // Nombre de la tabla
    protected $table = 'tipo_doc_identidad';

    // Deshabilitar timestamps si no existen en la tabla
    public $timestamps = false;

    // Campos asignables en operaciones masivas
    protected $fillable = ['codigo', 'abrev', 'descripcion'];
}
