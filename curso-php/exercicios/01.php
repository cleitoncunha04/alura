<?php
/*1 - Escreva um programa em PHP que remova os elementos duplicados de um array fornecido
como entrada e exiba o array resultante. Por exemplo, se o array for [1, 2, 2, 3, 4, 4, 5],
o programa deve exibir [1, 2, 3, 4, 5].*/

$numeros = [1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10 ,10];

//$numerosUnicos = array_values(array_unique($numeros));

$numerosUnicos = [];

foreach ($numeros as $numero) {
    if(!in_array($numero, $numerosUnicos)) {
        $numerosUnicos[] = $numero;
    }
}

print_r($numerosUnicos);
