CREATE TABLE PORTADOR (
    ID           INTEGER,
    DT_INC       DATE,
    DT_ALT       DATE,
    STATUS       CHARACTER(1),
    DESCRICAO    CHARACTER VARYING(100),
    idfilial integer NOT NULL,
  CONSTRAINT pk_portador PRIMARY KEY (id, idfilial),
  CONSTRAINT fk_portador_filial FOREIGN KEY (idfilial)
      REFERENCES filial
);