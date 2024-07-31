<?php

namespace ScreenMatch\Modelo;

//mecanismo para reutilizar códigos sem duplicação -> herança horizontal, apenas utiliza o "serviço" -> não devem ser usadas como "tipo"
trait ComAvaliacao
{
    private array $notas = [];

    public function avaliarNota(float $nota): void
    {
        //o "this" é o ponteiro que aponta para o endereço do objeto que executou o método
        if ($nota >= 0 && $nota <= 10) {
            $this->notas[] = $nota;
        }
    }

    public function calcularMediaNotas(): float
    {
        return array_sum($this->notas) / count($this->notas);
    }
}