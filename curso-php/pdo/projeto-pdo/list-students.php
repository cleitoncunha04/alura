<?php

use Alura\Pdo\Domain\Model\Student;

require_once 'vendor/autoload.php';

$pdo = new PDO('sqlite:' . __DIR__ . '/db.sqlite');

$statement = $pdo->query("SELECT * FROM students WHERE name = 'Carlitos'");

//only instance a Student if the SQL expression match, using foreach
while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
    $student = new Student(
        $row['id'],
        $row['name'],
        new \DateTimeImmutable($row['birth_date'])
    );

    echo $student->age() . PHP_EOL;
}
