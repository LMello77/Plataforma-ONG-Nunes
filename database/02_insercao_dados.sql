-- ARQUIVO: 02_insercao_dados.sql
-- DESCRIÇÃO: Povoando o Banco de Dados com Dados Fictícios (DML - INSERT)

-- 1. Inserindo CATEGORIAS
INSERT INTO CATEGORIA (nome, descricao) VALUES 
('Educação', 'Projetos voltados para ensino e reforço escolar'),
('Saúde', 'Ações de saúde básica e prevenção'),
('Alimentação', 'Distribuição de cestas e refeições');

-- 2. Inserindo USUARIOS (Admin, Voluntários e Doadores)
INSERT INTO USUARIO (nome, email, senha, cpf, telefone, tipo_usuario) VALUES 
('Lucas Nunes', 'lucas@admin.com', 'hash123', '111.111.111-11', '(11) 99999-0001', 'Admin'),
('Maria Silva', 'maria@email.com', 'senha123', '222.222.222-22', '(11) 98888-1234', 'Voluntario'),
('João Souza', 'joao@email.com', 'senha456', '333.333.333-33', '(11) 97777-5678', 'Doador'),
('Ana Clara', 'ana@email.com', 'senha789', '444.444.444-44', '(21) 96666-4321', 'Voluntario'),
('Roberto Carlos', 'roberto@email.com', 'senha321', '555.555.555-55', '(31) 95555-8765', 'Doador');

-- 3. Inserindo CAMPANHAS
INSERT INTO CAMPANHA (nome, meta_valor, data_limite) VALUES 
('Natal Sem Fome', 50000.00, '2025-12-20'),
('Volta às Aulas Solidária', 15000.00, '2026-02-10');

-- 4. Inserindo PROJETOS
INSERT INTO PROJETO (titulo, descricao, data_inicio, data_fim, vagas_totais, id_categoria) VALUES 
('Reforço Escolar 2025', 'Aulas de matemática para crianças.', '2025-03-01', '2025-11-30', 10, 1),
('Sopa Solidária', 'Distribuição de sopa no centro.', '2025-06-01', '2025-06-01', 20, 3);

-- 5. Inserindo INSCRICOES
INSERT INTO INSCRICAO (id_usuario, id_projeto, status) VALUES 
(2, 1, 'Confirmado'), -- Maria no Reforço Escolar
(4, 1, 'Pendente'),   -- Ana no Reforço Escolar
(2, 2, 'Confirmado'); -- Maria na Sopa Solidária

-- 6. Inserindo DOACOES
INSERT INTO DOACAO (valor, id_usuario, id_campanha, status) VALUES 
(150.00, 3, 1, 'Pago'),  -- João doou para o Natal
(500.00, 5, 1, 'Pago'),  -- Roberto doou para o Natal
(50.00, 3, 2, 'Pago');   -- João doou para Volta às Aulas