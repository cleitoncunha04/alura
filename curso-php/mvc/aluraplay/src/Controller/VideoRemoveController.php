<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Repository\VideoRepository;

readonly class VideoRemoveController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository,
    )
    {
    }

    public function processRequest(): void
    {
        $id = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

        if ($this->videoRepository->remove($id)) {
            header("Location: /message?success=true");
        } else {
            header("Location: /message?success=false");
        }
    }
}