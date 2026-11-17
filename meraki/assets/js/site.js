document.addEventListener('DOMContentLoaded', function () {
    var botaoMenu = document.querySelector('.botao-menu');
    var menu = document.querySelector('.menu-principal');

    if (botaoMenu && menu) {
        botaoMenu.addEventListener('click', function () {
            var aberto = menu.classList.toggle('aberto');
            botaoMenu.setAttribute('aria-expanded', aberto ? 'true' : 'false');
            document.body.classList.toggle('menu-aberto', aberto);
        });

        menu.querySelectorAll('a').forEach(function (link) {
            link.addEventListener('click', function () {
                menu.classList.remove('aberto');
                botaoMenu.setAttribute('aria-expanded', 'false');
                document.body.classList.remove('menu-aberto');
            });
        });
    }

    iniciarLocais();
    iniciarFavoritos();
    iniciarLocal();
});

function iniciarLocais() {
    var grade = document.getElementById('grade-locais');

    if (!grade) {
        return;
    }

    var campoTexto = document.getElementById('filtro-texto');
    var botoesCategoria = document.querySelectorAll('.pill');
    var total = document.getElementById('total-locais');
    var parametros = new URLSearchParams(window.location.search);
    var categoriasAtivas = parametros.getAll('categoria').filter(function (categoria) {
        return categoria !== '';
    });
    var locais = [];

    function escapar(texto) {
        var elemento = document.createElement('div');
        elemento.textContent = texto || '';
        return elemento.innerHTML;
    }

    function normalizar(texto) {
        return (texto || '').normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();
    }

    function renderizar() {
        var busca = normalizar(campoTexto.value.trim());
        var filtrados = locais.filter(function (local) {
            var textoLocal = normalizar([
                local.nome,
                local.endereco,
                local.tipo_atividade,
                local.descricao,
                local.categorias.join(' ')
            ].join(' '));
            var combinaTexto = !busca || textoLocal.indexOf(busca) !== -1;
            var combinaCategoria = !categoriasAtivas.length || categoriasAtivas.some(function (categoria) {
                return local.categorias.indexOf(categoria) !== -1;
            });
            return combinaTexto && combinaCategoria;
        });

        total.textContent = filtrados.length + (filtrados.length === 1 ? ' local' : ' locais');

        if (!filtrados.length) {
            grade.innerHTML = '<div class="estado-vazio"><span class="icone-categoria">search</span><h2>Nenhum local encontrado</h2><p>Tente outra palavra ou selecione uma categoria diferente.</p></div>';
            return;
        }

        grade.innerHTML = filtrados.map(function (local) {
            var estiloFoto = local.foto ? ' style="background-image: url(\'' + escapar(local.foto) + '\')"' : '';
            var classeFoto = local.foto ? '' : ' sem-foto';
            var categorias = local.categorias.length ? local.categorias.join(' • ') : 'Lugar especial';
            var horario = local.horario_de_funcionamento ? '<p><span class="icone-cartao-local">schedule</span> ' + escapar(local.horario_de_funcionamento) + '</p>' : '';

            return '<a class="cartao-local" href="local.php?id=' + local.idespaco + '">' +
                '<div class="foto-local' + classeFoto + '"' + estiloFoto + '>' +
                    (local.foto ? '' : '<span>Meraki</span>') +
                    '<button class="botao-favorito" data-id="' + local.idespaco + '" aria-label="Adicionar aos favoritos">&#9825</button>' +
                '</div>' +
                '<div class="conteudo-local">' +
                    '<span class="categorias-local">' + escapar(categorias) + '</span>' +
                    '<h2>' + escapar(local.nome) + '</h2>' +
                    '<p>&#8226 ' + escapar(local.endereco) + '</p>' +
                    horario + 
                '</div>' +
            '</a>';
        }).join('');
    }

    function atualizarBotoesCategoria() {
        botoesCategoria.forEach(function (botao) {
            var categoria = botao.dataset.categoria;
            var ativo = categoria === '' ? categoriasAtivas.length === 0 : categoriasAtivas.indexOf(categoria) !== -1;
            botao.classList.toggle('ativo', ativo);
            botao.setAttribute('aria-pressed', ativo ? 'true' : 'false');
        });
    }

    botoesCategoria.forEach(function (botao) {
        botao.addEventListener('click', function () {
            var categoria = botao.dataset.categoria;

            if (categoria === '') {
                categoriasAtivas = [];
            } else if (categoriasAtivas.indexOf(categoria) !== -1) {
                categoriasAtivas = categoriasAtivas.filter(function (item) {
                    return item !== categoria;
                });
            } else {
                categoriasAtivas.push(categoria);
            }

            atualizarBotoesCategoria();
            renderizar();
        });
    });

    atualizarBotoesCategoria();

    campoTexto.addEventListener('input', renderizar);

    fetch('api/locais.php')
        .then(function (resposta) {
            if (!resposta.ok) {
                throw new Error('Falha ao carregar');
            }
            return resposta.json();
        })
        .then(function (dados) {
            locais = Array.isArray(dados) ? dados : [];
            renderizar();
        })
        .catch(function () {
            total.textContent = 'Indisponível';
            grade.innerHTML = '<div class="estado-vazio"><span>!</span><h2>Não foi possível carregar os locais</h2><p>Verifique a conexão com o banco de dados e tente novamente.</p></div>';
        });
}

