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

#File Name csv in output
OUT_FILENAME_CHECK_ISTANZE=$CSV_PATH_INT$TABLENAME_CHECK_ISTANZE.sql
OUT_FILENAME_NOTE_SERVER=$CSV_PATH_INT$TABLENAME_NOTE_SERVER.sql




####################################
#  Esporta la tabella Check_Istanze
####################################
exportCheckIstanzeTable (){
   mysqldump -u$USER -p$PSW $DATABASE_NAME $TABLENAME_CHECK_ISTANZE > $OUT_FILENAME_CHECK_ISTANZE
   echo "Dump della tabella ${TABLENAME_CHECK_ISTANZE} eseguito in ${OUT_FILENAME_CHECK_ISTANZA}"
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
#  Dump dell'intero Database
####################################
backupDatabase (){
  TIMESTAMP=`date +%y%m%d_%H%M`
  OUT_FILENAME_DB_BCK=$DB_PATH_BCK$TIMESTAMP"-"$DATABASE_NAME.sql
  mysqldump -u$USER -p$PSW $DATABASE_NAME > $OUT_FILENAME_DB_BCK
  echo "Dump del database ${DATABASE_NAME} eseguito in ${OUT_FILENAME_DB_BCK}"
}


echo "File: exportDatabase Loaded"