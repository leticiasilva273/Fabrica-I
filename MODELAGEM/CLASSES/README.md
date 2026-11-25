# Diagrama de classes de domínio

Fábrica de Software I · Modelagem UML · Classes de domínio

O diagrama modela o domínio do **Hi HERA (Gestão de Hospedagem)**: as classes que o negócio reconhece, seus atributos, operações e associações. Não é diagrama de tabelas nem de telas. O mapeamento para o banco está no dicionário de dados e no script `GESTAO_HOSPEDAGEM.sql`.

**Fontes usadas:** minimundo, regras de negócio e requisitos (`GESTÃO DE HOSPEDAGEM.docx`), script do banco (`GESTAO_HOSPEDAGEM.sql`, dump de 12/10/2026) e protótipo de telas (`Fabrica I.pdf`, Figma). Não há código-fonte da aplicação nesta etapa.

## Arquivos

- `classes.svg`: diagrama completo do domínio (18 classes e 2 enumerações).

## Perfis citados nas telas

| Sigla | Perfil |
| --- | --- |
| VIS | Visitante (não logado) |
| CLI | Cliente (hóspede) |
| PRO | Proprietário |

O protótipo não tem telas para o administrador do sistema (ver divergências). "pág." refere-se à página do PDF do protótipo.

## Lista oficial de classes

Nomes oficiais. Casos de uso, estados e sequência devem usar estes mesmos nomes.

| Classe | Responsabilidade | Telas (perfil) | Tabela |
| --- | --- | --- | --- |
| Usuario | Conta de acesso ao sistema, por e-mail e senha ou conta Google. Pode ter perfil de cliente, de proprietário ou ambos. | VIS (login, pág. 16; cadastro, pág. 32 a 35), CLI e PRO (minha conta, pág. 20 e 21) | USUARIOS |
| RecuperacaoSenha | Solicitação de recuperação de senha, com código, prazo de validade e controle de uso. | VIS (pág. 17 a 19) | RECUPERACAO_SENHA |
| Cliente | Perfil do hóspede: dados pessoais, endereço e preferências. | VIS (cadastro, pág. 32 e 33), CLI (minha conta, pág. 20 e 21; personalização, pág. 4) | CLIENTE |
| Proprietario | Perfil de quem anuncia imóveis. Informa CPF ou CNPJ. | VIS (cadastro, pág. 34 e 35), PRO (painel, pág. 12 e 25 a 27) | PROPRIETARIO |
| Preferencia | Gosto que o cliente pode escolher (ex.: ilhas, montanhas, cidade). | CLI (pág. 4) | PREFERENCIA (vínculo em CLIENTE_PREFERENCIA) |
| Cidade | Cidade e estado de um CEP. | VIS, CLI e PRO (cadastros, pág. 33 e 35) | ENDERECO_CIDADE |
| Cep | CEP único, pertencente a uma cidade. | VIS, CLI e PRO (cadastros, pág. 33 e 35) | ENDERECO_CEP |
| Endereco | Localização de um cliente, proprietário ou hospedagem. | VIS (cadastros, pág. 33 e 35), PRO (pág. 28 e 40) | ENDERECO |
| Hospedagem | Imóvel anunciado. Nasce como rascunho até o proprietário publicar. Define regras de uso e preço base. | VIS e CLI (busca, pág. 2 a 5; detalhe, pág. 23, 39, 42 e 43), PRO (cadastro, pág. 40; edição, pág. 41; gerenciamento, pág. 15) | CADASTRO_HOSPEDAGEM |
| Foto | Imagem da hospedagem, exibida em ordem definida. | PRO (pág. 40 e 41, aba Fotos) | FOTO_HOSPEDAGEM |
| Comodidade | Item oferecido por hospedagens (Wi-Fi, piscina etc.). | PRO (pág. 40 e 41, aba Comodidades), filtros da busca (pág. 2) | COMODIDADES (vínculo em HOSPEDAGEM_COMODIDADES) |
| PrecoPeriodo | Período com preço diferenciado por noite (ex.: alta temporada). | PRO (pág. 40 e 41, aba Preços) | PRECO_PERIODO |
| Cupom | Desconto com código único, que pode ser ativado ou desativado. | Sem tela no protótipo; aplicado na reserva (pág. 8) | CUPOM |
| Reserva | Estadia de um cliente em uma hospedagem, com período, valor total e desconto. | CLI (pág. 7 a 11 e 36 a 38), PRO (pág. 12 e 13) | RESERVA |
| FormaPagamento | Meio de pagamento disponível (ex.: cartão, Pix). | CLI (pág. 10) | PAGAMENTO |
| PagamentoReserva | Classe de associação: valor pago em uma forma de pagamento para uma reserva, com data e status. | CLI (pág. 10 e 11) | RESERVA_PAGAMENTO |
| AvaliacaoHospedagem | Nota geral e por critério que o cliente dá à hospedagem, com comentário opcional. | CLI (avaliar, pág. 22), VIS, CLI e PRO (listagem, pág. 14) | AVALIACAO_HOSPEDAGEM |
| AvaliacaoCliente | Nota geral e por critério sobre o comportamento do hóspede na reserva (ver divergências). | Sem tela no protótipo | AVALIACAO_CLIENTE |

