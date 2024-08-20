<?php
namespace Vendor\Serenatto;

use Vendor\Serenatto\Connection\Connection;
use Vendor\Serenatto\Model\Product;
use Vendor\Serenatto\Repository\ProductRepository;

require '../vendor/autoload.php';

if (isset($_POST['cadastro'])) {
    $product = new Product(
        id: null,
        type: $_POST['tipo'],
        name: $_POST['nome'],
        description: $_POST['descricao'],
        price: (float)$_POST['preco'],
    );

    $connection = Connection::createConnection();

    $repository = new ProductRepository($connection);

    $repository->save($product);

    header('Location: ../admin.php');
}

