# Casos de uso

Fábrica de Software I · Modelagem UML · Casos de uso do Hospedagem Familiar (plataforma de hospedagem e reservas)

Este documento descreve o que os atores fazem com o sistema, sem falar de tabelas, telas ou classes. A fronteira é a própria plataforma Hospedagem Familiar; tudo fora dela (e-mail, conta Google, meios de pagamento) é infraestrutura. Cada caso de uso (UC) tem um identificador fixo, usado em todos os artefatos do projeto: requisitos, histórias, diagramas e matriz de rastreabilidade.

Itens marcados com **(a confirmar)** foram deduzidos do protótipo e não estão escritos nos requisitos. Devem ser validados pelo grupo.

## Diagrama

Os diagramas estão no arquivo [Diagramas_Casos_de_Uso_Corrigidos.drawio](Diagramas_Casos_de_Uso_Corrigidos.drawio), com uma página por diagrama:

1. Acesso à plataforma (UC-01 a UC-05)
2. Gestão de hospedagens e cupons (UC-06 a UC-10)
3. Busca e reserva de hospedagem (UC-11 a UC-16)
4. Acompanhamento e avaliação (UC-17 a UC-19)

A matriz abaixo é a referência completa.

## Atores

| ID | Ator | Vínculo | Resumo do que faz |
|---|---|---|---|
| ACT-01 | Cliente (hóspede) | conta de cliente | Pesquisa hospedagens, reserva, paga, cancela, consulta as próprias reservas e avalia a hospedagem |
| ACT-02 | Proprietário | conta de proprietário | Cadastra, publica e mantém hospedagens, define preços e disponibilidade, gerencia cupons, consulta reservas e relatórios |

Os dois atores generalizam o ator **Usuário**, que representa o que é comum a ambos: cadastrar-se, autenticar-se, recuperar a senha e alterar os próprios dados. O RF01 prevê cadastro de cliente e/ou proprietário. Ver divergência D6.

O Administrador aparece no minimundo, mas nenhum requisito nem tela define o que ele faz. Por isso não consta como ator neste documento. Ver divergência D3.

## Fronteira do sistema

Dentro da fronteira: cadastro e autenticação, hospedagens e seus preços, disponibilidade, cupons, reservas, registro de pagamentos, avaliações e relatórios. Fora dela: o provedor de e-mail (confirmação de reserva e código de recuperação de senha), a conta Google usada no login e os meios de pagamento. O sistema registra o pagamento, e a cobrança em si fica fora **(a confirmar)**.

## Relações entre casos de uso

**Include (inclusão).** O comportamento incluído é obrigatório.

- UC-01 inclui UC-02. O cadastro exige o endereço (segunda etapa do cadastro).
- UC-06 inclui UC-07. Cadastrar hospedagem exige definir preços (aba Preços).
- UC-13 inclui UC-12. Para reservar, o cliente escolhe antes uma hospedagem, pela pesquisa.
- UC-13 inclui UC-14. A reserva só é confirmada com o pagamento registrado.

Autenticar-se (UC-03) é comportamento comum a todos os casos de uso protegidos. Por isso é tratado como pré-condição e não é repetido em cada fluxo.

**Extend (extensão).** O comportamento é opcional e depende de uma condição.

- UC-04 estende UC-03. Se o usuário esqueceu a senha, no passo do login, ele recupera a senha.
- UC-15 estende UC-13. No passo de cálculo do valor, o cliente pode aplicar um cupom, mas não é obrigatório.

## Matriz ator x caso de uso

X = executa o caso de uso. Em branco = sem acesso.

