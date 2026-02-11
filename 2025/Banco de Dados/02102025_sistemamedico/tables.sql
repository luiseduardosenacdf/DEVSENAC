CREATE DATABASE IF NOT EXISTS SistemaMedico;
USE SistemaMedico;

-- ===============================================
-- TABELAS (DDL)
-- ===============================================

-- Especialidades
CREATE TABLE IF NOT EXISTS especialidades (
    especialidade_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

-- Clínicas
CREATE TABLE IF NOT EXISTS clinicas (
    clinica_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    endereco VARCHAR(200) NOT NULL
);

-- Pacientes
CREATE TABLE IF NOT EXISTS pacientes (
    paciente_ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(17) NOT NULL UNIQUE,
    dataNasc DATE NOT NULL,
    cidade VARCHAR(50) NOT NULL
);

-- Médicos
CREATE TABLE IF NOT EXISTS medicos (
    medico_ID INT AUTO_INCREMENT PRIMARY KEY,
    CRM INT NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL,
    especialidade_ID INT NOT NULL,
    clinica_ID INT NOT NULL,
    CONSTRAINT fk_medicos_especialidade FOREIGN KEY (especialidade_ID) REFERENCES especialidades(especialidade_ID),
    CONSTRAINT fk_medicos_clinica FOREIGN KEY (clinica_ID) REFERENCES clinicas(clinica_ID)
);

-- Consultas
CREATE TABLE IF NOT EXISTS consultas (
    consulta_ID INT AUTO_INCREMENT PRIMARY KEY,
    paciente_ID INT NOT NULL,
    medico_ID INT NOT NULL,
    tipoConsulta VARCHAR(100) NOT NULL,
    dataConsulta DATE NOT NULL,
    statusConsulta ENUM('Agendado','Realizada','Cancelada') DEFAULT 'Agendado',
    observacoes TEXT,
    CONSTRAINT fk_consultas_paciente FOREIGN KEY (paciente_ID) REFERENCES pacientes(paciente_ID),
    CONSTRAINT fk_consultas_medico FOREIGN KEY (medico_ID) REFERENCES medicos(medico_ID)
);

-- Log de Agendamentos
CREATE TABLE IF NOT EXISTS Log_Agendamentos (
    log_ID INT AUTO_INCREMENT PRIMARY KEY,
    consulta_ID INT NOT NULL,
    paciente_ID INT NOT NULL,
    medico_ID INT NOT NULL,
    dataConsulta DATE NOT NULL,
    statusConsulta ENUM('Agendado','Realizada','Cancelada') NOT NULL,
    dataRegistro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(50) DEFAULT 'INSERT'
);






