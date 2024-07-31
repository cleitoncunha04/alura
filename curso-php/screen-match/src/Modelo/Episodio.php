<?php

class Episodio implements Avaliavel
{
    private array $notas;
    public function __construct(
        public readonly Serie  $serie,
        public readonly string $nome,
        public readonly int    $numeroEpisodio
    )
    {
        $this->notas = [];
    }

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