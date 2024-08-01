<?php
//Escreva um programa em PHP que inicialize um array de notas e exiba somente as 3 maiores notas do array.

$notas = [4, 2, 3, 1];

sort($notas);

for ($i = count($notas); $i >= count($notas) - 3; $i--) {
    echo $notas[$i] . PHP_EOL;
}

