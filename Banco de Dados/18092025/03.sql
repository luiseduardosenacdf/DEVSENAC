-- Passo 3: Atualizar o estoque do produto
UPDATE produtos
SET estoque = estoque - 2
WHERE id = 1;

-- Confirma todas as alterações
COMMIT;

START TRANSACTION;

-- Passo 1: Atualizar o status do pedido para 'Cancelado'
UPDATE pedidos
SET status = 'Cancelado'
WHERE id = 31;

-- Passo 2: Repor o estoque do produto
UPDATE produtos
SET estoque = estoque + 2
WHERE id = 1;

-- Confirma todas as alterações
COMMIT;