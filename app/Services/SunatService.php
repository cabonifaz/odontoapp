<?php
namespace App\Services;

use ZipArchive;
use DOMDocument;
use Exception;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;
use App\Models\Facturador;

class SunatService
{
    private $firmaPath;
    private $cdrPath;
    private $xmlPath; // Nueva propiedad para mayor orden
    private $caCertPath;
    private $certificado;
    private $certPassword;
    private $ws = 'https://e-beta.sunat.gob.pe/ol-ti-itcpfegem-beta/billService';
    //private $ws = "https://e-factura.sunat.gob.pe/ol-ti-itcpfegem/billService?wsdl"; // Producción

// ... propiedades existentes ...

    public function __construct()
    {
        // Definir rutas absolutas
        $this->firmaPath = public_path('sunat_files/firma/');
        $this->cdrPath = public_path('sunat_files/cdr/');
        $this->xmlPath = public_path('sunat_files/xml/'); // Nueva ruta para XMLs sin firmar

        // --- AUTO-CREACIÓN DE CARPETAS ---
        // Verifica si existen, si no, las crea con permisos de escritura (0777 para evitar problemas)
        if (!file_exists($this->firmaPath)) {
            mkdir($this->firmaPath, 0777, true);
        }
        if (!file_exists($this->cdrPath)) {
            mkdir($this->cdrPath, 0777, true);
        }
        if (!file_exists($this->xmlPath)) {
            mkdir($this->xmlPath, 0777, true);
        }
    }

    private function obtenerCertificadoYClave($ruc)
    {
        $facturador = Facturador::where('ruc', $ruc)->first();
        if (!$facturador) {
            Log::error('Facturador no encontrado para el RUC: ' . $ruc);
            throw new Exception('Facturador no encontrado.');
        }

        // Validar que el archivo del certificado realmente exista en el contenedor
        $rutaCertificado = public_path($facturador->ruta_certificado);
        
        if (!file_exists($rutaCertificado)) {
             throw new Exception("El archivo de certificado digital (.pfx/.pem) no se encuentra en la ruta: " . $rutaCertificado . ". Verifica que se haya subido al repositorio.");
        }

        $this->certificado = $rutaCertificado;
        $this->certPassword = $facturador->clave_certificado;
    }

    public function firmarYEnviar($nombreXml, $nroFactura, $emisor)
    {
        try {
            require_once public_path('sunat_files/signature.php'); // Asegúrate que este archivo esté en el repo
            
            $this->obtenerCertificadoYClave($emisor['ruc']);
            
            // Usar la ruta definida en el constructor para asegurar consistencia
            $rutaxml = $this->xmlPath . $nombreXml;

            if (!file_exists($rutaxml)) {
                throw new Exception("El archivo XML a firmar no existe: " . $rutaxml);
            }

            $signature = new \Signature();
            $response = $signature->signature_xml("0", $rutaxml, $this->certificado, $this->certPassword);

            if (isset($response['hash_cpe'])) {
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update(['hash_cpe' => $response['hash_cpe']]);
            } else {
                throw new Exception("No se pudo obtener el hash del XML firmado.");
            }

            $rutazip = $this->crearZip($nombreXml, $rutaxml);

            $contenidoZip = base64_encode(file_get_contents($rutazip));
            $xmlEnvio = $this->crearEnvelope($emisor, basename($rutazip), $contenidoZip);

            $respuestaSunat = $this->enviarASunat($xmlEnvio);

            return $this->procesarRespuestaSunat($respuestaSunat, $nombreXml, $nroFactura);

        } catch (Exception $e) {
            Log::error('Error SunatService: ' . $e->getMessage());
            return ['success' => false, 'message' => $e->getMessage()];
        }
    }

    public function firmarYEnviar_Nota($nombreXml, $nroFactura, $emisor)
    {
        try {
            require_once public_path('sunat_files/signature.php');
            $this->obtenerCertificadoYClave($emisor['ruc']);
            
            $rutaxml = $this->xmlPath . $nombreXml;
            
            if (!file_exists($rutaxml)) {
                throw new Exception("El archivo XML de la Nota no existe: " . $rutaxml);
            }

            $signature = new \Signature();
            $response = $signature->signature_xml("0", $rutaxml, $this->certificado, $this->certPassword);

            if (isset($response['hash_cpe'])) {
                \DB::table('nota_credito')
                    ->where('facturacion_id', $nroFactura)
                    ->update(['hash_cpe' => $response['hash_cpe']]);
            } else {
                throw new Exception("No se pudo obtener el hash del XML firmado.");
            }

            $rutazip = $this->crearZip($nombreXml, $rutaxml);
            $contenidoZip = base64_encode(file_get_contents($rutazip));
            $xmlEnvio = $this->crearEnvelope($emisor, basename($rutazip), $contenidoZip);

            $respuestaSunat = $this->enviarASunat($xmlEnvio);

            return $this->procesarRespuestaSunat_Nota($respuestaSunat, $nombreXml, $nroFactura);
        } catch (Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }
    }

