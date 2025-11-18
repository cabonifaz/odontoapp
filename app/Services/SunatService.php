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
    private $certificado;
    private $certPassword;
    private $ws = 'https://e-beta.sunat.gob.pe/ol-ti-itcpfegem-beta/billService';
    //private $ws = "https://e-factura.sunat.gob.pe/ol-ti-itcpfegem/billService?wsdl";

    public function __construct()
    {
        // Usar `public_path` para generar las rutas absolutas correctamente
        $this->firmaPath = public_path('sunat_files/firma/'); // Ruta para guardar el ZIP firmado
        $this->cdrPath = public_path('sunat_files/cdr/');
       
    }
    private function obtenerCertificadoYClave($ruc)
    {
        // Escribir en el log para ver el valor del parámetro ruc
        //\Log::info('Valor del RUC recibido: ' . $ruc);

        // Consultar la tabla facturadores para obtener la ruta del certificado y la clave
        $facturador = Facturador::where('ruc', $ruc)->first();
        if (!$facturador) {
            \Log::error('Facturador no encontrado para el RUC: ' . $ruc);
            throw new \Exception('Facturador no encontrado.');
        }

        //\Log::info('Facturador encontrado: ' . $facturador->razon_social);

        $this->certificado = public_path($facturador->ruta_certificado);
        $this->certPassword = $facturador->clave_certificado;

        //\Log::info('Ruta del certificado: ' . $this->certificado);
        //\Log::info('Clave del certificado: ' . $this->certPassword);
    }

    public function firmarYEnviar($nombreXml, $nroFactura, $emisor)
    {
        try {
            // Incluir archivo de firma
            require_once public_path('sunat_files/signature.php');
            // Obtener certificado y clave basándose en el RUC del emisor
            $this->obtenerCertificadoYClave($emisor['ruc']);
            // Paso 2: Firmar XML
            $rutaxml = public_path('sunat_files/xml/') . $nombreXml; // Ruta correcta para el XML a firmar

            // Verificar si el archivo XML existe antes de firmarlo
            if (!file_exists($rutaxml)) {
                throw new Exception("El archivo XML no existe en la ruta: " . $rutaxml);
            }

            // Crear instancia de Signature
            $signature = new \Signature(); // Clase definida en signature.php

            // Firmar el XML
            $response = $signature->signature_xml("0", $rutaxml, $this->certificado, $this->certPassword);

            // Obtener el hash del XML firmado
            if (isset($response['hash_cpe'])) {
                $hashCode = $response['hash_cpe'];

                // Actualizar el hash en la base de datos
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update(['hash_cpe' => $hashCode]);
            } else {
                throw new Exception("No se pudo obtener el hash del XML firmado.");
            }

            // Paso 3: Crear archivo ZIP
            $rutazip = $this->crearZip($nombreXml, $rutaxml);

            // Paso 4: Preparar mensaje SOAP
            $contenidoZip = base64_encode(file_get_contents($rutazip));
            $xmlEnvio = $this->crearEnvelope($emisor, basename($rutazip), $contenidoZip);

            // Paso 5: Enviar a SUNAT
            $respuestaSunat = $this->enviarASunat($xmlEnvio);

            // Paso 6: Procesar respuesta de SUNAT
            $resultado = $this->procesarRespuestaSunat($respuestaSunat, $nombreXml, $nroFactura);

            return $resultado;
        } catch (Exception $e) {
            \Log::error('Error: ' . $e->getMessage());
            return ['success' => false, 'message' => $e->getMessage()];
        }
    }

    public function firmarYEnviar_Nota($nombreXml, $nroFactura, $emisor)
    {
        try {
            // Incluir archivo de firma
            require_once public_path('sunat_files/signature.php');
            // Obtener certificado y clave basándose en el RUC del emisor
            $this->obtenerCertificadoYClave($emisor['ruc']);
            // Paso 2: Firmar XML
            $rutaxml = public_path('sunat_files/xml/') . $nombreXml; // Ruta correcta para el XML a firmar
            // Verificar si el archivo XML existe antes de firmarlo
            if (!file_exists($rutaxml)) {
                throw new Exception("El archivo XML no existe en la ruta: " . $rutaxml);
            }

            // Crear instancia de Signature
            $signature = new \Signature(); // Clase definida en signature.php

            // Firmar el XML
            $response = $signature->signature_xml("0", $rutaxml, $this->certificado, $this->certPassword);

            // Obtener el hash del XML firmado
            if (isset($response['hash_cpe'])) {
                $hashCode = $response['hash_cpe'];

                // Actualizar el hash en la base de datos
                \DB::table('nota_credito')
                    ->where('facturacion_id', $nroFactura)
                    ->update(['hash_cpe' => $hashCode]);
            } else {
                throw new Exception("No se pudo obtener el hash del XML firmado.");
            }

            // Paso 3: Crear archivo ZIP
            $rutazip = $this->crearZip($nombreXml, $rutaxml);

            // Paso 4: Preparar mensaje SOAP
            $contenidoZip = base64_encode(file_get_contents($rutazip));
            $xmlEnvio = $this->crearEnvelope($emisor, basename($rutazip), $contenidoZip);

            // Paso 5: Enviar a SUNAT
            $respuestaSunat = $this->enviarASunat($xmlEnvio);

            // Paso 6: Procesar respuesta de SUNAT
            return $this->procesarRespuestaSunat_Nota($respuestaSunat, $nombreXml, $nroFactura);
        } catch (Exception $e) {
            return ['success' => false, 'message' => $e->getMessage()];
        }
    }
    // Método para crear el archivo ZIP
    private function crearZip($nombreXml, $rutaxml)
    {
        // Ruta para guardar el archivo ZIP en la carpeta 'firma' sin la extensión '.xml.zip'
        $rutazip = $this->firmaPath . basename($nombreXml, '.xml') . '.zip'; // Sin .xml

        // Crear el archivo ZIP
        $zip = new \ZipArchive();
        if ($zip->open($rutazip, \ZipArchive::CREATE) === true) {
            $zip->addFile($rutaxml, basename($rutaxml)); // Agregar el archivo XML al ZIP
            $zip->close();
        } else {
            throw new Exception("No se pudo crear el archivo ZIP en la ruta: " . $rutazip);
        }

        return $rutazip; // Retornar la ruta del archivo ZIP creado
    }

    // Método para crear el sobre SOAP
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

    // Método para enviar a SUNAT
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
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);

        $response = curl_exec($ch);
        if (curl_errno($ch)) {
            throw new Exception('Error en conexión: ' . curl_error($ch));
        }
        curl_close($ch);
        \Log::info('Resultado del response: ' . $response);
        return $response;
    }
   // Método para procesar la respuesta de SUNAT
   private function procesarRespuestaSunat($response, $nombreXml, $nroFactura)
    {
        $doc = new \DOMDocument();
        $doc->loadXML($response);
        $cdrPath = $this->cdrPath . "R-" . basename($nombreXml, '.xml') . '.zip'; // Corregir nombre del archivo ZIP

        if ($doc->getElementsByTagName('applicationResponse')->length > 0) {
            
            $cdr = base64_decode($doc->getElementsByTagName('applicationResponse')->item(0)->nodeValue);
            file_put_contents($cdrPath, $cdr);

            // Extraer CDR
            $zip = new \ZipArchive();
            if ($zip->open($cdrPath) === true) {
                $zip->extractTo($this->cdrPath); // Extraer sin crear subcarpeta
                $zip->close();
            }

            // Eliminar el archivo ZIP después de la extracción
            unlink($cdrPath);

            // Cargar el XML extraído para evaluar las etiquetas cbc:ResponseCode y cbc:Description
            $cdrFile = $this->cdrPath . str_replace('.zip', '.xml', basename($cdrPath));
            $cdrDoc = new \DOMDocument();
            $cdrDoc->load($cdrFile);

            // Extraer cbc:ResponseCode
            $responseCode = $cdrDoc->getElementsByTagName('ResponseCode')->item(0)->nodeValue ?? null;

            // Extraer cbc:Description
            $description = $cdrDoc->getElementsByTagName('Description')->item(0)->nodeValue ?? null;

            // Evaluar el ResponseCode
            if ($responseCode === "0") {
                // Aceptada
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update([
                        'estado_sunat' => 1, // Comprobante aceptado
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'), // Fecha actual
                    ]);
                return ['success' => true, 'message' => $description ?? 'Comprobante aceptado'];
            } else {
                // Rechazada
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update([
                        'estado_sunat' => 0, // Comprobante rechazado
                        'descripcion_error' => $description ?? 'Error no identificado', // Guardar descripción del error
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'), // Fecha actual
                    ]);
                return ['success' => false, 'message' => $description ?? 'Error en el comprobante'];
            }
        }

        // Si no se encontró la etiqueta applicationResponse
        $faultCode = $doc->getElementsByTagName('faultcode')->item(0)->nodeValue ?? 'Desconocido';
        $faultString = $doc->getElementsByTagName('faultstring')->item(0)->nodeValue ?? 'Error no identificado';
        throw new Exception("Error $faultCode: $faultString");
    }

    
   public function firmarYEnviar_Baja($nombreXml, $nroFactura, $emisor)
    {
        try {
            // Verificar si ya existe un ticket en la BD
            $factura = \DB::table('facturaciones')->where('id', $nroFactura)->first();

            if ($factura && !empty($factura->ticket_baja)) {
                // Si ya hay un ticket, solo consultamos su estado
                //\Log::info("El ticket ya existe ({$factura->ticket_baja}), consultando estado...");
                $respuestaEstado = $this->consultarEstadoSunat($factura->ticket_baja, $emisor);
                return $this->procesarRespuestaSunatBaja($respuestaEstado, $nombreXml, $nroFactura);
            }

            // Continuar con el proceso normal si no hay ticket
            require_once public_path('sunat_files/signature.php');
            // Obtener certificado y clave basándose en el RUC del emisor
            $this->obtenerCertificadoYClave($emisor['ruc']);
            $rutaxml = public_path('sunat_files/xml/') . $nombreXml;

            if (!file_exists($rutaxml)) {
                throw new Exception("El archivo XML no existe en la ruta: " . $rutaxml);
            }

            $signature = new \Signature();
            $response = $signature->signature_xml("0", $rutaxml, $this->certificado, $this->certPassword);

            if (!isset($response['hash_cpe'])) {
                throw new Exception("No se pudo obtener el hash del XML firmado.");
            }

            $hashCode = $response['hash_cpe'];

            // Actualizar en la BD el hash del CPE
            \DB::table('facturaciones')->where('id', $nroFactura)->update(['hash_cpe_baja' => $hashCode]);

            // Crear el ZIP
            $rutazip = $this->crearZip($nombreXml, $rutaxml);

            if (!file_exists($rutazip)) {
                throw new Exception("No se pudo generar el archivo ZIP.");
            }

            $contenidoZip = base64_encode(file_get_contents($rutazip));
            $xmlEnvio = $this->crearEnvelope_Baja($emisor, basename($rutazip), $contenidoZip);

            //\Log::info('XML de Envío: ' . $xmlEnvio);

            // Enviar a SUNAT y obtener el ticket
            $ticket = $this->enviarASunat_Baja($xmlEnvio);

            if (empty($ticket)) {
                throw new Exception("No se recibió un ticket de SUNAT.");
            }

            // Guardar ticket en la BD
            \DB::table('facturaciones')->where('id', $nroFactura)->update(['ticket_baja' => $ticket]);

            //sleep(5); // Esperar antes de consultar el estado

            // Consultar estado en SUNAT
            $respuestaEstado = $this->consultarEstadoSunat($ticket, $emisor);

            return $this->procesarRespuestaSunatBaja($respuestaEstado, $nombreXml, $nroFactura);
        } catch (Exception $e) {
            \Log::error('Error al anular el documento: ' . $e->getMessage());
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
       curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
   
       $response = curl_exec($ch);
       if (curl_errno($ch)) {
           throw new Exception('Error en conexión: ' . curl_error($ch));
       }
       curl_close($ch);
   
       //\Log::info('Respuesta de SUNAT: ' . $response);
   
       $doc = new \DOMDocument();
       $doc->loadXML($response);
   
       $ticketNode = $doc->getElementsByTagName('ticket')->item(0);
       if ($ticketNode) {
           return $ticketNode->nodeValue;
       }
   
       return null;
   }   
   // Método para consultar el estado en SUNAT
   public function consultarEstadoSunat($ticket, $emisor) {
       $statusXml = '<?xml version="1.0" encoding="UTF-8"?>
       <soapenv:Envelope 
       xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" 
       xmlns:ser="http://service.sunat.gob.pe" 
       xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"> 
           <soapenv:Header> 
               <wsse:Security> 
                   <wsse:UsernameToken> 
                       <wsse:Username>' . $emisor['ruc'] . $emisor['usuario_emisor'] . '</wsse:Username> 
                       <wsse:Password>' . $emisor['clave_emisor'] . '</wsse:Password> 
                   </wsse:UsernameToken> 
               </wsse:Security> 
           </soapenv:Header> 
           <soapenv:Body> 
               <ser:getStatus> 
                   <ticket>' . $ticket . '</ticket> 
               </ser:getStatus> 
           </soapenv:Body> 
       </soapenv:Envelope>';
       
       $ch = curl_init();
       curl_setopt($ch, CURLOPT_URL, $this->ws);
       curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
       curl_setopt($ch, CURLOPT_POST, true);
       curl_setopt($ch, CURLOPT_POSTFIELDS, $statusXml);
       curl_setopt($ch, CURLOPT_HTTPHEADER, [
           "Content-Type: text/xml; charset=\"utf-8\"",
           "Content-Length: " . strlen($statusXml)
       ]);
       curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
   
       $response = curl_exec($ch);
       if (curl_errno($ch)) {
           throw new Exception('Error en conexión: ' . curl_error($ch));
       }
       curl_close($ch);
       //\Log::info('Respuesta de SUNAT Consultar estado: ' . $response);
       return $response;
   }
   
    public function procesarRespuestaSunatBaja($response, $nombreXml, $nroFactura)
    {
        Log::info("Inicio de procesamiento de la respuesta de SUNAT para la baja de la factura: $nroFactura");

        if (strpos($response, '<') === false) {
            //Log::error("La respuesta de SUNAT no contiene un XML válido: " . $response);
            throw new Exception("La respuesta no contiene un XML válido: " . $response);
        }

        $doc = new \DOMDocument();
        $doc->loadXML($response);

        // 🔹 Verificar si existe el tag <content> y extraer el CDR
        if ($doc->getElementsByTagName('content')->length > 0) {
            //Log::info("Se encontró el contenido del CDR en la respuesta.");
            
            $cdr = base64_decode($doc->getElementsByTagName('content')->item(0)->nodeValue);
            $cdrPath = $this->cdrPath . "R-" . basename($nombreXml, '.xml') . '.zip';
            
            file_put_contents($cdrPath, $cdr);
            //Log::info("CDR guardado en: " . $cdrPath);

            // 🔹 Intentar extraer el ZIP
            $zip = new \ZipArchive();
            if ($zip->open($cdrPath) === true) {
                $zip->extractTo($this->cdrPath);
                $zip->close();
                //Log::info("CDR extraído exitosamente en: " . $this->cdrPath);
            } else {
                //Log::error("Error al abrir el archivo ZIP del CDR.");
            }

            unlink($cdrPath);
        } else {
            Log::warning("No se encontró el contenido del CDR en la respuesta de SUNAT.");
        }

        // 🔹 Verificar el estado del CDR
        $estado = 'Error desconocido';
        if ($doc->getElementsByTagName('statusCode')->length > 0) {
            $estado = $doc->getElementsByTagName('statusCode')->item(0)->nodeValue;
        }
        //Log::info("Estado recibido de SUNAT: " . $estado);

        // 🔹 Evaluar estados de la SUNAT
        if ($estado === '0') {
            //Log::info("El comprobante ha sido anulado exitosamente.");
            $bajaExitosa = 1;
        } elseif ($estado === '98') {
            //Log::warning("El comprobante aún está en proceso.");
            $bajaExitosa = 2;
        } elseif ($estado === '99') {
            //Log::error("Error en la baja del comprobante. Verificar el CDR.");
            $bajaExitosa = 2;
        } else {
            //Log::warning("Estado desconocido recibido: " . $estado);
            $bajaExitosa = 2;
        }

        // 🔹 Guardar resultado en la base de datos
        \DB::table('facturaciones')
            ->where('id', $nroFactura)
            ->update([
                'baja' => $bajaExitosa,
                'fecha_baja' => Carbon::now()->format('Y-m-d H:i:s'),
            ]);

        //Log::info("Registro de la factura actualizado en la base de datos.");

        return ['success' => true, 'message' => 'Comprobante procesado', 'estado_cdr' => $estado];
    }
       
    private function procesarRespuestaSunat_Nota($response, $nombreXml, $nroFactura)
    {
        $doc = new \DOMDocument();
        $doc->loadXML($response);
        $cdrPath = $this->cdrPath . "R-" . basename($nombreXml, '.xml') . '.zip'; // Corregir nombre del archivo ZIP

        if ($doc->getElementsByTagName('applicationResponse')->length > 0) {
            $cdr = base64_decode($doc->getElementsByTagName('applicationResponse')->item(0)->nodeValue);
            file_put_contents($cdrPath, $cdr);

            // Extraer CDR
            $zip = new \ZipArchive();
            if ($zip->open($cdrPath) === true) {
                $zip->extractTo($this->cdrPath); // Extraer sin subcarpeta
                $zip->close();
            }

            // Eliminar el archivo ZIP después de la extracción
            unlink($cdrPath);

            // Cargar el XML extraído para evaluar las etiquetas cbc:ResponseCode y cbc:Description
            $cdrFile = $this->cdrPath . str_replace('.zip', '.xml', basename($cdrPath));
            $cdrDoc = new \DOMDocument();
            $cdrDoc->load($cdrFile);

            // Extraer cbc:ResponseCode
            $responseCode = $cdrDoc->getElementsByTagName('ResponseCode')->item(0)->nodeValue ?? null;

            // Extraer cbc:Description
            $description = $cdrDoc->getElementsByTagName('Description')->item(0)->nodeValue ?? null;

            // Evaluar el ResponseCode
            if ($responseCode === "0") {
                // Nota aceptada
                \DB::table('nota_credito')
                    ->where('facturacion_id', $nroFactura)
                    ->update([
                        'estado_sunat' => 1, // Nota aceptada
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'), // Fecha actual
                    ]);

                // Actualizar estado de la factura asociada
                \DB::table('facturaciones')
                    ->where('id', $nroFactura)
                    ->update([
                        'baja' => 1,
                        'fecha_baja' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);

                return ['success' => true, 'message' => $description ?? 'Nota aceptada exitosamente'];
            } else {
                // Nota rechazada
                \DB::table('nota_credito')
                    ->where('facturacion_id', $nroFactura)
                    ->update([
                        'estado_sunat' => 0, // Nota rechazada
                        'descripcion_error' => $description ?? 'Error desconocido', // Guardar descripción del error
                        'fecha_cdr' => Carbon::now()->format('Y-m-d H:i:s'),
                    ]);

                return ['success' => false, 'message' => $description ?? 'Error en la nota enviada'];
            }
        }

        // Manejo de errores en la respuesta
        $faultCode = $doc->getElementsByTagName('faultcode')->item(0)->nodeValue ?? 'Desconocido';
        $faultString = $doc->getElementsByTagName('faultstring')->item(0)->nodeValue ?? 'Error no identificado';
        throw new Exception("Error $faultCode: $faultString");
    }

}
