/* Nível 1: SELECT, WHERE, ORDER BY, TOP, DISTINCT */
/* ----------------------------------------------- */

/* Pergunta 1: Quais são os 10 produtos mais caros do catálogo? */
-- Contexto: conhecer os produtos de maior preço de lista para avaliar posicionamento de mercado.
-- Gancho: cruzar depois com as vendas (JOIN com SalesOrderDetail) para ver se vendem bem.
SELECT TOP 10 ProductID, Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;

/* Pergunta 2: Quais cores de produto existem no catálogo? */
-- Contexto: conhecer as cores disponíveis é o primeiro passo para analisar vendas por cor.
-- NULL = produto sem cor definida (aparece primeiro na ordenação).
SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color;

/* Pergunta 3: Quais pedidos de 2013 tiveram valor total acima de 10mil? */
-- Contexto: identificar os pedidos de maior valor do ano para entender onde o faturamento se concentra.
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01' 
 AND OrderDate < '2014-01-01' 
 AND TotalDue > 10000
ORDER BY TotalDue DESC;

/* Pergunta 3.1.: Qual o total de pedidos feitos em 2013 que tiveram valor total acima de 10 mil? */
-- Contexto: dimensionar quantos pedidos de alto valor houve em 2013, complementando a lista da pergunta 3.
SELECT COUNT(*) AS QtdPedidosAcima10Mil
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01' 
 AND OrderDate < '2014-01-01' 
 AND TotalDue > 10000;


