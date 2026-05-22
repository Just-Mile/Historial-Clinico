INSERT INTO diagnostico (id_consulta, tipo, cod_cie10, fech_diagnostic, descripcion) VALUES
(1, 'definitivo', 'I10', '2026-04-01', 'Hipertensión esencial primaria'),
(2, 'presuntivo', 'J06', '2026-04-02', 'Infección aguda de las vías respiratorias superiores'),
(3, 'definitivo', 'E11', '2026-04-05', 'Diabetes mellitus tipo 2'),
(4, 'presuntivo', 'K37', '2026-04-08', 'Apendicitis no especificada'),
(5, 'definitivo', 'L50', '2026-04-10', 'Urticaria alérgica'),
(6, 'definitivo', 'I10', '2026-04-12', 'Hipertensión esencial primaria'),
(7, 'definitivo', 'J45', '2026-04-15', 'Asma'),
(8, 'presuntivo', 'J02', '2026-04-18', 'Faringitis aguda');


INSERT INTO enfermedad_actual (id_consulta, fecha_ini, tiempo_enf, descripcion) VALUES
(1, '2026-03-25', '7 días',  'Cefalea pulsátil bilateral de moderada intensidad'),
(2, '2026-03-30', '3 días',  'Fiebre de 38.5°C, tos seca y malestar general'),
(3, '2026-03-01', '1 mes',   'Hiperglucemia en controles domiciliarios'),
(4, '2026-04-08', '6 horas', 'Dolor abdominal en fosa iliaca derecha de inicio súbito'),
(5, '2026-04-07', '3 días',  'Erupciones pruriginosas en tronco y extremidades'),
(6, '2026-04-10', '2 días',  'Cefalea y visión borrosa por presión arterial elevada'),
(7, '2026-04-13', '2 días',  'Disnea de esfuerzo y sibilancias nocturnas'),
(8, '2026-04-16', '2 días',  'Odinofagia intensa, fiebre y dificultad para deglutir');


INSERT INTO tratamiento (id_consulta, id_personal, tipo, fech_ini, fecha_fin, descripc, observaciones) VALUES
(1, 1, 'farmacológico', '2026-04-01', '2026-04-30', 'Antihipertensivos y control de dieta',      'Control en 30 días'),
(2, 2, 'farmacológico', '2026-04-02', '2026-04-09', 'Antitérmicos y reposo',                     'Reevaluar en 7 días'),
(3, 1, 'farmacológico', '2026-04-05', '2026-05-05', 'Ajuste de dosis de metformina',             'Control glucémico mensual'),
(4, 4, 'quirúrgico',    '2026-04-08', '2026-04-15', 'Apendicectomía de urgencia',                'Hospitalización 7 días'),
(5, 2, 'farmacológico', '2026-04-10', '2026-04-17', 'Antihistamínicos orales',                   'Evitar alergenos'),
(6, 1, 'farmacológico', '2026-04-12', '2026-05-12', 'Ajuste de medicación antihipertensiva',     'Control en 30 días'),
(7, 3, 'farmacológico', '2026-04-15', '2026-04-29', 'Broncodilatadores y corticoides inhalados', 'Uso de inhalador de rescate'),
(8, 4, 'farmacológico', '2026-04-18', '2026-04-25', 'Antibióticos y antiinflamatorios',          'Control en 7 días');


INSERT INTO prescripcion (id_tratamiento, id_medicamento, dosis, frecuencia, duracion_dias, via_admin) VALUES
(1, 5, '10mg',  'cada 24 horas', 30, 'oral'),
(2, 1, '500mg', 'cada 8 horas',   7, 'oral'),
(3, 4, '850mg', 'cada 12 horas', 30, 'oral'),
(4, 6, '20mg',  'cada 24 horas',  7, 'oral'),
(5, 8, '10mg',  'cada 24 horas',  7, 'oral'),
(6, 5, '20mg',  'cada 24 horas', 30, 'oral'),
(7, 3, '400mg', 'cada 8 horas',   5, 'oral'),
(8, 7, '500mg', 'cada 24 horas',  5, 'oral');


INSERT INTO examen_aux (id_consulta, id_personal, tipo, nombre, fech_soli, estado) VALUES
(1, 5, 'laboratorio', 'Hemograma completo',   '2026-04-01', 'completado'),
(2, 5, 'laboratorio', 'PCR y hemograma',      '2026-04-02', 'completado'),
(3, 5, 'laboratorio', 'Glucosa en ayunas',    '2026-04-05', 'completado'),
(4, 5, 'imagen',      'Ecografía abdominal',  '2026-04-08', 'completado'),
(5, 5, 'laboratorio', 'IgE total',            '2026-04-10', 'completado'),
(6, 5, 'laboratorio', 'Perfil lipídico',      '2026-04-12', 'completado'),
(7, 5, 'imagen',      'Radiografía de tórax', '2026-04-15', 'completado'),
(8, 5, 'laboratorio', 'Cultivo faríngeo',     '2026-04-18', 'pendiente');


