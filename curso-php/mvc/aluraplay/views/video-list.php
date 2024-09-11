<?php use Mvc\Aluraplay\Model\Entity\Video;

$this->layout('layout');

/** @var Video[] $videos */
?>

    <ul class="videos__container">
        <?php foreach ($videos as $video) : ?>
            <li class="videos__item">
                <?php if ($video->getFilePath() != null) : ?>
                    <a href="<?= $video->url; ?>" target="_blank">
                        <img src="/img/uploads/<?= $video->getFilePath(); ?>" alt="<?= $video->title; ?>">
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
                        <?php if ($video->getFilePath() != null) : ?>
                            <a href="/remove-image-path?id=<?= $video->id; ?>">Remover fundo</a>
                        <?php endif; ?>
                        <a href="/remove-video?id=<?= $video->id; ?>">Excluir</a>
                    </div>
                </div>
            </li>
        <?php endforeach; ?>
    </ul>

