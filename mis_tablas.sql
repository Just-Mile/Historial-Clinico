CREATE TABLE IF NOT EXISTS result_exam (
    id_resultado    SERIAL PRIMARY KEY,
    id_examen       INT          NOT NULL,
    tipo            VARCHAR(50)  NOT NULL,
    nombre          VARCHAR(200) NOT NULL,
    fech_soli       DATE         NOT NULL,
    fech_resultado  DATE,
    resultado       VARCHAR(500),
    archivo_result  VARCHAR(300)
);

CREATE TABLE IF NOT EXISTS personal_salud (
    id_personal    SERIAL PRIMARY KEY,
    id_departamento INT          NOT NULL,
    id_especialidad INT          NOT NULL,
    dni            VARCHAR(20)  NOT NULL,
    nombres        VARCHAR(100) NOT NULL,
    apellidos      VARCHAR(100) NOT NULL,
    rol            VARCHAR(50)  NOT NULL,
    estado         VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS medicamento (
    id_medicamento  SERIAL PRIMARY KEY,
    nomb_gene       VARCHAR(200) NOT NULL,
    nomb_comercial  VARCHAR(200),
    concentracion   VARCHAR(100) NOT NULL,
    presentacion    VARCHAR(100) NOT NULL,
    grupo_alc       VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS usuario_sist (
    id_usuario      SERIAL PRIMARY KEY,
    id_personal     INT          NOT NULL,
    username        VARCHAR(100) NOT NULL,
    password        VARCHAR(255) NOT NULL,
    ult_acceso      TIMESTAMP,
    estado          VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS rol (
    id_rol          SERIAL PRIMARY KEY,
    nomb_rol        VARCHAR(100) NOT NULL,
    descripcion     VARCHAR(300),
    permisos        VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS usuario_rol (
    id_usuario_rol  SERIAL PRIMARY KEY,
    id_usuario      INT          NOT NULL,
    id_rol          INT          NOT NULL,
    fecha_asig      DATE         NOT NULL
);
