import psycopg2

try:
    connection = psycopg2.connect(
        host = 'localhost',
        user = 'postgres',
        password = 'sbd1',
        database = 'hirinGroup'
    )
    print("conexion exitosa")
except Exception as ex:
    print(ex)

def insertarDataSucursal(nombre:str, descripcion:str):
    cursor = connection.cursor()
    query = f"""INSERT INTO sucursal(nombresucursal, descripcionsucursal) values('{nombre}','{descripcion}') """
    cursor.execute(query)
    connection.commit()
    cursor.close()

def insertarDataUserEmpresa(nombre:str, rif:str, telf:str, sector:str, personcontact:str, idsucursal:int):
    cursor = connection.cursor()
    query = f"""INSERT INTO usuarioempresa(nombre, rif, telf, sector, personacontacto, idsucursal) values('{nombre}','{rif}','{telf}','{sector}','{personcontact}',{idsucursal}) """
    cursor.execute(query)
    connection.commit()
    cursor.close()

def insertarDataUserCandidato(cedula: int, nombre: str, apellido: str, telf: str, edad: int, sexo: str, univEgreso: str, profesion: str, idsucursal: int):
    cursor = connection.cursor()
    query = f"""INSERT INTO usuariocandidato(cedula, nombre, apellido, telf, edad, sexo, universidad_egreso, profesion, idsucursal) values ({cedula},'{nombre}','{apellido}','{telf}',{edad},'{sexo}','{univEgreso}','{profesion}',{idsucursal})"""
    cursor.execute(query)
    connection.commit()
    cursor.close()

def insertarDataUserHG(nombre: str, fecha_apertura: str, idsucursal: int):
    cursor = connection.cursor()
    query = f"""INSERT INTO usuariohg(nombre, fecha_apertura, idsucursal) values ('{nombre}','{fecha_apertura},'{idsucursal})"""
    cursor.execute(query)
    connection.commit()
    cursor.close()
    
def insertarDataOferta(sucursal:int, profesion:str, cargo:str, descripcion:str, salario:float):
    cursor = connection.cursor()
    query = f"""INSERT INTO ofertalaboral(idsucursal, profesion, cargo_vacante, descripcion_cargo, salario) values({sucursal},'{profesion}','{cargo}','{descripcion}', {salario}) """
    cursor.execute(query)
    connection.commit()
    cursor.close()
    
def insertarDataPostulacion(oferta:int, salario:float, tipoSangre:str, personaContacto:str, telf:str, nroCuenta:str, tiempoContratacion:str):
    cursor = connection.cursor()
    query = f"""INSERT INTO postulacion(idoferta, salario, tipo_sangre, persona_contacto, telf, nro_cuenta, tiempo_contratacion) values({oferta},{salario},'{tipoSangre}','{personaContacto}', '{telf}','{nroCuenta}','{tiempoContratacion}') """
    cursor.execute(query)
    connection.commit()
    cursor.close()



#Acciones del usuario Hiring Group


def getPostulacion():
    cursor = connection.cursor()
    query = "SELECT usuariocandidato.nombre, postulacion.id, ofertalaboral.cargo_vacante FROM postulacion INNER JOIN ofertalaboral on postulacion.idoferta = ofertalaboral.id INNER JOIN candidatopostulacion on postulacion.id = candidatopostulacion.idpostulacion, INNER JOIN usuariocandidato on candidatopostulacion.idcandidato = usuariocandidato.cedula"
    cursor.execute(query)
    rows = cursor.fetchall()
    for row in rows:
        print(row) 


