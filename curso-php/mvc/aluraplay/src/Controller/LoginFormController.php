<?php

namespace Mvc\Aluraplay\Controller;

use function header;

class LoginFormController implements Controller
{
    public function processRequest(): void
    {
        if(array_key_exists('loggedIn', $_SESSION) && $_SESSION['loggedIn']) {
            header('Location: /');
        } else {
            require_once __DIR__ . '/../../views/login-form.php';
        }
    }
}