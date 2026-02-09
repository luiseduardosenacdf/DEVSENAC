-- Passo 1: Atualizar o preço dos produtos da categoria 1
UPDATE produtos
SET preco = 900.00
WHERE categoria_id = 1;

-- Passo 2: Verificar as alterações (opcional, apenas para demonstração)
SELECT nome, preco FROM produtos WHERE categoria_id = 1;

-- Passo 3: Reverter todas as alterações
ROLLBACK;

-- Passo 4: Verificar se as alterações foram desfeitas (opcional)
SELECT nome, preco FROM produtos WHERE categoria_id = 1;