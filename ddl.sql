bancodedados_atendimentoti-- DDL (Data Definition Language)
-- CRUD (Create, [Describe, Show], Alter, Drop)
drop database if exists bcd_atendimentoti;
-- Criar o Banco de dados
create database ;
-- Acessa o Banco de dados
use bcd_atendimentoti;
-- Criar a tabela de Usuário
create table usuario(
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    email varchar(100) not null unique,
    telefone varchar(15) unique,
    departamento varchar(50),
    cargo varchar (50),
    status enum('ATIVO','BANIDO')(20) not null
);
-- Criar a tabela de Chamado
create table chamado(
    id int primary key not null auto_increment,
    titulo varchar (150) not null,
    descricao text not null,
    data_abertura datetime not null,
    data_fechamento datetime not null,
    status enum('ABERTO','FECHADO')(30) not null,
    prioridade enum('BAIXA','MEDIA', 'ALTA', 'URGENTE')(20),
    id_usuario int not null,
    id_categoria int not null, 
    id_tecnico int
);
-- Criar tabela de Técnico
create table tecnico(
    id int primary key not null auto_increment,
    nome varchar (100) not null, 
    email varchar(100) not null unique,
    especialidade varchar(100), 
    status enum('ATIVO','INATIVO')(20) not null
);
--Criar tabela de Categoria
create table categoria(
     id int primary key not null auto_increment,
     nome varchar (50) not null,
     descricao text (255)
);
--Criar tabela de Histórico
create table historico(
    id int primary key not null auto_increment,
    id_chamado int not null,
    id_usuario int not null,
    data_hora datetime not null, 
    descricao text,
    tipo varchar (30) not null

);
-- Criar as chaves estrangeiras (Relacionamentos)
alter table chamado
add constraint fk_chamado_usuario
foreign key (id_usuario)
references usuario(id);

alter table chamado
add constraint fk_chamado_categoria
foreign key (id_categoria)
references categoria(id);

alter table chamado
add constraint fk_chamado_tecnico
foreign key (id_tecnico)
references tecnico(id);

alter table historico
add constraint fk_historico_chamado
foreign key (id_chamado)
references chamado(id);

alter table historico
add constraint fk_historico_usuario
foreign key (id_usuario)
references usuario(id);

-- Vendo as tabelas criadas
show tables;
describe usuario;
describe chamado;
describe tecnico;
describe categoria;
describe historico