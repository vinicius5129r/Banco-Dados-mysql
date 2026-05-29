CREATE VIEW VW_QTD_VOTOS_PARTIDO AS 
SELECT
	p.part_sigla AS "SIGLA",
    count(*) AS "VOTO"
FROM candidato can
INNER JOIN partido p ON can.part_numero = p.part_numero
INNER JOIN voto v ON can.cand_numero = v.cand_numero
group by p.part_sigla
UNION
SELECT
	"TOTAL",
    count(*) 
FROM candidato can
INNER JOIN partido p ON can.part_numero = p.part_numero
INNER JOIN voto v ON can.cand_numero = v.cand_numero
order by 1;

CREATE VIEW VW_ELEITOR_ZONA2 AS
SELECT
elei_titulo AS "TÍTULO",
elei_nome as "ELEITOR",
DATE_FORMAT(elei_dt_nacimento, '%d/%m/%Y') AS "DT NASCIMENTO",
LPAD(elei_zona, 5, 0) AS "ZONA",
LPAD(elei_sessao, 10, 0) AS "SESSÃO"
FROM eleitor;
select * from vw_eleitor_zona2;
DROP VIEW vw_eleitor_zona2;

CREATE VIEW VW_PREFEITO as
SELECT
c.cand_numero AS "NR CANDIDATO",
c.cand_nome AS "CANDIDATO",
c.cand_foto AS "FOTO",
car.carg_nome AS "CARGO",
p.part_nome AS "PARTIDO",
CONCAT( "R$ ", FORMAT(car.carg_salario, 2, "de_DE")) AS "SALÁRIO"
FROM candidato c
INNER JOIN cargo car ON c.carg_codigo = car.carg_codigo
INNER JOIN partido p ON c.part_numero = p.part_numero
WHERE car.carg_nome = "PREFEITO"
GROUP BY c.cand_nome
ORDER BY c.cand_nome;