from pydantic import BaseModel

class Postulacion(BaseModel):
    nombre: str
    idoferta: int
    cargo_vacante: str
    descripcion_cargo: str
    salario: float

class OfertaLaboral(BaseModel):
    id: int
    idsucursal: int
    profesion: str
    cargo_vacante: str
    descripcion_cargo:str
    salario: float
    status: bool

class UsuarioEmpresa(BaseModel):
    id: int
    nombre: str
    rif:str
    tlf: str
    sector: str
    personacontacto: str
    idsucursal: int