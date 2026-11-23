-- Consultas de exemplo
USE farmacia;

-- 1. Consultar medicamentos, fabricantes e lotes
SELECT
    m.nome AS medicamento,
    f.nome AS fabricante,
    l.codigo_lote,
    l.data_validade,
    l.quantidade_disponivel
FROM lotes l
JOIN medicamentos m ON m.id_medicamento = l.id_medicamento
JOIN fabricantes f ON f.id_fabricante = m.id_fabricante
ORDER BY m.nome, l.data_validade;

-- 2. Consultar lotes vencidos
SELECT
    m.nome AS medicamento,
    l.codigo_lote,
    l.data_validade,
    l.quantidade_disponivel
FROM lotes l
JOIN medicamentos m ON m.id_medicamento = l.id_medicamento
WHERE l.data_validade < CURDATE();

-- 3. Consultar lotes que vencem nos próximos 90 dias
SELECT
    m.nome AS medicamento,
    l.codigo_lote,
    l.data_validade,
    l.quantidade_disponivel
FROM lotes l
JOIN medicamentos m ON m.id_medicamento = l.id_medicamento
WHERE l.data_validade BETWEEN CURDATE()
                          AND DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY l.data_validade;

-- 4. Somar o estoque por medicamento
SELECT
    m.nome AS medicamento,
    SUM(l.quantidade_disponivel) AS total_em_estoque
FROM medicamentos m
LEFT JOIN lotes l ON l.id_medicamento = m.id_medicamento
GROUP BY m.id_medicamento, m.nome
ORDER BY m.nome;

-- 5. Consultar os itens vendidos e o fabricante correspondente
SELECT
    v.id_venda,
    v.data_hora,
    m.nome AS medicamento,
    f.nome AS fabricante,
    l.codigo_lote,
    iv.quantidade,
    iv.preco_unitario,
    (iv.quantidade * iv.preco_unitario) AS subtotal
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.id_venda
JOIN lotes l ON l.id_lote = iv.id_lote
JOIN medicamentos m ON m.id_medicamento = l.id_medicamento
JOIN fabricantes f ON f.id_fabricante = m.id_fabricante
ORDER BY v.id_venda;
