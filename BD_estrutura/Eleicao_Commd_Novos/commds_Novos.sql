-- in / not in / concat / concatws / distinct / like / limit

-- in(trás somente os condicionados é mais de um)
select 
	e.elei_nome as "Eleitor",
    e.elei_titulo as "Título de Eleitor",
    e.elei_zona as "Zona",
	e.elei_sessao as "Sessão"
from eleitor e
where e.elei_nome in ("PEDRO SILVA", "TATIANA FIDELIS");

-- not in(trás toda a lista menos os condicionados)
select 
	e.elei_nome as "Eleitor",
    e.elei_titulo as "Título de Eleitor",
    e.elei_zona as "Zona",
	e.elei_sessao as "Sessão"
from eleitor e
where e.elei_nome not in ("PEDRO SILVA", "TATIANA FIDELIS");

-- cancat() serve para junta os dados em uma única linha(coluna), no caso define separadores onde quiser,  podendo usar símbolos e caracteres
select 
	concat("Nome: ", e.elei_nome, " | TÍTULO: ", e.elei_titulo, " - Cadastrado") as "DADOS DO ELEITOR"
from eleitor e
where e.elei_nome not in ("PEDRO SILVA", "TATIANA FIDELIS");

-- concatws(define logo de início o separado padrão dos atributos
select 
	concat_ws(" | ", e.elei_nome, e.elei_titulo, e.elei_zona, e.elei_sessao) as "DADOS DO ELEITOR"
from eleitor e
where e.elei_nome in ("PEDRO SILVA", "TATIANA FIDELIS");

-- distinct(remover depetições)
select
	distinct part_numero as "NÚMERO PARTIDO"
from partido;

-- operações aritméticas
select
	carg_codigo as "CÓDIGO",
    carg_nome as "CARGO",
    carg_salario as "SALÁRIO BASE",
    (carg_salario + 500) as "SALÁRIO AUMENTO",
    (carg_salario - 500) as "SALÁRIO DESCONTO",
    concat(carg_nome, " - Salário com aumento: R$ ", (carg_salario + 500)) as "CARGO AUMENTO"
from cargo
order by carg_salario desc;

-- Like(faz pesquisas avançadas em caracteres
select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome like "__________"; -- quantidade de caracteres á ser pesquisado


-- se eu quero pesquisa qualquer parte do texto use "text%"(final do texto) "%text"(ínicio do texto) "%text%(qualquer parte do texto)"
select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome like "____R%";

select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome like "%R%";

select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome like "A%";

select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome like "%S";

select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome like "%SILVA%";

select 
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome not like "%SILVA%"; -- pesquisa todo mundo menos silva

-- limit/offset(trazer apartir de um ponto especifico ( limit ignora a quantidade), (offset lista quantidade especifica)
select 
	cand_numero as "Nº CANTIDATO",
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome
order by cand_numero desc
limit 5 offset 3;

-- sem offsert
select 
	cand_numero as "Nº CANTIDATO",
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_nome
order by cand_numero desc
limit 5;

-- between ( inves de usar <= ou >= trás uma facha de valores dentro da quantidade desejada
select 
	cand_numero as "Nº CANTIDATO",
	cand_nome as "NOME CANDIDATO"
from candidato
where cand_numero between 50 and 8000
order by cand_numero;

