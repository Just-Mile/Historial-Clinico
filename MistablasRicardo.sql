CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente   SERIAL PRIMARY KEY,
    id_ubigeo     INT,
    dni           VARCHAR(20)  NOT NULL,
    nombres       VARCHAR(100) NOT NULL,
    apellidos     VARCHAR(100) NOT NULL,
    fecha_nac     DATE         NOT NULL,
    sexo          CHAR(1)      NOT NULL,
    grupo_sang    VARCHAR(5),
    telefono      VARCHAR(20)  NOT NULL,
    direccion     VARCHAR(200),
    email         VARCHAR(150)
);

CREATE TABLE IF NOT EXISTS centro_salud (
    id_centro     SERIAL PRIMARY KEY,
    nombre        VARCHAR(200) NOT NULL,
    direccion     VARCHAR(200) NOT NULL,
    nivel_atencion VARCHAR(50) NOT NULL,
    distrito      VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS historia_clinica (
    id_historia    SERIAL PRIMARY KEY,
    
    id_paciente    INT          NOT NULL,
    num_hc         VARCHAR(50)  NOT NULL,
    fech_apertura  DATE         NOT NULL,
    estado         VARCHAR(20)  NOT NULL,
    obser_general  VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS consulta (
    id_consulta    SERIAL PRIMARY KEY,
    id_historia    INT          NOT NULL,
    id_personal    INT          NOT NULL,
    
    
    fecha          DATE         NOT NULL,
    hora           TIME         NOT NULL,
    tipo           VARCHAR(50)  NOT NULL,
    motivo         VARCHAR(500) NOT NULL,
    estado_paci    VARCHAR(50)  NOT NULL,
    pre_registro_triage VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS examen_aux (
    id_examen       SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    id_personal     INT          NOT NULL,
    
    tipo            VARCHAR(50)  NOT NULL,
    nombre          VARCHAR(200) NOT NULL,
    fech_soli       DATE         NOT NULL,
    estado          VARCHAR(20)  NOT NULL
);

CREATE TABLE IF NOT EXISTS prescripcion (
    id_prescripcion SERIAL PRIMARY KEY,
    id_tratamiento  INT          NOT NULL,
    id_medicamento  INT          NOT NULL,
    dosis           VARCHAR(100) NOT NULL,
    frecuencia      VARCHAR(100) NOT NULL,
    duracion_dias   INT          NOT NULL,
    via_admin       VARCHAR(50)  NOT NULL
);
