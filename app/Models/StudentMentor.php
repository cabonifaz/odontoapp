<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StudentMentor extends Model
{
    use HasFactory;

    // Nombre de la tabla
    protected $table = 'students1';

    public $timestamps = false; // Desactiva las marcas de tiempo

    // Campos permitidos para asignación masiva
    protected $fillable = [
        'dni',
        'nombre',
        'archivo',    
    ];
}
