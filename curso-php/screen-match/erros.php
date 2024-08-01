<?php

use ScreenMatch\Modelo\Episodio;
use ScreenMatch\Modelo\Genero;
use ScreenMatch\Modelo\Serie;

require 'autoload.php';

$serie = new Serie("Teste", 2024, Genero::Acao, 5, 10, 50);

$episodio = new Episodio($serie, "Piloto", 1);

$episodio->avaliarNota(10);
$episodio->avaliarNota(5);

echo $episodio->calcularMediaNotas();