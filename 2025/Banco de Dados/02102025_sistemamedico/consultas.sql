-- ===============================================
-- CONSULTAS BÁSICAS E INTERMEDIÁRIAS
-- ===============================================

-- Filtrar pacientes nascidos após determinada data e cidade específica
SELECT * FROM pacientes
WHERE dataNasc > '2000-01-01' AND cidade = 'São Paulo'
ORDER BY dataNasc ASC
LIMIT 10;

-- INNER JOIN (consultas completas)
SELECT 
    c.consulta_ID,
    p.nome AS paciente,
    m.nome AS medico,
    e.nome AS especialidade,
    cl.nome AS clinica,
    c.tipoConsulta,
    c.dataConsulta,
    c.statusConsulta
FROM consultas c
INNER JOIN pacientes p ON c.paciente_ID = p.paciente_ID
INNER JOIN medicos m ON c.medico_ID = m.medico_ID
INNER JOIN especialidades e ON m.especialidade_ID = e.especialidade_ID
INNER JOIN clinicas cl ON m.clinica_ID = cl.clinica_ID;

-- LEFT JOIN (médicos sem consultas também)
SELECT 
    m.medico_ID,
    m.nome AS medico,
    e.nome AS especialidade,
    cl.nome AS clinica,
    c.consulta_ID,
    c.dataConsulta,
    c.statusConsulta
FROM medicos m
LEFT JOIN consultas c ON m.medico_ID = c.medico_ID
INNER JOIN especialidades e ON m.especialidade_ID = e.especialidade_ID
INNER JOIN clinicas cl ON m.clinica_ID = cl.clinica_ID;

-- UNION ALL (médicos e pacientes)
SELECT nome AS pessoa, 'Médico' AS tipo FROM medicos
UNION ALL
SELECT nome AS pessoa, 'Paciente' AS tipo FROM pacientes;

-- Agregação (média de dias desde consulta por médico)
SELECT 
    m.nome AS medico,
    COUNT(c.consulta_ID) AS total_consultas,
    AVG(DATEDIFF(CURDATE(), c.dataConsulta)) AS media_dias_desde_consulta
FROM consultas c
INNER JOIN medicos m ON c.medico_ID = m.medico_ID
GROUP BY m.nome;

-- Clínicas com mais de 5 agendamentos por dia
SELECT 
    cl.nome AS clinica,
    c.dataConsulta,
    COUNT(*) AS total_agendamentos
FROM consultas c
INNER JOIN medicos m ON c.medico_ID = m.medico_ID
INNER JOIN clinicas cl ON m.clinica_ID = cl.clinica_ID
WHERE c.statusConsulta = 'Agendado'
GROUP BY cl.nome, c.dataConsulta
HAVING COUNT(*) > 5;

-- View para consultas do último mês
CREATE OR REPLACE VIEW consultas_ultimo_mes AS
SELECT 
    c.consulta_ID,
    p.nome AS paciente,
    m.nome AS medico,
    c.dataConsulta,
    c.statusConsulta
FROM consultas c
INNER JOIN pacientes p ON c.paciente_ID = p.paciente_ID
INNER JOIN medicos m ON c.medico_ID = m.medico_ID
WHERE c.dataConsulta >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Subquery (pacientes que passaram em 2 ou mais especialidades)
SELECT p.nome, p.cpf
FROM pacientes p
WHERE p.paciente_ID IN (
    SELECT c.paciente_ID
    FROM consultas c
    INNER JOIN medicos m ON c.medico_ID = m.medico_ID
    GROUP BY c.paciente_ID
    HAVING COUNT(DISTINCT m.especialidade_ID) >= 2
);

-- Função de texto (nome completo paciente)
SELECT 
    paciente_ID,
    CONCAT(nome, ' - ', cidade) AS paciente_completo
FROM pacientes;