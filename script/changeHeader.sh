#!/bin/bash

#
# Modifica degli header dei files csv
#
#     B.d.S - 26 Ago 2020
#

# Note
#
#   Lanciare lo script dalla cartella "script"
#

#Var utili
#FILE_PRESENT="false"

#Path File
CVS_PATH="../csv/"
SQL_PATH="../sql/"

#File Name csv in Input
IN_FILENAME_LISTAFINALE=$CVS_PATH"listafinale.csv"
IN_FILENAME_2016=$CVS_PATH"2016.csv"
IN_FILENAME_YANGWS=$CVS_PATH"femsws.csv"
IN_FILENAME_BUTTARE=$CVS_PATH"buttare.csv"

#File Name csv in Output
OUT_FILENAME_LISTAFINALE="Elencoserver_Feng_Listafinale.csv"
OUT_FILENAME_2016="Elencoserver_Feng_2016.csv"
OUT_FILENAME_YANGWS="Yang_FemsWS.csv"
OUT_FILENAME_BUTTARE="Da_Buttare.csv"

#File Name sql in Output
TABLE_HEADER=$SQL_PATH"table_header"

#si sposta nella workdir
cd $CVS_PATH

# verifica della presenza dei files csv
if [ ! -f $IN_FILENAME_LISTAFINALE ]; then
    echo "$IN_FILENAME_LISTAFINALE does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_YANGWS ]; then
    echo "$IN_FILENAME_YANGWS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_BUTTARE ]; then
    echo "$IN_FILENAME_BUTTARE does NOT exist"
    exit 0
fi

# verifica della presenza dei files sql
if [ ! -f $TABLE_HEADER ]; then
    echo "$TABLE_HEADER does NOT exist"
    exit 0
fi



#Crea file elencoserver_feng_listafinale.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 3 | tail -n 1 > $OUT_FILENAME_LISTAFINALE
tail -n +2 $IN_FILENAME_LISTAFINALE >> $OUT_FILENAME_LISTAFINALE


#Crea file elencoserver_feng_2016.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 5 | tail -n 1 > $OUT_FILENAME_2016
tail -n +2 $IN_FILENAME_2016 >> $OUT_FILENAME_2016


#Crea file Yang_FemsWS.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 7 | tail -n 1 > $OUT_FILENAME_YANGWS
tail -n +2 $IN_FILENAME_YANGWS >> $OUT_FILENAME_YANGWS


#Crea file da_buttare.csv con le giuste intestazioni 
cat $TABLE_HEADER | head -n 9 | tail -n 1 > $OUT_FILENAME_BUTTARE
tail -n +2 $IN_FILENAME_BUTTARE >> $OUT_FILENAME_BUTTARE

#Crea file anag_srv.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 9 | tail -n 1 > $OUT_FILENAME_BUTTARE
tail -n +2 $IN_FILENAME_BUTTARE >> $OUT_FILENAME_BUTTARE





