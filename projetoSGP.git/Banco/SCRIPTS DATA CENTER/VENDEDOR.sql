CREATE TABLE VENDEDOR
(
  ID integer NOT NULL,
  DT_INC date,
  DT_ALT date,
  STATUS character(1),
  NOME character varying(250),
  DT_NASC date,
  TELEFONE character varying(14),
  ENDERECO character varying(250),
  BAIRRO character varying(20),
  IDCIDADE integer NOT NULL,
  CEP character(8),
  RG character varying(15),
  CPF character varying(15),
  SEXO character(1),
  EMAIL character varying(50),
  CELULAR character varying(14),
  USA_APP CHAR(1),
  CONSTRAINT PK_VENDEDOR PRIMARY KEY (ID)
)