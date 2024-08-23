<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\Video;
use Mvc\Aluraplay\Model\VideoRepository;

require '../vendor/autoload.php';

$url = filter_input(INPUT_POST, 'url', FILTER_VALIDATE_URL);

$title = filter_input(INPUT_POST, 'titulo');

$id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

if (!$url || !$title) {
    header("Location: ../pages/message.php?success=false");

    exit();
}

$video = new Video(
    id: $id,
    url: $url,
    title: $title
);

$connection = Connection::createConnection();

$repository = new VideoRepository($connection);

if ($repository->save($video)) {
    header("Location: ../pages/message.php?success=true");
} else {
    header("Location: ../pages/message.php?success=false");
}
