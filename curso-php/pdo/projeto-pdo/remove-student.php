<?php

use Alura\Pdo\Domain\Model\Student;
use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;
use Alura\Pdo\Infrastructure\Repository\PdoStudentRepository\PdoStudentRepository;

require_once 'vendor/autoload.php';

$pdo = ConnectionCreator::createConnection();

$repository = new PdoStudentRepository($pdo);

$preparedStatement = $pdo->prepare('DELETE FROM students WHERE id = :id;');

$preparedStatement->bindValue(':id', 1, PDO::PARAM_INT);

$result = $preparedStatement->execute();

if ($result) {
    if ($preparedStatement->rowCount() > 0) {
        echo "Student removed";
    } else {
        echo "Student not found";
    }
} else {
    echo "Error...";
}
