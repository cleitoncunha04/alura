<?php

use Mvc\Aluraplay\Controller\{
    Controller,
    Error404Controller,
    LoginController,
    VideoFormController,
    VideoListController,
    VideoMessageController,
    VideoRemoveController,
    VideoSaveController
};
use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\Repository\UserRepository;
use Mvc\Aluraplay\Model\Repository\VideoRepository;

require_once __DIR__ . "/../vendor/autoload.php";

$routes = require __DIR__ . "/../config/routes.php";

$pathInfo = $_SERVER['PATH_INFO'] ?? "/";
$httpMethod = $_SERVER['REQUEST_METHOD'];



if (array_key_exists("$httpMethod|$pathInfo", $routes)) {
    $controllerClass = $routes["$httpMethod|$pathInfo"];

    $videoRepository = new VideoRepository(Connection::createConnection());

    $controller = new $controllerClass($videoRepository);
} else {
    $controller = new Error404Controller();
}
/** @var Controller $controller */
$controller->processRequest();