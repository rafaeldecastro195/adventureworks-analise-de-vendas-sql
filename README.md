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

## Próximos passos

- Nível 2: agregações por ano, canal de venda e cliente.
- Níveis 3 e 4: JOINs entre pedidos, produtos, categorias e clientes.
- Nível 5: LEFT JOIN, CTE e funções de janela.
- Projeto maior, com banco próprio, API e dashboards, em desenvolvimento em outro repositório.

## Sobre mim

Rafael Moreira Arantes de Castro · Estudante de Sistemas de Informação (PUC Minas) · [Acesse meu perfil do LinkedIn](https://www.linkedin.com/in/rafael-de-castro-253b21277/)
