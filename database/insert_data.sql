-- Dados fictícios para testar o banco
USE farmacia;

INSERT INTO fabricantes (nome) VALUES
('Laboratório Alfa'),
('Laboratório Bem-Estar');

INSERT INTO medicamentos
(nome, principio_ativo, concentracao, id_fabricante) VALUES
('Analgésico X', 'Paracetamol', '500 mg', 1),
('Antialérgico Y', 'Loratadina', '10 mg', 2),
('Antiácido Z', 'Omeprazol', '20 mg', 1);

INSERT INTO lotes
(codigo_lote, id_medicamento, data_validade, quantidade_disponivel) VALUES
('AX-2026-01', 1, '2027-06-30', 120),
('AX-2026-02', 1, '2027-12-31', 80),
('AY-2026-01', 2, '2027-03-31', 60),
('AZ-2026-01', 3, '2028-01-31', 90);

INSERT INTO vendas (data_hora) VALUES
('2026-11-20 10:30:00'),
('2026-11-21 14:15:00');

INSERT INTO itens_venda
(id_venda, id_lote, quantidade, preco_unitario) VALUES
(1, 1, 2, 8.50),
(1, 3, 1, 12.00),
(2, 2, 3, 8.50);
