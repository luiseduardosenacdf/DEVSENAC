-- Renomeando colunas
alter table clientes
change column telefone celular varchar(15);
-- Renomeando tabela
rename table clientes to usuarios;
-- Alterando tipo de dados de uma coluna
alter table usuarios
add column telefone varchar (12) after email;
-- Adiciona a coluna 'cep' após a coluna 'estado' na tabela 'enderecos'
alter table enderecos add column cep varchar (10) after estado;
-- Adicionando index para acessar infromações exploradas com frequencia
alter table usuarios
add index idx_email (email);
-- Adicionando coluna cpf
ALTER TABLE usuarios ADD COLUMN cpf varchar(14) after celular;
-- Removendo coluna telefone
ALTER TABLE usuarios DROP COLUMN telefone;
-- Alterando coluna celular
ALTER TABLE usuarios MODIFY celular varchar(20);
-- Alterando coluna senha
ALTER TABLE usuarios MODIFY senha varchar(20);
-- Alterando coluna enderecos
ALTER TABLE enderecos ADD COLUMN cep VARCHAR(14) AFTER estado;
-- Alterando tabela categorias
ALTER TABLE categorias
DROP COLUMN client_id,  
DROP COLUMN data_pedido,
DROP COLUMN status,  
DROP COLUMN total;
ALTER TABLE categorias
ADD COLUMN nome VARCHAR(255) NOT NULL,
ADD COLUMN descricao TEXT;
-- -- Alterando tabela categorias
-- Remove colunas antigas
ALTER TABLE produtos 
    DROP COLUMN cliente_id,
    DROP COLUMN data_pedido,
    DROP COLUMN status,
    DROP COLUMN total;
-- Adiciona as novas colunas
ALTER TABLE produtos
    ADD COLUMN nome VARCHAR(100) NOT NULL,
    ADD COLUMN descricao TEXT,
    ADD COLUMN preco DECIMAL(10,2) NOT NULL,
    ADD COLUMN estoque INT NOT NULL DEFAULT 0,
    ADD COLUMN categoria_id INT;
-- -- Alterando tabela pedidos
-- Remover a coluna 'pedido_id' (não vai precisar)
ALTER TABLE pedidos 
    DROP COLUMN pedido_id;
-- Renomear 'situacao' para 'status'
ALTER TABLE pedidos 
    CHANGE COLUMN situacao status VARCHAR(50);
-- Adicionar 'cliente_id'
ALTER TABLE pedidos 
    ADD COLUMN cliente_id INT AFTER id;
-- -- -- -- Alterando tabela itens_pedido
-- Garantir que os tipos estão corretos
ALTER TABLE itens_pedido
    MODIFY COLUMN quantidade INT NOT NULL,
    MODIFY COLUMN preco_unitario DECIMAL(10,2) NOT NULL;
-- Adicionar chaves estrangeiras (só se ainda não existirem)
ALTER TABLE itens_pedido
  ADD CONSTRAINT fk_itens_pedido_pedido
    FOREIGN KEY (pedido_id) REFERENCES pedidos(id);
ALTER TABLE itens_pedido
  ADD CONSTRAINT fk_itens_pedido_produto
    FOREIGN KEY (produto_id) REFERENCES produtos(id);
