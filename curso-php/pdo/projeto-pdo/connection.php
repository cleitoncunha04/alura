<?php

$pdo = new PDO('sqlite:' . __DIR__ . '/db.sqlite');

$pdo->exec('DROP TABLE IF EXISTS students');

$pdo->exec('CREATE TABLE IF NOT EXISTS students (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    name TEXT, 
    birth_date TEXT
);');