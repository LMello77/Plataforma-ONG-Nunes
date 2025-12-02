-- ARQUIVO: 01_criacao_tabelas.sql
-- DESCRIÇÃO: Criação do Banco e das Tabelas (DDL)

-- 1. Criação do Banco (se não existir)
CREATE DATABASE IF NOT EXISTS ong_impacto_social;
USE ong_impacto_social;

-- 2. Tabela CATEGORIA (Independente)
CREATE TABLE CATEGORIA (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(200)
);

-- 3. Tabela USUARIO (Independente)
CREATE TABLE USUARIO (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    tipo_usuario ENUM('Voluntario', 'Doador', 'Admin') NOT NULL
);

-- 4. Tabela CAMPANHA (Independente)
CREATE TABLE CAMPANHA (
    id_campanha INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    meta_valor DECIMAL(10,2) NOT NULL,
    data_limite DATE NOT NULL
);

-- 5. Tabela PROJETO (Depende de Categoria)
CREATE TABLE PROJETO (
    id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descricao TEXT,
    data_inicio DATE NOT NULL,
    data_fim DATE,
    vagas_totais INT NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

-- 6. Tabela INSCRICAO (Depende de Usuario e Projeto)
CREATE TABLE INSCRICAO (
    id_inscricao INT AUTO_INCREMENT PRIMARY KEY,
    data_inscricao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pendente', 'Confirmado', 'Cancelado') DEFAULT 'Pendente',
    id_usuario INT,
    id_projeto INT,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_projeto) REFERENCES PROJETO(id_projeto)
);

-- 7. Tabela DOACAO (Depende de Usuario e Campanha)
CREATE TABLE DOACAO (
    id_doacao INT AUTO_INCREMENT PRIMARY KEY,
    valor DECIMAL(10,2) NOT NULL,
    data_doacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Confirmado',
    id_usuario INT,
    id_campanha INT,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_campanha) REFERENCES CAMPANHA(id_campanha)
);