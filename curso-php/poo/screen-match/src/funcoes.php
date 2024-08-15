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

function criarFilme(string $nome, int $anoLancamento, string $genero, float $nota): array
{
    $filme = [
        "nome" => $nome,
        "anoLancamento" => $anoLancamento,
        "genero" => $genero,
        "nota" => $nota,
    ];

    return $filme;
}