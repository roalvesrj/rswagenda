<?php
try{
    $conn = new PDO('pgsql:host=localhost;port=5432;dbname=rswagenda','postgres','root');
    if ($conn) {
        echo "database conectado";
    }
} catch (PDOException $e) {
    echo $e->getMessage();
} 