<?php

namespace ScreenMatch\Modelo;

use InvalidArgumentException;
use ScreenMatch\Exception\NotaInvalidaException;

//mecanismo para reutilizar códigos sem duplicação -> herança horizontal, apenas utiliza o "serviço" -> não devem ser usadas como "tipo"
trait ComAvaliacao
{
    private array $notas = [];

    /**
     * @throws NotaInvalidaException Se a nota não estiver entre 0 e 10
     */
    public function avaliarNota(float $nota): void
    {
        //o "this" é o ponteiro que aponta para o endereço do objeto que executou o método
        if ($nota >= 0 && $nota <= 10) {
            $this->notas[] = $nota;
        } else {
            throw new NotaInvalidaException();
        }
    }

    public function calcularMediaNotas(): float
    {
        return array_sum($this->notas) == 0
            ? 0 :
            array_sum($this->notas) / count($this->notas);
    }
}