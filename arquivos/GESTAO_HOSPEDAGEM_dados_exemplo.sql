-- ------------------------------------------------------
-- HERA - Gestão de Hospedagem
-- Dados de exemplo para demonstração da estrutura do banco
--
-- Executar depois de GESTAO_HOSPEDAGEM.sql.
-- Todos os dados são fictícios: nomes, endereços, CEPs, CPFs, CNPJ,
-- celulares e e-mails (domínio reservado example.com) foram inventados
-- e não correspondem a pessoas ou empresas reais. Os CPFs e o CNPJ têm
-- dígitos verificadores inválidos de propósito.
--
-- Cenário: 3 cidades, 2 proprietários (pessoa física e jurídica),
-- 4 clientes e 4 hospedagens (3 publicadas e 1 em rascunho).
-- As 5 reservas cobrem os quatro status. As duas reservas concluídas
-- têm avaliação da hospedagem e avaliação do cliente.
--
-- Valor total da reserva = noites x valor da noite + taxa de limpeza
-- - desconto. Datas de referência: novembro de 2026.
-- ------------------------------------------------------

SET NAMES utf8mb4;

USE `GESTAO_HOSPEDAGEM`;

START TRANSACTION;

-- ------------------------------------------------------
-- Endereços
-- ------------------------------------------------------

INSERT INTO `ENDERECO_CIDADE` (`ENCI_ID_CIDADE`, `ENCI_NM_CIDADE`, `ENCI_SG_ESTADO`) VALUES
  (1, 'Porto Velho',   'RO'),
  (2, 'Ji-Paraná',     'RO'),
  (3, 'Florianópolis', 'SC');

INSERT INTO `ENDERECO_CEP` (`ENCE_ID_CEP`, `ENCE_NR_CEP`, `FK_ENCI_ID_CIDADE`) VALUES
  (1, '76800001', 1),
  (2, '76800002', 1),
  (3, '76800003', 1),
  (4, '76900001', 2),
  (5, '88000001', 3),
  (6, '88000002', 3);

-- 1 e 2: proprietários | 3 a 6: clientes | 7 a 10: hospedagens
-- (cada hospedagem tem endereço próprio, por causa de uq_caho_endereco)
INSERT INTO `ENDERECO` (`ENDE_ID_ENDERECO`, `ENDE_NR_ENDERECO`, `ENDE_DS_COMPLEMENTO`, `FK_ENCE_ID_CEP`, `ENDE_DS_BAIRRO`, `ENDE_DS_LOGRADOURO`) VALUES
  (1,  '120',  NULL,       1, 'Centro Exemplo',     'Rua das Palmeiras Fictícias'),
  (2,  '1500', 'Sala 302', 5, 'Centro Exemplo',     'Avenida Beira-Mar Exemplo'),
  (3,  '45',   'Apto 101', 2, 'Bairro Modelo',      'Rua dos Ipês Imaginários'),
  (4,  NULL,   NULL,       4, 'Vila Exemplo',       'Rua Projetada A'),
  (5,  '78',   NULL,       3, 'Jardim Fictício',    'Travessa das Mangueiras Fictícias'),
  (6,  '12',   'Casa 2',   6, 'Praia Exemplo',      'Servidão dos Pescadores Exemplo'),
  (7,  'km 5',  NULL,      3, 'Zona Rural Exemplo', 'Estrada do Recanto Fictício'),
  (8,  '300',  'Apto 804', 1, 'Centro Exemplo',     'Rua das Palmeiras Fictícias'),
  (9,  '2200', NULL,       6, 'Serra Exemplo',      'Rodovia da Serra Azul Exemplo'),
  (10, '900',  NULL,       4, 'Jardim Exemplo',     'Avenida do Sol Nascente Exemplo');

-- ------------------------------------------------------
-- Usuários e perfis
-- ------------------------------------------------------

-- Cada usuário tem um único perfil (cliente OU proprietário).
-- As senhas são textos de exemplo no formato de hash, não senhas reais.
-- O usuário 4 entra pela conta Google, por isso não tem senha.
INSERT INTO `USUARIOS` (`USUA_ID_USUARIO`, `USUA_DS_EMAIL`, `USUA_DS_SENHA`, `USUA_ID_GOOGLE`, `USUA_DS_TIPO`) VALUES
  (1, 'marina.exemplo@example.com',   '$2b$12$HashFicticioDeExemploParaDemonstracao000000000000001', NULL,                    'PROPRIETARIO'),
  (2, 'contato.pousadas@example.com', '$2b$12$HashFicticioDeExemploParaDemonstracao000000000000002', NULL,                    'PROPRIETARIO'),
  (3, 'joao.ficticio@example.com',    '$2b$12$HashFicticioDeExemploParaDemonstracao000000000000003', NULL,                    'CLIENTE'),
  (4, 'beatriz.modelo@example.com',   NULL,                                                         'google-exemplo-000000004', 'CLIENTE'),
  (5, 'carlos.demo@example.com',      '$2b$12$HashFicticioDeExemploParaDemonstracao000000000000005', NULL,                    'CLIENTE'),
  (6, 'luiza.amostra@example.com',    '$2b$12$HashFicticioDeExemploParaDemonstracao000000000000006', NULL,                    'CLIENTE');

