<?php

//autoload para substituir o montem de require
spl_autoload_register(function (string $className) {

    $caminho = str_replace('ScreenMatch', "src", $className) . '.php';
    //substituo a contra barra pelo separator de pastas do S.O
    $caminho = str_replace('\\', DIRECTORY_SEPARATOR, $caminho);

    $caminhoCompleto = __DIR__ . DIRECTORY_SEPARATOR . $caminho;

    if (file_exists($caminhoCompleto)) {
        require_once $caminhoCompleto;
    }
});