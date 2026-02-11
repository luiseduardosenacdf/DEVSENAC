-- ===============================================
-- ÍNDICES (OTIMIZAÇÃO)
-- ===============================================

-- Especialidades
CREATE INDEX idx_especialidades_nome ON especialidades(nome);

-- Clínicas
CREATE INDEX idx_clinicas_nome ON clinicas(nome);
CREATE INDEX idx_clinicas_endereco ON clinicas(endereco(100));

-- Pacientes
CREATE INDEX idx_pacientes_nome ON pacientes(nome);
CREATE INDEX idx_pacientes_cidade ON pacientes(cidade);
CREATE INDEX idx_pacientes_dataNasc ON pacientes(dataNasc);
CREATE INDEX idx_pacientes_cidade_data ON pacientes(cidade, dataNasc);

-- Médicos
CREATE INDEX idx_medicos_nome ON medicos(nome);
CREATE INDEX idx_medicos_especialidade ON medicos(especialidade_ID);
CREATE INDEX idx_medicos_clinica ON medicos(clinica_ID);
CREATE INDEX idx_medicos_especialidade_clinica ON medicos(especialidade_ID, clinica_ID);

-- Consultas
CREATE INDEX idx_consultas_paciente ON consultas(paciente_ID);
CREATE INDEX idx_consultas_medico ON consultas(medico_ID);
CREATE INDEX idx_consultas_data ON consultas(dataConsulta);
CREATE INDEX idx_consultas_status ON consultas(statusConsulta);
CREATE INDEX idx_consultas_data_status ON consultas(dataConsulta, statusConsulta);
CREATE INDEX idx_consultas_medico_data ON consultas(medico_ID, dataConsulta);
CREATE INDEX idx_consultas_paciente_data ON consultas(paciente_ID, dataConsulta);