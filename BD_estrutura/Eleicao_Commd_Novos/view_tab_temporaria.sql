-- view
create view vw_filmes_cinema_ro as
select
	c.cine_nome as "CINEMA",	
    concat("RUA: ", c.cine_rua, " Nº: ", c.cine_numero, " Bairro: ", c.cine_bairro, " Cidade: ", c.cine_cidade, " UF: ", c.cine_uf) as "Endereço",
    c.cine_lotacao as "Lotação",
    f.film_titulo as "Filme", 
    f.film_faixa_etaria as "Faixa_Etária"
from exibicao e
inner join cinema c on e.cine_codigo = c.cine_codigo
inner join filme f on e.film_codigo = f.film_codigo
where c.cine_uf = "RO";