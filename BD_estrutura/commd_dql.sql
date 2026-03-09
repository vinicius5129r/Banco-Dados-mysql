-- DQL
-- SELECT

select "BOM DIA, 3º TI MAT";

select (2 + 2) as  "ADIÇÃO",
	   (2 - 2) as "SUBTRAÇÃO",
       (2 * 2) as "MUTIPLICAÇÃO",
       (2 / 2) as "DIVISÃO";

-- RETORNA TODAS AS COLUNAS E LINHAS DE FORMA ORIGINAL
select * from filme;

-- PROJEÇÃO 
select 
	film_id as "ID",
    film_titulo as "TÍTULO DO FILME",
    film_faixa_etaria as "FAIXA ETÁRIA"
from filme
where film_faixa_etaria = 14;

select 
	film_id as "ID",
    film_titulo as "TÍTULO DO FILME",
    film_faixa_etaria as "FAIXA ETÁRIA"
from filme
where film_titulo = "ZOOTOPIA 2"
and film_faixa_etaria >= 0;

select 
	film_id as "ID",
    film_titulo as "TÍTULO DO FILME",
    film_faixa_etaria as "FAIXA ETÁRIA"
from filme
where film_titulo = "ZOOTOPIA 2"
or film_faixa_etaria >= 14;

select 
	film_id as "ID",
    film_titulo as "TÍTULO DO FILME",
    film_faixa_etaria as "FAIXA ETÁRIA"
from filme
where film_id >=2
and film_id <=10;
