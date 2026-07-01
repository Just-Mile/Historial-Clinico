-- 1. centro_salud

INSERT INTO centro_salud (nombre, direccion, nivel_atencion, distrito)
VALUES
    ('C.S. Maritza Campos Díaz',          'Av. Aviación s/n, Zamácola',              'I',   'Cerro Colorado'),
    ('C.S. Ciudad de Dios',               'Urb. Ciudad de Dios s/n',                 'I',   'Cerro Colorado'),
    ('C.S. Alto Selva Alegre',            'Av. Los Ángeles 101',                     'I',   'Alto Selva Alegre'),
    ('Hospital III Yanahuara',            'Av. Emmel 218, Yanahuara',                'III', 'Yanahuara'),
    ('C.S. Hunter',                       'Av. Jesús s/n, Hunter',                   'I',   'Jacobo Hunter'),
    ('C.S. Tiabaya',                      'Calle Bolívar 120, Tiabaya',              'I',   'Tiabaya'),
    ('Hospital Goyeneche',                'Av. Goyeneche s/n',                       'II',  'Arequipa'),
    ('C.S. Paucarpata',                   'Av. Kennedy 300, Paucarpata',             'I',   'Paucarpata'),
    ('C.S. Miraflores',                   'Av. Venezuela 150, Miraflores',           'I',   'Miraflores'),
    ('Hospital Regional Honorio Delgado', 'Av. Daniel Alcides Carrión s/n',          'III', 'Arequipa');



-- 2. pacientes (1000)

INSERT INTO pacientes (dni, nombres, apellidos, fecha_nac, sexo, grupo_sang, telefono, direccion, email)
SELECT
    LPAD(i::text, 8, '0'),
    (ARRAY['Carlos','María','Juan','Ana','Luis','Rosa','Pedro','Carmen',
           'Jorge','Elena','Miguel','Patricia','Andrés','Lucía','Roberto'])[((i-1) % 15) + 1],
    'Apellido_' || i,
    '1960-01-01'::date + ((i * 13) % 18000),
    CASE WHEN i % 2 = 0 THEN 'M' ELSE 'F' END,
    (ARRAY['A+','A-','B+','B-','AB+','AB-','O+','O-'])[((i-1) % 8) + 1],
    '9' || LPAD(i::text, 8, '0'),
    'Calle ' || i || ' Nro. ' || (i % 999 + 1),
    'paciente' || i || '@email.com'
FROM generate_series(1, 1000) AS i;


-- 3. personal_salud (70)

INSERT INTO personal_salud (departamento, especialidad, dni, nombres, apellidos, rol, estado)
SELECT
    ((i-1) % 10) + 1,
    ((i-1) % 20) + 1,
    '7' || LPAD(i::text, 7, '0'),
    (ARRAY['Carlos','Ana','Luis','Rosa','Juan',
           'María','Pedro','Elena','Jorge','Lucía'])[((i-1) % 10) + 1],
    'Personal_' || i,
    (ARRAY['medico','enfermero','tecnico'])[((i-1) % 3) + 1],
    CASE WHEN i % 8 = 0 THEN 'inactivo' ELSE 'activo' END
FROM generate_series(1, 70) AS i;


-- 4. medicamento (200)

INSERT INTO medicamento (nomb_gene, concentracion, presentacion, nomb_comercial, grupo_atc)
SELECT
    (ARRAY['Paracetamol','Ibuprofeno','Amoxicilina','Metformina','Atorvastatina',
           'Omeprazol','Losartán','Amlodipino','Metoprolol','Ciprofloxacino',
           'Azitromicina','Diclofenaco','Prednisona','Salbutamol','Furosemida'])[((i-1) % 15) + 1]
    || ' ' || i,
    (ARRAY['500mg','250mg','100mg','20mg','40mg','10mg','5mg','1g','200mg','400mg'])[((i-1) % 10) + 1],
    (ARRAY['Tableta','Cápsula','Jarabe','Inyectable','Suspensión','Crema','Gel','Supositorio'])[((i-1) % 8) + 1],
    'Marca_' || i,
    (ARRAY['A01','A02','A03','B01','C01','C02','J01','M01','N02','R03'])[((i-1) % 10) + 1]
FROM generate_series(1, 200) AS i;


-- 5. rol (10)

