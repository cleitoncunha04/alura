<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\HtmlRendererTrait;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;

class LoginFormController implements RequestHandlerInterface
{
    use HtmlRendererTrait;

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        if(array_key_exists('loggedIn', $_SESSION) && $_SESSION['loggedIn']) {
            return new Response(302, ['Location' => '/']);
        } else {
            return new Response(status: 200, body: $this->renderTemplate('login-form.php'));
        }
    }
}