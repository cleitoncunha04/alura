<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function array_map;

readonly class VideoListJson implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository,
    ) {}

    public function processRequest(): void
    {
        if(!array_key_exists('loggedIn', $_SESSION)) {
            header('Location: /login');
            exit;
        }

        $videos = $this->videoRepository->findAll();

        $videosUrlCorrect = array_map(function ($video) {
            $url = $video->url;

            return new Video(
                id: $video->id,
                url: $video->generateVideoUrl($url),
                title: $video->title,
            );
        }, $videos);

        header('Content-Type: application/json');
        echo json_encode($videosUrlCorrect);
    }
}