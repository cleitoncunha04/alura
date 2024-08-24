<?php

use Mvc\Aluraplay\Entity\Video;
use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Repository\VideoRepository;

$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);

if ($id) {
    $connection = Connection::createConnection();

    $repository = new VideoRepository($connection);

    $video = $repository->findById($id)[0];
} else {
    $video = new Video(
        id: null,
        url: "",
        title: ""
    );
}
?>

<?php require_once 'start-html.php'; ?>
    <main class="container">

        <form class="container__formulario" action="/save-video" method="post">
            <h2 class="formulario__titulo">Envie um vídeo!</h2>
            <div class="formulario__campo">
                <label class="campo__etiqueta" for="url">Link embed</label>
                <input name="url" class="campo__escrita" required
                       placeholder="Por exemplo: https://www.youtube.com/embed/FAY1K2aUg5g" id='url'
                       value="<?= $video->url; ?>"/>
            </div>


            <div class="formulario__campo">
                <label class="campo__etiqueta" for="titulo">Titulo do vídeo</label>
                <input name="titulo" class="campo__escrita" required placeholder="Neste campo, dê o nome do vídeo"
                       id='titulo' value="<?= $video->title; ?>"/>
            </div>

            <input type="hidden" name="id" value="<?= $id; ?>">

            <input class="formulario__botao" type="submit" value="Enviar"/>
        </form>

    </main>
<?php require_once 'end-html.php'; ?>