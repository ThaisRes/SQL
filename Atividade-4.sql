/*
 1. Crie as tabelas:
* Produtos  - preço, IDfornecedor, valor, nome
* Fornecedores - nome
* Vendas - data, IDproduto, IDusuario, nome
* Usuários - nome

2. Insira alguns dados para cada tabela, pelo menos 5 dados em cada tabela.

3. Crie as seguintes consultas:
a) Listar todos os dados de todos os produtos;
b) Listar produtos de um determinado fornecedor;
c) Listar produtos entre uma intervalo de preços;
d) Listar o nome do produto e o nome do fornecedor de cada produto;
e) Listar o nome do usuário, o nome do produto e a data que esse usuário  comprou o produto;
f) Listar o nome do usuário  e as datas em que ele comprou algo e filtrar por um usuário específico;
g) Listar o nome dos usuários que não tiveram nenhuma compra;
h) Listar o identificador e as datas das vendas que não tiveram um usuário;
 */

CREATE TABLE fornecedores (
	id_fornecedor serial PRIMARY KEY, 
	nome_fornecedor varchar(100)
);

CREATE TABLE products (
	id_produto serial PRIMARY KEY ,
	fk_fornecedor int REFERENCES fornecedores(id_fornecedor),
	nome_produto varchar(100), 
	valor numeric(7,2)
);

CREATE TABLE usuarios (
	id_usuario serial PRIMARY KEY ,
	nome_usuario varchar(100)
);

CREATE TABLE vendas (
	id_venda serial PRIMARY KEY ,
	fk_produto int REFERENCES products(id_produto),
	fk_usuario int REFERENCES usuarios(id_usuario),
	data_venda timestamp DEFAULT current_timestamp
);

INSERT INTO fornecedores (nome_fornecedor) VALUES
('Fornecedor Ignitiononkeys'),
('Fornecedor Logitech'),
('Fornecedor Dell'),
('Fornecedor Philips'),
('Fornecedor Acer')
;

INSERT INTO products (fk_fornecedor, nome_produto, valor) VALUES
(1, 'Teclado Ergonomoco', 350.90),
(2, 'Mouse Gamer', 180.50),
(3, 'Monitor 24 Polegadas', 899.99),
(4, 'Headset', 299.90),
(5, 'Notebook Acer A505', 4599.00)
;

INSERT INTO usuarios (nome_usuario) VALUES
('Ana Silva'),
('Anderson Costa'),
('Miguel Mendes'),
('Bruna Rocha'),
('Maria Eduarda Lima')
;

INSERT INTO vendas (fk_produto, fk_usuario) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5)
;


--a) Listar todos os dados de todos os produtos;
SELECT * FROM products
;
SELECT * FROM fornecedores
;
SELECT * FROM usuarios
;
SELECT * FROM vendas
;

--b) Listar produtos de um determinado fornecedor;
SELECT nome_produto, nome_fornecedor 
FROM products p 
INNER JOIN fornecedores f ON p.fk_fornecedor = f.id_fornecedor 
WHERE f.nome_fornecedor = 'Fornecedor Delta'
;

--c) Listar produtos entre uma intervalo de preços;
SELECT * FROM products 
WHERE valor BETWEEN 100 AND 500
;

--d) Listar o nome do produto e o nome do fornecedor de cada produto;
SELECT nome_produto, nome_fornecedor 
FROM products p 
INNER JOIN fornecedores f ON p.fk_fornecedor = f.id_fornecedor
;

--e) Listar o nome do usuário, o nome do produto e a data que esse usuário comprou o produto;
SELECT nome_usuario, nome_produto, data_venda 
FROM usuarios u 
INNER JOIN vendas v ON u.id_usuario = v.fk_usuario
INNER JOIN products p ON p.id_produto = v.fk_produto
;

--f) Listar o nome do usuário  e as datas em que ele comprou algo e filtrar por um usuário específico;
SELECT nome_usuario, data_venda FROM usuarios u 
INNER JOIN vendas v ON u.id_usuario = v.fk_usuario
WHERE nome_usuario = 'Bruno Costa'
;

--g) Listar o nome dos usuários que não tiveram nenhuma compra;
INSERT INTO usuarios (nome_usuario) VALUES
('Felipe Souza'),
('Manoel Correas')
;

SELECT u.nome_usuario
FROM usuarios u
LEFT JOIN vendas v ON u.id_usuario = v.fk_usuario
WHERE v.id_venda IS NULL;

--h) Listar o identificador e as datas das vendas que não tiveram um usuário;
INSERT INTO vendas (fk_produto) VALUES
(2),
(5)
;

SELECT id_venda, data_venda FROM vendas v
WHERE fk_usuario IS NULL
;

--ou
SELECT v.id_venda, v.data_venda
FROM vendas v
LEFT JOIN usuarios u ON v.fk_usuario = u.id_usuario
WHERE u.id_usuario IS NULL
;


