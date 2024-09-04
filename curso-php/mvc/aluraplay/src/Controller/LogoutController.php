<?php

namespace Mvc\Aluraplay\Controller;

use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;

class LogoutController implements RequestHandlerInterface
{

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        unset($_SESSION['loggedIn']);

        return new Response(302, ['Location' => '/login']);
    }
}