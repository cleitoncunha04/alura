<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Entity\Video;
use Mvc\Aluraplay\Repository\VideoRepository;

readonly class VideoSaveController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $url = filter_input(INPUT_POST, 'url', FILTER_VALIDATE_URL);

        $title = filter_input(INPUT_POST, 'titulo');

        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

        if (!$url || !$title) {
            header("Location: /message?success=false");

            exit();
        }

        $video = new Video(
            id: $id,
            url: $url,
            title: $title
        );

        if ($this->videoRepository->save($video)) {
            header("Location: /message?success=true");
        } else {
            header("Location: /message?success=false");
        }
    }
}