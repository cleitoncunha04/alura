<?php

namespace Mvc\Aluraplay\Model;

readonly class Video
{
    public function __construct(
        public ?int   $id,
        public string $url,
        public string $title,
    ) {
    }
    public function generateVideoUrl(): string
    {
        return str_contains($this->url, "https://www.youtube.com/watch?v=")
            ? str_replace("https://www.youtube.com/watch?v=", "https://www.youtube.com/embed/", $this->url)
            : $this->url;
    }

}