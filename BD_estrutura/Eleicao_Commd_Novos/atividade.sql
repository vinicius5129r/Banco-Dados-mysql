-- questão 01
select 
	distinct elei_zona as "Zonas",
    elei_sessao as "Sessões"
from eleitor
order by elei_zona asc;

-- questão 02
select 
	distinct cand_numero as "NR do Partidos",
    carg_codigo as "Cargo"
from candidato
where carg_codigo = 10
order by part_numero desc;

-- questão 03
select
	elei_nome as "Nome do Eleitor",
    elei_rg as "RG",
    elei_cpf as "CPF"    
from eleitor
where elei_rg like "%9"
order by elei_nome asc;

-- questão 04
select
	elei_nome as "Nome do Eleitor",
    elei_dt_nacimento as "Data de Nascimento"
from eleitor
where elei_nome like "%BR%"
order by elei_dt_nacimento desc;

-- questão 05
select
	part_nome as "Nome do Partido",
    part_sigla as "Sigla"
from partido
where part_nome like "________D%"
order by part_sigla asc;

-- questão 06
select
	elei_titulo as "Título de Eleitor",
    elei_zona as "Zona",
    elei_sessao as "Sessão"
from eleitor
where elei_titulo like "%00"
limit 6 offset 5;

-- questão 07
select 
	carg_nome as "Nome do cargo",
    carg_salario as "Salário",
    carg_qt_vaga as "Qt de Vaga"
from cargo
where carg_salario between "5000" and "10000"
order by carg_nome asc;

