-- Relatorio de estoque dos medicamentos
USE farmacia;

SELECT
    m.nome AS medicamento,
    SUM(l.quantidade_disponivel) AS quantidade_total,
    CASE
        WHEN SUM(l.quantidade_disponivel) = 0
            THEN 'Sem estoque'
        WHEN SUM(l.quantidade_disponivel) < 50
            THEN 'Estoque baixo'
        ELSE 'Estoque normal'
    END AS situacao
FROM medicamentos m
LEFT JOIN lotes l
    ON m.id_medicamento = l.id_medicamento
GROUP BY m.id_medicamento, m.nome
ORDER BY m.nome;
