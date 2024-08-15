<?php
/*4 - Crie um array contendo nomes de familiares seus e
após sua criação adicione mais elementos ao array.*/

$nomes = ["Fulano", "Ciclano", "Deutrano"];

$nomes[] = "Carlitos";

foreach ($nomes as $nome) {
    echo $nome . PHP_EOL;
}