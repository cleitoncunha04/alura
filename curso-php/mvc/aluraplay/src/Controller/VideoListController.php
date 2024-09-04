<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Helper\HtmlRendererTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

class VideoListController implements RequestHandlerInterface
{
    use HtmlRendererTrait;

    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $videos = $this->videoRepository->findAll();


        return new Response(status: 302, body: $this->renderTemplate('video-list.php',
            ['videos' => $videos]));
    }
}