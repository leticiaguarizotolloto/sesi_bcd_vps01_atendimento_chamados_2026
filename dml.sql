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