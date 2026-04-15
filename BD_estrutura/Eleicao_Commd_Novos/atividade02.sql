select
	lpad(cand_numero, 10, "0") as "NR do cadidato"
from candidato
order by cand_numero asc;

select 
	elei_nome as "Nome do Eleitor", 
    char_length(elei_nome) as "Qtd de Caracteres"
from eleitor
where elei_dt_nacimento <"1990-01-01" and elei_rg is not null;

select 
	elei_nome as "Nome do Eleitor",
    replace(elei_dt_nacimento, "/", "-") as "Data de Nascimento"
from eleitor
where elei_nome like "%A"
order by elei_dt_nacimento desc;

select 
	carg_nome as "Nome do Cargo",
    concat("R$ ", format(carg_salario, 2, 'de_DE')) as "Salário"
from cargo
where carg_salario > 2000;

select
	concat("NR-", cand_numero) as "NR de candidato",
    count(*) as "Qtd de Voto"
from voto
group by cand_numero
having count(*) > 9;

