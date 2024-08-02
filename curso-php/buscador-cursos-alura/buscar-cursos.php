<?php
require_once "vendor/autoload.php";

use Cleitoncunha04\BuscadorCursosAlura\Buscador;
use GuzzleHttp\Client;
use Symfony\Component\DomCrawler\Crawler;

//desativei a verificação SSL e defini como url base o site da Alura
$client = new Client(['verify' => false, 'base_uri' => 'https://www.alura.com.br']);

//"robo" que busca dados na interntet -> pesquisa e extração de dados em tempo real
$crawler = new Crawler();

$buscador = new Buscador($client, $crawler);

$cursos = $buscador->buscarConteudo('/cursos-online-programacao/php');


foreach ($cursos as $curso) {
    echo $curso . PHP_EOL;
}
