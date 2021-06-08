import mysql.connector
from tabulate import tabulate
from mysql.connector import errorcode
import GestioneUtente 
connection = mysql.connector.connect(user='root', password='spizzuoco', host='localhost',database="deliveryfilm")

#####################################################################################################################
def main():

    ingresso = input("Premi 1 se sei nuovo/a, 2 sei hai già un account, 3 se sei amministratore, tasto qualsiasi per uscire ")
    if ingresso == "1":
        email = GestioneUtente.nuovoCliente(connection)
        print("#############################################")
        print("Registrazione effettuata con successo! Benvenuto/a")
    elif ingresso == "2":
        email = GestioneUtente.vecchioCliente(connection)
    elif ingresso == "3":
        areaAmministratore()
        return
    else:
        return

    if ingresso!= 3:
        f=True
        while f:
            azione = input("Digita 1 se vuoi cercare un prodotto\n \
      2 per visualizzare il tuo profilo\n \
      3 per recensire un prodotto\n \
      tasto qualsiasi per uscire: ")
            if azione == "1":
                cerca(email)
            elif azione == "2":
                profilo(email)
            elif azione == "3":
                mycursor = connection.cursor()
                mycursor.execute("SELECT p.codice,p.titolo FROM acquisto as a, prodottovideo as p WHERE a.prodottovideo=p.codice and cliente='"+email+"'")
                acq = mycursor.fetchall()
                mycursor.execute("SELECT p.codice,p.titolo FROM noleggio as n, prodottovideo as p WHERE n.prodottovideo=p.codice and  cliente='"+email+"'")
                nol =mycursor.fetchall()
                rec = acq + nol
                c=0
                for i in rec:
                    c+=1
                    tupla =(c,)
                    tuplApp = i + tupla
                    rec[c-1] = tuplApp
                
                if rec:
                    print(tabulate([x[1:] for x in rec], headers=['Titolo','Cod'], tablefmt='psql'))
                    prod = input("Digita il numero corrispondente alla riga del prodotto  (Colonna Cod): ")
                    if not GestioneUtente.validaInput("int",prod):
                        prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
                        while not GestioneUtente.validaInput("int",prod):
                            prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
                    prod = int(prod)
                    while prod<0 or prod>c:
                        print("Valore errato! Riprova! ")
                        prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
                        if not GestioneUtente.validaInput("int",prod):
                            prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
                            while not GestioneUtente.validaInput("int",prod):
                                prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
                        prod = int(prod)
                    prod = rec[prod-1]
                    prod = prod[0]
                    f = True
                    recensione(email,prod,f)
                else:
                    print("Non puoi recensire niente")
            else:
                print("Disconessione riuscita!")
                f=False
