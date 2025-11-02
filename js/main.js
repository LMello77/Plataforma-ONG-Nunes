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
/*
 * =========================================
 * LÓGICA MODO ESCURO (ENTREGA IV)
 * =========================================
 */

// 1. Seleciona os elementos
const themeToggle = document.getElementById('theme-toggle');
const htmlElement = document.documentElement; // A tag <html>

// 2. Verifica a preferência salva no localStorage
// (localStorage é o "armazenamento local" do navegador)
const currentTheme = localStorage.getItem('theme');
if (currentTheme === 'dark') {
    // Se o usuário já estava no modo escuro, aplica-o
    htmlElement.setAttribute('data-theme', 'dark');
    themeToggle.innerHTML = '🌙'; // Atualiza ícone para lua
    themeToggle.setAttribute('aria-label', 'Ativar Modo Claro');
}

// 3. Adiciona o 'escutador' de clique no botão
themeToggle.addEventListener('click', () => {
    // Pega o tema atual
    let currentTheme = htmlElement.getAttribute('data-theme');
    
    // Se o tema for 'light' (ou nulo), muda para 'dark'
    if (currentTheme === 'light' || !currentTheme) {
        htmlElement.setAttribute('data-theme', 'dark');
        localStorage.setItem('theme', 'dark'); // Salva a preferência
        themeToggle.innerHTML = '🌙'; // Muda para ícone de lua
        themeToggle.setAttribute('aria-label', 'Ativar Modo Claro');
    } else {
        // Se for 'dark', muda para 'light'
        htmlElement.setAttribute('data-theme', 'light');
        localStorage.setItem('theme', 'light'); // Salva a preferência
        themeToggle.innerHTML = '☀️'; // Muda para ícone de sol
        themeToggle.setAttribute('aria-label', 'Ativar Modo Escuro');
    }
});
