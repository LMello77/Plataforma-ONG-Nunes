/*
 * ARQUIVO: main.js
 * DESCRIÇÃO: Controla a interatividade do menu hambúrguer (Requisito 3).
 */

// Seleciona os elementos do DOM
const btnMobile = document.querySelector('.menu-hamburguer');
const menuLista = document.querySelector('#menu-lista');

// Função para 'toggle' (alternar) o menu
function toggleMenu(event) {
    // Evita o comportamento padrão se for um link (embora seja um button)
    if (event.type === 'touchstart') event.preventDefault();
    
    // Adiciona ou remove a classe 'ativo' da lista do menu
    menuLista.classList.toggle('ativo');
    
    // Verifica se o menu está ativo para atualizar o ARIA (Acessibilidade)
    const menuAtivo = menuLista.classList.contains('ativo');
    event.currentTarget.setAttribute('aria-expanded', menuAtivo);
    
    if (menuAtivo) {
        event.currentTarget.setAttribute('aria-label', 'Fechar Menu');
    } else {
        event.currentTarget.setAttribute('aria-label', 'Abrir Menu');
    }
}

// Adiciona o 'escutador' de eventos ao botão
btnMobile.addEventListener('click', toggleMenu);
btnMobile.addEventListener('touchstart', toggleMenu); // Adiciona suporte para toque