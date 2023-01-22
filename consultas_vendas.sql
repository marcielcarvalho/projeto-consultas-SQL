
-- 1 - Qual o total de vendas realizadas.
SELECT 
	SUM(v.venda) AS total_de_vendas
FROM vendas v;


-- 2 - Qual o valor total de vendas realizadas por cada vendedor.
SELECT 
	f.id_funcionario, 
    f.nome, 
    SUM(v.venda) AS total_vendas_por_vendedor
FROM funcionarios f 
INNER JOIN vendas v 
	ON f.id_funcionario = v.id_funcionario 
GROUP BY f.id_funcionario
ORDER BY total_vendas_por_vendedor DESC;
    
    
-- 3 - Quem vendeu mais? Quem vendeu menos?
-- Vendedor que mais vendeu
SELECT 
	f.id_funcionario, 
    f.nome, 
    SUM(v.venda) AS total_vendas_por_vendedor 
FROM funcionarios f 
INNER JOIN vendas v 
	ON f.id_funcionario = v.id_funcionario 
GROUP BY f.id_funcionario
ORDER BY total_vendas_por_vendedor DESC
LIMIT 1;


-- Vendedor que menos vendeu
SELECT 
	f.id_funcionario, 
    f.nome, 
    SUM(v.venda) AS total_vendas_por_vendedor 
FROM funcionarios f 
INNER JOIN vendas v 
	ON f.id_funcionario = v.id_funcionario 
GROUP BY f.id_funcionario
ORDER BY total_vendas_por_vendedor ASC
LIMIT 1;


-- 4 - Qual o valor médio de vendas por vendedor?
WITH T AS (
	SELECT
		COUNT(DISTINCT(v.id_funcionario)) AS total_de_vendedores,
		SUM(v.venda) AS total_de_vendas
	FROM vendas v
)
SELECT
	*,
	total_de_vendas/total_de_vendedores AS media_de_vendas_por_vendedores
FROM T;


-- 5 - Qual o total de vendas realizadas por categoria?
SELECT 
    c.nome_categoria, 
    SUM(v.venda) AS total_vendas_por_categoria 
FROM categorias c
INNER JOIN vendas v 
	ON c.id_categoria = v.id_categoria 
GROUP BY c.nome_categoria
ORDER BY total_vendas_por_categoria DESC;


-- 6 - Qual categoria vendeu mais? Qual categoria vendeu menos?
-- Mais vendida
SELECT
	c.nome_categoria, 
	SUM(v.venda) AS total_vendas_por_categoria
FROM categorias c
INNER JOIN vendas v 
	ON c.id_categoria = v.id_categoria 
GROUP BY c.nome_categoria
ORDER BY total_vendas_por_categoria DESC
limit 1;

-- Menos vendida
SELECT 
	c.nome_categoria, 
	SUM(venda) AS total_vendas_por_categoria
FROM categorias c
INNER JOIN vendas v 
	ON c.id_categoria = v.id_categoria 
GROUP BY c.nome_categoria
ORDER BY total_vendas_por_categoria ASC
limit 1;
