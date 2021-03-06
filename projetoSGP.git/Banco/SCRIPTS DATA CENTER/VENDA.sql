﻿CREATE TABLE VENDA (
    ID             INTEGER NOT NULL,
    IDFILIAL       INTEGER NOT NULL,
    IDCAIXA        INTEGER NOT NULL,
    DT_INC         DATE,
    STATUS         CHARACTER(2),
    IDCLIENTE      INTEGER NOT NULL,
    IDVENDEDOR     INTEGER NOT NULL,
    IDFORMA_PAG    INTEGER NOT NULL,
    VLR_TOTITEM    NUMERIC(17,4),
	VLR_ENTRADA   NUMERIC(17,4),
    VLR_DESCONTO   NUMERIC(17,4),
    VLR_FRETE      NUMERIC(17,4),
    VLR_TOTAL      NUMERIC(17,4),
    PESO           NUMERIC(17,4),
    PREFIXO        CHARACTER(2),
    DT_FECHAMENTO  DATE,
    SUBTRIBUTARIA  NUMERIC(17,4),

    CONSTRAINT PK_VENDA PRIMARY KEY (ID, IDFILIAL),
    CONSTRAINT FK_CAIXA_CAIXA FOREIGN KEY (IDCAIXA, IDFILIAL) REFERENCES CAIXA (ID, IDFILIAL),
    CONSTRAINT FK_VENDA_CLIENTE FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE (ID),
    CONSTRAINT FK_VENDA_FORMA_PAG FOREIGN KEY (IDFORMA_PAG) REFERENCES FORMA_PAGAMENTO (ID),
    CONSTRAINT FK_VENDA_VENDEDOR FOREIGN KEY (IDVENDEDOR) REFERENCES VENDEDOR (ID)
    
);

CREATE TRIGGER venda_insert_cmd_tg
  AFTER INSERT OR UPDATE OR DELETE
  ON venda
  FOR EACH ROW
  EXECUTE PROCEDURE add_comando_sincronizar();