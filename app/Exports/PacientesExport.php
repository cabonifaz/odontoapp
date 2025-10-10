<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithEvents;

use Maatwebsite\Excel\Events\AfterSheet;
use Illuminate\Support\Collection;
use Carbon\Carbon;
use PhpOffice\PhpSpreadsheet\Style\Alignment; // Aquí se importa Alignment

class PacientesExport implements FromCollection, WithHeadings, WithStyles, WithEvents
{
    protected $pacientes;
    protected $mes;

    public function __construct(Collection $pacientes, $mes)
    {
        // Guardar el mes seleccionado
        $this->mes = $mes;

        // Ordenar los pacientes por día y mes de la fecha de nacimiento
        $this->pacientes = $pacientes->sortBy(function ($paciente) {
            // Convertir la fecha de nacimiento a Carbon si no lo es ya
            $fechaNacimiento = Carbon::parse($paciente->fecha_nacimiento);

            // Crear una cadena con el mes y el día para comparar
            return sprintf('%02d-%02d', $fechaNacimiento->month, $fechaNacimiento->day);
        });
    }

    /**
     * Exporta la colección de pacientes.
     */
    public function collection()
    {
        // Solo mostrar el día para la fecha de nacimiento
        $this->pacientes->transform(function ($paciente) {
            // Formatear fecha de nacimiento solo para el día
            if (!empty($paciente->fecha_nacimiento)) {
                $paciente->fecha_nacimiento = Carbon::parse($paciente->fecha_nacimiento)->day;
            }

            // Convertir tipo de documento
            $tipos = [
                1 => 'DNI',
                4 => 'CEX',
                0 => 'Desconocido'
            ];
            $paciente->tipodocumento = $tipos[$paciente->tipodocumento] ?? 'Otro';

            return $paciente;
        });

        return $this->pacientes;
    }


    /**
     * Define los encabezados de las columnas para el archivo Excel.
     */
    public function headings(): array
    {
        // Convertir el número del mes a nombre en español
        $mesNombre = $this->getNombreMes($this->mes);
        
        return [
            // Título centrado con el mes seleccionado
            [ 'PACIENTES QUE CUMPLEN AÑOS EN EL MES DE: ' . $this->mes ],

            [], // Deja una fila vacía para separar el título del encabezado

            // Encabezados de las columnas
            ['Nombre del Paciente', 'Historia', 'Tipo de Documento', 'Número de Documento', 'Teléfono', 'Email', 'Día'], // Cambiado "Día" por "Fecha de Nacimiento"
        ];
    }

    /**
     * Obtiene el nombre del mes en español.
     */
    private function getNombreMes($mes)
    {
        // Array de los nombres de los meses en español
        $meses = [
            '1' => 'Enero', '2' => 'Febrero', '3' => 'Marzo', '4' => 'Abril',
            '5' => 'Mayo', '6' => 'Junio', '7' => 'Julio', '8' => 'Agosto',
            '9' => 'Septiembre', '10' => 'Octubre', '11' => 'Noviembre', '12' => 'Diciembre'
        ];

        // Devolver el nombre del mes o "Mes desconocido" si no es válido
        return isset($meses[$mes]) ? $meses[$mes] : 'Mes desconocido';
    }

    /**
     * Definir el estilo de las celdas.
     */
    public function styles($sheet)
    {
        // Título en la primera fila
        $sheet->mergeCells('A1:G1');  // Fusiona las celdas para el título
        $sheet->getStyle('A1')->getFont()->setBold(true);
        $sheet->getStyle('A1')->getFont()->setSize(14);
        $sheet->getStyle('A1')->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

        // Fila vacía (A2:F2) no tiene estilo

        // Estilo para la cabecera (fila 3)
        $sheet->getStyle('A3:G3')->getFont()->setBold(true);
        $sheet->getStyle('A3:G3')->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
        $sheet->getStyle('A3:G3')->getFill()->getStartColor()->setRGB('ADD8E6'); // Azul suave para la fila de encabezados

        // Autoajustar el ancho de las columnas
        foreach (range('A', 'G') as $column) {
            $sheet->getColumnDimension($column)->setAutoSize(true);
        }
    }

    /**
     * Establece el formato de la fecha en la columna 'Fecha de Nacimiento' como d/m/y
     */
    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $sheet = $event->sheet;

                // Autoajustar el ancho de las columnas basándose en el contenido
                foreach (range('A', 'G') as $column) {
                    $sheet->getColumnDimension($column)->setAutoSize(true);
                }
            },
        ];
    }
}
