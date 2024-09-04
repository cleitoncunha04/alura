<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function array_map;
use function json_encode;

readonly class JsonVideoListController implements RequestHandlerInterface
{
    public function __construct(
        private VideoRepository $videoRepository,
    )
    {

    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $videos = array_map(function (Video $video): array {
            return [
                "id" => $video->id,
                "url" => $video->generateVideoUrl(),
                "title" => $video->title,
                "file_path" => "/img/uploads/" . $video->getFilePath(),
            ];
        }, $this->videoRepository->findAll());

        return new Response(
            status: 302,
            headers: [
                'Content-Type' => 'application/json'
            ],
            body: json_encode(value: $videos)
        );
    }
}