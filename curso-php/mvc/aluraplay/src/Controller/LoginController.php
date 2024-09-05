<?php

namespace Mvc\Aluraplay\Controller;

use Mvc\Aluraplay\Helper\FlashMessageTrait;
use Mvc\Aluraplay\Model\Connection;
use Mvc\Aluraplay\Model\Entity\User;
use Mvc\Aluraplay\Model\Repository\Repository;
use Mvc\Aluraplay\Model\Repository\UserRepository;
use Nyholm\Psr7\Response;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\RequestHandlerInterface;
use function header;
use function password_hash;
use function password_needs_rehash;
use function password_verify;
use function session_start;

class LoginController implements RequestHandlerInterface
{
    public function __construct(
        public readonly UserRepository $userRepository,
    ) {

    }

    use FlashMessageTrait;

    public function handle(ServerRequestInterface $request): ResponseInterface
    {
        $queryParams = $request->getParsedBody();

        $email = filter_var( $queryParams['email'], FILTER_VALIDATE_EMAIL);
        $password = filter_var($queryParams['password']);

        $user = $this->userRepository->findByEmail($email)[0];

        if (password_verify($password, $user->password ?? '')) {
            if (password_needs_rehash($user->password, PASSWORD_ARGON2ID)) {
                $newPasswordUser = new User(
                    id: $user->id,
                    email: $user->email,
                    password: password_hash($password, PASSWORD_ARGON2ID)
                );

                $this->userRepository->save($newPasswordUser);
            }

            $_SESSION['loggedIn'] = true;

            return new Response(302, ['Location' => '/']);
        }

        $this->addErrorMessage("Wrong email or password");

        return new Response(302, ['Location' => '/login']);
    }
}