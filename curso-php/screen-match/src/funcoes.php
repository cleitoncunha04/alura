<?php
function isIncluidoPlano(bool $planoPrime, int $anoLancamento): bool
{
    return $planoPrime || $anoLancamento < 2020;
}

function exibirMensagemLancamento(int $anoLancamento): void
{
    echo $anoLancamento > 2023
        ? "Este filme é um lançamento\n"
        : ($anoLancamento > 2020
            ? "Este filme ainda é novo\n"
            : "Este filme não é um lançamento\n");
}

function criarFilme(string $nome, int $ano, float $nota, string $genero): Filme
{
    $filme = new Filme();

    $filme-> setNome($nome);
    $filme-> setAnoLancamento($ano);
    $filme-> setNota($nota);
    $filme-> setGenero($genero);

    return $filme;
}