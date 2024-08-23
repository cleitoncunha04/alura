<?php
namespace Mvc\Aluraplay\Model;

use PDO;

class Connection
{
    public static function createConnection() : PDO
    {
        $connection = new \PDO('mysql:host=localhost;dbname=alura_play', 'root', 'root');

        $connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        return $connection;
    }
}