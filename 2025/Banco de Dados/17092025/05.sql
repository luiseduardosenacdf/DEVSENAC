USE `cap3_tabelas_dados`;

-- adicionar cidade
ALTER TABLE comclien ADD COLUMN c_cidaclien VARCHAR(50);

-- demo: adicionar campo com nome errado, dropar e recriar corretamente
ALTER TABLE comclien ADD COLUMN c_estclien VARCHAR(50);
ALTER TABLE comclien DROP COLUMN c_estclien;
ALTER TABLE comclien ADD COLUMN c_estaclien VARCHAR(50);

-- exemplo seguro: aumentar tamanho do campo
ALTER TABLE comclien MODIFY COLUMN c_estaclien VARCHAR(100);
