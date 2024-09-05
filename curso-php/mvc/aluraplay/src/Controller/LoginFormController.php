<?php

namespace Mvc\Aluraplay\Controller;

use League\Plates\Engine;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;

readonly class LoginFormController implements RequestHandlerInterface
{
    public function __construct(
        private Engine $templates,
    ) {

    }

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        if(array_key_exists('loggedIn', $_SESSION) && $_SESSION['loggedIn']) {
            return new Response(302, ['Location' => '/']);
        } else {
            return new Response(status: 200, body: $this->templates->render('login-form'));
        }
    }
}