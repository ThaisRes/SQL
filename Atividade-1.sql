drop table if exists pessoas;
create table pessoas(
	id_pessoa uuid primary key, /*serial ou uuid*/
	nome varchar(100) not null,
	idade integer check (idade >= 18),
	ativo bool default true,
	cpf char (11),
	altura numeric(3,2)
);

drop table if exists produtos;

create table produtos(
	id_produto serial primary key,
	nome varchar(100) not null,
	descricao text,
	codigo_barras varchar(30) not null unique,
	preco numeric(4,2) check(preco >= 5) not null,
	estoque int default 0 not null check(estoque >= 0),
	ativo bool default true not null,
	criado_em timestamp default NOW() not null
);
	
insert into produtos (nome, descricao, codigo_barras, preco, estoque)
values
('Arroz', '1kg Arroz branco Tipo 1 Tio João', '7896256222341', 7.99, 2045),
('Feijão', '1kg Feijão Preto Tipo 1 Combrasil', '7896256223642', 6.70, 1420),
('Grão de Bico', '0,5kg Grão de Bico Combrasil', '7896256122323', 11.20, 320),
('Extrato de Tomate', '0.535kg Extrato de Tomate Elefante', '7896256228559', 14.99, 850),
('Leite de Coco', '0.5L Leite de Coco Imbiara', '7896259222336', 9.89, 68)
;

select * from produtos;

SELECT * FROM produtos
WHERE preco > 8
;

 ALTER TABLE produtos ADD COLUMN
 fornecedor varchar(40) DEFAULT 'Sem fornecedor' NOT NULL
;

ALTER TABLE produtos ALTER COLUMN codigo_barras TYPE varchar(50)
;

ALTER TABLE produtos ALTER COLUMN estoque TYPE bigint
;

ALTER TABLE produtos DROP COLUMN fornecedor
;

/* DROP TABLE produtos; 
 * TRUNCATE produtos;
 * */

UPDATE produtos SET preco = 11.99 WHERE id_produto = 1
;
 
UPDATE produtos SET preco = preco*1.15 WHERE criado_em > '2025-12-04 18:49:53.654'
;

DELETE FROM produtos WHERE descricao IS NULL;






 