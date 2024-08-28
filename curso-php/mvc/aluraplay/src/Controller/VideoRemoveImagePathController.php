<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function header;
use function unlink;
use function var_dump;

class VideoRemoveImagePathController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    ) {
    }

    public function processRequest(): void
    {
        $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

        $video = $this->videoRepository->findById($id)[0];

        $filePath = __DIR__ . "/../../public/img/uploads/" . $video->getFilePath();

        if (file_exists($filePath)) {
            var_dump(unlink($filePath));

            $this->videoRepository->updateImagePathToNull($id);
        }

        header('Location: /');
    }
}