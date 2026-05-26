UPDATE triaje
SET peso_kg = 75.0, temp = 37.5
WHERE id_consulta = 2;

UPDATE triaje
SET presi_art_si = 120, presi_art_di = 80
WHERE id_consulta = 6;

UPDATE centro_salud
SET nivel_atencion = 'III'
WHERE nombre = 'Clínica San Pablo';

UPDATE diagnostico
SET tipo = 'definitivo',
    descripcion = 'Infección aguda de vías respiratorias superiores confirmada'
WHERE id_diagnostico = 2;
UPDATE diagnostico
SET cod_cie10 = 'K35',
    descripcion = 'Apendicitis aguda con peritonitis'
WHERE id_diagnostico = 4;

UPDATE enfermedad_actual
SET tiempo_enf = '10 días',
    descripcion = 'Cefalea pulsátil bilateral intensa, no cede con analgésicos comunes'
WHERE id_enfermedad = 1;

UPDATE tratamiento
SET tipo = 'quirúrgico',
    descripc = 'Apendicectomía laparoscópica de urgencia',
    observaciones = 'Hospitalización mínima 5 días post operatorio'
WHERE id_tratamiento = 4;

UPDATE prescripcion
SET dosis = '20mg',
    frecuencia = 'cada 12 horas'
WHERE id_prescripcion = 3;
 
UPDATE prescripcion
SET via_admin = 'intravenosa',
    dosis = '1g'
WHERE id_prescripcion = 8;


UPDATE examen_aux
SET estado = 'completado'
WHERE id_examen = 8;

UPDATE examen_aux
SET tipo = 'laboratorio',
    nombre = 'Hemocultivo'
WHERE id_examen = 4;
 
UPDATE result_exam
SET fech_resultado = '2026-04-20',
    resultado = 'Streptococcus pyogenes positivo',
    archivo_result = 'cultivo_008.pdf'
WHERE id_resultado = 8;
 
UPDATE medicamento
SET nomb_gene = 'Dextametazona',
    nomb_comercial = 'Dextrilo'
WHERE nomb_comercial = 'Zithromax';

UPDATE rol
SET nomb_rol = 'administrador',
    descripcion = 'Acceso total al sistema'
WHERE nomb_rol = 'médico';

UPDATE pacientes
SET direccion='Jiron las Condes 6767', telefono='999967769'
WHERE apellidos='Vargas Quispe';
