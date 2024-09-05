<?php

use Mvc\Aluraplay\Controller\Error404Controller;
use Psr\Container\ContainerInterface;
use Psr\Http\Server\RequestHandlerInterface;

require_once __DIR__ . "/../vendor/autoload.php";

$routes = require __DIR__ . "/../config/routes.php";

/** @var ContainerInterface $diContainer */
$diContainer = require __DIR__ . "/../config/dependencies.php";

$pathInfo = $_SERVER['PATH_INFO'] ?? "/";
$httpMethod = $_SERVER['REQUEST_METHOD'];

session_set_cookie_params(
    [
        'lifetime' => 3600,
        'path' => '/',
        'domain' => '',
        'secure' => true,
        'httponly' => true,
        'samesite' => 'Lax'
    ]
);

session_start();

session_regenerate_id(true);

$isLoggedRoute = $pathInfo === "/login";

if (!array_key_exists('loggedIn', $_SESSION) && !$isLoggedRoute) {
    header('Location: /login');

    return;
}


if (array_key_exists("$httpMethod|$pathInfo", $routes)) {
    $controllerClass = $routes["$httpMethod|$pathInfo"];

    $controller = $diContainer->get($controllerClass);
} else {
    $controller = new Error404Controller();
}

$psr17Factory = new \Nyholm\Psr7\Factory\Psr17Factory();

$creator = new \Nyholm\Psr7Server\ServerRequestCreator(
    $psr17Factory, // ServerRequestFactory
    $psr17Factory, // UriFactory
    $psr17Factory, // UploadedFileFactory
    $psr17Factory  // StreamFactory
);

// passa as variaveis, como $_POST, $_GET, $_FILES, $_COOKIES, etc.
$request = $creator->fromGlobals();

/** @var RequestHandlerInterface $controller */
$response = $controller->handle($request);

$response->getHeaders();

http_response_code($response->getStatusCode());
foreach ($response->getHeaders() as $header => $values) {
    foreach ($values as $value) {
        header(sprintf('%s: %s', $header, $value), false);
    }
}

echo $response->getBody();


