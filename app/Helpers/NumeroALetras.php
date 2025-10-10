<?php

namespace App\Helpers;

class NumeroALetras
{
    public static function unidad($numero)
    {
        $numero = (int)$numero; // <-- Añadir esto soluciona el error
        return match ($numero) {
            9 => "NUEVE",
            8 => "OCHO",
            7 => "SIETE",
            6 => "SEIS",
            5 => "CINCO",
            4 => "CUATRO",
            3 => "TRES",
            2 => "DOS",
            1 => "UNO",
            0 => "",
        };
    }


    public static function decena($numero)
    {
        if ($numero >= 90) return "NOVENTA" . ($numero > 90 ? " Y " . self::unidad($numero - 90) : "");
        if ($numero >= 80) return "OCHENTA" . ($numero > 80 ? " Y " . self::unidad($numero - 80) : "");
        if ($numero >= 70) return "SETENTA" . ($numero > 70 ? " Y " . self::unidad($numero - 70) : "");
        if ($numero >= 60) return "SESENTA" . ($numero > 60 ? " Y " . self::unidad($numero - 60) : "");
        if ($numero >= 50) return "CINCUENTA" . ($numero > 50 ? " Y " . self::unidad($numero - 50) : "");
        if ($numero >= 40) return "CUARENTA" . ($numero > 40 ? " Y " . self::unidad($numero - 40) : "");
        if ($numero >= 30) return "TREINTA" . ($numero > 30 ? " Y " . self::unidad($numero - 30) : "");
        if ($numero >= 20) return $numero == 20 ? "VEINTE" : "VEINTI" . strtolower(self::unidad($numero - 20));

        return match ($numero) {
            19 => "DIECINUEVE",
            18 => "DIECIOCHO",
            17 => "DIECISIETE",
            16 => "DIECISEIS",
            15 => "QUINCE",
            14 => "CATORCE",
            13 => "TRECE",
            12 => "DOCE",
            11 => "ONCE",
            10 => "DIEZ",
            default => self::unidad($numero),
        };
    }

    public static function centena($numero)
    {
        if ($numero >= 900) return "NOVECIENTOS" . ($numero > 900 ? " " . self::decena($numero - 900) : "");
        if ($numero >= 800) return "OCHOCIENTOS" . ($numero > 800 ? " " . self::decena($numero - 800) : "");
        if ($numero >= 700) return "SETECIENTOS" . ($numero > 700 ? " " . self::decena($numero - 700) : "");
        if ($numero >= 600) return "SEISCIENTOS" . ($numero > 600 ? " " . self::decena($numero - 600) : "");
        if ($numero >= 500) return "QUINIENTOS" . ($numero > 500 ? " " . self::decena($numero - 500) : "");
        if ($numero >= 400) return "CUATROCIENTOS" . ($numero > 400 ? " " . self::decena($numero - 400) : "");
        if ($numero >= 300) return "TRESCIENTOS" . ($numero > 300 ? " " . self::decena($numero - 300) : "");
        if ($numero >= 200) return "DOSCIENTOS" . ($numero > 200 ? " " . self::decena($numero - 200) : "");
        if ($numero >= 100) return $numero == 100 ? "CIEN" : "CIENTO " . self::decena($numero - 100);

        return self::decena($numero);
    }

    public static function miles($numero)
    {
        if ($numero >= 1000 && $numero < 2000)
            return "MIL " . self::centena($numero % 1000);

        if ($numero >= 2000 && $numero < 10000)
            return self::unidad(floor($numero / 1000)) . " MIL " . self::centena($numero % 1000);

        return self::centena($numero);
    }

    public static function decmiles($numero)
    {
        if ($numero == 10000)
            return "DIEZ MIL";
        if ($numero > 10000 && $numero < 20000)
            return self::decena(floor($numero / 1000)) . " MIL " . self::centena($numero % 1000);
        if ($numero >= 20000 && $numero < 100000)
            return self::decena(floor($numero / 1000)) . " MIL " . self::miles($numero % 1000);

        return self::miles($numero);
    }

    public static function cienmiles($numero)
    {
        if ($numero == 100000)
            return "CIEN MIL";
        if ($numero > 100000 && $numero < 1000000)
            return self::centena(floor($numero / 1000)) . " MIL " . self::centena($numero % 1000);

        return self::decmiles($numero);
    }

    public static function millon($numero)
    {
        if ($numero >= 1000000 && $numero < 2000000)
            return "UN MILLÓN " . self::cienmiles($numero % 1000000);
        if ($numero >= 2000000 && $numero < 10000000)
            return self::unidad(floor($numero / 1000000)) . " MILLONES " . self::cienmiles($numero % 1000000);

        return self::cienmiles($numero);
    }

    public static function decmillon($numero)
    {
        if ($numero == 10000000)
            return "DIEZ MILLONES";
        if ($numero > 10000000 && $numero < 20000000)
            return self::decena(floor($numero / 1000000)) . " MILLONES " . self::cienmiles($numero % 1000000);
        if ($numero >= 20000000 && $numero < 100000000)
            return self::decena(floor($numero / 1000000)) . " MILLONES " . self::millon($numero % 1000000);

        return self::millon($numero);
    }

    public static function convertir(int $numero): string
    {
        return trim(self::decmillon($numero));
    }
    public static function convertirMoneda(float $numero): string
    {
        $numero = number_format($numero, 2, '.', '');
        $partes = explode('.', $numero);

        $parteEntera = (int)$partes[0];
        $parteDecimal = isset($partes[1]) ? str_pad($partes[1], 2, '0', STR_PAD_RIGHT) : '00';

        $texto = self::convertir($parteEntera);
        return "SON: {$texto} Y {$parteDecimal}/100 SOLES";
    }

}
