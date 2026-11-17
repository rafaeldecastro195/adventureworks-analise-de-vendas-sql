/* Nível 3: INNER JOIN com 2 tabelas */
/* ----------------------------------------------- */

/* Pergunta 1: Quais produtos pertencem a cada subcategoria? */
SELECT 
	s.Name AS Subcategoria,
	p.Name AS Produto
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS s 
	ON p.ProductSubcategoryID = s.ProductSubcategoryID
ORDER BY s.Name, p.Name ASC;

/* Pergunta 2: Quais os valores médio, mínimo e máximo dos produtos de cada subcategoria e qual o total de produtos? 
	Observação 1: produtos com preço de lista igual a zero (não vendidos separadamente) são desconsiderados.
    No AdventureWorks2017 nenhum produto com subcategoria tem preço zero, então o filtro é preventivo e não altera o resultado atual.
    Observação 2: Considerar apenas subcategorias com mais de 1 produto para fins de comparação entre os valores mínimo, máximo e médio */
SELECT
	s.Name AS Subcategoria,
	AVG(p.ListPrice) AS ValorMedio,
	MIN(p.ListPrice) AS ValorMinimo,
	MAX(p.ListPrice) AS ValorMaximo,
	COUNT(p.ProductID) AS QuantidadeProdutos
FROM Production.Product AS p
INNER JOIN Production.ProductSubcategory AS s
	ON p.ProductSubcategoryID = s.ProductSubcategoryID
WHERE p.ListPrice > 0.00
GROUP BY s.Name
HAVING COUNT(p.ProductID) > 1
ORDER BY QuantidadeProdutos DESC;

/* Conferindo se há produtos com valor de tabela 0. Resposta: não há. */
SELECT COUNT(*) AS ProdutosComPrecoZero
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL
	AND ListPrice = 0.00;

/* Pergunta 3: Qual o total de impostos e frete cobrados em cada território de vendas, e qual o percentual do faturamento líquido sobre o bruto?
   Observação: faturamento bruto = valor total do pedido, incluindo impostos e frete (TotalDue);
   faturamento líquido = valor dos produtos, sem impostos e frete (SubTotal).
   O termo "líquido" aqui se refere apenas à retirada de impostos e frete, pois a tabela não traz devoluções.
   O percentual indica qual parte do valor cobrado corresponde aos produtos. */

SELECT 
	t.TerritoryID AS IdTerritorio,
	t.Name AS NomeTerritorio,
	SUM(o.SubTotal) AS FaturamentoLiquido,
	SUM(o.TotalDue) AS FaturamentoBruto,
	SUM(o.TotalDue) - SUM(o.SubTotal) AS ValorImpostoFrete,
	ROUND(SUM(o.SubTotal) * 100 / SUM(o.TotalDue), 2) AS PercentualLiquidoBruto
FROM Sales.SalesTerritory AS t
INNER JOIN Sales.SalesOrderHeader AS o
	ON t.TerritoryID = o.TerritoryID
GROUP BY t.TerritoryID, t.Name
ORDER BY IdTerritorio ASC;

-- Conclusão: impostos e frete representam de 9,11% a 11,17% do faturamento bruto, conforme o território.

/* Pergunta 4: Quais são os 10 produtos mais vendidos em quantidade?
   Observação: quantidade = soma das unidades vendidas (OrderQty) em todos os pedidos.
   Não há empate na 10ª posição, então o TOP 10 devolve o ranking completo. */
SELECT TOP 10 
	p.ProductID AS IdProduto,
	p.Name AS Produto,
	SUM(d.OrderQty) AS Quantidade
FROM Production.Product AS p
INNER JOIN Sales.SalesOrderDetail AS d
	ON p.ProductID = d.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY Quantidade DESC;