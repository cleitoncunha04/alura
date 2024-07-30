<?php

class Filme
{
    private string $nome;
    private int $anoLancamento;
    private string $genero;

    private array $notas = [];

    public function getNome(): string
    {
        return $this->nome;
    }

    public function setNome(string $nome): void
    {
        $this->nome = $nome;
    }

    public function getAnoLancamento(): int
    {
        return $this->anoLancamento;
    }

    public function setAnoLancamento(int $anoLancamento): void
    {
        $this->anoLancamento = $anoLancamento;
    }

    public function getGenero(): string
    {
        return $this->genero;
    }

    public function setGenero(string $genero): void
    {
        $this->genero = $genero;
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