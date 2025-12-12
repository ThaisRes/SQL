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

CREATE TABLE products (
	id_produto serial PRIMARY KEY ,
	fk_fornecedor int REFERENCES fornecedores(id_fornecedor),
	nome_produto varchar(100), 
	valor numeric(7,2)
);

CREATE TABLE fornecedores (
	id_fornecedor serial PRIMARY KEY, 
	nome_fornecedor varchar(100)
);

CREATE TABLE vendas (
	id_venda serial PRIMARY KEY ,
	fk_produto int REFERENCES products(id_produto),
	fk_usuario int REFERENCES usuarios(id_usuario),
	data_venda timestamp DEFAULT current_timestamp
);

CREATE TABLE usuarios (
	id_usuario serial PRIMARY KEY ,
	nome_usuario varchar(100)
);

--a) Listar todos os dados de todos os produtos;
SELECT * FROM products;

--b) Listar produtos de um determinado fornecedor;
SELECT nome_produto, nome_fornecedor FROM products p 
INNER JOIN fornecedores f ON p.fk_fornecedor = f.id_fornecedor 
WHERE f.nome_fornecedor = 'Nestle'
;

--c) Listar produtos entre uma intervalo de preços;
SELECT * products WHERE valor BETWEEN 10 AND 30
;

--d) Listar o nome do produto e o nome do fornecedor de cada produto;
SELECT nome_produto, nome_fornecedor FROM products p 
INNER JOIN fornecedores f ON p.fk_fornecedor = f. id_fornecedor
;

--e) Listar o nome do usuário, o nome do produto e a data que esse usuário comprou o produto;
SELECT nome_usuario, nome_produto, data_venda FROM 
usuarios u JOIN vendas v ON u.id_usuario = v.fk_usuario
JOIN products p ON p.id_produto = v.fk_produto
;

--f) Listar o nome do usuário  e as datas em que ele comprou algo e filtrar por um usuário específico;
SELECT nome_usuario, data_venda FROM usuarios u 
INNER JOIN vendas v ON u.id_usuario = v.fk_usuario
WHERE nome_usuario = 'Otavio'
;

--g) Listar o nome dos usuários que não tiveram nenhuma compra;  --????????????????????
SELECT nome_usuario FROM usuarios u
INNER JOIN vendas v ON u.id_usuario NOT v.fk_usuario --onde não existir essa igualdade
WHERE usuarios u
;

--h) Listar o identificador e as datas das vendas que não tiveram um usuário;
SELECT id_venda, data_venda FROM vendas v
INNER JOIN 



