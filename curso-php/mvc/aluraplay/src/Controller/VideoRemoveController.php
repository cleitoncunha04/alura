<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Helper\RemoveVideoImageTrait;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;

readonly class VideoRemoveController implements RequestHandlerInterface
{
    use FlashMessageTrait, RemoveVideoImageTrait;

    public function __construct(
        public VideoRepository $videoRepository,
    )
    {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $queryParams = $request->getQueryParams();

        $id = filter_var($queryParams['id'], FILTER_VALIDATE_INT);

        if($id === false || $id === null) {
            $this->addErrorMessage('Invalid ID');
        } else {
            $this->removeVideoImage($id, $this->videoRepository);

            if (!$this->videoRepository->remove($id)) {
                $this->addErrorMessage('Error deleting video');
            }
        }

        return new Response(
            302, ['Location' => '/']);
    }
}