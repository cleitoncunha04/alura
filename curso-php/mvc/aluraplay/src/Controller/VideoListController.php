<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Repository\VideoRepository;

readonly class VideoListController
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $videos = $this->videoRepository->findAll();

        require_once __DIR__ . "/../../views/video-list.php";
    }
}