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

FASE_00="NUOVO_DA_CREARE"
FASE_01="NUOVO_w2016_OK"
FASE_02="NUOVO_FENG_OK"
FASE_03="NON_RAGG-NON_MIGR"
FASE_04="RAGGIUNG-NON_MIGR"
FASE_05="MIGRAZIONE_IN_CORSO"
FASE_06="MIGRATO_DA_AGGIORN."
FASE_07="NON_RAGG-MIGRATO"
FASE_08="RAGGIUNG-MIGRATO"
FASE_09="ELIMINATO_DA_COMUNIC"
FASE_10="ELIMINATO"
FASE_15="DISATER_RECOVERY"
FASE_20="RAGG_DA_ELIMINARE"
FASE_21="NON_RAGG_DA_ELIMINARE"


SERVER="%"
ISTANZA="%"
TIPO_IST="%"
NOTE="%"
IPA="%"
FASE_SRV="%"
EAS="%"

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
   echo ""
   echo " -s [VAL] : Imposta lo stato di un server aggiornando la data."
   echo "      use:  migrazione_sia -S [Server]  -F [Fase]  -s"
   echo ""
   echo " -i [VAL] : Imposta lo stato di una istanza aggiornando la data."
   echo "      use:  migrazione_sia -I [Istanza]  -F [Fase]  -i"
   echo ""
   echo "-------------------------------------------------------------------------------------------"
   echo " -S [SERVER] : Consente di passare il nome del server"
   echo " -A [IP_ADDRESS] : Consente di passare il valore IP Address del server"
   echo " -I [ISTANZA]: Consente di passare il nome della istanza"
   echo " -T [TIPO ISTANZA]: Consente di passare il tipo di istanza:"
   echo "                    1. FEMSWS"
   echo "                    2. FEMSMQ"
   echo "                    3. JAVAMQ"
   echo "                    4. FIRE"
   echo "                    5. CICSMQ"
   echo "                    6. JAVAMQT2S"
   echo "                    7. JAVAMQT2SG"
   echo " -E [EAS ID] : Consente di passare ll valore del EAS di riferimento"
   echo " -N [NOTA]   : Consente di passare delle note"
   echo " -F [FASE]   : I valori permessi sono: 00 Nuovo da Creare."
   echo "                                    01 Nuovo - w2016 PASSED."
   echo "                                    02 Nuovo - FENG PASSED."
   echo "                                    03 Non Raggiungibile da Migrare."
   echo "                                    04 Raggiungibile da Migrare."
   echo "                                    05 Migrazione in corso."
   echo "                                    06 Migrato da allineare con Tang/Yang."
   echo "                                    07 Non Raggiungibile Migrato."
   echo "                                    08 Raggiungibile Migrato."
   echo "                                    09 Eliminato - Da comunicare IT"
   echo "                                    10 Eliminato"
   echo "                                    15 Disater Recovery"
   echo "                                    20 Raggiungibile da Eliminare"
   echo "                                    21 Non Raggiungibile da Eliminare"
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
   echo "0100: Ricerca libera di tutto da Elenco_Server_Listafinale per tipo, istanza e server partenza"
   echo "0101: Ricerca libera di tutto da Elenco_Server_Listafinale per tipo, istanza e server arrivo"
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
   echo "0202: Recupera tutte le info dal PizzoTool"
   echo "0205: Recupera tutte le info sulle macchine di Test con commenti"
   echo "0210: Situazione macchine di test con macchine eliminate"
   echo "0251: Situazione stato delle istanze per server partenza"
   echo "0252: Situazione stato delle istanze in relazione a lista finale per server partenza"
   echo "0253: Situazione stato delle istanze per server arrivo"
   echo "0254: Situazione stato delle istanze in relazione a lista finale per server arrivo"
   echo "0255: Situazione stato delle istanze in relazione a lista 2016"
   echo "0261: Situazione stato dei servers"
   echo "------------------------------------------------------------------------------------------"
   echo "0301: Lista la tabella dei check istanze"
   echo "0305: Ricerca Istanze con Stato da listafinale"
   echo "0306: Ricerca Istanze con Stato da 2016"
   echo "0350: Ricerca Server con Stato dato dalla tabella stato_server"
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
   exportStatoIstanzaTable
   exportStatoServerTable
}

