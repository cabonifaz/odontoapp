<?php
$clavePlano = "WC39ka10@";

// ✅ Generar el hash bcrypt (cost = 10 por defecto)
$claveHash = password_hash($clavePlano, PASSWORD_BCRYPT);

// Si quieres forzar un costo específico (ej. 4 rondas):
// $claveHash = password_hash($clavePlano, PASSWORD_BCRYPT, ['cost' => 4]);

// Insertar en la base de datos
$sql = "INSERT INTO users (name, email, password) 
        VALUES (:name, :email, :password)";
$stmt = $pdo->prepare($sql);
$stmt->execute([
    ':name'     => 'CRIS',
    ':email'    => 'cabonifaz@geeky-tech.es',
    ':password' => $claveHash
]);

echo "✅ Usuario insertado con hash: " . $claveHash;