## Atributos e operações por classe

Tipos de domínio: String, Integer, Decimal, Boolean, Date, DateTime, Time. Identificadores e chaves estrangeiras ficam fora.

| Classe | Atributos | Operações |
| --- | --- | --- |
| Usuario | email, senha, idGoogle, tipo | autenticar, solicitarRecuperacao, redefinirSenha |
| RecuperacaoSenha | codigo, dataExpiracao, usado | validar, marcarComoUsada |
| Cliente | nomeCompleto, cpf, dataNascimento, celular | escolherPreferencias |
| Proprietario | nomeCompleto, cpf, cnpj, celular | cadastrarHospedagem |
| Preferencia | nome | |
| Cidade | nome, uf | |
| Cep | numero | |
| Endereco | logradouro, numero, complemento, bairro | |
| Hospedagem | nome, descricao, tipoImovel, capacidade, area, horaCheckin, horaCheckout, antecedencia, estadiaMinima, permiteFumantes, permiteFestas, valorDiaria, valorFimSemana, valorLimpeza, status | publicar, estaDisponivel(periodo), calcularPrecoNoite(data) |
| Foto | caminho, ordem | |
| Comodidade | nome | |
| PrecoPeriodo | dataInicio, dataFim, tipo, valorNoite | cobre(data) |
| Cupom | codigo, tipo, valorDesconto, dataValidade, ativo | ativar, desativar, estaValido |
| Reserva | dataCheckin, dataCheckout, numHospedes, contratoAceito, codigo, valorTotal, valorDesconto | calcularValor, aplicarCupom, registrarPagamento, cancelar |
| FormaPagamento | tipo | |
| PagamentoReserva | valorPago, dataPagamento, status | |
| AvaliacaoHospedagem | notaGeral, notaLimpeza, notaConforto, notaAtendimento, notaCustoBeneficio, comentario, dataAvaliacao | registrar |
| AvaliacaoCliente | notaGeral, notaComunicacao, notaPontualidade, notaRespeitoRegra, notaCuidadoImovel, comentario, dataAvaliacao | registrar |

## Associações e multiplicidades

Leitura: o número junto a uma classe indica quantas instâncias dela se ligam a uma instância da outra. Losango preenchido indica composição.

| Associação | Multiplicidade (A e B) | Tipo | Observação |
| --- | --- | --- | --- |
| Usuario e Cliente | 1 e 0..1 | Associação | Perfil opcional. Um usuário pode ter cliente e proprietário ao mesmo tempo |
| Usuario e Proprietario | 1 e 0..1 | Associação | Idem |
| Usuario e RecuperacaoSenha | 1 e 0..* | Composição | Cada solicitação tem código, validade e controle de uso próprios |
| Cliente e Endereco | 1 e 1 | Associação | Regra de negócio. O banco não impede dois clientes no mesmo endereço (ver divergências) |
| Proprietario e Endereco | 1 e 1 | Associação | Idem |
| Hospedagem e Endereco | 1 e 1 | Associação | O banco garante com chave única |
| Endereco e Cep | 0..* e 1 | Associação | Um endereço tem um CEP |
| Cep e Cidade | 0..* e 1 | Associação | Uma cidade pode ter vários CEPs |
| Proprietario e Hospedagem | 1 e 0..* | Associação | Hospedagem tem histórico próprio de reservas, não é parte do proprietário |
| Hospedagem e Foto | 1 e 0..* | Composição | Foto não existe sem a hospedagem |
| Hospedagem e PrecoPeriodo | 1 e 0..* | Composição | Período de preço pertence a uma hospedagem |
| Hospedagem e Comodidade | 0..* e 0..* | Associação | Tabela de junção sem atributos, por isso não vira classe |
| Cliente e Preferencia | 0..* e 0..* | Associação | Idem |
| Cliente e Reserva | 1 e 0..* | Associação | |
| Hospedagem e Reserva | 1 e 0..* | Associação | Reservas não podem se sobrepor na mesma hospedagem (RNF06) |
| Cupom e Reserva | 0..1 e 0..* | Associação | Reserva usa no máximo um cupom |
| Reserva e FormaPagamento | 0..* e 0..* | Associação | Pagamento combinado. A classe de associação é PagamentoReserva |
| Reserva e AvaliacaoHospedagem | 1 e 0..1 | Composição | Uma avaliação por reserva (chave única no banco) |
| Reserva e AvaliacaoCliente | 1 e 0..1 | Composição | Idem |

