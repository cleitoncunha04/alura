<?php

return [
    'GET|/' => \Mvc\Aluraplay\Controller\VideoListController::class,
    'POST|/save-video' => \Mvc\Aluraplay\Controller\VideoSaveController::class,
    'GET|/save-video' => \Mvc\Aluraplay\Controller\VideoFormController::class,
    'GET|/remove-video' => \Mvc\Aluraplay\Controller\VideoRemoveController::class,
    'GET|/login' => \Mvc\Aluraplay\Controller\LoginFormController::class,
    'POST|/login' => \Mvc\Aluraplay\Controller\LoginController::class,
    'GET|/logout' => \Mvc\Aluraplay\Controller\LogoutController::class,
    'GET|/videos-json' => \Mvc\Aluraplay\Controller\JsonVideoListController::class,
    'GET|/remove-image-path' => \Mvc\Aluraplay\Controller\VideoRemoveImagePathController::class,
    'POST|/videos' => \Mvc\Aluraplay\Controller\NewJsonVideoController::class,
];