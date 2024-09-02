<?php

namespace Mvc\Aluraplay\Controller;

use finfo;
use Mvc\Aluraplay\Model\Entity\Video;
use Mvc\Aluraplay\Model\Repository\VideoRepository;
use function header;
use function move_uploaded_file;
use function pathinfo;
use function preg_replace;
use function str_starts_with;
use function strtolower;
use function trim;
use function uniqid;
use function var_dump;

readonly class VideoSaveController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $url = filter_input(INPUT_POST, 'url', FILTER_VALIDATE_URL);

        $title = filter_input(INPUT_POST, 'titulo');

        $id = filter_input(INPUT_POST, 'id', FILTER_VALIDATE_INT);

        if (!$url || !$title) {
            header("Location: /message?success=false");

            exit();
        }

        $video = new Video(
            id: $id,
            url: $url,
            title: $title
        );

        //vejo se foi feito um upload de arquivo
        if (isset($_FILES['image'])) {
            //vejo se upload deu certo
            if ($_FILES['image']['error'] === UPLOAD_ERR_OK) {
                $finfo = new finfo(FILEINFO_MIME_TYPE);
                $mimeType = $finfo->file($_FILES['image']['tmp_name']);

                //vejo se o tipo do arquivo é uma imagem
                if (str_starts_with($mimeType, 'image/')) {
                    //faz o slugg -> deixa o código mais fácil de ser lido na web
                    $sluggedName = strtolower(
                        trim(
                            preg_replace(
                                '/[^A-Za-z0-9-]+/',
                                '-',
                                pathinfo($_FILES['image']['name'],
                                    PATHINFO_BASENAME
                                )
                            )
                        ));

                    $safeFileName = uniqid('upload_') . '_' . $sluggedName;

                    //salvo a imagem no diretório abaixo
                    move_uploaded_file(
                        $_FILES['image']['tmp_name'],
                        __DIR__ . '/../../public/img/uploads/' . $safeFileName
                    );

                    $video->setFilePath($safeFileName);
                }
            }
        }


        if ($this->videoRepository->save($video)) {
            header("Location: /message?success=true");
        } else {
            header("Location: /message?success=false");
        }

    }
}