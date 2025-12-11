
DROP TABLE IF EXISTS alunos;
DROP TABLE IF EXISTS livros;
DROP TABLE IF EXISTS emprestimos;

CREATE TABLE alunos (
	id_aluno serial PRIMARY KEY,
	nome_completo VARCHAR(200) NOT NULL,
	ano_escolar VARCHAR(10) NOT NULL,
	data_nascimento date
);

CREATE TABLE livros (
	id_livro serial PRIMARY KEY,
	titulo VARCHAR(200) NOT NULL,
	autor VARCHAR(200),
	ano_publicacao int,
	categoria VARCHAR(50)
);

CREATE TABLE emprestimos (
	id_emprestimo serial PRIMARY KEY,
	id_aluno int REFERENCES alunos(id_aluno) NOT NULL,
	id_livro int REFERENCES livros(id_livro) NOT NULL,
	data_emprestimo date  DEFAULT current_date NOT NULL,
	data_prev_devolucao date,
	data_devolucao date
);

INSERT INTO alunos(nome_completo, ano_escolar, data_nascimento) 
VALUES('Manoel Cunha', 5,'25-08-2013'), ('Paola Silva', 8,'17-02-2016'), ('Manuela Pereira', 7,'23-7-2017'), ('Maria Albuquerque', 5,'08-01-2014'), ('Pedro Santos Junior', 8,'25-08-2016'
);

INSERT INTO livros(titulo, autor, ano_publicacao, categoria) 
VALUES('Percy Jackson e os Olimpianos', 'Rick Riordan', 2005,'aventura'), ('O pequeno principe', 'Antoine de Saint-Exupéry', 1943, 'literatura fantástica'), ('O diário de um banana', 'Jeff Kinney', 2007, 'ficção'), ('Cidade de Ember', 'Jeanne DuPrau', 2003, 'ficção científica'), ('A menina que roubava livros', 'Markus Zusak', 2005, 'ficção histórica'    
);

INSERT INTO emprestimos(id_aluno, id_livro, data_emprestimo, data_prev_devolucao)
VALUES (2, 4, '01-09-2025','16-09-2025'), (4, 2, '20-09-2025','05-10-2025'), (1, 1, '03-10-2025','18-10-2025'), (3, 4, '08-10-2025','23-10-2025'), (4, 3, '31-10-2025','15-11-2025'), (2, 5, '15-11-2025','01-12-2025'), (5, 3, '17-11-2025','03-12-2025'), (2, 2, '05-12-2025','05-02-2026'), (5, 5, '03-12-2025','05-02-2026'), (3, 1, '04-12-2025','05-02-2026'            
);

UPDATE emprestimos 
SET data_devolucao ='16-09-2025'
WHERE id_emprestimo = 1
;

UPDATE emprestimos 
SET data_devolucao ='05-10-2025'
WHERE id_emprestimo = 2
;

UPDATE emprestimos 
SET data_devolucao ='20-10-2025'
WHERE id_emprestimo = 3
;

UPDATE emprestimos 
SET data_devolucao ='23-10-2025'
WHERE id_emprestimo = 4
;


SELECT * FROM alunos;
SELECT * FROM livros;
SELECT * FROM emprestimos;

SELECT * FROM emprestimos WHERE id_aluno = 2;
SELECT * FROM livros WHERE categoria  = 'aventura';



