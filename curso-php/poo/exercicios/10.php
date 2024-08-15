<?php
//Crie um programa em PHP que transforme a string “Vinicius Dias,1997,Programador” em um array em que cada item está separado por vírgulas.

$string = "Vinicius Dias,1997,Programador";

$array = explode(",", $string);

var_dump($array);