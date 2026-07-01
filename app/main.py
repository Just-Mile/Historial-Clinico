import os
import psycopg2
from psycopg2.extras import RealDictCursor
from fastapi import FastAPI
from pymongo import MongoClient

from fastapi.responses import Response
import csv, io

app = FastAPI(title="FastAPI + Postgres + Mongo")

POSTGRES_URL = os.environ["POSTGRES_URL"]
mongo_client = MongoClient(os.environ["MONGO_URL"])


def get_pg_conn():
    return psycopg2.connect(POSTGRES_URL)

@app.post("/consulta_completa/")
def crear_consulta_completa(data: dict = Body(...)):
    
    obligatorios = ["id_historia", "fecha", "hora", "tipo", "motivo", "estado_paci"]
    
   
    triaje = data.get("triaje")
    tratamiento = data.get("tratamiento")
    conn = get_pg_conn()
    try:
        with conn, conn.cursor(cursor_factory=RealDictCursor) as cur:

            
            id_triaje = None
            if triaje:
                campos = ["fecha", "peso_kg", "talla_cm", "fech_hora_toma",
                          "presi_art_si", "presi_art_di", "rpm", "lpm", "temp", "spo2"]
                id_triaje = _insert(cur, "triaje", campos, [triaje.get(c) for c in campos], "id_triaje")
 
            id_consulta = _insert(
                cur, "consulta",
                ["id_historia", "id_personal", "id_triaje", "fecha", "hora", "tipo", "motivo", "estado_paci"],
                [data["id_historia"], data.get("id_personal"), id_triaje,
                 data["fecha"], data["hora"], data["tipo"], data["motivo"], data["estado_paci"]],
                "id_consulta",
            )
 
            ids_diagnosticos = [
                _insert(cur, "diagnostico",
                        ["id_consulta", "tipo", "fech_diagnostic", "cod_cie10", "descripcion"],
                        [id_consulta, d.get("tipo"), d.get("fech_diagnostic"), d.get("cod_cie10"), d.get("descripcion")],
                        "id_diagnostico")
                for d in data.get("diagnosticos") or []
            ]
 
            id_tratamiento, ids_prescripciones = None, []
            if tratamiento:
                id_tratamiento = _insert(
                    cur, "tratamiento",
                    ["id_consulta", "id_personal", "tipo", "fech_ini", "fecha_fin", "descripc", "observaciones"],
                    [id_consulta, tratamiento.get("id_personal"), tratamiento.get("tipo"),
                     tratamiento.get("fech_ini"), tratamiento.get("fecha_fin"),
                     tratamiento.get("descripc"), tratamiento.get("observaciones")],
                    "id_tratamiento",
                )
                ids_prescripciones = [
                    _insert(cur, "prescripcion",
                            ["id_tratamiento", "id_medicamento", "dosis", "frecuencia", "duracion_dias", "via_admin"],
                            [id_tratamiento, p.get("id_medicamento"), p.get("dosis"),
                             p.get("frecuencia"), p.get("duracion_dias"), p.get("via_admin")],
                            "id_prescripcion")
                    for p in tratamiento.get("prescripciones") or []
                ]
 
        return {
            "id_consulta": id_consulta,
            "id_triaje": id_triaje,
            "diagnosticos": ids_diagnosticos,
            "id_tratamiento": id_tratamiento,
            "prescripciones": ids_prescripciones,
        }
 
    
    finally:
        conn.close()
 


@app.get("/personal_salud/")
def personal_salud(estado: str):
    with psycopg2.connect(POSTGRES_URL) as conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT * FROM personal_salud WHERE estado = %s", (estado,))
        return cur.fetchall()

@app.get("/medicamento")
def medicatmentos():
    with psycopg2.connect(POSTGRES_URL) as conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT nomb_comercial FROM medicamento")
        names = []
        for row in cur.fetchall():
            names.append(row['nomb_comercial'])
        return names



