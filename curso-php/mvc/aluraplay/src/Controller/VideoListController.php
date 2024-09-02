<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Helper\HtmlRendererTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;

class VideoListController implements Controller
{
    use HtmlRendererTrait;

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