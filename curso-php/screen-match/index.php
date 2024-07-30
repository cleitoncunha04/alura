<?php
require __DIR__ . '/src/Modelo/Genero.php';
require __DIR__ . '/src/Modelo/Filme.php';

echo "Bem-vindo(a) ao ScreenMatch!\n";

$filme = new Filme(
    nome: "Thor - Ragnarok",
    anoLancamento: 2021,
    genero: Genero::SuperHeroi,
);

$filme->avaliarNota(10);
$filme->avaliarNota(10);
$filme->avaliarNota(7.3);
$filme->avaliarNota(8.2);


var_dump($filme);

echo $filme->genero->value . "\n";

echo number_format($filme->calcularMediaNotas(), 2, ',', '.');