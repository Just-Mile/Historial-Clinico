

INSERT INTO centro_salud (nombre, direccion, nivel_atencion, distrito) VALUES
('Hospital Nacional Dos de Mayo', 'Av. Miguel Grau 13, Lima', 'III', 'Lima'),
('Centro de Salud San Juan', 'Jr. Los Álamos 456, San Juan de Lurigancho', 'II', 'San Juan de Lurigancho'),
('Puesto de Salud Villa El Salvador', 'Av. Pachacútec 789, VES', 'I', 'Villa El Salvador');


INSERT INTO personal_salud (departamento, especialidad, dni, nombres, apellidos, rol, estado) VALUES
(1, 101, '12345678', 'Carlos', 'Gómez Pérez', 'medico', 'activo'),
(1, 102, '87654321', 'Ana', 'López Ríos', 'medico', 'activo'),
(2, 201, '11223344', 'María', 'Fernández Díaz', 'enfermero', 'activo'),
(3, 301, '44332211', 'José', 'Ramírez Soto', 'tecnico', 'inactivo');


INSERT INTO pacientes (dni, nombres, apellidos, fecha_nac, sexo, grupo_sang, telefono, direccion, email) VALUES
('71234567', 'Juan', 'Pereda Quispe', '1985-03-15', 'M', 'O+', '987654321', 'Av. Los Pinos 123', 'juan.pereda@mail.com'),
('72345678', 'María', 'Luna Torres', '1990-07-22', 'F', 'A-', '976543210', 'Calle Las Flores 456', 'maria.luna@mail.com'),
('73456789', 'Pedro', 'Rojas Silva', '1975-12-10', 'M', 'B+', '965432109', 'Jr. Libertad 789', NULL);


INSERT INTO rol (nomb_rol, descripcion, permisos) VALUES
('ADMIN', 'Administrador del sistema', 'todos'),
('MEDICO', 'Médico tratante', 'ver_historia, escribir_receta'),
('ENFERMERO', 'Personal de enfermería', 'ver_triaje, registrar_signos');


INSERT INTO medicamento (nomb_gene, concentracion, presentacion, nomb_comercial, grupo_atc) VALUES
('Paracetamol', '500 mg', 'Tableta', 'Panalgésico', 'N02BE01'),
('Ibuprofeno', '400 mg', 'Tableta', 'Ibupem', 'M01AE01'),
('Amoxicilina', '500 mg', 'Cápsula', 'Amoxidal', 'J01CA04'),
('Losartán', '50 mg', 'Tableta', 'Cozaar', 'C09CA01');


INSERT INTO triaje (fecha, peso_kg, talla_cm, fech_hora_toma, presi_art_si, presi_art_di, rpm, lpm, temp, spo2) VALUES
('2025-06-10', 75.5, 175.0, '2025-06-10 09:30:00', 120, 80, 18, 72, 36.5, 98),
('2025-06-10', 65.2, 160.5, '2025-06-10 10:15:00', 110, 70, 20, 80, 36.8, 97),
('2025-06-09', 82.0, 170.0, '2025-06-09 14:20:00', 130, 85, 16, 68, 37.0, 96);


INSERT INTO historia_clinica (id_centro, id_paciente, num_hc, fech_apertura, estado, obser_general) VALUES
(1, 1, 'HC-001', '2020-01-15', 'activa', 'Paciente con antecedentes de hipertensión'),
(1, 2, 'HC-002', '2021-03-20', 'activa', 'Alérgica a penicilina'),
(2, 3, 'HC-003', '2019-11-10', 'inactiva', NULL);


INSERT INTO usuario_sist (id_personal, username, password, ult_acceso, estado) VALUES
(1, 'cgomez', 'hash_123456', '2025-06-10 08:00:00', 'activo'),
(2, 'alopez', 'hash_abc123', '2025-06-09 17:30:00', 'activo'),
(3, 'mfernandez', 'hash_xyz789', NULL, 'activo');


INSERT INTO usuario_rol (id_usuario, id_rol, fecha_asig) VALUES
(1, 2, '2025-01-01'),  
(2, 2, '2025-01-10'),  
(3, 3, '2025-02-15'),  
(1, 1, '2025-03-01');  


