# sesi_bcd_vps01_atendimento_chamados_2026
Banco de dados Atendimento de chamados de TI
Um banco de dados de atendimento a chamados de TI que precisa registrar quem solicita o atendimento, qual é o problema, quem o atende, seu andamento e a solução aplicada.
<img src="(<MER DER conceitual e lógico bcd chamados de TI.drawio.png>)" alt="Imagem MER DER Lógico e Conceitual">

## Dicionário de dados
| Entidade  | Atributo        | Tipo     | Tamanho | Descrição                                            |
| --------- | --------------- | -------- | ------: | ---------------------------------------------------- |
| Usuário   | id_usuario      | INT      |      11 | Chave primária do usuário                            |
| Usuário   | nome            | VARCHAR  |     100 | Nome completo do usuário                             |
| Usuário   | email           | VARCHAR  |     100 | E-mail do usuário                                    |
| Usuário   | telefone        | VARCHAR  |      20| Telefone do usuário                                  |
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
| Histórico | tipo            | VARCHAR  |      30 | Tipo do registro realizado    

                       |

## Script SQL DDL (Desenvolvimento: Criação do Banco de dados)

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
    departamento varchar(100),
    cargo varchar (100),
    status enum('ATIVO','BANIDO') not null
);
-- Criar a tabela de Chamado
create table chamado(
    id int primary key not null auto_increment,
    titulo varchar (100) not null,
    descricao text not null,
    data_abertura datetime not null,
    data_fechamento datetime not null,
    status enum('ABERTO','FECHADO') not null,
    prioridade enum('BAIXA','MEDIA', 'ALTA', 'URGENTE'),
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
    status enum('ATIVO','INATIVO') not null
);
--Criar tabela de Categoria
create table categoria(
     id int primary key not null auto_increment,
     nome varchar (100) not null,
     descricao text
);
--Criar tabela de Histórico
create table historico(
    id int primary key not null auto_increment,
    id_chamado int not null,
    id_usuario int not null,
    data_hora datetime not null, 
    descricao text,
    tipo varchar (100) not null

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

## Script SQL DML(Manipulação: População com dados de teste)
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


insert into categoria
values
(null, 'hardware', 'problemas relacionados a computadores e equipamentos'),
(null, 'software', 'problemas relacionados a programas e sistemas'),
(null, 'rede', 'problemas relacionados a internet e conexoes'),
(null, 'acesso', 'problemas relacionados a senhas e permissoes');

select * from categoria;


insert into chamado
values
(null, 'computador nao liga', 'o computador do setor financeiro nao liga.', '2026-09-15 08:30:00', '2026-09-15 10:30:00', 'fechado', 'alta', 1, 1, 1),

(null, 'erro no sistema', 'o sistema apresenta erro ao realizar o login.', '2026-09-16 09:15:00', null, 'em andamento', 'media', 2, 2, 2),

(null, 'internet lenta', 'a internet esta muito lenta no setor administrativo.', '2026-09-17 10:00:00', null, 'aberto', 'alta', 3, 3, null),

(null, 'senha bloqueada', 'o usuario nao consegue acessar sua conta.', '2026-09-18 13:20:00', '2026-09-18 14:00:00', 'fechado', 'baixa', 4, 4, 4),

(null, 'impressora nao imprime', 'a impressora do setor de vendas nao esta imprimindo.', '2026-09-19 14:10:00', null, 'em andamento', 'media', 5, 1, 1);

select * from chamado;


insert into historico
values
(null, 1, 1, '2026-09-15 09:00:00', 'tecnico iniciou a verificacao do computador.', 'atendimento'),

(null, 1, 1, '2026-09-15 10:30:00', 'computador foi reparado e o chamado foi encerrado.', 'solucao'),

(null, 2, 2, '2026-09-16 10:00:00', 'tecnico iniciou a analise do erro de login.', 'atendimento'),

(null, 3, 3, '2026-09-17 10:30:00', 'foi identificada uma possivel falha na conexao de rede.', 'atendimento'),

(null, 4, 4, '2026-09-18 13:40:00', 'senha do usuario foi redefinida.', 'solucao'),

(null, 5, 5, '2026-09-19 14:30:00', 'tecnico iniciou a verificacao da impressora.', 'atendimento');

select * from historico;