INSERT INTO `RECUPERACAO_SENHA` (`RESN_ID_RECUPERACAO`, `FK_USUA_ID_USUARIO`, `RESN_DS_CODIGO`, `RESN_DT_EXPIRAR`, `RESN_LG_USADO`) VALUES
  (1, 3, '48213', '2026-11-20 10:15:00', 1),
  (2, 5, '90571', '2026-11-26 18:30:00', 0);

-- Proprietário 1: pessoa física (CPF). Proprietário 2: pessoa jurídica (CNPJ).
INSERT INTO `PROPRIETARIO` (`PROP_ID_PROPRIETARIO`, `FK_USUA_ID_USUARIO`, `PROP_NR_CPF`, `PROP_NR_CNPJ`, `PROP_NM_COMPLETO`, `PROP_DS_CELULAR`, `FK_ENDE_ID_ENDERECO`) VALUES
  (1, 1, '000.000.009-00', NULL,                 'Marina Exemplo Tavares', '69900000001', 1),
  (2, 2, NULL,             '00.000.000/0001-00', 'Pousadas Exemplo Ltda',  '48900000002', 2);

-- Celular só com dígitos (DDD + número), pois o campo é varchar(12).
INSERT INTO `CLIENTE` (`CLIE_ID_CLIENTE`, `FK_USUA_ID_USUARIO`, `CLIE_NM_COMPLETO`, `CLIE_NR_CPF`, `CLIE_DT_NASCIMENTO`, `CLIE_DS_CELULAR`, `FK_ENDE_ID_ENDERECO`) VALUES
  (1, 3, 'João Fictício da Silva',   '000.000.001-00', '1990-03-14', '69900000003', 3),
  (2, 4, 'Beatriz Modelo Costa',     '000.000.002-00', '1985-07-22', '69900000004', 4),
  (3, 5, 'Carlos Demonstração Lima', '000.000.003-00', '1998-11-05', '69900000005', 5),
  (4, 6, 'Luíza Amostra Rocha',      '000.000.004-00', '2001-01-30', '48900000006', 6);

INSERT INTO `PREFERENCIA` (`PREF_ID_PREFERENCIA`, `PREF_NM_PREFERENCIA`) VALUES
  (1, 'Praia'),
  (2, 'Natureza'),
  (3, 'Pet friendly'),
  (4, 'Piscina'),
  (5, 'Centro da cidade');

INSERT INTO `CLIENTE_PREFERENCIA` (`FK_CLIE_ID_CLIENTE`, `FK_PREF_ID_PREFERENCIA`) VALUES
  (1, 2),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 5),
  (4, 1),
  (4, 2);

-- ------------------------------------------------------
-- Hospedagens
-- ------------------------------------------------------

INSERT INTO `COMODIDADES` (`COMO_ID_COMODIDADES`, `COMO_NM_COMODIDADE`) VALUES
  (1, 'Wi-Fi'),
  (2, 'Ar-condicionado'),
  (3, 'Piscina'),
  (4, 'Estacionamento'),
  (5, 'Cozinha equipada'),
  (6, 'Churrasqueira'),
  (7, 'Aceita pets');

