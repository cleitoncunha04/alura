<?php

namespace ScreenMatch\Calculos;

use ScreenMatch\Modelo\Titulo;
class CalculadoraMaratona
{
    private int $duracaoMaratona = 0;

    public function incluirTitulo(Titulo $titulo): void
    {
        //criei o esse método no Titulo, especie de método abstrato e sobreescrevi ele nas classes Filme e Serie
        $this->duracaoMaratona += $titulo->calcularDuracaoEmMinutos();
    }

    public function getDuracaoMaratona(): int
    {
        return $this->duracaoMaratona;
    }
}