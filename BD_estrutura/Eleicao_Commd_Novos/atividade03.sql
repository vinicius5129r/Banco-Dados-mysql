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