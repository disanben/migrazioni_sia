#!/bin/bash

#
# Caricamento del database migrazioni con i files csv
#
#     B.d.S - 27 Ago 2020
#
#   01. 2020-08-28 - Gestione campo data di ultima modifica del file
#

# Note
#
#   Lanciare lo script dalla cartella "script"
#

#Var utili
#FILE_PRESENT="false"

#FILESYSTEM=1 #LINUX  FILESYSTEM
FILESYSTEM=2 #CYGWIN FILESYSTEM

#Path File
SQL_PATH="../sql/"
CFG_PATH="../cfg/"
CSV_PATH_EXT_ORIG="../csv/ext/orig/"
CSV_PATH_EXT_WORK="../csv/ext/work/"
CSV_PATH_INT="../csv/int/"

#File Name pre csv
PRE_FILENAME_ANAGRAFICA=$CSV_PATH_EXT_ORIG"anagsrv"
#File Name csv in Input
IN_FILENAME_LISTAFINALE=$CSV_PATH_EXT_ORIG"elencoserver-listafinale.csv"
IN_FILENAME_2016=$CSV_PATH_EXT_ORIG"elencoserver-2016.csv"
IN_FILENAME_BUTTARE=$CSV_PATH_EXT_ORIG"buttare.csv"
IN_FILENAME_ANAGRAFICA=$CSV_PATH_EXT_ORIG"anagsrv.csv"

IN_FILENAME_FIRE=$CSV_PATH_EXT_ORIG"fire.csv"
IN_FILENAME_FEMSWS=$CSV_PATH_EXT_ORIG"femsws.csv"
IN_FILENAME_ICETOP=$CSV_PATH_EXT_ORIG"fire-ice-top.csv"
IN_FILENAME_FIRESPEC=$CSV_PATH_EXT_ORIG"fire-spec.csv"
IN_FILENAME_FEMSWSCIR=$CSV_PATH_EXT_ORIG"femsws-circuit.csv"
IN_FILENAME_FEMSWSCIRINS=$CSV_PATH_EXT_ORIG"femsws-circuit-inst.csv"
IN_FILENAME_FIREMQ=$CSV_PATH_EXT_ORIG"fire-mq-prof.csv"
IN_FILENAME_TANGFAS=$CSV_PATH_EXT_ORIG"tangram-fas.csv"
IN_FILENAME_TANGEAS=$CSV_PATH_EXT_ORIG"tangram-eas.csv"
IN_FILENAME_TANGEASSRV=$CSV_PATH_EXT_ORIG"tangram-eas-srv.csv"
IN_FILENAME_TANGEASINFO=$CSV_PATH_EXT_ORIG"tangram-eas-info.csv"
IN_FILENAME_TANGFEMS=$CSV_PATH_EXT_ORIG"tangram-fems.csv"
IN_FILENAME_SERVERLIST=$CSV_PATH_EXT_ORIG"serverlist.csv"



#Table Name
TABLENAME_LISTAFINALE="Elencoserver_Feng_Listafinale"
TABLENAME_2016="Elencoserver_Feng_2016"
TABLENAME_BUTTARE="Da_Buttare"
TABLENAME_ANAGRAFICA="Anag_Srv"

TABLENAME_FIRE="Fire"
TABLENAME_FEMSWS="FemsWS"
TABLENAME_ICETOP="Fire_Ice_Top"
TABLENAME_FIRESPEC="Fire_Spec"
TABLENAME_FEMSWSCIR="FemsWS_Circuit"
TABLENAME_FEMSWSCIRINS="FemsWS_Circuit_Inst"
TABLENAME_FIREMQ="Fire_MQ_Prof"
TABLENAME_TANGFAS="Tangram_Fas"
TABLENAME_TANGEAS="Tangram_Eas"
TABLENAME_TANGEASSRV="Tangram_Eas_Srv"
TABLENAME_TANGEASINFO="Tangram_Eas_Info"
TABLENAME_TANGFEMS="Tangram_Fems"
TABLENAME_SERVERLIST="Serverlist"

