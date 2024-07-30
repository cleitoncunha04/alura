<?php

class Filme
{
    private string $nome;
    private int $anoLancamento;
    private float $nota;
    private string $genero;

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

    public function getNota(): float
    {
        return $this->nota;
    }

    public function setNota(float $nota): void
    {
        $this->nota = $nota;
    }

    public function getGenero(): string
    {
        return $this->genero;
    }

    public function setGenero(string $genero): void
    {
        $this->genero = $genero;
    }
}