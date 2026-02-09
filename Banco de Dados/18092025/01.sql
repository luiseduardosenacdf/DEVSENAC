START TRANSACTION;

-- Passo 1: Inserir um novo pedido
INSERT INTO pedidos (id, cliente_id, data_pedido, status, total)
VALUES (31, 1, NOW(), 'Pago', 360.00);

select * from pedidos;