| UC | Caso de uso | ACT-01 Cliente | ACT-02 Proprietário |
|---|---|---|---|
| UC-01 | Cadastrar-se | X | X |
| UC-02 | Informar endereço | X | X |
| UC-03 | Autenticar | X | X |
| UC-04 | Recuperar senha | X | X |
| UC-05 | Alterar dados cadastrais | X | X |
| UC-06 | Cadastrar hospedagem | | X |
| UC-07 | Definir preços por período | | X |
| UC-08 | Publicar hospedagem | | X |
| UC-09 | Informar disponibilidade | | X |
| UC-10 | Gerenciar cupons | | X |
| UC-11 | Registrar preferências | X | |
| UC-12 | Pesquisar hospedagem | X | |
| UC-13 | Solicitar reserva | X | |
| UC-14 | Registrar pagamento combinado | X | |
| UC-15 | Aplicar cupom | X | |
| UC-16 | Cancelar reserva | X | |
| UC-17 | Avaliar hospedagem | X | |
| UC-18 | Consultar reservas | X | X |
| UC-19 | Gerar relatórios de reservas | | X |

Na matriz, o Cliente vê só as próprias reservas e o Proprietário vê as reservas das próprias hospedagens (UC-18).

## Especificação dos casos de uso

Convenções: os passos do fluxo principal são numerados. Cada extensão recebe o número do passo em que se bifurca, seguido de letra (3a, 3b). Como o projeto ainda não define API, as respostas de erro são descritas como mensagens ao usuário.

### UC-01 Cadastrar-se

| Campo | Detalhe |
|---|---|
| Ator principal | Usuário (ACT-01 ou ACT-02) |
| Pré-condições | Nenhuma |
| Pós-condições | Conta criada como cliente e/ou proprietário, com endereço registrado |
| RF | RF01, RF04 |
| US | a definir |

**Fluxo principal**

1. O ator escolhe o tipo de conta: cliente ou proprietário.
2. Cliente informa nome completo, CPF, e-mail, celular, senha, confirmação da senha e data de nascimento. Proprietário informa nome completo ou razão social, CPF ou CNPJ, e-mail, celular, senha e confirmação.
3. O sistema valida os dados.
4. O ator informa o endereço (UC-02).
5. O sistema cria a conta e confirma o cadastro.

**Extensões**

- 3a. E-mail ou CPF/CNPJ já cadastrado: recusado, e o ator é orientado a entrar.
- 3b. Senha e confirmação diferentes: recusado.
- 3c. Dados inválidos (CPF, celular, data de nascimento): recusado com a mensagem de validação.

**Regras de negócio**

- O cadastro usa duas etapas: dados pessoais e endereço.
- Uma mesma pessoa poder ter conta de cliente e de proprietário **(a confirmar)**. Ver D6.

### UC-02 Informar endereço

| Campo | Detalhe |
|---|---|
| Ator principal | Usuário (ACT-01 ou ACT-02) |
| Pré-condições | Em cadastro (UC-01) ou usuário autenticado (UC-03) |
| Pós-condições | Endereço registrado ou atualizado |
| RF | RF04 |
| US | a definir |

**Fluxo principal**

1. O ator informa CEP, estado, cidade, bairro, logradouro, número da residência e, opcionalmente, complemento.
2. O sistema valida os campos.
3. O sistema grava o endereço.

**Extensões**

- 2a. CEP inválido ou campo obrigatório vazio: recusado com a mensagem de validação.

**Regras de negócio**

- O mesmo caso de uso serve para cadastrar e para alterar o endereço (RF04).

### UC-03 Autenticar

| Campo | Detalhe |
|---|---|
| Ator principal | Usuário (ACT-01 ou ACT-02) |
| Pré-condições | Conta cadastrada (UC-01) |
| Pós-condições | Sessão criada. O usuário volta à página em que estava, quando veio de uma tela protegida |
| RF | RF02 |
| US | a definir |

**Fluxo principal**

1. O ator informa e-mail e senha, ou escolhe entrar com a conta Google.
2. O sistema confere as credenciais.
3. O sistema cria a sessão e abre a área do tipo de conta do usuário.

**Extensões**

- 2a. Credenciais inválidas: recusado, sem informar qual campo está errado.
- 2b. Conta Google sem cadastro na plataforma: o ator é levado ao cadastro **(a confirmar)**.
- 1a. Usuário esqueceu a senha: estende para UC-04.

