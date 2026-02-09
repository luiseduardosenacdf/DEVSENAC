-- Procedure para listar produtos por categoria
DELIMITER //

CREATE PROCEDURE listar_produtos_por_categoria(IN categoria_id_param INT)
BEGIN
    SELECT 
        p.nome, 
        p.preco, 
        p.estoque, 
        c.nome AS categoria
    FROM produtos AS p
    INNER JOIN categorias AS c 
        ON p.categoria_id = c.id
    WHERE p.categoria_id = categoria_id_param;
END //

DELIMITER ;

-- Executar procedure de listagem
CALL listar_produtos_por_categoria(1);


-- Procedure para atualizar preço de todos os produtos de uma categoria
DELIMITER //

CREATE PROCEDURE atualizar_preco_categoria(
    IN categoria_id_param INT,
    IN novo_preco DECIMAL(10,2)
)
BEGIN
    UPDATE produtos
    SET preco = novo_preco
    WHERE categoria_id = categoria_id_param;
END //

DELIMITER ;

-- Executar procedure de atualização
CALL atualizar_preco_categoria(3, 150.00);

-- Verificar todos os produtos da categoria 3
SELECT id, nome, preco, estoque
FROM produtos
WHERE categoria_id = 3;
