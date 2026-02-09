-- Índices para otimizar buscas e junções
CREATE INDEX idx_enderecos_clientes_id ON enderecos (cliente_id);

CREATE INDEX idx_produtos_categoria_id ON produtos (categoria_id);

CREATE INDEX idx_pedidos_cliente_id ON pedidos (cliente_id);

CREATE INDEX idx_itens_pedido_id ON itens_pedido (pedido_id);

CREATE INDEX idx_itens_pedido_produto_id ON itens_pedido (produto_id);