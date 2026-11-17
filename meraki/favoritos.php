<?php
session_start();

if (!isset($_SESSION['usuario_email'])) {
    $_SESSION['destino'] = 'favoritos.php';
    header('Location: login.php');
    exit;
}

require 'config.php';
$email = $_SESSION['usuario_email'];
$consulta = $mysqli->prepare("SELECT e.*, GROUP_CONCAT(DISTINCT ce.categoria SEPARATOR ',') AS categorias
                              FROM favorito f
                              INNER JOIN espaco e ON e.idespaco = f.idespaco
                              LEFT JOIN categoria_espaco ce ON ce.idespaco = e.idespaco
                              WHERE f.email = ?
                              GROUP BY e.idespaco
                              ORDER BY e.nome");
$consulta->bind_param('s', $email);
$consulta->execute();
$resultado = $consulta->get_result();

$titulo_pagina = 'Favoritos';
require 'includes/cabecalho.php';
?>
    <section class="hero hero-interno hero-favoritos">
        <div class="container">
            <span class="destaque-pequeno">Sua seleção especial</span>
            <h1><span class="coracao">&#9829</span> Meus favoritos</h1>
            <p>Os lugares que você guardou para conhecer e visitar novamente.</p>
        </div>
    </section>
    <section class="secao">
        <div class="container grade-locais">
            <?php if ($resultado->num_rows === 0): ?>
                <div class="estado-vazio">
                    <span>&#9825</span>
                    <h2>Nenhum favorito ainda</h2>
                    <p>Explore os locais e clique no coração dos seus preferidos.</p>
                    <a class="botao" href="locais.php">Explorar locais</a>
                </div>
            <?php endif; ?>
           <?php while ($local = $resultado->fetch_assoc()): ?>
                <a class="cartao-local" href="local.php?id=<?php echo (int) $local['idespaco']; ?>&origem=favoritos">
                    <div class="foto-local <?php echo empty($local['foto']) ? 'sem-foto' : ''; ?>"<?php if ($local['foto']): ?> style="background-image: url('<?php echo htmlspecialchars($local['foto']); ?>')"<?php endif; ?>>
                        <?php if (!$local['foto']): ?><span>Meraki</span><?php endif; ?>
                        <button class="botao-favorito ativo" data-id="<?php echo (int) $local['idespaco']; ?>" aria-label="Remover dos favoritos">&#9829</button>
                    </div>
                    <div class="conteudo-local">
                        <span class="categorias-local"><?php echo htmlspecialchars($local['categorias'] ?: 'Lugar especial'); ?></span>
                        <h2><?php echo htmlspecialchars($local['nome']); ?></h2>
                        <p>&#8226 <?php echo htmlspecialchars($local['endereco']); ?></p>
                        <?php if ($local['horario_de_funcionamento']): ?><p><span class="icone-cartao-local">schedule</span> <?php echo htmlspecialchars($local['horario_de_funcionamento']); ?></p><?php endif; ?>
                    </div>
                 </a>
            <?php endwhile; ?>
        </div>
    </section>
<?php require 'includes/rodape.php'; ?>
