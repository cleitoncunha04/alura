<?php

namespace Mvc\Aluraplay\Model\Repository;

use InvalidArgumentException;
use Mvc\Aluraplay\Model\Entity\Video;
use PDO;
use PDOStatement;

readonly class VideoRepository implements Repository
{
    public function __construct(
        private PDO $pdo
    )
    {
    }

    private function preparedStatement(string $sqlQuery): PDOStatement
    {
        return $this->pdo->prepare($sqlQuery);
    }

    /***
     * @param PDOStatement $statement
     * @return Video[]
     */
    private function hydrateVideos(PDOStatement $statement): array
    {
        return array_map(function ($row) {
            return new Video(
                id: $row["id"],
                url: $row["url"],
                title: $row["titulo"],
                filePath: $row["image_path"],
            );
        }, $statement->fetchAll(PDO::FETCH_ASSOC));
    }

    public function findAll(): array
    {
        $statement = $this->preparedStatement("SELECT * FROM videos");

        $statement->execute();

        return $this->hydrateVideos($statement);
    }

    public function findById(int $id): array
    {
        $statement = $this->preparedStatement("SELECT * FROM videos WHERE id = :id");

        $statement->bindParam(":id", $id, PDO::PARAM_INT);

        $statement->execute();

        return $this->hydrateVideos($statement);
    }

    private function add(object $video): bool
    {
        $statemnt = $this->preparedStatement("INSERT INTO videos (url, titulo, image_path) VALUES (:url, :titulo, :imagePath)");

        return $statemnt->execute([
            ":url" => $video->url,
            ":titulo" => $video->title,
            ":imagePath" => $video->getFilePath(),
        ]);
    }

    /**
     * @param Video $video
     * @return bool
     */
    private function update(object $video): bool
    {
        $updateImgSql = '';

        if ($video->getFilePath() !== null) {
            $updateImgSql = ", image_path = :imagePath";
        }

        $statement = $this->preparedStatement("
            UPDATE videos 
            SET 
                url = :url, 
                titulo = :title
                $updateImgSql
            WHERE 
                id = :id
            ");

        $statement->bindValue(":url", $video->url, PDO::PARAM_STR);
        $statement->bindValue(":title", $video->title, PDO::PARAM_STR);
        $statement->bindValue(":id", $video->id, PDO::PARAM_INT);

        if ($video->getFilePath() !== null) {
            $statement->bindValue(":imagePath", $video->getFilePath(), PDO::PARAM_STR);
        }
        return $statement->execute();
    }

    public function updateImagePathToNull(int $id): bool
    {
        $statement = $this->preparedStatement("UPDATE videos SET image_path = NULL WHERE id = :id");

        $statement->bindParam(":id", $id, PDO::PARAM_INT);

        return $statement->execute();
    }

    public function save(object $object): bool
    {
        if (!$object instanceof Video) {
            return throw new InvalidArgumentException('$object must be an instance of Video');
        } else {
            if ($object->id == 0) {
                return $this->add($object);
            } else {
                return $this->update($object);
            }
        }
    }

    public function remove(int $id): bool
    {
        $statement = $this->preparedStatement("DELETE FROM videos WHERE id = :id");
        return $statement->execute([
            ":id" => $id
        ]);
    }
}