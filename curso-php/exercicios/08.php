<?php
/*Crie uma função em PHP que converta graus celsius para Fahrenheit.*/
function converterCelsiusFahrenheit(float $temperatura): float  {
    return ($temperatura * 1.8) + 32;
}

echo converterCelsiusFahrenheit($argv[1]);

