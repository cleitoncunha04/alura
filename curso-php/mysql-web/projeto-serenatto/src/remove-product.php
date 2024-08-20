<?php

namespace Vendor\Serenatto;

use Vendor\Serenatto\Connection\Connection;
use Vendor\Serenatto\Repository\ProductRepository;

require_once '../vendor/autoload.php';

if (isset($_POST["excluir"])) {
    $connection = Connection::createConnection();

    $repository = new ProductRepository($connection);

    if ($repository->delete($_POST['id'])) {
        //redireciona para a página admin.php
        header('Location: ../admin.php');
    } else {
        echo "Error removing product";
    }
}
