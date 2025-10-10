<?php
// app/Http/Controllers/ApiController.php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\Student;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Mail;
use App\Mail\CertificadoEmail;
use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;
use Illuminate\Support\Facades\Log;

class ApiController extends Controller
{
    public function buscarDni(Request $request)
    {
        // Token de acceso a la API
        $token = '1|1E0P5WndD4SQB1O8sMQzRCL6gNzRINXkRgLxVn3R5afac0d1'; // Reemplaza esto con tu token válido
        $dni = $request->input('valor');
        
        // Validar que el DNI tenga 8 dígitos
        if (strlen($dni) !== 8) {
            return response()->json(['error' => 'DNI inválido'], 400);
        }
        
        try {
            // Realizar la solicitud a la nueva API con los parámetros necesarios
            $response = Http::withoutVerifying()->withHeaders([
                'Authorization' => 'Bearer ' . $token,
                'Accept' => 'application/json'
            ])->get('https://apidni.net.lass.pe/api/personas/buscar/' . $dni, [
                'request_by' => $request->input('request_by', 'default_user'),
                'user_email' => $request->input('user_email', 'default_email@example.com')
            ]);

            // Verificar si la respuesta fue exitosa
            if ($response->successful()) {
                return response()->json($response->json());
            } else {
                return response()->json(['error' => 'Error en la solicitud a la API'], $response->status());
            }

        } catch (\Exception $e) {
            // Manejar excepciones
            return response()->json(['error' => 'Ocurrió un error al procesar la solicitud: ' . $e->getMessage()], 500);
        }
    }
    
    // Mostrar la lista de estudiantes
    public function index()
    {
        // Obtener los estudiantes y asignar el número de certificado con ceros a la izquierda
        $students = Student::all()->map(function($student) {
            $student->certificadoNumero = str_pad($student->id, 4, '0', STR_PAD_LEFT);
            return $student;
        });

        return view('certificados.index', compact('students'));
    }


    public function generarCertificados()
    {
        set_time_limit(0); // Elimina el límite de tiempo de ejecución
        // Ruta de la carpeta para guardar los PDFs
        $folderPath = public_path('certificados');
    
        // Crear la carpeta si no existe
        if (!is_dir($folderPath)) {
            mkdir($folderPath, 0755, true);
        }
    
        // Obtener todos los estudiantes
        //$students = Student::all();
        // Obtener todos los estudiantes con el dni específico
        $students = Student::where('dni', '45645359')->get();

        $total = $students->count();

    
        // Inicializar datos para Excel
        $excelData = [];
    
        // Respuesta de streaming
        return response()->stream(function () use ($students, $folderPath, $total, &$excelData) {
            $current = 0;
    
            foreach ($students as $index => $student) {
                $current++;
                $nombreCompleto = trim($student->nombres . ' ' . $student->ape_paterno . ' ' . $student->ape_materno);
                $certificadoNumero = str_pad($student->id, 4, '0', STR_PAD_LEFT);
    
                // Datos para la plantilla
                $data = [
                    'student' => $student,
                    'nombre' => $nombreCompleto,
                    'certificadoNumero' => $certificadoNumero,
                ];
    
                // Renderizar la vista
                $html = view('certificados.certificado', $data)->render();
    
                // Generar PDF
                $pdf = Pdf::loadHTML($html);
    
                // Nombre del archivo y ruta completa para guardar el PDF
                $fileName = $student->dni . '.pdf';
                $pdfPath = $folderPath . '/' . $fileName;
    
                // Guardar el PDF en el directorio público
                $pdf->save($pdfPath);
    
                // Actualizar el campo 'archivo' del estudiante
                $student->archivo = $fileName;
                $student->save();
    
                // Agregar datos al Excel
                $excelData[] = [
                    'N°' => $index + 1,
                    'NOMBRE DEL ARCHIVO' => $fileName,
                    'DOCUMENTO DE IDENTIDAD' => $student->dni,
                    'NOMBRES' => $student->nombres,
                    'APELLIDO PATERNO' => $student->ape_paterno,
                    'APELLIDO MATERNO' => $student->ape_materno,
                ];
    
                // Verificar si el estudiante tiene un email registrado
                if (!empty($student->email)) {
                    try {
                        // Enviar el PDF por email
                        //Mail::to($student->email)->send(new CertificadoEmail($pdfPath));
                    } catch (\Exception $e) {
                        \Log::error("Error al enviar el certificado al email {$student->email}: {$e->getMessage()}");
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
        $headers = ['N°', 'NOMBRE DEL ARCHIVO', 'DOCUMENTO DE IDENTIDAD', 'NOMBRES', 'APELLIDO PATERNO', 'APELLIDO MATERNO'];
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
        
        $sheet->getStyle('A1:F1')->applyFromArray($headerStyle);

        // Agregar datos
        $sheet->fromArray($excelData, null, 'A2');

        // Ajustar automáticamente el ancho de las columnas
        foreach (range('A', 'F') as $col) {
            $sheet->getColumnDimension($col)->setAutoSize(true);
        }

        // Guardar el archivo Excel
        $fileName = 'Certificados.xlsx';
        $filePath = public_path($fileName);

        $writer = new Xlsx($spreadsheet);
        $writer->save($filePath);

        \Log::info("Archivo Excel creado: {$filePath}");
    }
    public function buscarRuc(Request $request)
    {
        // Token de acceso a la API
        $token = '1|1E0P5WndD4SQB1O8sMQzRCL6gNzRINXkRgLxVn3R5afac0d1'; // Reemplaza esto con tu token válido
        $ruc = $request->input('valor');
        
        // Log para depuración: valor del RUC recibido
        Log::info('Valor del RUC recibido: ' . $ruc);
    
        // Validar que el RUC tenga 11 dígitos
        if (strlen($ruc) !== 11) {
            Log::error('RUC inválido: ' . $ruc);
            return response()->json(['error' => 'RUC inválido'], 400);
        }
        
        try {
            // Realizar la solicitud a la API con los parámetros necesarios
            $response = Http::withoutVerifying()->withHeaders([
                'Authorization' => 'Bearer ' . $token,
                'Accept' => 'application/json'
            ])->get('https://apidni.net.lass.pe/api/buscar-ruc/' . $ruc, [
                'request_by' => $request->input('request_by', 'default_user'),
                'user_email' => $request->input('user_email', 'default_email@example.com')
            ]);
    
            // Log para depuración: solicitud realizada
            Log::info('Solicitud realizada a la API con RUC: ' . $ruc);
    
            // Verificar si la respuesta fue exitosa
            if ($response->successful()) {
                Log::info('Respuesta exitosa de la API: ' . $response->body());
                return response()->json($response->json());
            } else {
                Log::error('Error en la solicitud a la API: ' . $response->status() . ' - ' . $response->body());
                return response()->json([
                    'error' => 'Error en la solicitud a la API',
                    'status' => $response->status(),
                    'details' => $response->body()
                ], $response->status());
            }
    
        } catch (\Exception $e) {
            // Manejar excepciones
            Log::error('Ocurrió un error al procesar la solicitud: ' . $e->getMessage());
            return response()->json(['error' => 'Ocurrió un error al procesar la solicitud: ' . $e->getMessage()], 500);
        }
    }


}
