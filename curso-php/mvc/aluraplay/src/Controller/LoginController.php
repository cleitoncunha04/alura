<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\Entity\User;
use Mvc\Aluraplay\Model\Repository\Repository;
use Mvc\Aluraplay\Model\Repository\UserRepository;
use function header;
use function password_hash;
use function password_needs_rehash;
use function password_verify;
use function session_start;

class LoginController implements Controller
{
    use FlashMessageTrait;

    public function processRequest(): void
    {
        $email = filter_input(INPUT_POST, 'email', FILTER_VALIDATE_EMAIL);
        $password = filter_input(INPUT_POST, 'password');

        $userRepository = new UserRepository(Connection::createConnection());

        $user = $userRepository->findByEmail($email)[0];

        if (password_verify($password, $user->password ?? '')) {
            if (password_needs_rehash($user->password, PASSWORD_ARGON2ID)) {
                $newPasswordUser = new User(
                    id: $user->id,
                    email: $user->email,
                    password: password_hash($password, PASSWORD_ARGON2ID)
                );

                $userRepository->save($newPasswordUser);
            }

            $_SESSION['loggedIn'] = true;

            header('Location: /');
        } else {
            $this->addErrorMessage("Wrong email or password");

            header('Location: /login');
        }

    }
}