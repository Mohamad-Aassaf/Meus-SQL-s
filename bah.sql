CREATE TABLE funcionario (
    cod_func INTEGER NOT NULL UNIQUE INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    dt_nasc DATE, NOT NULL,
    salario DOUBLE NOT NULL
);

INSERT INTO funcionario VALUES (
    NULL,'Alexandre', '1985/06/21', 20000
);

INSERT INTO funcionario(nome, dt_nasc, salario) VALUES (
    'Paulo Kogos', '1970/05/05', 10000
);

UPDATE funcionario SET salario = 15000;
DELETE FROM funcionario 