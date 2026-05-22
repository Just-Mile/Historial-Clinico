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
 
