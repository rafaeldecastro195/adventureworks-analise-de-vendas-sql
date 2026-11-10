## Nível 1: SELECT básico

Arquivo completo: [`sql/01_nivel1_select_basico.sql`](sql/01_nivel1_select_basico.sql)

### 1. Quais são os 10 produtos mais caros do catálogo?

**Contexto:** conhecer os produtos de maior preço de lista para avaliar posicionamento de mercado.

**Query:**

```sql
SELECT TOP 10 ProductID, Name, ListPrice
FROM Production.Product
ORDER BY ListPrice DESC;
```

**Resultado:**

![Resultado da pergunta 1](../img/n1/p1_n1.png)

**Insight:** [PREENCHER: 2 ou 3 frases. O que os produtos do topo têm em comum? Qual a faixa de preço? Use os números reais do resultado.]

Esta pergunta tem um gancho para os níveis seguintes: cruzar esses produtos com as vendas (`SalesOrderDetail`) para ver se os mais caros também vendem bem.

---

### 2. Quais cores de produto existem no catálogo?

**Contexto:** conhecer as cores disponíveis é o primeiro passo para analisar vendas por cor.

**Query:**

```sql
SELECT DISTINCT Color
FROM Production.Product
ORDER BY Color;
```

**Resultado:**

![Resultado da pergunta 2](img/n1/p2_n1.png)

**Insight:** [PREENCHER: quantas cores existem? O `NULL` (produto sem cor definida) aparece primeiro na ordenação.]

---

### 3. Quais pedidos de 2013 tiveram valor total acima de 10 mil?

**Contexto:** identificar os pedidos de maior valor do ano para entender onde o faturamento se concentra.

**Query:**

```sql
SELECT SalesOrderID, OrderDate, CustomerID, TotalDue
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01'
  AND OrderDate <  '2014-01-01'
  AND TotalDue > 10000
ORDER BY TotalDue DESC;
```

**Resultado:**

![Resultado da pergunta 3](img/nivel1/p03_resultado.png)

**Insight:** [PREENCHER: quantas linhas voltaram? Qual o maior valor? Há algum cliente que se repete?]

**Nota técnica:** o filtro de data usa `>=` e `<` (o dia 1º do ano seguinte como limite) em vez de `BETWEEN`. Assim nenhum pedido feito durante o último dia do ano fica de fora, mesmo que o campo tenha horário.

---

### 3.1. Quantos pedidos de 2013 tiveram valor total acima de 10 mil?

**Contexto:** dimensionar quantos pedidos de alto valor houve em 2013, complementando a lista da pergunta 3.

**Query:**

```sql
SELECT COUNT(*) AS QtdPedidosAcima10Mil
FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2013-01-01'
  AND OrderDate <  '2014-01-01'
  AND TotalDue > 10000;
```

**Resultado:**

![Resultado da pergunta 3.1](img/nivel1/p03_1_resultado.png)

**Insight:** [PREENCHER: a contagem bate com o número de linhas da pergunta 3? Esse total é grande ou pequeno perto do total de pedidos do ano? (essa comparação fica mais fácil no nível 2)]

---

## Notas sobre os dados

- `Color` tem valores `NULL`, que significam produto sem cor definida.
- A coluna `Status` de `Sales.SalesOrderHeader` tem um único valor distinto na base, então não foi usada nas análises.
- [PREENCHER: outras observações que surgirem ao rodar as queries.]
