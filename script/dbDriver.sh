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


insertIstanceNote() {
   ISTANZA=$1
   NOTA=$2

   if [ -z ${ISTANZA} ] | [ -z ${NOTA} ];
   then
      echo "Alcuni parametri assenti:"
      echo "ISTANZA=${ISTANZA}"
      echo "NOTA=${NOTA}"
      return
   fi

   mysql -uroot -proot migrazioni -e "INSERT INTO Check_Istanze (Istanza, Note, DataCheck) VALUES ('${ISTANZA}', '${NOTA}', now());"
   #mysql -uroot -proot migrazioni "select * from Da_Buttare);"

   echo "Inserita nota per: ${ISTANZA} e nota: ${NOTA}"

}

inserisciIstanza () {
  ISTANZA=$1
  FASE_SRV=$2
  FASE_STR=$3

  if [ -z ${ISTANZA} ] | [ -z ${FASE_SRV} ] | [ -z ${FASE_STR} ];
  then
     echo "Alcuni parametri assenti:"
     echo "SERVER=${ISTANZA}"
     echo "Stato Server=${FASE_SRV}"
     echo "Desc Stato=${FASE_STR}"
     return
  fi

  NOTA="Inserito la istanza a ${FASE_STR}"
  echo $NOTA

  mysql -uroot -proot migrazioni -e "INSERT INTO Stato_Istanza (Istanza, Stato, StatoDesc, Data) values ('${ISTANZA}', '${FASE_SRV}', '${FASE_STR}', now());"
  #mysql -uroot -proot migrazioni "select * from Da_Buttare);"

  insertIstanceNote ${ISTANZA} "$NOTA"

  echo "Inserito lo stato del server: ${SERVER} con Stato: ${FASE_SRV} - ${FASE_STR}"
}

aggiornaIstanza () {
  ISTANZA=$1
  FASE_SRV=$2
  FASE_STR=$3

  if [ -z ${ISTANZA} ] | [ -z ${FASE_SRV} ] | [ -z ${FASE_STR} ];
  then
     echo "Alcuni parametri assenti:"
     echo "ISTANZA=${ISTANZA}"
     echo "Stato Server=${FASE_SRV}"
     echo "Desc Stato=${FASE_STR}"
     return
  fi

  #verifica presenza dei records
  RESP=$(mysql -uroot -proot migrazioni -e "SELECT id FROM Stato_Istanza where Istanza LIKE '%${ISTANZA}%';")
  echo "TROVATI=$RESP"

  if [ -z $RESP ];
  then
    inserisciIstanza ${ISTANZA} ${FASE_SRV} ${FASE_STR}
  else
     NOTA="Aggiornato lo stato a ${FASE_STR}"
     echo $NOTA
     mysql -uroot -proot migrazioni -e "UPDATE Stato_Istanza set Stato='${FASE_SRV}', StatoDesc='${FASE_STR}' where Istanza LIKE '%${ISTANZA}%';"
     insertIstanceNote ${ISTANZA} "$NOTA"
  fi


  echo "Aggiornato lo stato della istanza: ${ISTANZA} con Stato: ${FASE_SRV} - ${FASE_STR}"
}




inserisciStato () {
  SERVER=$1
  FASE_SRV=$2
  FASE_STR=$3

  if [ -z ${SERVER} ] | [ -z ${FASE_SRV} ] | [ -z ${FASE_STR} ];
  then
     echo "Alcuni parametri assenti:"
     echo "SERVER=${SERVER}"
     echo "Stato Server=${FASE_SRV}"
     echo "Desc Stato=${FASE_STR}"
     return
  fi

  NOTA="Inserito lo stato a ${FASE_STR}"
  echo $NOTA

  mysql -uroot -proot migrazioni -e "INSERT INTO Stato_Server (Server, Stato, StatoDesc, Data) values ('${SERVER}', '${FASE_SRV}', '${FASE_STR}', now());"
  #mysql -uroot -proot migrazioni "select * from Da_Buttare);"

  insertServerNote ${SERVER} "$NOTA"

  echo "Inserito lo stato del server: ${SERVER} con Stato: ${FASE_SRV} - ${FASE_STR}"
}

aggiornaStato () {
  SERVER=$1
  FASE_SRV=$2
  FASE_STR=$3

  if [ -z ${SERVER} ] | [ -z ${FASE_SRV} ] | [ -z ${FASE_STR} ];
  then
     echo "Alcuni parametri assenti:"
     echo "SERVER=${SERVER}"
     echo "Stato Server=${FASE_SRV}"
     echo "Desc Stato=${FASE_STR}"
     return
  fi

  #verifica presenza dei records
  RESP=$(mysql -uroot -proot migrazioni -e "SELECT id FROM Stato_Server where Server LIKE '%${SERVER}%';")
  echo "TROVATI=$RESP"

  if [ -z $RESP  ];
  then
    inserisciStato ${SERVER} ${FASE_SRV} ${FASE_STR}
  else
     NOTA="Aggiornato lo stato a ${FASE_STR}"
     echo $NOTA
     mysql -uroot -proot migrazioni -e "UPDATE Stato_Server set Stato='${FASE_SRV}', StatoDesc='${FASE_STR}' where Server LIKE '%${SERVER}%';"
     insertServerNote ${SERVER} "$NOTA"
  fi


  echo "Aggiornato lo stato del server: ${SERVER} con Stato: ${FASE_SRV} - ${FASE_STR}"
}


echo "File: dbDriver Loaded"
