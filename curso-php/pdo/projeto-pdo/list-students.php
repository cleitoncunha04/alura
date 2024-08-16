<?php

use Alura\Pdo\Domain\Model\Student;

require_once 'vendor/autoload.php';

$pdo = new PDO('sqlite:' . __DIR__ . '/db.sqlite');

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
