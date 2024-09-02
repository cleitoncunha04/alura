<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\HtmlRendererTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function filter_input;
use function var_dump;

class VideoFormController implements Controller
{
    use HtmlRendererTrait;

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

        var_dump($id);

        echo $this->renderTemplate('video-form.php',
            ['video' => $video]);
    }
}