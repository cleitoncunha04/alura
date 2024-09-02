<?php

namespace Mvc\Aluraplay\Helper;

use function extract;
use function ob_get_clean;
use function ob_start;

trait HtmlRendererTrait
{
    private const string TEMPLATE_PATH = __DIR__ . '/../../views/';

    private function renderTemplate(string $templateName, array $context = []): string
    {
        extract($context);

        //inicializa o buffer de saída
        ob_start();
        require_once self::TEMPLATE_PATH . $templateName;
        return ob_get_clean();
    }
}