CREATE OR REPLACE VIEW v_faturamento_mensal AS
SELECT 
    YEAR(data_pedido) AS ano,
    MONTH(data_pedido) AS mes,
    COUNT(id) AS qtd_pedidos,
    SUM(total) AS faturamento_total
FROM pedidos
WHERE status <> 'Cancelado'
GROUP BY YEAR(data_pedido), MONTH(data_pedido)
ORDER BY ano DESC, mes DESC;

SELECT * FROM v_faturamento_mensal;