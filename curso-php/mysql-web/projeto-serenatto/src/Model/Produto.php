<?php

namespace Vendor\Serenatto\Model;

class Produto
{
    public function __construct(
        public readonly ?int $id,
        public readonly string $tipo,
        public readonly string $nome,
        public readonly string $descricao,
        public readonly string $imagem,
        public readonly float $preco,
    ) {
    }
}