# Dicionário de Dados — HERA (Gestão de Hospedagem)

Banco: `GESTAO_HOSPEDAGEM` (MySQL 9.7, InnoDB, `utf8mb4`).
Script de criação: [GESTAO_HOSPEDAGEM.sql](GESTAO_HOSPEDAGEM.sql)

**Legenda**

* **Nulo:** "Não" = `NOT NULL`; "Sim" = aceita `NULL`.
* **Padrão:** valor `DEFAULT` do SQL. "—" = sem valor padrão.
* **Chave:** PK = chave primária; FK = chave estrangeira; UK = valor único (`UNIQUE`).

As tabelas estão na mesma ordem do script SQL.

## Sumário

* [AVALIACAO_CLIENTE](#avaliacao_cliente)
* [AVALIACAO_HOSPEDAGEM](#avaliacao_hospedagem)
* [CADASTRO_HOSPEDAGEM](#cadastro_hospedagem)
* [CLIENTE](#cliente)
* [CLIENTE_PREFERENCIA](#cliente_preferencia)
* [COMODIDADES](#comodidades)
* [CUPOM](#cupom)
* [ENDERECO](#endereco)
* [ENDERECO_CEP](#endereco_cep)
* [ENDERECO_CIDADE](#endereco_cidade)
* [FOTO_HOSPEDAGEM](#foto_hospedagem)
* [HOSPEDAGEM_COMODIDADES](#hospedagem_comodidades)
* [PAGAMENTO](#pagamento)
* [PRECO_PERIODO](#preco_periodo)
* [PREFERENCIA](#preferencia)
* [PROPRIETARIO](#proprietario)
* [RECUPERACAO_SENHA](#recuperacao_senha)
* [RESERVA](#reserva)
* [RESERVA_PAGAMENTO](#reserva_pagamento)
* [USUARIOS](#usuarios)

---

## AVALIACAO_CLIENTE

Avaliação do cliente feita pelo proprietário. Cada reserva recebe no máximo uma avaliação.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `AVCL_ID_AVALIACAO` | int | Não | — | PK | Identificador da avaliação (AUTO_INCREMENT) |
| `AVCL_NR_GERAL` | int | Não | — | | Nota geral do cliente (1 a 5) |
| `AVCL_NR_COMUNICACAO` | int | Não | — | | Nota de comunicação (1 a 5) |
| `AVCL_NR_PONTUALIDADE` | int | Não | — | | Nota de pontualidade no check-in e no check-out (1 a 5) |
| `AVCL_NR_RESPEITO_REGRA` | int | Não | — | | Nota de respeito às regras da hospedagem (1 a 5) |
| `AVCL_NR_CUIDADO_IMOVEL` | int | Não | — | | Nota de cuidado com o imóvel (1 a 5) |
| `AVCL_DS_COMENTARIO` | varchar(255) | Sim | NULL | | Comentário opcional do proprietário |
| `AVCL_DT_AVALIACAO` | datetime | Sim | CURRENT_TIMESTAMP | | Data e hora da avaliação |
| `FK_RESE_ID_RESERVA` | int | Não | — | FK, UK | Reserva avaliada (RESERVA) |

## AVALIACAO_HOSPEDAGEM

Avaliação da hospedagem feita pelo cliente. Cada reserva recebe no máximo uma avaliação.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `AVHO_ID_AVALIACAO` | int | Não | — | PK | Identificador da avaliação (AUTO_INCREMENT) |
| `AVHO_NR_GERAL` | int | Não | — | | Nota geral (1 a 5) |
| `AVHO_NR_LIMPEZA` | int | Não | — | | Nota de limpeza (1 a 5) |
| `AVHO_NR_CONFORTO` | int | Não | — | | Nota de conforto (1 a 5) |
| `AVHO_NR_ATENDIMENTO` | int | Não | — | | Nota de atendimento (1 a 5) |
| `AVHO_NR_CUSTO_BENEFICIO` | int | Não | — | | Nota de custo-benefício (1 a 5) |
| `AVHO_DS_COMENTARIO` | varchar(255) | Sim | NULL | | Comentário opcional do cliente |
| `AVHO_DT_AVALIACAO` | datetime | Sim | CURRENT_TIMESTAMP | | Data e hora da avaliação |
| `FK_RESE_ID_RESERVA` | int | Não | — | FK, UK | Reserva avaliada (RESERVA) |

## CADASTRO_HOSPEDAGEM

Hospedagens cadastradas pelos proprietários. Toda hospedagem começa como rascunho até ser publicada.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `CAHO_ID_HOSPEDAGEM` | int | Não | — | PK | Identificador da hospedagem (AUTO_INCREMENT) |
| `FK_PROP_ID_PROPRIETARIO` | int | Não | — | FK | Proprietário da hospedagem (PROPRIETARIO) |
| `CAHO_NM_HOSPEDAGEM` | varchar(100) | Não | — | | Nome da hospedagem exibido no anúncio |
| `CAHO_DS_IMOVEL` | varchar(255) | Sim | NULL | | Descrição do imóvel |
| `CAHO_TP_IMOVEL` | varchar(30) | Não | — | | Tipo de imóvel (casa, apartamento, chalé, pousada etc.) |
| `CAHO_NR_CAPACIDADE` | int | Sim | NULL | | Número máximo de hóspedes |
| `CAHO_NR_AREA` | decimal(7,2) | Sim | NULL | | Área do imóvel, em m² |
| `CAHO_HR_CHECKIN` | time | Não | — | | Horário de check-in |
| `CAHO_HR_CHECKOUT` | time | Não | — | | Horário de check-out |
| `CAHO_NR_ANTECEDENCIA` | int | Não | — | | Antecedência mínima para reservar, em dias |
| `CAHO_NR_ESTADIA_MINIMA` | int | Não | — | | Número mínimo de noites por reserva |
| `CAHO_LG_FUMANTES` | tinyint(1) | Não | '0' | | Indica se é permitido fumar (0 = não, 1 = sim) |
| `CAHO_LG_FESTAS` | tinyint(1) | Não | '0' | | Indica se são permitidas festas (0 = não, 1 = sim) |
| `CAHO_VL_DIARIA` | decimal(10,2) | Não | — | | Valor padrão da diária |
| `CAHO_VL_FIM_SEMANA` | decimal(10,2) | Sim | NULL | | Valor da diária nos fins de semana |
| `CAHO_VL_LIMPEZA` | decimal(10,2) | Sim | '0.00' | | Taxa de limpeza cobrada por reserva |
| `CAHO_DS_STATUS` | varchar(20) | Não | 'RASCUNHO' | | Situação da hospedagem (RASCUNHO ou PUBLICADA) |
| `FK_ENDE_ID_ENDERECO` | int | Não | — | FK, UK | Endereço da hospedagem (ENDERECO). Cada endereço pertence a uma única hospedagem |

## CLIENTE

Dados pessoais do perfil de cliente (hóspede).

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `CLIE_ID_CLIENTE` | int | Não | — | PK | Identificador do cliente (AUTO_INCREMENT) |
| `FK_USUA_ID_USUARIO` | int | Não | — | FK, UK | Conta de usuário do cliente (USUARIOS). Um usuário tem no máximo um perfil de cliente |
| `CLIE_NM_COMPLETO` | varchar(150) | Não | — | | Nome completo do cliente |
| `CLIE_NR_CPF` | varchar(14) | Não | — | UK | CPF do cliente |
| `CLIE_DT_NASCIMENTO` | date | Não | — | | Data de nascimento do cliente |
| `CLIE_DS_CELULAR` | varchar(12) | Não | — | | Número de celular do cliente |
| `FK_ENDE_ID_ENDERECO` | int | Não | — | FK | Endereço do cliente (ENDERECO) |

## CLIENTE_PREFERENCIA

Associação entre clientes e preferências (relacionamento N:N). A chave primária é composta pelos dois campos.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `FK_CLIE_ID_CLIENTE` | int | Não | — | PK, FK | Cliente (CLIENTE) |
| `FK_PREF_ID_PREFERENCIA` | int | Não | — | PK, FK | Preferência escolhida pelo cliente (PREFERENCIA) |

## COMODIDADES

Lista de comodidades que uma hospedagem pode oferecer (ex.: Wi-Fi, piscina).

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `COMO_ID_COMODIDADES` | int | Não | — | PK | Identificador da comodidade (AUTO_INCREMENT) |
| `COMO_NM_COMODIDADE` | varchar(50) | Não | — | UK | Nome da comodidade |

## CUPOM

Cupons de desconto que podem ser aplicados nas reservas.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `CUPO_ID_CUPOM` | int | Não | — | PK | Identificador do cupom (AUTO_INCREMENT) |
| `CUPO_DS_CODIGO` | varchar(30) | Não | — | UK | Código que o cliente digita para usar o cupom |
| `CUPO_DS_TIPO` | varchar(12) | Não | — | | Tipo de desconto (percentual ou valor fixo) |
| `CUPO_VL_DESCONTO` | decimal(10,2) | Não | — | | Valor do desconto (percentual ou em reais, conforme o tipo) |
| `CUPO_DT_VALIDADE` | date | Sim | NULL | | Data de validade do cupom. Vazio = sem prazo |
| `CUPO_LG_ATIVO` | tinyint(1) | Não | '1' | | Indica se o cupom está ativo (0 = não, 1 = sim) |

## ENDERECO

Endereços de clientes, proprietários e hospedagens.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `ENDE_ID_ENDERECO` | int | Não | — | PK | Identificador do endereço (AUTO_INCREMENT) |
| `ENDE_NR_ENDERECO` | varchar(10) | Sim | NULL | | Número do imóvel (pode ficar vazio, ex.: "s/n") |
| `ENDE_DS_COMPLEMENTO` | varchar(100) | Sim | NULL | | Complemento do endereço (apartamento, bloco etc.) |
| `FK_ENCE_ID_CEP` | int | Não | — | FK | CEP do endereço (ENDERECO_CEP) |
| `ENDE_DS_BAIRRO` | varchar(100) | Não | — | | Bairro |
| `ENDE_DS_LOGRADOURO` | varchar(100) | Não | — | | Logradouro (rua, avenida etc.) |

## ENDERECO_CEP

CEPs cadastrados. Cada CEP pertence a uma única cidade.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `ENCE_ID_CEP` | int | Não | — | PK | Identificador do CEP (AUTO_INCREMENT) |
| `ENCE_NR_CEP` | varchar(8) | Não | — | UK | Número do CEP, somente dígitos |
| `FK_ENCI_ID_CIDADE` | int | Não | — | FK | Cidade do CEP (ENDERECO_CIDADE) |

## ENDERECO_CIDADE

Cidades e seus estados.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `ENCI_ID_CIDADE` | int | Não | — | PK | Identificador da cidade (AUTO_INCREMENT) |
| `ENCI_NM_CIDADE` | varchar(100) | Não | — | | Nome da cidade |
| `ENCI_SG_ESTADO` | char(2) | Não | — | | Sigla do estado (UF) |

## FOTO_HOSPEDAGEM

Fotos das hospedagens, exibidas na ordem definida pelo proprietário.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `FOHO_ID_FOTO` | int | Não | — | PK | Identificador da foto (AUTO_INCREMENT) |
| `FK_CAHO_ID_HOSPEDAGEM` | int | Não | — | FK | Hospedagem da foto (CADASTRO_HOSPEDAGEM) |
| `FOHO_DS_CAMINHO` | varchar(255) | Não | — | | Caminho ou URL do arquivo da foto |
| `FOHO_NR_ORDEM` | int | Não | — | | Posição da foto na galeria |

## HOSPEDAGEM_COMODIDADES

Associação entre hospedagens e comodidades (relacionamento N:N). A chave primária é composta pelos dois campos.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `FK_COMO_ID_COMODIDADES` | int | Não | — | PK, FK | Comodidade oferecida (COMODIDADES) |
| `FK_CAHO_ID_HOSPEDAGEM` | int | Não | — | PK, FK | Hospedagem que oferece a comodidade (CADASTRO_HOSPEDAGEM) |

## PAGAMENTO

Formas de pagamento aceitas (ex.: Pix, cartão de crédito).

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `PAGA_ID_PAGAMENTO` | int | Não | — | PK | Identificador da forma de pagamento (AUTO_INCREMENT) |
| `PAGA_TP_PAGAMENTO` | varchar(20) | Não | — | | Nome da forma de pagamento |

## PRECO_PERIODO

Preços por noite diferenciados por período (ex.: alta temporada, feriados).

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `PRPE_ID_PERIODO` | int | Não | — | PK | Identificador do período (AUTO_INCREMENT) |
| `FK_CAHO_ID_HOSPEDAGEM` | int | Não | — | FK | Hospedagem a que o preço se aplica (CADASTRO_HOSPEDAGEM) |
| `PRPE_DT_INICIO` | date | Não | — | | Data de início do período |
| `PRPE_DT_FIM` | date | Não | — | | Data de fim do período |
| `PRPE_DS_TIPO` | varchar(30) | Não | — | | Tipo do período (ex.: alta temporada, feriado) |
| `PRPE_VL_NOITE` | decimal(10,2) | Não | — | | Valor da noite no período |

## PREFERENCIA

Lista de preferências de hospedagem que o cliente pode escolher (ex.: praia, pet friendly).

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `PREF_ID_PREFERENCIA` | int | Não | — | PK | Identificador da preferência (AUTO_INCREMENT) |
| `PREF_NM_PREFERENCIA` | varchar(50) | Não | — | | Nome da preferência |

## PROPRIETARIO

Dados do perfil de proprietário, pessoa física (CPF) ou jurídica (CNPJ).

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `PROP_ID_PROPRIETARIO` | int | Não | — | PK | Identificador do proprietário (AUTO_INCREMENT) |
| `FK_USUA_ID_USUARIO` | int | Não | — | FK, UK | Conta de usuário do proprietário (USUARIOS). Um usuário tem no máximo um perfil de proprietário |
| `PROP_NR_CPF` | varchar(14) | Sim | NULL | UK | CPF do proprietário pessoa física. Deve ser informado o CPF ou o CNPJ |
| `PROP_NR_CNPJ` | varchar(18) | Sim | NULL | UK | CNPJ do proprietário pessoa jurídica. Deve ser informado o CPF ou o CNPJ |
| `PROP_NM_COMPLETO` | varchar(255) | Não | — | | Nome completo ou razão social do proprietário |
| `PROP_DS_CELULAR` | varchar(12) | Não | — | | Número de celular do proprietário |
| `FK_ENDE_ID_ENDERECO` | int | Não | — | FK | Endereço do proprietário (ENDERECO) |

## RECUPERACAO_SENHA

Solicitações de recuperação de senha. Cada solicitação gera um código próprio, com prazo de validade e uso único.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `RESN_ID_RECUPERACAO` | int | Não | — | PK | Identificador da solicitação (AUTO_INCREMENT) |
| `FK_USUA_ID_USUARIO` | int | Não | — | FK | Usuário que pediu a recuperação (USUARIOS) |
| `RESN_DS_CODIGO` | varchar(5) | Não | — | | Código de verificação enviado ao e-mail |
| `RESN_DT_EXPIRAR` | datetime | Não | — | | Data e hora em que o código expira |
| `RESN_LG_USADO` | tinyint(1) | Não | '0' | | Indica se o código já foi usado (0 = não, 1 = sim) |

## RESERVA

Reservas feitas pelos clientes nas hospedagens.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `FK_CAHO_ID_HOSPEDAGEM` | int | Não | — | FK | Hospedagem reservada (CADASTRO_HOSPEDAGEM) |
| `FK_CLIE_ID_CLIENTE` | int | Não | — | FK | Cliente que fez a reserva (CLIENTE) |
| `FK_CUPO_ID_CUPOM` | int | Sim | NULL | FK | Cupom aplicado na reserva (CUPOM). Vazio quando não há cupom |
| `RESE_ID_RESERVA` | int | Não | — | PK | Identificador da reserva (AUTO_INCREMENT) |
| `RESE_DT_CHECKIN` | datetime | Não | — | | Data e hora de entrada |
| `RESE_DT_CHECKOUT` | datetime | Não | — | | Data e hora de saída |
| `RESE_NR_HOSPEDE` | int | Não | — | | Número de hóspedes |
| `RESE_LG_CONTRATO` | tinyint(1) | Não | '0' | | Indica se o cliente aceitou o contrato (0 = não, 1 = sim) |
| `RESE_DS_CODIGO` | varchar(15) | Sim | NULL | UK | Código da reserva exibido ao cliente (ex.: #HERA-02541) |
| `RESE_VL_TOTAL` | decimal(10,2) | Não | — | | Valor total da reserva |
| `RESE_VL_DESCONTO` | decimal(10,2) | Não | '0.00' | | Valor do desconto aplicado |
| `RESE_DS_STATUS` | varchar(20) | Não | 'PENDENTE' | | Situação da reserva. Aceita apenas PENDENTE, CONFIRMADA, CANCELADA ou CONCLUIDA (restrição `chk_rese_status`). Ver detalhes abaixo |

### Situação da reserva (`RESE_DS_STATUS`)

Campo criado na [issue #73](https://gitlab.fslab.dev/fabrica-de-software-i-2026/projeto5/-/issues/73) para controlar o ciclo da reserva (RF-006). Os valores seguem o enum `SituacaoReserva` do diagrama de classes.

* **Tipo:** `varchar(20)`, `NOT NULL`
* **Valor padrão:** `'PENDENTE'`. Toda reserva nova começa pendente.
* **Valores permitidos:** garantidos pela restrição `CONSTRAINT chk_rese_status CHECK (RESE_DS_STATUS IN ('PENDENTE','CONFIRMADA','CANCELADA','CONCLUIDA'))`. Qualquer outro valor é recusado pelo banco.
* **Comentário no SQL:** "Situacao da reserva: PENDENTE, CONFIRMADA, CANCELADA, CONCLUIDA"

| Valor | Significado |
|:---|:---|
| `PENDENTE` | A reserva foi solicitada pelo cliente, mas ainda não está garantida: aguarda o registro do pagamento. É o valor padrão ao criar a reserva. |
| `CONFIRMADA` | O pagamento foi registrado e a reserva está garantida. As datas ficam ocupadas para a hospedagem. |
| `CANCELADA` | A reserva foi cancelada antes do check-in, pelo cliente ou pelo proprietário. As datas voltam a ficar livres. É uma situação final. |
| `CONCLUIDA` | A estadia terminou (check-out realizado). É uma situação final, e a partir dela cliente e proprietário podem se avaliar. |

**Transições válidas** (controladas pela aplicação, pois o `CHECK` só limita os valores):

* `PENDENTE` → `CONFIRMADA` (pagamento registrado)
* `PENDENTE` → `CANCELADA`
* `CONFIRMADA` → `CANCELADA` (antes do check-in)
* `CONFIRMADA` → `CONCLUIDA` (após o check-out)

`CANCELADA` e `CONCLUIDA` não mudam mais.

## RESERVA_PAGAMENTO

Pagamentos de cada reserva. Uma reserva pode ser paga com várias formas combinadas. A chave primária é composta pela reserva e pela forma de pagamento.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `FK_RESE_ID_RESERVA` | int | Não | — | PK, FK | Reserva paga (RESERVA) |
| `FK_PAGA_ID_PAGAMENTO` | int | Não | — | PK, FK | Forma de pagamento usada (PAGAMENTO) |
| `REPA_VL_PAGO` | decimal(10,2) | Não | — | | Valor pago nessa forma de pagamento |
| `REPA_DT_PAGAMENTO` | datetime | Não | — | | Data e hora do pagamento |
| `REPA_DS_STATUS` | varchar(20) | Não | — | | Situação do pagamento (ex.: pendente, aprovado, recusado) |

## USUARIOS

Contas de acesso à plataforma. Cada usuário pode ter um perfil de cliente e/ou de proprietário.

| Campo | Tipo | Nulo | Padrão | Chave | Descrição |
|:---|:---|:---|:---|:---|:---|
| `USUA_ID_USUARIO` | int | Não | — | PK | Identificador do usuário (AUTO_INCREMENT) |
| `USUA_DS_EMAIL` | varchar(150) | Não | — | UK | E-mail de acesso do usuário |
| `USUA_DS_SENHA` | varchar(255) | Sim | NULL | | Senha criptografada (hash). Fica vazia quando o acesso é pela conta Google |
| `USUA_ID_GOOGLE` | varchar(255) | Sim | NULL | UK | Identificador da conta Google vinculada |
| `USUA_DS_TIPO` | varchar(12) | Não | — | | Tipo de usuário (cliente ou proprietário) |
