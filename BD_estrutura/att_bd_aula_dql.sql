-- 1) criar banco de dados
create database bd_aula_dql;
-- usar sem clica
use bd_aula_dql;
-- criando tabela
create table aluno(
alun_matricula int(5) auto_increment,
alun_nome varchar(100) not null,
alun_dt_nascimento date not null,
alun_cpf varchar(14) not null, 
alun_email varchar(100) not null,
alun_sexo char(1) not null,
primary key pk_aluno(alun_matricula),
index ix_aluno_nome(alun_nome),
unique key uk_aluno_cpf(alun_cpf),
unique key uk_aluno_email(alun_email));

-- 2) inserir 9 registros
insert into aluno(alun_matricula, alun_nome, alun_dt_nascimento, alun_cpf, alun_email, alun_sexo) values 
	(1111, "João Souza", "2002-10-10", "699.885.555-55", "joao@hotmail.com", "M"),
    (2222, "Karina Aguiar", "2004-08-01", "599.885.522-22", "karina@gmail.com", "F"),
    (3333, "Joana Gusmão", "2009-09-22", "499.833.355-55", "joana@ifro.edu.br", "F"),
    (4444, "Ana Silva", "2001-01-17", "999.787.855-65", "ana@yahoo.com", "F"),
    (5555, "Catarina Perez", "2003-07-26", "689.545.455-55", "joao@gmail.com", "F"),
    (6666, "Carlos Cardoso", "2006-12-28", "777.885.544-44", "carlos@ifro.edu.br", "M"),
    (7777, "Juliano Sabino", "2005-05-11", "555.922.223-33", "juliano@yahoo.com", "M"),
    (8888, "Armando Brito", "2003-02-21", "333.811.122-25", "armanda@gmail.com", "M"),
    (9999, "Aline Lopes", "2000-08-03", "222.845.552-15", "aline@gmail.com", "F");
    
-- 3) select mostra todos os registros
select * from aluno;

-- 4) select organizado
select 
	a.alun_nome as "Nome",
    a.alun_email as "Email", 
    a.alun_sexo as "Sexo"
from aluno a;

