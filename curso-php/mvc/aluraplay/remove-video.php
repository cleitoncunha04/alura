<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\VideoRepository;

$connection = Connection::createConnection();

$repository = new VideoRepository($connection);

if($repository->remove($_GET['id'])) {
    header("Location: /message?success=true");
} else {
    header("Location: /message?success=false");
}

