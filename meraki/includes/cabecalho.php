<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

$titulo_pagina = isset($titulo_pagina) ? $titulo_pagina : 'Meraki';
$pagina_atual = basename($_SERVER['PHP_SELF']);
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Meraki: encontre espaços de lazer, cultura e desenvolvimento para crianças e famílias.">
    <title><?php echo htmlspecialchars($titulo_pagina); ?> | Meraki</title>
    <link rel="stylesheet" href="assets/css/estilo.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    
</head>
<body>
    <header class="cabecalho">
        <div class="container barra-menu">
            <a class="marca" href="index.php" aria-label="Meraki - Início">
                <img src="assets/logo/logomeraki.png" alt="Meraki">
            </a>

            <button class="botao-menu" type="button" aria-expanded="false" aria-controls="menu-principal">
                <span></span>
                <span></span>
                <span></span>
                <span class="somente-leitor">Abrir menu</span>
            </button>

            <nav class="menu-principal" id="menu-principal" aria-label="Menu principal">
                <a class="<?php echo $pagina_atual === 'index.php' ? 'ativo' : ''; ?>" href="index.php">Início</a>
                <a href="index.php#sobre">Meraki</a>
                <a class="<?php echo $pagina_atual === 'locais.php' ? 'ativo' : ''; ?>" href="locais.php">Locais</a>
                <?php if (isset($_SESSION['usuario_email'])): ?>
                    <a class="<?php echo $pagina_atual === 'favoritos.php' ? 'ativo' : ''; ?>" href="favoritos.php">Favoritos</a>
                    <a class="entrar" href="sair.php" title="Sair da conta" aria-label="Sair da conta">
                        <span class="icone-material" aria-hidden="true">logout</span>
                        <span>Sair</span>
                    </a>
                <?php else: ?>
                    <a class="entrar <?php echo $pagina_atual === 'login.php' ? 'ativo' : ''; ?>" href="login.php">
                        <span class="icone-material" aria-hidden="true">login</span>
                        <span>Entrar</span>
                    </a>
                <?php endif; ?>
            </nav>
        </div>
    </header>
    <main>
