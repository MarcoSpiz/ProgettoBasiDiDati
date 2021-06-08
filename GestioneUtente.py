import mysql.connector

import random
#####################################################################################################################
def nuovoCliente(connection):
    print("\n")
    print("Benvenuto/a, Inserisci i valori richiesti per la registrazione")
    email = input("Inserisci email= ")
    nome = input("Inserisci nome= ")
    cognome = input("Inserisci cognome= ")
    datanascita = input("Inserisci data di nascita (YYYY-MM-DD)= ")
    if not validaInput("data",datanascita):
        datanascita = input("Inserisci data di nascita (YYYY-MM-DD)= ")
        while not validaInput("data",datanascita):
            datanascita = input("Inserisci data di nascita (YYYY-MM-DD)= ")
    numerocarta = input("Inserisci numero di carta= ")
    if not validaInput("int",numerocarta):
        numerocarta = input("Inserisci numero di carta= ")
        while not validaInput("int",numerocarta):
            numerocarta = input("Inserisci numero di carta= ")
    numerocarta = int(numerocarta)
    codicecvv = input("Inserisci codice cvv= ")
    if not validaInput("int",codicecvv):
        codicecvv = input("Inserisci codice cvv= ")
        while not validaInput("int",codicecvv):
            numerocarta = input("Inserisci codice cvv= ")
    codicecvv = int(codicecvv)
    scadenza = input("Inserisci scadenza carta (YYYY-MM-DD)= ") 
    if not validaInput("data",scadenza):
        scadenza = input("Inserisci scadenza carta (YYYY-MM-DD)= ")
        while not validaInput("data",scadenza):
            scadenza = input("Inserisci scadenza carta (YYYY-MM-DD)= ")
    telefono = input("Inserisci telefono (OPZIONALE, se non si vuole inserire digitare 0(ZERO))= ")
    if not validaInput("int",telefono):
        telefono = input("Inserisci telefono (OPZIONALE, se non si vuole inserire digitare 0(ZERO))= ")
        while not validaInput("int",telefono):
            telefono = input("Inserisci telefono (OPZIONALE, se non si vuole inserire digitare 0(ZERO))= ")
    telefono = int(telefono)
    nazione = input("Inserisci nazione= ")
    nomecitta = input("Inserisci nome della citta= ")
    nomevia = input("Inserisci il nome della tua via= ")
    cap = input("Inserisci CAP= ")
    if not validaInput("int",cap):
        cap = input("Inserisci CAP= ")
        while not validaInput("int",cap):
            cap = input("Inserisci CAP= ")
    cap = int(cap)
    numerocivico = input("Inserisci numero civico= ")
    if not validaInput("int",numerocivico):
        numerocivico = input("Inserisci numero civico= ")
        while not validaInput("int",numerocivico):
            numerocivico = input("Inserisci numero civico= ")
    numerocivico = int(numerocivico)
    password = input("Inserisci password= ")
    codUbicazione = nome[0]+cognome[0]+"c1"
    mycursor = connection.cursor()
    mycursor.execute("SELECT nome FROM nazione WHERE nome='"+nazione+"'")
    risNazione = mycursor.fetchall()
    mycursor.execute("SELECT codice FROM ubicazione WHERE codice='"+codUbicazione+"'")
    risCod = mycursor.fetchall()
    mycursor.execute("SELECT email FROM cliente WHERE email='"+email+"'")
    checkEmail = mycursor.fetchall()
    if checkEmail:
        flagEmail = True
        while flagEmail:
            email= input("Email non valida! Riprova: ")
            mycursor.execute("SELECT email FROM cliente WHERE email='"+email+"'")
            checkEmail = mycursor.fetchall()
            if not checkEmail:
                flagEmail= False
    if risCod:
        flagCod = True
        while flagCod:
            add = ""+str(random.randint(0, 99))
            mycursor.execute("SELECT codice FROM ubicazione WHERE codice='"+codUbicazione+add+"'")
            risCod = mycursor.fetchall()
            if not risCod:
                codUbicazione = codUbicazione+add
                flagCod= False
    if not risNazione:
        sqlIntoNazione = "INSERT INTO nazione  VALUES (%s)"
        valNazione = [(nazione)]
        mycursor.execute(sqlIntoNazione, valNazione)
    sqlIntoUbicazione =  "INSERT INTO ubicazione VALUES (%s,%s,%s,%s,%s,%s)"
    valUbicazione = [(codUbicazione), (nomecitta),(nomevia),(cap),(numerocivico),(nazione)]
    mycursor.execute(sqlIntoUbicazione, valUbicazione)
    if (telefono != 0):
        sqlIntoCliente = "INSERT INTO cliente VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        valCliente = [(email),(nome),(cognome),(datanascita),(numerocarta),(scadenza),(codicecvv),(telefono),(codUbicazione),(password)]
    else:
        sqlIntoCliente = "INSERT INTO cliente(email,nome,cognome,datanascita,numerocarta,datascadenza,codicecvv,ubicazione,password) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        valCliente = [(email),(nome),(cognome),(datanascita),(numerocarta),(scadenza),(codicecvv),(codUbicazione),(password)]
    mycursor.execute(sqlIntoCliente, valCliente)
    connection.commit()
    return email
#####################################################################################################################
def vecchioCliente(connection):
    print("\n")
    print("Benvenuto/a, Inserisci le credenziali di accesso")
    email = input("Inserisci email= ")
    password = input("Inserisci password= ")
    mycursor = connection.cursor()
    mycursor.execute("SELECT email, password FROM cliente WHERE email='"+email+"' and password='"+password+"'")
    risLogin = mycursor.fetchall()
    if risLogin:
        print("#############################################")
        print("Benvenuto/a! ")
    else:
        fLogin = True
        while fLogin:
            print("Credenziali errati, riprova")
            email = input("Inserisci email= ")
            password = input("Inserisci password= ")
            mycursor = connection.cursor() 
            mycursor.execute("SELECT email, password FROM cliente WHERE email='"+email+"' and password='"+password+"'")
            risLogin = mycursor.fetchall()
            if risLogin:
                print("#############################################")
                print("Benvenuto/a! ")
                fLogin = False
    return email



def validaInput(tipo, valore):
    if tipo=="int":
        try:
            a = int(valore)
            return True
        except:
            print("Valore errato, inserire numeri!")
            return False
    elif tipo =="data":
        try:
            a = int(valore[:4])
            a = int(valore[5:7])
            a = int(valore[8:])
            return True
        except:
            print("Valore errato, inserire la data nel formato corretto!")
            return False
    elif tipo =="double":
        try:
            a = float(valore)
            return True
        except:
            print("Valore errato, inserire numeri!")
            return False
   