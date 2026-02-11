-- ====================================================
-- Tabela de Auditoria de Status de Pedidos
-- ====================================================
CREATE TABLE IF NOT EXISTS log_status_pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pedido_id INT NOT NULL,
    status_antigo VARCHAR(50),
    status_novo VARCHAR(50),
    data_mudanca TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ====================================================
-- Trigger 1: Baixa de Estoque
-- ====================================================
DROP TRIGGER IF EXISTS trg_baixa_estoque;
DELIMITER //
CREATE TRIGGER trg_baixa_estoque
AFTER INSERT ON itens_pedido
FOR EACH ROW
BEGIN
    UPDATE produtos
    SET estoque = estoque - NEW.quantidade
    WHERE id = NEW.produto_id;
END //
DELIMITER ;

-- ====================================================
-- Trigger 2: Log de Mudança de Status em Pedidos
-- ====================================================
DROP TRIGGER IF EXISTS trg_log_status_pedido;
DELIMITER //
CREATE TRIGGER trg_log_status_pedido
BEFORE UPDATE ON pedidos
FOR EACH ROW
BEGIN
    IF OLD.status <> NEW.status THEN
        INSERT INTO log_status_pedidos (
            pedido_id,
            status_antigo,
            status_novo
        )
        VALUES (
            OLD.id,
            OLD.status,
            NEW.status
        );
    END IF;
END //
DELIMITER ;

-- ====================================================
-- Trigger 3: Validação e Padronização de Usuários
-- ====================================================
DROP TRIGGER IF EXISTS trg_validacao_cliente;
DELIMITER //
CREATE TRIGGER trg_validacao_cliente
BEFORE INSERT ON usuarios
FOR EACH ROW
BEGIN
    -- Padroniza o nome
    SET NEW.nome = UPPER(NEW.nome);

    -- Valida CPF (não pode ser nulo ou vazio)
    IF NEW.cpf IS NULL OR NEW.cpf = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ERRO: O CPF do usuário não pode ser nulo ou vazio.';
    END IF;
END //
DELIMITER ;

SHOW TRIGGERS;
