create database bd_agencia_turismo;

use bd_agencia_turismo;

create table passageiro(
pass_id int(5) auto_increment,
pass_nome varchar(80) not null,
pass_cpf char(14) not null,
pass_rg varchar(20) not null,
pass_email varchar(80) not null,
primary key pk_passageiro(pass_id),
unique key uk_passageiro_cpf(pass_cpf),
index ix_passageiro_nome(pass_nome));

create table bilhete(
bilh_id int(5) auto_increment,
bilh_origem varchar(40) not null,
bilh_destino varchar(40) not null,
bilh_dt_voo date not null,
bilh_status varchar(15),
pass_id int(5) not null,
primary key pk_bilhete(bilh_id),
foreign key fk_bilhete_passageiro(pass_id) references passageiro(pass_id),
index ix_bilhete_origem(bilh_origem),
index ix_bihete_destino(bilh_destino),
index ix_bilhete_data(bilh_dt_voo));

insert into passageiro(pass_nome, pass_cpf, pass_rg, pass_email) values
("Ana Paula Ribeiro", "12345678901", "1234", "ana.ribeiro@hotmail.com"),
("Bruno Silva Lima", "98765432100", "4567", "bruno.lima@uol.com.br"),
("Carla Mendes Souza", "45678912300", "5888", "carla.souza@gmail.com"),
("Diego Almeida Rocha", "74185296300", "7987", "diego.rocha@ifro.edu.br"),
("Elisa Fernandes Costa", "15935745600", "2244", "elisa.costa@outlook.com");

select * from passageiro;