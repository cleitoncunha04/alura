<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\HtmlRendererTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function filter_input;
use function var_dump;

class VideoFormController implements RequestHandlerInterface
{
    use HtmlRendererTrait;

    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $queryParams = $request->getQueryParams();

        $id = filter_var($queryParams['id'], FILTER_SANITIZE_NUMBER_INT);

        $video = null;

        if ($id) {
            $video = $this->videoRepository->findById($id)[0];
        }

        return new Response(status: 302, body: $this->renderTemplate('video-form.php',
            ['video' => $video]));
    }
}