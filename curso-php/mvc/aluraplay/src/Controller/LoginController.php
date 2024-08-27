<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\Repository\Repository;
use Mvc\Aluraplay\Model\Repository\UserRepository;
use function header;
use function password_verify;
use function session_start;

class LoginController implements Controller
{
    public function processRequest(): void
    {
        $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
        $password = filter_input(INPUT_POST, 'password');

        $userRepository = new UserRepository(Connection::createConnection());

        $user = $userRepository->findByEmail($email)[0];

        if (password_verify($password, $user->password ?? '')) {
            $_SESSION['loggedIn'] = true;

            header('Location: /message?success=true');
        } else {
            header('Location: /login?success=false');
        }
        
    }
}