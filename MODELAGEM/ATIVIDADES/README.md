# Diagramas de atividades

Milestone 2 · Modelagem comportamental (Fábrica de Software I)

Os diagramas de atividades mostram o fluxo de trabalho entre atores e sistema, em raias. Cada raia é um ator: Cliente (ACT-01), Proprietário (ACT-02), e a raia Sistema, que representa a plataforma Hospedagem Familiar.

## Publicação de uma hospedagem

![Diagrama de atividades da publicação de uma hospedagem](ativ-publicar-hospedagem.svg)

Pontos de controle do fluxo:

- **Cadastro (UC-01, UC-02):** o proprietário se cadastra e informa o endereço.
- **Cadastro da hospedagem (UC-06):** o proprietário informa fotos, informações, comodidades e regras. O sistema valida os campos obrigatórios. Se algum estiver inválido, o proprietário corrige e envia de novo.
- **Rascunho:** a hospedagem é gravada como rascunho e não aparece nas buscas até ser publicada.
- **Preços (UC-07):** o proprietário define os preços por período. O sistema valida e grava, e os períodos não podem se sobrepor.
- **Opcionais (UC-09, UC-10):** informar a disponibilidade e criar cupons não bloqueiam a publicação.
- **Publicação (UC-08):** o sistema confere os dados mínimos. Se estiverem completos, marca a hospedagem como publicada. Se não, o proprietário volta ao cadastro para completar.

## Reserva de uma hospedagem

![Diagrama de atividades da reserva de uma hospedagem](ativ-reserva-hospedagem.svg)

Pontos de controle do fluxo:

- **Autenticação (UC-03):** o cliente entra na conta antes de reservar. Visitante pode pesquisar, mas não reservar.
- **Busca (UC-12):** o cliente pesquisa e escolhe uma hospedagem publicada.
- **Disponibilidade (UC-13):** o cliente informa as datas e o número de hóspedes. Se as datas estiverem indisponíveis, volta a informar outras.
- **Valor total:** o sistema calcula o total pelo preço por noite de cada período.
- **Cupom (UC-15):** é opcional. Só cupom ativo e dentro da validade é aplicado, e o sistema recalcula o total.
- **Pagamento (UC-14):** o cliente aceita o contrato e escolhe as formas de pagamento, que podem ser combinadas. Se a soma for diferente do total, volta para ajustar.
- **Confirmação:** o sistema registra o pagamento, confirma a reserva e envia o e-mail de confirmação.

## Cancelamento, estadia e avaliação

![Diagrama de atividades do cancelamento, da estadia e da avaliação](ativ-pos-reserva.svg)

Pontos de controle do fluxo:

- **Cancelamento (UC-16):** só reserva confirmada, antes do check-in. O sistema aplica a política de 48 horas e cancela. A regra de reembolso fora do prazo ainda não está definida (D1).
- **Estadia:** o cliente faz o check-in e o check-out.
- **Avaliação (UC-17):** depois da estadia, o cliente avalia a hospedagem. O sistema registra a avaliação e atualiza a nota média.
- **Consulta (UC-18, UC-19):** o proprietário consulta as reservas e os relatórios.

## Divergências

Diferenças entre os diagramas, os requisitos e o protótipo. Nada foi corrigido aqui: os itens são para decisão do grupo.

1. **Cancelamento sem requisito (D1).** O UC-16 não tem RF na lista de 18. A regra de reembolso fora do prazo de 48 horas também não está definida.
2. **Consulta do proprietário.** O fluxo de atividades do documento de requisitos só cita os relatórios, mas os diagramas também mostram a consulta de reservas (UC-18). O protótipo não tem tela dedicada para nenhuma das duas.
3. **Raias.** Como o Administrador não tem funções definidas, não há raia para ele. As atividades de validar, calcular e enviar e-mail ficam na raia Sistema.
4. **Rascunho e disponibilidade.** O fluxo original cita o rascunho e a publicação, mas a disponibilidade e os cupons não aparecem nele. Aqui são etapas opcionais antes de publicar.
5. **Ordem do cadastro.** O proprietário se cadastra uma vez. Se já tem conta, o fluxo começa no cadastro da hospedagem.
6. **Cenários fora dos diagramas.** Recuperar senha, registrar preferências e alterar dados cadastrais não têm diagrama próprio. São fluxos curtos, descritos nos casos de uso.

## Veja também

- [Casos de uso](../casos-de-uso/README.md): UC-01 a UC-19.
- [Diagramas de sequência](../sequencia/README.md): troca de mensagens entre os objetos do sistema.
- [Modelagem](../README.md): visão geral da unidade.