<?php

namespace Alura\Pdo\Infrastructure\Persistence;

use PDO;
class ConnectionCreator
{
    public static function createConnection() : PDO
    {
        return new PDO('sqlite:' . __DIR__ . '/../../../db.sqlite');
    }
}