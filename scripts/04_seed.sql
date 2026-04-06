-- Inserts

-- CLIENTES
INSERT INTO cliente (nome_cliente, data_nascimento, cpf) VALUES
('Pedro Silva', '2000-05-10', '12345678901'),
('Ana Souza', '1995-08-22', '98765432100'),
('Carlos Pereira', '1988-12-03', '11122233344'),
('Juliana Lima', '2002-01-15', '55566677788');

-- AUTORES
INSERT INTO autor (nome_autor, nacionalidade) VALUES
('Machado de Assis', 'Brasileiro'),
('J.K. Rowling', 'Britânica'),
('George Orwell', 'Britânico'),
('Clarice Lispector', 'Brasileira');

-- EDITORAS
INSERT INTO editora (nome_editora, cidade, contato) VALUES
('Companhia das Letras', 'São Paulo', '11999999999'),
('Rocco', 'Rio de Janeiro', '21988888888'),
('Penguin Books', 'Londres', '000000000'),
('HarperCollins', 'Nova York', '111111111');

-- LIVROS
INSERT INTO livro (nome_livro, genero, editora_id, autor_id) VALUES
('Dom Casmurro', 'Romance', 1, 1),
('Harry Potter e a Pedra Filosofal', 'Fantasia', 2, 2),
('1984', 'Distopia', 3, 3),
('A Hora da Estrela', 'Romance', 1, 4);

-- EMPRESTIMOS
INSERT INTO emprestimo (cliente_id, livro_id, data_emprestimo, data_devolucao) VALUES
(1, 1, '2026-03-01', '2026-03-10'),
(2, 2, '2026-03-15', NULL),
(3, 3, '2026-02-20', '2026-03-05'),
(4, 4, '2026-03-25', NULL);