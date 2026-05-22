
UPDATE triaje
SET peso_kg = 75.0, temp = 37.5
WHERE id_consulta = 2;

UPDATE triaje
SET presi_art_si = 120, presi_art_di = 80
WHERE id_consulta = 6;

UPDATE centro_salud
SET nivel_atencion = 'III'
WHERE nombre = 'Clínica San Pablo';
