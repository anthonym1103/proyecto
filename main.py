from fastapi import FastAPI, HTTPException
from src.conexion_postgresql import getPostulacion, getOfertasLaborales, setUserEmpresa, updateOferta, setOfertLaboral, deleteOfertLaboral, setProfesion, profesionExperienciaDelete, updateProfesionExperiencia, setExperiencia, getProfesionExperiencia, setDataUserCandidato, getFechaPostulacion
from modelos.models import Postulacion, OfertaLaboral,UsuarioEmpresa, ProfesionCandidato, ExperienciaLaboral, UsuarioCandidato, CandidatoPostulacion
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

origins =[
    "http://localhost:5173",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins = origins,
    allow_methods = ["*"],
    allow_headers = ["*"]
)

##################ACCIONES DEL USUARIO DE HIRING GROUP###########################
@app.get("/userHG/postulaciones", response_model = list[Postulacion])
async def postulacion():
    return getPostulacion()

@app.get("/userHG/ofertaslaborales", response_model= list[OfertaLaboral])
async def ofertLaborals():
    return getOfertasLaborales(1)

@app.get("/userHG/ofertaslaborales/{area}", response_model = list[OfertaLaboral])
async def ofertLaborals(area: str):
    response = getOfertasLaborales(2, area)
    if (len(response) == 0):
        raise HTTPException(status_code = 202, detail = "La oferta laboral no pudo ser encontrada")
    return response

@app.post("/userHG/createuserempresa", response_model = UsuarioEmpresa)
async def createUserEmpresa(dataEmpresa: UsuarioEmpresa):
    newEmpresa = dataEmpresa.model_dump()
    if(setUserEmpresa(newEmpresa["nombre"], newEmpresa["rif"], newEmpresa["tlf"], newEmpresa["sector"], newEmpresa["personacontacto"], newEmpresa["idsucursal"], newEmpresa["correo"], newEmpresa["contrasenia"])):
        raise HTTPException(status_code = 404, detail = "La empresa ingresada ya existe")
    return newEmpresa

@app.put("/userHG/updateOferta/{id}", response_model = OfertaLaboral)
async def actualzOferta(id: int):
    response = updateOferta(1, id)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "La oferta a actualizar no existe")
    return response
##################ACCIONES DEL USUARIO DE HIRING GROUP###########################


##################ACCIONES DE USUARIO EMPRESA###########################

@app.get("/userEmpresa/ofertaslaborales", response_model = list[OfertaLaboral])
async def ofertsLaborales():
    return(getOfertasLaborales(1))

@app.post("/userEmpresa/createOfertaLaboral", response_model = OfertaLaboral)
async def createOfertLaboral(dataOferta: OfertaLaboral):
    newOfertaLaboral = dataOferta.model_dump()
    if(setOfertLaboral(newOfertaLaboral["idsucursal"], newOfertaLaboral["profesion"], newOfertaLaboral["cargo_vacante"], newOfertaLaboral["descripcion_cargo"], newOfertaLaboral["salario"])):
        raise HTTPException(status_code = 404, detail = "La empresa ingresada ya existe")
    return newOfertaLaboral

@app.put("/userEmpresa/updateOferta/{id}", response_model = OfertaLaboral)
async def actualzOferta(id: int, dataOferta:OfertaLaboral):
    newOferta = dataOferta.model_dump()
    for campo in newOferta:
        if(newOferta[campo] != ""):
            if((type(newOferta[campo]) is int and newOferta[campo] != 0) or type(newOferta[campo]) is bool):
                response = updateOferta(2, id, campo, newOferta[campo])
                if(response is False):
                    raise HTTPException(status_code = 404, detail = "La oferta a actualizar no existe")
    return newOferta


@app.delete("/userEmpresa/deleteOferta/{id}", response_model = OfertaLaboral)
async def deleteOfert(id: int):
    response = deleteOfertLaboral(id)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "La oferta a eliminar no existe")
    return response