#####################################################################################################################
def cerca(email):
    f=True
    while f:
        azione=input("Digita 1 se vuoi cercare tramite parole chiavi\n \
      2 se vuoi applicare filitri di ricerca\n\
       3 se vuoi visualizzare tutto il catalogo\n \
      tasto qualsiasi per uscire: ")
        if azione!="2" and azione!="1" and azione!="3": #esci e torna al main
            return 
        elif azione=="1": #digitare chiavi di ricerca
            chiavi = input("Inserisci valori di ricerca: ")
            sql="SELECT p.codice, p.titolo, p.prezzoacquisto, p.prezzonoleggio \
                FROM prodottovideo as p \
                WHERE p.titolo LIKE '%"+chiavi+"%' or p.trama LIKE '%"+chiavi+"%' or p.genere LIKE '%"+chiavi+"%' \
                UNION \
                SELECT p.codice,p.titolo, p.prezzoacquisto, p.prezzonoleggio \
                FROM prodottovideo as p, diretto as d, regista as r \
                WHERE p.codice=d.prodottovideo AND d.regista=r.codice AND nome LIKE '%"+chiavi+"%' or cognome LIKE '%"+chiavi+"%' \
                UNION \
                SELECT p.codice,p.titolo, p.prezzoacquisto, p.prezzonoleggio \
                FROM prodottovideo as p, attore as a, recita as r \
                WHERE p.codice=r.prodottovideo AND r.attore=a.codice AND nome LIKE '%"+chiavi+"%' or cognome LIKE '%"+chiavi+"%' "
            f=False
            pass 
        elif azione=="2": #filtri di ricerca
            filtro = input("Digita 1 se vuoi cercare solo per Serie TV\n \
      2 se vuoi cercare solo per Film\n \
      3 se vuoi cercare per genere\n \
      4 se vuoi cercare per nazionalità: ")
            while filtro!="1" and filtro!="2" and filtro!="3" and filtro!="4":
                print("Valore errato, riprova!")
                filtro = input("Digita 1 se vuoi cercare solo per Serie TV\n \
      2 se vuoi cercare solo per Film\n \
      3 se vuoi cercare per genere\n \
      4 se vuoi cercare per nazionalità: ")
            if filtro=="1": #serie tv
                sql = "SELECT codice, titolo, prezzoacquisto, prezzonoleggio FROM prodottovideo WHERE tipo='serie'"
            elif filtro=="2": #film
                sql = "SELECT codice, titolo, prezzoacquisto, prezzonoleggio FROM prodottovideo WHERE tipo='film'"
            elif filtro=="3": #genere
                genere = input("Inserisci genere: ")
                sql = "SELECT codice,titolo, prezzoacquisto, prezzonoleggio \
                FROM prodottovideo \
                WHERE genere='"+genere+"'"
            elif filtro=="4": #nazionalità
                nazio = input("Inserisci nazionalità: ")
                sql = "SELECT codice,titolo, prezzoacquisto, prezzonoleggio \
                FROM prodottovideo as p, prodottoIn as pI \
                WHERE p.codice=pi.prodottovideo AND pi.nazione='"+nazio+"'"
            f=False
        elif azione=="3": #visualizza tutto catalogo
            sql = "SELECT codice,titolo, prezzoacquisto, prezzonoleggio FROM prodottovideo"
            f=False
        else:
            print("Valore non valido, riprova.")
    mycursor = connection.cursor()
    mycursor.execute(sql)
    ris = mycursor.fetchall()
    c=0
    for i in ris:
        c+=1
        tupla =(c,)
        tuplApp = i + tupla
        ris[c-1] = tuplApp
    if ris:
        print(tabulate([x[1:] for x in ris], headers=['Titolo', 'Prezzo acquisto', 'Prezzo Noleggio','Cod'], tablefmt='psql'))
        azione=input("Digita 1 se vuoi acquistare/noleggiare uno di questi prodotti\n \
      2 se vuoi vedere o lasciare una recensione\n\
       3 se vuoi visualizzare tutte le informazioni\n \
      tasto qualsiasi per uscire: ")
        if azione!="1" and azione!="2" and azione!="3":
            return
        prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
        if not GestioneUtente.validaInput("int",prod):
            prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
            while not GestioneUtente.validaInput("int",prod):
                prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
        prod = int(prod)
        while prod<0 or prod>c:
            print("Valore errato! Riprova! ")
            prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
            if not GestioneUtente.validaInput("int",prod):
                prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
                while not GestioneUtente.validaInput("int",prod):
                    prod = input("Digita il numero corrispondente alla riga del prodotto (Colonna Cod): ")
            prod = int(prod)
        prod = ris[prod-1]
        prod = prod[0]
        if azione=="1":
            acquisto(email,prod)
        elif azione=="2":
            recensione(email,prod)
        elif azione=="3":
            tutteInfo(email,prod)
    else:
        print("La ricerca non ha prodotto risultati! ")
#####################################################################################################################
def acquisto(email,prod):
    acqONol = input("Digita 1 per acquistare 2 per noleggiare: ")
    while acqONol!="1" and acqONol!="2":
        print("Valore errato, riprova!")
        acqONol = input("Digita 1 per acquistare 2 per noleggiare: ")
    if acqONol=="1": #acquisto
        formato=input("Digita 1 per acqistare la copia fisica, 2 per la versione digitale: ")
        while formato!="1" and formato!="2":
            print("Valore errato, riprova!")
            formato=input("Digita 1 per acqistare la copia fisica, 2 per la versione digitale: ")
        if formato=="1": #acquisto fisico
            sql = "INSERT INTO acquisto VALUES (default,'"+email+"','"+prod+"','fisico')"
        elif formato=="2": #acqiusto digitale
                    sql = "INSERT INTO acquisto VALUES (default,'"+email+"','"+prod+"','digitale')"
    elif acqONol=="2": #noleggio
        sql = "INSERT INTO noleggio VALUES (default,'"+email+"','"+prod+"',current_date(),current_date()+ interval 20 day)"
    try:
        mycursor = connection.cursor()
        mycursor.execute(sql)
        connection.commit()
        print("####################################Eseguito con Successo!#################################")
    except mysql.connector.Error:
        print("Qualcosa è andato storto! ")
