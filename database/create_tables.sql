-- Projeto: Rede de Farmácias — Cenário 17
-- Banco de dados: MySQL 8.0+

CREATE DATABASE IF NOT EXISTS farmacia;
USE farmacia;

CREATE TABLE fabricantes (
    id_fabricante INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE medicamentos (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    principio_ativo VARCHAR(150),
    concentracao VARCHAR(60),
    id_fabricante INT NOT NULL,
    CONSTRAINT fk_medicamento_fabricante
        FOREIGN KEY (id_fabricante)
        REFERENCES fabricantes(id_fabricante),
    INDEX idx_medicamento_nome (nome)
);

CREATE TABLE lotes (
    id_lote INT AUTO_INCREMENT PRIMARY KEY,
    codigo_lote VARCHAR(60) NOT NULL,
    id_medicamento INT NOT NULL,
    data_validade DATE NOT NULL,
    quantidade_disponivel INT NOT NULL DEFAULT 0,
    CONSTRAINT uq_lote_medicamento UNIQUE (codigo_lote, id_medicamento),
    CONSTRAINT chk_lote_quantidade CHECK (quantidade_disponivel >= 0),
    CONSTRAINT fk_lote_medicamento
        FOREIGN KEY (id_medicamento)
        REFERENCES medicamentos(id_medicamento),
    INDEX idx_lote_validade (data_validade)
);

CREATE TABLE vendas (
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE itens_venda (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    id_venda INT NOT NULL,
    id_lote INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    CONSTRAINT chk_item_quantidade CHECK (quantidade > 0),
    CONSTRAINT chk_item_preco CHECK (preco_unitario >= 0),
    CONSTRAINT fk_item_venda
        FOREIGN KEY (id_venda)
        REFERENCES vendas(id_venda),
    CONSTRAINT fk_item_lote
        FOREIGN KEY (id_lote)
        REFERENCES lotes(id_lote),
    INDEX idx_item_venda (id_venda),
    INDEX idx_item_lote (id_lote)
);
