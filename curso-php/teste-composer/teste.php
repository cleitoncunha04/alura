<?php

use Cleitoncunha04\BuscadorCursosAlura\Buscador;
use GuzzleHttp\Client;
use Symfony\Component\DomCrawler\Crawler;

require_once "vendor/autoload.php";

$client = new Client(['verify' => false, 'base_uri' => 'https://www.alura.com.br']);

$crawler = new Crawler();

$buscador = new Buscador($client, $crawler);

$cursos = $buscador->buscarConteudo('/cursos-online-programacao/php');

foreach ($cursos as $curso) {
    echo $curso . PHP_EOL;
}