## Enumerações

| Enumeração | Literais | Usada em | Situação |
| --- | --- | --- | --- |
| TipoUsuario | CLIENTE, PROPRIETARIO | Usuario.tipo | Literais inferidos do dicionário ("cliente ou proprietário"). O banco guarda texto livre |
| StatusHospedagem | RASCUNHO, PUBLICADA | Hospedagem.status | RASCUNHO está no banco como valor padrão. PUBLICADA é proposta a partir do RF07 e precisa ser confirmada |

Atributos que o banco guarda como texto e cujos literais ainda não foram definidos permanecem como String: `Hospedagem.tipoImovel`, `Cupom.tipo`, `PrecoPeriodo.tipo`, `PagamentoReserva.status` e `FormaPagamento.tipo`. Quando a equipe fechar os valores, viram enumerações.

## Decisões de modelagem

- **Cliente e Proprietario como classes ligadas a Usuario, sem herança.** Os dois perfis têm dados próprios (cliente tem data de nascimento, proprietário aceita CNPJ) e a regra de negócio permite que o mesmo usuário tenha os dois. Subclasses de Usuario estariam erradas, porque um objeto não pode ser Cliente e Proprietario ao mesmo tempo por herança simples.
- **Escopo do domínio.** Ficaram fora as chaves primárias e estrangeiras, que são do modelo lógico. As tabelas de junção sem atributos (CLIENTE_PREFERENCIA, HOSPEDAGEM_COMODIDADES) viram associações muitos-para-muitos. RESERVA_PAGAMENTO virou a classe de associação PagamentoReserva porque carrega valor, data e status.
- **Endereço em três classes.** Endereco, Cep e Cidade seguem a regra "um endereço tem um CEP e um CEP pertence a uma cidade", coerente com a 3ª Forma Normal (RNF07). Endereco não é composição de Cliente, Proprietario ou Hospedagem porque é compartilhado como estrutura pelos três.
- **Composição onde a parte não tem sentido sozinha.** Recuperações de senha, fotos, períodos de preço e as duas avaliações. Reserva e Hospedagem não são composição de Cliente e Proprietario: têm ciclo próprio e histórico.
- **Duas avaliações separadas.** AvaliacaoHospedagem e AvaliacaoCliente têm critérios diferentes e ficam em classes distintas, ambas ligadas à Reserva.
- **Operações de domínio, não endpoints.** Os nomes seguem as regras de negócio e os requisitos (ex.: `Hospedagem.publicar` do RF07, `Reserva.aplicarCupom` do RF12), não rotas HTTP. Como ainda não há código, elas vêm do documento de requisitos.
- **Estados ficam no diagrama de estados.** `StatusHospedagem` aparece como atributo. As transições e guardas (ex.: só publicar a partir de RASCUNHO) são do diagrama de estados.
- **Valores gravados na reserva.** `Reserva.valorTotal` e `valorDesconto` são gravados no momento da reserva, para que mudanças futuras de preço ou de cupom não alterem reservas já feitas.
- **Contrato como aceite.** `Reserva.contratoAceito` (RESE_LG_CONTRATO) foi interpretado como o aceite do contrato de locação temporária mostrado no passo 3 da reserva (pág. 9).

## Divergências

Divergências entre o banco, o documento e o protótipo. Quando divergem, o script SQL é a referência, por ser o mais recente e o que de fato está implementado. O modelo segue o SQL.

**Entre o SQL e as regras de negócio**

