<?php

namespace Vendor\Serenatto\Model;

interface Repository
{
    public function findAll() : array;
    public function findByType(string $type) : array;
    public function save(object $object): bool;
    public function delete(object $object) : bool;
}