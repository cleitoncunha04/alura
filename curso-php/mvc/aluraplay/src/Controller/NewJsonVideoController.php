<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;

readonly class NewJsonVideoController implements Controller
{
    public function __construct(
        private VideoRepository $videoRepository
    )
    {

    }

    public function processRequest(): void
    {
        $request = file_get_contents('php://input');

        $videoData = json_decode($request, true);

        $video = new Video(
            url: $videoData['url'],
            title: $videoData['title']
        );

        if ($this->videoRepository->save($video)) {
            http_response_code(201);
        }


    }
}