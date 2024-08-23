<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\Video;
use Mvc\Aluraplay\Model\VideoRepository;

require_once "../vendor/autoload.php";

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

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/reset.css">
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="stylesheet" href="../css/estilos-form.css">
    <link rel="stylesheet" href="../css/flexbox.css">
    <title>AluraPlay</title>
    <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
</head>

<body>

<!-- Cabecalho -->
<header>

    <nav class="cabecalho">
        <a class="logo" href="../index.php"></a>

        <div class="cabecalho__icones">
            <a href="enviar-video.php" class="cabecalho__videos"></a>
            <a href="../pages/login.html" class="cabecalho__sair">Sair</a>
        </div>
    </nav>

</header>

<main class="container">

    <form class="container__formulario" action="../src/save-video.php" method="post">
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

</body>

</html>