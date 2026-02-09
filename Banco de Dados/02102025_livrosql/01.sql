-- criar banco
CREATE DATABASE livrosql
  DEFAULT CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE livrosql;

-- =============================
-- TABELAS BASE
-- =============================

-- CLIENTES
CREATE TABLE comclien (
  n_numeclien INT NOT NULL AUTO_INCREMENT,
  c_codiclien VARCHAR(10),
  c_nomeclien VARCHAR(100) NOT NULL,
  c_razaclien VARCHAR(100),
  d_dataclien DATE,
  c_cnpjclien VARCHAR(20),
  c_foneclien VARCHAR(20),
  c_cidaclien VARCHAR(50),
  c_estaclien VARCHAR(100),
  PRIMARY KEY (n_numeclien)
) ENGINE=InnoDB;

-- FORNECEDORES
CREATE TABLE comforne (
  n_numeforne INT NOT NULL AUTO_INCREMENT,
  c_codiforne VARCHAR(10),
  c_nomeforne VARCHAR(100) NOT NULL,
  c_razaforne VARCHAR(100),
  c_foneforne VARCHAR(20),
  PRIMARY KEY (n_numeforne)
) ENGINE=InnoDB;

-- VENDEDORES
CREATE TABLE comvende (
  n_numevende INT NOT NULL AUTO_INCREMENT,
  c_codivende VARCHAR(10),
  c_nomevende VARCHAR(100) NOT NULL,
  c_razavende VARCHAR(100),
  c_fonevende VARCHAR(20),
  n_porcvende DECIMAL(10,2),
  PRIMARY KEY (n_numevende)
) ENGINE=InnoDB;

-- PRODUTOS
CREATE TABLE comprodu (
  n_numeprodu INT NOT NULL AUTO_INCREMENT,
  c_codiprodu VARCHAR(20),
  c_descprodu VARCHAR(100) NOT NULL,
  n_valoprodu DECIMAL(10,2) NOT NULL,
  c_situprodu VARCHAR(1),
  n_numeforne INT,
  PRIMARY KEY (n_numeprodu),
  INDEX idx_comprodu_numeforne (n_numeforne),
  CONSTRAINT fk_comprodu_comforne FOREIGN KEY (n_numeforne)
    REFERENCES comforne(n_numeforne)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
) ENGINE=InnoDB;

-- =============================
-- VENDAS
-- =============================

-- VENDAS PRINCIPAIS
CREATE TABLE comvenda (
  n_numevenda INT NOT NULL AUTO_INCREMENT,
  n_numevende INT NOT NULL,
  n_numeclien INT NOT NULL,
  n_numeforne INT NOT NULL,
  n_valovenda DECIMAL(10,2) NOT NULL,
  n_porcvende DECIMAL(10,2),
  n_totavenda DECIMAL(10,2),
  d_datavenda DATE,
  PRIMARY KEY (n_numevenda),
  INDEX idx_comvenda_numevende (n_numevende),
  INDEX idx_comvenda_numeclien (n_numeclien),
  INDEX idx_comvenda_numeforne (n_numeforne),
  CONSTRAINT fk_comvenda_comforne FOREIGN KEY (n_numeforne)
    REFERENCES comforne(n_numeforne),
  CONSTRAINT fk_comvenda_comvende FOREIGN KEY (n_numevende)
    REFERENCES comvende(n_numevende),
  CONSTRAINT fk_comvenda_comclien FOREIGN KEY (n_numeclien)
    REFERENCES comclien(n_numeclien)
) ENGINE=InnoDB;

-- VENDAS (VARIAÇÃO)
CREATE TABLE comvendas (
  n_numevenda INT NOT NULL AUTO_INCREMENT,
  c_codivenda VARCHAR(10),
  n_numeclien INT NOT NULL,
  n_numeforne INT NOT NULL,
  n_numevende INT NOT NULL,
  n_valovenda DECIMAL(10,2),
  n_descvenda DECIMAL(10,2),
  n_totavenda DECIMAL(10,2),
  d_datavenda DATE,
  PRIMARY KEY (n_numevenda),
  INDEX idx_comvendas_numeclien (n_numeclien),
  INDEX idx_comvendas_numeforne (n_numeforne),
  INDEX idx_comvendas_numevende (n_numevende),
  CONSTRAINT fk_comvendas_comclien FOREIGN KEY (n_numeclien)
    REFERENCES comclien(n_numeclien),
  CONSTRAINT fk_comvendas_comforne FOREIGN KEY (n_numeforne)
    REFERENCES comforne(n_numeforne),
  CONSTRAINT fk_comvendas_comvende FOREIGN KEY (n_numevende)
    REFERENCES comvende(n_numevende)
) ENGINE=InnoDB;

-- ITENS DA VENDA
CREATE TABLE comivenda (
  n_numeivenda INT NOT NULL AUTO_INCREMENT,
  n_numevenda INT NOT NULL,
  n_numeprodu INT NOT NULL,
  n_valoivenda DECIMAL(10,2),
  n_qtdeivenda INT,
  n_descivenda DECIMAL(10,2),
  PRIMARY KEY (n_numeivenda),
  INDEX idx_comivenda_numevenda (n_numevenda),
  INDEX idx_comivenda_numeprodu (n_numeprodu),
  CONSTRAINT fk_comivenda_comvenda FOREIGN KEY (n_numevenda)
    REFERENCES comvenda(n_numevenda),
  CONSTRAINT fk_comivenda_comprodu FOREIGN KEY (n_numeprodu)
    REFERENCES comprodu(n_numeprodu)
) ENGINE=InnoDB;

-- =============================
-- DADOS DE TESTE
-- =============================

INSERT INTO comforne (c_codiforne, c_nomeforne, c_razaforne, c_foneforne)
VALUES ('F001', 'Fornecedor A', 'Razao Fornecedor A', '1111-1111');

INSERT INTO comclien (c_codiclien, c_nomeclien, c_razaclien, d_dataclien, c_cnpjclien, c_foneclien, c_cidaclien, c_estaclien)
VALUES ('C001', 'Cliente A', 'Razao Cliente A', '2025-01-01', '00.000.000/0001-00', '2222-2222', 'São Paulo', 'SP');

INSERT INTO comvende (c_codivende, c_nomevende, c_razavende, c_fonevende, n_porcvende)
VALUES ('V001', 'Vendedor A', 'Razao Vendedor', '3333-3333', 5.0);

INSERT INTO comprodu (c_codiprodu, c_descprodu, n_valoprodu, c_situprodu, n_numeforne)
VALUES ('P001', 'Produto X', 10.00, 'A', 1);

INSERT INTO comvenda (n_numevende, n_numeclien, n_numeforne, n_valovenda, n_porcvende, n_totavenda, d_datavenda)
VALUES (1, 1, 1, 100.00, 5.0, 95.00, CURDATE());

INSERT INTO comivenda (n_numevenda, n_numeprodu, n_valoivenda, n_qtdeivenda, n_descivenda)
VALUES (1, 1, 10.00, 2, 0.00);

-- =============================
-- CONSULTAS DE VERIFICAÇÃO
-- =============================

-- Listar tabelas
SHOW TABLES;

-- Estrutura resumida de clientes
DESCRIBE comclien;

-- Ver vendas e cliente associado
SELECT v.n_numevenda, c.c_nomeclien, v.n_valovenda, v.n_totavenda
FROM comvenda v
JOIN comclien c ON v.n_numeclien = c.n_numeclien;
