<?php
// app/Http/Controllers/ApiController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\StudentMentor;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Mail;
use App\Mail\CertificadoEmail;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use DateTime;
use BaconQrCode\Renderer\RendererStyle\RendererStyle;
use BaconQrCode\Renderer\ImageRenderer;
use BaconQrCode\Writer;
use BaconQrCode\Renderer\Image\SvgImageBackEnd;

class MentorController extends Controller
{
    
    // Mostrar la lista de estudiantes
    public function index()
    {
        // Obtener los estudiantes y asignar el número de certificado con ceros a la izquierda
            $studentsmentor = StudentMentor::all()->map(function($studentmentor) {
            $studentmentor->certificadoNumero = str_pad($studentmentor->id, 4, '0', STR_PAD_LEFT);
            return $studentmentor;
        });

        return view('certificadosmentor.index', compact('studentsmentor'));
    }


    public function generarCertificados()
    {
        set_time_limit(0); // Elimina el límite de tiempo de ejecución
        // Ruta de la carpeta para guardar los PDFs
        $folderPath = public_path('certificadosmentor');
    
        // Crear la carpeta si no existe
        if (!is_dir($folderPath)) {
            mkdir($folderPath, 0755, true);
        }
    
        // Obtener los estudiantes
        //$studentsmentor = StudentMentor::take(3)->get();
        //$studentsmentor = StudentMentor::where('id', 120)->take(1)->get();
        $ids = [145, 146, 147];
        $studentsmentor = StudentMentor::whereIn('id', $ids)->get();
        //$studentsmentor = StudentMentor::all();

        $total = $studentsmentor->count();
    
        // Inicializar datos para Excel
        $excelData = [];
    
        // Respuesta de streaming
        return response()->stream(function () use ($studentsmentor, $folderPath, $total, &$excelData) {
            $current = 0;
       

            foreach ($studentsmentor as $index => $studentmentor) {
                $current++;
                $nombreCompleto = trim($studentmentor->nombre); // Elimina espacios en blanco al principio y al final
            
                // Descomponer el nombre completo en partes
                $partesNombre = explode(' ', $nombreCompleto);
                $primerNombre = $partesNombre[0]; // Primer nombre
                $primerApellido = isset($partesNombre[1]) ? $partesNombre[1] : ''; // Primer apellido si existe
            
                // Concatenar primer nombre y primer apellido para el nombre del archivo
                $nombreArchivo = $primerNombre . '_' . $primerApellido;
            
                $certificadoNumero = str_pad($studentmentor->id, 4, '0', STR_PAD_LEFT);
                $qr = $studentmentor->qr;
                // Obtener las fechas de inicio y fin y formatearlas
                $cargo = $studentmentor->puesto;
                $textofinal = $studentmentor->textofinal;

                //qr
                $renderer = new ImageRenderer(
                    new RendererStyle(110), // Tamaño del QR
                    new SvgImageBackEnd()
                );
                $writer = new Writer($renderer);
                $qrSvg = $writer->writeString($qr);
                
                // Convertir a base64 para insertar directamente en HTML
                $qrBase64 = 'data:image/svg+xml;base64,' . base64_encode($qrSvg);

                // Datos para la plantilla
                $data = [
                    'studentmentor' => $studentmentor,
                    'nombre' => $nombreCompleto,
                    'certificadoNumero' => $certificadoNumero,
                    'cargo' => $cargo,
                    'textofinal' => $textofinal,
                    'qr' => $qrBase64,
                    
                ];
            
                // Renderizar la vista
                $html = view('certificadosmentor.certificado', $data)->render();
            
                // Generar PDF
                $pdf = Pdf::loadHTML($html);
            
                // Nombre del archivo y ruta completa para guardar el PDF
                $fileName = $nombreCompleto . '.pdf';
                $pdfPath = $folderPath . '/' . $fileName;
            
                // Guardar el PDF en el directorio público
                $pdf->save($pdfPath);
            
                // Actualizar el campo 'archivo' del estudiante
                $studentmentor->archivo = $fileName;
                $studentmentor->save();
            
                // Agregar datos al Excel
                $excelData[] = [
                    'N°' => $index + 1,
                    'NOMBRE DEL ARCHIVO' => $fileName,
                    
                ];
            
                // Verificar si el estudiante tiene un email registrado
                if (!empty($studentmentor->email)) {
                    try {
                        // Enviar el PDF por email
                        //Mail::to($studentmentor->email)->send(new CertificadoEmail($pdfPath));
                    } catch (\Exception $e) {
                        \Log::error("Error al enviar el certificado al email {$studentmentor->email}: {$e->getMessage()}");
                    }
                }
            
                // Emitir progreso en tiempo real
                echo json_encode(['current' => $current, 'total' => $total]) . "\n";
                ob_flush();
                flush();
            }
            
            // Generar el archivo Excel
            $this->crearExcel($excelData);
        }, 200, [
            'Content-Type' => 'application/json',
            'Cache-Control' => 'no-cache',
            'Connection' => 'keep-alive',
        ]);
    }
    

    private function crearExcel($excelData)
    {
        $spreadsheet = new Spreadsheet();
        $sheet = $spreadsheet->getActiveSheet();

        // Establecer encabezados
        $headers = ['N°', 'NOMBRE DEL ARCHIVO', 'DOCUMENTO DE IDENTIDAD'];
        $sheet->fromArray($headers, null, 'A1');

        // Aplicar estilo al encabezado
        $headerStyle = [
            'fill' => [
                'fillType' => \PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID,
                'startColor' => ['argb' => 'FFD9E1F2'], // Azul claro
            ],
            'font' => [
                'bold' => true,
                'color' => ['argb' => 'FF000000'], // Texto negro
            ],
        ];
        
        $sheet->getStyle('A1:C1')->applyFromArray($headerStyle);

        // Agregar datos
        $sheet->fromArray($excelData, null, 'A2');

        // Ajustar automáticamente el ancho de las columnas
        foreach (range('A', 'C') as $col) {
            $sheet->getColumnDimension($col)->setAutoSize(true);
        }

        // Guardar el archivo Excel
        $fileName = 'Certificados.xlsx';
        $filePath = public_path($fileName);

        $writer = new Xlsx($spreadsheet);
        $writer->save($filePath);

        \Log::info("Archivo Excel creado: {$filePath}");
    }


}
