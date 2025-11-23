<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class FacturaMail extends Mailable
{
    use Queueable, SerializesModels;

    public $pdfPath;
    public $asunto; // Nueva variable para el título del correo

    // El constructor ahora recibe el asunto. Si no se envía, usa uno por defecto.
    public function __construct($pdfPath, $asunto = 'Comprobante de Pago')
    {
        $this->pdfPath = $pdfPath;
        $this->asunto = $asunto;
    }

    public function build()
    {
        return $this->subject($this->asunto) // Usamos el asunto dinámico aquí
                    ->view('emails.factura')
                    ->attach($this->pdfPath);
    }
}