<?php

namespace ScreenMatch\Calculos;

use Throwable;
use ScreenMatch\Modelo\Avaliavel;

class  ConversorNotaEstrela
{
    public function converterNotaEstrela(Avaliavel $avaliavel): float
    {
        try {
            $nota = $avaliavel->calcularMediaNotas();

            return round($nota) / 2;
        } catch (Throwable) {
            return 0;
        }
    }
}