INSERT INTO consulta (id_historia, id_personal, id_triaje, fecha, hora, tipo, motivo, estado_paci) VALUES
(1, 1, 1, '2025-06-10', '09:35:00', 'general', 'Dolor de cabeza y fiebre', 'estable'),
(2, 2, 2, '2025-06-10', '10:20:00', 'especializada', 'Control de diabetes', 'estable'),
(3, 1, 3, '2025-06-09', '14:30:00', 'urgencia', 'Dolor torácico', 'crítico');


INSERT INTO diagnostico (id_consulta, tipo, fech_diagnostic, cod_cie10, descripcion) VALUES
(1, 'principal', '2025-06-10', 'R51', 'Cefalea tensional'),
(2, 'secundario', '2025-06-10', 'E11.9', 'Diabetes mellitus tipo 2'),
(3, 'principal', '2025-06-09', 'I20.9', 'Angina inestable');


INSERT INTO enfermedad_actual (id_consulta, fecha_ini, tiempo_enf, descripcion) VALUES
(1, '2025-06-08', '2 días', 'Dolor frontal pulsátil, fotofobia'),
(2, '2015-01-01', '10 años', 'Paciente diabético en tratamiento con metformina'),
(3, '2025-06-09', '1 hora', 'Dolor retroesternal irradiado a brazo izquierdo');

INSERT INTO tratamiento (id_consulta, id_personal, tipo, fech_ini, fecha_fin, descripc, observaciones) VALUES
(1, 1, 'farmacologico', '2025-06-10', NULL, 'Paracetamol 500 mg cada 8h', 'Reposo relativo'),
(2, 2, 'farmacologico', '2025-06-10', NULL, 'Insulina NPH 10 UI noche', 'Control glucémico semanal'),
(3, 1, 'quirurgico', '2025-06-09', '2025-06-10', 'Cateterismo cardiaco', 'Paciente estable post-procedimiento');


INSERT INTO examen_aux (id_consulta, id_personal, tipo, nombre, fech_soli, estado) VALUES
(1, 1, 'laboratorio', 'Hemograma completo', '2025-06-10', 'solicitado'),
(2, 2, 'imagen', 'Ecografía abdominal', '2025-06-10', 'realizado'),
(3, 1, 'imagen', 'Radiografía de tórax', '2025-06-09', 'realizado');


INSERT INTO result_exam (id_examen, tipo, nombre, fech_soli, fech_resultado, resultado, archivo_result) VALUES
(2, 'imagen', 'Ecografía abdominal', '2025-06-10', '2025-06-10', 'Hígado graso grado I', '/resultados/eco_ab_2.pdf'),
(3, 'imagen', 'Radiografía de tórax', '2025-06-09', '2025-06-09', 'Cardiomegalia leve', '/resultados/rad_torax_3.jpg');


INSERT INTO prescripcion (id_tratamiento, id_medicamento, dosis, frecuencia, duracion_dias, via_admin) VALUES
(1, 1, '500 mg', 'cada 8 horas', 5, 'oral'),
(1, 2, '400 mg', 'cada 12 horas', 3, 'oral'),
(2, 4, '50 mg', 'cada 24 horas', 30, 'oral');


INSERT INTO func_bio (id_consulta, apetito, sed, sueno, deposicion, obser_adi, actv_sexual) VALUES
(1, 'disminuido', 'normal', 'insomnio', 'normal', 'Ninguna', 'no refiere'),
(2, 'aumentado', 'aumentada', 'normal', 'estreñimiento', 'Toma mucha agua', 'no refiere'),
(3, 'normal', 'normal', 'normal', 'normal', NULL, 'activa');


INSERT INTO antecedente (id_historia, tipo, fech_registro, gravedad, descripcion) VALUES
(1, 'patológico', '2020-01-15', 'moderada', 'Hipertensión arterial diagnosticada en 2015'),
(1, 'familiar', '2020-01-15', 'leve', 'Madre con diabetes tipo 2'),
(2, 'alérgico', '2021-03-20', 'grave', 'Shock anafiláctico a penicilina');
