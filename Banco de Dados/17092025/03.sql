USE `cap3_tabelas_dados`;

ALTER TABLE comprodu ADD INDEX idx_comprodu_numeforne (n_numeforne);
ALTER TABLE comvenda ADD INDEX idx_comvenda_numevende (n_numevende);
ALTER TABLE comvenda ADD INDEX idx_comvenda_numeclien (n_numeclien);
ALTER TABLE comvenda ADD INDEX idx_comvenda_numeforne (n_numeforne);
ALTER TABLE comvendas ADD INDEX idx_comvendas_numeclien (n_numeclien);
ALTER TABLE comvendas ADD INDEX idx_comvendas_numeforne (n_numeforne);
ALTER TABLE comvendas ADD INDEX idx_comvendas_numevende (n_numevende);
ALTER TABLE comivenda ADD INDEX idx_comivenda_numevenda (n_numevenda);
ALTER TABLE comivenda ADD INDEX idx_comivenda_numeprodu (n_numeprodu);
