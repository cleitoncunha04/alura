<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Repository\VideoRepository;

class VideoListController extends ControllerWithHtml implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $videos = $this->videoRepository->findAll();

        echo $this->renderTemplate('video-list.php',
            ['videos' => $videos]);
    }
}