select 
	date_format(curdate(), "%d/%m/%Y") as "Data Atual",
    elei_titulo as "Nr. do Título",
    lpad(cand_numero, 5, "0") as "NR do Candidato",
	date_format(voto_data, "%d/%m/%Y") as "Data do Voto"
from voto
order by voto_data desc;

select 
	curdate() as "Data Atual",
    date_format(voto_data, "%d/%m/%Y") as "Data do Voto",
    date_format(date_sub(voto_data, interval 90 day), "%d/%m/%Y") as "intervalo de 90 dias"
from voto
where elei_titulo like "%4"
order by voto_data desc;

select 
	trim(elei_nome) as "Nome do Eleitor",
    day(elei_dt_nacimento) as "Dia",
    month(elei_dt_nacimento) as "Mês",
    year(elei_dt_nacimento) as "Ano"
from eleitor
where year(elei_dt_nacimento) between 1980 and 1990
order by elei_nome asc;

select 
	elei_nome as "Nome do Eleitor",
    date_format(elei_dt_nacimento, "%d/%m/%Y") as "Data de Nascimento",
    date_format(curdate(), "%d/%m/%Y") as "Data Atual",
    datediff(curdate(), elei_dt_nacimento) as "QTD de Dias"
from eleitor;

select
	date_format(voto_data, "%d/%m/%Y") as "Data do Voto",
    date_format(date_sub(voto_data, interval 2 year), "%d/%m/%Y") as "Subtraindo 2 anos"
from voto;

select
	elei_nome as "Nome do Eleitor",
    elei_titulo as "Título de Eleitor",
    date_format(elei_dt_nacimento, "%d/%m/%Y") as "Data de Nascimento dos Eleitores",
    day(elei_dt_nacimento) as "Número do dia"
from eleitor
where elei_zona = 2;

select
	elei_nome as "Nome do Eleitor"
from eleitor;