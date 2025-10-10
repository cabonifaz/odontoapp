<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Student extends Model
{
    use HasFactory;

    // Nombre de la tabla
    protected $table = 'students';

    public $timestamps = false; // Desactiva las marcas de tiempo

    // Campos permitidos para asignación masiva
    protected $fillable = [
        'dni',
        'nombre',
        'archivo',
        'cod_mod',
        'rubrica_fin',
        
    ];
}
