-- Criando um novo pedido com transação
START TRANSACTION;

-- Passo 1: Inserir um novo pedido
INSERT INTO pedidos (id, usuario_id, data_pedido, status, total)
VALUES (31, 1, NOW(), 'Pago', 360.00);

-- Verificar pedido criado
SELECT * FROM pedidos;

-- Pega o ID do novo pedido
SET @novo_pedido_id = LAST_INSERT_ID();

-- Inserir item (produto_id 2, que ainda não está no pedido)
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario)
VALUES (@novo_pedido_id, 2, 2, 180.00);

-- Verificar itens inseridos
SELECT * FROM itens_pedido;

-- Passo 3: Atualizar o estoque do produto
UPDATE produtos
SET estoque = estoque - 2
WHERE id = 1;

-- Confirmar alterações
COMMIT;


-- Cancelando um pedido e revertendo estoque
START TRANSACTION;

-- Passo 1: Atualizar status do pedido
UPDATE pedidos
SET status = 'Cancelado'
WHERE id = 31;

-- Passo 2: Repor o estoque do produto
UPDATE produtos
SET estoque = estoque + 2
WHERE id = 1;

-- Confirmar alterações
COMMIT;


-- Atualizando preço de produtos de uma categoria e testando ROLLBACK
START TRANSACTION;

-- Passo 1: Atualizar preços da categoria 1
UPDATE produtos
SET preco = 900.00
WHERE categoria_id = 1;

-- Passo 2: Verificar alterações
SELECT nome, preco
FROM produtos
WHERE categoria_id = 1;

-- Passo 3: Reverter todas as alterações
ROLLBACK;

-- Passo 4: Verificar se alterações foram desfeitas
SELECT nome, preco
FROM produtos
WHERE categoria_id = 1;
