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
            SELECT id_tratamiento, id_consulta, id_personal, tipo, fech_ini, fecha_fin, descripc, observaciones
            FROM tratamiento
            WHERE id_tratamiento = %s
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