#File Name csv in Output
FILENAME_LISTAFINALE=$CSV_PATH_EXT_WORK$TABLENAME_LISTAFINALE.csv
FILENAME_2016=$CSV_PATH_EXT_WORK$TABLENAME_2016.csv
FILENAME_BUTTARE=$CSV_PATH_EXT_WORK$TABLENAME_BUTTARE.csv
FILENAME_ANAGRAFICA=$CSV_PATH_EXT_WORK$TABLENAME_ANAGRAFICA.csv

FILENAME_FIRE=$CSV_PATH_EXT_WORK$TABLENAME_FIRE.csv
FILENAME_FEMSWS=$CSV_PATH_EXT_WORK$TABLENAME_FEMSWS.csv
FILENAME_ICETOP=$CSV_PATH_EXT_WORK$TABLENAME_ICETOP.csv
FILENAME_FIRESPEC=$CSV_PATH_EXT_WORK$TABLENAME_FIRESPEC.csv
FILENAME_FEMSWSCIR=$CSV_PATH_EXT_WORK$TABLENAME_FEMSWSCIR.csv
FILENAME_FEMSWSCIRINS=$CSV_PATH_EXT_WORK$TABLENAME_FEMSWSCIRINS.csv
FILENAME_FIREMQ=$CSV_PATH_EXT_WORK$TABLENAME_FIREMQ.csv
FILENAME_TANGFAS=$CSV_PATH_EXT_WORK$TABLENAME_TANGFAS.csv
FILENAME_TANGEAS=$CSV_PATH_EXT_WORK$TABLENAME_TANGEAS.csv
FILENAME_TANGEASSRV=$CSV_PATH_EXT_WORK$TABLENAME_TANGEASSRV.csv
FILENAME_TANGEASINFO=$CSV_PATH_EXT_WORK$TABLENAME_TANGEASINFO.csv
FILENAME_TANGFEMS=$CSV_PATH_EXT_WORK$TABLENAME_TANGFEMS.csv
FILENAME_SERVERLIST=$CSV_PATH_EXT_WORK$TABLENAME_SERVERLIST.csv

#Date dei files csv
DATAFILE_LISTAFINALE=""
DATAFILE_2016=""
DATAFILE_BUTTARE=""
DATAFILE_ANAGRAFICA=""

DATAFILE_FIRE=""
DATAFILE_FEMSWS=""
DATAFILE_ICETOP=""
DATAFILE_FIRESPEC=""
DATAFILE_FEMSWSCIR=""
DATAFILE_FEMSWSCIRINS=""
DATAFILE_FIREMQ=""
DATAFILE_TANGFAS=""
DATAFILE_TANGEAS=""
DATAFILE_TANGEASSRV=""
DATAFILE_TANGEASINFO=""
DATAFILE_TANGFEMS=""
DATAFILE_SERVERLIST=""

#File Name cfg
CFG_FILE=$CFG_PATH"users.cfg"

#File Name table header
TABLE_HEADER=$SQL_PATH"table_header"

#si sposta nella dir per i cvs esterni
#cd $CSV_PATH_EXT

#################################################
# Eliminazione file esterni
#################################################
cd $CSV_PATH_EXT_WORK
touch "test_file"
rm *
cd -

#################################################
# Conversione dei files a UNIX
#################################################
#dos2unix $PRE_FILENAME_ANAGRAFICA
#dos2unix $IN_FILENAME_LISTAFINALE
#dos2unix $IN_FILENAME_2016
#dos2unix $IN_FILENAME_BUTTARE




#################################################
# Conversione del file anagrafica
#################################################
if [ ! -f $PRE_FILENAME_ANAGRAFICA ]; then
    echo "$PRE_FILENAME_ANAGRAFICA does NOT exist"
    exit 0
fi

cat $PRE_FILENAME_ANAGRAFICA | sed '3d' | sed 's/,/-/g' | sed 's/ /;/1' | sed 's/CN/;CN/1' > $IN_FILENAME_ANAGRAFICA

