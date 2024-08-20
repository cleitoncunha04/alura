<?php

namespace Vendor\Serenatto\Model;

class Product
{
    public function __construct(
        public readonly ?int   $id,
        public readonly string $type,
        public readonly string $name,
        public readonly string $description,
        public readonly string $image,
        public readonly float  $price,
    ) {
    }

    public function generateImageUrl(): string
    {
        return "img/{$this->image}";
    }

    public function numberFormatter(): string
    {
        return "R$ " . number_format($this->price, 2, ',', '.');
    }
}