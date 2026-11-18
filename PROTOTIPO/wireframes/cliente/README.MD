# Wireframes do cliente (T-CLI)

Milestone 2 · Protótipo de interface · Fábrica de Software I

Protótipo da plataforma Hospedagem Familiar. Wireframes de média fidelidade das telas do cliente (hóspede) autenticado, mais os estados de exceção que ele pode encontrar, em 1024x640 (desktop). Escala de cinza com um acento azul; a ação principal de cada tela é o botão azul preenchido. A navegação fica no topo: Painel, Hospedagens, Reservas, Avaliações e Minha conta. As telas do proprietário estão no documento separado Wireframes do proprietário (T-PRO).

## Tabela de telas kkkkkkkkk

A coluna "Páginas" indica a página do PDF do protótipo em que a tela aparece. O caso de uso segue o nome usado nos diagramas corrigidos.

| ID | Arquivo | Tela | Páginas | Caso de uso | RF |
|---|---|---|---|---|---|
| T-CLI-01 | [T-CLI-01-inicio-busca.svg](T-CLI-01-inicio-busca.svg) | Início e busca de hospedagens | 2, 3, 5 | Pesquisar hospedagem | RF10 |
| T-CLI-02 | [T-CLI-02-preferencias.svg](T-CLI-02-preferencias.svg) | Personalizar experiência (preferências) | 4 | Registrar preferências | RF09 |
| T-CLI-03 | [T-CLI-03-detalhe-hospedagem.svg](T-CLI-03-detalhe-hospedagem.svg) | Detalhe da hospedagem | 6, 23, 39, 42, 43 | Pesquisar hospedagem | RF10 |
| T-CLI-04 | [T-CLI-04-reserva-datas.svg](T-CLI-04-reserva-datas.svg) | Reserva, etapa 1: seleção de datas | 7 | Solicitar reserva | RF11 |
| T-CLI-05 | [T-CLI-05-reserva-calculo.svg](T-CLI-05-reserva-calculo.svg) | Reserva, etapa 2: resumo e cálculo do valor | 8 | Solicitar reserva; Aplicar cupom | RF11, RF12 |
| T-CLI-06 | [T-CLI-06-reserva-contrato.svg](T-CLI-06-reserva-contrato.svg) | Reserva, etapa 3: contrato de locação temporária | 9 | Solicitar reserva | RF11 |
| T-CLI-07 | [T-CLI-07-reserva-pagamento.svg](T-CLI-07-reserva-pagamento.svg) | Reserva, etapa 4: forma de pagamento | 10 | Registrar pagamento combinado | RF13 |
| T-CLI-08 | [T-CLI-08-reserva-confirmada.svg](T-CLI-08-reserva-confirmada.svg) | Reserva confirmada | 11 | Solicitar reserva | RF11 |
| T-CLI-09 | [T-CLI-09-minha-reserva.svg](T-CLI-09-minha-reserva.svg) | Minha reserva: status e acompanhamento | 36, 37, 38 | Consultar reservas; Cancelar reserva | RF15 |
| T-CLI-10 | [T-CLI-10-avaliacoes-hospedagem.svg](T-CLI-10-avaliacoes-hospedagem.svg) | Avaliações da hospedagem | 14 | Avaliar hospedagem | RF14 |
| T-CLI-11 | [T-CLI-11-avaliar-hospedagem.svg](T-CLI-11-avaliar-hospedagem.svg) | Avaliar hospedagem | 22 | Avaliar hospedagem | RF14 |
| T-CLI-12 | [T-CLI-12-minha-conta.svg](T-CLI-12-minha-conta.svg) | Minha conta | 5, 20, 21 | Alterar dados cadastrais | RF17 |
| T-CLI-13 | [T-CLI-13-endereco.svg](T-CLI-13-endereco.svg) | Endereço | 28 | Informar endereço | RF04 |
| T-CLI-14 | [T-CLI-14-estado-erro.svg](T-CLI-14-estado-erro.svg) | Estado: erro ao carregar hospedagens | 24 | n/a | n/a |
| T-CLI-15 | [T-CLI-15-estado-visitante-nao-logado.svg](T-CLI-15-estado-visitante-nao-logado.svg) | Estado: visitante não logado | 30, 44 | Autenticar | RF02 |
| T-CLI-16 | [T-CLI-16-estado-sem-permissao.svg](T-CLI-16-estado-sem-permissao.svg) | Estado: sem permissão (área de proprietário) | 29 | n/a | n/a |