#################################################
# verifica della presenza dei files cvs
#################################################
if [ ! -f $IN_FILENAME_LISTAFINALE ]; then
    echo "$IN_FILENAME_LISTAFINALE does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_2016 ]; then
    echo "$IN_FILENAME_2016 does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_FEMSWS ]; then
    echo "$IN_FILENAME_FEMSWS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_BUTTARE ]; then
    echo "$IN_FILENAME_BUTTARE does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_ANAGRAFICA ]; then
    echo "$IN_FILENAME_ANAGRAFICA does NOT exist"
    exit 0
fi


if [ ! -f $IN_FILENAME_FIRE ]; then
    echo "$IN_FILENAME_FIRE does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_FEMSWS ]; then
    echo "$IN_FILENAME_FEMSWS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_ICETOP ]; then
    echo "$IN_FILENAME_ICETOP does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_FIRESPEC ]; then
    echo "$IN_FILENAME_FIRESPEC does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_FEMSWSCIR ]; then
    echo "$IN_FILENAME_FEMSWSCIR does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_FEMSWSCIRINS ]; then
    echo "$IN_FILENAME_FEMSWSCIRINS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_FIREMQ ]; then
    echo "$IN_FILENAME_FIREMQ does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_TANGFAS ]; then
    echo "$IN_FILENAME_TANGFAS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_TANGEAS ]; then
    echo "$IN_FILENAME_TANGEAS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_TANGEASSRV ]; then
    echo "$IN_FILENAME_TANGEASSRV does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_TANGEASINFO ]; then
    echo "$IN_FILENAME_TANGEASINFO does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_TANGFEMS ]; then
    echo "$IN_FILENAME_TANGFEMS does NOT exist"
    exit 0
fi

if [ ! -f $IN_FILENAME_SERVERLIST ]; then
    echo "$IN_FILENAME_SERVERLIST does NOT exist"
    exit 0
fi





# verifica della presenza dei files cfg
if [ ! -f $CFG_FILE ]; then
    echo "$CFG_FILE does NOT exist"
    exit 0
fi

# verifica della presenza del file degli header
if [ ! -f $TABLE_HEADER ]; then
    echo "$TABLE_HEADER does NOT exist"
    exit 0
fi


#################################################
# sostituzione del ; in , come separatore
#################################################
#sed -i 's/,/./g' $IN_FILENAME_LISTAFINALE
#sed -i 's/,/./g' $IN_FILENAME_2016
#sed -i 's/,/./g' $FILENAME_BUTTARE



#echo "01"
####################################################################
#  Deduce la data di ultima modifica del file - Linux FileSystem
####################################################################
if [ $FILESYSTEM -eq 1 ]; then
	DATAFILEANAGRAFICA=`ls -l $IN_FILENAME_ANAGRAFICA | awk '{print $6"-"$7}'`

	DATAFILELISTAFINALE=`ls -l $IN_FILENAME_LISTAFINALE | awk '{print $6"-"$7}'`
	DATAFILE2016=`ls -l $IN_FILENAME_2016 | awk '{print $6"-"$7}'`
	DATAFILEBUTTARE=`ls -l $IN_FILENAME_BUTTARE | awk '{print $6"-"$7}'`

	DATAFILEFIRE=`ls -l $IN_FILENAME_FIRE | awk '{print $6"-"$7}'`
	DATAFILEFEMSWS=`ls -l $IN_FILENAME_FEMSWS | awk '{print $6"-"$7}'`
	DATAFILEICETOP=`ls -l $IN_FILENAME_ICETOP | awk '{print $6"-"$7}'`
	DATAFILEFIRESPEC=`ls -l $IN_FILENAME_FIRESPEC | awk '{print $6"-"$7}'`
	DATAFILEFEMSWSCIR=`ls -l $IN_FILENAME_FEMSWSCIR | awk '{print $6"-"$7}'`
	DATAFILEFEMSWSCIRINS=`ls -l $IN_FILENAME_FEMSWSCIRINS | awk '{print $6"-"$7}'`
	DATAFILEFIREMQ=`ls -l $IN_FILENAME_FIREMQ | awk '{print $6"-"$7}'`
	DATAFILETANGFAS=`ls -l $IN_FILENAME_TANGFAS | awk '{print $6"-"$7}'`
	DATAFILETANGEAS=`ls -l $IN_FILENAME_TANGEAS | awk '{print $6"-"$7}'`
	DATAFILETANGEASSRV=`ls -l $IN_FILENAME_TANGEASSRV | awk '{print $6"-"$7}'`
	DATAFILETANGEASINFO=`ls -l $IN_FILENAME_TANGEASINFO | awk '{print $6"-"$7}'`
	DATAFILETANGFEMS=`ls -l $IN_FILENAME_TANGFEMS | awk '{print $6"-"$7}'`
  DATAFILESERVERLIST=`ls -l $IN_FILENAME_SERVERLIST | awk '{print $6"-"$7}'`
