DROP DATABASE partido;
CREATE DATABASE partido;
USE partido;

CREATE TABLE membro ( -- membros do partido
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    cpf VARCHAR(14) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(25),
    endereco VARCHAR(300),
    data_filiacao DATE NOT NULL
);

CREATE TABLE candidato ( -- canditados a algum cargo público
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    id_membro BIGINT NOT NULL,
    cargo_disputado VARCHAR(100) NOT NULL,
    ano_eleicao BIGINT NOT NULL,
    resultado VARCHAR(20),
    FOREIGN KEY (id_membro) REFERENCES membro(id)
);

CREATE TABLE doacao ( -- doacoes recebidas pelo partido
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    id_membro BIGINT NOT NULL,
    valor DOUBLE NOT NULL,
    data_doacao DATE NOT NULL,
    FOREIGN KEY (id_membro) REFERENCES membro(id)
);

CREATE TABLE campanha ( -- informações sobre campanhas dos candidatos
	id BIGINT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_candidato BIGINT NOT NULL,
    descricao_canditato TEXT NOT NULL,
    propostas TEXT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    valor_total DOUBLE NOT NULL,
    FOREIGN KEY (id_candidato) REFERENCES candidato(id)
);

INSERT INTO membro
		VALUES (NULL, 'Paulo Maluf', 'Nenhum', '056.472.100-01', 'PauloMaluf@hotmail.com',
        '99743-7404', 'Brasília', '2024-08-25');
        
SELECT * FROM membro;
SELECT * FROM candidato;