<?php

namespace Cleitoncunha04\BuscadorCursosAlura;

use GuzzleHttp\ClientInterface;
use GuzzleHttp\Exception\GuzzleException;
use Symfony\Component\DomCrawler\Crawler;

class Buscador
{
    //**
     //* @var ClientInterface
     /*/
    //private $httpClient;
    /**
     * @var Crawler
     */
    //private $crawler;

    //constructor property promotion
    public function __construct(
        public readonly ClientInterface $httpClient,
        public readonly Crawler $crawler
    ) {
    }

    public function buscarConteudo(string $url): array
    {
        $cursos = [];

        try {
            $resposta = $this->httpClient->request('GET', $url);

            $html = $resposta->getBody();

            $this->crawler->addHtmlContent($html, 'UTF-8');

            //gerei uma lista de cursos pesquisando pelo seletor CSS
            $elementosCursos = $this->crawler->filter('span.card-curso__nome');

            //a lista retornou um "DOM", então fiz um foreach para pegar os textContent's (títulos dos cursos)
            foreach ($elementosCursos as $elemento) {
                $cursos[] = $elemento->textContent;
            }
        } catch (GuzzleException $e) {
            $cursos[] = "Ocorreu um erro ao buscar o curso: " . $e->getMessage();
        }

        if (count($cursos) == 0) {
            $cursos[] = "Nenhum curso encontrado";
        }

        return $cursos;
    }
}
