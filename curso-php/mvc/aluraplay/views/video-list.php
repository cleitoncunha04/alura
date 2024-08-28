<?php use Mvc\Aluraplay\Model\Entity\Video;

require_once __DIR__ . '/start-html.php';
/** @var Video[] $videos */
?>

    <ul class="videos__container">
        <?php foreach ($videos as $video) : ?>
            <li class="videos__item">
                <?php if ($video->getFilePath() != null) : ?>
                    <a href="<?= $video->url; ?>" target="_blank">
                        <img src="/img/uploads/<?= $video->getFilePath(); ?>" alt="<?= $video->title; ?>"
                             style="width: 100%">
                    </a>
                <?php else : ?>
                <iframe width="100%" height="72%" src="<?= $video->generateVideoUrl(); ?>"
                        title="YouTube video player" frameborder="20px"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                        allowfullscreen></iframe>
                <?php endif; ?>
                <div class="descricao-video">
                    <img src="/img/logo.png" alt="logo canal alura">
                    <h3><?= $video->title; ?></h3>
                    <div class="acoes-video">
                        <a href="/save-video?id=<?= $video->id; ?>">Editar</a>
                        <a href="/remove-image-path?id=<?= $video->id; ?>">Remover fundo</a>
                        <a href="/remove-video?id=<?= $video->id; ?>">Excluir</a>
                    </div>
                </div>
            </li>
        <?php endforeach; ?>
    </ul>

<?php require_once __DIR__ . '/end-html.php';
