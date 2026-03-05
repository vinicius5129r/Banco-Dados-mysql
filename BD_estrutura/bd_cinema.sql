create database bd_cinema;

create table cinema(
cine_id int(5) auto_increment,
cine_nome varchar(100) not null,
cine_cnpj varchar(18) not null,
cine_lotacao int(3) not null,
primary key pk_cinema(cine_id),
unique key uk_cinemacnpj(cine_cnpj));

create table genero(
gene_id int(5) auto_increment,
gene_nome varchar(100) not null,
primary key pk_genero(gene_id),
unique key uk_genero_nome(gene_nome));

create table filme(
film_id int(5) auto_increment,
film_titulo varchar(100) not null,
film_ano int(4) not null,
film_faixa_etaria int(2) not null,
gene_id int(5) not null,
primary key pk_filme(film_id),
foreign key fk_filme_genero(gene_id) references genero(gene_id));

create table exibicao(
cine_id int(5) not null,
film_id int(5) not null,
exib_dt_inicio date not null,
exib_dt_fim date not null,
exib_vl_ingresso decimal(10,2),
primary key pk_exibicao(cine_id, film_id),
foreign key fk_exibicao_cinema(cine_id) references cinema(cine_id),
foreign key fk_exibicao_filme(film_id) references filme(film_id));

create table endereco(
ende_id int(5) auto_increment,
ende_rua varchar(100) not null,
ende_numero varchar(5) not null,
ende_bairro varchar(100) not null,
ende_cidade varchar(100) not null,
ende_uf char(2) not null,
cine_id int(5) not null,
primary key pk_endereco(ende_id),
foreign key fk_endereco_cinema(cine_id) references cinema(cine_id));

-- ADICIONA NOVO CAMPO
alter table cinema add column cine_email varchar(50) not null;
alter table cinema add column cine_telefone varchar(20) not null;

-- REMOVER UMA COLUNA
alter table cinema drop cine_telefone;

-- ALTERAR O TAMANHO DE UMA COLUNA
alter table cinema modify cine_email varchar(100);

-- CRIAR INDEX
create index ix_cinema_nome on cinema(cine_nome);