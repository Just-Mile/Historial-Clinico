-- GESTIÓN DE TRANSACCIONES — Registro de Consulta Completa
-- Proceso crítico: triaje + consulta + diagnóstico + tratamiento

BEGIN;

    -- PASO 1: Registrar el triaje del paciente
    INSERT INTO triaje (
        id_paciente, fecha, peso_kg, talla_cm,
        fech_hora_toma, presi_art_si, presi_art_di,
        rpm, lpm, temp, spo2
    ) VALUES (
        1, CURRENT_DATE, 68.5, 165.0,
        NOW(), 120, 80,
        18, 76, 36.7, 98
    );

    -- PASO 2: Registrar la consulta usando el triaje recién creado
    -- currval obtiene el último id generado por la secuencia de triaje
    INSERT INTO consulta (
        id_historia, id_personal, id_triaje,
        fecha, hora, tipo, motivo, estado_paci
    ) VALUES (
        1, 1, currval('triaje_id_triaje_seq'),
        CURRENT_DATE, '09:00', 'externa',
        'Paciente refiere dolor de cabeza frecuente y mareos',
        'estable'
    );

    -- PASO 3: Registrar el diagnóstico de la consulta
    INSERT INTO diagnostico (
        id_consulta, tipo, fech_diagnostic,
        cod_cie10, descripcion
    ) VALUES (
        currval('consulta_id_consulta_seq'),
        'presuntivo', CURRENT_DATE,
        'R51', 'Cefalea no especificada'
    );

    -- PASO 4: Registrar el tratamiento indicado
    INSERT INTO tratamiento (
        id_consulta, id_personal, tipo,
        fech_ini, fecha_fin, descripc, observaciones
    ) VALUES (
        currval('consulta_id_consulta_seq'),
        1, 'farmacológico',
        CURRENT_DATE, CURRENT_DATE + INTERVAL '7 days',
        'Analgésicos y reposo relativo',
        'Control en 7 días si persisten los síntomas'
    );

COMMIT;

-- ============================================================
-- Ejecutar este bloque en caso de error en lugar del COMMIT
-- ============================================================

-- ROLLBACK;

-- VERIFICACIÓN

SELECT
    t.id_triaje,
    t.peso_kg,
    t.temp,
    c.id_consulta,
    c.motivo,
    c.estado_paci,
    d.cod_cie10,
    d.descripcion AS diagnostico,
    tr.tipo AS tipo_tratamiento,
    tr.descripc AS tratamiento
FROM triaje t
JOIN consulta c ON c.id_triaje = t.id_triaje
JOIN diagnostico d ON d.id_consulta = c.id_consulta
JOIN tratamiento tr ON tr.id_consulta = c.id_consulta
WHERE t.id_paciente = 1
ORDER BY t.id_triaje DESC;
