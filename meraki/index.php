<?php
$titulo_pagina = 'Início';
require 'includes/cabecalho.php';
?>
    <section class="hero hero-inicio">
        <div class="container hero-conteudo">
            <span class="destaque-pequeno">Descobertas para toda a família</span>
            <h1>Viva o tempo livre<br>com <em>mais significado.</em></h1>
            <p>Encontre lugares acolhedores para brincar, aprender, explorar e criar memórias que ficam.</p>
            <a class="botao" href="#categorias">Explorar possibilidades</a>
        </div>
        <div class="formas-hero" aria-hidden="true">
            <span class="forma forma-um"></span>
            <span class="forma forma-dois"></span>
            <span class="forma forma-tres">&#9829;</span>
        </div>
    </section>

    <section class="secao categorias" id="categorias">
        <div class="container">
            <div class="titulo-secao">
                <span>Escolha seu próximo momento</span>
                <h2>O que vocês querem viver hoje?</h2>
                <p>Clique em uma categoria e encontre locais preparados para receber você.</p>
            </div>

            <div class="grade-categorias">
                <a class="cartao-categoria" href="locais.php?categoria=Físicas">
                    <span class="icone-categoria">sports_soccer</span>
                    <h3>Físicas</h3>
                    <p>Atividades para mexer o corpo, brincar e praticar esportes.</p>
                    <span class="link-cartao">Ver locais &#8594;</span>
                </a>
                <a class="cartao-categoria" href="locais.php?categoria=Artísticas">
                    <span class="icone-categoria">palette</span>
                    <h3>Artísticas</h3>
                    <p>Atividades para criar, desenhar, pintar, cantar e expressar a imaginação.</p>
                    <span class="link-cartao">Ver locais &#8594;</span>
                </a>
                <a class="cartao-categoria" href="locais.php?categoria=Manuais">
                    <span class="icone-categoria">build</span>
                    <h3>Manuais</h3>
                    <p>Atividades para construir, montar, criar e aprender fazendo.</p>
                    <span class="link-cartao">Ver locais &#8594;</span>
                </a>
                <a class="cartao-categoria" href="locais.php?categoria=Sociais">
                    <span class="icone-categoria">diversity_4</span>
                    <h3>Sociais</h3>
                    <p>Atividades para fazer amigos, trabalhar em equipe e estar com a comunidade.</p>
                    <span class="link-cartao">Ver locais &#8594;</span>
                </a>
                <a class="cartao-categoria" href="locais.php?categoria=Intelectuais">
                    <span class="icone-categoria">neurology</span>
                    <h3>Intelectuais</h3>
                    <p>Atividades para aprender coisas novas, descobrir informações e conhecer o mundo.</p>
                    <span class="link-cartao">Ver locais &#8594;</span>
                </a>
            </div>
        </div>
    </section>

    <section class="secao sobre" id="sobre">
        <div class="container grade-sobre">
            <div class="ilustracao-sobre" aria-hidden="true">
                  <span>&#9829;</span>
            </div>
            <div>
                <span class="destaque-pequeno">Sobre a Meraki</span>
                <h2>Mais do que encontrar um lugar.</h2>
                <p>Meraki (μεράκι) é uma palavra grega que não tem tradução exata: significa fazer algo com amor, alma e dedicação, colocar um pouco de si em cada momento. É assim que queremos que você viva o tempo livre com sua família: com atenção, cuidado e presença, aproveitando cada instante para criar memórias que ficam.</p>
                <p>O lazer é essencial para a infância: desenvolve habilidades, promove bem-estar e cria oportunidades de convivência longe das obrigações da rotina. A Meraki nasceu para facilitar esse encontro. Reunimos espaços e atividades para você escolher com tranquilidade e aproveitar melhor cada momento.</p>
                <p>Somos a Larissa e a Nicoly, estudantes de Informática do IFPR, Campus Pinhais, e o Meraki é o nosso Trabalho de Conclusão de Curso. Somos de Pinhais e transformamos o nosso olhar sobre a cidade em projeto, com a orientação dos professores Eduardo Tieppo e Mariana Ciminelli Maranho.</p>
                <p>Mapeamos 33 espaços de lazer infantil, antes espalhados pela internet, e reunimos tudo aqui, para toda família encontrar aonde ir.</p>
                <a class="botao botao-contorno" href="locais.php">Conhecer os locais</a>
            </div>
        </div>
    </section>
<?php require 'includes/rodape.php'; ?>
