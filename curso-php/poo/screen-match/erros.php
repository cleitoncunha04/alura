<?php

use ScreenMatch\Calculos\ConversorNotaEstrela;
use ScreenMatch\Modelo\Episodio;
use ScreenMatch\Modelo\Genero;
use ScreenMatch\Modelo\Serie;

require 'autoload.php';

$serie = new Serie("Teste", 2024, Genero::Acao, 5, 10, 50);

$episodio = new Episodio($serie, "Piloto", 1);

try {
    $episodio->avaliarNota(10);
    $episodio->avaliarNota(-5);

    $conversor = new ConversorNotaEstrela();

    echo $conversor->converterNotaEstrela($episodio);
} catch (Exception $e) {
    echo "Erro: " . $e->getMessage();
}
