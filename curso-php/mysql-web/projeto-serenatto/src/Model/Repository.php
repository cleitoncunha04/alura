<?php

namespace Vendor\Serenatto\Model;

interface Repository
{
    public function findAll(): array;

    public function findById(int $id): array;

    public function findByType(string $type): array;

    public function save(object $object): bool;

    public function delete(int $id): bool;
}