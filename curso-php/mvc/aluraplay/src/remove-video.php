<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\VideoRepository;

require_once "../vendor/autoload.php";

$connection = Connection::createConnection();

$repository = new VideoRepository($connection);

if($repository->remove($_GET['id'])) {
    header("Location: ../index.php?success=true");
} else {
    header("Location: ../index.php?success=false");
}

