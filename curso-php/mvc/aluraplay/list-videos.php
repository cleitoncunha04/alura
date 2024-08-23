<?php

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\VideoRepository;

$connection = Connection::createConnection();

$repository = new VideoRepository($connection);

$videos = $repository->findAll();
?>

<?php require_once 'start-html.php'; ?>
    <ul class="videos__container">
        <?php foreach ($videos as $video) : ?>
            <li class="videos__item">
                <iframe width="100%" height="72%" src="<?= $video->generateVideoUrl(); ?>"
                        title="YouTube video player" frameborder="20px"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                <div class="descricao-video">
                    <img src="/img/logo.png" alt="logo canal alura">
                    <h3><?= $video->title; ?></h3>
                    <div class="acoes-video">
                        <a href="/save-video?id=<?= $video->id; ?>">Editar</a>
                        <a href="/remove-video?id=<?= $video->id; ?>">Excluir</a>
                    </div>
                </div>
            </li>
        <?php endforeach; ?>
    </ul>
<?php require_once 'end-html.php'; ?>