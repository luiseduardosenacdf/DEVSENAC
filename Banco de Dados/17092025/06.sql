USE `cap3_tabelas_dados`;

INSERT INTO comforne (n_numeforne, c_codiforne, c_nomeforne, c_razaforne, c_foneforne)
VALUES (1, 'F001', 'Fornecedor A', 'Razao Fornecedor A', '1111-1111');

INSERT INTO comclien (n_numeclien, c_codiclien, c_nomeclien, c_razaclien, d_dataclien, c_cnpjclien, c_foneclien)
VALUES (1, 'C001', 'Cliente A', 'Razao Cliente A', '2025-01-01', '00.000.000/0001-00', '2222-2222');

INSERT INTO comvende (n_numevende, c_codivende, c_nomevende, c_razavende, c_fonevende, n_porcvende)
VALUES (1, 'V001', 'Vendedor A', 'Razao Vendedor', '3333-3333', 5.0);

INSERT INTO comprodu (n_numeprodu, c_codiprodu, c_descprodu, n_valoprodu, c_situprodu, n_numeforne)
VALUES (1, 'P001', 'Produto X', 10.00, 'A', 1);

INSERT INTO comvenda (n_numevenda, n_numevende, n_numeclien, n_numeforne, n_valovenda, n_porcvende, n_totavenda, d_datavenda)
VALUES (1, 1, 1, 1, 100.00, 5.0, 95.00, CURDATE());

INSERT INTO comivenda (n_numeivenda, n_numevenda, n_numeprodu, n_valoivenda, n_qtdeivenda, n_descivenda)
VALUES (1, 1, 1, 10.00, 2, 0.00);
