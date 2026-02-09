-- ========================================
-- CONSULTAS OBRIGATÓRIAS - SISTEMA FARMÁCIA
-- ========================================

-- 1. Lista de medicamentos prestes a vencer (<30 dias) com quantidade em estoque
SELECT m.nome, e.lote, e.validade_lote, e.quantidade
FROM Estoque e
JOIN Medicamentos m ON m.codigo = e.codigo_medicamento
WHERE e.validade_lote <= CURDATE() + INTERVAL 30 DAY;

-- 2. Ranking dos 10 medicamentos mais vendidos por quantidade
SELECT m.nome, SUM(iv.quantidade) AS total_vendido
FROM Itens_Venda iv
JOIN Medicamentos m ON m.codigo = iv.codigo_medicamento
GROUP BY m.nome
ORDER BY total_vendido DESC
LIMIT 10;

-- 3. Clientes que mais compraram medicamentos controlados
SELECT c.nome, SUM(iv.quantidade) AS qtd_controlados
FROM Vendas v
JOIN Clientes c ON c.cpf = v.cpf_cliente
JOIN Itens_Venda iv ON iv.id_venda = v.id
JOIN Medicamentos m ON m.codigo = iv.codigo_medicamento
WHERE m.tipo = 'controlado'
GROUP BY c.nome
ORDER BY qtd_controlados DESC;

-- 4. Total de vendas por dia
SELECT DATE(v.data) AS dia, SUM(v.valor_total) AS total
FROM Vendas v
GROUP BY dia
ORDER BY dia;

-- 5. Total de vendas por mês
SELECT DATE_FORMAT(v.data, '%Y-%m') AS mes, SUM(v.valor_total) AS total
FROM Vendas v
GROUP BY mes
ORDER BY mes;

-- 6. Total de vendas por forma de pagamento
SELECT p.forma, SUM(v.valor_total) AS total
FROM Pagamentos p
JOIN Vendas v ON v.id = p.id_venda
GROUP BY p.forma;

-- 7. Itens em estoque abaixo de 10 unidades
SELECT m.nome, e.lote, e.quantidade
FROM Estoque e
JOIN Medicamentos m ON m.codigo = e.codigo_medicamento
WHERE e.quantidade < 10;

-- 8. Médicos que mais prescreveram receitas
SELECT med.nome, COUNT(r.id) AS qtd_receitas
FROM Receitas_Medicas r
JOIN Medicos med ON med.crm = r.crm_medico
GROUP BY med.nome
ORDER BY qtd_receitas DESC;

-- 9. Funcionários que mais realizaram vendas (por valor total)
SELECT f.nome, SUM(v.valor_total) AS total_vendas
FROM Vendas v
JOIN Funcionarios f ON f.matricula = v.matricula_atendente
GROUP BY f.nome
ORDER BY total_vendas DESC;

-- 10. Valor total vendido por fornecedor
SELECT f.razao_social, SUM(iv.quantidade * iv.valor_unitario) AS total_vendido
FROM Fornecedores f
JOIN Medicamentos m ON m.codigo = m.codigo -- ligação depende de tabela intermediária (ajuste se necessário)
JOIN Itens_Venda iv ON iv.codigo_medicamento = m.codigo
JOIN Vendas v ON v.id = iv.id_venda
GROUP BY f.razao_social;

-- 11. Lista de clientes com compras acima de R$ 1000
SELECT c.nome, SUM(v.valor_total) AS total_gasto
FROM Vendas v
JOIN Clientes c ON c.cpf = v.cpf_cliente
GROUP BY c.nome
HAVING total_gasto > 1000
ORDER BY total_gasto DESC;

-- 12. Média de medicamentos por receita
SELECT AVG(qtd) AS media_medicamentos
FROM (
    SELECT COUNT(r.medicamento) AS qtd
    FROM Receitas_Medicas r
    GROUP BY r.id
) sub;

-- 13. Receita mais antiga e mais recente de cada cliente
SELECT c.nome, MIN(r.data_emissao) AS primeira, MAX(r.data_emissao) AS ultima
FROM Receitas_Medicas r
JOIN Clientes c ON c.cpf = r.cpf_cliente
GROUP BY c.nome;

-- 14. Valor médio gasto por cliente
SELECT c.nome, AVG(v.valor_total) AS valor_medio
FROM Vendas v
JOIN Clientes c ON c.cpf = v.cpf_cliente
GROUP BY c.nome;

-- 15. Clientes ativos (compraram no último mês)
SELECT DISTINCT c.nome
FROM Clientes c
JOIN Vendas v ON v.cpf_cliente = c.cpf
WHERE v.data >= CURDATE() - INTERVAL 30 DAY;

-- 16. Clientes inativos (não compraram no último mês)
SELECT c.nome
FROM Clientes c
WHERE c.cpf NOT IN (
    SELECT v.cpf_cliente
    FROM Vendas v
    WHERE v.data >= CURDATE() - INTERVAL 30 DAY
);

-- 17. Medicamentos mais vendidos por tipo
SELECT m.tipo, m.nome, SUM(iv.quantidade) AS qtd_vendida
FROM Itens_Venda iv
JOIN Medicamentos m ON m.codigo = iv.codigo_medicamento
GROUP BY m.tipo, m.nome
ORDER BY m.tipo, qtd_vendida DESC;

-- 18. Fornecedor que mais forneceu medicamentos
-- (supondo que Medicamentos tem fornecedor via coluna adicional)
-- Ajustar se necessário
SELECT f.razao_social, COUNT(m.codigo) AS qtd_medicamentos
FROM Fornecedores f
JOIN Medicamentos m ON m.codigo = m.codigo
GROUP BY f.razao_social
ORDER BY qtd_medicamentos DESC;

-- 19. Receita média de vendas presenciais vs online
SELECT origem_venda, AVG(valor_total) AS receita_media
FROM Vendas
GROUP BY origem_venda;

-- 20. Consulta geral de estoque
SELECT m.nome, e.lote, e.quantidade, e.validade_lote, e.data_entrada
FROM Estoque e
JOIN Medicamentos m ON m.codigo = e.codigo_medicamento
ORDER BY m.nome;