<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Repository\VideoRepository;
use function filter_input;

class VideoFormController implements Controller
{
    public function __construct(
        public VideoRepository $videoRepository
    )
    {
    }

    public function processRequest(): void
    {
        $id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

        $video = null;

        if ($id) {
            $video = $this->videoRepository->findById($id)[0];
        }

        require_once __DIR__ . '/../../start-html.php'; ?>
        <main class="container">

            <form class="container__formulario" action="/save-video" method="post">
                <h2 class="formulario__titulo">Envie um vídeo!</h2>
                <div class="formulario__campo">
                    <label class="campo__etiqueta" for="url">Link embed</label>
                    <input name="url" class="campo__escrita" required
                           placeholder="Por exemplo: https://www.youtube.com/embed/FAY1K2aUg5g" id='url'
                           value="<?= $video?->url; ?>"/>
                </div>


                <div class="formulario__campo">
                    <label class="campo__etiqueta" for="titulo">Titulo do vídeo</label>
                    <input name="titulo" class="campo__escrita" required placeholder="Neste campo, dê o nome do vídeo"
                           id='titulo' value="<?= $video?->title; ?>"/>
                </div>

                <input type="hidden" name="id" value="<?= $id; ?>">

                <input class="formulario__botao" type="submit" value="Enviar"/>
            </form>

        </main>
        <?php require_once __DIR__ . '/../../end-html.php';
    }
}