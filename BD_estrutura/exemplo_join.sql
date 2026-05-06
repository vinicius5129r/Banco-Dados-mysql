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