<?php

namespace Mvc\Aluraplay\Model;

use InvalidArgumentException;
use PDO;
use PDOStatement;

class VideoRepository implements Repository
{
    public function __construct(
        public PDO $pdo
    ) {
    }

    private function preparedStatement(string $sqlQuery) : PDOStatement
    {
        return $this->pdo->prepare($sqlQuery);
    }

    /***
     * @param PDOStatement $statement
     * @return Video[]
     */
    private function hydrateVideos(PDOStatement $statement) : array
    {
        return array_map(function ($row) {
            return new Video(
                id: $row["id"],
                url: $row["url"],
                title: $row["titulo"],
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

    private function add(object $video) : bool
    {
        $statemnt = $this->preparedStatement("INSERT INTO videos (url, titulo) VALUES (:url, :titulo)");

        return $statemnt->execute([
            ":url" => $video->url,
            ":titulo" => $video->title
        ]);
    }

    private function update(object $video) : bool
    {
        $statement = $this->preparedStatement("
            UPDATE videos 
            SET 
                url = :url, 
                titulo = :title 
            WHERE 
                id = :id
            ");

        $statement->bindValue(":url", $video->url, PDO::PARAM_STR);
        $statement->bindValue(":title", $video->title, PDO::PARAM_STR);
        $statement->bindValue(":id", $video->id, PDO::PARAM_INT);

        return $statement->execute();
    }

    public function save(object $object): bool
    {
        if (!$object instanceof Video) {
            return throw new InvalidArgumentException('$object must be an instance of Video');
        } else {
            if($object->id == 0) {
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