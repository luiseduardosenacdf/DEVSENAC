-- ===========================================================
-- BANCO: E-Commerce - Implementação dos Direitos do Titular (LGPD)
-- ===========================================================
-- Autor: Luis Eduardo de Sousa
-- Data: 06/10/2025
-- Descrição: Procedimentos para Acesso, Correção e Eliminação
-- ===========================================================


-- ===========================================================
-- 1️ DIREITO DE ACESSO E PORTABILIDADE
-- ===========================================================
DELIMITER $$

CREATE PROCEDURE sp_direito_acesso (IN p_id_cliente INT)
BEGIN
    -- Retorna os dados do titular de forma mascarada e segura
    SELECT 
        c.ID_Cliente,
        c.Nome,
        CONCAT('***.', RIGHT(c.CPF, 3)) AS CPF_Parcial,
        c.Email,
        c.Data_Cadastro,
        e.Logradouro,
        e.Numero,
        e.Cidade,
        e.Estado,
        e.CEP,
        h.ID_Pedido,
        h.Data_Pedido,
        h.Valor_Total,
        CONCAT('**** **** **** ', RIGHT(cs.Numero_Cartao, 4)) AS Cartao_Parcial
    FROM Clientes c
    LEFT JOIN Enderecos e ON c.ID_Cliente = e.ID_Cliente
    LEFT JOIN Historico_Pedidos h ON c.ID_Cliente = h.ID_Cliente
    LEFT JOIN Cartoes_Salvos cs ON c.ID_Cliente = cs.ID_Cliente
    WHERE c.ID_Cliente = p_id_cliente;
END $$

DELIMITER ;


-- ===========================================================
-- 2 DIREITO DE CORREÇÃO
-- ===========================================================
DELIMITER $$

CREATE PROCEDURE sp_direito_correcao (
    IN p_id_cliente INT,
    IN p_novo_email VARCHAR(100)
)
BEGIN
    DECLARE v_email_antigo VARCHAR(100);

    -- Captura o valor antigo
    SELECT Email INTO v_email_antigo
    FROM Clientes
    WHERE ID_Cliente = p_id_cliente;

    -- Atualiza o e-mail
    UPDATE Clientes
    SET Email = p_novo_email
    WHERE ID_Cliente = p_id_cliente;

    -- Registra a alteração no log
    INSERT INTO Log_Alteracoes (ID_Cliente, Campo_Alterado, Valor_Antigo, Valor_Novo, Data_Alteracao)
    VALUES (p_id_cliente, 'Email', v_email_antigo, p_novo_email, NOW());
END $$

DELIMITER ;


-- ===========================================================
-- 3️ DIREITO DE ELIMINAÇÃO (Anonimização / Pseudonimização)
-- ===========================================================
DELIMITER $$

CREATE PROCEDURE sp_direito_eliminacao (IN p_id_cliente INT)
BEGIN
    UPDATE Clientes
    SET 
        Status = 'Excluido_LGPD',
        Nome = CONCAT('Anonimizado_', ID_Cliente),
        CPF = NULL,
        Email = NULL
    WHERE ID_Cliente = p_id_cliente;

    -- Registro da ação para auditoria
    INSERT INTO Log_Alteracoes (ID_Cliente, Campo_Alterado, Valor_Antigo, Valor_Novo, Data_Alteracao)
    VALUES (p_id_cliente, 'Status', 'Ativo', 'Excluido_LGPD', NOW());
END $$

DELIMITER ;


-- ===========================================================
-- TABELA DE LOG (caso ainda não exista)
-- ===========================================================
CREATE TABLE IF NOT EXISTS Log_Alteracoes (
    ID_Log INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT,
    Campo_Alterado VARCHAR(50),
    Valor_Antigo VARCHAR(255),
    Valor_Novo VARCHAR(255),
    Data_Alteracao DATETIME
);

-- ===========================================================
-- EXEMPLOS DE EXECUÇÃO
-- ===========================================================

-- 1️ Acesso e portabilidade:
CALL sp_direito_acesso(1234);

-- 2️ Correção de e-mail:
CALL sp_direito_correcao(1234, 'novoemail@exemplo.com');

-- 3️ Eliminação (anonimização) de dados:
CALL sp_direito_eliminacao(1234);