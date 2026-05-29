-- select aninhado select dentro de outro select, você pode usar 
select
	c.carg_nome as "CARGO"
from cargo c
where c.carg_salario = (select max(c.carg_salario)
						from cargo c);

-- select
select
	c.carg_nome as "CARGO",
    concat("R$ ", format(c.carg_salario, 2, 'de_DE')) as "SALARIO",
    (select  concat("R$ ", format(avg(c.carg_salario), 2, 'de_DE')) from cargo c) as "VALOR_MEDIO"
from cargo c;

-- 
select
	c.carg_nome as "CARGO",
	concat("R$ ", format(c.carg_salario, 2, 'de_DE')) as "SALARIO"
from cargo c
where c.carg_salario in (select c.carg_salario
						from cargo c
                        where c.carg_salario > 5000);
                        
-- exist / not exist

-- exists
select
	c.cand_nome as "CANDIDATO",
    c.cand_numero as "NR_CANDIDATO"
from candidato c 
where exists (select 1
			  from voto v 
              where c.cand_numero = v.cand_numero);

-- not exists
select
	c.cand_nome as "CANDIDATO",
    c.cand_numero as "NR_CANDIDATO"
from candidato c 
where not exists (select 1
			  from voto v 
              where c.cand_numero = v.cand_numero);