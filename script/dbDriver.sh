#!/bin/bash

#
# Ambiente di interrogazione del DB
#
#     B.d.S - 02 Sep 2020
#

# Note
#
#   Lanciare lo script dalla cartella "script"
#

insertCheckInstance () { 
   SERVER=$1
   ISTANZA=$2
   TIPO_IST=$3
   NOTA=$4
   
   #echo "insertCheckInstance"
   
   if [ -z ${SERVER} ] | [ -z ${ISTANZA} ] | [ -z ${TIPO_IST} ];
   then
      echo "Alcuni parametri assenti:"
      echo "SERVER=${SERVER}"
      echo "ISTANZA=${ISTANZA}"
      echo "TIPO_IST=${TIPO_IST}"
      return
   fi
   
   mysql -uroot -proot migrazioni -e "INSERT INTO Check_Istanze (Istanza, Tipo, Server, Note, DataCheck, Firma) VALUES ('${ISTANZA}', '${TIPO_IST}', '${SERVER}', '${NOTA}', now(), 'BdS');"
   #mysql -uroot -proot migrazioni "select * from Da_Buttare);"
      
   echo "Inserito check per: ${SERVER}, Istanza ${ISTANZA} tipo: ${TIPO_IST} e nota: ${NOTA}"
   
}


insertServerNote () { 
   SERVER=$1
   NOTA=$2
   
   if [ -z ${SERVER} ] | [ -z ${NOTA} ];
   then
      echo "Alcuni parametri assenti:"
      echo "SERVER=${SERVER}"
      echo "NOTA=${NOTA}"
      return
   fi
   
   mysql -uroot -proot migrazioni -e "INSERT INTO Note_Server (Server, Note, Data) VALUES ('${SERVER}', '${NOTA}', now());"
   #mysql -uroot -proot migrazioni "select * from Da_Buttare);"
      
   echo "Inserita nota per: ${SERVER} e nota: ${NOTA}"
   
}

echo "File: dbDriver Loaded"
