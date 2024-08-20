<?php

namespace Vendor\Serenatto\Model;

class Product
{
    public function __construct(
        public readonly ?int   $id,
        public readonly string $type,
        public readonly string $name,
        public readonly string $description,
        public readonly float  $price,
        private string $image = "logo-serenatto.png",
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

    public function getImage(): string
    {
        return $this->image;
    }

    public function setImage(string $image): void
    {
        $this->image = $image;
    }
}