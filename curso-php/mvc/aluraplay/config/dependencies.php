<?php

/** @var ContainerInterface $container */

use DI\ContainerBuilder;
use League\Plates\Engine;
use Mvc\Aluraplay\Model\Connection;
use Psr\Container\ContainerInterface;

$builder = new ContainerBuilder();

$builder->addDefinitions([
    PDO::class => Connection::createConnection(),
    /*PDO::class => \DI\create(PDO:class)->constructor(
        dns: 'mysql:host=localhost;dbname=alura_play',
        username: 'root',
        password: 'root'
    )*/
    Engine::class => function () {
        $templatePath = __DIR__ . '/../views';

        return new Engine($templatePath);
}
]);

$container = $builder->build();

return $container;