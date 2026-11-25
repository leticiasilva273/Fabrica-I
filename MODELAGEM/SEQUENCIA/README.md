# Diagramas de sequência

Milestone 2 · Modelagem UML (Engenharia de Software, Fábrica de Software I)

Seis diagramas de sequência cobrem os cenários principais do Hospedagem Familiar. Cada um mostra como os objetos do sistema conversam para realizar um caso de uso: o ator, a tela, os objetos de domínio e os serviços externos, com os caminhos alternativos e de erro.

## Cenários e diagramas

| Cenário | UC | RF | US | Diagrama |
|---|---|---|---|---|
| Autenticar e recuperar senha | UC-03, UC-04 | RF02, RF03 | a definir | [seq-autenticar.svg](seq-autenticar.svg) |
| Pesquisar hospedagem | UC-12 | RF10 | a definir | [seq-pesquisar-hospedagem.svg](seq-pesquisar-hospedagem.svg) |
| Solicitar reserva com cupom e pagamento | UC-13, UC-14, UC-15 | RF11, RF12, RF13 | a definir | [seq-solicitar-reserva.svg](seq-solicitar-reserva.svg) |
| Cancelar reserva | UC-16 | sem RF (D1) | a definir | [seq-cancelar-reserva.svg](seq-cancelar-reserva.svg) |
| Cadastrar, definir preços e publicar hospedagem | UC-06, UC-07, UC-08 | RF05, RF06, RF07 | a definir | [seq-cadastrar-publicar-hospedagem.svg](seq-cadastrar-publicar-hospedagem.svg) |
| Avaliar hospedagem | UC-17 | RF14 | a definir | [seq-avaliar-hospedagem.svg](seq-avaliar-hospedagem.svg) |

A coluna US fica "a definir" porque os IDs das histórias de usuário ainda não foram mapeados nos casos de uso. Quando existirem, cada linha recebe os IDs US-xxx dos UC correspondentes.

## Convenções de leitura

- **Participantes:** o ator aparece à esquerda (Cliente, Proprietário ou Usuário). Os demais são a tela, objetos de domínio (`:Reserva`, `:Hospedagem`, `:Cupom`, `:Pagamento`, `:Avaliação`) e serviços fora da fronteira, como `:E-mail (externo)`. Como o projeto ainda não tem código, não há rotas nem camadas de implementação. Quando a arquitetura for definida, os participantes podem ser trocados pelas camadas reais.
- **Mensagens:** os nomes seguem o formato `operação(parâmetros)`, no estilo das operações dos diagramas de classes.
- **Setas:** seta cheia é chamada síncrona. Seta tracejada é retorno. Seta que volta ao próprio participante é autochamada.
- **Fragmentos:** `alt` tem uma guarda por ramo, entre colchetes, e vale um ramo só por execução. `opt` é trecho opcional.
- **Erros:** a resposta de erro volta pela cadeia até o ator, com a mensagem exibida na tela.
- **Fora dos diagramas:** para manter cada um enxuto, alguns erros ficam só na especificação dos casos de uso. Exemplos: cupom recusado, soma do pagamento diferente do total e capacidade de hóspedes excedida.

## Diagramas

### Autenticar e recuperar senha (UC-03, UC-04)
![Diagrama de sequência de autenticar e recuperar senha](seq-autenticar.svg)

O usuário informa e-mail e senha. A autenticação busca a conta e, se as credenciais forem válidas, cria a sessão e abre a área do tipo de conta. Credenciais inválidas voltam como erro, sem dizer qual campo está errado. No ramo "esqueceu a senha", o sistema gera um código, envia por e-mail e, com o código e a nova senha, atualiza a conta.

### Pesquisar hospedagem (UC-12)
![Diagrama de sequência de pesquisar hospedagem](seq-pesquisar-hospedagem.svg)

A busca lista só hospedagens publicadas pelo destino e pelo número de hóspedes, e depois filtra pelas datas. Se há resultados, o cliente vê a lista com preço e nota e pode abrir o detalhe de uma hospedagem, que traz fotos, regras, política de cancelamento e a nota média. Sem resultados, a tela mostra a lista vazia.

### Solicitar reserva com cupom e pagamento (UC-13, UC-14, UC-15)
![Diagrama de sequência de solicitar reserva](seq-solicitar-reserva.svg)

A reserva começa pela verificação de disponibilidade das datas. Com datas livres, o sistema calcula o valor (noites multiplicadas pelo preço de cada período) e mostra o resumo. O cupom é opcional: se o cliente o informar, o sistema valida e recalcula o total. Depois de aceitar o contrato, o cliente registra as formas de pagamento, e o sistema confere se a soma é igual ao total, marca a reserva como confirmada e envia o e-mail de confirmação.

### Cancelar reserva (UC-16)
![Diagrama de sequência de cancelar reserva](seq-cancelar-reserva.svg)

O sistema confere o status e o prazo. Reserva em estadia ou finalizada não pode ser cancelada. Dentro do prazo de 48 horas, o reembolso é integral, a reserva vira cancelada e o cliente é avisado por e-mail. Fora do prazo, a regra de reembolso ainda não está definida (D1).

### Cadastrar, definir preços e publicar hospedagem (UC-06, UC-07, UC-08)
![Diagrama de sequência de cadastrar e publicar hospedagem](seq-cadastrar-publicar-hospedagem.svg)

O proprietário preenche fotos, informações, comodidades e regras. A hospedagem valida os campos obrigatórios e é gravada como rascunho. Em seguida, o proprietário define os preços por período, que não podem se sobrepor. Ao publicar, o sistema confere os dados mínimos: se estiverem completos, a hospedagem fica publicada, e se não, a tela indica o que falta.

### Avaliar hospedagem (UC-17)
![Diagrama de sequência de avaliar hospedagem](seq-avaliar-hospedagem.svg)

A avaliação só é aceita de quem tem uma estadia concluída na hospedagem, e uma única vez por estadia. Ao gravar, o sistema atualiza a nota média da hospedagem. A nota geral é dada pelo próprio cliente, junto com os critérios e o comentário.

## Divergências

Diferenças entre os diagramas, os requisitos e o protótipo. Nada foi corrigido aqui: os itens são para decisão do grupo.

1. **Cancelamento sem requisito (D1).** O UC-16 não tem RF na lista de 18. A regra de reembolso fora do prazo de 48 horas também não está definida, e o diagrama só indica "regra a definir".
2. **Regras marcadas como "a confirmar".** Os diagramas assumem que avaliação exige estadia concluída, que só há uma avaliação por estadia e que a publicação exige dados mínimos. Essas regras vêm das telas e dos casos de uso, e não dos requisitos escritos.
3. **Login com Google.** O RF02 pode prever entrar com conta Google, mas não há detalhes. O diagrama de autenticação mostra só e-mail e senha.
4. **Arquitetura não definida.** Os participantes são objetos de domínio e a tela. Sem API definida, não há nomes de rotas nem de classes de serviço.
5. **Cenários que ficaram de fora.** Informar disponibilidade (UC-09), gerenciar cupons (UC-10), registrar preferências (UC-11), consultar reservas (UC-18) e gerar relatórios (UC-19) não têm diagrama. Se o professor pedir cobertura total, acrescentar.
6. **Ator Administrador.** Não aparece em nenhum diagrama, porque nenhum requisito define as funções dele.

## Veja também

- [Casos de uso](../casos-de-uso/README.md)
- [Classes](../classes/README.md)
- [Atividades](../atividades/README.md)
- [Estados](../estados/README.md)
- [Requisitos funcionais](../../requisitos-funcionais.md)
- [Modelagem](../README.md)