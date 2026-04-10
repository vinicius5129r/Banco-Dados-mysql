-- null / not null

-- is null significa que não estão preenchidos
select 
	cand_nome as "CANDIDATO",
    cand_numero as "NR CANDIDATO",
    cand_foto as "FOTO"
from candidato
where cand_foto is null;

-- is not null significa que trás todos que estão preenchidos
select 
	cand_nome as "CANDIDATO",
    cand_numero as "NR CANDIDATO",
    cand_foto as "FOTO"
from candidato
where cand_foto is not null;

select 
	count(*) as "QTD_SALÁRIOS",
    sum(carg_salario) as "SOMA DOS SALÁRIOS",
    avg(carg_salario) as "MÉDIA DOS SALÁRIOS",
    max(carg_salario) as "MAIOR SALÁRIO",
    min(carg_salario) as "MENOR SALÁRIO"
from cargo;

-- group by agrupa
select
	part_numero as "NR DO PARTIDO",
    count(*) as "QTD DE CANDIDATOS"
from candidato
group by part_numero; 

select
	part_numero as "NR DO PARTIDO",
    count(*) as "QTD DE CANDIDATOS"
from candidato
where cand_nome like "%S"
group by part_numero
having count(*) > 2;

select 
	cand_numero as "NR DO CANDIDATOS",
    count(*) as "QTD VOTOS"
from voto
group by cand_numero
having count(*) > 5
order by count(*) desc;