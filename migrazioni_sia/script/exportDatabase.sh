#!/bin/bash

#
# Export del db in file csv
#
#     B.d.S - 04 Sep 2020
#
#
#


#Var utili
#FILE_PRESENT="false"

USER="root"
PSW="root"
DATABASE_NAME="migrazioni"

#Path File
SQL_PATH="../sql/"
DB_PATH_BCK="../bck/"
CSV_PATH_BCK="../csv/bck/"
CSV_PATH_INT="../csv/int/"

#Table Name
TABLENAME_CHECK_ISTANZE="Check_Istanze"
TABLENAME_NOTE_SERVER="Note_Server"
TABLENAME_STATO_SERVER="Stato_Server"
TABLENAME_STATO_ISTANZA="Stato_Istanza"

#File Name csv in output
OUT_FILENAME_CHECK_ISTANZE=$CSV_PATH_INT$TABLENAME_CHECK_ISTANZE.sql
OUT_FILENAME_NOTE_SERVER=$CSV_PATH_INT$TABLENAME_NOTE_SERVER.sql
OUT_FILENAME_STATO_SERVER=$CSV_PATH_INT$TABLENAME_STATO_SERVER.sql
OUT_FILENAME_STATO_ISTANZA=$CSV_PATH_INT$TABLENAME_STATO_ISTANZA.sql




####################################
#  Esporta la tabella Check_Istanze
####################################
exportCheckIstanzeTable (){
   mysqldump -u$USER -p$PSW $DATABASE_NAME $TABLENAME_CHECK_ISTANZE > $OUT_FILENAME_CHECK_ISTANZE
   echo "Dump della tabella ${TABLENAME_CHECK_ISTANZE} eseguito in ${OUT_FILENAME_CHECK_ISTANZE}"
}

####################################
#  Riscrive la tabella Check_Istanze
####################################
reWriteCheckIstanzeTable (){
   mysql -u$USER -p$PSW $DATABASE_NAME < $OUT_FILENAME_CHECK_ISTANZE
   echo "ReWrite della tabella ${TABLENAME_CHECK_ISTANZE} da: ${OUT_FILENAME_CHECK_ISTANZE}"
}


####################################
#  Esporta la tabella Note_Server
####################################
exportNoteServerTable (){
   mysqldump -u$USER -p$PSW $DATABASE_NAME $TABLENAME_NOTE_SERVER > $OUT_FILENAME_NOTE_SERVER
   echo "Dump della tabella ${TABLENAME_NOTE_SERVER} eseguito in: ${OUT_FILENAME_NOTE_SERVER}"
}

####################################
#  Riscrive la tabella Note_Server
####################################
reWriteNoteServerTable (){
   mysql -u$USER -p$PSW $DATABASE_NAME < $OUT_FILENAME_NOTE_SERVER
   echo "ReWrite della tabella ${TABLENAME_NOTE_SERVER} da: ${OUT_FILENAME_NOTE_SERVER}"
}

####################################
#  Esporta la tabella Stato Istanza
####################################
exportStatoIstanzaTable (){
   mysqldump -u$USER -p$PSW $DATABASE_NAME $TABLENAME_STATO_ISTANZA > $OUT_FILENAME_STATO_ISTANZA
   echo "Dump della tabella ${TABLENAME_STATO_ISTANZA} eseguito in: ${OUT_FILENAME_STATO_ISTANZA}"
}

####################################
#  Riscrive la tabella Note_Server
####################################
reWriteStatoIstanzaTable (){
   mysql -u$USER -p$PSW $DATABASE_NAME < $OUT_FILENAME_STATO_ISTANZA
   echo "ReWrite della tabella ${TABLENAME_STATO_ISTANZA} da: ${OUT_FILENAME_STATO_ISTANZA}"
}

####################################
#  Esporta la tabella Stato Server
####################################
exportStatoServerTable (){
   mysqldump -u$USER -p$PSW $DATABASE_NAME $TABLENAME_STATO_SERVER > $OUT_FILENAME_STATO_SERVER
   echo "Dump della tabella ${TABLENAME_STATO_SERVER} eseguito in: ${OUT_FILENAME_STATO_SERVER}"
}

####################################
#  Riscrive la tabella Stato Server
####################################
reWriteStatoServerTable (){
   mysql -u$USER -p$PSW $DATABASE_NAME < $OUT_FILENAME_STATO_SERVER
   echo "ReWrite della tabella ${TABLENAME_STATO_SERVER} da: ${OUT_FILENAME_STATO_SERVER}"
}



####################################
#  Dump dell'intero Database
####################################
backupDatabase (){
  TIMESTAMP=`date +%y%m%d_%H%M`
  OUT_FILENAME_DB_BCK=$DB_PATH_BCK$TIMESTAMP"-"$DATABASE_NAME.sql
  mysqldump -u$USER -p$PSW $DATABASE_NAME > $OUT_FILENAME_DB_BCK
  echo "Dump del database ${DATABASE_NAME} eseguito in ${OUT_FILENAME_DB_BCK}"
}


echo "File: exportDatabase Loaded"
