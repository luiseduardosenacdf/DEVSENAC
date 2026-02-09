START TRANSACTION;

INSERT INTO itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario)
VALUES (31, 31, 1, 2, 180.00);

select * from itens_pedido;