- **Perfil único em Usuario.tipo.** A regra diz que o usuário pode ter perfil de cliente e/ou de proprietário, mas `USUA_DS_TIPO` guarda um único texto. Os perfis acumulados são representados pelas tabelas CLIENTE e PROPRIETARIO, cada uma com chave única para o usuário. O modelo mantém `tipo` por estar no banco.
- **Administrador sem representação.** O documento lista "Administrador do sistema" entre os usuários, mas não há tabela, tipo ou tela para ele. Fica fora do modelo.
- **CPF ou CNPJ não é obrigatório no banco.** A regra exige um dos dois no proprietário, mas as duas colunas aceitam nulo e não há restrição de verificação.
- **Endereço único só na hospedagem.** A regra diz que cliente, proprietário e hospedagem têm um endereço cada. Só CADASTRO_HOSPEDAGEM tem chave única no endereço. Em CLIENTE e PROPRIETARIO o banco permitiria compartilhar o mesmo endereço.
- **Sobreposição de reservas sem garantia no banco.** O RNF06 pede impedir reservas em datas ocupadas, mas o dump não tem restrição nem gatilho para isso. A regra fica para a aplicação.
- **Pagamento por forma, uma vez por reserva.** A chave primária de RESERVA_PAGAMENTO é (reserva, forma de pagamento). Na prática, uma reserva não pode ter dois pagamentos na mesma forma (ex.: duas parcelas em Pix).
- **Preço por período e regras de cálculo.** A regra diz que o total usa o preço por noite de cada período, mas não define a precedência entre `valorDiaria`, `valorFimSemana` e `PrecoPeriodo.valorNoite`. Ponto em aberto para a cliente.

**Entre o protótipo e o SQL**

- **Reserva sem status.** O protótipo mostra o ciclo da reserva (confirmada, check-in, estadia em andamento, check-out, pág. 36 a 38) e o documento tem RF06 (ciclo) e RF09 (cancelamento), mas RESERVA não tem coluna de status. `Reserva.cancelar` está no modelo pelo requisito. O enum de status da reserva ainda não existe.
- **Valores do protótipo sem coluna.** Taxa HERA (8%), seguro ocupacional e parcelamento em até 12x (pág. 8 e 10) não têm campo no banco. A taxa de limpeza existe só em `Hospedagem.valorLimpeza`.
- **Bloqueio de datas e favoritos.** O calendário do proprietário permite bloquear período (pág. 13) e o menu tem "Favoritos" (pág. 20). Nenhum dos dois tem tabela.
- **Cupom e AvaliacaoCliente sem tela.** O RF08 (gerenciar cupons) e a avaliação do cliente não aparecem no protótipo.

**Entre o documento e o SQL**

- **AvaliacaoCliente não está no documento.** A tabela existe no banco, mas não está no dicionário de dados nem nas regras. Pelos critérios (comunicação, pontualidade, respeito às regras, cuidado com o imóvel), foi interpretada como a avaliação do hóspede feita pelo proprietário. O protótipo (pág. 38) fala em o cliente avaliar "a hospedagem e o proprietário", o que não bate com esses critérios. Confirmar com a cliente.
- **Dicionário de dados desatualizado.** Diferenças em relação ao SQL: `CLIENTE.FK_CLIE_ENDERECO` existe só no documento; `CUPO_DS_CUPOM` no documento é `CUPO_DS_CODIGO` no banco; `COMO_NM_COMODIDADES` aparece como INT e é VARCHAR(50); `AVHO_DS_COMENTARIO` e `AVHO_DT_AVALIACAO` aparecem como INT e são VARCHAR(255) e DATETIME; `PRPE_DS_TIPO` e `CUPO_DT_VALIDADE` têm obrigatoriedade diferente; várias descrições foram copiadas de outro projeto (ex.: "Identificador da venda"). O dicionário também traz duas listas de requisitos funcionais (RF01 a RF18 e RF01 a RF10) que não coincidem.
- **Literais de status sem lista oficial.** O documento diz que a hospedagem inicia como rascunho até ser publicada, mas não lista os demais valores de `CADASTRO_HOSPEDAGEM.CAHO_DS_STATUS`. O protótipo mostra "Ativas" e "Rascunho" (pág. 27).

## Veja também

- Dicionário de dados e minimundo (`GESTÃO DE HOSPEDAGEM.docx`)
- Modelo lógico (diagrama do Workbench, no documento)
- Script do banco (`GESTAO_HOSPEDAGEM.sql`)
- Protótipo de telas (`Fabrica I.pdf`)
