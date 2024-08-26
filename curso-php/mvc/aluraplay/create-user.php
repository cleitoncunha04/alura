<?php
require_once "vendor/autoload.php";


use Mvc\Aluraplay\Model\Connection;

$email = $argv[1];

$password = password_hash($argv[2], PASSWORD_ARGON2ID);

$connection = Connection::createConnection();

$statment = $connection->prepare("SELECT * FROM users WHERE email = :email");
$statment->bindValue(':email', $email);
$statment->execute();

$user = $statment->fetch(PDO::FETCH_ASSOC);

var_dump($user);
echo $password . PHP_EOL;