backupDB (){
   echo "BackUp del Database"
   backupDatabase
}

reWriteInternal(){
    echo "Riscrittura delle tabelle interne del DB"
    reWriteCheckIstanzeTable
    reWriteNoteServerTable
    reWriteStatoIstanzaTable
    reWriteStatoServerTable
}




###############################################
#   MAIN
###############################################
PAR="$@"



while getopts "acnd:f:hiHl:sA:E:F:S:I:T:N:UBEW" arg; do
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
        SQLCOMMAND=$( getSqlCommand $OPT $SERVER $ISTANZA $TIPO_IST $NOTE $IPA $FASE_SRV $EAS)
        echo "-----> Query inviata:"
        echo ${SQLCOMMAND}
        QUERY_TO_SEND="${QUERY_TO_SEND}\"${SQLCOMMAND}\""
        eval ${QUERY_TO_SEND}
      break
      fi
      break
      ;;
    s)
        aggiornaStato ${SERVER} ${FASE_SRV} ${FASE_STR}
        break
        ;;
    i)
        aggiornaIstanza ${ISTANZA} ${FASE_SRV} ${FASE_STR}
        break
        ;;
    F)
        FASE_SRV="$OPTARG"
        echo "Stato Server: ${FASE_SRV}"
        case $FASE_SRV in
           0)
              FASE_STR=${FASE_00}
              echo "Stato Server: ${FASE_00}"
              #break
              ;;
           1)
           FASE_STR=${FASE_01}
           echo "Stato Server: ${FASE_01}"
              #break
              ;;
           2)
              FASE_STR=${FASE_02}
              echo "Stato Server: ${FASE_02}"
                 #break
                 ;;
           3)
           FASE_STR=${FASE_03}
           echo "Stato Server: ${FASE_03}"
              #break
              ;;
           4)
           FASE_STR=${FASE_04}
           echo "Stato Server: ${FASE_04}"
              #break
              ;;
           5)
              FASE_STR=${FASE_05}
              echo "Stato Server: ${FASE_05}"
              #break
              ;;
           6)
              FASE_STR=${FASE_06}
              echo "Stato Server: ${FASE_06}"
              #break
              ;;
            7)
                FASE_STR=${FASE_07}
                echo "Stato Server: ${FASE_07}"
                #break
                ;;
            8)
                FASE_STR=${FASE_08}
                echo "Stato Server: ${FASE_08}"
                #break
                ;;
            9)
                FASE_STR=${FASE_09}
                echo "Stato Istanza/Server: ${FASE_09}"
                #break
                ;;
            10)
                FASE_STR=${FASE_10}
                echo "Stato Istanza/Server: ${FASE_10}"
                #break
                ;;
            15)
                FASE_STR=${FASE_15}
                echo "Stato Istanza/Server: ${FASE_15}"
                #break
                ;;
             20)
                FASE_STR=${FASE_20}
                echo "Stato Istanza/Server: ${FASE_20}"
                #break
                ;;
             21)
                FASE_STR=${FASE_21}
                echo "Stato Istanza/Server: ${FASE_21}"
                #break
                ;;
            *)
              echo ""
              echo "*******************************************"
              echo "** Fase: ${FASE_SRV} NON RICONOSCIUTA"
              echo "*******************************************"
              exit
        esac
        #break
        ;;
    S)
      SERVER="$OPTARG"
      echo "Inserimento per server: ${SERVER}"
      #break
      ;;
    A)
        IPA="$OPTARG"
        echo "Inserimento per IP Address: ${IPA}"
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
    E)
      EAS="$OPTARG"
      echo "Inserimento Eas Id: ${EAS}"
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
