-- QUESTÃO 1:
select
	date_format(curdate(), "%d/%m/%Y") as "Data atual",
	lower(f.film_titulo) as "TÍTULO DO FILME",
	f.film_ano as "ANO",
	f.film_faixa_etaria as "FAIXA ETÁRIA",
	upper(g.gene_descricao) as "GÊNERO"
from genero g
inner join filme f on g.gene_id = f.gene_id
where f.film_faixa_etaria between 10 and 15
order by g.gene_descricao asc;

-- QUESTÃO 02
select
	f.film_titulo as "Título do Filme",
	date_format(e.exib_dt_inicio, '%d/%m/%Y') as "Data de Início",
	lower(f.film_titulo) as "Título do Filme",
	f.film_ano as "ANO",
	f.film_faixa_etaria as "Faixa Etária",
	e.exib_qt_pessoas as "QTD Pessoas",
	concat("R$ ", format(e.exib_vlr_ingresso, 2, 'de_DE')) as "Valor do Ingresso"
from filme f
left join exibicao e
on f.film_codigo = e.film_codigo
where f.film_faixa_etaria between 10 and 15
order by f.gene_id;

-- 3
select
	date_format(ex.exib_dt_inicio, "%d/%m/%Y") as "Data de inicio",
    date_format(ex.exib_dt_fim, "%d/%m/%Y") as "Data fim",
    upper(c.cine_nome) as "Nome do cinema",
    c.cine_lotacao as "cine_lotacao"
from exibicao ex
right join cinema c on ex.cine_codigo = c.cine_codigo
where c.cine_uf = "RO"
order by c.cine_nome asc;


