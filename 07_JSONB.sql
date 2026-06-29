ALTER TABLE result_exam ADD COLUMN IF NOT EXISTS resultado_detalle JSONB;
	-- Laboratorio
UPDATE result_exam r
SET resultado_detalle = '{"hemoglobina": "14.2 g/dL", "leucocitos": "7500/mm3", "plaquetas": "250000/mm3", "glucosa": "95 mg/dL"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'laboratorio';

-- Imagen
UPDATE result_exam r
SET resultado_detalle = '{"hallazgo": "Sin consolidaciones", "indice_cardiotoracico": "0.45", "tecnica": "PA y lateral"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'imagen';

-- Anatomía patológica
UPDATE result_exam r
SET resultado_detalle = '{"tipo_tejido": "epitelial", "celulas_atipicas": false, "diagnostico_histologico": "tejido benigno"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'anatomía patológica';

-- Microbiología
UPDATE result_exam r
SET resultado_detalle = '{"microorganismo": "Escherichia coli", "sensibilidad": ["ampicilina", "ciprofloxacino"], "ufc": "100000/mL"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'microbiología';

-- Genético
UPDATE result_exam r
SET resultado_detalle = '{"gen_analizado": "BRCA1", "mutacion_detectada": false, "metodo": "secuenciación"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'genético';

-- Imagen (ecografía abdominal)
UPDATE result_exam r
SET resultado_detalle = '{"hallazgo": "Hígado de tamaño normal", "vesicula": "sin infección", "tecnica": "ecografía convexa"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'imagen' AND r.id_resultado % 5 = 0;
-- Genétic distinta
UPDATE result_exam r
SET resultado_detalle = '{"muestra": "tejido", "resultado": "positivo", "metodo": "analisis extendido"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'genético' AND r.id_resultado % 6 = 0;
