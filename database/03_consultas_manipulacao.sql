-- ARQUIVO: 03_consultas_manipulacao.sql
-- DESCRIÇÃO: Script de Manipulação de Dados (SELECT, UPDATE, DELETE)

-- =============================================================
-- PARTE 1: CONSULTAS (SELECT) - Requisito: Consultas com JOIN e Agregação
-- =============================================================

-- 1. Listar todos os usuários que são Voluntários, ordenados por nome
SELECT * FROM USUARIO 
WHERE tipo_usuario = 'Voluntario' 
ORDER BY nome ASC;

-- 2. Listar Projetos e suas Categorias (JOIN)
SELECT P.titulo, P.data_inicio, C.nome AS categoria
FROM PROJETO P
INNER JOIN CATEGORIA C ON P.id_categoria = C.id_categoria;

-- 3. Calcular o total arrecadado por Campanha (Agregação + JOIN)
SELECT C.nome, SUM(D.valor) AS total_arrecadado
FROM CAMPANHA C
JOIN DOACAO D ON C.id_campanha = D.id_campanha
GROUP BY C.nome;

-- 4. Mostrar as últimas 5 doações com nome do doador (LIMIT + JOIN)
SELECT U.nome AS doador, D.valor, D.data_doacao
FROM DOACAO D
JOIN USUARIO U ON D.id_usuario = U.id_usuario
ORDER BY D.data_doacao DESC
LIMIT 5;


-- =============================================================
-- PARTE 2: ATUALIZAÇÕES (UPDATE) - Requisito: 3 comandos
-- =============================================================

-- 1. Atualizar o telefone de um usuário específico
UPDATE USUARIO 
SET telefone = '(11) 90000-9999' 
WHERE email = 'maria@email.com';

-- 2. Confirmar a inscrição da Ana Clara que estava 'Pendente'
UPDATE INSCRICAO 
SET status = 'Confirmado' 
WHERE id_usuario = 4 AND id_projeto = 1;

-- 3. Aumentar a meta da campanha de Natal em 10%
UPDATE CAMPANHA 
SET meta_valor = meta_valor * 1.10 
WHERE nome = 'Natal Sem Fome';


-- =============================================================
-- PARTE 3: EXCLUSÕES (DELETE) - Requisito: 3 comandos
-- =============================================================

-- 1. Deletar uma inscrição específica (ex: ID 2)
DELETE FROM INSCRICAO 
WHERE id_inscricao = 2;

-- 2. Deletar doações com valor incorreto (exemplo de limpeza de dados)
DELETE FROM DOACAO 
WHERE valor <= 0;

-- 3. Deletar uma categoria que não está sendo usada
-- Nota: Usamos uma subquery para garantir que não apagaremos categorias em uso
DELETE FROM CATEGORIA 
WHERE nome = 'Saúde' AND id_categoria NOT IN (SELECT DISTINCT id_categoria FROM PROJETO);