@app.get("/historia_completa/{id_historia}")
def historia_completa(id_historia: int):
    with get_pg_conn() as conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
        
        cur.execute("""
            SELECT hc.id_historia, hc.num_hc, hc.fech_apertura, hc.estado,
                   p.id_paciente, p.dni, p.nombres, p.apellidos, p.fecha_nac, p.sexo
            FROM historia_clinica hc
            JOIN pacientes p ON hc.id_paciente = p.id_paciente
            WHERE hc.id_historia = %s
        """, (id_historia,))
        historia = cur.fetchone()
        
       
        cur.execute("""
            SELECT c.id_consulta, c.fecha, c.hora, c.tipo, c.motivo, c.estado_paci,
                   t.id_triaje, t.peso_kg, t.talla_cm, t.presi_art_si, t.presi_art_di,
                   t.rpm, t.lpm, t.temp, t.spo2
            FROM consulta c
            LEFT JOIN triaje t ON c.id_triaje = t.id_triaje
            WHERE c.id_historia = %s
            ORDER BY c.fecha, c.hora
        """, (id_historia,))
        consultas = cur.fetchall()

        
        for consulta in consultas:
            cur.execute("""
                SELECT id_diagnostico, tipo, fech_diagnostic, cod_cie10, descripcion
                FROM diagnostico
                WHERE id_consulta = %s
            """, (consulta['id_consulta'],))
            consulta['diagnosticos'] = cur.fetchall()

        historia['consultas'] = consultas
        return historia


@app.get("/tratamiento_detalle/{id_tratamiento}")
def tratamiento_detalle(id_tratamiento: int):
    with get_pg_conn() as conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
        
        cur.execute("""
            SELECT t.id_tratamiento, t.tipo, t.fech_ini, t.fecha_fin, t.descripc, t.observaciones,
                   ps.id_personal, ps.nombres AS nombre_profesional, ps.apellidos AS apellido_profesional, ps.rol,
                   c.id_consulta, c.fecha AS fecha_consulta, c.hora AS hora_consulta, c.motivo AS motivo_consulta
            FROM tratamiento t
            JOIN consulta c ON t.id_consulta = c.id_consulta
            LEFT JOIN personal_salud ps ON t.id_personal = ps.id_personal
            WHERE t.id_tratamiento = %s
        """, (id_tratamiento,))
        tratamiento = cur.fetchone()
       

        
        cur.execute("""
            SELECT p.id_prescripcion, p.dosis, p.frecuencia, p.duracion_dias, p.via_admin,
                   m.id_medicamento, m.nomb_gene, m.concentracion, m.presentacion, m.nomb_comercial, m.grupo_atc
            FROM prescripcion p
            LEFT JOIN medicamento m ON p.id_medicamento = m.id_medicamento
            WHERE p.id_tratamiento = %s
        """, (id_tratamiento,))
        prescripciones = cur.fetchall()

        tratamiento["prescripciones"] = prescripciones
        return tratamiento



@app.get("/exportar_historia_csv/{id_historia}")
def exportar_historia_csv(id_historia: int):
    with get_pg_conn() as conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("""
            SELECT 
                p.dni, p.nombres, p.apellidos, p.sexo, p.fecha_nac,
                hc.num_hc, hc.fech_apertura,
                c.fecha, c.hora, c.tipo, c.motivo,
                t.peso_kg, t.talla_cm, t.presi_art_si, t.presi_art_di,
                COALESCE(STRING_AGG(d.cod_cie10 || ' ' || d.descripcion, '; '), '') AS diagnosticos
            FROM historia_clinica hc
            JOIN pacientes p ON hc.id_paciente = p.id_paciente
            JOIN consulta c ON c.id_historia = hc.id_historia
            LEFT JOIN triaje t ON c.id_triaje = t.id_triaje
            LEFT JOIN diagnostico d ON d.id_consulta = c.id_consulta
            WHERE hc.id_historia = %s
            GROUP BY p.dni, p.nombres, p.apellidos, p.sexo, p.fecha_nac, hc.num_hc, hc.fech_apertura,
                     c.fecha, c.hora, c.tipo, c.motivo, t.peso_kg, t.talla_cm, t.presi_art_si, t.presi_art_di
            ORDER BY c.fecha
        """, (id_historia,))
        
        filas = cur.fetchall()
        
        
        output = io.StringIO()
        documento = csv.writer(output)
        documento.writerow(filas[0].keys())  
        for f in filas:
            documento.writerow(f.values())
        
        return Response(output.getvalue().encode('utf-8-sig'), media_type="text/csv",
                        headers={"Content-Disposition": f"attachment; filename=historia_{id_historia}.csv"})


@app.get("/")
def root():
    return {"status": "mamacetayaconozcolacapetal"}


@app.get("/health/postgres")
def health_postgres():
    with get_pg_conn() as conn, conn.cursor(cursor_factory=RealDictCursor) as cur:
        cur.execute("SELECT version() AS version;")
        return cur.fetchone()


@app.get("/health/mongo")
def health_mongo():
    info = mongo_client.server_info()
    return {"mongo_version": info["version"]}
