<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;

readonly class NewJsonVideoController implements RequestHandlerInterface
{
    public function __construct(
        private VideoRepository $videoRepository
    )
    {

    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $request = $request->getBody()->getContents();

        $videoData = json_decode($request, true);

        $video = new Video(
            url: $videoData['url'],
            title: $videoData['title']
        );

        if ($this->videoRepository->save($video)) {
           return new Response(201);
        }

        return new Response(400);
    }
}