#####################################################################################################################
def recensione(email,prod,flag=False):
    if flag:
        rece="1"
    else:
        sql="SELECT votostelle, recensionetestuale FROM recensione WHERE prodottovideo='"+prod+"'"
        mycursor = connection.cursor()
        mycursor.execute(sql)
        ris = mycursor.fetchall()
        print(tabulate(ris, headers=['Voto in Stelle', 'Recensione'], tablefmt='psql'))
        rece = input("Digita 1 se vuoi lasciare una recensione\n \
      2 per acquistare o noleggiare il prodotto\n \
      tasto qualsiasi per uscire: ")
    if rece=="1":
        votostelle = input("Inserisci il voto in stelle (0-5): ")
        f=True
        while f:
            if votostelle=="0" or votostelle=="1" or votostelle=="2" or votostelle=="3" or votostelle=="4" or votostelle=="5":
                f=False
            else:
                print("Valore errato, inserisci un numero da 0 a 5! ")
                votostelle = input("Inserisci il voto in stelle (0-5): ")
        recensionetext = input("Inserisci la recensione: ")
        sql = "INSERT INTO recensione VALUES("+votostelle+",'"+recensionetext+"','"+email+"','"+prod+"')"
        mycursor = connection.cursor()
        try:
            mycursor.execute(sql)
            connection.commit()
            print("####################################Eseguito con Successo!#################################")
        except:
            if flag:
                print("Prodotto già recensito! Non puoi lasciare un'altra recensione.")
            else:
                print("Devi possedere il prodotto per poterlo recensire!")
    elif rece=="2":
        acquisto(email,prod)
#####################################################################################################################
def tutteInfo(email,prod):
    mycursor = connection.cursor()
    mycursor.execute("SELECT titolo, prezzoacquisto, prezzonoleggio, genere, tipo, duratamin, annopubblicazione FROM prodottovideo WHERE codice ='"+prod+"'")
    ris = mycursor.fetchall()
    mycursor.execute("SELECT nome, cognome FROM diretto as d, regista as r WHERE d.regista=r.codice and d.prodottovideo='"+prod+"'") #tutti attori registi casaprod
    risRe = mycursor.fetchall()
    mycursor.execute("SELECT nome, cognome FROM recita as r, attore as a WHERE r.attore=a.codice and r.prodottovideo='"+prod+"'") #tutti attori registi casaprod
    risAtt = mycursor.fetchall()
    mycursor.execute("SELECT votostelle, recensionetestuale FROM recensione as r WHERE r.prodottovideo='"+prod+"'") #tutti attori registi casaprod
    risRec = mycursor.fetchall()
    mycursor.execute("SELECT nome FROM prodottoda as pc, casaproduttrice as c WHERE pc.casaproduttrice=c.codice and pc.prodottovideo='"+prod+"'") #tutti attori registi casaprod
    risCasa = mycursor.fetchall()
    mycursor.execute("SELECT nome FROM prodottoin as pi, nazione as n WHERE pi.nazione=n.nome and pi.prodottovideo='"+prod+"'") #tutti attori registi casaprod
    risNaz = mycursor.fetchall()
    print(tabulate(ris, headers=['Titolo', 'Prezzo acquisto', 'Prezzo Noleggio','Tipo','Genere','Durata','Anno di pubblicazione'], tablefmt='psql'))
    print("##########Attori########")
    print(tabulate(risAtt, headers=['Nome', 'Cognome'], tablefmt='psql'))
    print("#########Registi#######")
    print(tabulate(risRe, headers=['Nome', 'Cognome'], tablefmt='psql'))
    print(tabulate(risRec, headers=['Voto in Stelle', 'Recensione'], tablefmt='psql'))
    print(tabulate(risCasa, headers=['Casa Produttrice'], tablefmt='psql'))
    print(tabulate(risNaz, headers=['Nazione'], tablefmt='psql'))
    azione = input("Digita 1 se vuoi acquistare o noleggiare il prodotto, tasto qualsiasi per uscire: ")
    if azione=="1":
        acquisto(email,prod)
