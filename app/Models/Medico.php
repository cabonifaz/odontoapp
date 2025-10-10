<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Carbon;

class Medico extends Model
{
    use HasFactory;
    protected $fillable = [
        'nombre_medico', // Añade todos los campos que necesites de la tabla
        'telefono',
        'cmp',
        'especialidad',
        'email',
        'direccion',
        'fyh_ingreso',
        // No agregues '_token' aquí
    ];
    public function getFyhIngresoFormattedAttribute()
    {
        return Carbon::parse($this->attributes['fyh_ingreso'])->format('d/m/Y');
    }
    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }

}
