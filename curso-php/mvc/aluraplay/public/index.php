<?php

use Mvc\Aluraplay\Controller\{
    Controller,
    Error404Controller,
    VideoFormController,
    VideoListController,
    VideoMessageController,
    VideoRemoveController,
    VideoSaveController
};
use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Repository\VideoRepository;

require_once __DIR__ . "/../vendor/autoload.php";

$videoRepository = new VideoRepository(Connection::createConnection());

if (!array_key_exists("PATH_INFO", $_SERVER) || $_SERVER['PATH_INFO'] === '/') {
    $controller = new VideoListController($videoRepository);
} elseif ($_SERVER['PATH_INFO'] === '/save-video') {
    $controller = new VideoSaveController($videoRepository);
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $controller = new VideoSaveController($videoRepository);
    } elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
        $controller = new VideoFormController($videoRepository);
    }
} elseif ($_SERVER['PATH_INFO'] === '/remove-video') {
    $controller = new VideoRemoveController($videoRepository);
} elseif ($_SERVER['PATH_INFO'] === '/message') {
    $controller = new VideoMessageController($videoRepository);
} else {
    $controller = new Error404Controller();
}

/** @var Controller $controller */
$controller->processRequest();