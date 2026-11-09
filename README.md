# Análise de Vendas com SQL: AdventureWorks2017

Análise de vendas respondendo perguntas de negócio com SQL Server, do SELECT básico a consultas com JOINs, funções de janela e CTEs. Cada pergunta traz o contexto de negócio, a query, o resultado e uma leitura do que ele mostra.

**Stack:** SQL Server · SSMS · AdventureWorks2017
**Status:** Nível 1 concluído · Níveis 2 a 5 planejados

## Níveis

| Nível | Conteúdo | Arquivo | Status |
|-------|----------|---------|--------|
| 1 | SELECT, WHERE, ORDER BY, TOP, DISTINCT, COUNT | [`nivel1.sql`](https://github.com/rafaeldecastro195/adventureworks-analise-de-vendas-sql/blob/main/sql/n1/nivel1.sql) | Concluído |
| 2 | COUNT, SUM, AVG, GROUP BY, HAVING | `nivel2.sql` | Planejado |
| 3 | INNER JOIN com 2 tabelas | `nivel3.sql` | Planejado |
| 4 | INNER JOIN com 3 ou mais tabelas e agregações | `nivel4.sql` | Planejado |
| 5 | LEFT JOIN, CTE, funções de janela | `nivel5.sql` | Planejado |

## Como reproduzir

1. Baixe e restaure o banco [`AdventureWorks2017`](https://learn.microsoft.com/pt-br/sql/samples/adventureworks-install-configure?view=sql-server-ver17&tabs=ssms) no SQL Server.
2. Abra os arquivos da pasta `sql/` no SSMS e execute as queries.
3. Os nomes de tabelas seguem o padrão `Schema.Tabela` (por exemplo, `Sales.SalesOrderHeader`).

O arquivo de backup do banco não está neste repositório.

---

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

![Resultado da pergunta 1](img/nivel1/p01_resultado.png)

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

![Resultado da pergunta 2](img/nivel1/p02_resultado.png)

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

## Próximos passos

- Nível 2: agregações por ano, canal de venda e cliente.
- Níveis 3 e 4: JOINs entre pedidos, produtos, categorias e clientes.
- Nível 5: LEFT JOIN, CTE e funções de janela.
- Projeto maior, com banco próprio, API e dashboards, em desenvolvimento em outro repositório.

## Sobre mim

Rafael Moreira Arantes de Castro · Estudante de Sistemas de Informação (PUC Minas) · [PREENCHER: link do LinkedIn]
