-- Chaves Estrangeiras para garantir a integridade referencial

-- Enderecos → Usuarios
ALTER TABLE enderecos
ADD CONSTRAINT fk_enderecos_cliente_id
FOREIGN KEY (cliente_id) REFERENCES usuarios (id);

-- Produtos → Categorias
ALTER TABLE produtos
ADD CONSTRAINT fk_produtos_categoria_id
FOREIGN KEY (categoria_id) REFERENCES categorias (id)

-- Pedidos → Usuarios
ALTER TABLE pedidos
ADD CONSTRAINT fk_pedidos_cliente_id
FOREIGN KEY (cliente_id) REFERENCES usuarios (id)

-- Itens_pedido → Pedidos
ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_pedido_id
FOREIGN KEY (pedido_id) REFERENCES pedidos (id)

-- Itens_pedido → Produtos
ALTER TABLE itens_pedido
ADD CONSTRAINT fk_itens_pedido_produto_id
FOREIGN KEY (produto_id) REFERENCES produtos (id)
