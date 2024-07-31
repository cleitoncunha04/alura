<?php

class Filme extends Titulo
{
    public function __construct(
        string $nome,
        int $anoLancamento,
        Genero $genero,
        public readonly int $duracaoEmMinutos,
    ){
        //permite acessar como parametro os atributos da classe filme no construtor do título
        parent::__construct($nome, $anoLancamento, $genero);
    }
}