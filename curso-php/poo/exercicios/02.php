<?php
/*2 - Percorra um array de notas (cada uma de 0 a 10) e exiba a nota do
aluno em questão com a informação se o aluno foi aprovado ou não.*/

$notas = [6, 8, 9, 7, 8, 4, 7, 3, 9, 0];

foreach ($notas as $nota) {
    $resultado = $nota > 6
        ? "O aluno foi aprovado"
        : "O aluno foi reprovado";
    echo $resultado . " com a nota " . number_format($nota, 2, ',', '.') . "\n";
}