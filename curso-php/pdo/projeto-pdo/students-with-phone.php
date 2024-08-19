<?php

use Alura\Pdo\Infrastructure\Persistence\ConnectionCreator;
use Alura\Pdo\Infrastructure\Repository\PdoStudentRepository\PdoStudentRepository;

require_once "vendor/autoload.php";

$connection = ConnectionCreator::createConnection();

$repository = new PdoStudentRepository($connection);

$students = $repository->findStudentsWithPhone();

echo $students[1]->getPhones()[1]->getFormattedPhone() . PHP_EOL;

var_dump($students);
