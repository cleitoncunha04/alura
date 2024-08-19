<?php

$pdo = new PDO('sqlite:' . __DIR__ . '/db.sqlite');

/*$pdo->exec('DROP TABLE IF EXISTS students');*/

$pdo->exec('
    CREATE TABLE IF NOT EXISTS students (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        name TEXT, 
        birth_date TEXT
    );
    
    CREATE TABLE IF NOT EXISTS phones (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        area_code TEXT, 
        number TEXT,
        student_id INTEGER,
        FOREIGN KEY (student_id) REFERENCES students(id)                  
    );
');

$pdo->exec('INSERT INTO phones (area_code, number, student_id) VALUES ("19", "99999-9999", 1), ("19", "98888-9222", 1)');