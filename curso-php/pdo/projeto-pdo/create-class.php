<?php

use Alura\Pdo\Domain\Model\Student;
use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;
use Alura\Pdo\Infrastructure\Repository\PdoStudentRepository\PdoStudentRepository;

require_once "vendor/autoload.php";

$connection = ConnectionCreator::createConnection();

$studentRepository = new PdoStudentRepository($connection);

$connection->beginTransaction();

$student1 = new Student(
    id: null,
    name: 'João Silva',
    birthDate: new DateTimeImmutable('2004-01-01')
);
$studentRepository->saveStudent($student1);

$student2 = new Student(
    id: null,
    name: 'João Moreira',
    birthDate: new DateTimeImmutable('2005-12-05')
);
$studentRepository->saveStudent($student2);

$connection->commit();