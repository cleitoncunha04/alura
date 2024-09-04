<?php

/** @var ContainerInterface $container */

use DI\ContainerBuilder;
use Psr\Container\ContainerInterface;

$builder = new ContainerBuilder();

$builder->addDefinitions([
    PDO::class => \Mvc\Aluraplay\Model\Connection::createConnection()
    /*PDO::class => \DI\create(PDO:class)->constructor(
        dns: 'mysql:host=localhost;dbname=alura_play',
        username: 'root',
        password: 'root'
    )*/
]);

$container = $builder->build();

return $container;