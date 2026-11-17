<?php
session_start();
require 'config.php';

$email = '';
$mensagem = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $email = trim(isset($_POST['email']) ? $_POST['email'] : '');
    $senha = isset($_POST['senha']) ? $_POST['senha'] : '';

    $consulta = $mysqli->prepare('SELECT nome, senha FROM usuario WHERE email = ?');
    $consulta->bind_param('s', $email);
    $consulta->execute();
    $usuario = $consulta->get_result()->fetch_assoc();

    if ($usuario && password_verify($senha, $usuario['senha'])) {
        session_regenerate_id(true);
        $_SESSION['usuario_email'] = $email;
        $_SESSION['usuario_nome'] = $usuario['nome'];
        $destino = isset($_SESSION['destino']) ? $_SESSION['destino'] : 'index.php';
        unset($_SESSION['destino']);
        header('Location: ' . $destino);
        exit;
    }

    $mensagem = 'E-mail ou senha incorretos.';
}

$titulo_pagina = 'Entrar';
require 'includes/cabecalho.php';
?>
    <section class="pagina-acesso">
        <div class="cartao-acesso">
            <span class="icone-acesso">Person</span>
            <span class="destaque-pequeno">Que bom ter você aqui</span>
            <h1>Acesso Meraki</h1>
            <p>Entre para acessar seus lugares favoritos.</p>

            <?php if ($mensagem): ?>
                <div class="mensagem erro" role="alert"><?php echo htmlspecialchars($mensagem); ?></div>
            <?php endif; ?>

            <form method="post" class="formulario">
                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>" autocomplete="email" required placeholder="voce@exemplo.com">

                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" autocomplete="current-password" required placeholder="Sua senha">

                <button class="botao" type="submit">Entrar</button>
            </form>
            <p class="alternativa">Ainda não tem conta? <a href="cadastro.php">Criar conta</a></p>
        </div>
    </section>
<?php require 'includes/rodape.php'; ?>