**Regras de negócio**

- Visitante não logado pode pesquisar hospedagens, mas precisa entrar para reservar e ver reservas.
- Conta de cliente não acessa a área do proprietário (tela de acesso bloqueado).

### UC-04 Recuperar senha

| Campo | Detalhe |
|---|---|
| Ator principal | Usuário (ACT-01 ou ACT-02) |
| Pré-condições | Conta cadastrada. Estende UC-03 |
| Pós-condições | Nova senha definida |
| RF | RF03 |
| US | a definir |

**Fluxo principal**

1. No login, o ator escolhe "Esqueceu a senha?".
2. Informa o e-mail da conta.
3. O sistema envia um código por e-mail.
4. O ator informa o código.
5. O ator define a nova senha e a confirma.
6. O sistema grava a senha e volta ao login.

**Extensões**

- 3a. E-mail não cadastrado: o sistema responde sem confirmar se o e-mail existe **(a confirmar)**.
- 4a. Código inválido ou expirado: recusado, com opção de reenviar.
- 5a. Senha e confirmação diferentes: recusado.

**Regras de negócio**

- O código é enviado por e-mail, que é um serviço fora da fronteira.

### UC-05 Alterar dados cadastrais

| Campo | Detalhe |
|---|---|
| Ator principal | Usuário (ACT-01 ou ACT-02) |
| Pré-condições | Usuário autenticado (UC-03) |
| Pós-condições | Dados do próprio perfil atualizados |
| RF | RF17 |
| US | a definir |

**Fluxo principal**

1. O ator abre "Minha conta" e escolhe editar.
2. Altera os dados desejados (nome, e-mail, celular, endereço).
3. O sistema valida e grava.

**Extensões**

- 2a. E-mail já em uso por outra conta: recusado.
- 2b. Alteração de endereço: segue UC-02.

**Regras de negócio**

- O ator só altera os próprios dados.

### UC-06 Cadastrar hospedagem

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-02 Proprietário |
| Pré-condições | Proprietário autenticado (UC-03) |
| Pós-condições | Hospedagem criada, ainda não publicada **(a confirmar)** |
| RF | RF05 |
| US | a definir |

**Fluxo principal**

1. O proprietário escolhe "Cadastrar hospedagem".
2. Na aba Fotos, adiciona as fotos e define a ordem de exibição.
3. Na aba Informações, preenche os dados do imóvel.
4. Na aba Comodidades, marca as comodidades.
5. Na aba Regras, informa as regras da hospedagem.
6. Na aba Preços, define os preços (UC-07).
7. O sistema valida e grava a hospedagem.

**Fluxo alternativo A: editar hospedagem**

A1. O proprietário abre uma hospedagem existente, em "Editar hospedagem".
A2. Altera as abas desejadas e salva.

**Extensões**

- 7a. Campo obrigatório vazio: recusado com a mensagem de validação.
- 2a. Arquivo que não é imagem: recusado **(a confirmar)**.
- 1a. Conta de cliente tenta acessar: tela de acesso bloqueado.

**Regras de negócio**

- A ordem das fotos define a exibição (RF05).
- Hospedagem só aparece nas buscas depois de publicada (UC-08).

### UC-07 Definir preços por período

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-02 Proprietário |
| Pré-condições | Hospedagem em cadastro ou edição (UC-06). Incluído por UC-06 |
| Pós-condições | Preços por período gravados |
| RF | RF06 |
| US | a definir |

**Fluxo principal**

1. Na aba Preços, o proprietário informa o valor da diária.
2. Informa os períodos com preço diferente, com data inicial, data final e valor.
3. O sistema valida e grava os preços.

**Extensões**

- 3a. Períodos sobrepostos: recusado **(a confirmar)**.
- 3b. Valor zero ou negativo: recusado.

**Regras de negócio**

- O cálculo da reserva usa o preço do período de cada noite.

### UC-08 Publicar hospedagem

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-02 Proprietário |
| Pré-condições | Hospedagem cadastrada com dados mínimos |
| Pós-condições | Hospedagem visível nas buscas dos clientes |
| RF | RF07 |
| US | a definir |

