﻿CREATE TABLE VEICULO (
    ID           INTEGER,
    DT_INC       DATE,
    DT_ALT       DATE,
    STATUS       CHARACTER(1),
    NOME         CHARACTER VARYING(250),
    MODELO       CHARACTER VARYING(20),
    PLACA        CHARACTER VARYING(7),
    CARGA_MAX    NUMERIC(17,4),
    CONSTRAINT PK_VEICULO PRIMARY KEY (ID)
);