    private function crearZip($nombreXml, $rutaxml)
    {
        $rutazip = $this->firmaPath . basename($nombreXml, '.xml') . '.zip';

        $zip = new \ZipArchive();
        if ($zip->open($rutazip, \ZipArchive::CREATE | \ZipArchive::OVERWRITE) === true) {
            $zip->addFile($rutaxml, basename($rutaxml));
            $zip->close();
        } else {
            throw new Exception("No se pudo crear el archivo ZIP en: " . $rutazip . ". Verifica permisos de escritura.");
        }

        return $rutazip;
    }

    private function crearEnvelope($emisor, $fileName, $contentFile)
    {
        return <<<XML
            <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.sunat.gob.pe" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
                <soapenv:Header>
                    <wsse:Security>
                        <wsse:UsernameToken>
                            <wsse:Username>{$emisor['ruc']}{$emisor['usuario_emisor']}</wsse:Username>
                            <wsse:Password>{$emisor['clave_emisor']}</wsse:Password>
                        </wsse:UsernameToken>
                    </wsse:Security>
                </soapenv:Header>
                <soapenv:Body>
                    <ser:sendBill>
                        <fileName>{$fileName}</fileName>
                        <contentFile>{$contentFile}</contentFile>
                    </ser:sendBill>
                </soapenv:Body>
            </soapenv:Envelope>
            XML;
    }

private function enviarASunat($xmlEnvio)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->ws);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xmlEnvio);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Content-type: text/xml; charset=\"utf-8\"",
            "Content-length: " . strlen($xmlEnvio),
        ]);
        
        // --- CORRECCIÓN SSL PARA BETA SUNAT ---
        // En Beta, los certificados a menudo fallan la validación estricta.
        // Se deshabilita VERIFYPEER para evitar el error "self-signed certificate".
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false); 
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0); 

        $response = curl_exec($ch);
        if (curl_errno($ch)) {
            throw new Exception('Error cURL a SUNAT: ' . curl_error($ch));
        }
        curl_close($ch);
        return $response;
    }

   private function procesarRespuestaSunat($response, $nombreXml, $nroFactura)
    {
        $doc = new \DOMDocument();
        @$doc->loadXML($response);
        $cdrPath = $this->cdrPath . "R-" . basename($nombreXml, '.xml') . '.zip';

        if ($doc->getElementsByTagName('applicationResponse')->length > 0) {
            
            $cdr = base64_decode($doc->getElementsByTagName('applicationResponse')->item(0)->nodeValue);
            file_put_contents($cdrPath, $cdr);

            $zip = new \ZipArchive();
            if ($zip->open($cdrPath) === true) {
                $zip->extractTo($this->cdrPath);
                $zip->close();
            }

            // Intentar borrar el ZIP temporal, pero no fallar si no se puede
            if(file_exists($cdrPath)) @unlink($cdrPath);

            $cdrFile = $this->cdrPath . str_replace('.zip', '.xml', basename($cdrPath));
            
            if (!file_exists($cdrFile)) {
                 throw new Exception("No se pudo encontrar el XML del CDR extraído.");
            }
            
            $cdrDoc = new \DOMDocument();
            @$cdrDoc->load($cdrFile);

            $responseCode = $cdrDoc->getElementsByTagName('ResponseCode')->item(0)->nodeValue ?? null;
            $description = $cdrDoc->getElementsByTagName('Description')->item(0)->nodeValue ?? null;

            if ($responseCode === "0") {
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update([
                        'estado_sunat' => 1,
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);
                return ['success' => true, 'message' => $description ?? 'Comprobante aceptado'];
            } else {
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update([
                        'estado_sunat' => 0,
                        'descripcion_error' => $description ?? 'Error no identificado',
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);
                return ['success' => false, 'message' => $description ?? 'Error en el comprobante'];
            }
        }

        $faultCode = $doc->getElementsByTagName('faultcode')->item(0)->nodeValue ?? 'Desconocido';
        $faultString = $doc->getElementsByTagName('faultstring')->item(0)->nodeValue ?? 'Error no identificado';
        
        // Loguear para depuración en Railway Dashboard
        Log::error("SUNAT Fault: $faultCode - $faultString");
        
        throw new Exception("Error SUNAT $faultCode: $faultString");
    }

   public function firmarYEnviar_Baja($nombreXml, $nroFactura, $emisor)
    {
        try {
            $factura = \DB::table('facturaciones')->where('id', $nroFactura)->first();

            // Si ya tiene ticket, solo consultamos (lógica de reintento)
            if ($factura && !empty($factura->ticket_baja)) {
                $respuestaEstado = $this->consultarEstadoSunat($factura->ticket_baja, $emisor);
                return $this->procesarRespuestaSunatBaja($respuestaEstado, $nombreXml, $nroFactura);
            }

            require_once public_path('sunat_files/signature.php');
            $this->obtenerCertificadoYClave($emisor['ruc']);
            
            $rutaxml = $this->xmlPath . $nombreXml;

            if (!file_exists($rutaxml)) {
                throw new Exception("El archivo XML de baja no existe: " . $rutaxml);
            }

            $signature = new \Signature();
            $response = $signature->signature_xml("0", $rutaxml, $this->certificado, $this->certPassword);

            if (!isset($response['hash_cpe'])) {
                throw new Exception("No se pudo obtener el hash del XML firmado.");
            }

            \DB::table('facturaciones')->where('id', $nroFactura)->update(['hash_cpe_baja' => $response['hash_cpe']]);

            $rutazip = $this->crearZip($nombreXml, $rutaxml);
            $contenidoZip = base64_encode(file_get_contents($rutazip));
            $xmlEnvio = $this->crearEnvelope_Baja($emisor, basename($rutazip), $contenidoZip);

            $ticket = $this->enviarASunat_Baja($xmlEnvio);

            if (empty($ticket)) {
                throw new Exception("No se recibió un ticket de SUNAT.");
            }

            \DB::table('facturaciones')->where('id', $nroFactura)->update(['ticket_baja' => $ticket]);

            // Consultar estado inmediatamente
            $respuestaEstado = $this->consultarEstadoSunat($ticket, $emisor);

            return $this->procesarRespuestaSunatBaja($respuestaEstado, $nombreXml, $nroFactura);
        } catch (Exception $e) {
            Log::error('Error Baja: ' . $e->getMessage());
            return ['success' => false, 'message' => $e->getMessage()];
        }
    }
    
   private function crearEnvelope_Baja($emisor, $fileName, $contentFile)
   {
       return <<<XML
       <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://service.sunat.gob.pe" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd">
           <soapenv:Header>
               <wsse:Security>
                   <wsse:UsernameToken>
                       <wsse:Username>{$emisor['ruc']}{$emisor['usuario_emisor']}</wsse:Username>
                       <wsse:Password>{$emisor['clave_emisor']}</wsse:Password>
                   </wsse:UsernameToken>
               </wsse:Security>
           </soapenv:Header>
           <soapenv:Body>
               <ser:sendSummary>
                   <fileName>{$fileName}</fileName>
                   <contentFile>{$contentFile}</contentFile>
               </ser:sendSummary>
           </soapenv:Body>
       </soapenv:Envelope>
       XML;
   }
   
   private function enviarASunat_Baja($xmlEnvio)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->ws);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $xmlEnvio);
        curl_setopt($ch, CURLOPT_HTTPHEADER, [
            "Content-type: text/xml; charset=\"utf-8\"",
            "Content-length: " . strlen($xmlEnvio),
        ]);
        
        // --- CORRECCIÓN SSL PARA BETA SUNAT ---
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
    
        $response = curl_exec($ch);
        if (curl_errno($ch)) {
            throw new Exception('Error conexión Baja: ' . curl_error($ch));
        }
        curl_close($ch);
    
        $doc = new \DOMDocument();
        @$doc->loadXML($response);
    
        $ticketNode = $doc->getElementsByTagName('ticket')->item(0);
        if ($ticketNode) {
            return $ticketNode->nodeValue;
        }
        
        $faultString = $doc->getElementsByTagName('faultstring')->item(0)->nodeValue ?? null;
        if($faultString) {
            throw new Exception("SUNAT Error (Ticket): " . $faultString);
        }
    
        return null;
    } 

  public function consultarEstadoSunat($ticket, $emisor) {
       // ... (código anterior del XML) ...
       $statusXml = '<?xml version="1.0" encoding="UTF-8"?>
       <soapenv:Envelope ...> ... </soapenv:Envelope>';
       
       $ch = curl_init();
       curl_setopt($ch, CURLOPT_URL, $this->ws);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
       curl_setopt($ch, CURLOPT_POST, true);
       curl_setopt($ch, CURLOPT_POSTFIELDS, $statusXml);
       curl_setopt($ch, CURLOPT_HTTPHEADER, [
           "Content-Type: text/xml; charset=\"utf-8\"",
           "Content-Length: " . strlen($statusXml)
       ]);
       
       // --- CORRECCIÓN SSL PARA BETA SUNAT ---
       curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
       curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
   
       $response = curl_exec($ch);
       if (curl_errno($ch)) {
           throw new Exception('Error conexión Status: ' . curl_error($ch));
       }
       curl_close($ch);
       return $response;
   }
   
    public function procesarRespuestaSunatBaja($response, $nombreXml, $nroFactura)
    {
        Log::info("Procesando respuesta Baja ID: $nroFactura");

        if (strpos($response, '<') === false) {
            throw new Exception("Respuesta inválida de SUNAT (No XML)");
        }

        $doc = new \DOMDocument();
        @$doc->loadXML($response);

        if ($doc->getElementsByTagName('content')->length > 0) {
            
            $cdr = base64_decode($doc->getElementsByTagName('content')->item(0)->nodeValue);
            $cdrPath = $this->cdrPath . "R-" . basename($nombreXml, '.xml') . '.zip';
            
            file_put_contents($cdrPath, $cdr);

            $zip = new \ZipArchive();
            if ($zip->open($cdrPath) === true) {
                $zip->extractTo($this->cdrPath);
                $zip->close();
            }
            if(file_exists($cdrPath)) @unlink($cdrPath);
        }

        $estado = 'Error desconocido';
        if ($doc->getElementsByTagName('statusCode')->length > 0) {
            $estado = $doc->getElementsByTagName('statusCode')->item(0)->nodeValue;
        }

        $bajaExitosa = 0;
        $msg = "Estado: $estado";

        if ($estado === '0') {
            $bajaExitosa = 1; // Exito
            $msg = "Baja ACEPTADA correctamente.";
        } elseif ($estado === '98') {
            $bajaExitosa = 2; // En Proceso
            $msg = "Baja EN PROCESO. Verifique más tarde.";
        } elseif ($estado === '99') {
            $bajaExitosa = 0; // Error
            $msg = "Baja RECHAZADA o con errores.";
        }

        \DB::table('facturaciones')
            ->where('id', $nroFactura)
            ->update([
                'baja' => $bajaExitosa,
                'fecha_baja' => Carbon::now()->format('Y-m-d H:i:s'),
            ]);

        return ['success' => ($bajaExitosa !== 0), 'message' => $msg, 'estado_cdr' => $estado];
    }
       
    private function procesarRespuestaSunat_Nota($response, $nombreXml, $nroFactura)
    {
        $doc = new \DOMDocument();
        @$doc->loadXML($response);
        $cdrPath = $this->cdrPath . "R-" . basename($nombreXml, '.xml') . '.zip';

        if ($doc->getElementsByTagName('applicationResponse')->length > 0) {
            $cdr = base64_decode($doc->getElementsByTagName('applicationResponse')->item(0)->nodeValue);
            file_put_contents($cdrPath, $cdr);

            $zip = new \ZipArchive();
            if ($zip->open($cdrPath) === true) {
                $zip->extractTo($this->cdrPath);
                $zip->close();
            }
            if(file_exists($cdrPath)) @unlink($cdrPath);

            $cdrFile = $this->cdrPath . str_replace('.zip', '.xml', basename($cdrPath));
            
            if (!file_exists($cdrFile)) {
                 throw new Exception("XML del CDR Nota no encontrado.");
            }

            $cdrDoc = new \DOMDocument();
            @$cdrDoc->load($cdrFile);

            $responseCode = $cdrDoc->getElementsByTagName('ResponseCode')->item(0)->nodeValue ?? null;
            $description = $cdrDoc->getElementsByTagName('Description')->item(0)->nodeValue ?? null;

            if ($responseCode === "0") {
                \DB::table('nota_credito')
                    ->where('facturacion_id', $nroFactura)
                    ->update([
                        'estado_sunat' => 1,
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);

                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update([
                        'baja' => 1,
                        'fecha_baja' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);

                return ['success' => true, 'message' => $description ?? 'Nota aceptada exitosamente'];
            } else {
                \DB::table('nota_credito')
                    ->where('facturacion_id', $nroFactura)
                    ->update([
                        'estado_sunat' => 0,
                        'descripcion_error' => $description ?? 'Error desconocido',
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);

                return ['success' => false, 'message' => $description ?? 'Error en la nota enviada'];
            }
        }

        $faultCode = $doc->getElementsByTagName('faultcode')->item(0)->nodeValue ?? 'Desconocido';
        $faultString = $doc->getElementsByTagName('faultstring')->item(0)->nodeValue ?? 'Error no identificado';
        Log::error("Error SOAP NotaCredito: $faultCode - $faultString");
        throw new Exception("Error $faultCode: $faultString");
    }
}