**Fluxo principal**

1. O proprietário abre a hospedagem em "Gerenciamento de hospedagens".
2. Escolhe publicar.
3. O sistema confere os dados mínimos e marca a hospedagem como publicada.

**Extensões**

- 3a. Dados incompletos (sem fotos, informações ou preços): recusado, indicando o que falta **(a confirmar)**.

**Regras de negócio**

- Só hospedagens publicadas aparecem em UC-12.

### UC-09 Informar disponibilidade

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-02 Proprietário |
| Pré-condições | Hospedagem cadastrada |
| Pós-condições | Dias marcados como disponíveis ou bloqueados |
| RF | sem RF na lista atual. Ver D2 |
| US | a definir |

**Fluxo principal**

1. O proprietário abre o calendário de disponibilidade da hospedagem.
2. Marca ou desmarca dias como bloqueados.
3. O sistema grava a disponibilidade.

**Extensões**

- 2a. Dia já reservado: não pode ser bloqueado.

**Regras de negócio**

- O calendário mostra dias disponíveis, reservados e bloqueados.
- O sistema não aceita reservas em dias bloqueados.

### UC-10 Gerenciar cupons

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-02 Proprietário |
| Pré-condições | Proprietário autenticado |
| Pós-condições | Cupom criado, alterado, ativado ou desativado |
| RF | RF08 |
| US | a definir |

**Fluxo principal**

1. O proprietário abre a lista de cupons.
2. Cria um cupom com código, valor ou percentual de desconto e validade **(a confirmar)**.
3. Ativa ou desativa o cupom quando necessário.
4. O sistema grava as alterações.

**Extensões**

- 2a. Código já existente: recusado.
- 2b. Desconto inválido: recusado.

**Regras de negócio**

- Só cupom ativo e dentro da validade pode ser aplicado (UC-15).
- Não há tela de cupons no protótipo. Ver D5.

### UC-11 Registrar preferências

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente |
| Pré-condições | Cliente autenticado |
| Pós-condições | Preferências gravadas |
| RF | RF09 |
| US | a definir |

**Fluxo principal**

1. O cliente abre "Personalize sua experiência".
2. Responde "O que você gosta?", escolhendo suas preferências.
3. O sistema grava as preferências.

**Extensões**

- 2a. Cliente pula a tela: nenhuma preferência é gravada, e a busca segue normalmente.

**Regras de negócio**

- As preferências orientam as sugestões da busca **(a confirmar)**.

### UC-12 Pesquisar hospedagem

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente (visitante também pode pesquisar) |
| Pré-condições | Nenhuma |
| Pós-condições | Nenhuma. Consulta apenas |
| RF | RF10 |
| US | a definir |

**Fluxo principal**

1. O cliente informa check-in, número de hóspedes e destino, e aplica filtros.
2. O sistema lista as hospedagens publicadas que atendem à busca.
3. O cliente abre uma hospedagem e vê preço, nota, avaliações, descrição, regras e política de cancelamento.

**Extensões**

- 2a. Nenhuma hospedagem encontrada: lista vazia, sem erro.
- 2b. Falha ao carregar: tela de erro com "Tentar novamente".

**Regras de negócio**

- Só aparecem hospedagens publicadas (UC-08).
- O preço exibido considera o desconto da hospedagem, quando houver.

### UC-13 Solicitar reserva

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente |
| Pré-condições | Cliente autenticado (UC-03). Hospedagem publicada |
| Pós-condições | Reserva criada com status "Reserva confirmada". Confirmação enviada por e-mail |
| RF | RF11 |
| US | a definir |

**Fluxo principal**

1. O cliente escolhe a hospedagem pela pesquisa (UC-12).
2. Seleciona as datas de check-in e check-out.
3. O sistema mostra o resumo e calcula o valor (diária multiplicada pelas noites). O cliente pode aplicar um cupom (UC-15).
4. O cliente lê e aceita o contrato de locação temporária.
5. O cliente registra o pagamento (UC-14).
6. O sistema cria a reserva, mostra a confirmação e envia e-mail.

