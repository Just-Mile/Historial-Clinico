DROP TABLE IF EXISTS pacientes;
DROP TABLE IF EXISTS centro_salud;
DROP TABLE IF EXISTS historia_clinica;
DROP TABLE IF EXISTS consulta;
DROP TABLE IF EXISTS examen_aux;
DROP TABLE IF EXISTS prescripcion;
DROP TABLE IF EXISTS result_exam;
DROP TABLE IF EXISTS personal_salud;
DROP TABLE IF EXISTS medicamento;
DROP TABLE IF EXISTs triaje;
Drop TABLE IF EXISTS func_bio;
Drop table if exists antecedente;
DROP TABLE IF EXISTS diagnostico;
DROP TABLE IF EXISTS enfermedad_actual;
DROP TABLE IF EXISTS tratamiento;
DROP TABLE IF EXISTS usuario_sist;
DROP TABLE IF EXISTS rol;
DROP TABLE IF EXISTS usuario_rol;

CREATE TABLE IF NOT EXISTS triaje (
    id_triaje       SERIAL PRIMARY KEY,
    id_paciente     INT NOT NULL,    
    fecha           DATE NOT NULL,      
    peso_kg         NUMERIC(5,2) NOT NULL,
    talla_cm        NUMERIC(5,1) NOT NULL,
    fech_hora_toma  TIMESTAMP NOT NULL,
    presi_art_si    SMALLINT,
    presi_art_di    SMALLINT,
    rpm             SMALLINT,
    lpm             SMALLINT,
    temp            NUMERIC(4,1),
    spo2            SMALLINT
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
    id_historia     INT          NOT NULL,
    tipo            VARCHAR(50)  NOT NULL,
    fech_registro   DATE         NOT NULL,
    gravedad        VARCHAR(30),
    descripcion     VARCHAR(500)
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
    id_enfermedad_act   SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    fecha_ini       DATE         NOT NULL,
    tiempo_enf      VARCHAR(100),
    descripcion     VARCHAR(500)
);


CREATE TABLE IF NOT EXISTS tratamiento (
    id_tratamiento  SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    id_personal     INT          NOT NULL,
    tipo            VARCHAR(50)  NOT NULL,
    fech_ini        DATE         NOT NULL,
    fecha_fin       DATE,
    descripc        VARCHAR(300),
    observaciones   VARCHAR(300)
);





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
    departamento INT          NOT NULL,
    especialidad INT          NOT NULL,
    dni            VARCHAR(20)  NOT NULL,
    nombres        VARCHAR(100) NOT NULL,
    apellidos      VARCHAR(100) NOT NULL,
    rol            VARCHAR(50)  NOT NULL,
    estado         VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS medicamento (
    id_medicamento  SERIAL PRIMARY KEY,
    nomb_gene       VARCHAR(200) NOT NULL,
    concentracion   VARCHAR(100) NOT NULL,
    presentacion    VARCHAR(100) NOT NULL,
    nomb_comercial  VARCHAR(200),
    grupo_atc       VARCHAR(100)
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


CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente   SERIAL PRIMARY KEY,
    dni           VARCHAR(8)  NOT NULL,
    nombres       VARCHAR(50) NOT NULL,
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
    nombre        VARCHAR(50) NOT NULL,
    direccion     VARCHAR(200) NOT NULL,
    nivel_atencion VARCHAR(50) NOT NULL,
    distrito      VARCHAR(100)
);


CREATE TABLE IF NOT EXISTS historia_clinica (
    id_historia    SERIAL PRIMARY KEY,
    id_centro      INT          NOT NULL,
    id_paciente    INT          NOT NULL,
    num_hc         VARCHAR(50)  NOT NULL,
    fech_apertura  DATE         NOT NULL,
    estado         VARCHAR(20),
    obser_general  VARCHAR(500)
);


CREATE TABLE IF NOT EXISTS consulta (
    id_consulta    SERIAL PRIMARY KEY,
    id_historia    INT          NOT NULL,
    id_personal    INT          NOT NULL,
    id_triaje      INT          NOT NULL,
   
    fecha          DATE         NOT NULL,
    hora           TIME         NOT NULL,
    tipo           VARCHAR(50)  NOT NULL,
    motivo         VARCHAR(500) NOT NULL,
    estado_paci    VARCHAR(50)  NOT NULL
);


CREATE TABLE IF NOT EXISTS examen_aux (
    id_examen       SERIAL PRIMARY KEY,
    id_consulta     INT          NOT NULL,
    id_personal     INT          NOT NULL,
   
    tipo            VARCHAR(50)  NOT NULL,
    nombre          VARCHAR(200) NOT NULL,
    fech_soli       DATE         NOT NULL,
    estado          VARCHAR(20)
);


CREATE TABLE IF NOT EXISTS prescripcion (
    id_prescripcion SERIAL PRIMARY KEY,
    id_tratamiento  INT          NOT NULL,
    id_medicamento  INT          NOT NULL,
    dosis           VARCHAR(100) NOT NULL,
    frecuencia      VARCHAR(100) NOT NULL,
    duracion_dias   INT          NOT NULL,
    via_admin       VARCHAR(50)
);



