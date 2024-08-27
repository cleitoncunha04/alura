<?php
require_once "vendor/autoload.php";


use Mvc\Aluraplay\Model\Connection;

$email = $argv[1];

$password = password_hash($argv[2], PASSWORD_ARGON2ID);

$connection = Connection::createConnection();

$statment = $connection->prepare("INSERT INTO users (email, password) VALUES (:email, :password)");
$statment->bindValue(':email', $email);
$statment->bindValue(':password', $password);

var_dump($statment->execute());

echo $password . PHP_EOL;