fi

##################################################################
#  Deduce la data di ultima modifica del file - CycWin FileSystem
##################################################################
if [ $FILESYSTEM -eq 2 ]; then
	DATAFILEANAGRAFICA=`ls -l $IN_FILENAME_ANAGRAFICA | awk '{print $7"-"$8}'`

	DATAFILELISTAFINALE=`ls -l $IN_FILENAME_LISTAFINALE | awk '{print $7"-"$8}'`
	DATAFILE2016=`ls -l $IN_FILENAME_2016 | awk '{print $7"-"$8}'`
	DATAFILEBUTTARE=`ls -l $IN_FILENAME_BUTTARE | awk '{print $7"-"$8}'`

	DATAFILEFIRE=`ls -l $IN_FILENAME_FIRE | awk '{print $7"-"$8}'`
	DATAFILEFEMSWS=`ls -l $IN_FILENAME_FEMSWS | awk '{print $7"-"$8}'`
	DATAFILEICETOP=`ls -l $IN_FILENAME_ICETOP | awk '{print $7"-"$8}'`
	DATAFILEFIRESPEC=`ls -l $IN_FILENAME_FIRESPEC | awk '{print $7"-"$8}'`
	DATAFILEFEMSWSCIR=`ls -l $IN_FILENAME_FEMSWSCIR | awk '{print $7"-"$8}'`
	DATAFILEFEMSWSCIRINS=`ls -l $IN_FILENAME_FEMSWSCIRINS | awk '{print $7"-"$8}'`
	DATAFILEFIREMQ=`ls -l $IN_FILENAME_FIREMQ | awk '{print $7"-"$8}'`
	DATAFILETANGFAS=`ls -l $IN_FILENAME_TANGFAS | awk '{print $7"-"$8}'`
	DATAFILETANGEAS=`ls -l $IN_FILENAME_TANGEAS | awk '{print $7"-"$8}'`
	DATAFILETANGEASSRV=`ls -l $IN_FILENAME_TANGEASSRV | awk '{print $7"-"$8}'`
	DATAFILETANGEASINFO=`ls -l $IN_FILENAME_TANGEASINFO | awk '{print $7"-"$8}'`
	DATAFILETANGFEMS=`ls -l $IN_FILENAME_TANGFEMS | awk '{print $7"-"$8}'`
  DATAFILESERVERLIST=`ls -l $IN_FILENAME_SERVERLIST | awk '{print $7"-"$8}'`
fi
#echo "${DATAFILELISTAFINALE}"

#echo "02"
####################################################
#  Aggiunge la data di ultima modifica al file
####################################################
#echo "nome file: $IN_FILENAME_LISTAFINALE"
cat $IN_FILENAME_ANAGRAFICA | sed "s/$/; ${DATAFILEANAGRAFICA}/g" > $FILENAME_ANAGRAFICA.tmp

