CREATE TABLE auditoria_estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    produto_id INT NOT NULL,
    quantidade_alterada INT NOT NULL,
    tipo_operacao VARCHAR(50) NOT NULL,
    usuario_id INT NOT NULL,
    data_evento DATETIME DEFAULT NOW(),
    FOREIGN KEY (produto_id) REFERENCES produtos(id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
