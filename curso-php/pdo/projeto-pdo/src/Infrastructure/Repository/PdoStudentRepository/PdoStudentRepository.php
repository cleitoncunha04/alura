<?php

namespace Alura\Pdo\Infrastructure\Repository\PdoStudentRepository;

use Alura\Pdo\Domain\Model\Student;
use Alura\Pdo\Domain\Repository\StudentRepository;
use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;
use PDO;
use PDOStatement;

class PdoStudentRepository implements StudentRepository
{
    private PDO $connection;
    public function __construct(PDO $connection)
    {
        $this->connection = $connection;
    }

    private function prepareStatement(string $sqlQuery): PDOStatement
    {
        return $this->connection->prepare($sqlQuery);
    }

    private function hydrateStudents(PDOStatement $statement): array
    {
        $students = [];

        foreach ($statement->fetchAll(PDO::FETCH_ASSOC) as $studentData) {
            $students[] = new Student(
                $studentData['id'],
                $studentData['name'],
                new \DateTimeImmutable($studentData['birth_date']
                ));
        }

        return $students;
    }

    public function findAllStudents(): array
    {
        $statement = $this->prepareStatement("SELECT * FROM student");

        return $this->hydrateStudents($statement);
    }

    public function findStudentsByBirthDate(\DateTimeImmutable $birthDate): array
    {
        $statement = $this->prepareStatement("SELECT * FROM student WHERE birth_date = :birth_date");

        $statement->bindValue(':birth_date', $birthDate->format('Y-m-d'));

        $statement->execute();

        return $this->hydrateStudents($statement);
    }

    private function addStudent(\Alura\Pdo\Domain\Model\Student $student): bool
    {
        $result =  $this->prepareStatement(
            "INSERT INTO students (name, birth_date) VALUES (:name, :birth_date);")
            ->execute(
                array(
                    ':name' => $student->name,
                    ':birth_date' => $student->birthDate->format('Y-m-d')
                )
            );

        if ($result) {
            $student->setId($this->connection->lastInsertId());
        }

        return $result;
    }

    private function updateStudent(Student $student): bool
    {
        $statement = $this->prepareStatement('UPDATE student SET name = :name, birth_date = :birth_date WHERE id = :id');

        $statement->bindValue(':name', $student->name);
        $statement->bindValue(':birth_date', $student->birthDate->format('Y-m-d'));
        $statement->bindValue(':id', $student->getId(), PDO::PARAM_INT);

        return $statement->execute();
    }

    public function saveStudent(Student $student): bool
    {
        if ($student->getId() == null) {
            return $this->addStudent($student);
        } else {
            return $this->updateStudent($student);
        }
    }

    public function removeStudent(\Alura\Pdo\Domain\Model\Student $student): bool
    {
        $statement = $this->prepareStatement("DELETE FROM student WHERE id = :id");

        $statement->bindValue($student->getId(), 1, PDO::PARAM_INT);

        $result = $statement->execute();

        if ($result) {
            if ($statement->rowCount() > 0) {
                echo "Student removed";
            } else {
                echo "Student not found";

                $result = false;
            }
        } else {
            echo "Error...";
        }

        return $result;
    }
}