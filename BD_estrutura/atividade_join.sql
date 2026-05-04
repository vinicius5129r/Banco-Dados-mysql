-- 1
select
	can.cand_nome as "Nome do candidato",
    lower(car.carg_nome) as "Nome do Cargo",
    concat("R$ ", format(car.carg_salario, 2, 'de_DE')) as "Salário do Cargo"
from candidato can
inner join cargo car on can.carg_codigo = car.carg_codigo
where can.cand_numero >= 40 or car.carg_codigo = 20
order by car.carg_nome asc;

-- 2
select
p.part_numero AS "NR PARTIDO",
p.part_nome AS "NOME DO PARTIDO",
LPAD(COUNT(*), 5, 0) AS "QTD DE CANDIDATO"
FROM candidato can
INNER JOIN partido p ON can.part_numero = p.part_numero
GROUP BY p.part_numero
HAVING COUNT(*) >= 5
ORDER BY COUNT(*);

-- 4 
select 
	LPAD(COUNT(*), 5, "0") as "Qtd de Voto",
    can.cand_numero as "NR de candidato",
    reverse(can.cand_numero) "NR candidato Reverso",
    can.cand_nome as "Nome do Candidato"
from voto v
inner join candidato can on v.cand_numero = can.cand_numero
group by can.cand_numero
having count(*) > 2;

-- 6
select
	v.cand_numero as "NR de candidato",
    e.elei_titulo as "Título do Eleitor",
    date_format(e.elei_dt_nacimento, "d%/%m/%Y") as "Data de Nascimento"
    
from eleitor e
inner join voto v on e.elei_titulo = v.elei_titulo;

