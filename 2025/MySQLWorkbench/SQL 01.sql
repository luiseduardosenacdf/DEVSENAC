CREATE DATABASE escola;

USE escola;

CREATE TABLE alunos(
		nome VARCHAR(50),
        matricula INT,
        data_nascimento DATE,
        cpf CHAR(15),
        telefone VARCHAR(19)
);
CREATE TABLE curso(
        descrição VARCHAR(50),
        carga_horaria INT,
        segmento VARCHAR(20),
        data_inicio DATE,
        data_termino DATE
);
CREATE TABLE professor(
		nome VARCHAR(50),
		formacao VARCHAR(50)
);
        
INSERT INTO alunos(nome,matricula,data_nascimento,cpf,telefone)
VALUES("Luis Eduardo",21341234,"1993-05-03","048.754.891-45","61 99850-0305");

SELECT * FROM alunos;
        