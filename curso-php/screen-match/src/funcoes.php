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

function criarFilme(string $nome, int $ano, float $nota, string $genero): array
{
    return [
        "nome" => $nome,
        "ano" => $ano,
        "nota" => $nota,
        "genero" => $genero
    ];
}