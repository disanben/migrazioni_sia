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

USER="root"
PSW="root"
DATABASE_NAME="migrazioni"

QUERY_TO_SEND=""

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
   echo "####################################################################"
   echo "   Tool Migrazioni - v. 1.0"
   echo ""
   echo "         descrizione delle funzionalità"
   echo ""
   echo "####################################################################"
   echo ""
   echo " -a: Stampa tutte le tabelle del Database migrazioni"
   echo " -d [TABLE NAME]: Descrive la tabella passata in argomento"
   echo " -f [SQL QUERY] : Consente di passare una query free in formato sql"
   echo " -l [Cod] : Consente di lanciare una ricerca precaricata. "
   echo "            Passando il codice 0 si visualizza la lista di tutte le ricerche caricate"
   echo " -U: Aggiornamento delle tabelle del DataBase con i nuovi file. "
   echo ""
   echo ""
}

printList () {
   
   echo "0101: ricerca di tutti FemsWS da Elenco_Server_Listafinale [FEMSWS]"
   echo "0102: Macchine presenti nelle due tabelle ListaFinale ServerPartenza) e 2016 (macchina)"
   echo "0103: Istanze migrate e situazione macchine da buttare"
   echo "0104: Lista delle istanze fatte per server di partenza"
   echo "0105: Lista delle istanze fatte per server di arrivo"
}

queryCommon () {
   QUERY_TO_SEND="mysql -u${USER} -p${PSW} ${DATABASE_NAME} -e "
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
   QUERY_TO_SEND="${QUERY_TO_SEND} \"$FREE_QUERY\""
}

updateDB (){
   echo "Update DB"
}


###############################################
#   MAIN
###############################################
PAR="$@"
while getopts "ad:f:hl:s:U" arg; do
  case $arg in
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
      freeQuery ${FREEQ}
      prePrint
      echo "Esecuzione della query libera"
      postPrint
      eval ${QUERY_TO_SEND}
      break
      ;;
    h)
      printUsage
      break
      ;;
    l)
      OPT="$OPTARG"

      if [[ $OPT -eq 0 ]]
      then
         prePrint
         echo "   Lista delle Query Precaricate"
         postPrint
         printList
      else
        queryCommon
        SQLCOMMAND=$( getSqlCommand $OPT )
        QUERY_TO_SEND="${QUERY_TO_SEND}\"${SQLCOMMAND}\""
        eval ${QUERY_TO_SEND}
      break
      fi
      break
      ;;
    s)
      strength="$OPTARG"
      echo $strength
      break
      ;;
    U)
      updateDB
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







