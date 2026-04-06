-- Tabelas de entidades

-- Tabela de clientes
CREATE TABLE cliente(
	cliente_id SERIAL PRIMARY KEY,
	nome_cliente VARCHAR(255) NOT NULL,
	data_cadastro DATE DEFAULT CURRENT_DATE,
	data_nascimento DATE,
	cpf VARCHAR(11) UNIQUE,

	-- Constraint que garante apenas 11 dígitos numéricos
    CONSTRAINT cpf_apenas_numeros CHECK (cpf ~ '^[0-9]{11}$')
);

-- Tabela de autor
CREATE TABLE autor (
	autor_id SERIAL PRIMARY KEY,
	nome_autor VARCHAR(255) NOT NULL,
	nacionalidade VARCHAR(50)
);

-- Tabela de editoras
CREATE TABLE editora (
    editora_id SERIAL PRIMARY KEY,
    nome_editora VARCHAR(255) UNIQUE NOT NULL,
    cidade VARCHAR(100),
    contato VARCHAR(50)
);

-- Tabela de livros
CREATE TABLE livro (
	livro_id SERIAL PRIMARY KEY,
	nome_livro VARCHAR(255) UNIQUE NOT NULL,
	genero VARCHAR (50),
	editora_id INT NOT NULL,
	autor_id INT NOT NULL,

	FOREIGN KEY (editora_id) REFERENCES editora (editora_id),
	FOREIGN KEY (autor_id) REFERENCES autor (autor_id)
);

-- Tabelas relacionais

-- Tabela de emprestimo
CREATE TABLE emprestimo (
	id_operacao SERIAL PRIMARY KEY,
	cliente_id INT NOT NULL,
	livro_id INT NOT NULL,
	data_emprestimo DATE NOT NULL,
	data_devolucao DATE,

	FOREIGN KEY (cliente_id) REFERENCES cliente(cliente_id),
	FOREIGN KEY (livro_id) REFERENCES livro(livro_id)
);
