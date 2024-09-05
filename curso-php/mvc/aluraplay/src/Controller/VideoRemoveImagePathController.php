<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\RemoveVideoImageTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;
use function unlink;
use function var_dump;

class VideoRemoveImagePathController implements RequestHandlerInterface
{
    use RemoveVideoImageTrait;

    public function __construct(
        public VideoRepository $videoRepository
    ) {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $queryParams = $request->getQueryParams();

        $id = filter_var( $queryParams['id'], FILTER_SANITIZE_NUMBER_INT);

        $this->removeVideoImage($id, $this->videoRepository);

        return new Response(302, ['Location' => '/']);
    }
}