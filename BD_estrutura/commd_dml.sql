insert into cinema (cine_nome, cine_cnpj, cine_lotacao, cine_email)
values ("Cine Araújo", "12.000.555/0001-22", 80, "cine_araujo@gmail.com");

insert into cinema (cine_nome, cine_cnpj, cine_lotacao, cine_email)
values ("Cine Super K", "10.000.888/0001-88", 120, "cine_superk@gmail.com"),
	   ("Cinemax", "15.333.333/0001-25", 100, "cinemax@gmail.com");
       
insert into genero (gene_nome)
values ("AÇÃO"), ("AVENTURA"), ("COMÉDIA"), ("TERROR");


insert into filme (film_titulo, film_ano, film_faixa_etaria, gene_id)
values ("PÂNICO 7", 2026, 14, 4), ("AVATAR: FOGO E CINZAS", 2025, 14, 2), ("ZOOTOPIA 2", 2026, 0, 3); 

insert into endereco (ende_rua, ende_numero, ende_bairro, ende_cidade, ende_uf, cine_id)
values ("Rua Brasil", "55", "Centro", "Porto Velho", "RO", 1), ("Rua Azul", "100", "Centro", "Boa Vista", "RR", 2), ("Rua Salgado", "500", "Centro", "Manaus", "AM", 3); 

insert into exibicao (cine_id, film_id, exib_dt_inicio, exib_dt_fim, exib_vl_ingresso)
values ( 1, 2, "2026-02-01", "2026-03-31", 30.00), ( 1, 3, "2026-03-01", "2026-03-31", 45.00), ( 2, 3, "2026-04-01", "2026-04-25", 60.00), ( 3, 3, "2026-04-25", "2026-05-01", 159.00), ( 2, 2, "2026-05-01", "2026-05-18", 77.00), ( 1, 1, "2026-06-02", "2026-06-31", 300.00);

-- UPDATE

update cinema
set cine_lotacao = 150
where cine_nome = "Cine Araújo";

update cinema
set cine_lotacao = 170,
	cine_email = "cine.araujo@gmail.com"
where cine_nome = "Cine Araújo";

-- delete
delete from exibicao
where film_id = 3;

select * from cinema;
select * from genero;
select * from filme;
