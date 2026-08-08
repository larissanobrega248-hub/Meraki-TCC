<?php
$host = "localhost";
$usuario = "root";
$senha = "1234";
$banco = "meraki2.0";

$conexao = new mysqli($host, $usuario, $senha, $banco);

if ($conexao->connect_error) {
    die("Falha na conexão: " . $conexao->connect_error);
}

?>