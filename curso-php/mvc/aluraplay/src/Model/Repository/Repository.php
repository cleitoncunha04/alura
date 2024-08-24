<?php

namespace Mvc\Aluraplay\Model\Repository;

interface Repository
{
    public function findAll() : array;

    public function findById(int $id) : array;

    public function save(object $object) : bool;

    public function remove(int $id) : bool;
}