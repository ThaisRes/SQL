CREATE TABLE clientes2 (
	id_cliente serial PRIMARY KEY ,
	nome varchar(100) NOT NULL ,
	data_nascimento date,
	cpf char(11) NOT NULL UNIQUE ,
	ativo boolean DEFAULT TRUE 	
);

CREATE TYPE tipo_status2 AS ENUM ('PAGO', 'PENDENTE', 'A CAMINHO', 'EM PREPARO')
;

CREATE TABLE pedidos2 (
	id_pedido serial PRIMARY KEY,
	fk_cliente int REFERENCES clientes (id_cliente) ,
	data_pedido timestamp NOT NULL DEFAULT current_timestamp,
	valor numeric(7,2) NOT NULL CHECK(valor>0),
	status tipo_status2 DEFAULT 'PENDENTE'
);

CREATE TABLE produtos2 (
	id_produto serial PRIMARY KEY ,
	nome varchar(100), 
	estoque int NOT NULL 
);

INSERT INTO clientes2 (nome, cpf, ativo)
VALUES ('Carlos', '12345678912', true),
	('Fulano', '15213652147', true),
	('Hacker', '14523698753', false)
;

INSERT INTO clientes2 (nome, cpf, data_nascimento)
VALUES ('Ciclani', '56982354789', '01//11/2001')
;

INSERT INTO pedidos2 (data_pedido, valor, status, fk_cliente)
VALUES (current_timestamp, 452.39, 'PAGO', 1), 
('01/12/2025', 34.99, 'A CAMINHO', 3)
;

INSERT INTO pedidos2 (valor)
VALUES (789.90);

ALTER TABLE pedidos2
ADD COLUMN fk_produto int REFERENCES produtos(id_produto)
;

INSERT INTO produtos2 (nome, estoque) VALUES
('Produto X', 10),
('Produto Y', 25)
;

UPDATE pedidos2 SET fk_produto = 1 WHERE fk_cliente = 1;
UPDATE pedidos2 SET fk_produto = 2 WHERE fk_cliente = 3; 

SELECT fk_cliente, clientes2.nome, data_pedido, produtos2.nome FROM clientes2 
JOIN pedidos2 ON fk_cliente = id_cliente
JOIN produtos2 ON pedidos2.fk_produto = produtos2.id_produto


--triguer?????
;