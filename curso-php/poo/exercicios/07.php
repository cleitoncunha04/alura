<?php
/*Crie uma função em PHP que calcule o IMC baseado na altura e peso passados por parâmetro.*/

function calcularImc(float $altura, float $peso) : float
{
    return  $peso / ($altura * $altura);
}

echo number_format(calcularImc($argv[1], $argv[2]), 2, "," , ".");