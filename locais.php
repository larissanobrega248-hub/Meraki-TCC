<?php
header('Content-Type: application/json; charset=utf-8');

require dirname(__DIR__) . '/config.php';

try {
    $consulta = "SELECT e.idespaco, e.nome, e.foto, e.endereco, e.faixa_etaria,
                       e.horario_de_funcionamento, e.acessibilidade, e.forma_pagamento,
                       e.tipo_atividade, e.link_contato, e.telefone, e.descricao,
                       GROUP_CONCAT(DISTINCT ce.categoria ORDER BY ce.categoria SEPARATOR ',') AS categorias
                FROM espaco e
                LEFT JOIN categoria_espaco ce ON ce.idespaco = e.idespaco
                GROUP BY e.idespaco
                ORDER BY e.nome";

    $resultado = $mysqli->query($consulta);
    $locais = array();

    while ($local = $resultado->fetch_assoc()) {
        $local['idespaco'] = (int) $local['idespaco'];
        $local['categorias'] = $local['categorias'] ? explode(',', $local['categorias']) : array();
        $locais[] = $local;
    }

    echo json_encode($locais, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
} catch (Throwable $erro) {
    http_response_code(500);
    error_log($erro->getMessage());
    echo json_encode(array('erro' => 'Não foi possível carregar os locais.'), JSON_UNESCAPED_UNICODE);
}
