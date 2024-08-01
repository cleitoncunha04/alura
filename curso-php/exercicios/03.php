<?php
/*3 - Defina um array associativo que representa uma conta bancária
(com titular e saldo) e exiba suas informações na tela.*/

$contasBancarias = [
    array(
        "titular" => "Cleiton Cunha",
        "saldo" => 100.00,
    ),
    array(
        "titular" => "Carlitos Vieira",
        "saldo" => 249.99,
    )
];

foreach ($contasBancarias as $contaBancaria) {
    echo "Nome: " . $contaBancaria["titular"] . PHP_EOL .
    "Saldo: R$ " . number_format($contaBancaria["saldo"], 2, "," , ".") . PHP_EOL;
}

//print_r($contasBancarias);
