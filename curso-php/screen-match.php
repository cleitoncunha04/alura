<?php
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
$notaFilme = array_sum($notas) / count($notas);

$planoPrime = true;

$incluidoPlano = $planoPrime || $anoLancamento < 2020;

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

echo $anoLancamento > 2023
    ? "Este filme é um lançamento\n"
    : ($anoLancamento > 2020
        ? "Este filme ainda é novo\n"
        : "Este filme não é um lançamento\n");


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
$filme = [
    "nome" => "Thor: Ragnarok",
    "ano" => 2021,
    "nota" => 7.8,
    "genero" => "Super-Herói"
];

echo $filme["nome"] . PHP_EOL;
