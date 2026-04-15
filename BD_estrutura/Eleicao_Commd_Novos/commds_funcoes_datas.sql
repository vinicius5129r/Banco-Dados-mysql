-- FUNÇÃO DE DATAS
-- DATE_ADD
-- ADICIONA DATAS DE ACORDO COM INTERVALO (DIA[DAY], MÊS[MONTH] E ANO[YEAR]
select 
	date_add("2026-04-13", interval 150 day) as "INTEVALO - DIA",
    date_add("2026-04-13", interval 5 month) as "INTEVALO - MÊS",
    date_add("2026-04-13", interval 10 year) as "INTEVALO - ANO";

-- CURDATE MOSTRA A DATA ATUAL (SISTEMA OPERACIONAL)
select 
	curdate() as "DATA ATUAL";
    
-- DATE_SUB
-- SUBTRAIR DATAS DE ACORDO COM INTERVALO (DIA[DAY], MÊS[MONTH] E ANO[YEAR]
select 
	date_sub(curdate(), interval 150 day) as "INTEVALO - DIA",
    date_sub(curdate(), interval 5 month) as "INTEVALO - MÊS",
    date_sub(curdate(), interval 10 year) as "INTEVALO - ANO";
    
-- DAY --> EXTRAI O DIA / MONTH EXTRAI MÊS / YEAR EXTRAI ANO
select
	curdate() as "DATA ATUAL",
    day(curdate()) as "DIA",
    month(curdate()) as "MÊS",
    year(curdate()) as "ANO";

-- DATEDIFF
-- RETORNA A DIFERENÇA (EM DIAS) ENTRE DATAS
select
	datediff(curdate(), "2008-02-14") as "DIFERENÇA EM DIAS";
    
-- DAYOFWEEK
-- RETORNA O DIA DA SEMANA
select
	dayofweek("2008-02-14");

-- RETORNA O DIA DO MÊS
select dayofmonth(curdate());

-- RETORNA O DIA DO ANO (1...365)
select dayofyear(curdate());

-- LAST_DAY
select last_day(curdate()) as "ÚLTIMO DIA MÊS";

-- NOW()
-- RETORNA DATA E HORA
select now() as "DATA HORA";

-- DATA_FORMAT
-- FORMATA DATA E HORA
select 
	curdate() as "DATA",
    date_format(curdate(), '%d/%m/%Y') as "DATA_BR",
    now() as "DATA HORA",
    date_format(now(), '%d/%m/%Y %H:%i:%s') as "DATA HORA";