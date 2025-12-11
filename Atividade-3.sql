
DROP TABLE IF EXISTS livros;

CREATE TABLE livros (
	id SERIAL PRIMARY KEY,
	titulo varchar(100) NOT NULL ,
	autor varchar(80),
	ano_publicacao integer,
	preco numeric(4,2),
	estoque integer DEFAULT 0
);

INSERT INTO livros (titulo, autor, ano_publicacao, preco, estoque) VALUES
('O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 45.90, 12),
('1984', 'George Orwell', 1949, 35.50, 8),
('Dom Casmurro', 'Machado de Assis', 1899, 28.00, 15),
('Harry Potter', 'J.K. Rowling', 1997, 42.00, 20),
('A Revolução dos Bichos', 'George Orwell', 1945, 30.00, 10)
;

-- 1. Adicione uma coluna chamada editora que aceita até 50 caracteres.
ALTER TABLE livros ADD COLUMN editora varchar(50)
;

-- 2. Adicione uma coluna chamada categoria que aceita até 25 caracteres.
ALTER TABLE livros ADD COLUMN categoria varchar(25)
;

-- 3. Modifique a coluna preco para aceitar até 10 dígitos no total, mantendo 2 casas decimais.
ALTER TABLE livros ALTER COLUMN preco TYPE numeric(10,2)
;

-- 4. Adicione uma coluna chamada isbn que aceita até 20 caracteres.
ALTER TABLE livros ADD COLUMN isbn varchar(20)
;

-- 5. Remova a coluna isbn (descobrimos que não vamos usar).
ALTER TABLE livros DROP COLUMN isbn
;

-- 6. Renomeie a coluna ano_publicacao para ano.
ALTER TABLE livros RENAME COLUMN ano_publicacao TO ano
;

-- 7. Adicione uma coluna desconto do tipo NUMERIC(5,2) com valor padrão 0.00.
ALTER TABLE livros ADD COLUMN desconto numeric(5,2) DEFAULT 0.00
;

-- 8. Atualize o livro "1984" definindo a editora como "Companhia das Letras" e a categoria como "Ficção Científica".
UPDATE livros SET editora = 'Companhia das letras', categoria = 'Ficção Científica' WHERE titulo = '1984'
;

-- 9. Atualize todos os livros do autor "George Orwell" para ter um desconto de 10.00.
UPDATE livros SET desconto = 10.00 WHERE autor = 'George Orwell'
;

-- 10. Atualize o preço do livro "Dom Casmurro" para 32.50.
UPDATE livros SET preco = 32.50 WHERE titulo = 'Dom Casmurro'
;

-- 11. Defina a categoria "Fantasia" para os livros "O Senhor dos Anéis" e "Harry Potter".
UPDATE livros SET categoria = 'Fantasia' WHERE titulo = 'O Senhor dos Anéis' OR titulo = 'Harry Potter'
;
       ---é igual a:
UPDATE livros SET categoria = 'Fantasia' WHERE titulo IN ('O Senhor dos Anéis', 'Harry Potter')
;

-- 12. Aumente o estoque de todos os livros em 5 unidades.
UPDATE livros SET estoque = estoque + 5
;

-- 13. Atualize a editora de "Dom Casmurro" para "Nova Fronteira" e a categoria para "Romance".
UPDATE livros SET editora = 'Nova Fronteira' , categoria = 'Romance' WHERE titulo = 'Dom Casmurro'
;

-- 14. Delete o livro com id = 3 (Dom Casmurro).
DELETE FROM livros WHERE id = 3
;

-- 15. Delete todos os livros que têm estoque menor que 10 unidades.
DELETE FROM livros WHERE estoque < 10
;

-- 16. Delete o livro "A Revolução dos Bichos".
DELETE FROM livros WHERE titulo = 'A Revolução dos Bichos'
;






















