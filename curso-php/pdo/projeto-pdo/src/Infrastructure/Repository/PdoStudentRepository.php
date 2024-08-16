<?php

use Alura\Pdo\Domain\Repository\StudentRepository;
use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;

class PdoStudentRepository implements StudentRepository {
    public function __construct(private PDO $connection)
    {
        $this->connection = ConnectionCreator::createConnection();
    }

    public function getAllStudents(): array
    {
        // TODO: Implement getAllStudents() method.
    }

    public function getStudentsByBirthDate(\DateTimeImmutable $birthDate): array
    {
        // TODO: Implement getStudentsByBirthDate() method.
    }

    public function addStudent(\Alura\Pdo\Domain\Model\Student $student): bool
    {
        // TODO: Implement addStudent() method.
    }

    public function removeStudent(\Alura\Pdo\Domain\Model\Student $student): bool
    {
        // TODO: Implement removeStudent() method.
    }
}