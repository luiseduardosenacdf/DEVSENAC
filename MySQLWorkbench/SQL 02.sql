CREATE DATABASE biblioteca01;

USE biblioteca01;

CREATE TABLE livro (
    id INT PRIMARY KEY,
    titulo VARCHAR(100),
    autor VARCHAR(100),
    ano_publicacao YEAR
);

CREATE TABLE leitores (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    data_cadastro DATE
);

INSERT INTO livro (id, titulo, autor, ano_publicacao)
VALUES 
    (1234567, 'O Ouro De Mefisto', 'Eric Frattini', 2012),
    (123456, 'O Código Da Vinci', 'Dan Brown', 2003),
    (12345, 'Eu Vou Te Encontrar', 'Harlan Coben', 2024);

INSERT INTO leitores (id, nome, email, data_cadastro)
VALUES 
    (1, 'Luis Eduardo', 'luiseduardosousa1993@gmail.com', '2025-01-10'),
    (2, 'Luis Eduardo', 'luiseduardosousa1993@gmail.com', '2025-01-10'),
    (3, 'Luis Eduardo', 'luiseduardosousa1993@gmail.com', '2025-01-10');

SELECT * FROM livro;

SELECT * FROM leitores;
