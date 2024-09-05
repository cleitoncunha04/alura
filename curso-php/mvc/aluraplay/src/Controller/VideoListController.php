<?php

namespace Mvc\Aluraplay\Controller;

use League\Plates\Engine;
use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

class VideoListController implements RequestHandlerInterface
{
    public function __construct(
        public VideoRepository  $videoRepository,
        private readonly Engine $templates,
    )
    {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $videos = $this->videoRepository->findAll();


        return new Response(status: 302, body: $this->templates->render('video-list',
            ['videos' => $videos]));
    }
}