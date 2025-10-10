<?php

namespace App\Exports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;

class PacientesGeneralExport implements FromCollection, WithHeadings, WithStyles, WithEvents
{
    protected $pacientes;

    public function __construct(Collection $pacientes)
    {
        //Log::info('PacientesGeneralExport::__construct - pacientes recibidos: ' . $pacientes->count());
        $this->pacientes = $pacientes;
    }

    public function collection()
    {
        return $this->pacientes->map(function ($item) {
            $array = (array) $item;

            // Convertir tipo de documento
            $tipos = [
                1 => 'DNI',
                4 => 'CEX',
                0 => 'Desconocido'
            ];
            $array['tipodocumento'] = $tipos[$array['tipodocumento']] ?? 'Otro';

            // Formatear fechas
            if (!empty($array['fecha_nacimiento'])) {
                $array['fecha_nacimiento'] = Carbon::parse($array['fecha_nacimiento'])->format('d/m/Y');
            }

            if (!empty($array['ultima_cita'])) {
                $array['ultima_cita'] = Carbon::parse($array['ultima_cita'])->format('d/m/Y');
            }

            return $array;
        });
    }

    public function headings(): array
    {
        //Log::info('PacientesGeneralExport::headings - generando encabezados');

        // Prueba con encabezados simples para evitar errores de estructura
        return [
            'Historia',
            'Tipo Documento',
            'Nro Documento',
            'Nombre Paciente',
            'Email',
            'Dirección',
            'Teléfono',
            'Fecha Nacimiento',
            'Fecha Última Cita',
            'Observación'
        ];
    }

    public function styles($sheet)
    {
        //Log::info('PacientesGeneralExport::styles - aplicando estilos');

        // Encabezado en negrita
        $sheet->getStyle('A1:J1')->getFont()->setBold(true);
        $sheet->getStyle('A1:J1')->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

        // Color para encabezados
        $sheet->getStyle('A1:J1')->getFill()->setFillType(\PhpOffice\PhpSpreadsheet\Style\Fill::FILL_SOLID);
        $sheet->getStyle('A1:J1')->getFill()->getStartColor()->setRGB('ADD8E6');

        // Autoajuste de columnas
        foreach (range('A', 'J') as $column) {
            $sheet->getColumnDimension($column)->setAutoSize(true);
        }
    }

    public function registerEvents(): array
    {
        //Log::info('PacientesGeneralExport::registerEvents - configurando evento AfterSheet');

        return [
            AfterSheet::class => function (AfterSheet $event) {
                foreach (range('A', 'J') as $column) {
                    $event->sheet->getColumnDimension($column)->setAutoSize(true);
                }
                //Log::info('PacientesGeneralExport::AfterSheet - evento ejecutado correctamente');
            },
        ];
    }
}