INSERT INTO rol (nomb_rol, descripcion, permisos)
VALUES
    ('Administrador',   'Gestión total del sistema',                    'lectura,escritura,eliminacion'),
    ('Médico',          'Atención y diagnóstico de pacientes',          'lectura,escritura'),
    ('Enfermero',       'Cuidado y seguimiento de pacientes',           'lectura,escritura'),
    ('Técnico',         'Apoyo en procedimientos técnicos',             'lectura,escritura'),
    ('Auditor',         'Revisión y control de registros',              'solo_lectura'),
    ('Recepcionista',   'Registro y admisión de pacientes',             'lectura,escritura'),
    ('Farmacéutico',    'Gestión de medicamentos y prescripciones',     'lectura,escritura'),
    ('Laboratorista',   'Procesamiento de exámenes auxiliares',         'lectura,escritura'),
    ('Radiólogo',       'Interpretación de imágenes diagnósticas',      'lectura,escritura'),
    ('Supervisor',      'Supervisión del personal y procesos',          'lectura,escritura,eliminacion');





-- 6. triaje (1000 — uno por consulta/paciente)
INSERT INTO triaje (fecha, peso_kg, talla_cm, fech_hora_toma,
                    presi_art_si, presi_art_di, rpm, lpm, temp, spo2)
SELECT
    '2023-01-01'::date + ((i * 7) % 730),
    50.0 + (i % 60),
    150.0 + (i % 40),
    ('2023-01-01 08:00:00'::timestamp + ((i * 3600) || ' seconds')::interval),
    110 + (i % 50),        -- sistólica: 110–159
    60  + (i % 30),        -- diastólica: 60–89 (siempre < sistólica)
    14  + (i % 6),
    60  + (i % 40),
    36.0 + (i % 20) * 0.1,
    90  + (i % 10)
FROM generate_series(1, 1000) AS i;



-- 7. historia_clinica (1000 — una por paciente)

INSERT INTO historia_clinica (id_centro, id_paciente, num_hc, fech_apertura, estado, obser_general)
SELECT
    ((i-1) % 10) + 1,
    i,
    'HC-' || LPAD(i::text, 6, '0'),
    '2020-01-01'::date + ((i * 5) % 1460),
    (ARRAY['activo','inactivo','archivado'])[((i-1) % 3) + 1],
    'Observación general del paciente ' || i
FROM generate_series(1, 1000) AS i;


-- 8. usuario_sist (70 — uno por personal)

INSERT INTO usuario_sist (id_personal, username, password, ult_acceso, estado)
SELECT
    i,
    'user_' || i,
    md5('password_' || i),
    '2024-01-01 00:00:00'::timestamp + ((i * 3600) || ' seconds')::interval,
    CASE WHEN i % 8 = 0 THEN 'inactivo' ELSE 'activo' END
FROM generate_series(1, 70) AS i;



-- 9. usuario_rol (70 — uno por usuario, rota entre 10 roles)

INSERT INTO usuario_rol (id_usuario, id_rol, fecha_asig)
SELECT
    i,
    ((i-1) % 10) + 1,
    '2023-01-01'::date + ((i * 3) % 730)
FROM generate_series(1, 70) AS i;



-- 10. consulta (1000)

INSERT INTO consulta (id_historia, id_personal, id_triaje, fecha, hora, tipo, motivo, estado_paci)
SELECT
    i,
    ((i-1) % 70) + 1,
    i,
    '2023-01-01'::date + ((i * 7) % 730),
    (TIME '08:00:00' + ((i % 10) || ' hours')::interval),
    (ARRAY['emergencia','consulta externa','hospitalización','teleconsulta'])[((i-1) % 4) + 1],
    'Motivo de consulta número ' || i,
    (ARRAY['estable','crítico','en observación','de alta','referido'])[((i-1) % 5) + 1]
FROM generate_series(1, 1000) AS i;


-- 11. antecedente (1000 — rota entre 1000 historias)

INSERT INTO antecedente (id_historia, tipo, fech_registro, gravedad, descripcion)
SELECT
    ((i-1) % 1000) + 1,
    (ARRAY['patológico','quirúrgico','familiar','alérgico','traumático',
           'farmacológico','ginecológico','obstétrico','perinatal','psiquiátrico'])[((i-1) % 10) + 1],
    '2018-01-01'::date + ((i * 11) % 1825),
    (ARRAY['leve','moderada','grave'])[((i-1) % 3) + 1],
    'Descripción del antecedente ' || i
FROM generate_series(1, 1000) AS i;




-- 12. diagnostico (1000 — uno por consulta)

INSERT INTO diagnostico (id_consulta, tipo, fech_diagnostic, cod_cie10, descripcion)
SELECT
    i,
    (ARRAY['definitivo','presuntivo','diferencial','secundario'])[((i-1) % 4) + 1],
    '2023-01-01'::date + ((i * 7) % 730),
    (ARRAY['J00','J06','A09','K29','I10','E11','J18','N39','M54','F32',
           'K59','I25','E78','J45','R05'])[((i-1) % 15) + 1],
    'Descripción del diagnóstico ' || i
