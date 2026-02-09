-- Criar o banco de dados
CREATE DATABASE api_usuarios;
USE api_usuarios;

-- Criar tabela de usuários
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE
);

SELECT * FROM usuarios