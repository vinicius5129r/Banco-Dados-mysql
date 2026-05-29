select
	g.gene_descricao as "GENERO",
    lower(f.film_titulo) as "FILME",
    concat("R$ ", format(avg(exib_vlr_ingresso), 2, 'de_DE')) as "MÈDIA  VALOR INGRESSO",
    sum(e.exib_qt_pessoas) as "TOTAL ESPECTADORES"
from exibicao e
inner join filme f on e.film_codigo = f.film_codigo
inner join genero g on f.gene_id = g.gene_id
where g.gene_descricao = "AÇÃO"
union
select
	g.gene_descricao as "GENERO",
    lower(f.film_titulo) as "FILME",
    concat("R$ ", format(avg(exib_vlr_ingresso), 2, 'de_DE')) as "MÈDIA  VALOR INGRESSO",
    sum(e.exib_qt_pessoas) as "TOTAL ESPECTADORES"
from exibicao e
inner join filme f on e.film_codigo = f.film_codigo
inner join genero g on f.gene_id = g.gene_id
where g.gene_descricao = "AVENTURA";

select
	date_format(e.exib_dt_inicio, '%d/%m/%Y') as "Data de Início",
	date_format(e.exib_dt_fim, '%d/%m/%Y') as "Dt.Fim",
	e.exib_qt_pessoas as "QTD DE PESSOAS",
	concat("R$", format(e.exib_vlr_ingresso, 5, 'de_DE')) as "VLR INGRESSO",
	c.cine_nome as "CINEMA",
	c.cine_uf as "ESTADO",
	c.cine_lotacao as "LOTAÇÃO",
	c.cine_email as "EMAIL"
from exibicao e
right join cinema c on e.cine_codigo = c.cine_codigo
where c.cine_lotacao in(50,60,70)
order by e.exib_dt_inicio ;

select
	f.film_titulo AS "FILME",
	RIGHT(f.film_ano, 2) AS "ANO",
	LOWER(g.gene_descricao) AS "GÊNERO",
	lpad(f.film_faixa_etaria, 5, 0) AS "FAIXA ETÁRIA"
FROM genero g
LEFT JOIN filme f
ON f.gene_id = g.gene_id
UNION
select
f.film_titulo AS "FILME",
RIGHT(f.film_ano, 2) AS "ANO",
LOWER(g.gene_descricao) AS "GÊNERO",
lpad(f.film_faixa_etaria, 5, 0) AS "FAIXA ETÁRIA"
FROM genero g
right JOIN filme f
ON f.gene_id = g.gene_id;

SELECT
DATE_FORMAT( CURDATE(), '%d/%m/%Y') AS "DATA ATUAL",
LPAD(f.film_codigo, 5, "0") AS "ID",
f.film_titulo AS "FILME",
LOWER(g.gene_descricao) AS "GENERO",
FORMAT(f.film_faixa_etaria, 4) AS "FAIXA ETÁRIA"
FROM filme f
INNER JOIN genero g ON g.gene_id = f.gene_id
WHERE f.film_faixa_etaria <> 0
UNION
SELECT
NULL,
NULL,
NULL,
"MÉDIA IDADE",
FORMAT(AVG(f.film_faixa_etaria), 4) AS "FAIXA ETÁRIA"
FROM filme f
INNER JOIN genero g ON g.gene_id = f.gene_id
WHERE f.film_faixa_etaria <> 0;