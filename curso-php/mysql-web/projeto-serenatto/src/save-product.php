<?php
namespace Vendor\Serenatto;

use Vendor\Serenatto\Connection\Connection;
use Vendor\Serenatto\Model\Product;
use Vendor\Serenatto\Repository\ProductRepository;

require '../vendor/autoload.php';

if (isset($_POST['salvar'])) {
    if(!isset($_POST['id'])) {
        //
        $product = new Product(
            id: null,
            type: $_POST['tipo'],
            name: $_POST['nome'],
            description: $_POST['descricao'],
            price: (float) $_POST['preco'],
        );
    } else {
        $product = new Product(
            id: $_POST['id'],
            type: $_POST['tipo'],
            name: $_POST['nome'],
            description: $_POST['descricao'],
            price: (float) $_POST['preco'],
        );
    }

    if ($_FILES['imagem']['error'] == UPLOAD_ERR_OK) {
        $product->setImage(uniqid() . $_FILES['imagem']['name']);

        move_uploaded_file($_FILES['imagem']['tmp_name'], "../" . $product->generateImageUrl());
    }

    $connection = Connection::createConnection();

    $repository = new ProductRepository($connection);

    $repository->save($product);

    header('Location: ../admin.php');
}