INSERT INTO `CADASTRO_HOSPEDAGEM` (`CAHO_ID_HOSPEDAGEM`, `FK_PROP_ID_PROPRIETARIO`, `CAHO_NM_HOSPEDAGEM`, `CAHO_DS_IMOVEL`, `CAHO_TP_IMOVEL`, `CAHO_NR_CAPACIDADE`, `CAHO_NR_AREA`, `CAHO_HR_CHECKIN`, `CAHO_HR_CHECKOUT`, `CAHO_NR_ANTECEDENCIA`, `CAHO_NR_ESTADIA_MINIMA`, `CAHO_LG_FUMANTES`, `CAHO_LG_FESTAS`, `CAHO_VL_DIARIA`, `CAHO_VL_FIM_SEMANA`, `CAHO_VL_LIMPEZA`, `CAHO_DS_STATUS`, `FK_ENDE_ID_ENDERECO`) VALUES
  (1, 1, 'Casa Recanto do Rio',      'Casa com três quartos, varanda e quintal amplo, a 5 km do centro.',   'Casa',        6,  180.00, '14:00:00', '11:00:00', 2, 2, 0, 0, 350.00, 420.00, 80.00,  'PUBLICADA', 7),
  (2, 1, 'Apartamento Vista Centro', 'Apartamento de um quarto no centro, perto de restaurantes e lojas.',   'Apartamento', 3,  55.00,  '15:00:00', '12:00:00', 1, 1, 0, 0, 180.00, NULL,   40.00,  'PUBLICADA', 8),
  (3, 2, 'Chalé Serra Azul',         'Chalé de madeira com lareira e vista para a serra.',                    'Chalé',       4,  70.50,  '14:00:00', '10:00:00', 3, 2, 0, 0, 420.00, 500.00, 100.00, 'PUBLICADA', 9),
  (4, 2, 'Pousada Sol Nascente',     'Pousada com cinco suítes e café da manhã. Cadastro ainda em revisão.', 'Pousada',     10, 320.00, '13:00:00', '11:00:00', 1, 1, 0, 1, 260.00, NULL,   0.00,   'RASCUNHO',  10);

INSERT INTO `HOSPEDAGEM_COMODIDADES` (`FK_COMO_ID_COMODIDADES`, `FK_CAHO_ID_HOSPEDAGEM`) VALUES
  (1, 1), (3, 1), (4, 1), (5, 1), (6, 1), (7, 1),
  (1, 2), (2, 2), (5, 2),
  (1, 3), (4, 3), (5, 3),
  (1, 4), (2, 4), (3, 4), (4, 4);

INSERT INTO `FOTO_HOSPEDAGEM` (`FOHO_ID_FOTO`, `FK_CAHO_ID_HOSPEDAGEM`, `FOHO_DS_CAMINHO`, `FOHO_NR_ORDEM`) VALUES
  (1,  1, 'uploads/hospedagens/1/fachada.jpg',   1),
  (2,  1, 'uploads/hospedagens/1/piscina.jpg',   2),
  (3,  1, 'uploads/hospedagens/1/quarto.jpg',    3),
  (4,  2, 'uploads/hospedagens/2/sala.jpg',      1),
  (5,  2, 'uploads/hospedagens/2/quarto.jpg',    2),
  (6,  3, 'uploads/hospedagens/3/fachada.jpg',   1),
  (7,  3, 'uploads/hospedagens/3/lareira.jpg',   2),
  (8,  3, 'uploads/hospedagens/3/vista.jpg',     3),
  (9,  4, 'uploads/hospedagens/4/fachada.jpg',   1);

INSERT INTO `PRECO_PERIODO` (`PRPE_ID_PERIODO`, `FK_CAHO_ID_HOSPEDAGEM`, `PRPE_DT_INICIO`, `PRPE_DT_FIM`, `PRPE_DS_TIPO`, `PRPE_VL_NOITE`) VALUES
  (1, 1, '2026-12-24', '2026-12-26', 'Feriado',         450.00),
  (2, 2, '2026-12-30', '2027-01-02', 'Feriado',         250.00),
  (3, 3, '2026-12-20', '2027-01-31', 'Alta temporada',  550.00);

-- ------------------------------------------------------
-- Cupons e formas de pagamento
-- ------------------------------------------------------

INSERT INTO `CUPOM` (`CUPO_ID_CUPOM`, `CUPO_DS_CODIGO`, `CUPO_DS_TIPO`, `CUPO_VL_DESCONTO`, `CUPO_DT_VALIDADE`, `CUPO_LG_ATIVO`) VALUES
  (1, 'BEMVINDO10',  'PERCENTUAL', 10.00, NULL,         1),
  (2, 'HERA50',      'VALOR_FIXO', 50.00, '2026-12-31', 1),
  (3, 'INVERNO2026', 'PERCENTUAL', 15.00, '2026-08-31', 0);

INSERT INTO `PAGAMENTO` (`PAGA_ID_PAGAMENTO`, `PAGA_TP_PAGAMENTO`) VALUES
  (1, 'PIX'),
  (2, 'CARTAO_CREDITO'),
  (3, 'CARTAO_DEBITO'),
  (4, 'BOLETO');

-- ------------------------------------------------------
-- Reservas
-- ------------------------------------------------------

