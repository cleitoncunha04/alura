<?php

namespace Alura\Pdo\Domain\Repository;

use Alura\Pdo\Domain\Model\Student;

interface StudentRepository
{
    public function findAllStudents(): array;
    public function findStudentsByBirthDate(\DateTimeImmutable $birthDate): array;
    public function saveStudent(Student $student): bool;
    public function removeStudent(Student $student): bool;
}