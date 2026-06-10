

CREATE INDEX IF NOT EXISTS idx_consulta_id_historia      ON consulta(id_historia);


CREATE INDEX IF NOT EXISTS idx_historia_clinica_id_paciente ON historia_clinica(id_paciente);


CREATE INDEX IF NOT EXISTS idx_consulta_fecha            ON consulta(fecha);


CREATE INDEX IF NOT EXISTS idx_tratamiento_id_consulta   ON tratamiento(id_consulta);


CREATE INDEX IF NOT EXISTS idx_prescripcion_id_tratamiento ON prescripcion(id_tratamiento);


CREATE INDEX IF NOT EXISTS idx_diagnostico_id_consulta     ON diagnostico(id_consulta);
