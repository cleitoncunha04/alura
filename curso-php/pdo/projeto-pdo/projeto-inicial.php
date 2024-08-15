<?php

use Alura\Pdo\Domain\Model\Student;

require_once 'vendor/autoload.php';

$student = new Student(
    null,
    'Cleiton Cunha',
    new \DateTimeImmutable('2004-08-09')
);

echo $student->age();
