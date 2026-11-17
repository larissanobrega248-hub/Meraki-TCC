<?php
header('Content-Type: application/json; charset=utf-8');

require dirname(__DIR__) . '/config.php';

$id_espaco = filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT);

if (!$id_espaco || $id_espaco < 1) {
    http_response_code(400);
    echo json_encode(
        array('erro' => 'Informe um ID de local válido no parâmetro "id".'),
        JSON_UNESCAPED_UNICODE
    );
    exit;
}

try {
    $consulta = $mysqli->prepare('SELECT * FROM espaco WHERE idespaco = ?');
    $consulta->bind_param('i', $id_espaco);
    $consulta->execute();
    $local = $consulta->get_result()->fetch_assoc();

    if (!$local) {
        http_response_code(404);
        echo json_encode(
            array('erro' => 'Local não encontrado.'),
            JSON_UNESCAPED_UNICODE
        );
        exit;
    }

    $local['idespaco'] = (int) $local['idespaco'];
    $local['categorias'] = buscar_lista(
        $mysqli,
        'SELECT categoria FROM categoria_espaco WHERE idespaco = ? ORDER BY categoria',
        $id_espaco,
        'categoria'
    );
    $local['acessibilidades'] = buscar_lista(
        $mysqli,
        'SELECT acessibilidade FROM acessibilidade_espaco WHERE idespaco = ? ORDER BY acessibilidade',
        $id_espaco,
        'acessibilidade'
    );
    $local['faixas_etarias'] = buscar_lista(
        $mysqli,
        'SELECT faixa_etaria FROM faixa_etaria_espaco WHERE idespaco = ? ORDER BY faixa_etaria',
        $id_espaco,
        'faixa_etaria'
    );
    $local['formas_pagamento'] = buscar_lista(
        $mysqli,
        'SELECT forma_pagamento
        FROM forma_pagamento_espaco
        WHERE idespaco = ?
        ORDER BY forma_pagamento',
        $id_espaco,
        'forma_pagamento'
    );
    $local['equipamentos'] = buscar_lista(
        $mysqli,
        'SELECT equipamento FROM espaco_equipamento WHERE idespaco = ? ORDER BY equipamento',
        $id_espaco,
        'equipamento'
    );
    $local['horarios'] = buscar_registros(
        $mysqli,
        'SELECT dia, TIME_FORMAT(hora_abertura, "%H:%i") AS hora_abertura,
                TIME_FORMAT(hora_fechamento, "%H:%i") AS hora_fechamento
         FROM horario_funcionamento
         WHERE idespaco = ?
         ORDER BY FIELD(dia, "Segunda-feira", "Terça-feira", "Quarta-feira",
                        "Quinta-feira", "Sexta-feira", "Sábado", "Domingo")',
        $id_espaco
    );

    echo json_encode(
        $local,
        JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES
    );
} catch (Throwable $erro) {
    http_response_code(500);
    error_log($erro->getMessage());
    echo json_encode(
        array(
            'erro' => 'Não foi possível carregar os dados do local.',
        ),
        JSON_UNESCAPED_UNICODE
    );
}

function buscar_lista($mysqli, $sql, $id_espaco, $campo)
{
    $registros = buscar_registros($mysqli, $sql, $id_espaco);
    $lista = array();

    foreach ($registros as $registro) {
        $lista[] = $registro[$campo];
    }

    return $lista;
}

function buscar_registros($mysqli, $sql, $id_espaco)
{
    $consulta = $mysqli->prepare($sql);
    $consulta->bind_param('i', $id_espaco);
    $consulta->execute();
    $resultado = $consulta->get_result();
    $registros = array();

    while ($registro = $resultado->fetch_assoc()) {
        $registros[] = $registro;
    }

    return $registros;
}
