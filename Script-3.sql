CREATE TABLE clientes (
	id_cliente serial PRIMARY KEY ,
	nome varchar(100) NOT NULL ,
	data_nascimento date,
	cpf char(11) NOT NULL UNIQUE ,
	ativo boolean DEFAULT TRUE 	
);

CREATE TYPE tipo_status AS ENUM ('PAGO', 'PENDENTE', 'A CAMINHO', 'EM PREPARO');

CREATE TABLE pedidos (
	id_pedido serial PRIMARY KEY,
	fk_cliente int REFERENCES clientes (id_cliente) ,
	data_pedido timestamp NOT NULL DEFAULT current_timestamp,
	valor numeric(7,2) NOT NULL CHECK(valor>0),
	status tipo_status DEFAULT 'PENDENTE'
);

INSERT INTO clientes (nome, cpf, ativo)
VALUES ('Carlos', '12345678912', true),
	('Fulano', '15213652147', true),
	('Hacker', '14523698753', false)
;

INSERT INTO clientes (nome, cpf, data_nascimento)
VALUES ('Ciclani', '56982354789', '01//11/2001')
;

INSERT INTO pedidos (data_pedido, valor, status, fk_cliente)
VALUES (current_timestamp, 452.39, 'PAGO', 1), 
('01/12/2025', 34.99, 'A CAMINHO', 3)
;

INSERT INTO pedidos(valor)
VALUES (789.90);

SELECT * FROM pedidos p
JOIN clientes c ON p.fk_cliente = c.id_cliente
;

SELECT fk_cliente, nome, data_pedido from pedidos p
JOIN clientes c ON p.fk_cliente = c.id_cliente
;  --por padrao JOIN é iual a INNER JOIN

SELECT fk_cliente, nome, data_pedido from pedidos p
INNER JOIN clientes c ON p.fk_cliente = c.id_cliente
;

SELECT fk_cliente, nome, data_pedido from pedidos p
LEFT JOIN clientes c ON p.fk_cliente = c.id_cliente
; --pioriza a tabela da esquerda do join que é pedidos, vai mostrar todos os pedidos independendte se tem clienet ecdastrado ou nao

SELECT fk_cliente, nome, data_pedido from pedidos p
RIGHT JOIN clientes c ON p.fk_cliente = c.id_cliente
; --pioriza a tabela da direita do join que é clientes, vai mostrar todos os clientes independente se ele fez pedido ou nao

