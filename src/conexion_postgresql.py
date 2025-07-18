import psycopg2

try:
    connection = psycopg2.connect(
        host = 'localhost',
        user = 'postgres',
        password = 'sbd1',
        database = 'hirinGroup'
    )
    connection.autocommit = True
    print("conexion exitosa")
except Exception as ex:
    print(ex)

def insertarDataSucursal(nombre:str, descripcion:str):
    cursor = connection.cursor()
    query = f"""INSERT INTO sucursal(nombresucursal, descripcionsucursal) values('{nombre}','{descripcion}') """
    cursor.execute(query)
    cursor.close()

def insertarDataUserCandidato(cedula: int, nombre: str, apellido: str, telf: str, edad: int, sexo: str, univEgreso: str, profesion: str, idsucursal: int):
    cursor = connection.cursor()
    query = f"""INSERT INTO usuariocandidato(cedula, nombre, apellido, telf, edad, sexo, universidad_egreso, profesion, idsucursal) values ({cedula},'{nombre}','{apellido}','{telf}',{edad},'{sexo}','{univEgreso}','{profesion}',{idsucursal})"""
    cursor.execute(query)
    cursor.close()

def insertarDataUserHG(nombre: str, fecha_apertura: str, idsucursal: int):
    cursor = connection.cursor()
    query = f"""INSERT INTO usuariohg(nombre, fecha_apertura, idsucursal) values ('{nombre}','{fecha_apertura},'{idsucursal})"""
    cursor.execute(query)
    cursor.close()
    
def insertarDataOferta(sucursal:int, profesion:str, cargo:str, descripcion:str, salario:float):
    cursor = connection.cursor()
    query = f"""INSERT INTO ofertalaboral(idsucursal, profesion, cargo_vacante, descripcion_cargo, salario) values({sucursal},'{profesion}','{cargo}','{descripcion}', {salario}) """
    cursor.execute(query)
    cursor.close()
    
def insertarDataPostulacion(oferta:int, salario:float, tipoSangre:str, personaContacto:str, telf:str, nroCuenta:str, tiempoContratacion:str):
    cursor = connection.cursor()
    query = f"""INSERT INTO postulacion(idoferta, salario, tipo_sangre, persona_contacto, telf, nro_cuenta, tiempo_contratacion) values({oferta},{salario},'{tipoSangre}','{personaContacto}', '{telf}','{nroCuenta}','{tiempoContratacion}') """
    cursor.execute(query)
    cursor.close()

def searchOfertaLaboral(case: int, valor: str):
    cursor = connection.cursor()
    cursor.execute(f"SELECT * FROM ofertalaboral")
    rows = cursor.fetchall()
    if(case == 1):
        idOferta = int(valor)  
        for row in rows:
            if(row[0]==idOferta):
                return True
    elif(case == 2):
        for row in rows:
            if(row[3]==valor):
                return True
    return False

def isEmpresaInBD(rif: str):
    cursor = connection.cursor()
    cursor.execute(f"SELECT * FROM usuarioempresa")
    rows = cursor.fetchall()
    for row in rows:
        if(row[2] == rif):
            return True
    return False

##################ACCIONES DEL USUARIO DE HIRING GROUP###########################

def getPostulacion():
    listPostulaciones = []
    cursor = connection.cursor()
    query = "SELECT usuariocandidato.nombre, postulacion.idoferta, ofertalaboral.cargo_vacante, ofertalaboral.descripcion_cargo, postulacion.salario FROM candidatopostulacion INNER JOIN postulacion on candidatopostulacion.idpostulacion = postulacion.id INNER JOIN usuariocandidato on candidatopostulacion.cedcandidato = usuariocandidato.cedula INNER JOIN ofertalaboral on postulacion.idoferta = ofertalaboral.id"
    cursor.execute(query)
    rows = cursor.fetchall()
    colNames = [desc[0] for desc in cursor.description]
    for row in rows:
        listPostulaciones.append(dict(zip(colNames, row)))
    cursor.close()
    return listPostulaciones

def getOfertasLaborales(case: int, area:str=""):
    listOfertas=[]
    cursor = connection.cursor()
    #CASO 1 SOLO OBTIENE TODAS LAS OFERTAS LABORALES CASO 2 OBTIENE LAS OFERTAS LABORALES ACTIVAS Y POR CARGO CASO 3 OBTIENE LA OFERTA LABORAL POR ID
    if(case == 1): 
        query = "SELECT * FROM ofertalaboral ORDER BY salario DESC"
    elif(case == 2):
        query = f"select * from ofertalaboral where status=true AND cargo_vacante='{area}' ORDER BY salario DESC"
    elif(case == 3):
        idoferta = int(area)
        query = f"SELECT * FROM ofertalaboral WHERE id = {idoferta}"
        cursor.execute(query)
        row = cursor.fetchone()
        colNames = [desc[0] for desc in cursor.description]
        ofertaBuscada = dict(zip(colNames, row))
        return ofertaBuscada

    cursor.execute(query)
    rows = cursor.fetchall()
    colNames = [desc[0] for desc in cursor.description]
    for row in rows:
        listOfertas.append(dict(zip(colNames, row)))
    cursor.close()
    return listOfertas

def setUserEmpresa(nombre:str, rif:str, telf:str, sector:str, personcontact:str, idsucursal:int):
    if(isEmpresaInBD(rif) is False):
      return False 
    cursor = connection.cursor()
    query = f"""INSERT INTO usuarioempresa(nombre, rif, telf, sector, personacontacto, idsucursal) values('{nombre}','{rif}','{telf}','{sector}','{personcontact}',{idsucursal}) """
    cursor.execute(query)
    cursor.close()


def updateOferta(case: int, idOferta: int, campo:str="", valor:str=""):
    if(searchOfertaLaboral(1,idOferta) is False):
      return False 
    cursor = connection.cursor()
    if(case == 1):
        query = f"""UPDATE ofertalaboral SET status = false WHERE id = {idOferta}"""
    elif(case == 2):
        if(campo == "idsucursal" or campo == "status" or campo == "salario"):
            valorFinal = 0
            if(campo == "salario"):
                valorFinal = float(valor)
            valorFinal = int(valor)
            query = f"""UPDATE ofertalaboral SET {campo} = {valorFinal} WHERE id = {idOferta}"""
        else:
            query = f"""UPDATE ofertalaboral SET {campo} = '{valor}' WHERE id = {idOferta}"""
        cursor.execute(query)
        cursor.close()
        return True

    cursor.execute(query)
    cursor.close()
    return getOfertasLaborales(3, idOferta)
##################ACCIONES DEL USUARIO DE HIRING GROUP###########################

##################ACCIONES DE EMPRESA###########################

def setOfertLaboral(idSucursal:int, profesion:str, cargoVacante:str, descripcionCargo:str, salario:str):
    if(searchOfertaLaboral(2,cargoVacante) is False):
      return False 
    cursor = connection.cursor()
    query = f"""INSERT INTO ofertalaboral(idsucursal, profesion, cargo_vacante, descripcion_cargo, salario) VALUES({idSucursal},'{profesion}','{cargoVacante}','{descripcionCargo}',{salario})"""
    cursor.execute(query)
    cursor.close()



##################ACCIONES DE EMPRESA###########################
