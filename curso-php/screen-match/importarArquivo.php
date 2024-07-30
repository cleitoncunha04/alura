<?php
$caminhoArquivo = __DIR__ . "/filmes.json";

$conteudoArquivoFilme = file_get_contents($caminhoArquivo);

$filme = json_decode($conteudoArquivoFilme, true);

var_dump($filme);