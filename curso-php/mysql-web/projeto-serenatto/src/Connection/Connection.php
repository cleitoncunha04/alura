<?php

namespace Vendor\Serenatto\Connection;

use PDO;
class Connection {
    public static function createConnection() : PDO
    {
        $connection = new PDO('mysql:host=localhost;dbname=serenatto', 'root', 'root');

        $connection->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        return $connection;
    }
}


