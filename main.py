from fastapi import FastAPI, HTTPException
from src.conexion_postgresql import getPostulacion, getOfertasLaborales, setUserEmpresa, updateOferta
from modelos.models import Postulacion, OfertaLaboral,UsuarioEmpresa

app = FastAPI()
##################ACCIONES DEL USUARIO DE HIRING GROUP###########################
@app.get("/postulaciones", response_model = list[Postulacion])
async def postulacion():
    return getPostulacion()

@app.get("/ofertaslaborales", response_model= list[OfertaLaboral])
async def ofertLaborals():
    return getOfertasLaborales(1)

@app.get("/ofertaslaborales/{area}", response_model = list[OfertaLaboral])
async def ofertLaborals(area: str):
    response = getOfertasLaborales(2, area)
    if (len(response) == 0):
        raise HTTPException(status_code = 202, detail = "La oferta laboral no pudo ser encontrada")
    return response

@app.post("/userempresa", response_model = UsuarioEmpresa)
async def createUserEmpresa(dataEmpresa: UsuarioEmpresa):
    newEmpresa = dataEmpresa.model_dump()
    if(setUserEmpresa(newEmpresa["nombre"], newEmpresa["rif"], newEmpresa["tlf"], newEmpresa["sector"], newEmpresa["personacontacto"], newEmpresa["idsucursal"])):
        raise HTTPException(status_code = 404, detail = "La empresa ingresada ya existe")
    return newEmpresa

@app.put("/updateOferta/{id}", response_model = OfertaLaboral)
async def actualzOferta(id: int):
    response = updateOferta(id)
    if(response is False):
        raise HTTPException(status_code = 404, detail = "La oferta a actualizar no existe")
    return response
##################ACCIONES DEL USUARIO DE HIRING GROUP###########################


##################ACCIONES DE EMPRESA###########################


##################ACCIONES DE EMPRESA###########################

