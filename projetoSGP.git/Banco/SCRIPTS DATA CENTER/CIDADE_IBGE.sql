CREATE TABLE CIDADE_IBGE (
    ID      integer NOT NULL,
    DT_INC  DATE,
    DT_ALT  DATE,
    STATUS  character(1),
    CODIGO  integer,
    NOME    character varying(100),
    UF      character(2),
    CEP     character(8),
    CONSTRAINT PK_CIDADE_IBGE  PRIMARY KEY (ID)
);