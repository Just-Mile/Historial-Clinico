ALTER TABLE result_exam ADD COLUMN IF NOT EXISTS resultado_detalle JSONB;

UPDATE result_exam r
SET resultado_detalle = '{"hemoglobina": "14.2 g/dL", "leucocitos": "7500/mm3", "plaquetas": "250000/mm3", "glucosa": "95 mg/dL"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'laboratorio';

UPDATE result_exam r
SET resultado_detalle = '{"hallazgo": "Sin consolidaciones", "indice_cardiotoracico": "0.45", "tecnica": "PA y lateral"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'imagen';

UPDATE result_exam r
SET resultado_detalle = '{"tipo_tejido": "epitelial", "celulas_atipicas": false, "diagnostico_histologico": "tejido benigno"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'anatomia patologica';

UPDATE result_exam r
SET resultado_detalle = '{"microorganismo": "Escherichia coli", "sensibilidad": ["ampicilina", "ciprofloxacino"], "ufc": "100000/mL"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'microbiologia';

UPDATE result_exam r
SET resultado_detalle = '{"gen_analizado": "BRCA1", "mutacion_detectada": false, "metodo": "secuenciacion"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'genetico';

UPDATE result_exam r
SET resultado_detalle = '{"hallazgo": "Higado de tamano normal", "vesicula": "sin infeccion", "tecnica": "ecografia convexa"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'imagen' AND r.id_resultado % 5 = 0;

UPDATE result_exam r
SET resultado_detalle = '{"muestra": "tejido", "resultado": "positivo", "metodo": "analisis extendido"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'genetico' AND r.id_resultado % 6 = 0;

UPDATE result_exam r
SET resultado_detalle = '{"tipo_tejido": "epitelial", "anomalia": true, "descripcion": "requiere revision adicional"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'anatomia patologica' AND r.id_resultado % 6 = 0;

UPDATE result_exam r
SET resultado_detalle = '{"valor_1": "12.5", "valor_2": "8300", "valor_3": "190000", "observacion": "dentro de rangos"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'laboratorio' AND r.id_resultado % 4 = 0;

UPDATE result_exam r
SET resultado_detalle = '{"valor_1": "6.3", "valor_2": "12000", "valor_3": "89000", "observacion": "urgente"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'laboratorio' AND r.id_resultado % 9 = 0;

UPDATE result_exam r
SET resultado_detalle = '{"muestra": "saliva", "resultado": "no concluyente", "metodo": "secuenciacion parcial"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'genetico' AND r.id_resultado % 7 = 0;

UPDATE result_exam r
SET resultado_detalle = '{"tipo_tejido": "oseo", "anomalia": false, "descripcion": "sin hallazgos relevantes"}'
FROM examen_aux e
WHERE r.id_examen = e.id_examen AND e.tipo = 'anatomia patologica' AND r.id_resultado % 7 = 0;