#####################################################################################################################
def profilo(email):
    mycursor = connection.cursor()
    mycursor.execute("SELECT nome FROM cliente WHERE email='"+email+"'")
    nome = mycursor.fetchall()
    nome = nome[0] 
    nome = nome[0]
    print("####### Ciao "+nome+"! ########")
    azione = input("Digita 1 se vuoi vedere le tue informazioni\n \
      2 per vedere i prodotti acquistati/noleggiati\n \
      tasto qualsiasi per uscire: ")
    if azione=="1":
        mycursor = connection.cursor()
        mycursor.execute("SELECT email, nome, cognome, datanascita, numerocarta, datascadenza, codicecvv, telefono FROM cliente WHERE email='"+email+"'")
        info = mycursor.fetchall()
        mycursor.execute("SELECT nomecitta, nomevia, numerocivico, cap, nazione FROM cliente as c, ubicazione as u WHERE c.ubicazione=u.codice AND email='"+email+"'")
        ubi =mycursor.fetchall()
        print(tabulate(info, headers=['Email', 'Nome', 'Cognome','Data di nascita','Numero carta','Scadenza carta','Codice cvv', 'Telefono'], tablefmt='psql'))
        print("##########Ubicazione########")
        print(tabulate(ubi, headers=['Città', 'Via', 'Civico', 'Cap', 'Nazione'], tablefmt='psql'))
    elif azione == "2":
        mycursor = connection.cursor()
        mycursor.execute("SELECT p.titolo FROM acquisto as a, prodottovideo as p WHERE a.prodottovideo=p.codice and cliente='"+email+"'")
        acq = mycursor.fetchall()
        mycursor.execute("SELECT p.titolo, n.finenoleggio FROM noleggio as n, prodottovideo as p WHERE n.prodottovideo=p.codice and cliente='"+email+"'")
        nol =mycursor.fetchall()
        if acq:
            print(tabulate(acq, headers=['Prodotto video'], tablefmt='psql'))
        if nol:
            print(tabulate(nol, headers=['Prodotto video', 'Fine noleggio'], tablefmt='psql'))
#####################################################################################################################       
def areaAmministratore():
    f=True
    while f:
        azione = input("Digita 1 per aggiungere un prodotto video\n \
      2 per vedere le analisi del sistema\n \
      tasto qualsiasi per uscire: ")
        if azione!="1" and azione!="2":
            f=False
        elif azione=="1":
            aggiungiProdotto()
        elif azione=="2":
            analisi()
#####################################################################################################################
def analisi():
    print("Benvenuto nell'area di analisi! ")
    f=True
    while f:
        azione = input("Digita 1 per vedere le analisi su acquisti/noleggi dei clienti\n \
      2 per le analisi sui prodotti video\n \
      3 per le analisi sulle case produttrice\n \
      4 per le analisi sulla ditta di consegne\n \
      tasto qualsiasi per uscire: ")
        if azione=="1":
            analisiCli()
        elif azione=="3":
            analisiCas()
        elif azione=="4":
            analisiDit()
        elif azione=="2":
            analisiProd()
        else:
            return 
