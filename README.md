# Sistema de Gerenciamento de Biblioteca (PostgreSQL)

Este repositório contém o esquema de banco de dados para uma biblioteca, incluindo validações de CPF, controle de empréstimos via triggers e relatórios automatizados através de views.

## 🚀 Funcionalidades
- **Validação de CPF**: Apenas números e exatamente 11 dígitos.
- **Regra de Negócio**: Um livro não pode ser emprestado se ainda não foi devolvido.
- **Relatórios**: Views para livros atrasados, ranking de leitura e histórico.

## 🛠️ Como rodar
1. Crie um banco de dados no PostgreSQL.
2. Execute os scripts na ordem numérica da pasta `/scripts`.
