<?php

namespace Mvc\Aluraplay\Controller;

use function header;

class LogoutController implements Controller
{

    public function processRequest(): void
    {
        unset($_SESSION['loggedIn']);

        header('Location: /login');
    }
}