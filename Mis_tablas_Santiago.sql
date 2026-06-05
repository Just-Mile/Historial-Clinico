CREATE TABLE IF NOT EXISTS triaje (
     id_triaje      SERIAL PRIMARY KEY,
    id_consulta    INT          NOT NULL,
    peso_kg        NUMERIC(5,2) NOT NULL,
    talla_cm       NUMERIC(5,1) NOT NULL,
    fech_hora_toma TIMESTAMP    NOT NULL,
    presi_art_si   SMALLINT,
    presi_art_di   SMALLINT,
    rpm            SMALLINT,
    lpm            SMALLINT,
    temp           NUMERIC(4,1),
    spo2           SMALLINT
);

CREATE TABLE IF NOT EXISTS func_bio (
    id_funcion     SERIAL PRIMARY KEY,
    id_consulta    INT          NOT NULL,
    apetito        VARCHAR(50),
    sed            VARCHAR(50),
    sueno          VARCHAR(50),
    deposicion     VARCHAR(50),
    obser_adi      VARCHAR(300),
    actv_sexual    VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS antecedente (
    id_antecedente  SERIAL PRIMARY KEY,
     id_antecedente2 INT,
    id_consulta     INT          NOT NULL,
    tipo            VARCHAR(50)  NOT NULL,
    fech_registro   DATE         NOT NULL,
    gravedad        VARCHAR(30)  NOT NULL,
    descripcion     VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS diagnostico (
    id_diagnostico  SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    tipo            VARCHAR(50)  NOT NULL,
    fech_diagnostic DATE         NOT NULL,
    cod_cie10       VARCHAR(10),
    descripcion     VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS enfermedad_actual (
    id_enfermedad   SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    fecha_ini       DATE         NOT NULL,
    tiempo_enf      VARCHAR(100) NOT NULL,
    descripcion     VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS tratamiento (
    id_tratamiento  SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    id_personal     INT          ,
    tipo            VARCHAR(50)  NOT NULL,
    fech_ini        DATE         NOT NULL,
    fecha_fin       DATE,
    descripc        VARCHAR(300),
    observaciones   VARCHAR(300)
);