**Extensões**

- 2a. Cliente não logado: o sistema pede login e volta para esta página depois.
- 2b. Datas indisponíveis ou em conflito com outra reserva: recusado.
- 2c. Check-out igual ou anterior ao check-in: recusado.
- 2d. Número de hóspedes acima da capacidade: recusado **(a confirmar)**.
- 4a. Cliente não aceita o contrato: a reserva não prossegue.

**Regras de negócio**

- Ciclo da reserva exibido ao cliente: Reserva confirmada, Check-in, Estadia em andamento e Check-out. Ver D8.
- O check-out deve ser feito até as 12:00.

### UC-14 Registrar pagamento combinado

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente |
| Pré-condições | Valor da reserva calculado. Incluído por UC-13 |
| Pós-condições | Pagamento registrado na reserva |
| RF | RF13 |
| US | a definir |

**Fluxo principal**

1. O cliente escolhe as formas de pagamento: cartão de crédito, dinheiro e Pix.
2. Informa o valor de cada forma, quando usar mais de uma.
3. O sistema confere se a soma é igual ao total da reserva.
4. O sistema registra o pagamento.

**Extensões**

- 3a. Soma diferente do total: recusado.
- 1a. Nenhuma forma escolhida: recusado.

**Regras de negócio**

- O RF13 prevê formas combinadas, mas a tela do protótipo parece permitir uma só. Ver D5.

### UC-15 Aplicar cupom

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente |
| Pré-condições | Reserva em andamento no passo de cálculo. Estende UC-13 |
| Pós-condições | Valor da reserva recalculado com o desconto |
| RF | RF12 |
| US | a definir |

**Fluxo principal**

1. No resumo da reserva, o cliente informa o código do cupom.
2. O sistema confere se o cupom está ativo e dentro da validade.
3. O sistema aplica o desconto e recalcula o total.

**Extensões**

- 2a. Cupom inexistente, inativo ou expirado: recusado, e o valor não muda.
- 2b. Cupom de outro proprietário: recusado **(a confirmar)**.

**Regras de negócio**

- Um cupom por reserva **(a confirmar)**.

### UC-16 Cancelar reserva

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente |
| Pré-condições | Reserva com status "Reserva confirmada", antes do check-in |
| Pós-condições | Reserva cancelada |
| RF | sem RF na lista atual. Ver D1 |
| US | a definir |

**Fluxo principal**

1. O cliente abre "Minha reserva".
2. Solicita o cancelamento.
3. O sistema confere o prazo da política de cancelamento.
4. O sistema marca a reserva como cancelada e informa o reembolso.

**Extensões**

- 2a. Reserva já em estadia ou finalizada: o cancelamento não é oferecido.
- 3a. Cancelamento fora do prazo de 48 horas: regra de reembolso não definida. Ver D1.

**Regras de negócio**

- Política exibida no protótipo: "Cancelamento: 48h antes, reembolso integral".

### UC-17 Avaliar hospedagem

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente |
| Pré-condições | Cliente autenticado, com reserva da hospedagem já concluída **(a confirmar)** |
| Pós-condições | Avaliação registrada e incluída na nota média da hospedagem |
| RF | RF14 |
| US | a definir |

**Fluxo principal**

1. O cliente abre "Avaliar hospedagem".
2. Informa a nota e o comentário.
3. O sistema registra a avaliação e atualiza a nota média e a distribuição por estrelas.

**Extensões**

- 2a. Nota ausente: recusado.
- 1a. Cliente sem estadia concluída na hospedagem: não pode avaliar **(a confirmar)**.
- 1b. Cliente já avaliou aquela estadia: recusado **(a confirmar)**.

**Regras de negócio**

- A lista de avaliações pode ser ordenada.

