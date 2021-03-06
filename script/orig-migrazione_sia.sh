#!/bin/bash

#
# Ambiente di interrogazione del DB
#
#     B.d.S - 28 Ago 2020
#

# Note
#
#   Lanciare lo script dalla cartella "script"
#

source preloadQuery.sh
source dbDriver.sh
source exportDataBase.sh

USER="root"
PSW="root"
DATABASE_NAME="migrazioni"

QUERY_TO_SEND=""

TIPO_FEMSWS="FEMSWS"
TIPO_FEMSMQ="FEMSMQ"
TIPO_JAVAMQ="JAVAMQ"
TIPO_CICSMQ="CICSMQ"
TIPO_FIRE="FIRE"
TIPO_JAVAMQT2S="JAVAMQT2S"
TIPO_JAVAMQT2SG="JAVAMQT2SG"

SERVER="%"
ISTANZA="%"
TIPO_IST="%"
NOTE="%"

PASS=( $SERVER $ISTANZA $TIPO_IST $NOTE )

HTML=0


################################################
prePrint () {
 echo
 echo
 echo "####################################################################"
 
}

postPrint () {

  echo "####################################################################"
  echo
  echo
}

printUsage () {

   echo ""
   echo ""
   echo "#########################################################################################"
   echo "   Tool Migrazioni - v. 1.0"
   echo ""
   echo "         descrizione delle funzionalità"
   echo ""
   echo "##########################################################################################"
   echo ""
   echo " -a: Stampa tutte le tabelle del Database migrazioni"
   echo " -d [TABLE NAME]: Descrive la tabella passata in argomento"
   echo " -c Inserisce una operazione di check istance"
   echo "      use:  migrazione_sia -T 2 -I P0001  -N \"Nota da mettere\" -S SITOA -c"
   echo ""
   echo " -n Inserisce una nota delle anagrafiche dei server"
   echo "      use:  migrazione_sia -S SITOA  -N \"Nota da mettere\"  -n"
   echo ""
   echo " -f [SQL QUERY] : Consente di passare una query free in formato sql"
   echo " -l [Cod] : Consente di lanciare una ricerca precaricata. "
   echo "            Passando il codice 0 si visualizza la lista di tutte le ricerche caricate"
   echo "-------------------------------------------------------------------------------------------"
   echo " -S [SERVER] : Consente di passare il nome del server"
   echo " -I [ISTANZA]: Consente di passare il nome della istanza"
   echo " -T [TIPO ISTANZA]: Consente di passare il tipo di istanza:"
   echo "                    1. FEMSWS"
   echo "                    2. FEMSMQ"
   echo "                    3. JAVAMQ"
   echo "                    4. FIRE"
   echo "                    5. CICSMQ"
   echo "                    6. JAVAMQT2S"
   echo "                    7. JAVAMQT2SG"
   echo " -N [NOTA]: Consente di passare delle note"
   echo ""
   echo "-------------------------------------------------------------------------------------------"
   echo " -H: Export della query in formato HTML"
   echo "-------------------------------------------------------------------------------------------"
   echo " -B: Backup dell'intero database. "
   echo " -E: Esporta in formato sql le tabelle interne. "
   echo " -W: ReWrite delle tabelle interne. "
   echo " -U: Aggiornamento delle tabelle del DataBase con i nuovi file Esterni. "
   echo "-------------------------------------------------------------------------------------------"
   echo ""
   echo ""
}

printList () {
   echo "------------------------------------------------------------------------------------------"
   echo "0101: Ricerca libera di tutto da Elenco_Server_Listafinale per tipo, istanza e server partenza"
   echo "0102: Macchine presenti nelle due tabelle ListaFinale ServerPartenza) e 2016 (macchina)"
   echo "0103: Istanze migrate e situazione macchine da buttare"
   echo "0104: Lista delle istanze fatte per server di partenza"
   echo "0105: Lista delle istanze fatte per server di arrivo"
   echo "0106: Lista delle istanze fatte con server di arrivo(da buttare), partenza e check"
   echo "0107: Lista delle istanze da eliminare e check (ServerArrivo=ServerPartenza da buttare)"
   echo "0110: Mostra la tabella DaButtare, possibile filtro per server"
   echo "0151: Mostra le istanze da migrare su nuovo server da definire con filtro su server partenza"
   echo "0152: Mostra le istanze da migrare su nuovo server da definire con filtro su server arrivo"
   echo "0155: Mostra la istanza e server FemsWS su YANG corrispondenti con filtro ad un istanza o server di partenza"
   echo "0156: Mostra la istanza e server FemsWS su YANG corrispondenti con filtro ad un istanza o server di arrivo"
   echo "0157: Mostra la istanza e server FIRE su YANG corrispondenti ad un istanza o server di partenza"   
   echo "0159: Mostra la istanza e server su TANGRAM con filtri"
   echo "0161: Mostra tutte le istanze e stato con filtri da tabella listafinale"
   echo "0162: Mostra tutte le istanze e stato con filtri da tabella 2016"
   echo "0165: Mostra tutte le istanze presenti sia nella tabella listafinale che 2016 con filtro per ServerPartenza"
   echo "0166: Mostra tutte le istanze presenti sia nella tabella listafinale che 2016 con filtro per macchina 2016"
   echo "------------------------------------------------------------------------------------------"
   echo "0201: Recupera tutte le info sulle macchine di Test"
   echo "0205: Recupera tutte le info sulle macchine di Test con commenti"
   echo "0210: Situazione macchine di test con macchine eliminate"
   echo "------------------------------------------------------------------------------------------"
   echo "0301: Lista la tabella dei check istanze"
   echo "------------------------------------------------------------------------------------------"
   echo ""
   echo ""
}


