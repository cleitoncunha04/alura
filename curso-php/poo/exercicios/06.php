<?php
/*Escreva uma função em PHP que receba dois números inteiros e uma string representando a operação matemática e retorne o resultado da operação.*/

function calcular(float $num1, float $num2, string $operacao): float
{
    $resultado = 0.0;
    switch ($operacao) {
        case "+" :
            $resultado = $num1 + $num2;
            break;
        case "-" :
            $resultado = $num1 - $num2;
            break;
        case "*" :
            $resultado = $num1 * $num2;
            break;
        case "/" :
            $resultado = $num1 / $num2;
            break;
        default:
            echo "Operação inválida\n";
            break;
    }

    return $resultado;
}

$resultado = calcular($argv[1],$argv[2], $argv[3]);

echo $resultado;