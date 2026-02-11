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
