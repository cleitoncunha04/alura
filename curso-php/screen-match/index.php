<?php
require __DIR__ . '/src/Modelo/Avaliavel.php';
require __DIR__ . '/src/Modelo/Genero.php';
require __DIR__ . '/src/Modelo/Titulo.php';
require __DIR__ . '/src/Modelo/Episodio.php';
require __DIR__ . '/src/Modelo/Serie.php';
require __DIR__ . '/src/Modelo/Filme.php';
require __DIR__ . '/src/Calculos/CalculadoraMaratona.php';
require __DIR__ . '/src/Calculos/ConversorNotaEstrela.php';

echo "Bem-vindo(a) ao ScreenMatch!\n";

$filme = new Filme(
    nome: "Thor - Ragnarok",
    anoLancamento: 2021,
    genero: Genero::SuperHeroi,
    duracaoEmMinutos: 122,
);

$filme->avaliarNota(10);
$filme->avaliarNota(10);
$filme->avaliarNota(7.3);
$filme->avaliarNota(8.2);


var_dump($filme);

echo $filme->genero->value . "\n";

echo $filme->calcularMediaNotas() . PHP_EOL;

$serie = new Serie(
    nome: "Lost",
    anoLancamento: 2007,
    genero: Genero::Drama,
    temporadas: 10,
    episodiosPorTemporada: 20,
    minutosPorEpisodio: 45
);

$episodio = new Episodio(
    serie: $serie,
    nome: "Episódio Piloto",
    numeroEpisodio: 1
);

echo $serie->anoLancamento . "\n";

$serie->avaliarNota(8);
$serie->avaliarNota(7.3);

echo $serie->calcularMediaNotas() . PHP_EOL;

$calculadoraMaratona = new CalculadoraMaratona();

$calculadoraMaratona->incluirTitulo($filme);

$calculadoraMaratona->incluirTitulo($serie);

echo "Será necessário " . $calculadoraMaratona->getDuracaoMaratona() . " minutos para maratonar tudo!\n";

$conversor = new ConversorNotaEstrela();

echo $conversor->converterNotaEstrela($serie) . PHP_EOL . $conversor->converterNotaEstrela($filme) . PHP_EOL;
