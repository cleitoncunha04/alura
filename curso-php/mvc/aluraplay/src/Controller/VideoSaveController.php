<?php

namespace Mvc\Aluraplay\Controller;

use finfo;
use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\UploadedFileInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;
use function move_uploaded_file;
use function pathinfo;
use function preg_replace;
use function str_starts_with;
use function strtolower;
use function trim;
use function uniqid;
use function var_dump;

readonly class VideoSaveController implements RequestHandlerInterface
{
    use FlashMessageTrait;

    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $queryParams = $request->getParsedBody();

        $url = filter_var($queryParams['url'], FILTER_VALIDATE_URL);

        $title = filter_var($queryParams['titulo']);

        $id = filter_var($queryParams['id'], FILTER_VALIDATE_INT);

        if (!$url || !$title) {
            $this->addErrorMessage('Fill all fields correctly');

            return new Response(302, ['Location' => '/save-video']);
        }

        $video = new Video(
            id: $id,
            url: $url,
            title: $title
        );

        $files = $request->getUploadedFiles();

        /** @var UploadedFileInterface $uploadImage */
        $uploadImage = $files['image'];

        //vejo se foi feito um upload de arquivo
        //vejo se upload deu certo
        if ($uploadImage->getError() === UPLOAD_ERR_OK) {
            $finfo = new finfo(FILEINFO_MIME_TYPE);

            $tmpFile = $uploadImage->getStream()->getMetadata()['uri'];

            $mimeType = $finfo->file($tmpFile);

            //vejo se o tipo do arquivo é uma imagem
            if (str_starts_with($mimeType, 'image/')) {
                //faz o slugg -> deixa o código mais fácil de ser lido na web
                $sluggedName = strtolower(
                    trim(
                        preg_replace(
                            '/[^A-Za-z0-9-]+/',
                            '-',
                            pathinfo($uploadImage->getClientFilename(), PATHINFO_FILENAME)
                        )
                    )
                );

                $safeFileName = uniqid('upload_') . '_' . $sluggedName;

                //salvo a imagem no diretório abaixo
                $uploadImage->moveTo(__DIR__ . '/../../public/img/uploads/' . $safeFileName);

                $video->setFilePath($safeFileName);
            }
        }


        if ($this->videoRepository->save($video)) {
            return new Response(302, ['Location' => '/']);
        } else {
            $this->addErrorMessage('Error on adding a video');

            return new Response(302, ['Location' => '/save-video']);
        }

    }
}