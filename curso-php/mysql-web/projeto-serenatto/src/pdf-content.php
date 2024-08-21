<?php

namespace Vendor\Serenatto;

use Vendor\Serenatto\Connection\Connection;
use Vendor\Serenatto\Repository\ProductRepository;

require_once "../vendor/autoload.php";

$connection = Connection::createConnection();

$repository = new ProductRepository($connection);

$products = $repository->findAll();
?>

<!doctype html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <style>
        /* Estilo geral da tabela */
        table {
            width: 100%;
            border-collapse: collapse;
            font-family: 'Poppins', sans-serif;
            margin: 20px 0;
            font-size: 16px;
            text-align: left;
        }

        /* Estilo para o cabeçalho da tabela */
        thead {
            background-color: #333B1E;
            color: white;
        }

        thead th {
            padding: 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Estilo para as células do corpo da tabela */
        tbody tr {
            border-bottom: 1px solid #dddddd;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        tbody td {
            padding: 12px;
        }

        /* Estilo para a primeira coluna */
        tbody td:first-child {
            font-weight: 500;
            color: #333;
        }

        .container-admin-banner h1 {
            margin-top: 40px;
            font-size: 30px;
        }
    </style>
    <title>PDF Content</title>
</head>
<body>
<table>
    <thead>
    <tr>
        <th>Produto</th>
        <th>Tipo</th>
        <th>Descricão</th>
        <th>Valor</th>
    </tr>
    </thead>
    <tbody>
    <?php foreach ($products as $product) : ?>
        <tr>
            <td><?= $product->name; ?></td>
            <td><?= $product->type; ?></td>
            <td><?= $product->description; ?></td>
            <td><?= $product->numberFormatter(); ?></td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
</body>
</html>

