-- Criando Banco de Dados "ecommerce"
Create database ecommerce;
-- Acessar Banco
USE ecommerce;
-- Tabela Cliente
Create table clientes(
	id int auto_increment primary key,
    nome varchar(100) not null,
    email varchar(100) unique not null,
    senha varchar(10) not null,
    telefone varchar(20),
    criando_em datetime default current_timestamp
);

-- Tabela Enderecos
Create table enderecos (
	id int auto_increment primary key,
	cliente_id int,
    rua varchar(100),
    numero varchar(10),
    complemento varchar(100),
    bairro varchar(50),
    cidade varchar(50),
    estado char(2)
);
-- Tabela Categorias
Create table categorias (
	id int auto_increment primary key,	
	client_id int,
    data_pedido datetime default current_timestamp,
    status varchar(50) default 'Pendente',
    total decimal(10,2)
);
-- Tabela Produtos
Create table produtos (
	id int auto_increment primary key,
    cliente_id int,
    data_pedido datetime default current_timestamp,
    status varchar(50) default 'Pendente',
    total decimal(10,2)
);
-- Tabela itens pedido
Create table itens_pedido(
	id int auto_increment primary key,
    pedido_id int,
    produto_id int,
    quantidade int not null,
    preco_unitario decimal(10,2) not null
);
-- Tabela Pedidos
Create table pedidos(
	id int auto_increment primary key,
    pedido_id int,
    data_pedido datetime default current_timestamp,
    situacao varchar(50) default 'Pendente',
    total decimal(10,2)
);

    