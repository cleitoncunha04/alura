<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function filter_input;

class VideoFormController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

        $video = null;

        if ($id) {
            $video = $this->videoRepository->findById($id)[0];
        }

        require_once __DIR__ . '/../../views/video-form.php';
    }
}