# Relatório da Sprint — Rede de Farmácias (Cenário 17)

**Integrantes:** preencher com os nomes da dupla  
**Data:** preencher

## 1. Problemas encontrados
- O estoque era registrado apenas pela quantidade total, sem separar os lotes.
- Não havia controle adequado das datas de validade de cada lote.
- O nome do fabricante era repetido nas vendas, causando redundância e risco de divergência.

## 2. Soluções aplicadas
- Criamos a tabela `fabricantes` para cadastrar cada fabricante uma única vez.
- Criamos a tabela `medicamentos`, relacionada ao fabricante por chave estrangeira.
- Criamos a tabela `lotes`, com código, validade e quantidade disponível.
- Separamos `vendas` de `itens_venda`, permitindo que uma venda tenha vários itens.
- Utilizamos chaves primárias, chaves estrangeiras e índices para organizar os relacionamentos e apoiar consultas.

## 3. Organização do trabalho
**Product Owner / Revisor:** preencher nome.  
**Scrum Master / Desenvolvedor:** preencher nome.  
**Branches e Pull Requests:** registrar aqui quais branches foram criadas e quem revisou cada Pull Request.

## 4. Retrospectiva da dupla
**O que funcionou bem:** preencher com a experiência real da dupla.  
**O que foi difícil:** preencher com as dificuldades reais.  
**O que melhoraríamos na próxima sprint:** preencher com uma melhoria discutida pela dupla.

> Antes de entregar, completem os nomes, a data e a retrospectiva com o que realmente aconteceu durante o trabalho.
