/*
 * ARQUIVO: validation.js
 * DESCRIÇÃO: Módulo de validação de formulário (Requisito da Entrega III).
 * Implementa verificação de consistência (CPF) e avisos ao usuário.
 */

// 1. Seleciona todos os campos que queremos validar
const camposParaValidar = document.querySelectorAll('.form-cadastro [required]');

// 2. Adiciona um "escutador" para cada campo (validação em tempo real)
camposParaValidar.forEach((campo) => {
    // Escuta o evento 'blur' (quando o usuário sai do campo)
    campo.addEventListener("blur", () => checaCampo(campo));
    
    // Escuta o evento 'invalid' (nativo do HTML5, para customizar)
    campo.addEventListener("invalid", (event) => {
        // Impede o "balão" de erro feio do navegador
        event.preventDefault(); 
        checaCampo(campo); // Roda nossa validação
    });
});

// 3. Função principal que chama a validação específica
function checaCampo(campo) {
    let mensagemErro = "";
    campo.setCustomValidity(""); // Limpa qualquer erro customizado anterior

    // 3.1. Validação de consistência de dados (JavaScript Avançado)
    if (campo.name === "cpf" && campo.value.length >= 14) {
        if (!validaCPF(campo.value)) {
            mensagemErro = "Este CPF não é válido.";
        }
    }
    
    // 3.2. Verificação de erros nativos do HTML5 (required, type, pattern, minlength)
    // O 'campo.validity' é um objeto nativo que nos diz o status do campo
    
    if (campo.validity.valueMissing) {
        mensagemErro = "Este campo é obrigatório.";
    } 
    else if (campo.validity.typeMismatch) {
        // Ex: type="email" e o usuário digita "lucas"
        mensagemErro = "Por favor, preencha um e-mail válido.";
    } 
    else if (campo.validity.tooShort) {
        // Ex: minlength="3" e o usuário digita "Oi"
        mensagemErro = `Este campo deve ter no mínimo ${campo.minLength} caracteres.`;
    }
    else if (campo.validity.patternMismatch) {
        // Ex: o pattern do CPF ou Telefone não bateu
        // Usamos o 'title' do HTML para uma mensagem amigável
        mensagemErro = campo.title || "O formato preenchido está incorreto.";
    }

    // 4. Manipulação do DOM: Exibir o aviso ao usuário
    const campoPai = campo.parentNode; // O .form-campo
    const avisoSpan = campoPai.querySelector(".aviso-erro");

    if (mensagemErro) {
        // Se tem erro, mostra a mensagem e adiciona a classe 'invalido'
        campoPai.classList.add("invalido");
        avisoSpan.textContent = `❌ ${mensagemErro}`;
        campo.setCustomValidity(mensagemErro); // Informa ao navegador que é inválido
    } else {
        // Se não tem erro, limpa a mensagem e a classe
        campoPai.classList.remove("invalido");
        avisoSpan.textContent = "";
    }
}


/*
 * ===================================================================
 * FUNÇÃO DE CONSISTÊNCIA DE DADOS (AVANÇADO): Validador de CPF
 * Esta função verifica se os dígitos verificadores do CPF são válidos.
 * ===================================================================
 */
function validaCPF(cpf) {
    // Remove os caracteres de formatação (., -)
    const cpfLimpo = cpf.replace(/[.\-]/g, "");

    // 1. Verifica se todos os dígitos são iguais (ex: 111.111.111-11)
    if (/^(\d)\1{10}$/.test(cpfLimpo)) {
        return false;
    }

    // 2. Lógica de cálculo dos dígitos verificadores
    let soma = 0;
    let resto;

    // Calcula o primeiro dígito
    for (let i = 1; i <= 9; i++) {
        soma += parseInt(cpfLimpo.substring(i - 1, i)) * (11 - i);
    }
    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) resto = 0;
    if (resto !== parseInt(cpfLimpo.substring(9, 10))) {
        return false;
    }

    // Calcula o segundo dígito
    soma = 0;
    for (let i = 1; i <= 10; i++) {
        soma += parseInt(cpfLimpo.substring(i - 1, i)) * (12 - i);
    }
    resto = (soma * 10) % 11;
    if (resto === 10 || resto === 11) resto = 0;
    if (resto !== parseInt(cpfLimpo.substring(10, 11))) {
        return false;
    }

    // Se passou em tudo, o CPF é válido
    return true;
}