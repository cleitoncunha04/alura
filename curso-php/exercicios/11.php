<?php
//Escreva uma função em PHP que receba um array de strings por parâmetro e o retorne ordenado em ordem alfabética.

function ordernarAlfabeticamente(array $strings): array
{
    sort($strings);

    return $strings;
}

$strings = ["Matheus", "Felipe", "Carlitos"];

$strings = ordernarAlfabeticamente($strings);

var_dump($strings);