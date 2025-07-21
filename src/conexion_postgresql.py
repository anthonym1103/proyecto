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


def verify_user(correo: str, contrasenia: str, table_name: str):
    # Consulta SQL para cada tabla (ejemplo con asyncpg)
    cursor = connection.cursor()
    print(table_name)
    query = f"""SELECT * FROM {table_name} WHERE correo = '{correo}' AND contrasenia = '{contrasenia}'"""
    cursor.execute(query)
    row = cursor.fetchone()
    colNames = [desc[0] for desc in cursor.description]
    print(f"esta es la fila{row} y esta la columna {colNames}")
    if(row):
        usuarioBuscado = dict(zip(colNames, row))
        return usuarioBuscado
    
    cursor.close()
    return None
    


def insertarDataSucursal(nombre:str, descripcion:str):
    cursor = connection.cursor()
    query = f"""INSERT INTO sucursal(nombresucursal, descripcionsucursal) values('{nombre}','{descripcion}') """
    cursor.execute(query)
    cursor.close()


def insertarDataUserHG(nombre: str, fecha_apertura: str, idsucursal: int):
    cursor = connection.cursor()
    query = f"""INSERT INTO usuariohg(nombre, fecha_apertura, idsucursal) values ('{nombre}','{fecha_apertura},'{idsucursal})"""
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
    # CASO 1 BUSCA LAS OFERTAS POR LA ID, CASO 2 BUSCA LAS OFERTAS POR EL CARGO 
    for row in rows:
        if(case == 1):
            idOferta = int(valor)  
            if(row[0]==idOferta):
                return True
        elif(case == 2):
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

def searchProfesionExperiencia(valor: str, nomTable: str, case:int = 0):
    cursor= connection.cursor()
    cursor.execute(f"SELECT * FROM {nomTable}")
    rows = cursor.fetchall()
    for row in rows:
        if(nomTable == "profesion"):
            # CASO 1 BUSCA LAS PROFECIONES POR LA NOMBRE, CASO 2 BUSCA LAS PROFESIONES POR EL ID 
            if(case == 1):
                if(row[1] == valor):
                    return True
            elif(case == 2):
                id = int(valor)
                if(row[0] == id):
                    return True
                
        elif(nomTable == "experiencialaboral" or nomTable == "usuariocandidato"):
            # BUSCA EN LA TABLA DE EXPERIENCIAS LABORALES POR ID
            valorFinal = int(valor)
            if(row[0] == valorFinal):
                return True
            
        else:
            #BUSCA EN LA TABLA DE CANDIDATO POSTULACION POR CEDULA DEL CANDIDATO
            cedula = int(valor)
            if(row[1] == cedula):
                return True
    return False

def getDataProfesionExperiencia(id: int, case:int):
    cursor = connection.cursor()
    if(case == 1):
        query = f"SELECT * FROM profesion WHERE id = {id}"
    else:
        query = f"SELECT * FROM experiencialaboral WHERE id = {id}"
    cursor.execute(query)
    row = cursor.fetchone()
    colNames = [desc[0] for desc in cursor.description]
    profesionBuscada = dict(zip(colNames, row))
    cursor.close()
    return profesionBuscada


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
        cursor.close()
        return ofertaBuscada
    else: 
        query = f"SELECT * FROM ofertalaboral WHERE status = true"


    cursor.execute(query)
    rows = cursor.fetchall()
    colNames = [desc[0] for desc in cursor.description]
    for row in rows:
        listOfertas.append(dict(zip(colNames, row)))
    cursor.close()
    return listOfertas

def setUserEmpresa(nombre:str, rif:str, telf:str, sector:str, personcontact:str, idsucursal:int, correo: str,  contrasenia: str):
    if(isEmpresaInBD(rif) is True):
      return True 
    cursor = connection.cursor()
    query = f"""INSERT INTO usuarioempresa(nombre, rif, telf, sector, personacontacto, idsucursal, correo, contrasenia) values('{nombre}','{rif}','{telf}','{sector}','{personcontact}',{idsucursal}, '{correo}', '{contrasenia}') """
    cursor.execute(query)
    cursor.close()
    return False


def updateOferta(case: int, idOferta: int, valor:str="", campo:str=""):
    if(searchOfertaLaboral(1,idOferta) is False):
      return False 
    cursor = connection.cursor()
    if(case == 1):
        query = f"""UPDATE ofertalaboral SET status = false WHERE id = {idOferta}"""
    elif(case == 2):
        if(campo == "idsucursal" or campo == "status" or campo == "salario"):
            if(campo == "status"):
                valorFinal = "false" if not valor else "true"
            elif(campo == "salario"):
                valorFinal = float(valor)
            else:
                valorFinal = int(valor)
            query = f"""UPDATE ofertalaboral SET {campo} = {valorFinal} WHERE id = {idOferta}"""
        else:
            query = f"""UPDATE ofertalaboral SET {campo} = {valor} WHERE id = {idOferta}"""
        cursor.execute(query)
        cursor.close()
        return True
    elif(case==3):
        valorFinal = "true" if not valor else "false"
        if(valorFinal == valor):
            if(valorFinal == "true"):
                valorFinal = "false"
            else:
                valorFinal = "true"  
        query = f"""UPDATE ofertalaboral SET status = {valorFinal} WHERE id = {idOferta}"""

    cursor.execute(query)
    cursor.close()
    return getOfertasLaborales(3, idOferta)
##################ACCIONES DEL USUARIO DE HIRING GROUP###########################

##################ACCIONES DE USUARIO EMPRESA###########################