#####################################################################################################################
def analisiProd():
    mycursor = connection.cursor()
    print("Media recensioni per prodotto")
    mycursor.execute("select titolo, avg(votostelle) as Media \
from prodottovideo as p, recensione as r \
where p.codice=r.prodottovideo \
group by r.prodottovideo")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Prodotto', 'Media'], tablefmt='psql'))
    num = input("Digita un numero per visualizzare i Registi e il rispettivo film che hanno meno attori memorizzati:")
    mycursor.execute("select r.codice, p.Titolo \
from prodottovideo as p, diretto as d, regista as r \
where p.codice=d.prodottovideo and \
           d.regista=r.codice and "+num+ "> (select count(*) \
				       from recita as r \
			                   where p.codice = r.prodottovideo)")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Regista', 'Titolo'], tablefmt='psql'))
    print("Nazione con più attori nel sistema")
    mycursor.execute("select nazione \
from attoripernazione as a1 \
where totale>=All(select totale from attoripernazione)")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Nazione'], tablefmt='psql'))
    print("Attore che compare in tutti i film delle saghe nel sistema ")
    mycursor.execute("select distinct a.nome, a.attore \
from attoriinsaga as a \
where a.attore in (select a2.attore \
      from attoriinsaga as a2 \
      where a.saga=a2.saga and a.film!=a2.film) ")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Saga','Attore'], tablefmt='psql'))
    print("Numero di episodi per ogni serie Tv ")
    mycursor.execute("select p.titolo, count(*) \
from prodottovideo as p, stagione as s, episodio as e \
where p.codice=s.prodottovideo and s.nome=e.nomestagione \
group by p.codice ")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Titolo','Numero episodi'], tablefmt='psql'))
#####################################################################################################################
def analisiDit():
    mycursor = connection.cursor()
    print("Prezzo medio delle consegne per ogni ditta: ")
    mycursor.execute("select d.nome, avg(p.prezzoacquisto) as prezzoMedio \
from dittaconsegne as d, impiegato as i, consegna as c, prodottovideo as p \
where i.dittaconsegne=d.nome and i.codicefiscale=c.impiegato \
           and c.prodottovideo=p.codice \
group by d.nome")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Ditta', 'Media'], tablefmt='psql'))
    print("Per ogni impiegato il cliente a cui ha effettuato il maggior numero di consegne: ")
    mycursor.execute("select cv.codicefiscale, cv.ubicazione, cliente.email \
from consegnaperimpiegato as cv, cliente \
where cliente.ubicazione=cv.ubicazione and \
num>=ALL(select num \
		       from consegnaperimpiegato \
                               where cv.codicefiscale=codicefiscale)")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Impiegato', 'Ubicazione','Cliente'], tablefmt='psql'))
#####################################################################################################################    
def analisiCas():
    mycursor = connection.cursor()
    mycursor.execute("select c.nome, avg(r.votostelle) \
    from casaproduttrice as c, recensione as r, prodottoda as pd, prodottovideo as p \
        where c.codice=pd.casaproduttrice and pd.prodottovideo=p.codice \
            and p.codice=r.prodottovideo \
        group by c.codice")
    ris = mycursor.fetchall()
    print("Media dei voti per ogni casa produttrice")
    print(tabulate(ris, headers=['Casa', 'Media (1-5)'], tablefmt='psql'))
    print("Case produttrice che hanno i prezzi più bassi in base al tipo di prodotto: ")
    mycursor.execute("select nome \
                        from mediapercasa \
                        having min(AvgPrezzoAcqu) \
                        union \
                        select nome \
                        from mediapercasa \
                        having min(AvgPrezzoNol) ")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Casa'], tablefmt='psql'))
    print("Durata degli episodi presenti nel sistema per ogni casa:")
    mycursor.execute("select c.nome, sum(e.duratamin) as totaleMin \
from casaproduttrice as c, prodottoda as pd, prodottovideo as p, stagione as s,episodio as e \
where c.codice=pd.casaproduttrice and pd.prodottovideo=p.codice \
           and p.codice=s.prodottovideo and e.nomestagione=s.nome \
group by c.codice")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Casa','Totle minuti'], tablefmt='psql'))
#####################################################################################################################
def analisiCli():
    mycursor = connection.cursor()
    sql = "select email, sum(totale) from SpesePerCliente group by email"
    mycursor.execute(sql)
    ris = mycursor.fetchall()
    print("Spese totale di ogni cliente")
    print(tabulate(ris, headers=['Email Cliente', 'Spesa Totale'], tablefmt='psql'))
    vot = input("Digita il voto in stelle per controllare quanti cliente hanno acquistato/noleggiato prodotti con recensioni minori: ")
    mycursor.execute("select c.* \
                            from cliente as c, acquisto as a\
                            where c.email=a.cliente and \
                            a.prodottovideo in (select p.codice\
                                            from prodottovideo as p, recensione as r \
                                where p.codice=r.prodottovideo and \
                                p.codice in (select r1.prodottovideo \
                                                        from recensione as r1\
                                                        group by r1.prodottovideo\
                                                        having avg(r1.votostelle)<"+vot+"))")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Email', 'Nome', 'Cognome','Data di nascita','Numero carta','Scadenza carta','Codice cvv', 'Telefono','Cod Ubicazione','Password'], tablefmt='psql'))
    print("Nazionalità più frequente di attori per cliente: ")
    mycursor.execute("select f.nazione, c.email\
                            from frequenzapercliente as f, cliente as c\
                            where f.email = c.email and numero>=All(select numero \
                             from frequenzapercliente \
                            where email=c.email)")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Nazione', 'Cliente'], tablefmt='psql'))
    dat = input("Digita una data per vedere se ci sono film acquistati solo da clienti più grandi(YYYY-MM-DD): ")
    if not GestioneUtente.validaInput("data",dat):
        dat = input("Digita una data per vedere se ci sono film acquistati solo da clienti più grandi(YYYY-MM-DD): ")
        while not GestioneUtente.validaInput("data",dat):
            dat = input("Digita una data per vedere se ci sono film acquistati solo da clienti più grandi(YYYY-MM-DD): ")
    mycursor.execute("select p.Titolo \
                        from prodottovideo as p \
                    where p.tipo='film' and \
                    not exists (select * \
           	        from acquisto as a, cliente as c \
		            where p.codice=a.prodottovideo and a.cliente=c.email \
                and c.datanascita<'"+dat+"')")
    ris = mycursor.fetchall()
    print(tabulate(ris, headers=['Titolo'], tablefmt='psql'))
