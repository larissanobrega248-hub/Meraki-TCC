<?php
session_start();
require 'config.php';

$nome = '';
$email = '';
$mensagem = '';
$tipo_mensagem = 'erro';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nome = trim(isset($_POST['nome']) ? $_POST['nome'] : '');
    $email = trim(isset($_POST['email']) ? $_POST['email'] : '');
    $senha = isset($_POST['senha']) ? $_POST['senha'] : '';

    if (strlen($nome) < 3) {
        $mensagem = 'Informe seu nome completo.';
    } elseif (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $mensagem = 'Informe um e-mail válido.';
    } elseif (strlen($senha) < 6) {
        $mensagem = 'A senha precisa ter pelo menos 6 caracteres.';
    } else {
        try {
            $mysqli->begin_transaction();

            $consulta = $mysqli->prepare('SELECT email FROM usuario WHERE email = ?');
            $consulta->bind_param('s', $email);
            $consulta->execute();

            if ($consulta->get_result()->num_rows > 0) {
                throw new RuntimeException('Este e-mail já está cadastrado.');
            }

            $senha_segura = password_hash($senha, PASSWORD_DEFAULT);
            $inserir = $mysqli->prepare('INSERT INTO usuario (email, nome, senha) VALUES (?, ?, ?)');
            $inserir->bind_param('sss', $email, $nome, $senha_segura);
            $inserir->execute();

            $inserir_tipo = $mysqli->prepare('INSERT INTO usuario_normal (email) VALUES (?)');
            $inserir_tipo->bind_param('s', $email);
            $inserir_tipo->execute();

            $mysqli->commit();
            $_SESSION['usuario_email'] = $email;
            $_SESSION['usuario_nome'] = $nome;
            header('Location: index.php?boas_vindas=1');
            exit;
        } catch (Throwable $erro) {
            $mysqli->rollback();
            $mensagem = $erro instanceof RuntimeException ? $erro->getMessage() : 'Não foi possível criar sua conta agora.';
            error_log($erro->getMessage());
        }
    }
}

$titulo_pagina = 'Criar conta';
require 'includes/cabecalho.php';
?>
    <section class="pagina-acesso">
        <div class="cartao-acesso">
            <span class="icone-acesso">&#9829</span>
            <span class="destaque-pequeno">Bem-vindo à Meraki</span>
            <h1>Crie sua conta</h1>
            <p>Salve seus lugares preferidos e planeje bons momentos.</p>

            <?php if ($mensagem): ?>
                <div class="mensagem <?php echo $tipo_mensagem; ?>" role="alert"><?php echo htmlspecialchars($mensagem); ?></div>
            <?php endif; ?>

            <form method="post" class="formulario">
                <label for="nome">Nome completo</label>
                <input type="text" id="nome" name="nome" value="<?php echo htmlspecialchars($nome); ?>" autocomplete="name" required minlength="3" placeholder="Seu nome e sobrenome">

                <label for="email">E-mail</label>
                <input type="email" id="email" name="email" value="<?php echo htmlspecialchars($email); ?>" autocomplete="email" required placeholder="voce@exemplo.com">

                <label for="senha">Senha</label>
                <input type="password" id="senha" name="senha" autocomplete="new-password" required minlength="6" placeholder="No mínimo 6 caracteres">

                <button class="botao" type="submit">Criar minha conta</button>
            </form>
            <p class="alternativa">Já possui uma conta? <a href="login.php">Entrar</a></p>
        </div>
    </section>
<?php require 'includes/rodape.php'; ?>