INSERT INTO result_exam (id_examen, tipo, nombre, fech_soli, fech_resultado, resultado, archivo_result) VALUES
(1, 'laboratorio', 'Hemograma completo',   '2026-04-01', '2026-04-02', 'Normal',                     'hemograma_001.pdf'),
(2, 'laboratorio', 'PCR y hemograma',      '2026-04-02', '2026-04-03', 'PCR elevada: 45 mg/L',       'pcr_002.pdf'),
(3, 'laboratorio', 'Glucosa en ayunas',    '2026-04-05', '2026-04-06', '185 mg/dL - elevada',        'glucosa_003.pdf'),
(4, 'imagen',      'Ecografía abdominal',  '2026-04-08', '2026-04-08', 'Signos de apendicitis',      'eco_abd_004.pdf'),
(5, 'laboratorio', 'IgE total',            '2026-04-10', '2026-04-11', 'IgE: 320 UI/mL - elevada',   'ige_005.pdf'),
(6, 'laboratorio', 'Perfil lipídico',      '2026-04-12', '2026-04-13', 'Colesterol total: 240 mg/dL','lipidico_006.pdf'),
(7, 'imagen',      'Radiografía de tórax', '2026-04-15', '2026-04-15', 'Hiperinsuflación pulmonar',  'rx_torax_007.pdf'),
(8, 'laboratorio', 'Cultivo faríngeo',     '2026-04-18', NULL,          NULL,                         NULL);


INSERT INTO rol (nomb_rol, descripcion, permisos) VALUES
('administrador', 'Acceso total al sistema',             'crear,leer,actualizar,eliminar'),
('médico',        'Atención y registro de consultas',    'leer,actualizar,crear'),
('enfermero',     'Registro de signos vitales y triage', 'leer,crear'),
('técnico',       'Apoyo en exámenes auxiliares',        'leer,crear'),
('recepcionista', 'Gestión de citas y pacientes',        'leer,crear,actualizar'),
('auditor',       'Revisión de registros del sistema',   'leer'),
('farmacéutico',  'Gestión de medicamentos y recetas',   'leer,actualizar'),
('director',      'Supervisión general del centro',      'leer,crear,actualizar,eliminar');

INSERT INTO medicamento (nomb_gene, nomb_comercial, concentracion, presentacion, grupo_alc) VALUES
('paracetamol',  'Panadol',     '500mg',  'tableta', 'analgésico'),
('amoxicilina',  'Amoxil',      '500mg',  'cápsula', 'antibiótico'),
('ibuprofeno',   'Advil',       '400mg',  'tableta', 'antiinflamatorio'),
('metformina',   'Glucophage',  '850mg',  'tableta', 'antidiabético'),
('enalapril',    'Renitec',     '10mg',   'tableta', 'antihipertensivo'),
('omeprazol',    'Prilosec',    '20mg',   'cápsula', 'gastroprotector'),
('azitromicina', 'Zithromax',   '500mg',  'tableta', 'antibiótico'),
('loratadina',   'Claritin',    '10mg',   'tableta', 'antihistamínico');


INSERT INTO centro_salud (nombre, direccion, nivel_atencion, distrito) VALUES
('Hospital Nacional Dos de Mayo',   'Av. Grau 13, Cercado de Lima',      'III', 'Cercado de Lima'),
('Clínica San Pablo',               'Av. Javier Prado 1020, San Borja',  'II',  'San Borja'),
('Posta Médica Villa María',        'Jr. Los Rosales 234, Villa María',  'I',   'Villa María del Triunfo'),
('Hospital Edgardo Rebagliati',     'Av. Rebagliati 490, Jesús María',   'III', 'Jesús María'),
('Centro de Salud San Juan',        'Jr. Huáscar 100, San Juan',         'I',   'San Juan de Lurigancho'),
('Clínica Ricardo Palma',           'Av. Javier Prado 1066, San Isidro', 'II',  'San Isidro'),
('Hospital María Auxiliadora',      'Av. Miguel Iglesias 968, SJM',      'III', 'San Juan de Miraflores'),
('Posta Médica Los Olivos',         'Av. Antúnez de Mayolo 800',         'I',   'Los Olivos');
 

