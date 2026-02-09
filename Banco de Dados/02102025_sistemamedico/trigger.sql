-- ===============================================
-- TRIGGER DE LOG
-- ===============================================
DELIMITER //
CREATE TRIGGER trg_log_consultas_after_insert
AFTER INSERT ON consultas
FOR EACH ROW
BEGIN
    INSERT INTO Log_Agendamentos (consulta_ID, paciente_ID, medico_ID, dataConsulta, statusConsulta, acao)
    VALUES (NEW.consulta_ID, NEW.paciente_ID, NEW.medico_ID, NEW.dataConsulta, NEW.statusConsulta, 'INSERT');
END;
//
DELIMITER ;