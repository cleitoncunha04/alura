<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\VideoRepository;

require_once "vendor/autoload.php";

$connection = Connection::createConnection();

$repository = new VideoRepository($connection);

$videos = $repository->findAll();
?>

<!DOCTYPE html>
<html lang="pt-Br">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/estilos.css">
    <link rel="stylesheet" href="./css/flexbox.css">
    <title>AluraPlay</title>
    <link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
</head>

<body>

    <header>

        <nav class="cabecalho">
            <a class="logo" href="/"></a>

            <div class="cabecalho__icones">
                <a href="pages/enviar-video.php" class="cabecalho__videos"></a>
                <a href="./pages/login.html" class="cabecalho__sair">Sair</a>
            </div>
        </nav>

    </header>

    <ul class="videos__container">
        <?php foreach ($videos as $video) : ?>
        <li class="videos__item">
            <iframe width="100%" height="72%" src="<?= $video->generateVideoUrl();?>"
                title="YouTube video player" frameborder="20px"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
            <div class="descricao-video">
                <img src="./img/logo.png" alt="logo canal alura">
                <h3><?= $video->title; ?></h3>
                <div class="acoes-video">
                    <a href="pages/enviar-video.php?id=<?= $video->id; ?>">Editar</a>
                    <a href="./src/remove-video.php?id=<?= $video->id; ?>">Excluir</a>
                </div>
            </div>
        </li>
        <?php endforeach; ?>
    </ul>
</body>

</html>