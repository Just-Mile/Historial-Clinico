INSERT INTO triaje
(id_consulta, peso_kg, talla_cm, fech_hora_toma,
 presi_art_si, presi_art_di, rpm, lpm, temp, spo2)
VALUES
(1, 70.50, 175.0, '2026-05-20 08:30:00', 120, 80, 18, 72, 36.5, 98),
(2, 65.20, 168.0, '2026-05-20 09:00:00', 110, 70, 20, 75, 37.0, 97),
(3, 80.00, 180.0, '2026-05-20 09:30:00', 130, 85, 22, 80, 38.1, 95),
(4, 55.40, 160.0, '2026-05-20 10:00:00', 100, 65, 19, 70, 36.7, 99),
(5, 72.80, 172.0, '2026-05-20 10:30:00', 125, 82, 21, 78, 37.4, 96);

INSERT INTO func_bio
(id_consulta, apetito, sed, sueno, deposicion, obser_adi, actv_sexual)
VALUES
(1, 'Normal', 'Moderada', '8 horas', 'Regular', 'Sin observaciones', 'Activa'),
(2, 'Disminuido', 'Alta', '6 horas', 'Estreñimiento', 'Dolor abdominal leve', 'Activa'),
(3, 'Aumentado', 'Normal', '7 horas', 'Regular', 'Ninguna', 'Inactiva'),
(4, 'Normal', 'Baja', '5 horas', 'Diarrea', 'Fatiga constante', 'Activa'),
(5, 'Disminuido', 'Alta', '4 horas', 'Regular', 'Pérdida de apetito', 'Inactiva');
