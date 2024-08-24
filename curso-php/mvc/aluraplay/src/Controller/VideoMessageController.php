<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Repository\VideoRepository;

readonly class VideoMessageController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $success = filter_input(INPUT_GET, 'success', FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);

        require_once __DIR__ . "/../../views/video-message.php";
    }
}