-- 1: CONCLUIDA  - Casa Recanto do Rio, 3 noites x 350 + 80 = 1130, cupom 10% (-113) = 1017
-- 2: CONCLUIDA  - Chalé Serra Azul, 3 noites x 420 + 100 = 1360, sem cupom
-- 3: CONFIRMADA - Apartamento Vista Centro, 3 noites x 180 + 40 = 580, cupom HERA50 (-50) = 530
-- 4: PENDENTE   - Chalé Serra Azul (alta temporada), 3 noites x 550 + 100 = 1750
-- 5: CANCELADA  - Casa Recanto do Rio, 2 noites x 350 + 80 = 780
-- As diárias caem de segunda a quinta, então não se aplica o valor de fim de semana.
INSERT INTO `RESERVA` (`RESE_ID_RESERVA`, `FK_CAHO_ID_HOSPEDAGEM`, `FK_CLIE_ID_CLIENTE`, `FK_CUPO_ID_CUPOM`, `RESE_DT_CHECKIN`, `RESE_DT_CHECKOUT`, `RESE_NR_HOSPEDE`, `RESE_LG_CONTRATO`, `RESE_DS_CODIGO`, `RESE_VL_TOTAL`, `RESE_VL_DESCONTO`, `RESE_DS_STATUS`) VALUES
  (1, 1, 1, 1,    '2026-10-05 14:00:00', '2026-10-08 11:00:00', 4, 1, '#HERA-00001', 1017.00, 113.00, 'CONCLUIDA'),
  (2, 3, 4, NULL, '2026-10-19 14:00:00', '2026-10-22 10:00:00', 2, 1, '#HERA-00002', 1360.00, 0.00,   'CONCLUIDA'),
  (3, 2, 3, 2,    '2026-12-07 15:00:00', '2026-12-10 12:00:00', 2, 1, '#HERA-00003', 530.00,  50.00,  'CONFIRMADA'),
  (4, 3, 2, NULL, '2027-01-04 14:00:00', '2027-01-07 10:00:00', 3, 1, '#HERA-00004', 1750.00, 0.00,   'PENDENTE'),
  (5, 1, 2, NULL, '2026-11-09 14:00:00', '2026-11-11 11:00:00', 3, 1, '#HERA-00005', 780.00,  0.00,   'CANCELADA');

-- Reserva 2 paga com duas formas combinadas (Pix + cartão de crédito).
-- Reserva 4 tem boleto emitido e ainda não pago (por isso está PENDENTE).
-- Reserva 5 teve o pagamento estornado após o cancelamento.
INSERT INTO `RESERVA_PAGAMENTO` (`FK_RESE_ID_RESERVA`, `FK_PAGA_ID_PAGAMENTO`, `REPA_VL_PAGO`, `REPA_DT_PAGAMENTO`, `REPA_DS_STATUS`) VALUES
  (1, 1, 1017.00, '2026-09-28 09:12:00', 'APROVADO'),
  (2, 1, 500.00,  '2026-10-10 20:40:00', 'APROVADO'),
  (2, 2, 860.00,  '2026-10-10 20:42:00', 'APROVADO'),
  (3, 2, 530.00,  '2026-11-20 16:05:00', 'APROVADO'),
  (4, 4, 1750.00, '2026-11-25 11:30:00', 'PENDENTE'),
  (5, 3, 780.00,  '2026-10-30 08:55:00', 'ESTORNADO');

-- ------------------------------------------------------
-- Avaliações (somente das reservas concluídas, notas de 1 a 5)
-- ------------------------------------------------------

INSERT INTO `AVALIACAO_HOSPEDAGEM` (`AVHO_ID_AVALIACAO`, `AVHO_NR_GERAL`, `AVHO_NR_LIMPEZA`, `AVHO_NR_CONFORTO`, `AVHO_NR_ATENDIMENTO`, `AVHO_NR_CUSTO_BENEFICIO`, `AVHO_DS_COMENTARIO`, `AVHO_DT_AVALIACAO`, `FK_RESE_ID_RESERVA`) VALUES
  (1, 5, 5, 4, 5, 5, 'Casa muito limpa e confortável, a piscina foi o ponto alto da viagem.', '2026-10-09 18:20:00', 1),
  (2, 4, 4, 5, 4, 3, 'Chalé aconchegante e com vista linda, mas o valor da diária é alto.',     '2026-10-23 09:45:00', 2);

INSERT INTO `AVALIACAO_CLIENTE` (`AVCL_ID_AVALIACAO`, `AVCL_NR_GERAL`, `AVCL_NR_COMUNICACAO`, `AVCL_NR_PONTUALIDADE`, `AVCL_NR_RESPEITO_REGRA`, `AVCL_NR_CUIDADO_IMOVEL`, `AVCL_DS_COMENTARIO`, `AVCL_DT_AVALIACAO`, `FK_RESE_ID_RESERVA`) VALUES
  (1, 5, 5, 5, 5, 5, 'Hóspede atencioso, deixou a casa organizada.',              '2026-10-08 15:00:00', 1),
  (2, 4, 5, 3, 5, 4, 'Ótima comunicação. Fez o check-out uma hora após o horário.', '2026-10-22 13:10:00', 2);

COMMIT;
