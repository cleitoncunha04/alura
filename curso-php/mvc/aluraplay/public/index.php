<?php

require_once __DIR__ . "/../vendor/autoload.php";

if (!array_key_exists("PATH_INFO", $_SERVER) || $_SERVER['PATH_INFO'] === '/' ) {
    require_once __DIR__ . '/../list-videos.php';
} elseif ($_SERVER['PATH_INFO'] === '/save-video') {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        require_once __DIR__ . '/../save-video.php';
    } elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
        require_once __DIR__ . '/../enviar-video.php';
    }
} elseif ($_SERVER['PATH_INFO'] === '/remove-video') {
    require_once __DIR__ . '/../remove-video.php';
} elseif ($_SERVER['PATH_INFO'] === '/message') {
    require_once __DIR__ . '/../message.php';
} else {
    http_response_code(404);
}