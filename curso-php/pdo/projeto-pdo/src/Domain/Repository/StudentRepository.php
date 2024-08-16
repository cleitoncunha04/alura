<?php

namespace Alura\Pdo\Domain\Repository;

use Alura\Pdo\Domain\Model\Student;

interface StudentRepository
{
    public function getAllStudents(): array;
    public function getStudentsByBirthDate(\DateTimeImmutable $birthDate): array;
    public function addStudent(Student $student): bool;
    public function removeStudent(Student $student): bool;
}