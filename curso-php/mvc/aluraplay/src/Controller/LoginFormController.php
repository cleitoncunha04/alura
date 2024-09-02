<?php

namespace Mvc\Aluraplay\Controller;

use function header;

class LoginFormController extends ControllerWithHtml implements Controller
{
    public function processRequest(): void
    {
        if(array_key_exists('loggedIn', $_SESSION) && $_SESSION['loggedIn']) {
            header('Location: /');
        } else {
            echo $this->renderTemplate('login-form.php');
        }
    }
}