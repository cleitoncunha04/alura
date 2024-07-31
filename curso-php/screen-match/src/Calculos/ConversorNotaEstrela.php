<?php

namespace ScreenMatch\Calculos;

use ScreenMatch\Modelo\Avaliavel;

class  ConversorNotaEstrela {
    public function converterNotaEstrela(Avaliavel $avaliavel): float
    {
        $nota = $avaliavel->calcularMediaNotas();

        return round($nota) / 2;
    }
}