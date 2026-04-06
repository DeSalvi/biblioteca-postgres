-- Views Uteis

-- Livros atualmente emprestados
CREATE VIEW vw_livros_emprestados AS
SELECT 
    e.id_operacao,
    c.nome_cliente,
    l.nome_livro,
    e.data_emprestimo
FROM emprestimo e
JOIN cliente c ON e.cliente_id = c.cliente_id
JOIN livro l ON e.livro_id = l.livro_id
WHERE e.data_devolucao IS NULL;

-- Empréstimos em atraso (7 dias)
CREATE VIEW vw_emprestimos_atrasados AS
SELECT 
    c.nome_cliente,
    l.nome_livro,
    e.data_emprestimo,
    CURRENT_DATE - e.data_emprestimo AS dias_atraso
FROM emprestimo e
JOIN cliente c ON e.cliente_id = c.cliente_id
JOIN livro l ON e.livro_id = l.livro_id
WHERE e.data_devolucao IS NULL
AND e.data_emprestimo < CURRENT_DATE - INTERVAL '7 days';

-- Histórico completo de empréstimos
CREATE VIEW vw_historico_emprestimos AS
SELECT 
    c.cliente_nom,
    l.nome_livro,
    e.data_emprestimo,
    e.data_devolucao
FROM emprestimo e
JOIN cliente c ON e.cliente_id = c.cliente_id
JOIN livro l ON e.livro_id = l.livro_id;

-- Ranking de livros mais emprestados
CREATE VIEW vw_ranking_livros AS
SELECT 
    l.nome_livro,
    COUNT(e.id_operacao) AS total_emprestimos
FROM livro l
JOIN emprestimo e ON l.livro_id = e.livro_id
GROUP BY l.nome_livro
ORDER BY total_emprestimos DESC;

-- Ranking de clientes
CREATE VIEW vw_ranking_clientes AS
SELECT 
    c.nome_cliente,
    COUNT(e.id_operacao) AS total_emprestimos
FROM cliente c
JOIN emprestimo e ON c.cliente_id = e.cliente_id
GROUP BY c.nome_cliente
ORDER BY total_emprestimos DESC;

-- Livros com autor e editora
CREATE VIEW vw_livros_detalhado AS
SELECT 
    l.nome_livro,
    l.genero,
    a.nome_autor,
    ed.nome_editora
FROM livro l
JOIN autor a ON l.autor_id = a.autor_id
JOIN editora ed ON l.editora_id = ed.editora_id;
