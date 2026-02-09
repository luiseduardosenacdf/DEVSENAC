-- View de Consolidação/Relatório: visão detalhada de pedidos
CREATE OR REPLACE VIEW v_pedidos_detalhados AS
SELECT 
    u.nome AS cliente,
    u.email,
    p.id AS pedido_id,
    p.data_pedido,
    p.status,
    p.total,
    pr.nome AS produto,
    pr.preco,
    ip.quantidade,
    (ip.quantidade * ip.preco_unitario) AS subtotal
FROM pedidos AS p
INNER JOIN usuarios AS u ON p.usuario_id = u.id
INNER JOIN itens_pedido AS ip ON ip.pedido_id = p.id
INNER JOIN produtos AS pr ON ip.produto_id = pr.id;


-- View de Segurança e Acesso: clientes sem dados sensíveis
CREATE OR REPLACE VIEW v_clientes_sem_senha AS
SELECT 
    id,
    nome,
    email,
    celular,
    ativo,
    criado_em
FROM usuarios;


-- View de Lógica de Negócios: produtos com estoque baixo
CREATE OR REPLACE VIEW v_resumo_estoque_baixo AS
SELECT 
    id AS produto_id,
    nome,
    estoque,
    categoria_id
FROM produtos
WHERE estoque < 10;

-- Teste 1: Consultar a visão detalhada de pedidos
SELECT *
FROM v_pedidos_detalhados
ORDER BY data_pedido DESC;

-- Teste 2: Listar clientes sem expor senha ou CPF
SELECT *
FROM v_clientes_sem_senha
ORDER BY criado_em DESC;

-- Teste 3: Verificar produtos com estoque baixo (menor que 10)
SELECT *
FROM v_resumo_estoque_baixo
ORDER BY estoque ASC;
