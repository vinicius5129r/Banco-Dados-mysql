-- JOIN SIGNIFICA (JUNÇÃO) DE UMA OU MAIS TABELAS
-- INNER JOIN 
select
	car.carg_codigo as "CÓD CARGO",
    car.carg_nome as "CARGO",	
    can.cand_nome as "CANDIDATO",
    p.part_nome as "PARTIDO",
    p.part_sigla as "SIGLA"
from cargo car
inner join candidato can on car.carg_codigo = can.carg_codigo
inner join partido p on can.part_numero = p.part_numero
where car.carg_nome = "PRESIDENTE" and p.part_sigla = "PEC";
-- EXEMPLO
select
	e.elei_nome as "ELEITOR",
    c.cand_nome as "CANDIDATO"
from candidato c
inner join voto v on c.cand_numero = v.cand_numero
inner join eleitor e on e.elei_titulo = v.elei_titulo;

select
	upper(e.elei_nome) as "Nome dos eleitores",
    e.elei_titulo as "NR TITULO",
    lower(can.cand_nome) as "NOME VEREDOR",
    car.carg_nome as "NOME CARGO",
    par.part_nome as "NOME PARTIDO",
	concat("R$ ", format(car.carg_salario, 2, 'de_DE')) as "SALÁRIO",
    date_format(v.voto_data, '%d/%m/%Y %H:%i:%s') as "DATA VOTO"
from eleitor e
inner join voto v on e.elei_titulo = v.elei_titulo
inner join candidato can on  can.cand_numero = v.cand_numero
inner join cargo car on car.carg_codigo = can.carg_codigo
inner join partido par on par.part_numero  = can.part_numero
where par.part_nome = "PARTIDO COMETA"
and car.carg_nome = "VEREADOR"
order by e.elei_nome;