queryCommon () {
   echo "HTML=${HTML}"
   
   if [[ $HTML -eq 1 ]]
   then
       QUERY_TO_SEND="mysql -H -u${USER} -p${PSW} ${DATABASE_NAME} -e "   
   else
 
       QUERY_TO_SEND="mysql -u${USER} -p${PSW} ${DATABASE_NAME} -e "
   fi
   #echo ${QUERY_TO_SEND}
}

listAllTable () {
   QUERY_TO_SEND="${QUERY_TO_SEND} \"show tables\""
    #echo ${QUERY_TO_SEND}
}

descTable () {
   TABLE="$@"
   QUERY_TO_SEND="${QUERY_TO_SEND} \"describe ${TABLE}\""
}

freeQuery () {
   FREE_QUERY="$@"
   echo "Passato: ${FREE_QUERY}"
   QUERY_TO_SEND="${QUERY_TO_SEND} \"$FREE_QUERY\""
   echo "${QUERY_TO_SEND}"
}


updateDB (){
   echo "Aggiornamento del DB"
   
   #Effettua il backup del DB
   backupDB
   
   #Salva le tabelle interne
   exportInternalTables
   
   #Creazione del database
   ./createDatabase.sh
   
   #Aggiornamento delle tabelle esterne
   ./loadDatabase.sh
   
   #ReWrite delle tabelle interne
   reWriteInternal
}

exportInternalTables (){
   echo "Esportazione delle tabelle interne del DB"
   
   #Esportazione delle tabelle
   exportCheckIstanzeTable
   exportNoteServerTable 
}

backupDB (){
   echo "BackUp del Database"
   backupDatabase
}

reWriteInternal(){
    echo "Riscrittura delle tabelle interne del DB"
    reWriteCheckIstanzeTable
    reWriteNoteServerTable
}




###############################################
#   MAIN
###############################################
PAR="$@"



while getopts "acnd:f:hHl:S:I:T:N:UBEW" arg; do
  case $arg in
    H)
      HTML=1
      echo "Set HTML MODE=${HTML}"
      ;;
    a)
      queryCommon
      listAllTable
      prePrint
      echo " Lista di tutte le tabelle "
      postPrint
      eval ${QUERY_TO_SEND}
      break
      ;;
    d)
      TABLENAME="$OPTARG"
      queryCommon
      descTable ${TABLENAME}
      prePrint
      echo "Descrizione della Tabella: $TABLENAME"
      postPrint
      eval ${QUERY_TO_SEND}
      break
      ;;
    f)      
      FREEQ="$OPTARG"
      queryCommon
      freeQuery "${FREEQ}"
      prePrint
      echo "Esecuzione della query libera"
      postPrint
      eval "${QUERY_TO_SEND}"
      break
      ;;
    c)
      insertCheckInstance ${SERVER} ${ISTANZA} ${TIPO_IST} "${NOTA}"
      break
      ;;
    n)
      insertServerNote ${SERVER} "${NOTA}"
      break
      ;;
    h)
      printUsage
      break
      ;;
    l)
      OPT="$OPTARG"

      #if [[ $OPT -eq 0 ]]
      if [ $OPT -eq 0 ]
      then
         prePrint
         echo "   Lista delle Query Precaricate"
         postPrint
         printList
      else
        queryCommon
        SQLCOMMAND=$( getSqlCommand $OPT $SERVER $ISTANZA $TIPO_IST $NOTE )
        QUERY_TO_SEND="${QUERY_TO_SEND}\"${SQLCOMMAND}\""
        eval ${QUERY_TO_SEND}
      break
      fi
      break
      ;;
    S)
      SERVER="$OPTARG"
      echo "Inserimento per server: ${SERVER}"
      #break
      ;;
    T)
      TIPO_IST="$OPTARG"
      echo "Tipo Istanza: ${TIPO_IST}"
      case $TIPO_IST in
         1)
            TIPO_IST=${TIPO_FEMSWS}
            echo "Istanza: ${TIPO_FEMSWS}"
            #break
            ;;
         2)
            TIPO_IST=${TIPO_FEMSMQ}
            echo "Istanza: ${TIPO_FEMSMQ}"
            #break
            ;;
         3)
            TIPO_IST=${TIPO_JAVAMQ}
            echo "Istanza: ${TIPO_JAVAMQ}"
            #break
            ;;
         4)
            TIPO_IST=${TIPO_FIRE}
            echo "Istanza: ${TIPO_FIRE}"
            #break
            ;;
         5)
            TIPO_IST=${TIPO_CICSMQ}
            echo "Istanza: ${TIPO_CICSMQ}"
            #break
            ;;
         6)
            TIPO_IST=${TIPO_JAVAMQT2S}
            echo "Istanza: ${TIPO_JAVAMQT2S}"
            #break
            ;;
         7)
            TIPO_IST=${TIPO_JAVAMQT2SG}
            echo "Istanza: ${TIPO_JAVAMQT2SG}"
            #break
            ;;
          *) 
            echo ""
            echo "*******************************************"
            echo "** Istanza: ${TIPO_IST} NON RICONOSCIUTA"
            echo "*******************************************"
            exit
      esac
      #break
      ;;
    I)
      ISTANZA="$OPTARG"
      echo "Inserimento Istanza: ${ISTANZA}"
      #break
      ;;
    N)
      NOTA="$OPTARG"
      echo "Inserimento Nota: ${NOTA}"
      #break
      ;;
    E)
      exportInternalTables
      break
      ;;
    B)
      backupDB
      break
      ;;
    U)
      updateDB
      break
      ;;
    W)
      reWriteInternal
      break
      ;;
    *)
      printUsage
      break
      ;;
  esac
done

if [ -z "$PAR"  ]
then
   printUsage
fi







