<?php

use Alura\Pdo\Domain\Model\Student;
use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;

require_once 'vendor/autoload.php';

$pdo = ConnectionCreator::createConnection();

$student = new Student(
    id: null,
    name: "Arroz', ''); DROP TABLE students; -- ",
    birthDate: new \DateTimeImmutable('2000-01-01')
);

$insertSql = "INSERT INTO students (name, birth_date) VALUES (:name, :birth_date);";

/*$statement = $pdo->prepare($insertSql);

$statement->bindValue(1, $student->name);
$statement->bindValue(2, $student->birthDate->format('Y-m-d'));

$statement->execute();*/

$result = $pdo->prepare($insertSql)->execute(
    array(
        ':name' => $student->name,
        ':birth_date' => $student->birthDate->format('Y-m-d')
    )
);

if ($result) {
    echo "Succesfully inserted student";
}


