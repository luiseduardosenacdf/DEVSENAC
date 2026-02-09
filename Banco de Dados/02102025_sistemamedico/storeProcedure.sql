-- ===============================================
-- STORED PROCEDURE (COM TRANSAÇÃO E ROLLBACK)
-- ===============================================
DELIMITER //
CREATE PROCEDURE AgendarConsulta (
    IN p_paciente_ID INT,
    IN p_medico_ID INT,
    IN p_tipoConsulta VARCHAR(100),
    IN p_dataConsulta DATE,
    IN p_observacoes TEXT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Erro ao agendar consulta!';
    END;

    START TRANSACTION;

    -- Verificar conflito de horário
    IF EXISTS (SELECT 1 FROM consultas WHERE medico_ID = p_medico_ID AND dataConsulta = p_dataConsulta AND statusConsulta = 'Agendado') THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Médico já possui agendamento neste horário!';
    ELSE
        -- Inserir consulta
        INSERT INTO consultas (paciente_ID, medico_ID, tipoConsulta, dataConsulta, observacoes)
        VALUES (p_paciente_ID, p_medico_ID, p_tipoConsulta, p_dataConsulta, p_observacoes);

        -- Inserção no log será feita automaticamente pelo TRIGGER
    END IF;

    COMMIT;
END;
//
DELIMITER ;