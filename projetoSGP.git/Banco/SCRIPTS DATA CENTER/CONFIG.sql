﻿CREATE TABLE CONFIG 
(
    ID                INTEGER NOT NULL,
    IDFILIAL          INTEGER NOT NULL,
    RAZAO             CHARACTER VARYING(100),
    CNPJ              CHARACTER VARYING(14),
    IE                CHARACTER VARYING(15),
    ENDERECO          CHARACTER VARYING(100),
    BAIRRO            CHARACTER VARYING(50),
    IDCIDADE          INTEGER NOT NULL,
    TELEFONE          CHARACTER(13),
    FAX               CHARACTER(13),
    EMAIL             CHARACTER VARYING(50),
    SITE              CHARACTER VARYING(50),
    LOGO_IMG_CAMINHO  CHARACTER VARYING(200),
    NOME              CHARACTER VARYING(100),
    IDCLIENTEPADRAO   INT NOT NULL,
    IDVENDEDORPADRAO  INTEGER NOT NULL,
    IDFORM_PAG_PAD    INTEGER NOT NULL,

    CONSTRAINT PK_CONFIG PRIMARY KEY (ID),
    CONSTRAINT FK_CONFIG_FILIAL FOREIGN KEY (IDFILIAL) REFERENCES FILIAL,
    CONSTRAINT FK_CONFIG_CIDADE FOREIGN KEY (IDCIDADE) REFERENCES CIDADE_IBGE,
    CONSTRAINT FK_CONFIG_CLIENTE FOREIGN KEY (IDCLIENTEPADRAO) REFERENCES CLIENTE,
    CONSTRAINT FK_CONFIG_VENDEDOR FOREIGN KEY (IDVENDEDORPADRAO) REFERENCES VENDEDOR,
    CONSTRAINT FK_CONFIG_FORMAPAG FOREIGN KEY (IDFORM_PAG_PAD) REFERENCES FORMA_PAGAMENTO
)