As telas de acesso (entrar, esqueci a senha, código de verificação, nova senha e os dois cadastros, páginas 16 a 19 e 32 a 35) são comuns a cliente e proprietário. Ficam fora desta lista e pertencem às telas públicas.

## Telas

### T-CLI-01 Início e busca de hospedagens
![Início com busca por check-in, hóspedes e destino e vitrine Explore](T-CLI-01-inicio-busca.svg)

### T-CLI-02 Personalizar experiência
![Tela de preferências com a pergunta "O que você gosta?"](T-CLI-02-preferencias.svg)

### T-CLI-03 Detalhe da hospedagem
![Detalhe da hospedagem com preço com desconto, nota, descrição, regras e política de cancelamento](T-CLI-03-detalhe-hospedagem.svg)

### T-CLI-04 Reserva, etapa 1: seleção de datas
![Etapa de seleção de datas de check-in e check-out com resumo da reserva](T-CLI-04-reserva-datas.svg)

### T-CLI-05 Reserva, etapa 2: resumo e cálculo do valor
![Resumo da reserva com cálculo do valor e campo de cupom de desconto](T-CLI-05-reserva-calculo.svg)

### T-CLI-06 Reserva, etapa 3: contrato de locação temporária
![Contrato de locação temporária para aceite do cliente](T-CLI-06-reserva-contrato.svg)

### T-CLI-07 Reserva, etapa 4: forma de pagamento
![Escolha da forma de pagamento entre cartão de crédito, dinheiro e Pix](T-CLI-07-reserva-pagamento.svg)

### T-CLI-08 Reserva confirmada
![Confirmação de reserva com aviso de e-mail de confirmação](T-CLI-08-reserva-confirmada.svg)

### T-CLI-09 Minha reserva
![Acompanhamento da reserva pelos estados confirmada, check-in, estadia em andamento e check-out](T-CLI-09-minha-reserva.svg)

### T-CLI-10 Avaliações da hospedagem
![Lista de avaliações com nota média, distribuição por estrelas e ordenação](T-CLI-10-avaliacoes-hospedagem.svg)

### T-CLI-11 Avaliar hospedagem
![Formulário de avaliação com nota e comentário](T-CLI-11-avaliar-hospedagem.svg)

### T-CLI-12 Minha conta
![Minha conta com nome, e-mail e dados cadastrais editáveis](T-CLI-12-minha-conta.svg)

### T-CLI-13 Endereço
![Formulário de endereço com CEP, estado, cidade, bairro, logradouro e número](T-CLI-13-endereco.svg)

### T-CLI-14 Estado: erro ao carregar hospedagens
![Mensagem de erro ao carregar a lista, com os botões Tentar novamente e Voltar](T-CLI-14-estado-erro.svg)

### T-CLI-15 Estado: visitante não logado
![Aviso para entrar ou criar conta antes de ver reservas e reservar](T-CLI-15-estado-visitante-nao-logado.svg)

### T-CLI-16 Estado: sem permissão
![Área exclusiva para proprietários com opção de criar conta de proprietário](T-CLI-16-estado-sem-permissao.svg)

## Notas de comportamento

**T-CLI-01.** A busca tem os campos Check-in, Hóspedes e Destino, além de filtros. A vitrine "Explore" agrupa hospedagens por destino (por exemplo Corais e Ilhas), com o link "Ver todos".

**T-CLI-02.** Pergunta "O que você gosta?" e guarda as preferências do cliente. A tela é opcional e não deve bloquear a busca.

