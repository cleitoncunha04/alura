<?php

namespace Vendor\Serenatto\Conexao;

use PDO;

class Conexao {
    public static function getConexao() : PDO
    {
        $pdo = new PDO('mysql:host=localhost;dbname=serenatto', 'root', 'root');

        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);

        return $pdo;
    }
}


