USE farmacia;

-- ========================================
-- Fornecedores (10)
-- ========================================
INSERT INTO Fornecedores (cnpj, razao_social, contato) VALUES
('12345678000195','EMS S/A','contato@ems.com.br'),
('98765432000111','Aché Laboratórios','suporte@ache.com.br'),
('11223344000199','Eurofarma Indústria','atendimento@eurofarma.com'),
('22334455000188','Roche Farmacêutica','contato@roche.com'),
('33445566000177','Pfizer Brasil','contato@pfizer.com'),
('44556677000166','Novartis Brasil','info@novartis.com'),
('55667788000155','Sanofi Aventis','suporte@sanofi.com'),
('66778899000144','Bayer S/A','info@bayer.com'),
('77889900000133','Cristália Produtos Químicos','contato@cristalia.com'),
('88990011000122','Libbs Farmacêutica','suporte@libbs.com');

-- ========================================
-- Medicamentos (20+ com fornecedor)
-- ========================================
INSERT INTO Medicamentos 
(nome, principio_ativo, tipo, validade_med, preco, cnpj_fornecedor) VALUES
('Paracetamol 500mg','Paracetamol','comum','2025-05-10',12.50,'12345678000195'),
('Dipirona 1g','Dipirona','comum','2025-03-15',8.90,'98765432000111'),
('Amoxicilina 500mg','Amoxicilina','comum','2025-08-20',25.00,'11223344000199'),
('Rivotril 2mg','Clonazepam','controlado','2024-11-01',45.00,'22334455000188'),
('Diazepam 10mg','Diazepam','controlado','2024-12-15',38.00,'33445566000177'),
('Ibuprofeno 400mg','Ibuprofeno','comum','2025-06-30',18.00,'44556677000166'),
('Losartana 50mg','Losartana','comum','2025-09-05',30.00,'55667788000155'),
('Omeprazol 20mg','Omeprazol','comum','2025-04-25',22.00,'66778899000144'),
('Metformina 850mg','Metformina','comum','2025-07-18',28.00,'77889900000133'),
('Rosuvastatina 10mg','Rosuvastatina','comum','2025-10-02',60.00,'88990011000122'),
('Valeriana 500mg','Valeriana','fitoterápico','2025-12-01',15.00,'12345678000195'),
('Passiflora 200mg','Passiflora','fitoterápico','2025-07-01',12.00,'98765432000111'),
('Cloroquina 150mg','Cloroquina','controlado','2024-10-20',50.00,'11223344000199'),
('Sertralina 50mg','Sertralina','controlado','2024-11-30',55.00,'22334455000188'),
('Fluoxetina 20mg','Fluoxetina','controlado','2024-09-15',48.00,'33445566000177'),
('Vitamina C 1g','Ácido Ascórbico','comum','2025-12-31',10.00,'44556677000166'),
('Ácido Fólico 5mg','Ácido Fólico','comum','2025-05-12',14.00,'55667788000155'),
('Polivitamínico','Complexo Vitamínico','comum','2025-08-01',40.00,'66778899000144'),
('Cetoprofeno 100mg','Cetoprofeno','comum','2024-12-20',25.00,'77889900000133'),
('Prednisona 20mg','Prednisona','controlado','2025-01-15',32.00,'88990011000122');

-- ========================================
-- Clientes (15)
-- ========================================
INSERT INTO Clientes (cpf, nome, telefone) VALUES
('12345678901','João Silva','11988887777'),
('98765432100','Maria Oliveira','11999996666'),
('11122233344','Carlos Souza','21988887777'),
('22233344455','Ana Paula','31988887777'),
('33344455566','Pedro Santos','41988887777'),
('44455566677','Juliana Costa','51988887777'),
('55566677788','Ricardo Almeida','61988887777'),
('66677788899','Fernanda Lima','71988887777'),
('77788899900','Marcelo Pereira','81988887777'),
('88899900011','Patrícia Gomes','91988887777'),
('99900011122','Lucas Rocha','11912345678'),
('11100099988','Camila Duarte','11987654321'),
('22211133344','Roberto Nunes','11933334444'),
('33322244455','Beatriz Mendes','11922223333'),
('44433355566','André Carvalho','11911112222');

-- ========================================
-- Médicos (10)
-- ========================================
INSERT INTO Medicos (crm, nome, especialidade, contato) VALUES
('SP12345678','Dr. Paulo Henrique','Cardiologia','11911112222'),
('SP23456789','Dra. Marina Castro','Clínica Geral','11922223333'),
('SP34567890','Dr. João Pedro','Neurologia','11933334444'),
('SP45678901','Dra. Carla Nogueira','Pediatria','11944445555'),
('SP56789012','Dr. Felipe Ramos','Psiquiatria','11955556666'),
('SP67890123','Dra. Amanda Faria','Ginecologia','11966667777'),
('SP78901234','Dr. Bruno Torres','Dermatologia','11977778888'),
('SP89012345','Dra. Larissa Prado','Ortopedia','11988889999'),
('SP90123456','Dr. Eduardo Lins','Endocrinologia','11999990000'),
('SP01234567','Dra. Patrícia Matos','Reumatologia','11900001111');

