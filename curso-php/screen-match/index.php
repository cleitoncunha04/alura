<?php
require __DIR__ . '/src/Modelo/Filme.php';
require __DIR__ . '/src/funcoes.php';

echo "Bem-vindo(a) ao ScreenMatch!\n";

$filme = new Filme();
//$filme = criarFilme(nome: "Thor - Ragnarok", anoLancamento: 2021, genero: "Super-Heroi");

$filme->setNome("Thor - Ragnarok");
$filme->setAnoLancamento(2021);
$filme->setGenero("Super-herói");

$filme->avaliarNota(10);
$filme->avaliarNota(10);
$filme->avaliarNota(7.3);
$filme->avaliarNota(8.2);


var_dump($filme);

echo number_format($filme->calcularMediaNotas(), 2, ',', '.');