INSERT INTO personal_salud (id_departamento, id_especialidad, dni, nombres, apellidos, rol, estado) VALUES
(1, 1, '45123678', 'Carlos',  'Mendoza Ríos',    'médico',    'activo'),
(1, 2, '32456789', 'Ana',     'Torres Vega',     'médico',    'activo'),
(2, 3, '56789012', 'Luis',    'García Paredes',  'enfermero', 'activo'),
(2, 1, '67890123', 'María',   'Chávez Luna',     'médico',    'activo'),
(3, 4, '78901234', 'Jorge',   'Quispe Mamani',   'técnico',   'activo'),
(1, 2, '89012345', 'Rosa',    'Flores Castillo', 'médico',    'inactivo'),
(3, 3, '90123456', 'Pedro',   'Vargas Huanca',   'enfermero', 'activo'),
(2, 5, '01234567', 'Lucía',   'Ramírez Soto',    'técnico',   'activo');
 

INSERT INTO pacientes (id_ubigeo, dni, nombres, apellidos, fecha_nac, sexo, grupo_sang, telefono, direccion, email) VALUES
(1, '72345678', 'Juan',   'Pérez López',    '1990-03-15', 'M', 'O+',  '987654321', 'Av. Lima 123',     'juan.perez@gmail.com'),
(2, '83456789', 'María',  'García Torres',  '1985-07-22', 'F', 'A+',  '976543210', 'Jr. Cusco 456',    'maria.garcia@gmail.com'),
(3, '94567890', 'Carlos', 'Ramos Huanca',   '2000-11-05', 'M', 'B+',  '965432109', 'Av. Arequipa 789', 'carlos.ramos@gmail.com'),
(1, '05678901', 'Lucía',  'Flores Mamani',  '1978-01-30', 'F', 'AB+', '954321098', 'Jr. Puno 321',     'lucia.flores@gmail.com'),
(2, '16789012', 'Pedro',  'Vargas Quispe',  '1995-06-18', 'M', 'O-',  '943210987', 'Av. Tacna 654',    'pedro.vargas@gmail.com'),
(3, '27890123', 'Rosa',   'Mendoza Chávez', '1968-09-25', 'F', 'A-',  '932109876', 'Jr. Moquegua 987', 'rosa.mendoza@gmail.com'),
(1, '38901234', 'Jorge',  'Castillo Soto',  '1988-04-12', 'M', 'B-',  '921098765', 'Av. Ayacucho 147', 'jorge.castillo@gmail.com'),
(2, '49012345', 'Ana',    'Ríos Paredes',   '2002-12-08', 'F', 'O+',  '910987654', 'Jr. Junín 258',    'ana.rios@gmail.com');
 

INSERT INTO usuario_sist (id_personal, username, password, ult_acceso, estado) VALUES
(1, 'cmendoza',  'hashed_pass_1', '2026-05-01 08:30:00', 'activo'),
(2, 'atorres',   'hashed_pass_2', '2026-05-10 09:00:00', 'activo'),
(3, 'lgarcia',   'hashed_pass_3', '2026-04-20 07:45:00', 'activo'),
(4, 'mchavez',   'hashed_pass_4', '2026-05-15 10:00:00', 'activo'),
(5, 'jquispe', 'hashed_pass_5', '2026-03-30 08:00:00', 'inactivo'),
(6, 'rflores', 'hashed_pass_6', NULL, 'inactivo'),
(7, 'pvargas', 'hashed_pass_7', '2026-05-18 11:00:00', 'activo'),
(8, 'lramirez', 'hashed_pass_8', '2026-05-17 14:30:00', 'activo');


INSERT INTO usuario_rol (id_usuario, id_rol, fecha_asig) VALUES
(1, 2, '2024-01-10'),
(2, 2, '2024-01-15'),
(3, 3, '2024-02-01'),
(4, 2, '2024-02-10'),
(5, 4, '2024-03-05'),
(6, 2, '2024-03-20'),
(7, 3, '2024-04-01'),
(8, 4, '2024-04-15');
 

INSERT INTO historia_clinica (id_paciente, num_hc, fech_apertura, estado, obser_general) VALUES
(1, 'HC-2024-001', '2024-01-10', 'activo', 'Paciente con hipertensión controlada'),
(2, 'HC-2024-002', '2024-01-15', 'activo', 'Sin antecedentes relevantes'),
(3, 'HC-2024-003', '2024-02-01', 'activo', 'Paciente diabético tipo 2'),
(4, 'HC-2024-004', '2024-02-10', 'activo', 'Antecedente quirúrgico: apendicectomía'),
(5, 'HC-2024-005', '2024-03-05', 'activo', 'Alergia a penicilina'),
(6, 'HC-2024-006', '2024-03-20', 'inactivo', 'Historia cerrada por traslado'),
(7, 'HC-2024-007', '2024-04-01', 'activo', 'Paciente con asma leve'),
(8, 'HC-2024-008', '2024-04-15', 'activo', 'Sin observaciones');
 

