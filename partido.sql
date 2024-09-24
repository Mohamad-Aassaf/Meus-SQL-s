DROP DATABASE partido;
CREATE DATABASE partido;
USE partido;

CREATE TABLE membro ( -- membros do partido
	id BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(100),
    cpf VARCHAR(16) NOT NULL,
    email VARCHAR(100),
    telefone VARCHAR(20),
    endereco VARCHAR(300),
    data_filiacao DATE NOT NULL
);

CREATE TABLE candidato ( -- canditados a algum cargo público
	id_candidato BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    id_membro BIGINT,
    cargo_disputado VARCHAR(100) NOT NULL,
    ano_eleicao BIGINT NOT NULL,
    resultado VARCHAR(20),
    FOREIGN KEY (id_membro) REFERENCES membro(id)
);

CREATE TABLE doacao ( -- doacoes recebidas pelo partido
	id_doacao BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    id_membro INT,
    valor DOUBLE NOT NULL,
    data_doacao DATE NOT NULL,
    FOREIGN KEY (id_membro) REFERENCES membro(id)
);