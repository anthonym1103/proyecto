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

class UsuarioCandidato(BaseModel):
    cedula: int
    nombre: str
    apellido: str
    tlf: str
    edad: str
    sexo: str
    universidad_egreso: str
    idsucursal: int

class ProfesionCandidato(BaseModel):
    id: int
    nombre: str
    descripcion: str

class ExperienciaLaboral(BaseModel):
    id: int
    empresa: str
    fecha_inicio: str
    fecha_finalizacion: str
    cargo: str


class CandidatoPostulacion(BaseModel):
    id: int
    cedcandidato: int
    idpostulacion: int
    fecha: str