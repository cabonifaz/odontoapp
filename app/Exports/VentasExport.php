<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithCustomStartCell;
use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;

class VentasExport implements FromCollection, WithHeadings, WithStyles, WithCustomStartCell, WithEvents
{
    protected $facturaciones;
    protected $fechaInicio;
    protected $fechaFin;

    public function __construct($facturaciones, $fechaInicio, $fechaFin)
    {
        $this->facturaciones = $facturaciones;
        $this->fechaInicio = $fechaInicio;
        $this->fechaFin = $fechaFin;
    }

    public function startCell(): string
    {
        return 'A3'; // Inicia los datos desde A3
    }

    public function collection()
    {
        $totalImporte = 0;
        $exportData = $this->facturaciones->map(function ($facturacion) use (&$totalImporte) {
            $esNotaCredito = isset($facturacion->isNotaCredito) && $facturacion->isNotaCredito;

            $nombreOMostrar = isset($facturacion->paciente) 
                ? $facturacion->paciente->ape_paterno . ' ' . $facturacion->paciente->ape_materno . ' ' . $facturacion->paciente->nombres 
                : ($facturacion->razon_social ?? 'Sin Cliente');

            $estado = $esNotaCredito ? 'Anulado con Nota de Crédito' : ($facturacion->baja == 1 ? ($facturacion->ident ? 'Anulado - Comunicación de Baja' : 'Anulado con Nota de Crédito') : 'Activo');

            $fechaBajaNota = $esNotaCredito
                ? $facturacion->nota_credito->fecha
                : ($facturacion->baja == 1 ? $facturacion->fecha_baja : null);

            $fechaBajaNotaFormat = $fechaBajaNota ? \Carbon\Carbon::parse($fechaBajaNota)->format('d/m/Y') : '-';

            $medioPago = 'Desconocido';
            if (!$esNotaCredito) {
                switch ($facturacion->medio_pago) {
                    case 1: $medioPago = 'Efectivo'; break;
                    case 2: $medioPago = 'Tarjeta'; break;
                    case 3: $medioPago = 'Yape'; break;
                    case 4: $medioPago = 'Plin'; break;
                    case 5: $medioPago = 'Transferencia'; break;
                    default: $medioPago = 'Desconocido'; break;
                }
            } else {
                $medioPago = 'No Aplica';
            }

            // Acumular solo los importes positivos
            if ($facturacion->importe > 0 && $facturacion->baja == 0) {
                $totalImporte += $facturacion->importe;
            }

            return [
                'Fecha' => \Carbon\Carbon::parse($facturacion->fecha)->format('d/m/Y H:i:s'),
                'Documento' => $esNotaCredito ? $facturacion->nota_credito->serie . '-' . $facturacion->nota_credito->numdoc : $facturacion->serie . '-' . $facturacion->numdoc,
                'Cliente' => $nombreOMostrar,
                'Importe' => $facturacion->importe,
                'Medio de Pago' => $medioPago,
                'Estado' => $estado,
                'Fecha Baja/Nota' => $fechaBajaNotaFormat,
            ];
        });

        // Añadir fila de total al final
        $exportData->push([
            'Fecha' => '',
            'Documento' => '',
            'Cliente' => 'TOTAL',
            'Importe' => $totalImporte,
            'Medio de Pago' => '',
            'Estado' => '',
            'Fecha Baja/Nota' => '',
        ]);

        return $exportData;
    }

    public function headings(): array
    {
        return [
            'Fecha',
            'Documento',
            'Cliente',
            'Importe',
            'Medio de Pago',
            'Estado',
            'Fecha Baja/Nota',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        $sheet->mergeCells('A1:G1'); // Combina las columnas A1 a G1 para el título
        $sheet->setCellValue('A1', 'Reporte de ventas del ' . \Carbon\Carbon::parse($this->fechaInicio)->format('d/m/Y') . ' al ' . \Carbon\Carbon::parse($this->fechaFin)->format('d/m/Y'));

        return [
            'A1' => ['font' => ['bold' => true, 'size' => 14], 'alignment' => ['horizontal' => 'center']],
            'A3:G3' => ['font' => ['bold' => true, 'size' => 12], 'fill' => ['fillType' => 'solid', 'startColor' => ['rgb' => '87CEEB']], 'alignment' => ['horizontal' => 'center']],
        ];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                $sheet = $event->sheet->getDelegate();
    
                // Autoajustar las columnas
                foreach (range('A', 'G') as $column) {
                    $sheet->getColumnDimension($column)->setAutoSize(true);
                }
    
                // Aplicar bordes a la tabla completa
                $highestRow = $sheet->getHighestRow();
                $highestColumn = $sheet->getHighestColumn();
                $sheet->getStyle('A3:' . $highestColumn . $highestRow)->applyFromArray([
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['rgb' => '000000'],
                        ],
                    ],
                ]);
    
                // Alinear el importe a la derecha
                $sheet->getStyle('D4:D' . $highestRow)->getAlignment()->setHorizontal('right');
    
                // Pintar filas anuladas
                for ($row = 4; $row <= $highestRow; $row++) {
                    $estadoCell = $sheet->getCell('F' . $row)->getValue(); // Columna "Estado"
                    if (str_contains($estadoCell, 'Anulado')) {
                        $sheet->getStyle("A{$row}:G{$row}")->applyFromArray([
                            'font' => ['color' => ['rgb' => 'FF0000']], // Texto rojo
                        ]);
                    }
                }
            },
        ];
    }    
}
