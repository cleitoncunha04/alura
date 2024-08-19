<?php

use Alura\Pdo\Domain\Model\Student;
use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;

require_once 'vendor/autoload.php';

$pdo = ConnectionCreator::createConnection();

$statement = $pdo->query("SELECT * FROM students");

//only instance a Student if the SQL expression match, using foreach
while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
    $student = new Student(
        $row['id'],
        $row['name'],
        new \DateTimeImmutable($row['birth_date'])
    );

    echo var_dump($student) . PHP_EOL . PHP_EOL;
}

if($statement->rowCount() == 0) {
    echo "There is no student" . PHP_EOL;
}
