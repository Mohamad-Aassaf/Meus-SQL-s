CREATE TABLE funcionario (
    cod_func INTEGER PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL UNIQUE,
    dt_nasc DATE, NOT NULL,
    salario DOUBLE NOT NULL
);

CREATE TABLE departamento (
    id_dep INTEGER PRIMARY KEY AUTO_INCREMENT,
    nome_dep VARCHAR(200) NOT NULL,
);

INSERT INTO funcionario VALUES (
    NULL,'Alexandre', '1985/06/21', 20000, 1
);

INSERT INTO funcionario(nome, dt_nasc, salario, departamento) VALUES (
    'Paulo Kogos', '1970/05/05', 10000, 2
);
INSERT INTO funcionario(nome, dt_nasc, salario, departamento) VALUES (
    'Veronica', '1980/08/12', 12000, 3
);
INSERT INTO funcionario(nome, dt_nasc, salario, departamento) VALUES (
    'Gordo do Agendao', '1980/04/18', 13000, 1
);

UPDATE INTO funcionario(departamento) VALUES ('RH') WHERE nome = 'Alexandre';
UPDATE INTO funcionario(departamento) VALUES ('Vendas') WHERE nome = 'Paulo Kogos';
INSERT INTO funcionario(departamento) VALUES ('Financeiro') WHERE nome = 'Verônica';

UPDATE funcionario SET salario = salario * 1.15;
UPDATE funcionario SET salario = salario * 0.90;
UPDATE funcionario SET nome = 'Verônica' WHERE nome 'Veronica';
UPDATE funcionario SET nome = 'Gordo do Agendão' WHERE nome 'Gordo do Agendao';

UPDATE funcionario SET salario = salario * 0.90 WHERE nome = 'Gordo do Agendão' 
AND id_dep = (
    SELECT id FROM departamento WHERE nome = 'RH');

SELECT * FROM funcionario;
SELECT * FROM funcionario WHERE nome = 'Paulo Kogos';
SELECT * FROM funcionario WHERE departamento = 1;
DELETE FROM funcionario WHERE nome = 'Gordo do Agendão';