-- ========================================
-- Funcionários (10)
-- ========================================
INSERT INTO Funcionarios (nome, cargo, turno) VALUES
('Felipe Andrade','Atendente','manhã'),
('Carla Souza','Atendente','tarde'),
('Renato Lima','Atendente','noite'),
('Fernanda Moreira','Farmacêutica','manhã'),
('Julio César','Farmacêutico','tarde'),
('Patrícia Vieira','Farmacêutica','noite'),
('Rodrigo Martins','Gerente','manhã'),
('Luciana Ferreira','Caixa','tarde'),
('Rafael Gomes','Caixa','noite'),
('Aline Santos','Atendente','manhã');

-- ========================================
-- Estoque (25 lotes)
-- ========================================
INSERT INTO Estoque (codigo_medicamento, quantidade, lote, validade_lote, data_entrada) VALUES
(1,50,'L001','2025-04-15','2024-01-10'),
(2,5,'L002','2024-10-01','2024-01-12'),
(3,30,'L003','2025-07-10','2024-02-05'),
(4,12,'L004','2024-11-01','2024-02-15'),
(5,8,'L005','2024-12-01','2024-03-01'),
(6,100,'L006','2025-06-30','2024-03-05'),
(7,20,'L007','2025-09-05','2024-03-12'),
(8,60,'L008','2025-04-25','2024-03-20'),
(9,70,'L009','2025-07-18','2024-03-25'),
(10,15,'L010','2025-10-02','2024-03-30'),
(11,9,'L011','2025-12-01','2024-04-05'),
(12,25,'L012','2025-07-01','2024-04-10'),
(13,10,'L013','2024-10-20','2024-04-15'),
(14,7,'L014','2024-11-30','2024-04-20'),
(15,6,'L015','2024-09-15','2024-04-25'),
(16,40,'L016','2025-12-31','2024-05-01'),
(17,12,'L017','2025-05-12','2024-05-10'),
(18,18,'L018','2025-08-01','2024-05-15'),
(19,4,'L019','2024-12-20','2024-05-20'),
(20,50,'L020','2025-01-15','2024-05-25'),
(1,20,'L021','2024-10-01','2024-06-01'),
(4,5,'L022','2024-09-10','2024-06-10'),
(5,3,'L023','2024-08-15','2024-06-15'),
(14,2,'L024','2024-09-25','2024-06-20'),
(15,1,'L025','2024-07-01','2024-06-25');

-- ========================================
-- Receitas Médicas (10 exemplos)
-- ========================================
INSERT INTO Receitas_Medicas (cpf_cliente, crm_medico, medicamento, validade_receita, data_emissao) VALUES
('12345678901','SP56789012',4,'2024-12-31','2024-02-15'),
('98765432100','SP56789012',5,'2024-11-30','2024-03-01'),
('11122233344','SP34567890',14,'2024-12-31','2024-03-15'),
('22233344455','SP56789012',15,'2024-10-31','2024-04-01'),
('33344455566','SP56789012',20,'2025-01-15','2024-04-10'),
('44455566677','SP34567890',4,'2024-12-15','2024-05-01'),
('55566677788','SP34567890',14,'2024-12-20','2024-05-10'),
('66677788899','SP56789012',15,'2024-11-30','2024-05-20'),
('77788899900','SP56789012',20,'2025-01-15','2024-06-01'),
('88899900011','SP34567890',5,'2024-11-30','2024-06-15');

-- ========================================
-- Vendas (10 exemplos)
-- ========================================
INSERT INTO Vendas (cpf_cliente, matricula_atendente, data, valor_total, origem_venda) VALUES
('12345678901',1,'2024-05-01',80.00,'presencial'),
('98765432100',2,'2024-05-02',150.00,'online'),
('11122233344',3,'2024-05-02',200.00,'presencial'),
('22233344455',4,'2024-05-03',95.00,'presencial'),
('33344455566',5,'2024-05-04',300.00,'online'),
('44455566677',6,'2024-05-05',500.00,'presencial'),
('55566677788',7,'2024-05-06',70.00,'online'),
('66677788899',8,'2024-05-07',1200.00,'presencial'),
('77788899900',9,'2024-05-08',40.00,'presencial'),
('88899900011',10,'2024-05-09',60.00,'online');

INSERT INTO Itens_Venda (id_venda, codigo_medicamento, quantidade, valor_unitario) VALUES
(1,1,2,12.50),(1,2,5,8.90),
(2,4,2,45.00),(2,6,3,18.00),
(3,5,2,38.00),(3,7,4,30.00),
(4,8,1,22.00),(4,9,3,28.00),
(5,10,5,60.00),
(6,4,10,45.00),(6,14,3,55.00),
(7,3,2,25.00),(7,11,3,15.00),
(8,15,10,48.00),(8,20,5,32.00),
(9,16,4,10.00),
(10,12,2,12.00);

INSERT INTO Pagamentos (id_venda, forma, status) VALUES
(1,'dinheiro','pago'),
(2,'cartão','pago'),
(3,'pix','pago'),
(4,'dinheiro','pago'),
(5,'cartão','pago'),
(6,'dinheiro','pago'),
(7,'pix','pendente'),
(8,'cartão','pago'),
(9,'dinheiro','pago'),
(10,'pix','pago');

-- Vendas recentes
INSERT INTO Vendas (cpf_cliente, matricula_atendente, data, valor_total, origem_venda) 
VALUES 
('12345678901', 1, CURDATE() - INTERVAL 10 DAY, 50.00, 'presencial'),
('98765432100', 2, CURDATE() - INTERVAL 5 DAY, 200.00, 'online');