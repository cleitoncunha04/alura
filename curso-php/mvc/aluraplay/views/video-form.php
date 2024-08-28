<?php use Mvc\Aluraplay\Model\Entity\Video;

require_once __DIR__ . '/start-html.php';
/***
 * @var ?Video $video
 * @var ?int $id
 */
?>
    <main class="container">

        <form class="container__formulario"
              action="/save-video" method="post"
              enctype="multipart/form-data">
            <h2 class="formulario__titulo">Envie um vídeo!</h2>
            <div class="formulario__campo">
                <label class="campo__etiqueta" for="url">Link embed</label>
                <input name="url" class="campo__escrita"
                       required
                       placeholder="Por exemplo: https://www.youtube.com/embed/FAY1K2aUg5g"
                       id='url'
                       value="<?= $video?->url; ?>"/>
            </div>


            <div class="formulario__campo">
                <label class="campo__etiqueta" for="titulo">Titulo do vídeo</label>
                <input name="titulo"
                       class="campo__escrita"
                       required
                       placeholder="Neste campo, dê o nome do vídeo"
                       id='titulo' value="<?= $video?->title; ?>"/>
            </div>

            <div class="formulario__campo">
                <label class="campo__etiqueta" for="image">Imagem do vídeo</label>
                <input name="image"
                       class="campo__escrita"
                       accept="image/*"
                       type="file"
                       id='image'
                />
            </div>

            <input type="hidden" name="id" value="<?= $id; ?>">

            <input class="formulario__botao" type="submit" value="Enviar"/>
        </form>

    </main>
<?php require_once __DIR__ . '/end-html.php';
