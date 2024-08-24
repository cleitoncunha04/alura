<?php

namespace Mvc\Aluraplay\Controller;

class Error404Controller implements Controller
{
    public function processRequest() : void
    {
        http_response_code(404);
    }
}