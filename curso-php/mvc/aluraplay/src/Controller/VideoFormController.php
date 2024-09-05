<?php

namespace Mvc\Aluraplay\Controller;

use League\Plates\Engine;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function filter_input;
use function var_dump;

class VideoFormController implements RequestHandlerInterface
{
    public function __construct(
        public VideoRepository $videoRepository,
        private readonly Engine $templates
    )
    {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $queryParams = $request->getQueryParams();

        $id = filter_var($queryParams['id'] ?? '', FILTER_SANITIZE_NUMBER_INT);

        $video = null;

        if ($id) {
            $video = $this->videoRepository->findById($id)[0];
        }

        return new Response(status: 302, body: $this->templates->render('video-form',
            ['video' => $video]));
    }
}