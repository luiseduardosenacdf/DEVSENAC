-- ====================================================
-- View 1: Relatório de Pedidos Detalhados (Abstração)
-- ====================================================
CREATE OR REPLACE VIEW v_pedidos_detalhados AS
SELECT 
    p.id AS pedido_id,
    u.nome AS cliente,
    u.email,
    p.data_pedido,
    p.status,
    p.total,
    COUNT(ip.id) AS qtd_itens
FROM pedidos p
INNER JOIN usuarios u ON u.id = p.cliente_id
LEFT JOIN itens_pedido ip ON ip.pedido_id = p.id
GROUP BY p.id, u.nome, u.email, p.data_pedido, p.status, p.total;

-- ====================================================
-- View 2: Clientes sem Dados Sensíveis (Segurança)
-- ====================================================
CREATE OR REPLACE VIEW v_clientes_sem_senha AS
SELECT 
    id AS cliente_id,
    nome,
    email,
    celular,
    criando_em
FROM usuarios;

-- ====================================================
-- View 3: Produtos com Estoque Baixo + Última Auditoria (Lógica de Negócios)
-- ====================================================
CREATE OR REPLACE VIEW v_estoque_critico AS
SELECT 
    p.id AS produto_id,
    p.nome,
    p.estoque,
    MAX(a.data_evento) AS ultima_movimentacao
FROM produtos p
LEFT JOIN auditoria_estoque a ON a.produto_id = p.id
WHERE p.estoque < 10
GROUP BY p.id, p.nome, p.estoque;

SELECT * FROM v_pedidos_detalhados LIMIT 10;
SELECT * FROM v_clientes_sem_senha LIMIT 10;
SELECT * FROM v_estoque_critico LIMIT 10;
