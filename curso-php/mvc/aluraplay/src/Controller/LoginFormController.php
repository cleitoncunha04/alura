<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\HtmlRendererTrait;
use function header;

class LoginFormController implements Controller
{
    use HtmlRendererTrait;

    public function processRequest(): void
    {
        if(array_key_exists('loggedIn', $_SESSION) && $_SESSION['loggedIn']) {
            header('Location: /');
        } else {
            echo $this->renderTemplate('login-form.php');
        }
    }
}