### UC-18 Consultar reservas

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-01 Cliente e ACT-02 Proprietário |
| Pré-condições | Usuário autenticado (UC-03) |
| Pós-condições | Nenhuma. Consulta apenas |
| RF | RF15 |
| US | a definir |

**Fluxo principal**

1. O ator abre "Reservas".
2. O sistema lista as reservas do ator: as próprias do cliente, ou as das hospedagens do proprietário.
3. O ator abre uma reserva e vê o resumo, o status e as informações importantes.

**Extensões**

- 1a. Visitante não logado: o sistema pede login.
- 2a. Nenhuma reserva: lista vazia, sem erro.

**Regras de negócio**

- O cliente nunca vê reservas de outro cliente. O proprietário vê só as das suas hospedagens.
- Não há tela de reservas do proprietário no protótipo. Ver D5.

### UC-19 Gerar relatórios de reservas

| Campo | Detalhe |
|---|---|
| Ator principal | ACT-02 Proprietário |
| Pré-condições | Proprietário autenticado |
| Pós-condições | Nenhuma. Consulta apenas |
| RF | RF16 |
| US | a definir |

**Fluxo principal**

1. O proprietário escolhe o período e, opcionalmente, a hospedagem.
2. O sistema calcula os totais de reservas e de ganhos **(a confirmar)**.
3. O sistema exibe o relatório.

**Extensões**

- 2a. Nenhuma reserva no período: relatório vazio, sem erro.

**Regras de negócio**

- O protótipo só tem indicadores no painel, sem filtro por período. Ver D5.

## Divergências

Diferenças encontradas entre o protótipo, os requisitos e os diagramas. Nada foi corrigido aqui: os itens são para decisão do grupo.

- **D1. Cancelar reserva.** O protótipo mostra a política de 48 horas, mas a lista de 18 RFs não tem requisito de cancelamento. Só a tabela antiga (RF09) tinha. Também falta definir o reembolso fora do prazo.
- **D2. Informar disponibilidade.** O protótipo tem a tela de calendário, mas não há RF correspondente.
- **D3. Administrador.** Consta como usuário no minimundo, mas nenhum requisito nem tela define as funções dele. Definir ou remover.
- **D4. Excluir registros (RF18).** É genérico demais e não virou caso de uso. Sugestão: tratar como "Excluir hospedagem" e criar UC próprio, se o grupo quiser.
- **D5. Lacunas do protótipo.** Faltam telas de cupons (UC-10), de reservas do proprietário (UC-18) e de relatórios (UC-19). A tela de pagamento (UC-14) parece de escolha única, enquanto o RF13 prevê formas combinadas.
- **D6. Conta única.** O RF01 permite cadastro de "cliente e/ou proprietário", mas o protótipo exige outra conta para acessar a área do proprietário.
- **D7. Comportamentos sem RF.** O contrato de locação, a confirmação por e-mail, os menus Favoritos e Ofertas e o login com Google (previsto no RF02, mas sem detalhes) aparecem no protótipo sem requisito detalhado.
- **D8. Ciclo da reserva.** Os status Reserva confirmada, Check-in, Estadia em andamento e Check-out aparecem no protótipo. A tabela antiga previa "Ciclo da reserva" (RF06), mas a lista atual não.
- **D9. Atualizar situação da reserva.** Estava no diagrama antigo e foi retirado, porque nenhum requisito o prevê.
- **D10. Tabelas duplicadas no documento de requisitos.** O arquivo de requisitos mantém a tabela antiga de 10 RFs junto da nova de 18. Apagar a antiga.
- **D11. US e RF pendentes.** Os IDs de user stories ainda não estão mapeados. Os campos "US" estão como "a definir" até a lista ser publicada.

## Veja também

- [Visão geral da modelagem](../README.md)
- [Wireframes](../../wireframes/README.md)
- [Requisitos funcionais](../../requisitos-funcionais.md)
- [Histórias de usuário](../../historias-de-usuario.md)
- [Diagramas de casos de uso (.drawio)](Diagramas_Casos_de_Uso_Corrigidos.drawio)