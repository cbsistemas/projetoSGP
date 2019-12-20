CREATE TABLE cnt_receber
(
  id integer NOT NULL,
  idFilial integer NOT NULL,
  dt_inc date,
  dt_alt date,
  posicao character(2),
  prefixo character(2),
  referencia character varying(12),
  idcliente integer,
  acrescimo numeric(17,4),
  desconto numeric(17,4),
  valor numeric(17,4),
  valor_pago numeric(17,4),
  idportador integer,
  historico character varying(200),
  idforma_pag integer,
  idvenda integer,
  tipo_venda character(2),
  tot_parcela character(3),
  parcelas_pg integer,
  dinheiro numeric(17,4),
  CONSTRAINT pk_cnt_receber PRIMARY KEY (id, idfilial),
  CONSTRAINT FK_RECEBER_FILIAL FOREIGN KEY (idfilial) REFERENCES FILIAL,
  CONSTRAINT fk_receber_cliente FOREIGN KEY (idcliente)
      REFERENCES cliente (id),
  CONSTRAINT fk_receber_forma_pag FOREIGN KEY (idforma_pag)
      REFERENCES forma_pagamento (id),
  CONSTRAINT fk_receber_portador FOREIGN KEY (idportador, idfilial)
      REFERENCES portador (id, idfilial)
)