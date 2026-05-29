-- inner join
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
inner join filme f on g.gene_id = f.gene_id;

-- left join
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
left join filme f on g.gene_id = f.gene_id;

-- right join
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
right join filme f on g.gene_id = f.gene_id; 

-- full join -> não tem comando expecifico só junção left é right
-- UNION -> sem repetições, vamos utilizar como totalizador
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
inner join filme f on g.gene_id = f.gene_id
union
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
left join filme f on g.gene_id = f.gene_id;

-- UNION ALL-> com repetições
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
inner join filme f on g.gene_id = f.gene_id
union all
select
	g.gene_id as "ID Gênero (PK)",
    g.gene_descricao as "Gênero",
    f.gene_id as "ID Gênero (FK)",
    f.film_titulo as "Filme"
from genero g
left join filme f on g.gene_id = f.gene_id;

-- exemplo totalizador, regras-> so e possivel ser a quantidade de atributos for igual 
-- ou usar null ou "",
-- tenta posicionar com mesmo tipo de dados int com int...0
select
	f.film_titulo as "FILME",
    f.film_ano as "ANO"
from filme f
where f.film_titulo like "M%"
union
select
	"TOTAL",
    sum(f.film_ano) as "ANO"
from filme f
where f.film_titulo like "M%";
