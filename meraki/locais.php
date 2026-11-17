<?php
$titulo_pagina = 'Locais';
require 'includes/cabecalho.php';
?>
    <section class="hero hero-interno">
        <div class="container">
            <span class="destaque-pequeno">Seu próximo passeio começa aqui</span>
            <h1>Locais</h1>
            <p>Pesquise e filtre espaços que combinam com o momento da sua família.</p>
        </div>
    </section>

    <section class="secao secao-locais">
        <div class="container">
            <div class="painel-filtros">
                <label class="campo-busca">
                    <span class="somente-leitor">Pesquisar locais</span>
                    <span class="icone-campo-busca">search</span>
                    <input type="search" id="filtro-texto" placeholder="Busque por nome, endereço ou atividade">
                </label>
                <div class="pills" id="filtro-categorias" aria-label="Filtrar por uma ou mais categorias">
                    <button class="pill ativo" type="button" data-categoria="" aria-pressed="true">Todos</button>
                    <button class="pill" type="button" data-categoria="Físicas" aria-pressed="false">Físicas</button>
                    <button class="pill" type="button" data-categoria="Artísticas" aria-pressed="false">Artísticas</button>
                    <button class="pill" type="button" data-categoria="Manuais" aria-pressed="false">Manuais</button>
                    <button class="pill" type="button" data-categoria="Sociais" aria-pressed="false">Sociais</button>
                    <button class="pill" type="button" data-categoria="Intelectuais" aria-pressed="false">Intelectuais</button>
                </div>
            </div>

            <div class="resultado-cabecalho">
                <h2>Locais encontrados</h2>
                <span id="total-locais">Carregando...</span>
            </div>
            <div class="grade-locais" id="grade-locais" aria-live="polite"></div>
        </div>
    </section>
<?php require 'includes/rodape.php'; ?>
