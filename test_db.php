<?php
// ============================================
// Simple test script to verify DB connection
// ============================================

// Get environment variables
$host = getenv('DB_HOST') ?: '20.81.148.176';
$db   = getenv('DB_DATABASE') ?: 'odontoapp';
$user = getenv('DB_USERNAME') ?: 'odontoapp_user';
$pass = getenv('DB_PASSWORD') ?: 'WC39ka10@';
$port = getenv('DB_PORT') ?: '3306';

echo "<h3>🔍 Testing MySQL connection...</h3>";
echo "Host: $host<br>";
echo "Database: $db<br>";
echo "User: $user<br>";
echo "Port: $port<br><br>";

try {
    $dsn = "mysql:host=$host;port=$port;dbname=$db;charset=utf8mb4";
    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_TIMEOUT => 5,
    ]);

    $query = $pdo->query("SELECT NOW() as current_time");
    $result = $query->fetch(PDO::FETCH_ASSOC);

    echo "<h4>✅ Connection successful!</h4>";
    echo "Server time: " . $result['current_time'] . "<br>";
    echo "PDO driver: " . $pdo->getAttribute(PDO::ATTR_DRIVER_NAME) . "<br>";
} catch (Exception $e) {
    echo "<h4>❌ Connection failed!</h4>";
    echo "<b>Error:</b> " . htmlspecialchars($e->getMessage()) . "<br>";
    echo "<pre>";
    print_r($e);
    echo "</pre>";
}
?>
