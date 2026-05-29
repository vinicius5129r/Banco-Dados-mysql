-- questao 1
select
	can.cand_nome as "CANDIDATO",
    lower(p.part_nome) as "PARTIDO",
    car.carg_nome as "CARGO",
    count(*) as "TOTAL_VOTOS",
    concat("R$ ", format(avg(car.carg_salario), 2, 'de_DE')) as "MEDIA_SALARIO"
from candidato can
inner join partido p on can.part_numero = p.part_numero
inner join cargo car on can.carg_codigo = car.carg_codigo
inner join voto v on can.cand_numero = v.cand_numero
where car.carg_nome in( "PREFEITO", "PRESIDENTE")
group by can.cand_nome
having count(*) >= 7
order by count(*) desc;

SELECT
	p.part_nome AS "PARTIDO",
	P.part_sigla AS "SIGLA",
	count(*) AS "QTD_CANDIDATOS",
	CHAR_LENGTH(p.part_nome) AS "QTD_CARACTERES",
LEFT(part_nome , 5) AS "PRIMEIROS_5_CARACTERES"
FROM partido p
LEFT JOIN candidato c
ON p.part_numero = c.part_numero
WHERE CHAR_LENGTH(p.part_nome) = 14
group by p.part_nome
ORDER BY p.part_nome;

SELECT
c.cand_nome AS "CANDIDATO",
DATE_FORMAT(v.voto_data, '%d/%m/%Y') AS "DATA_VOTO",
DAYOFWEEK(v.voto_data) AS "DIA_SEMANA",
DATE_FORMAT(CURDATE(), '%d/%m/%Y') AS "DATA_ATUAL",
DATEDIFF(CURDATE(),v.voto_data) AS "DIAS_PASSADOS"
FROM voto v
RIGHT JOIN candidato c ON v.cand_numero = c.cand_numero
WHERE c.cand_nome LIKE"%A"
GROUP BY c.cand_nome
ORDER BY c.cand_nome;

SELECT
	LPAD(c.cand_numero, 5, 0) AS "NR_CANDIDATO",
	c.cand_nome AS "CANDIDATO",
	REVERSE(c.cand_nome) AS "NOME_INVERTIDO",
	SUBSTR(c.cand_nome, 1, INSTR(c.cand_nome," ")) AS "PRIMEIRO_NOME",
	DATE_FORMAT(v.voto_data, '%d/%m/%Y') AS "DATA_VOTO"
FROM voto v
LEFT JOIN candidato c ON v.cand_numero = c.cand_numero
WHERE c.cand_nome LIKE "%SILVA%"
GROUP BY c.cand_nome
UNION
SELECT
	LPAD(c.cand_numero, 5, 0) AS "NR_CANDIDATO",
	c.cand_nome AS "CANDIDATO",
	REVERSE(c.cand_nome) AS "NOME_INVERTIDO",
	SUBSTR(c.cand_nome, 1, INSTR(c.cand_nome," ")) AS "PRIMEIRO_NOME",
	DATE_FORMAT(v.voto_data, '%d/%m/%Y') AS "DATA_VOTO"
FROM voto v
RIGHT JOIN candidato c ON v.cand_numero = c.cand_numero
WHERE c.cand_nome LIKE "%SILVA%"
GROUP BY c.cand_nome;

SELECT
	car.carg_nome AS "CARGO",
	can.cand_nome AS "CANDIDATO",
	LPAD(COUNT(v.cand_numero), 5, 0) AS "QTD_VOTOS",
	DATE_FORMAT(v.voto_data, "%d/%m/%Y") AS "DATA_VOTO",
	DATE_FORMAT(CURDATE(), "%d/%m/%Y") AS "DATA_ATUAL",
	CONCAT("A última eleição foi realizada há ", ROUND(DATEDIFF(CURDATE(), v.voto_data) / 365), " anos") AS "TEMPO"
FROM candidato can
INNER JOIN voto v ON can.cand_numero = v.cand_numero
INNER JOIN cargo car ON can.carg_codigo = car.carg_codigo
WHERE car.carg_nome = "PRESIDENTE" AND YEAR(v.voto_data) = "2022"
GROUP BY can.cand_nome
UNION
SELECT
	NULL,
	"TOTAL DE VOTOS",
	LPAD(COUNT(*), 5, 0),
	NULL, NULL, NULL
FROM candidato can
INNER JOIN voto v ON can.cand_numero = v.cand_numero
INNER JOIN cargo car ON can.carg_codigo = car.carg_codigo
WHERE car.carg_nome = "PRESIDENTE" AND YEAR(v.voto_data) = "2022"
ORDER BY 2;