FROM generate_series(1, 1000) AS i;


-- 13. enfermedad_actual (1000 — una por consulta)

INSERT INTO enfermedad_actual (id_consulta, fecha_ini, tiempo_enf, descripcion)
SELECT
    i,
    '2023-01-01'::date + ((i * 7) % 730) - (i % 30),
    (ARRAY['1 día','3 días','1 semana','2 semanas','1 mes','3 meses','6 meses','1 año'])[((i-1) % 8) + 1],
    'Descripción de la enfermedad actual del caso ' || i
FROM generate_series(1, 1000) AS i;



-- 14. func_bio (1000 — una por consulta, relación UNIQUE)

INSERT INTO func_bio (id_consulta, apetito, sed, sueno, deposicion, obser_adi, actv_sexual)
SELECT
    i,
    (ARRAY['conservado','disminuido','aumentado','ausente'])[((i-1) % 4) + 1],
    (ARRAY['normal','aumentada','disminuida','ausente'])[((i-1) % 4) + 1],
    (ARRAY['conservado','insomnio','hipersomnia','irregular'])[((i-1) % 4) + 1],
    (ARRAY['normal','estreñimiento','diarrea','ausente'])[((i-1) % 4) + 1],
    'Observaciones adicionales funciones biológicas ' || i,
    CASE WHEN i % 2 = 0 THEN 'activa' ELSE 'no refiere' END
FROM generate_series(1, 1000) AS i;






-- 15. tratamiento (1000 — uno por consulta)

INSERT INTO tratamiento (id_consulta, id_personal, tipo, fech_ini, fecha_fin, descripc, observaciones)
SELECT
    i,
    ((i-1) % 70) + 1,
    CASE WHEN i % 2 = 0 THEN 'farmacologico' ELSE 'quirurgico' END,
    '2023-01-01'::date + ((i * 7) % 730),
    '2023-01-01'::date + ((i * 7) % 730) + (i % 30) + 1,
    'Descripción del tratamiento ' || i,
    'Observaciones del tratamiento ' || i
FROM generate_series(1, 1000) AS i;



-- 16. examen_aux (1000 — uno por consulta)

INSERT INTO examen_aux (id_consulta, id_personal, tipo, nombre, fech_soli, estado)
SELECT
    i,
    ((i-1) % 70) + 1,
    (ARRAY['laboratorio','imagen','anatomia patologica','microbiologia','genetico'])[((i-1) % 5) + 1],
    (ARRAY['Hemograma completo','Glucosa','Perfil lipídico','Radiografía tórax','Ecografía abdominal',
           'Urocultivo','Biopsia','PCR','Tomografía','Electrocardiograma'])[((i-1) % 10) + 1]
    || ' ' || i,
    '2023-01-01'::date + ((i * 7) % 730),
    (ARRAY['pendiente','en proceso','completado','cancelado'])[((i-1) % 4) + 1]
FROM generate_series(1, 1000) AS i;



-- 17. result_exam (1000 — uno por examen, relación UNIQUE)

INSERT INTO result_exam (id_examen, tipo, nombre, fech_soli, fech_resultado, resultado, archivo_result)
SELECT
    i,
    (ARRAY['laboratorio','imagen','anatomia patologica','microbiologia','genetico'])[((i-1) % 5) + 1],
    'Resultado examen ' || i,
    '2023-01-01'::date + ((i * 7) % 730),
    '2023-01-01'::date + ((i * 7) % 730) + (i % 7) + 1,
    'Valores dentro del rango normal. Resultado ' || i,
    '/resultados/examen_' || i || '.pdf'
FROM generate_series(1, 1000) AS i;



-- 18. prescripcion (1000 — una por tratamiento)

INSERT INTO prescripcion (id_tratamiento, id_medicamento, dosis, frecuencia, duracion_dias, via_admin)
SELECT
    i,
    ((i-1) % 200) + 1,
    (ARRAY['1 tableta','2 tabletas','5ml','10ml','1 ampolla','1 cápsula','500mg','250mg'])[((i-1) % 8) + 1],
    (ARRAY['cada 8 horas','cada 12 horas','cada 24 horas','cada 6 horas','una vez al día','dos veces al día'])[((i-1) % 6) + 1],
    (ARRAY[3,5,7,10,14,21,30])[((i-1) % 7) + 1],
    (ARRAY['oral','intravenosa','intramuscular','subcutánea','tópica','inhalatoria','sublingual'])[((i-1) % 7) + 1]
FROM generate_series(1, 1000) AS i;

