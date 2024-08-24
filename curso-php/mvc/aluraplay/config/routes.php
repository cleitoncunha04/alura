<?php
return [
    'GET|/' => \Mvc\Aluraplay\Controller\VideoListController::class,
    'POST|/save-video' => \Mvc\Aluraplay\Controller\VideoSaveController::class,
    'GET|/save-video' => \Mvc\Aluraplay\Controller\VideoFormController::class,
    'GET|/remove-video' => \Mvc\Aluraplay\Controller\VideoRemoveController::class,
    'GET|/message' => \Mvc\Aluraplay\Controller\VideoMessageController::class
];