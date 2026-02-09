START TRANSACTION;

-- Passo 1: Atualizar estoque do produto (exemplo: saída de 3 unidades do produto 1)
UPDATE produtos
SET estoque = estoque - 3
WHERE id = 1;

-- Passo 2: Registrar evento na auditoria
INSERT INTO auditoria_estoque (produto_id, quantidade_alterada, tipo_operacao, usuario_id)
VALUES (1, -3, 'Saída', 1);

-- Confirma transação
COMMIT;
