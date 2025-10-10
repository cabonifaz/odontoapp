<?php

namespace App\Exports;

use App\Models\ProductoAlmacen;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Concerns\WithMapping;

class StockMinimoExport implements FromCollection, WithHeadings, WithTitle, WithStyles, ShouldAutoSize, WithMapping
{
    public function collection()
    {
        return ProductoAlmacen::whereColumn('stock', '<', 'stock_minimo')
            ->with('usuario')
            ->get();
    }

    public function headings(): array
    {
        return [
            'Nombre',
            'Presentación',
            'Fecha Ingreso',
            'Stock',
            'Stock Mínimo',
            'Precio Compra',
            'Registrado Por'
        ];
    }

    public function map($producto): array
    {
        return [
            $producto->nombre,
            $producto->presentacion,
            \Carbon\Carbon::parse($producto->fecha_ingreso)->format('d/m/Y'),
            $producto->stock,
            $producto->stock_minimo,
            number_format($producto->precio_compra, 2),
            optional($producto->usuario)->name ?? '-',
        ];
    }

    public function styles(Worksheet $sheet)
    {
        // Estilo de encabezados
        $sheet->getStyle('A1:G1')->getFont()->setBold(true);
        $sheet->getStyle('A1:G1')->getFill()->setFillType('solid')->getStartColor()->setRGB('EFEFEF');
    }

    public function title(): string
    {
        return 'Relación de productos con stock mínimo';
    }
}
