<?php
$totalConta = 1000.00;
function clearScreen() {
    if (strncasecmp(PHP_OS, 'WIN', 3) == 0) {
        system('cls');
    } else {
        system('clear');
    }
}

function exibirSaldo($totalConta)
{
    echo "----------------\nTitular: Cleiton Cunha\nSaldo: R$" . number_format($totalConta, 2 , "," , "."). "\n----------------\n";
}

function exibirMenu()
{
    echo "----------------\n1 - Consultar saldo\n2 - Sacar valor\n3 - Depositar valor\n4 - Sair\n----------------\n";

    echo "Escolha uma opção: \n";
    return (int) fgets(STDIN);
}

function sacarValor($quantia, $totalConta) {
    if ($quantia <= $totalConta) {
        $totalConta -= $quantia;
    } else {
        echo "Saldo insuficiente\n";
    }
    return $totalConta;
}

function depositarValor($quantia, $totalConta) {
    if ($quantia > 0) {
        $totalConta += $quantia;
    } else {
      echo "Valor inválido\n";
    }

    return $totalConta;
}

exibirSaldo($totalConta);

do {
    $opcao = exibirMenu();

    switch ($opcao) {
        case 1:
            exibirSaldo($totalConta);
            break;
        case 2:
            echo "Informe a quantia a ser sacada: \n";
            $quantia = (float) fgets(STDIN);
            $totalConta = sacarValor($quantia, $totalConta);
            break;
        case 3:
            echo "Informe a quantia a ser depositada: \n";
            $quantia = (float) fgets(STDIN);
            $totalConta = depositarValor($quantia, $totalConta);
            break;
        case 4:
            exit("Saindo...\n");
            break;
        default:
            echo "Escolha uma opção válida\n";
            break;
    }
    clearScreen();
} while ($opcao != 4);

echo "Programa encerrado.\n";

