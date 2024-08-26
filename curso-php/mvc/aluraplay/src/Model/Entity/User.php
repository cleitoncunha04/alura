<?php

namespace Mvc\Aluraplay\Model\Entity;

readonly class User
{
    public function __construct(
        public ?int   $id,
        public string $email,
        public string $password,
    ) {
    }
}