def setOfertLaboral(idSucursal:int, profesion:str, cargoVacante:str, descripcionCargo:str, salario:str):
    if(searchOfertaLaboral(2,cargoVacante) is True):
      return True 
    cursor = connection.cursor()
    query = f"""INSERT INTO ofertalaboral(idsucursal, profesion, cargo_vacante, descripcion_cargo, salario) VALUES({idSucursal},'{profesion}','{cargoVacante}','{descripcionCargo}',{salario})"""
    cursor.execute(query)
    cursor.close()
    return False


def deleteOfertLaboral(id: int):
    #AGREGAR QUERY PARA QUE SE REINICIE EL CONTEO DEL ID 
    if(searchOfertaLaboral(1, id) is False):
        return False
    cursor = connection.cursor()
    query = f"""DELETE FROM ofertalaboral WHERE id = {id}"""
    ofertaBuscada = getOfertasLaborales(3, id)
    cursor.execute(query)
    cursor.close()
    return ofertaBuscada
##################ACCIONES DE USUARIO EMPRESA###########################



##################ACCIONES DEL USUARIO CANDIDATO###########################


def setDataUserCandidato(cedula: int, nombre: str, apellido: str, tlf: str, edad: int, sexo: str, uniEgreso: str, idsucursal: int, correo: str, contrasenia: int):
    if(searchProfesionExperiencia(cedula,"usuariocandidato") is True):
        return True
    
    cursor = connection.cursor()
    query = f"""INSERT INTO usuariocandidato(cedula, nombre, apellido, telf, edad, sexo, universidad_egreso, idsucursal, correo, contrasenia) VALUES({cedula},'{nombre}','{apellido}', '{tlf}', {edad}, '{sexo}', '{uniEgreso}', {idsucursal}, '{correo}', '{contrasenia}')"""
    cursor.execute(query)
    cursor.close()
    return False
    

def getFechaPostulacion(cedula: int):
    if(searchProfesionExperiencia(cedula,"candidatopostulacion") is False):
        return False
    
    listFechaPostulaciones = []
    cursor = connection.cursor()
    query = f"""SELECT candidatopostulacion.id, candidatopostulacion.cedcandidato,candidatopostulacion.idpostulacion, candidatopostulacion.fecha, postulacion.idoferta, postulacion.salario, postulacion.telf, postulacion.tiempo_contratacion FROM candidatopostulacion INNER JOIN postulacion ON candidatopostulacion.idpostulacion = postulacion.id  WHERE cedcandidato = {cedula} ORDER BY fecha ASC"""
    cursor.execute(query)
    rows = cursor.fetchall()
    colNames = [desc[0] for desc in cursor.description]
    for row in rows:
        listFechaPostulaciones.append(dict(zip(colNames, row)))
    cursor.close()
    return listFechaPostulaciones


def getProfesionExperiencia(case: int):
    listData = []
    cursor = connection.cursor()
    if(case == 1):
        query= f"""SELECT * FROM profesion"""
    else:
        query= f"""SELECT * FROM experiencialaboral"""
    cursor.execute(query)
    rows = cursor.fetchall()
    colNames = [desc[0] for desc in cursor.description]
    for row in rows:
        listData.append(dict(zip(colNames, row)))
    cursor.close()
    return listData

def setProfesion(nombre:str, descripcion:str):
    if(searchProfesionExperiencia(nombre, "profesion", 2) is True):
        return True
    cursor = connection.cursor()
    query = f"""INSERT INTO profesion(nombre, descripcion) VALUES('{nombre}', '{descripcion}')"""
    cursor.execute(query)
    cursor.close()
    return False

def profesionExperienciaDelete(id: int, case: int):
    #AGREGAR QUERY PARA QUE SE REINICIE EL CONTEO DEL ID 
    if(case == 1):
        if(searchProfesionExperiencia(id, "profesion", 2) is False):
            return False
        cursor = connection.cursor()
        query = f"""DELETE FROM profesion WHERE id = {id}"""
        dataBuscada = getDataProfesionExperiencia(id, 1)
    else:
        if(searchProfesionExperiencia(id, "experiencialaboral") is False):
            return False
        cursor = connection.cursor()
        query = f"""DELETE FROM experiencialaboral WHERE id = {id}"""
        dataBuscada = getDataProfesionExperiencia(id, 2)

    cursor.execute(query)
    cursor.close()
    return dataBuscada

def updateProfesionExperiencia(case: int,idprofesion: int, campo:str="", valor:str=""):
    if(case == 1):
        if(searchProfesionExperiencia(idprofesion, "profesion", 2) is False):
            return False 
        cursor = connection.cursor()
        query = f"""UPDATE profesion SET {campo} = '{valor}' WHERE id = {idprofesion}"""
    else:
        if(searchProfesionExperiencia(idprofesion, "experiencialaboral") is False):
            return False
        cursor = connection.cursor()
        query = f"""UPDATE experiencialaboral SET {campo} = '{valor}' WHERE id = {idprofesion}"""
    cursor.execute(query)
    cursor.close()
    return True
    

def setExperiencia(empresa: str, fechaInicio: str, fechaFinal: str, cargo: str):
    cursor = connection.cursor()
    query = f"""INSERT INTO experiencialaboral(empresa, fecha_inicio, fecha_finalizacion, cargo) VALUES('{empresa}', '{fechaInicio}','{fechaFinal}', '{cargo}')"""
    cursor.execute(query)
    cursor.close()
    return True


##################ACCIONES DEL USUARIO CANDIDATO###########################