#####################################################################################################################
def aggiungiProdotto():
    mycursor = connection.cursor()
    codice = input("Inserisci codice: ")
    titolo = input("Inserisci titolo: ")
    anno  = input("Inserisci anno di pubblicazione(YYYY-MM-DD): ")
    if not GestioneUtente.validaInput("data",anno):
        anno = input("Inserisci anno di pubblicazione(YYYY-MM-DD): ")
        while not GestioneUtente.validaInput("data",anno):
            anno = input("Inserisci anno di pubblicazione(YYYY-MM-DD): ")
    trama = input("Inserisci trama: ")
    prezzoacquisto = input("Inserisci prezzo acquisto (XX.XX): ")
    if not GestioneUtente.validaInput("double",prezzoacquisto):
        prezzoacquisto = input("Inserisci prezzo acquisto (XX.XX): ")
        while not GestioneUtente.validaInput("double",prezzoacquisto):
            prezzoacquisto = input("Inserisci prezzo acquisto (XX.XX): ")
    prezzoacquisto = int(prezzoacquisto)
    prezzonoleggio = float(input("Inserisci prezzo noleggio (XX.XX): "))
    if not GestioneUtente.validaInput("double",prezzonoleggio):
        prezzonoleggio = input("Inserisci prezzo noleggio (XX.XX): ")
        while not GestioneUtente.validaInput("double",prezzonoleggio):
            prezzonoleggio = input("Inserisci prezzo noleggio (XX.XX): ")
    prezzonoleggio = int(prezzonoleggio)
    f = True
    while f:
        tipo = input("Inserisci tipo (film/serie): ")
        if tipo=="film" or tipo=="serie":
            f=False
        else:
            print("Tipo sbagliato, riprova!")
    if tipo=="film":
        durata = int(input("Inserisci durata in minuti: "))
        if not GestioneUtente.validaInput("int",durata):
            durata = input("Inserisci durata in minuti: ")
            while not GestioneUtente.validaInput("int",durata):
                durata = input("Inserisci durata in minuti: ")
        durata = int(durata)
    genere = input("Inserisci genere: ")
    mycursor.execute("SELECT nome FROM genere WHERE nome='"+genere+"'")
    ris = mycursor.fetchall()
    if not ris:
        sql = "INSERT INTO genere VALUES('"+genere+"')"
        mycursor.execute(sql)
    if tipo=="film":
        sql = "INSERT INTO prodottovideo VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)"
        val = [(codice),(titolo),(anno),(trama),(prezzoacquisto),(prezzonoleggio),(tipo),(durata),(genere)]
    else:
        sql = "INSERT INTO prodottovideo(codice,titolo,annopubblicazione,trama,prezzoacquisto,prezzonoleggio,tipo,genere) VALUES (%s,%s,%s,%s,%s,%s,%s,%s)"
        val = [(codice),(titolo),(anno),(trama),(prezzoacquisto),(prezzonoleggio),(tipo),(genere)]
    mycursor.execute(sql,val)
    connection.commit()
    f = True
    print("Inserisci Attori")
    while f:
        attori(codice)
        az =input("Digita 1 per continuare, tasto qualsiasi per terminare: ")
        if az!="1":
            f=False
    f = True
    print("Inserisci Registi")
    while f:
        registi(codice)
        az =input("Digita 1 per continuare, tasto qualsiasi per terminare: ")
        if az!="1":
            f=False
    f = True
    print("Inserisci casa di produzione")
    while f:
        casaproduzione(codice)
        az =input("Digita 1 per continuare, tasto qualsiasi per terminare: ")
        if az!="1":
            f=False
    f = True
    print("Inserisci nazioni di produzione")
    while f:
        nazione(codice)
        az =input("Digita 1 per continuare, tasto qualsiasi per terminare: ")
        if az!="1":
            f=False
