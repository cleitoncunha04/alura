<?php

namespace Mvc\Aluraplay\Controller;

class LoginFormController implements Controller
{
    public function processRequest(): void
    {
        require_once __DIR__ . '/../../views/login-form.php';
    }
}