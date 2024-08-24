<?php

namespace Mvc\Aluraplay\Entity;

use InvalidArgumentException;

class Video
{
    public readonly string $url;

    public function __construct(
        public ?int   $id,
        string $url,
        public string $title,
    ) {
        $this->setUrl($url);
    }

    private function setUrl(string $url): void
    {
        if (!filter_var($url, FILTER_VALIDATE_URL) && $url !== "") {
            throw new InvalidArgumentException();
        }

        $this->url = $url;
    }

    public function generateVideoUrl(): string
    {
        return str_contains($this->url, "https://www.youtube.com/watch?v=")
            ? str_replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/", $this->url)
            : $this->url;
    }
}