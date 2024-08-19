<?php

namespace Alura\Pdo\Domain\Model;

class Phone
{
    public function __construct(
        private ?int $id,
        public readonly string $areaCode,
        public readonly string $number
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

    public function getFormattedPhone(): string
    {
        return "({$this->areaCode}) {$this->number}";
    }
}