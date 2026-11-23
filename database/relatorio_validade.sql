-- Relatorio de medicamentos proximos do vencimento
USE farmacia;

SELECT
    m.nome AS medicamento,
    l.codigo_lote,
    l.data_validade,
    l.quantidade_disponivel
FROM lotes l
JOIN medicamentos m
    ON m.id_medicamento = l.id_medicamento
WHERE l.data_validade BETWEEN CURDATE()
    AND DATE_ADD(CURDATE(), INTERVAL 90 DAY)
ORDER BY l.data_validade ASC;
