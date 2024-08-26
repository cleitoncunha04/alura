<?php

namespace Mvc\Aluraplay\Model\Repository;

use Mvc\Aluraplay\Model\Entity\User;
use PDO;
use PDOStatement;
use function array_map;

readonly class UserRepository implements Repository
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
     * @return User[]
     */
    private function hydrateUsers(PDOStatement $statement) : array
    {
        return array_map(function ($row) {
            return new User(
                id: $row["id"],
                email: $row["email"],
                password: $row["password"],
            );
        }, $statement->fetchAll(PDO::FETCH_ASSOC));
    }

    public function findAll(): array
    {
        $statement = $this->preparedStatement("SELECT * FROM users");

        $statement->execute();

        return $this->hydrateUsers($statement);
    }

    public function findById(int $id): array
    {
        $statement = $this->preparedStatement("SELECT * FROM users WHERE id = :id");

        $statement->bindParam(":id", $id, PDO::PARAM_INT);

        $statement->execute();

        return $this->hydrateUsers($statement);
    }

    public function findByEmail(string $email): array
    {
        $statement = $this->preparedStatement("SELECT * FROM users WHERE email = :email");

        $statement->bindParam(":email", $email);

        $statement->execute();

        return $this->hydrateUsers($statement);
    }

    public function save(object $object): bool
    {
        // TODO: Implement save() method.
    }

    public function remove(int $id): bool
    {
        // TODO: Implement remove() method.
    }
}