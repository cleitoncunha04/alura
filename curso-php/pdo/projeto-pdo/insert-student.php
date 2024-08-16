<?php

use Alura\Pdo\Domain\Model\Student;

require_once 'vendor/autoload.php';

$pdo = new PDO('sqlite:' . __DIR__ . '/db.sqlite');

$student = new Student(null, 'Carlitos', new \DateTimeImmutable('2000-01-01'));

$insertSql = "INSERT INTO students (name, birth_date) VALUES ('{$student->name}', '{$student->birthDate->format('Y-m-d')}');";

var_dump($pdo->exec($insertSql));