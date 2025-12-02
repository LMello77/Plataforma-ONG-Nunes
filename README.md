# Plataforma ONG Impacto Social (Projeto ADS)

Projeto acadêmico desenvolvido para a disciplina de Desenvolvimento Front-End Para Web, do curso de Análise e Desenvolvimento de Sistemas.

Este repositório documenta a evolução de um website estático para uma plataforma interativa, cobrindo os fundamentos de HTML5, CSS3 avançado e JavaScript modular.

**Link do Projeto (GitHub Pages):** [https://LMeLLo77.github.io/Plataforma-ONG-Nunes/](https://LMeLLo77.github.io/Plataforma-ONG-Nunes/)
*(Nota: O deploy via GitHub Pages será configurado na Etapa IV)*

---

## 🚀 Tecnologias Utilizadas

* **HTML5:** Estruturação semântica, formulários com validação nativa e acessibilidade (`aria-`).
* **CSS3:** Design System (Variáveis CSS), Layouts Responsivos (Mobile-First), CSS Grid (12 colunas) e Flexbox.
* **JavaScript (ES6+):** Manipulação do DOM, Eventos, Módulos (Menu e Validação) e validação de consistência de dados (CPF).
* **Git & GitHub:** Controle de versão, Issues, Branching (GitFlow simulado) e Pull Requests.

---

## 📋 Entregas do Módulo

Este projeto foi construído de forma incremental, seguindo as 4 entregas da disciplina:

### 1. Entrega I: Fundamentos e Estruturação (HTML)
* Criação da estrutura de 3 páginas (`index.html`, `projetos.html`, `cadastro.html`).
* Implementação de estrutura 100% semântica (`<header>`, `<main>`, `<section>`, `<nav>`).
* Criação do formulário complexo com tipos de input HTML5 e validação nativa (`pattern`).
* **Commit de referência:** `[Link do seu commit da Entrega I]`

### 2. Entrega II: Estilização e Leiautes (CSS)
* Criação de um **Sistema de Design** modular (`global.css`) com variáveis (cores, tipografia, espaçamento).
* Implementação de **Layout Responsivo** (`layout.css`) com 5 *breakpoints*, usando CSS Grid e Flexbox.
* Criação de um **Menu Hambúrguer** interativo (Mobile-First).
* Estilização de **Componentes** (`components.css`) como Cards, Botões (com estados) e Alertas.
* **Commit de referência:** `[Link do seu commit da Entrega II]`

### 3. Entrega III: Interatividade (JavaScript)
* Criação de um módulo de validação de formulário (`validation.js`) separado do `main.js`.
* Implementação de **verificação de consistência de dados** (Validador de CPF em JS).
* Manipulação do DOM para exibir **avisos de erro** em tempo real, complementando a validação HTML5.
* **Commit de referência:** `[Link do seu commit da Entrega III]`

### 4. Entrega IV: Profissionalização (Git, WCAG, Deploy)
* **Acessibilidade (WCAG):** O projeto foi desenvolvido com semântica e atributos ARIA. Esta entrega adiciona um seletor de **Modo Escuro (High-Contrast)**.
* **GitFlow:** O fluxo profissional foi simulado usando `Issues` para rastreamento, `feature-branches` para desenvolvimento (ex: `feature/dark-mode`) e `Pull Requests` para revisão de código.
* **Documentação:** Criação deste `README.md`.
* **Deploy:** Configuração do GitHub Pages para publicação contínua.

---

## ⚙️ Otimização e Próximos Passos
Para uma versão de produção real, os próximos passos (fora do escopo acadêmico) incluiriam:
* **Otimização de Build:** Utilização de ferramentas (Vite, Webpack) para minificação de arquivos CSS/JS/HTML.
* **Otimização de Imagens:** Compressão de imagens e uso de formatos modernos (WebP).
* **Backend:** Conexão com um backend e banco de dados reais para o formulário de cadastro.


---

## 🗄️ Módulo de Banco de Dados

Esta seção contém os scripts SQL desenvolvidos para a disciplina de Modelagem de Banco de Dados, integrando o Back-End ao projeto da ONG.

### Estrutura dos Arquivos (`/database`)
* **`01_criacao_tabelas.sql`**: Script DDL responsável por criar o banco de dados `ong_impacto_social` e suas 6 tabelas normalizadas (3FN), definindo Chaves Primárias e Estrangeiras.
* **`02_insercao_dados.sql`**: Script DML contendo comandos `INSERT` para povoar o banco com dados fictícios de teste (Categorias, Usuários, Projetos, Campanhas, etc.).
* **`03_consultas_manipulacao.sql`**: Script DML/DQL contendo:
    * Consultas complexas com `JOIN`, `GROUP BY` e `ORDER BY`.
    * Comandos de atualização de dados (`UPDATE`).
    * Comandos de exclusão segura (`DELETE`).

### Como Executar
1. Importe o arquivo `01_criacao_tabelas.sql` no seu SGBD (MySQL Workbench, phpMyAdmin, etc) para criar a estrutura.
2. Execute o arquivo `02_insercao_dados.sql` para carregar os dados iniciais.
3. Utilize os comandos do arquivo `03_consultas_manipulacao.sql` para testar as operações do sistema.
