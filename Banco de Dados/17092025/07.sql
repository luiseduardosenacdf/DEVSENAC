USE `cap3_tabelas_dados`;

-- listar todas as tabelas do banco
SHOW TABLES;

-- ver a definição completa de uma tabela
SHOW CREATE TABLE comclien;

-- ver estrutura resumida (colunas e tipos)
DESCRIBE comclien;

-- procurar registros órfãos (ex.: venda sem cliente)
SELECT v.*
FROM comvenda v
LEFT JOIN comclien c ON v.n_numeclien = c.n_numeclien
WHERE c.n_numeclien IS NULL;

-- listar todas as foreign keys do banco
SELECT constraint_name, table_name, column_name, referenced_table_name, referenced_column_name
FROM information_schema.KEY_COLUMN_USAGE
WHERE table_schema = DATABASE()
  AND referenced_table_name IS NOT NULL
ORDER BY table_name;