cat $IN_FILENAME_LISTAFINALE | sed "s/$/; ${DATAFILELISTAFINALE}/g" > $FILENAME_LISTAFINALE.tmp
cat $IN_FILENAME_2016 | sed "s/$/; ${DATAFILE2016}/g" > $FILENAME_2016.tmp
cat $IN_FILENAME_BUTTARE | sed "s/$/; ${DATAFILEBUTTARE}/g" > $FILENAME_BUTTARE.tmp
cat $IN_FILENAME_SERVERLIST | sed "s/$/ ${DATAFILESERVERLIST}/g" > $FILENAME_SERVERLIST.tmp

cat $IN_FILENAME_FIRE | sed "s/$/, ${DATAFILEFIRE}/g" > $FILENAME_FIRE.tmp
cat $IN_FILENAME_FEMSWS | sed "s/$/, ${DATAFILEFEMSWS}/g" > $FILENAME_FEMSWS.tmp
cat $IN_FILENAME_ICETOP | sed "s/$/, ${DATAFILEICETOP}/g" > $FILENAME_ICETOP.tmp
cat $IN_FILENAME_FIRESPEC | sed "s/$/, ${DATAFILEFIRESPEC}/g" > $FILENAME_FIRESPEC.tmp
cat $IN_FILENAME_FEMSWSCIR | sed "s/$/, ${DATAFILEFEMSWSCIR}/g" > $FILENAME_FEMSWSCIR.tmp
cat $IN_FILENAME_FEMSWSCIRINS | sed "s/$/, ${DATAFILEFEMSWSCIRINS}/g" > $FILENAME_FEMSWSCIRINS.tmp
cat $IN_FILENAME_FIREMQ | sed "s/$/, ${DATAFILEFIREMQ}/g" > $FILENAME_FIREMQ.tmp
cat $IN_FILENAME_TANGFAS | sed "s/$/, ${DATAFILETANGFAS}/g" > $FILENAME_TANGFAS.tmp
cat $IN_FILENAME_TANGEAS | sed "s/$/, ${DATAFILETANGEAS}/g" > $FILENAME_TANGEAS.tmp
cat $IN_FILENAME_TANGEASSRV | sed "s/$/, ${DATAFILETANGEASSRV}/g" > $FILENAME_TANGEASSRV.tmp
cat $IN_FILENAME_TANGEASINFO | sed "s/$/, ${DATAFILETANGEASINFO}/g" > $FILENAME_TANGEASINFO.tmp
cat $IN_FILENAME_TANGFEMS | sed "s/$/, ${DATAFILETANGFEMS}/g" > $FILENAME_TANGFEMS.tmp


#echo "03"
##########################################################
# Corregge le intestazioni con i nomi corretti dei campi
##########################################################
#Crea file elencoserver_feng_listafinale.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 3 | tail -n 1 > $FILENAME_LISTAFINALE
tail -n +2 $FILENAME_LISTAFINALE.tmp >> $FILENAME_LISTAFINALE

#Crea file elencoserver_feng_2016.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 5 | tail -n 1 > $FILENAME_2016
tail -n +2 $FILENAME_2016.tmp >> $FILENAME_2016

#Crea file da_buttare.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 7 | tail -n 1 > $FILENAME_BUTTARE
tail -n +2 $FILENAME_BUTTARE.tmp >> $FILENAME_BUTTARE

#Crea file anag_srv.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 9 | tail -n 1 > $FILENAME_ANAGRAFICA
tail -n +3 $FILENAME_ANAGRAFICA.tmp >> $FILENAME_ANAGRAFICA

#Crea file XXX.csv con le giuste intestazioni
cat $TABLE_HEADER | head -n 11 | tail -n 1 > $FILENAME_FIRE
tail -n +2 $FILENAME_FIRE.tmp >> $FILENAME_FIRE

cat $TABLE_HEADER | head -n 13 | tail -n 1 > $FILENAME_FEMSWS
tail -n +2 $FILENAME_FEMSWS.tmp >> $FILENAME_FEMSWS

cat $TABLE_HEADER | head -n 15 | tail -n 1 > $FILENAME_ICETOP
tail -n +2 $FILENAME_ICETOP.tmp >> $FILENAME_ICETOP

