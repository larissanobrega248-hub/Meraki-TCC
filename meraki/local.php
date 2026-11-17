<?php
$titulo_pagina = 'Detalhes do local';

$veio_dos_favoritos = isset($_GET['origem']) && $_GET['origem'] === 'favoritos';
$voltar_url   = $veio_dos_favoritos ? 'favoritos.php' : 'locais.php';
$voltar_texto = $veio_dos_favoritos ? '&#8592 Voltar para favoritos' : '&#8592 Voltar para locais';

require 'includes/cabecalho.php';
?>
    <section class="secao">
        <div class="container">
            <a class="botao-voltar" href="<?php echo $voltar_url; ?>"><?php echo $voltar_texto; ?></a>
            <div id="detalhe-local">
                Carregando...
            </div>
        </div>
    </section>
<?php require 'includes/rodape.php'; ?>