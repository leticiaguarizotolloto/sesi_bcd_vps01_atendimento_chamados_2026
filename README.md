# VPF 01 -  Banco de Dados
## Desafio: 
### Atendimentos a chamados

|Entidade|Atributos básicos|Descrição|
|--------|-----------------|---------|
|Usuário|id, nome, email, telefone, departamento, cargo, status|Pessoa que solicita ou recebe atendimento|
|Chamado|id, titulo, descricao, data_abertura, data_fechamento, status, prioridade, id_usuario, id_categoria, id_tecnico|Registra a solicitação ou incidente|
|Técnico|id, nome, email, especialidade, status	|Profissional responsável pelo atendimento do chamado|
|Categoria|	id, nome, descricao	|Classifica o chamado, por exemplo: Hardware, Software, Rede ou Acesso|
|Histórico/Comentários|	id, id_chamado, id_usuario, data_hora, descricao, tipo|	Armazena comentários, atualizações e ações realizadas durante o atendimento e Solução|
## MER DER Conceitual e Lógico
![MER/DER](./MER%20DER%20conceitual%20e%20lógico%20bcd%20chamados%20de%20TI.drawio.png)

## Dados de teste em CSV
<a href="categoria.csv">categoria.csv</a>
<a href="chamado.csv">chamado.csv</a>
<a href="tecnico.csv">tecnico.csv</a>
<a href="historico.csv">historico.csv</a>
<a href="usuário.csv">usuário.csv</a>

## Script SQL DDL (Desenvolvimento: Criação do Banco de dados)

```
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
```

## Script SQL DML(Manipulação: População com dados de teste)

```
use chamados_ti;

insert into usuario
values
(null, 'leticia guarizo', 'leticia@email.com', '19999990001', 'financeira', 'analista financeira', 'ativo'),
(null, 'eloisa macedo', 'eloisa@email.com', '19999990002', 'recursos humanos', 'assistente de rh', 'ativo'),
(null, 'alicia coelho', 'alicia@email.com', '19999990003', 'administrativa', 'assistente administrativa', 'ativo'),
(null, 'mariana correia', 'mariana@email.com', '19999990004', 'marketing', 'analista de marketing', 'ativo'),
(null, 'carolina santos', 'carolina@email.com', '19999990005', 'vendas', 'vendedora', 'inativo');

select * from usuario;


insert into tecnico
values
(null, 'jessica vaz', 'jessica@empresa.com', 'hardware', 'ativo'),
(null, 'joao nora', 'joao@empresa.com', 'software', 'ativo'),
(null, 'pedro souza', 'pedro@empresa.com', 'redes', 'ativo'),
(null, 'liara tolloto', 'liara@empresa.com', 'seguranca', 'ativo');

select * from tecnico;
```

## Dicionário de dados
| Entidade  | Atributo        | Tipo     | Tamanho | Descrição                                            |
| --------- | --------------- | -------- | ------: | ---------------------------------------------------- |
| Usuário   | id_usuario      | INT      |      11 | Chave primária do usuário                            |
| Usuário   | nome            | VARCHAR  |     100 | Nome completo do usuário                             |
| Usuário   | email           | VARCHAR  |     100 | E-mail do usuário                                    |
<<<<<<< HEAD
| Usuário   | telefone        | VARCHAR  |      15| Telefone do usuário                                  |
=======
| Usuário   | telefone        | VARCHAR  |      20| Telefone do usuário                                  |
>>>>>>> 20ddfa555f647dee700b83a77762ec56229b6183
| Usuário   | departamento    | VARCHAR  |      50 | Departamento onde o usuário trabalha                 |
| Usuário   | cargo           | VARCHAR  |      50 | Cargo ocupado pelo usuário                           |
| Usuário   | status          | VARCHAR  |      20 | Situação do usuário                                  |
| Técnico   | id_tecnico      | INT      |      11 | Chave primária do técnico                            |
| Técnico   | nome            | VARCHAR  |     100 | Nome completo do técnico                             |
| Técnico   | email           | VARCHAR  |     100 | E-mail do técnico                                    |
| Técnico   | especialidade   | VARCHAR  |     100 | Área de especialidade do técnico                     |
| Técnico   | status          | VARCHAR  |      20 | Situação do técnico                                  |
| Categoria | id_categoria    | INT      |      11 | Chave primária da categoria                          |
| Categoria | nome            | VARCHAR  |      50 | Nome da categoria                                    |
| Categoria | descricao       | VARCHAR  |     100 | Descrição da categoria                               |
| Chamado   | id_chamado      | INT      |      11 | Chave primária do chamado                            |
| Chamado   | titulo          | VARCHAR  |     150 | Título do chamado                                    |
| Chamado   | descricao       | TEXT     |       — | Descrição detalhada do problema                      |
| Chamado   | data_abertura   | DATETIME |       — | Data e hora de abertura                              |
| Chamado   | data_fechamento | DATETIME |       — | Data e hora de fechamento                            |
| Chamado   | status          | VARCHAR  |      30 | Situação atual do chamado                            |
| Chamado   | prioridade      | VARCHAR  |      20 | Nível de prioridade                                  |
| Chamado   | id_usuario      | INT      |      11 | Chave estrangeira do usuário solicitante             |
| Chamado   | id_categoria    | INT      |      11 | Chave estrangeira da categoria                       |
| Chamado   | id_tecnico      | INT      |      11 | Chave estrangeira do técnico responsável             |
| Histórico | id_historico    | INT      |      11 | Chave primária do histórico                          |
| Histórico | id_chamado      | INT      |      11 | Chave estrangeira do chamado                         |
| Histórico | id_usuario      | INT      |      11 | Chave estrangeira do usuário que realizou o registro |
| Histórico | data_hora       | DATETIME |       — | Data e hora do registro                              |
| Histórico | descricao       | TEXT     |       — | Descrição da atualização ou ação                     |
<<<<<<< HEAD
| Histórico | tipo            | VARCHAR  |      30 | Tipo do registro realizado    
=======
| Histórico | tipo            | VARCHAR  |      30 | Tipo do registro realizado                           |

                      
>>>>>>> 20ddfa555f647dee700b83a77762ec56229b6183
