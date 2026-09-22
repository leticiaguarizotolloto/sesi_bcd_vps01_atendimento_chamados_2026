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
| Histórico | tipo            | VARCHAR  |      30 | Tipo do registro realizado                           |

                      