##################ACCIONES DE USUARIO EMPRESA###########################



##################ACCIONES DE USUARIO CANDIDATO###########################

@app.post("/userCandidato/createUser", response_model = UsuarioCandidato)
async def createUser(dataCandidato: UsuarioCandidato):
    newDataCandidato = dataCandidato.model_dump()
    if(setDataUserCandidato(newDataCandidato["cedula"],newDataCandidato["nombre"], newDataCandidato["apellido"], newDataCandidato["telf"], newDataCandidato["edad"], newDataCandidato["sexo"], newDataCandidato["universidad_egreso"], newDataCandidato["idsucursal"], newDataCandidato["correo"], newDataCandidato["contrasenia"])):
        raise HTTPException(status_code = 404, detail = "El usuario ingresado ya existe")
    return newDataCandidato

@app.get("/userCandidato/getPostulaciones/{cedula}", response_model = list[CandidatoPostulacion])
async def getPostulaciones(cedula: int):
    response = getFechaPostulacion(cedula)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "Este usuario no ha hecho ninguna postulacion")
    return response

@app.get("/userCandidato/getProfesiones", response_model= list[ProfesionCandidato])
async def getProfesiones():
    return getProfesionExperiencia(1)

@app.post("/userCandidato/createProfesion", response_model = ProfesionCandidato)
async def createProfesion(dataProfesion: ProfesionCandidato):
    newDataProfesion = dataProfesion.model_dump()
    if(setProfesion(newDataProfesion["nombre"], newDataProfesion["descripcion"])):
        raise HTTPException(status_code = 404, detail = "La profesion ingresada ya existe")
    return newDataProfesion

@app.delete("/userCandidato/deleteProfesion/{id}", response_model= ProfesionCandidato)
async def deleteProfesion(id: int):
    response = profesionExperienciaDelete(id, 1)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "La oferta a eliminar no existe")
    return response

@app.put("/userCandidato/updateProfesion/{id}", response_model = ProfesionCandidato)
async def actualzProfesion(id: int, dataProfesion:ProfesionCandidato):
    newProfesion = dataProfesion.model_dump()
    for campo in newProfesion:
        if(newProfesion[campo] != "" and campo != "id"):
            response = updateProfesionExperiencia(1, id, campo, newProfesion[campo])
            if(response is False):
                raise HTTPException(status_code = 404, detail = "La profesion a actualizar no existe")
    return newProfesion

@app.get("/userCandidato/getExperiencias", response_model= list[ExperienciaLaboral])
async def getExperiencias():
    return getProfesionExperiencia(2)

@app.post("/userCandidato/createExperiencia", response_model = ExperienciaLaboral)
async def createExperiencia(dataExperiencia: ExperienciaLaboral):
    newDataExperiencia= dataExperiencia.model_dump()
    setExperiencia(newDataExperiencia["empresa"], newDataExperiencia["fecha_inicio"],newDataExperiencia["fecha_finalizacion"], newDataExperiencia["cargo"])
    return newDataExperiencia

@app.delete("/userCandidato/deleteExperiencia/{id}", response_model= ExperienciaLaboral)
async def deleteExperiencia(id: int):
    response = profesionExperienciaDelete(id, 2)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "La oferta a eliminar no existe")
    return response

@app.put("/userCandidato/updateExperiencia/{id}", response_model = ExperienciaLaboral)
async def actualzExperiencia(id: int, dataExperiencia:ExperienciaLaboral):
    newExperiencia = dataExperiencia.model_dump()
    for campo in newExperiencia:
        if(newExperiencia[campo] != "" and campo != "id"):
            response = updateProfesionExperiencia(2, id, campo, newExperiencia[campo])
            if(response is False):
                raise HTTPException(status_code = 404, detail = "La profesion a actualizar no existe")
    return newExperiencia
##################ACCIONES DE USUARIO CANDIDATO###########################
