<?php

namespace Mvc\Aluraplay\Controller;

abstract class ControllerWithHtml implements Controller
{
    private const string TEMPLATE_PATH = __DIR__ . '/../../views/';

    protected function renderTemplate(string $templateName, array $context = []): string
    {
        extract($context);

        //inicializa o buffer de saída
        ob_start();
        require_once self::TEMPLATE_PATH . $templateName;
        return ob_get_clean();
    }

    abstract public function processRequest(): void;
}