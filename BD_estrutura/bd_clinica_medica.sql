-- a)
create database bd_clinica_medica;

-- b) 
create table funcionario(
func_matricula varchar(15) not null,
func_nome varchar(40) not null,
func_dt_nascimento date not null,
func_dt_adimissao date not null,
func_cargo varchar(40) not null default "Assistente Médico",
func_salario float not null default "510.00",
primary key pk_funcionario(func_matricula));

-- c)
create table consultorio(
cons_n_consultorio int(5) auto_increment,
cons_andar int(2) not null,
primary key pk_consultorio(cons_n_consultorio),
unique key uk_consultorio(cons_andar));

-- d)
create table medico(
medi_codigo int(5) auto_increment,
medi_nome varchar(100) not null,
medi_crm varchar(10) not null,
medi_especialidade varchar(50) not null,
primary key pk_medico(medi_codigo));

-- e)
create table paciente(
paci_codigo int(5) auto_increment,
paci_nome varchar(100) not null,
paci_dt_nascimento date not null,
paci_sexo varchar(15) not null,
primary key pk_paciente(paci_codigo));

-- f)
create table consulta(
cons_codigo int(5) auto_increment,
medi_codigo int(5) not null,
paci_codigo int(5) not null,
cons_dt_consulta timestamp not null,
cons_diagnostico text not null,
primary key pk_consulta(cons_codigo),
foreign key fk_consulta_medico(medi_codigo) references medico(medi_codigo),
foreign key fk_consulta_paciente(paci_codigo) references paciente(paci_codigo));



drop database bd_clinica_medica;