<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Repository\VideoRepository;

$id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

$connection = Connection::createConnection();

$repository = new VideoRepository($connection);

if($repository->remove($id)) {
    header("Location: /message?success=true");
} else {
    header("Location: /message?success=false");
}

