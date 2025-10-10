<?php
namespace App\Mail;
use Illuminate\Mail\Mailable;

class FacturaMail extends Mailable
{
    public $pdfPath;

    public function __construct($pdfPath)
    {
        $this->pdfPath = $pdfPath;
    }

    public function build()
    {
        return $this->subject('Factura Electrónica')
            ->view('emails.factura')
            ->attach($this->pdfPath);
    }
}
