-- ========================================
-- CRIAÇÃO DO BANCO DE DADOS FARMÁCIA
-- ========================================
CREATE DATABASE farmacia;
USE farmacia;

-- ========================================
-- Tabela: Fornecedores
-- ========================================
CREATE TABLE Fornecedores (
    cnpj CHAR(14) PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    contato VARCHAR(50)
);

-- ========================================
-- Tabela: Medicamentos
-- ========================================
CREATE TABLE Medicamentos (
    codigo INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    principio_ativo VARCHAR(100),
    tipo VARCHAR(50), -- controlado, comum, fitoterápico, etc
    validade_med DATE,
    preco DECIMAL(10,2) NOT NULL,
    cnpj_fornecedor CHAR(14) NOT NULL,
    FOREIGN KEY (cnpj_fornecedor) REFERENCES Fornecedores(cnpj)
);

-- ========================================
-- Tabela: Estoque
-- ========================================
CREATE TABLE Estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo_medicamento INT NOT NULL,
    quantidade INT NOT NULL,
    lote VARCHAR(50),
    validade_lote DATE,
    data_entrada DATE,
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamentos(codigo)
);

-- ========================================
-- Tabela: Clientes
-- ========================================
CREATE TABLE Clientes (
    cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20)
);

-- ========================================
-- Tabela: Médicos
-- ========================================
CREATE TABLE Medicos (
    crm CHAR(10) PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    especialidade VARCHAR(50),
    contato VARCHAR(50)
);

-- ========================================
-- Tabela: Funcionários
-- ========================================
CREATE TABLE Funcionarios (
    matricula INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(50),
    turno VARCHAR(20)
);

-- ========================================
-- Tabela: Receitas Médicas
-- ========================================
CREATE TABLE Receitas_Medicas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente CHAR(11) NOT NULL,
    crm_medico CHAR(10) NOT NULL,
    medicamento INT NOT NULL,
    validade_receita DATE,
    data_emissao DATE,
    FOREIGN KEY (cpf_cliente) REFERENCES Clientes(cpf),
    FOREIGN KEY (crm_medico) REFERENCES Medicos(crm),
    FOREIGN KEY (medicamento) REFERENCES Medicamentos(codigo)
);

-- ========================================
-- Tabela: Vendas
-- ========================================
CREATE TABLE Vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cpf_cliente CHAR(11) NOT NULL,
    matricula_atendente INT NOT NULL,
    data DATE NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    origem_venda ENUM('presencial', 'online') DEFAULT 'presencial',
    FOREIGN KEY (cpf_cliente) REFERENCES Clientes(cpf),
    FOREIGN KEY (matricula_atendente) REFERENCES Funcionarios(matricula)
);

-- ========================================
-- Tabela: Itens da Venda
-- ========================================
CREATE TABLE Itens_Venda (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    codigo_medicamento INT NOT NULL,
    quantidade INT NOT NULL,
    valor_unitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES Vendas(id),
    FOREIGN KEY (codigo_medicamento) REFERENCES Medicamentos(codigo)
);

-- ========================================
-- Tabela: Pagamentos
-- ========================================
CREATE TABLE Pagamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    forma ENUM('dinheiro','cartão','pix') NOT NULL,
    status ENUM('pago','pendente','cancelado') NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES Vendas(id)
);

-- ========================================
-- ÍNDICES PARA PERFORMANCE
-- ========================================
CREATE INDEX idx_medicamento_nome ON Medicamentos(nome);
CREATE INDEX idx_cliente_cpf ON Clientes(cpf);
CREATE INDEX idx_medico_crm ON Medicos(crm);
CREATE INDEX idx_venda_data ON Vendas(data);
