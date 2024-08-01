<?php

namespace ScreenMatch\Modelo;

//especie de classe sem atributos com todos os métodos abstratos
interface Avaliavel
{
    public function avaliarNota(float $nota): void;

    public function calcularMediaNotas(): float;
}