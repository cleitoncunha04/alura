<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function uniqid;

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

        if($_FILES['image']['error'] === UPLOAD_ERR_OK) {
            move_uploaded_file(
                $_FILES['image']['tmp_name'],
                __DIR__ . '/../../public/img/uploads/' . $_FILES['image']['name']
            );

            $video->setFilePath($_FILES['image']['name']);
        }

        if ($this->videoRepository->save($video)) {
            header("Location: /message?success=true");
        } else {
            header("Location: /message?success=false");
        }
    }
}