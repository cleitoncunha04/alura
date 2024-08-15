<?php
require __DIR__ . '/src/Modelo/Filme.php';

//por padrão busca o arquivo dentro da pasta onde o arquivo .php foi executado -> caminho relativo
//require "funcoes.php";

//o "__DIR__" passa o caminho absoluto para encontrar o arquivo --> traz a pasta onde está o arquivo atual
require __DIR__ . '/src/funcoes.php';

// é possível usar o "include" no lugar do "require". A principal diferença é que o include não dá erro se não encontrar o arquivo.

//TODO teste
echo 'Bem-vindo ao Screen Match!\n';

$nomeFilme = "Se beber não case";
$nomeFilme = "Thor: Ragnarok";
$nomeFilme = "Top Gun - Maverick";
$nomeFilme = "Aa";

//o $argv é um array de todas as informações passadas pelo usuário na hora de
// usar o comando PHP. No caso, a primeira posição, $argv[0] é o nome do arquivo
$anoLancamento = $argv[1] ?? 2022;

$notas = [];

for ($indice = 2; $indice < $argc; $indice++) {
    $notas[] += (float)$argv[$indice];
}

var_dump($notas);
/*$contador = 2;

while ($argv[$contador] < $argc) {
    $somaNotas += (float)$argv[$contador++];
}*/

$somaNotas = 0;

/*for($indice = 0; $indice < count($notas); $indice++) {
    $somaNotas += $notas[$indice];
}*/

/*foreach ($notas as $nota) {
    $somaNotas += $nota;
}*/

//$argc => quantidade de parametros passados ao executar o comando php
$notaFilme = (array_sum($notas)) / count($notas);

$planoPrime = true;

$incluidoPlano = isIncluidoPlano($planoPrime, $anoLancamento);

echo "Nome do filme: $nomeFilme" . PHP_EOL;
echo "Nota do filme: " . number_format($notaFilme, 2, ',', ".") . PHP_EOL;
echo "Ano de lançamento: $anoLancamento" . PHP_EOL;

/*if ($anoLancamento > 2023) {
    echo "Este filme é um lançamento";
} else if ($anoLancamento > 2020) {
    echo "Este filme ainda é novo";
} else {
    echo "Este filme não é um lançamento";
}*/


exibirMensagemLancamento($anoLancamento);

$genero = match ($nomeFilme) {
    "Top Gun - Maverick" => "Ação",
    "Thor: Ragnarok" => "Super-Heroi",
    "Se beber não case" => "Comédia",
    default => "Desconhecido",
};

echo "O gênero do filme é: $genero" . PHP_EOL;

//echo "5" + "10"; -> String numérica, tem como resultado "15"

var_dump($argv);

//array associativo
$filme = criarFilme(
    nome: "Thor: Ragnarok",
    anoLancamento: 2021,
    nota: 7.8,
    genero: "Super-Herói"
);

echo $filme->getAnoLancamento(). PHP_EOL;

var_dump($notas);
echo sort($notas) . PHP_EOL . PHP_EOL;
echo min($notas) . PHP_EOL . PHP_EOL;

$posicaoDoisPontos = strpos($filme->getNome(), ":");
var_dump($posicaoDoisPontos);

//busca a partir da posicao 0 até a posicao dos ":"
var_dump(substr($filme->getNome(), 0, $posicaoDoisPontos));

//echo json_encode($filme) . PHP_EOL;

//var_dump(json_decode('{"nome":"Thor: Ragnarok","ano":2021,"nota":7.8,"genero":"Super-Her\u00f3i"}', true));

$filmeStringJson = json_encode($filme);

//cria um arquivo json --> no 01º p informa o caminho/nome e no 02º o que será escrito
file_put_contents(__DIR__ . "/filmes.json", $filmeStringJson);