**T-CLI-03.** Mostra o preço por noite com desconto (valor riscado e valor final), a nota média com a contagem de avaliações, a descrição, as regras de hospedagem e a política "Cancelamento: 48h antes, reembolso integral". Os campos de check-in, check-out e número de pessoas levam à reserva.

**T-CLI-04 a T-CLI-08.** O fluxo de reserva é linear: datas, cálculo, contrato, pagamento e confirmação. O indicador de progresso tem quatro rótulos (Data, Cálculo, Contrato, Confirmação), e a tela de pagamento fica dentro da etapa Confirmação. Ao final, a tela avisa que o cliente receberá uma confirmação por e-mail.

**T-CLI-05.** Calcula o total (diária multiplicada pelo número de noites) e tem o campo "Cupom de desconto" (RF12).

**T-CLI-07.** Oferece Cartão de crédito, Dinheiro e Pix.

**T-CLI-09.** Acompanha a reserva pelos estados Reserva confirmada, Check-in, Estadia em andamento e Check-out. Mostra "Informações importantes", como o horário limite de check-out (até 12:00), e as regras da casa.

**T-CLI-10 e T-CLI-11.** A lista mostra a nota média, a distribuição por estrelas e a ordenação, e leva ao formulário "Avaliar hospedagem", com nota e comentário.

**T-CLI-14.** Aparece quando a lista não carrega. Informa que os dados não foram perdidos e oferece "Tentar novamente" e "Voltar".

**T-CLI-15.** Pede login para ver reservas e fazer novas reservas. Depois do login, o usuário volta para a página em que estava.

**T-CLI-16.** Informa que a conta de hóspede não acessa o painel de hospedagens e oferece "Criar conta de proprietário".

## Divergências

1. **Pagamento combinado (RF13).** A tela 10 pede para "selecionar a opção desejada", o que parece escolha única entre Cartão, Dinheiro e Pix. O RF13 prevê formas combinadas. Falta uma tela ou um campo para dividir o valor.
2. **Cancelar reserva.** A política de cancelamento aparece nas telas 6, 23 e 39, mas não identifiquei botão ou fluxo de cancelamento nas telas 36 a 38. Além disso, a lista nova de RFs não tem requisito de cancelamento. Só a tabela antiga (RF09) tinha.
3. **Contrato de locação.** A etapa de contrato (tela 9) não está em nenhum RF.
4. **Confirmação por e-mail.** A tela 11 promete o e-mail, mas não há RF de notificação.
5. **Menus diferentes.** As telas 2 a 19 usam Painel, Hospedagens, Reservas e Avaliações. As telas 20 a 22 usam também Destinos, Ofertas e Favoritos. Favoritos e Ofertas não existem nos requisitos. É preciso unificar o menu ou criar os RFs.
6. **Valores inconsistentes.** O mesmo Chalé Vista Mar aparece com diária de `$500` riscado e `$440` (telas 6, 23, 39) e de `R$ 380` por noite (tela 8). A moeda aparece como `$` e como `R$`.
7. **Avaliação e datas.** A nota é 4.99 em algumas telas e 4.9 na tela 14. Nas telas 23 e 39, o check-out (2/11/2023) é anterior ao check-in (2/9/2026).
8. **Conta de cliente e de proprietário.** O RF01 permite cadastrar usuário "cliente e/ou proprietário", mas a tela 29 trata a conta de hóspede como separada e exige criar outra conta de proprietário. É preciso decidir se uma pessoa pode ter os dois papéis.
9. **Tela de endereço.** Não tenho certeza de que a página 28 pertence à conta do cliente. Pode ser a do proprietário.
10. **Casos de uso e user stories.** Os diagramas ainda não têm IDs de UC e o documento não traz IDs de user stories. Quando houver, acrescente as colunas UC e US à tabela.

## Veja também

- [Wireframes do proprietário (T-PRO)](../proprietario/README.md)
- [Requisitos funcionais](../../requisitos-funcionais.md)
- [Casos de uso](../../casos-de-uso/README.md)