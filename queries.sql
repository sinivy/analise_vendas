/* FATURAMENTO TOTAL */

SELECT 
    p.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC;

/* TOP 5 PRODUTOS MAIS VENDIDOS */
SELECT 
    p.nome,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.id
GROUP BY p.nome
ORDER BY total_vendido DESC
LIMIT 5;

/* VENDAS POR MÊS */
SELECT 
    DATE_FORMAT(pe.data, '%Y-%m') AS mes,
    SUM(i.quantidade) AS total_vendido
FROM itens_pedido i
JOIN pedidos pe ON i.pedido_id = pe.id
GROUP BY mes
ORDER BY mes;

/* FATURAMENTO POR MÊS */
SELECT 
    DATE_FORMAT(pe.data, '%Y-%m') AS mes,
    SUM(i.quantidade * p.preco) AS faturamento
FROM itens_pedido i
JOIN pedidos pe ON i.pedido_id = pe.id
JOIN produtos p ON i.produto_id = p.id
GROUP BY mes
ORDER BY mes;

/* PRODUTO MAIS VENDIDO POR MÊS */
SELECT 
    mes,
    nome,
    total_vendido
FROM (
    SELECT 
        DATE_FORMAT(pe.data, '%Y-%m') AS mes,
        p.nome,
        SUM(i.quantidade) AS total_vendido,
        RANK() OVER (PARTITION BY DATE_FORMAT(pe.data, '%Y-%m') 
                     ORDER BY SUM(i.quantidade) DESC) AS ranking
    FROM itens_pedido i
    JOIN pedidos pe ON i.pedido_id = pe.id
    JOIN produtos p ON i.produto_id = p.id
    GROUP BY mes, p.nome
) AS sub
WHERE ranking = 1;

/* FATURAMENTO POR PRODUTO */
SELECT 
    p.nome,
    SUM(i.quantidade * p.preco) AS faturamento
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.id
GROUP BY p.nome
ORDER BY faturamento DESC;

/* LUCRO POR PRODUTO */
SELECT 
    p.nome,
    SUM(i.quantidade * (p.preco - p.custo)) AS lucro
FROM itens_pedido i
JOIN produtos p ON i.produto_id = p.id
GROUP BY p.nome
ORDER BY lucro DESC;