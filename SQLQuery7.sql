CREATE DATABASE BDClinica
GO
USE BDClinica


--USE master
--DROP DATABASE BDClinica

CREATE TABLE paciente  (
num_beneficiario		INT					NOT NULL,
nome					VARCHAR(100)		NOT NULL,
logradouro				VARCHAR(200)		NOT NULL,
numero					INT					NOT NULL,
cep						CHAR(8)				NOT NULL,
complemento				VARCHAR(255)		NOT NULL,
telefone				VARCHAR(11)			NOT NULL
PRIMARY KEY(num_beneficiario)
)


CREATE TABLE especialidade(
id				INT				NOT NULL,
especialidade	VARCHAR(100)	NOT NULL
PRIMARY KEY(id)
)
GO
CREATE TABLE medico(
codigo				INT				NOT NULL,
nome				VARCHAR(100)	NOT NULL,
logradouro			VARCHAR(200)	NOT NULL,
numero				INT				NOT NULL,
cep					CHAR(8)			NOT NULL,
complemento			VARCHAR(255)	NOT NULL,
contato				VARCHAR(11)		NOT NULL,
especialidadeId		INT				NOT NULL
PRIMARY KEY(codigo)
FOREIGN KEY(especialidadeID) REFERENCES especialidade(id)
)
GO
CREATE TABLE consulta(
pacienteNum_beneficiario	INT				NOT NULL,
medicoCodigo				INT				NOT NULL,
data_hora					DATETIME		NOT NULL,
observacao					VARCHAR(256)	NOT NULL
PRIMARY KEY(data_hora)
FOREIGN KEY(pacienteNum_beneficiario) REFERENCES paciente (num_beneficiario),
FOREIGN KEY(medicoCodigo) REFERENCES medico(codigo)
)

INSERT INTO paciente VALUES (99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa',
'922229999')

INSERT INTO paciente VALUES (99902, 'Luis Ricardo', 'R. Voluntários da Pátria', 2251,
'03254010', 'Bloco B. Apro 25', 923450987)

INSERT INTO paciente VALUES (99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, '06987020',
'Apto 1208', 912348765)

INSERT INTO paciente VALUES (99904, 'José Araújo', 'R. XV de Novembro', 18, '03678000',
'Casa', '945674312')

INSERT INTO paciente VALUES (99905, 'Joana Paula', 'R. 7 de abril', 97, '01214000',
'Conjunto 3 - Apto 801', '912095674')


INSERT INTO especialidade VALUES (1, 'Otorrinolaringologista')

INSERT INTO especialidade VALUES (2, 'Urologista')

INSERT INTO especialidade VALUES (3, 'Geriatra')

INSERT INTO especialidade VALUES (4, 'Pediatra')


INSERT INTO medico VALUES (100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa',
'915689456', 1)

INSERT INTO medico VALUES (100002, 'Maria Aparecida', 'AV. Brasil', 32, '02145070',
'Casa', '923235454', 1)

INSERT INTO medico VALUES (100003, 'Lucas Borges', 'AV. do Estado', 3210, '05241000',
'Apto 205', '963698585', 2)

INSERT INTO medico VALUES (100004, 'Gabriel Oliveira', 'AV. Dom Helder Carnara', 350,
'03145000', 'Apto 602', '932458745', 3)


INSERT INTO consulta VALUES (99901, 100002, '2021-09-04 13:20', 'Infecção urina')

INSERT INTO consulta VALUES (99902, 100003, '2021-09-04 13:15', 'Gripe')

INSERT INTO consulta VALUES (99901, 100001, '2021-09-04 12:30', 'Infecção Garganta')



ALTER TABLE medico
ADD dia_atendimento		VARCHAR(10)		NULL

UPDATE medico
SET dia_atendimento = '2ª feira'
WHERE codigo = 100001

UPDATE medico
SET dia_atendimento = '4ª feira'
WHERE codigo = 100002

UPDATE medico
SET dia_atendimento = '2ª feira'
WHERE codigo = 100003

UPDATE medico
SET dia_atendimento = '5ª feira'
WHERE codigo = 100004

DELETE especialidade
WHERE especialidade = 'Pediatra'

EXEC sp_rename 'dbo.medico.dia_atendimento','dia_semana_atendimento', 'column'

UPDATE medico
SET logradouro = 'AV. Bras Leme'
WHERE nome = 'Lucas Borges'

UPDATE medico
SET numero = 876
WHERE nome = 'Lucas Borges'

UPDATE medico
SET cep = '02122000'
WHERE nome = 'Lucas Borges'

UPDATE medico
SET complemento = 'Apto 504'
WHERE nome = 'Lucas Borges'

ALTER TABLE consulta
ALTER COLUMN observacao		VARCHAR(200)	NOT NULL
