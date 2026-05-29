create view vw_candidatos_votos_prefeito as
select 
	can.cand_nome as "CANDIDATO",
    car.carg_nome as "CARGO",
    count(*) as "QTD VOTOS"
from candidato can
inner join voto v on can.cand_numero = v.cand_numero
inner join cargo car on can.carg_codigo = car.carg_codigo
where car.carg_nome = "PREFEITO"
group by car.carg_nome
order by count(*) desc;