<?php

namespace Alura\Pdo\Domain\Model;

class Student
{
    public function __construct(
        private ?int                       $id,
        public readonly string             $name,
        public readonly \DateTimeInterface $birthDate,
        /** @var Phone[] */
        private array $phones = [],
    ) {
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    public function getPhones(): array
    {
        return $this->phones;
    }

    public function addPhone(Phone $phone): void
    {
        $this->phones[] = $phone;
    }

    public function age(): int
    {
        return $this->birthDate
            ->diff(new \DateTimeImmutable())
            ->y;
    }
}
