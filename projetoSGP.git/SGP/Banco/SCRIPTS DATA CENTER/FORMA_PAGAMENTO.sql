﻿CREATE TABLE FORMA_PAGAMENTO (
    ID              INTEGER,
    DT_INC          DATE,
    DT_ALT          DATE,
    NOME            CHARACTER VARYING(250),
    PARCELA_MAXIMA  INTEGER,
    PERIODO         INTEGER,
    MOEDA           CHARACTER(2),
    CONSTRAINT PK_FORMA_PAG PRIMARY KEY (ID)
);