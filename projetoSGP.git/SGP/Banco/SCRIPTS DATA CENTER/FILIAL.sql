CREATE TABLE FILIAL (
    ID           integer NOT NULL,
    DT_INC       DATE,
    DT_ALT       DATE,
    STATUS       CHAR(1) DEFAULT 'A',
    NOME         character varying(250),
    ENDERECO     character varying(250),
    BAIRRO        character varying(20),
    IDCIDADE     integer,
    CEP           character varying(8),
    TELEFONE1     character varying(13),
    TELEFONE2    character varying(13),
    EMAIL        character varying(50),
    IDROTA       integer,
    CONSTRAINT PK_FILIAL PRIMARY KEY (ID),
    CONSTRAINT FK_FILIAL_CIDADE FOREIGN KEY (IDCIDADE) REFERENCES CIDADE_IBGE (ID),
    CONSTRAINT FK_FILIAL_ROTA FOREIGN KEY (IDROTA) REFERENCES ROTA (ID)
);