cat $TABLE_HEADER | head -n 17 | tail -n 1 > $FILENAME_FIRESPEC
tail -n +2 $FILENAME_FIRESPEC.tmp >> $FILENAME_FIRESPEC

cat $TABLE_HEADER | head -n 19 | tail -n 1 > $FILENAME_FEMSWSCIR
tail -n +2 $FILENAME_FEMSWSCIR.tmp >> $FILENAME_FEMSWSCIR

cat $TABLE_HEADER | head -n 21 | tail -n 1 > $FILENAME_FEMSWSCIRINS
tail -n +2 $FILENAME_FEMSWSCIRINS.tmp >> $FILENAME_FEMSWSCIRINS

cat $TABLE_HEADER | head -n 23 | tail -n 1 > $FILENAME_FIREMQ
tail -n +2 $FILENAME_FIREMQ.tmp >> $FILENAME_FIREMQ

cat $TABLE_HEADER | head -n 25 | tail -n 1 > $FILENAME_TANGFAS
tail -n +2 $FILENAME_TANGFAS.tmp >> $FILENAME_TANGFAS

cat $TABLE_HEADER | head -n 27 | tail -n 1 > $FILENAME_TANGEAS
tail -n +2 $FILENAME_TANGEAS.tmp >> $FILENAME_TANGEAS

cat $TABLE_HEADER | head -n 29 | tail -n 1 > $FILENAME_TANGEASSRV
tail -n +2 $FILENAME_TANGEASSRV.tmp >> $FILENAME_TANGEASSRV

cat $TABLE_HEADER | head -n 31 | tail -n 1 > $FILENAME_TANGEASINFO
tail -n +2 $FILENAME_TANGEASINFO.tmp >> $FILENAME_TANGEASINFO

cat $TABLE_HEADER | head -n 33 | tail -n 1 > $FILENAME_TANGFEMS
tail -n +2 $FILENAME_TANGFEMS.tmp >> $FILENAME_TANGFEMS

cat $TABLE_HEADER | head -n 35 | tail -n 1 > $FILENAME_SERVERLIST
tail -n +2 $FILENAME_SERVERLIST.tmp >> $FILENAME_SERVERLIST

#echo "04"

echo $FILENAME_FEMSWS
#Crea il DataBase migrazioni
#mysql --defaults-extra-file=$CFG_FILE -uroot -proot migrazioni -e "show databases";
mysql -uroot -proot migrazioni -e "show tables";

mysqlimport --ignore-lines=1 --fields-terminated-by=';' --local -uroot -proot migrazioni  $FILENAME_ANAGRAFICA

mysqlimport --ignore-lines=1 --fields-terminated-by=';' --local -uroot -proot migrazioni  $FILENAME_LISTAFINALE
mysqlimport --ignore-lines=1 --fields-terminated-by=';' --local -uroot -proot migrazioni  $FILENAME_2016
mysqlimport --ignore-lines=1 --fields-terminated-by=';' --local -uroot -proot migrazioni  $FILENAME_BUTTARE
mysqlimport --ignore-lines=1 --fields-terminated-by=';' --local -uroot -proot migrazioni  $FILENAME_SERVERLIST

mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_FIRE
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_FEMSWS
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_ICETOP
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_FIRESPEC
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_FEMSWSCIR
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_FEMSWSCIRINS
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_FIREMQ
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_TANGFAS
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_TANGEAS
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_TANGEASSRV
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_TANGEASINFO
mysqlimport --ignore-lines=1 --fields-terminated-by=',' --local -uroot -proot migrazioni  $FILENAME_TANGFEMS


#LOAD DATA INFILE
#mysql --defaults-extra-file=$CFG_FILE -u root  migrazioni -e "select * from $TABLENAME_BUTTARE";
#mysql --defaults-extra-file=$CFG_FILE -u root  migrazioni -e "select * from $TABLENAME_LISTAFINALE";

echo "File: loadDatabase Loaded"
