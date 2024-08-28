<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function array_map;

readonly class JsonVideoListController implements Controller
{
    public function __construct(
        private VideoRepository $videoRepository,
    )
    {

    }

    public function processRequest(): void
    {
        $videos = array_map(function (Video $video) : array {

            $filePath = "";

            if ($video->getFilePath() !== null) {
                $filePath = "/img/uploads/" . $video->getFilePath();
            }

            return [
                "id" => $video->id,
                "url" => $video->generateVideoUrl(),
                "title" => $video->title,
                "file_path" => $filePath,
            ];
        }, $this->videoRepository->findAll()) ;

        /*$videosUrlCorrect = array_map(function (Video $video) {
            $url = $video->url;

            return new Video(
                id: $video->id,
                url: $video->,
                title: $video->title,
                filePath: $video->getFilePath()
            );
        }, $videos);*/

        header('Content-Type: application/json');
        echo json_encode(value: $videos);
    }
}