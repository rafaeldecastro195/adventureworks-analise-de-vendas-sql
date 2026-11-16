/* Nível 2: agregações, GROUP BY, HAVING */
/* ----------------------------------------------- */

/* Pergunta 1: Quantos pedidos e qual o faturamento total por ano? */

SELECT 
YEAR(OrderDate) AS Ano, 
COUNT(*) AS TotalPedidos,
SUM(TotalDue) AS FaturamentoAno
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY Ano DESC;

/* Pergunta 2: Qual o ticket médio dos pedidos online versus os feitos por revendedores? */
-- Observação: Em CanalVenda, 0 significa revendedor e 1, online
SELECT
YEAR(OrderDate) AS Ano,
OnlineOrderFlag AS CanalVenda,
AVG(TotalDue) AS TicketMedio
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate), OnlineOrderFlag
ORDER BY Ano DESC;

/* Pergunta 3: Quais clientes fizeram mais de 10 pedidos? */
SELECT 
CustomerID, 
COUNT(SalesOrderID) AS QuantidadePedidos
FROM Sales.SalesOrderHeader
GROUP BY CustomerID
HAVING COUNT(SalesOrderID) > 10
ORDER BY QuantidadePedidos DESC;

/* Pergunta 4: Qual o preço de lista médio, mínimo e máximo, por cor, considerando só cores com pelo menos 5 produtos vendáveis? */
-- Observação 1: alguns dos produtos não são de fato vendidos separadamente (preço de lista = 0.00), de modo que devem ser desconsiderados
-- Observação 2: produtos sem cor definida devem ser desconsiderados

SELECT 
Color AS Cor,
AVG(ListPrice) AS PrecoMedio,
MIN(ListPrice) AS PrecoMinimo,
MAX(ListPrice) AS PrecoMaximo
FROM Production.Product
WHERE Color IS NOT NULL
AND ListPrice > 0.00
GROUP BY Color
HAVING COUNT(ProductID) >= 5
ORDER BY COUNT(ProductID) DESC;