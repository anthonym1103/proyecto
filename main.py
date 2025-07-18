from fastapi import FastAPI, HTTPException
from src.conexion_postgresql import getPostulacion, getOfertasLaborales, setUserEmpresa, updateOferta, setOfertLaboral
from modelos.models import Postulacion, OfertaLaboral,UsuarioEmpresa

app = FastAPI()
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
    if(setUserEmpresa(newEmpresa["nombre"], newEmpresa["rif"], newEmpresa["tlf"], newEmpresa["sector"], newEmpresa["personacontacto"], newEmpresa["idsucursal"])):
        raise HTTPException(status_code = 404, detail = "La empresa ingresada ya existe")
    return newEmpresa

@app.put("/userHG/updateOferta/{id}", response_model = OfertaLaboral)
async def actualzOferta(id: int):
    response = updateOferta(1, id)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "La oferta a actualizar no existe")
    return response
##################ACCIONES DEL USUARIO DE HIRING GROUP###########################


##################ACCIONES DE EMPRESA###########################

@app.get("/userEmpresa/ofertaslaborales", response_model = list[OfertaLaboral])
async def ofertsLaborales():
    return(getOfertasLaborales(1))

@app.post("/userEmpresa/createOfertaLaboral", response_model = OfertaLaboral)
async def createOfertLaboral(dataOferta: OfertaLaboral):
    newOfertaLaboral = dataOferta.model_dump()
    if(setOfertLaboral(newOfertaLaboral["sucursal"], newOfertaLaboral["profesion"], newOfertaLaboral["cargo_vacante"], newOfertaLaboral["descripcion_cargo"], newOfertaLaboral["salario"])):
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




##################ACCIONES DE EMPRESA###########################

