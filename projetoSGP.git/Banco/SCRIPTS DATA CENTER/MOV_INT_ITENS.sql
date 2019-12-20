CREATE TABLE mov_int_itens
(
  idmov integer NOT NULL,
  item integer NOT NULL,
  idprod_item integer NOT NULL,
  idfilial integer NOT NULL,
  qtn numeric(15,3),
  peso numeric(17,4),
  CONSTRAINT pk_movintitens PRIMARY KEY (idmov, item, idfilial),
  CONSTRAINT fk_iditem_mov_int_itens FOREIGN KEY (idprod_item) REFERENCES produto_item (id),
  CONSTRAINT fk_movintitens_filial FOREIGN KEY (idfilial) REFERENCES filial (id),
  CONSTRAINT fk_movintitens_movi FOREIGN KEY (idmov, idfilial) REFERENCES movimentacao_interna (id, idfilial)
)
