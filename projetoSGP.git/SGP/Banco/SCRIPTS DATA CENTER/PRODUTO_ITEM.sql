﻿CREATE TABLE PRODUTO_ITEM (
    ID           INTEGER,
    DT_INC       DATE,
    DT_ALT       DATE,
    IDPRODUTO    INTEGER,
    STATUS       CHARACTER(1),
    NOME         CHARACTER VARYING(250),
    REFERENCIA   CHARACTER VARYING(10),
    IDTAMANHO    INTEGER,
    IDCOR        INTEGER,
    PESO         NUMERIC(17,4),
    PREC_CUSTO   NUMERIC(17,4),
    PREC_VENDA   NUMERIC(17,4),

    CONSTRAINT PK_PRODUTO_ITEM PRIMARY KEY (ID),
    CONSTRAINT FK_PRODUTO_ITEM_PRODUTO FOREIGN KEY (IDPRODUTO) REFERENCES PRODUTO (ID),
    CONSTRAINT FK_PRODUTO_ITEM_COR FOREIGN KEY (IDCOR) REFERENCES COR (ID),
    CONSTRAINT FK_PRODUTO_ITEM_TAMANHO FOREIGN KEY (IDTAMANHO) REFERENCES TAMANHO (ID)
    
);