<?php
$success = filter_input(INPUT_GET, 'success', FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE);
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="public/img/favicon.ico" type="image/x-icon">
    <title>Mensagem</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #154580;
            margin-bottom: 20px;
        }

        p {
            font-size: 16px;
            color: #555;
            line-height: 1.5rem;
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            font-size: 16px;
            color: #fff;
            background-color: #3970BE;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #154580;
        }
    </style>
</head>
<body>
<div class="container">
    <?php if ($success) : ?>
        <h1>Sucesso!</h1>
        <p>Ação realizada com sucesso.</p>
    <?php else : ?>
        <h1>Erro!</h1>
        <p>Ocorreu um erro ao realizar a ação.<br>Por favor, tente novamente.</p>
    <?php endif; ?>
    <a href="/" class="button">Voltar para a lista de vídeos</a>
</div>
</body>
</html>
