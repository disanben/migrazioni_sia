#!/bin/bash

#
# Creazione del database migrazioni
#
#     B.d.S - 27 Ago 2020
#
#   01. 2020-08-28 - Aggiunta campo data di ultima modifica del file
#

# Note
#
#   Lanciare lo script dalla cartella "script"
#

#Var utili
#FILE_PRESENT="false"

#Path File
SQL_PATH="../sql/"
CFG_PATH="../cfg/"

#File Name sql

CREATE_DATABASE_FILE=$SQL_PATH"crea_tabelle.sql"
echo $CREATE_DATABASE_FILE
#File Name cfg
CFG_FILE=$CFG_PATH"users.cfg"

#si sposta nella workdir
#cd $CVS_PATH


# verifica della presenza dei files sql
if [ ! -f $CREATE_DATABASE_FILE ]; then
    echo "$CREATE_DATABASE_FILE does NOT exist"
    exit 0
fi

# verifica della presenza dei files cfg
if [ ! -f $CFG_FILE ]; then
    echo "$CFG_FILE does NOT exist"
    exit 0
fi



#Crea il DataBase migrazioni
#mysql --defaults-extra-file=$CFG_FILE -u root  migrazioni -e "show databases";


mysql --defaults-extra-file=$CFG_FILE -u root  migrazioni < $CREATE_DATABASE_FILE
mysql --defaults-extra-file=$CFG_FILE -u root  migrazioni -e "show tables";






