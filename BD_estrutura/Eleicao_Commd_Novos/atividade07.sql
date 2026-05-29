-- 3
CREATE VIEW VW_CINEMA_LOTACAO AS
SELECT
	UPPER(c.cine_nome) AS "CINEMA",
    LOWER(c.cine_email) AS "E-MAIL",
    c.cine_lotacao AS "LOTAÇÃO"
FROM cinema c
WHERE EXISTS (SELECT 1
			  FROM exibicao e
              WHERE c.cine_codigo = e.cine_codigo);
              
CREATE VIEW vw_arrecadacao_cinemas_consulta AS
SELECT
c.cine_nome AS "CINEMA",
e.exib_qt_pessoas AS "QTD_PESSOAS",
CONCAT("R$ ", FORMAT(e.exib_vlr_ingresso, 2, 'de_DE')) AS "VALOR_INGRESSO",
CONCAT("R$ ", FORMAT(SUM(e.exib_vlr_ingresso * e.exib_qt_pessoas), 2, 'de_DE')) as "VALOR_ARRECADADO"
FROM cinema c
INNER JOIN exibicao e ON c.cine_codigo = e.cine_codigo
GROUP BY c.cine_nome
UNION
SELECT
	NULL,
    NULL,
    "TOTAL ARRECADADO",
    CONCAT("R$ ", FORMAT(SUM(e.exib_vlr_ingresso * e.exib_qt_pessoas), 2, 'de_DE'))
FROM cinema c
INNER JOIN exibicao e ON c.cine_codigo = e.cine_codigo;