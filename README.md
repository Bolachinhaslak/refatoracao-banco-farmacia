# Refatoração de Banco de Dados — Rede de Farmácias

## Cenário 17
O controle de estoque armazenava apenas a quantidade total dos medicamentos, sem separar lotes e datas de validade. Além disso, o nome do fabricante era repetido em cada venda no balcão.

## Objetivo
Organizar os dados para controlar os medicamentos por fabricante e por lote, registrar vendas e reduzir informações repetidas.

## Estrutura do projeto
- `database/create_tables.sql`: criação das tabelas, chaves e índices.
- `database/insert_data.sql`: dados fictícios para testar o banco.
- `database/queries.sql`: consultas para estoque, validade e vendas.
- `docs/relatorio_sprint.md`: modelo de relatório da sprint.

## Modelo de dados
- **fabricantes**: guarda cada fabricante uma única vez.
- **medicamentos**: guarda os medicamentos e referencia seu fabricante.
- **lotes**: guarda o lote, a validade e a quantidade disponível de cada medicamento.
- **vendas**: registra cada venda.
- **itens_venda**: registra os lotes e as quantidades vendidos em cada venda.

O fabricante não precisa ser repetido na venda: ele pode ser identificado pelo relacionamento entre `itens_venda`, `lotes`, `medicamentos` e `fabricantes`.

## Como executar
Os scripts foram escritos para **MySQL 8.0 ou superior**.

1. Abra o MySQL Workbench ou outro programa compatível.
2. Execute `database/create_tables.sql`.
3. Execute `database/insert_data.sql`.
4. Execute as consultas de `database/queries.sql`.

> Os dados inseridos são fictícios e servem apenas para demonstração escolar.

## Organização sugerida no GitHub
- Branch `main`: versão principal.
- Branch `estrutura-banco`: criação das tabelas.
- Branch `dados-e-consultas`: inserções e consultas.

Cada integrante deve fazer alterações e commits em sua própria branch. Depois, deve abrir um Pull Request para a branch `main`, e o colega deve revisar antes da integração.