function iniciarFavoritos() {
    document.addEventListener('click', function (evento) {
        var botao = evento.target.closest('.botao-favorito');
       
        if (!botao) {
        return;
    }

    evento.preventDefault();
    evento.stopPropagation();

        fetch('favorito.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                idespaco: Number(botao.dataset.id)
            })
        })
            .then(function (resposta) {
                if (resposta.status === 401) {
                    window.location.href = 'login.php';
                    throw new Error('Login necessário');
                }
                return resposta.json();
            })
            .then(function (dados) {
                botao.classList.toggle('ativo', dados.favorito);
                botao.innerHTML = dados.favorito ? '&#9829' : '&#9825;';
                botao.setAttribute('aria-label', dados.favorito ? 'Remover dos favoritos' : 'Adicionar aos favoritos');

                if (window.location.pathname.indexOf('favoritos.php') !== -1 && !dados.favorito) {
                    botao.closest('.cartao-local').remove();
                }
            })
            .catch(function (erro) {
                if (erro.message !== 'Login necessário') {
                    window.alert('Não foi possível alterar o favorito.');
                }
            });
    });
}


function iniciarLocal() {
    var container = document.getElementById('detalhe-local');
    if (!container) {
        return;
    }

    function escaparLocal(texto) {
        var elemento = document.createElement('div');
        elemento.textContent = texto || '';
        return elemento.innerHTML;
    }

    var parametros = new URLSearchParams(window.location.search);
    var id = parametros.get('id');

    fetch('api/local.php?id=' + id)
        .then(function (resposta) {
            if (!resposta.ok) {
                throw new Error('Falha ao carregar');
            }
            return resposta.json();
        })
                .then(function (local) {
            var estiloFoto = local.foto ? ' style="background-image: url(\'' + escaparLocal(local.foto) + '\')"' : '';
            var classeFoto = local.foto ? '' : ' sem-foto';
            var categorias = local.categorias.length ? local.categorias.join(' • ') : 'Lugar especial';
            var ordemDias = ['Domingo', 'Segunda-feira', 'Terça-feira', 'Quarta-feira', 'Quinta-feira', 'Sexta-feira', 'Sábado'];
            var horarios = local.horarios.length
                ? local.horarios.slice().sort(function (a, b) {
                    return ordemDias.indexOf(a.dia.trim()) - ordemDias.indexOf(b.dia.trim());
                }).map(function (h) {
                    return escaparLocal(h.dia.trim()) + ': ' + escaparLocal(h.hora_abertura) + ' às ' + escaparLocal(h.hora_fechamento);
                }).join('<br>')
                : 'Não há informações sobre os horários';
            var acessibilidade = local.acessibilidade ? escaparLocal(local.acessibilidade) : 'Não há informações sobre a acessibilidade';
            var faixasEtarias = local.faixas_etarias.length ? local.faixas_etarias.map(escaparLocal).join(', ') : 'Não há informações sobre a faixa etária';
            var valorPagamento = local.forma_pagamento ? escaparLocal(local.forma_pagamento) : 'Não há informações sobre a forma de pagamento';
            var site = local.link_contato ? '<a href="' + escaparLocal(local.link_contato) + '" target="_blank" rel="noopener noreferrer">' + escaparLocal(local.link_contato) + '</a>' : 'Não há informações sobre o site';
            var telefone = local.telefone ? '<a href="tel:' + escaparLocal(local.telefone) + '">' + escaparLocal(local.telefone) + '</a>' : 'Não há informações sobre o telefone';
            var linkMapa = 'https://www.google.com/maps/search/?api=1&query=' + encodeURIComponent(local.endereco);

            container.innerHTML =
                '<div class="hero-local' + classeFoto + '"' + estiloFoto + '>' +
                    (local.foto ? '' : '<span>Meraki</span>') +
                    '<span class="badge-categoria">' + escaparLocal(categorias) + '</span>' +
                '</div>' +
                '<div class="local-corpo">' +
                    '<div class="local-principal">' +
                        '<h1>' + escaparLocal(local.nome) + '</h1>' +
                        '<p class="local-endereco">&#8226; <a href="' + linkMapa + '" target="_blank" rel="noopener noreferrer">' + escaparLocal(local.endereco) + '</a></p>' +
                        (local.descricao ? '<p class="local-descricao">' + escaparLocal(local.descricao) + '</p>' : '') +
                        (local.tipo_atividade ? '<div class="local-destaque"><strong>Tipo de atividade</strong><p>' + escaparLocal(local.tipo_atividade) + '</p></div>' : '') +
                    '</div>' +
                    '<aside class="local-lateral">' +
                        '<div class="cartao-info tom-amarelo">' +
                            '<h3>Horário de funcionamento</h3>' +
                            '<p>' + horarios + '</p>' +
                        '</div>' +
                        '<div class="cartao-info tom-amarelo">' +
                            '<h3>Acessibilidade</h3>' +
                            '<p>' + acessibilidade + '</p>' +
                        '</div>' +
                        '<div class="cartao-info tom-amarelo">' +
                            '<h3>Faixa etária</h3>' +
                            '<p>' + faixasEtarias + '</p>' +
                        '</div>' +
                        '<div class="cartao-info tom-amarelo">' +
                            '<h3>Forma de pagamento</h3>' +
                            '<p>' + valorPagamento + '</p>' +
                        '</div>' +
                        '<div class="cartao-info tom-amarelo">' +
                            '<h3>Site</h3>' +
                            '<p>' + site + '</p>' +
                        '</div>' +
                        '<div class="cartao-info tom-amarelo">' +
                            '<h3>Telefone</h3>' +
                            '<p>' + telefone + '</p>' +
                        '</div>' +
                    '</aside>' +
                '</div>';
        })
            
        .catch(function () {
            container.innerHTML = '<p>Não foi possível carregar este local.</p>';
        });
}