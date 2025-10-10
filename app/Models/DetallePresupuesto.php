<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DetallePresupuesto extends Model
{
    use HasFactory;

    protected $table = 'detalle_presupuesto';

    protected $fillable = [
        'presupuesto_id',
        'tratamiento_id',
        'precio',
        'cantidad',
        'detalle_pieza',
        'empresa_id',
        'user_id',
    ];

    // Relación con Presupuesto
    public function presupuesto()
    {
        return $this->belongsTo(Presupuesto::class);
    }

    // Relación con Tratamiento
    public function tratamiento()
    {
        return $this->belongsTo(Actividad::class);
    }
    
    public function procedimientos()
    {
        return $this->hasMany(ActividadesPaciente::class, 'detalle_presupuesto_id');
    }
    // Relación con Empresa
    public function empresa()
    {
        return $this->belongsTo(Empresa::class);
    }

    // Relación con User
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
