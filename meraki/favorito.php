<?php
session_start();
header('Content-Type: application/json; charset=utf-8');

if (!isset($_SESSION['usuario_email'])) {
    http_response_code(401);
    echo json_encode(array('erro' => 'Entre para salvar este local.'), JSON_UNESCAPED_UNICODE);
    exit;
}

require 'config.php';

$dados = json_decode(file_get_contents('php://input'), true);
$id_espaco = isset($dados['idespaco']) ? (int) $dados['idespaco'] : 0;

if ($id_espaco < 1) {
    http_response_code(400);
    echo json_encode(array('erro' => 'Local inválido.'), JSON_UNESCAPED_UNICODE);
    exit;
}

$email = $_SESSION['usuario_email'];
$consulta = $mysqli->prepare('SELECT idespaco FROM favorito WHERE email = ? AND idespaco = ?');
$consulta->bind_param('si', $email, $id_espaco);
$consulta->execute();
$ja_favorito = $consulta->get_result()->num_rows > 0;

if ($ja_favorito) {
    $alterar = $mysqli->prepare('DELETE FROM favorito WHERE email = ? AND idespaco = ?');
    $favorito = false;
} else {
    $alterar = $mysqli->prepare('INSERT INTO favorito (email, idespaco) VALUES (?, ?)');
    $favorito = true;
}

$alterar->bind_param('si', $email, $id_espaco);
$alterar->execute();
echo json_encode(array('favorito' => $favorito));
