<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Parametro extends Model
{
    use HasFactory;

    // Si el nombre de la tabla no sigue la convención de nombres de Laravel
    protected $table = 'parametros';

    // Otros atributos del modelo
    protected $fillable = [
        'tipodoc',
        'serie',
        // otros campos relevantes
    ];
}
