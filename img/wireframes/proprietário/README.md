# Wireframes do proprietário (T-PRO)

Milestone 2 · Protótipo de interface · Fábrica de Software I

Protótipo da plataforma Hospedagem Familiar. Wireframes de média fidelidade das telas do proprietário autenticado, em 1024x640 (desktop). Escala de cinza com um acento azul; a ação principal de cada tela é o botão azul preenchido. A navegação fica no topo: Painel, Hospedagens, Reservas, Avaliações e Minha conta. As telas do hóspede estão no documento separado Wireframes do cliente (T-CLI).

## Tabela de telas

A coluna "Páginas" indica a página do PDF do protótipo em que a tela aparece. O caso de uso segue o nome usado nos diagramas corrigidos.

| ID | Arquivo | Tela | Páginas | Caso de uso | RF |
|---|---|---|---|---|---|
| T-PRO-01 | [T-PRO-01-painel.svg](T-PRO-01-painel.svg) | Painel do proprietário | 12, 25, 26, 27 | Consultar reservas; Gerar relatórios de reservas | RF15, RF16 |
| T-PRO-02 | [T-PRO-02-gerenciar-hospedagens.svg](T-PRO-02-gerenciar-hospedagens.svg) | Gerenciamento de hospedagens | 15 | Cadastrar hospedagem; Publicar hospedagem | RF05, RF07 |
| T-PRO-03 | [T-PRO-03-cadastro-hospedagem.svg](T-PRO-03-cadastro-hospedagem.svg) | Cadastro de hospedagem | 40 | Cadastrar hospedagem; Definir preços por período | RF05, RF06 |
| T-PRO-04 | [T-PRO-04-editar-hospedagem.svg](T-PRO-04-editar-hospedagem.svg) | Editar hospedagem | 41 | Cadastrar hospedagem; Definir preços por período | RF05, RF06, RF07 |
| T-PRO-05 | [T-PRO-05-calendario-disponibilidade.svg](T-PRO-05-calendario-disponibilidade.svg) | Calendário de disponibilidade | 13 | Informar disponibilidade | n/a |
| T-PRO-06 | [T-PRO-06-perfil-proprietario.svg](T-PRO-06-perfil-proprietario.svg) | Meu perfil | 26, 27 | Alterar dados cadastrais | RF17 |
| T-PRO-07 | n/a | Estado: erro ao carregar hospedagens | 24 | n/a | n/a |

A T-PRO-07 ainda não tem wireframe próprio, porque é a mesma tela do hóspede (T-CLI-14). As telas de acesso e de cadastro de proprietário (páginas 16 a 19 e 34, 35) são comuns e pertencem às telas públicas.

## Telas

### T-PRO-01 Painel do proprietário
![Painel do proprietário com indicadores de hospedagens ativas, reservas do mês e ganhos estimados, e tabela de próximas reservas](T-PRO-01-painel.svg)

### T-PRO-02 Gerenciamento de hospedagens
![Lista de hospedagens em cards com foto, título, preço, situação e botões Editar e Calendário](T-PRO-02-gerenciar-hospedagens.svg)

### T-PRO-03 Cadastro de hospedagem
![Cadastro de hospedagem com abas Fotos, Informações, Comodidades, Regras e Preços](T-PRO-03-cadastro-hospedagem.svg)

### T-PRO-04 Editar hospedagem
![Edição de hospedagem com as cinco abas e o botão Salvar alterações](T-PRO-04-editar-hospedagem.svg)

### T-PRO-05 Calendário de disponibilidade
![Calendário mensal com dias disponíveis, reservados e bloqueados, resumo do mês e legenda](T-PRO-05-calendario-disponibilidade.svg)

### T-PRO-06 Meu perfil
![Perfil do proprietário com nome, tipo de conta, cidade, quantidade de hospedagens e dados cadastrais](T-PRO-06-perfil-proprietario.svg)

## Notas de comportamento

**T-PRO-01.** Mostra boas-vindas, o botão "Cadastrar hospedagem" e três indicadores: hospedagens ativas (com a variação "este mês"), reservas do mês e ganhos estimados. Embaixo, uma tabela de próximas reservas com hóspede, hospedagem, check-in, check-out e situação. Só contas de proprietário entram aqui. Conta de hóspede cai na tela de área bloqueada (T-CLI-16).

**T-PRO-02.** Lista as hospedagens do proprietário em cards com foto, título, preço por noite e situação (publicada ou não). Cada card tem os botões Editar e Calendário.

**T-PRO-03.** O cadastro é dividido em cinco abas: Fotos, Informações, Comodidades, Regras e Preços. Na aba Fotos, o proprietário adiciona fotos, e a ordem delas define a exibição (RF05). O botão principal avança para a próxima aba.

**T-PRO-04.** Usa as mesmas cinco abas do cadastro, já preenchidas. O botão principal é "Salvar alterações".

**T-PRO-05.** Mostra o mês de uma hospedagem, com dias disponíveis, reservados e bloqueados. A tela tem um resumo do mês e uma legenda.

**T-PRO-06.** Mostra nome, tipo de conta (Proprietário), cidade e quantidade de hospedagens, com o botão "Editar perfil" (RF17).

**T-PRO-07.** Informa que os dados não foram perdidos e oferece "Tentar novamente" e "Voltar".

## Divergências

1. **Cupons (RF08).** Nenhuma tela do protótipo permite criar, ativar ou desativar cupons. O RF08 e o diagrama de casos de uso têm esse fluxo. Falta a tela.
2. **Reservas do proprietário e relatórios (RF15, RF16).** O menu tem o item "Reservas", mas não há tela dedicada para o proprietário. Os relatórios só existem como indicadores do painel, sem filtro por período ou hospedagem.
3. **Preços por período (RF06).** A aba Preços aparece nas abas, mas o protótipo não mostra o conteúdo dela. As telas 40 e 41 detalham apenas a aba Fotos. Nos wireframes, as outras abas ficaram sem conteúdo.
4. **Publicar hospedagem (RF07).** Não identifiquei controle de publicação no protótipo. O wireframe T-PRO-02 mostra só o texto da situação.
5. **Disponibilidade.** A tela de calendário existe (página 13), mas não há RF de disponibilidade na lista nova.
6. **Avaliações.** O menu do proprietário tem "Avaliações", mas a única tela de avaliações do protótipo (página 14) é a do hóspede. Falta a visão do proprietário sobre as avaliações recebidas.
7. **Quantidade de hospedagens.** O painel mostra 04 hospedagens ativas (página 12), mas o perfil mostra 10 (página 26) e 3 (página 27). A data do calendário (agosto de 2025) também está desatualizada.
8. **Ganhos estimados.** O indicador aparece cortado no protótipo (página 25) e não há RF que defina como ele é calculado.
9. **Conta única.** O RF01 permite cadastrar usuário "cliente e/ou proprietário", mas a tela de área bloqueada (página 29) exige criar outra conta de proprietário. É preciso decidir se uma pessoa pode ter os dois papéis.
10. **Situação da reserva.** O caso de uso "Atualizar situação da reserva" foi retirado dos diagramas, porque nenhum requisito o prevê. As telas do proprietário não têm essa ação.
11. **Marcadores nos wireframes.** Textos como "[ valor ]" e "[ IMG ]" são marcadores e devem ser trocados pelos dados reais.

## Veja também

- [Wireframes do cliente (T-CLI)](../cliente/README.md)
- [Requisitos funcionais](../../requisitos-funcionais.md)
- [Casos de uso](../../casos-de-uso/README.md)