#####################################################################################################################         
def attori(codice=None):
    mycursor = connection.cursor()
    codiceA = input("Inserisci codice: ")
    nome = input("Inserisci nome: ")
    cognome  = input("Inserisci cognome: ")
    anno  = input("Inserisci anno di nascita(YYYY-MM-DD): ")
    if not GestioneUtente.validaInput("data",anno):
        anno = input("Inserisci anno di nascita(YYYY-MM-DD): ")
        while not GestioneUtente.validaInput("data",anno):
            anno = input("Inserisci anno di nascita(YYYY-MM-DD): ")
    nazione = input("Inserisci nazione: ")
    mycursor.execute("SELECT nome FROM nazione WHERE nome='"+nazione+"'")
    ris = mycursor.fetchall()
    if not ris:
        sql = "INSERT INTO nazione VALUES('"+nazione+"')"
        mycursor.execute(sql)
    sql = "INSERT INTO attore VALUES(%s,%s,%s,%s,%s)"
    val = [(codiceA),(nome),(cognome),(anno),(nazione)]
    mycursor.execute(sql,val)
    if codice!=None:
        sql ="INSERT INTO recita VALUES(%s,%s)"
        val =[(codice),(codiceA)]
        mycursor.execute(sql,val)
    connection.commit()
#####################################################################################################################
def registi(codice=None):
    mycursor = connection.cursor()
    codiceA = input("Inserisci codice: ")
    nome = input("Inserisci nome: ")
    cognome  = input("Inserisci cognome: ")
    anno  = input("Inserisci anno di nascita(YYYY-MM-DD): ")
    if not GestioneUtente.validaInput("data",anno):
        anno = input("Inserisci anno di nascita(YYYY-MM-DD): ")
        while not GestioneUtente.validaInput("data",anno):
            anno = input("Inserisci anno di nascita(YYYY-MM-DD): ")
    nazione = input("Inserisci nazione: ")
    mycursor.execute("SELECT nome FROM nazione WHERE nome='"+nazione+"'")
    ris = mycursor.fetchall()
    if not ris:
        sql = "INSERT INTO nazione VALUES('"+nazione+"')"
        mycursor.execute(sql)
    sql = "INSERT INTO regista VALUES(%s,%s,%s,%s,%s)"
    val = [(codiceA),(nome),(cognome),(anno),(nazione)]
    mycursor.execute(sql,val)
    if codice!=None:
        sql ="INSERT INTO diretto VALUES(%s,%s)"
        val =[(codice),(codiceA)]
        mycursor.execute(sql,val)
    connection.commit()
#####################################################################################################################
def casaproduzione(codice=None):
    mycursor = connection.cursor()
    codiceA = input("Inserisci codice: ")
    nome = input("Inserisci nome: ")
    sql = "INSERT INTO casaproduttrice VALUES(%s,%s)"
    val = [(codiceA),(nome)]
    mycursor.execute(sql,val)
    if codice!=None:
        sql ="INSERT INTO prodottoda VALUES(%s,%s)"
        val =[(codice),(codiceA)]
        mycursor.execute(sql,val)
    connection.commit()
#####################################################################################################################
def nazione(codice=None):
    mycursor = connection.cursor()
    nazione = input("Inserisci nazione: ")
    mycursor.execute("SELECT nome FROM nazione WHERE nome='"+nazione+"'")
    ris = mycursor.fetchall()
    if not ris:
        sql = "INSERT INTO nazione VALUES('"+nazione+"')"
        mycursor.execute(sql)
    if codice!=None:
        sql ="INSERT INTO prodottoin VALUES(%s,%s)"
        val =[(codice),(nazione)]
        mycursor.execute(sql,val)
    connection.commit()
#####################################################################################################################   
main()
connection.close()