INSERT INTO consulta (id_historia, id_personal, fecha, hora, tipo, motivo, estado_paci, pre_registro_triage) VALUES
(1, 1, '2026-04-01', '08:00', 'externa', 'Dolor de cabeza frecuente', 'estable', 'realizado'),
(2, 2, '2026-04-02', '09:30', 'externa', 'Fiebre y tos hace 3 días', 'estable', 'realizado'),
(3, 1, '2026-04-05', '10:00', 'control', 'Control de glucosa mensual', 'estable', 'realizado'),
(4, 4, '2026-04-08', '11:00', 'emergencia', 'Dolor abdominal agudo', 'delicado', 'realizado'),
(5, 2, '2026-04-10', '08:30', 'externa', 'Erupciones en la piel', 'estable', 'realizado'),
(6, 1, '2026-04-12', '09:00', 'control', 'Control de presión arterial', 'estable', 'realizado'),
(7, 3, '2026-04-15', '10:30', 'externa', 'Dificultad para respirar', 'estable', 'realizado'),
(8, 4, '2026-04-18', '11:30', 'externa', 'Dolor de garganta y fiebre', 'estable', 'realizado');
 

INSERT INTO triaje (id_consulta, peso_kg, talla_cm, fech_hora_toma, presi_art_si, presi_art_di, rpm, lpm, temp, spo2) VALUES
(1, 72.5, 170.0, '2026-04-01 07:50:00', 130, 85, 18, 78, 36.8, 98),
(2, 58.0, 162.0, '2026-04-02 09:20:00', 110, 70, 20, 88, 38.5, 97),
(3, 85.0, 168.0, '2026-04-05 09:50:00', 120, 80, 17, 75, 36.6, 99),
(4, 65.0, 155.0, '2026-04-08 10:50:00', 100, 65, 22, 95, 37.2, 96),
(5, 70.0, 175.0, '2026-04-10 08:20:00', 115, 75, 18, 80, 36.9, 98),
(6, 90.0, 172.0, '2026-04-12 08:50:00', 145, 95, 19, 82, 36.7, 97),
(7, 55.0, 158.0, '2026-04-15 10:20:00', 105, 68, 24, 92, 37.0, 94),
(8, 68.0, 165.0, '2026-04-18 11:20:00', 118, 76, 19, 84, 38.1, 98);
 

INSERT INTO func_bio (id_consulta, apetito, sed, sueno, deposicion, obser_adi, actv_sexual) VALUES
(1, 'normal', 'normal', 'regular', 'normal', 'Refiere estrés laboral', 'activa'),
(2, 'disminuido', 'aumentada', 'irregular', 'normal', 'Fiebre desde hace 3 días', 'no refiere'),
(3, 'normal', 'aumentada', 'normal', 'normal', 'Dieta controlada en azúcares', 'activa'),
(4, 'ausente', 'normal', 'irregular', 'estreñimiento','Dolor intenso en fosa iliaca', 'no refiere'),
(5, 'normal', 'normal', 'normal', 'normal', 'Alergia a alimentos no definida', 'activa'),
(6, 'normal', 'normal', 'regular', 'normal', 'Medicación antihipertensiva', 'activa'),
(7, 'disminuido', 'normal', 'irregular', 'normal', 'Usa inhalador ocasionalmente', 'no refiere'),
(8, 'disminuido', 'aumentada', 'irregular', 'normal', 'Odinofagia intensa', 'no refiere');
 

INSERT INTO antecedente (id_antecedente2, id_consulta, tipo, fech_registro, gravedad, descripcion) VALUES
(NULL, 1, 'patologico', '2026-04-01', 'leve', 'Hipertensión arterial diagnosticada en 2020'),
(NULL, 2, 'familiar', '2026-04-02', 'moderada', 'Padre con diabetes tipo 2'),
(NULL, 3, 'patologico', '2026-04-05', 'moderada', 'Diabetes mellitus tipo 2 desde 2018'),
(NULL, 4, 'quirurgico', '2026-04-08', 'grave', 'Apendicectomía en 2015'),
(NULL, 5, 'patologico', '2026-04-10', 'leve', 'Rinitis alérgica crónica'),
(NULL, 6, 'habito', '2026-04-12', 'moderada', 'Fumador 10 cigarrillos/día por 15 años'),
(NULL, 7, 'patologico', '2026-04-15', 'leve', 'Asma bronquial desde la infancia'),
(NULL, 8, 'familiar', '2026-04-18', 'leve', 'Madre con hipotiroidismo');

 
