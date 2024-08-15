<?php
namespace ScreenMatch\Exception;

use Exception;

//criei uma classe que herda Exception para ter uma exceção customizada
class NotaInvalidaException extends Exception {
    public function __construct()
    {
        //passei uma nova mensagem como parametro pro construtor "pai"
        parent::__construct("A nota precisa estar entre 0 e 10");
    }
}