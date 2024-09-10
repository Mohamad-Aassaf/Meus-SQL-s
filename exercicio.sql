DROP DATABASE bd_loja;
CREATE DATABASE bd_loja;
USE bd_loja;

CREATE TABLE categoria (
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    descricao_categoria VARCHAR(300) NOT NULL
);

CREATE TABLE marca (
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nome_marca VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE unidade (
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    descricao_unidade VARCHAR(300) NOT NULL
);

CREATE TABLE produto (
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    descricao_produto VARCHAR(300) NOT NULL,
    preco_custo DOUBLE NOT NULL,
    preco_venda DOUBLE NOT NULL,
    quantiade_estoque INT NOT NULL,
    quantidade_minima INT NOT NULL,
    id_categoria BIGINT NOT NULL,
    id_marca BIGINT NOT NULL,
    id_unidade BIGINT NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id),
    FOREIGN KEY (id_marca) REFERENCES marca(id),
    FOREIGN KEY (id_unidade) REFERENCES unidade(id)
);

-- INSERTS NA CATEGORIA
INSERT INTO categoria (descricao_categoria) -- Não precisa colocar ID pois o auto increment já faz isso
	VALUES ('Tênis de Mesa');
INSERT INTO categoria (descricao_categoria) 
	VALUES ('Tênis');
INSERT INTO categoria (descricao_categoria) 
	VALUES ('Futebol');
INSERT INTO categoria (descricao_categoria) 
	VALUES ('Natação');
INSERT INTO categoria (descricao_categoria) 
	VALUES ('Basquete');
INSERT INTO categoria (descricao_categoria) 
	VALUES ('Paddle');

-- INSERTS NA MARCA
INSERT INTO marca (nome_marca)
	VALUES ('Butterfly');
INSERT INTO marca (nome_marca)
	VALUES ('Spalding');
INSERT INTO marca (nome_marca)
	VALUES ('Adidas');
INSERT INTO marca (nome_marca)
	VALUES ('Nike');
INSERT INTO marca (nome_marca)
	VALUES ('Speedy');
INSERT INTO marca (nome_marca)
	VALUES ('Wilson');

-- INSERTS NA UNIDADE
INSERT INTO unidade (descricao_unidade)
	VALUES ('Par');
INSERT INTO unidade (descricao_unidade)
	VALUES ('Gramas');
INSERT INTO unidade (descricao_unidade)
	VALUES ('Caixa');
INSERT INTO unidade (descricao_unidade)
	VALUES ('Cartela');
INSERT INTO unidade (descricao_unidade)
	VALUES ('Dúzia');
INSERT INTO unidade (descricao_unidade)
	VALUES ('Unidade');

