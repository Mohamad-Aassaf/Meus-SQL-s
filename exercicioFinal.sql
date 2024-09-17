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
    desc_produto VARCHAR(300) NOT NULL,
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

-- INSERTS NO PRODUTO
INSERT INTO produto ()
	VALUES (NULL, 'Camisa Grêmio', 100.00, 179.90, 50, 10, 3, 4, 6);
INSERT INTO produto ()
	VALUES (NULL, 'Bola de Tênis de Mesa 40mm', 8.59, 15.50, 100, 5, 1, 1, 5);
INSERT INTO produto ()
	VALUES (NULL, 'Camisa Chelsea', 100.00, 169.90, 2, 4, 3, 3, 6);
INSERT INTO produto ()
	VALUES (NULL, 'Raquete de Tênis', 250.00, 420.00, 5, 3, 2, 6, 6);
INSERT INTO produto ()
	VALUES (NULL, 'Chuteira de Futebol', 89.90, 159.50, 20, 5, 3, 4, 1);
INSERT INTO produto ()
	VALUES (NULL, 'Bola de Basquete', 59.90, 129.90, 15, 10, 5, 2, 6);
INSERT INTO produto ()
	VALUES (NULL, 'Óculos de Natação', 29.90, 59.90, 3, 5, 4, 5, 6);
    
ALTER TABLE produto CHANGE desc_produto descricao_produto VARCHAR(300) NOT NULL;
ALTER TABLE unidade ADD COLUMN sigla_unidade VARCHAR(10);
ALTER TABLE unidade DROP COLUMN sigla_unidade;

UPDATE produto SET preco_venda = preco_venda * 1.05; 
UPDATE produto SET preco_custo = preco_custo * 1.05;
UPDATE produto SET preco_venda = preco_venda * 0.75; 
UPDATE produto SET preco_custo = preco_custo * 0.75;

DELETE FROM produto;

UPDATE produto SET preco_venda = preco_venda * 1.05 WHERE id_marca = (
	SELECT id
    FROM marca
    WHERE nome_marca = 'Nike'
);