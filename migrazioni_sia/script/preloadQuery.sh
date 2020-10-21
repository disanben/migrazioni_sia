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

# "0101: ricerca di tutti FemsWS da Elenco_Server_Listafinale [FEMSWS]"
# "0102: Macchine presenti nelle due tabelle ListaFinale e 2016"
# "0103: Istanze di tipo FemsWS migrate e situazione macchina da buttare"
# "0104: Lista delle istanze fatte per server di partenza"
# "0105: Lista delle istanze fatte per server di arrivo"

#INTO OUTFILE '/exportdata/customers.txt'

getSqlCommand () {
   CODE="$1"
   SRV="$2"
   IST="$3"
   TIP="$4"
   NOT="$5"
   IPA="$6"
   STATO="$7"

   #echo "ricerca stringa per cod: ${CODE}"

   case $CODE in
     0100)
        cod_0100
        SQL=$( cod_0100 )
        #echo "SQL passed: ${SQL}"
        exit
        ;;
      0101)
         cod_0101
         SQL=$( cod_0101 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0102)
         cod_0102
         SQL=$( cod_0102 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0103)
         cod_0103
         SQL=$( cod_0103 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0105)
         cod_0105
         SQL=$( cod_0105 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0104)
            cod_0104
            SQL=$( cod_0104 )
            #echo "SQL passed: ${SQL}"
            exit
            ;;
      0106)
         cod_0106
         SQL=$( cod_0106 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0107)
         cod_0107
         SQL=$( cod_0107 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0110)
         cod_0110
         SQL=$( cod_0110 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0151)
         cod_0151
         SQL=$( cod_0151 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0152)
         cod_0152
         SQL=$( cod_0152 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0155)
         cod_0155
         SQL=$( cod_0155 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0156)
         cod_0156
         SQL=$( cod_0156 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0157)
         cod_0157
         SQL=$( cod_0157 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0159)
         cod_0159
         SQL=$( cod_0159 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0161)
         cod_0161
         SQL=$( cod_0161 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0162)
         cod_0162
         SQL=$( cod_0162 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0165)
         cod_0165
         SQL=$( cod_0165 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0166)
         cod_0166
         SQL=$( cod_0166 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0201)
         cod_0201
         SQL=$( cod_0201 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0202)
        cod_0202
        SQL=$( cod_0202 )
        #echo "SQL passed: ${SQL}"
        exit
        ;;
      0205)
         cod_0205
         SQL=$( cod_0205 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0210)
         cod_0210
         SQL=$( cod_0210 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0251)
         cod_0251
         SQL=$( cod_0251 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0252)
        cod_0252
        SQL=$( cod_0252 )
        #echo "SQL passed: ${SQL}"
        exit
        ;;
      0253)
           cod_0253
           SQL=$( cod_0253 )
           #echo "SQL passed: ${SQL}"
           exit
           ;;
        0254)
          cod_0254
          SQL=$( cod_0254 )
          #echo "SQL passed: ${SQL}"
          exit
          ;;
      0255)
         cod_0255
         SQL=$( cod_0255 )
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0261)
         cod_0261
         SQL=$( cod_0261 )
         #echo "SQL passed: ${SQL}"
         exit
        ;;
      0301)
         cod_0301
         SQL="$( cod_0301 )"
         #echo "SQL passed: ${SQL}"
         exit
         ;;
      0305)
        cod_0305
        SQL="$( cod_0305 )"
        #echo "SQL passed: ${SQL}"
        exit
        ;;
      0306)
          cod_0306
          SQL="$( cod_0306 )"
          #echo "SQL passed: ${SQL}"
          exit
          ;;
      0350)
          cod_0350
          SQL="$( cod_0350 )"
          #echo "SQL passed: ${SQL}"
          exit
          ;;
   esac

   return ${SQL}
}

# 0101: ricerca libera di tutto da Elenco_Server_Listafinale
cod_0100(){
  #echo "0100: ricerca libera di tutto da Elenco_Server_Listafinale per tipo, istanza e server partenza"
  SQLSTRING="select ServerPartenza, FemsId_Fire, ServerArrivo, TipoFems2, StatoIstanze, DataCre from Elencoserver_Feng_Listafinale where TipoFems2 LIKE '%${TIP}%' and FemsId_Fire LIKE '%${IST}%' and ServerPartenza LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}

# 0101: ricerca libera di tutto da Elenco_Server_Listafinale
cod_0101(){
  #echo "0101: ricerca libera di tutto da Elenco_Server_Listafinale per tipo, istanza e server arrivo"
  SQLSTRING="select ServerPartenza, FemsId_Fire, ServerArrivo, TipoFems2, StatoIstanze, DataCre from Elencoserver_Feng_Listafinale where TipoFems2 LIKE '%${TIP}%' and FemsId_Fire LIKE '%${IST}%' and ServerArrivo LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}


# 0102: Macchine presenti nelle due tabelle
cod_0102(){
  #echo "0102: Macchine presenti nelle due tabelle"
  SQLSTRING="select distinct ServerPartenza, macchina from Elencoserver_Feng_Listafinale left join Elencoserver_Feng_2016 on Elencoserver_Feng_Listafinale.ServerPartenza = Elencoserver_Feng_2016.macchina order by macchina"
  echo "${SQLSTRING}"
}

# 0103: Istanze di tipo FemsWS migrate e situazione macchina da buttare
cod_0103(){
  #echo "0103: Istanze di tipo FemsWS migrate e situazione macchina da buttare"
  SQLSTRING="select ServerPartenza, daButtare, ServerArrivo, FemsId_Fire, TipoFems2, StatoIstanze, Elencoserver_Feng_Listafinale.DataCre as File_1, Da_Buttare.DataCre as File_2 from Elencoserver_Feng_Listafinale left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' and ServerPartenza LIKE '%${SRV}%' order by ServerPartenza, FemsId_Fire"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

  echo "${SQLSTRING}"
}

# 0105: lista delle istanze fatte per server di partenza
cod_0104(){
  #0105: lista delle istanze fatte per server di arrivo
  SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, ServerArrivo, StatoIstanze from Elencoserver_Feng_Listafinale where StatoIstanze like '%butta%' and FemsId_Fire LIKE '%${IST}%' and TipoFems2 LIKE '%${TIP}%' and ServerPartenza LIKE '%${SRV}%' order by ServerPartenza"
  echo "${SQLSTRING}"
}

# 0105: lista delle istanze fatte per server di arrivo
cod_0105(){
  #0105: lista delle istanze fatte per server di arrivo
  SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, ServerArrivo, StatoIstanze from Elencoserver_Feng_Listafinale where StatoIstanze like '%butta%' and FemsId_Fire LIKE '%${IST}%' and TipoFems2 LIKE '%${TIP}%' and ServerArrivo LIKE '%${SRV}%' order by ServerArrivo"
  echo "${SQLSTRING}"
}


# 0106: 0106: Lista delle istanze fatte con server di arrivo, partenza (da buttare) e check
cod_0106(){
  #echo "0106: Istanze di tipo FemsWS migrate e situazione macchina da buttare"
  SQLSTRING="select ServerPartenza, daButtare,StatoIstanze, Eliminata, ServerArrivo, FemsId_Fire, TipoFems2, Check_Istanze.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze on Elencoserver_Feng_Listafinale.FemsId_Fire = Istanza where StatoIstanze like '%butta%' and ServerPartenza LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" group by ServerPartenza,daButtare, ServerArrivo, FemsId_Fire, TipoFems2, StatoIstanze, Check_Istanze.Note, Eliminata order by ServerPartenza, FemsId_Fire;"
            #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

  echo "${SQLSTRING}"
}

#0107: Lista delle istanze da eliminare e check (ServerArrivo=ServerPartenza da buttare)
cod_0107(){
  #echo "0107: Lista delle istanze da eliminare e check (ServerArrivo=ServerPartenza da buttare)
  SQLSTRING="select ServerPartenza, daButtare,StatoIstanze, Eliminata, ServerArrivo, FemsId_Fire, TipoFems2, Check_Istanze.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze on Elencoserver_Feng_Listafinale.FemsId_Fire = Istanza where ServerPartenza=ServerArrivo and ServerPartenza LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" group by ServerPartenza,daButtare, ServerArrivo, FemsId_Fire, TipoFems2, StatoIstanze, Check_Istanze.Note, Eliminata order by ServerPartenza, FemsId_Fire;"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

  echo "${SQLSTRING}"
}

# 110 Lista della tabella Da_Buttare
cod_0110(){
   # 110 Lista della tabella Da_Buttare
   SQLSTRING="select daButtare, IP_Address, FV, Note, Eliminata, DataCre, id from Da_Buttare  where daButtare  LIKE '%${SRV}%' order by daButtare;"
   echo "${SQLSTRING}"
}


# 151 Mostra le istanze da migrare su nuovo server da definire con filtro su server partenza
cod_0151(){
   # 0151: Mostra le istanze da migrare su nuovo server da definire
  SQLSTRING="select ServerPartenza, Da_Buttare.Eliminata, Da_Buttare.Note,StatoIstanze, ServerArrivo, FemsId_Fire, TipoFems2, Check_Istanze.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze on Elencoserver_Feng_Listafinale.FemsId_Fire = Istanza where StatoIstanze like '%NUOVO%' and ServerPartenza LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" order by ServerPartenza, FemsId_Fire;"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

   echo "${SQLSTRING}"
}

# 152 Mostra le istanze da migrare su nuovo server da definire con filtro su server arrivo
cod_0152(){
   # 0152: Mostra le istanze da migrare su nuovo server da definire
  SQLSTRING="select ServerPartenza, Da_Buttare.Eliminata, Da_Buttare.Note,StatoIstanze, ServerArrivo, FemsId_Fire, TipoFems2, Check_Istanze.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze on Elencoserver_Feng_Listafinale.FemsId_Fire = Istanza where StatoIstanze like '%NUOVO%' and ServerArrivo LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" order by ServerPartenza, FemsId_Fire;"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

   echo "${SQLSTRING}"
}

# 155: Mostra la istanza e server FemsWS su YANG corrispondenti con filtro ad un istanza o server di partenza
cod_0155(){
  SQLSTRING="select distinct Client_FemsWs, Client_Host, Server_FemsWs,	Server_Host "
  SQLSTRING=${SQLSTRING}"from FemsWS_Circuit_Inst where Client_FemsWs LIKE '%${IST}%' and Client_Host LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}

# 156 Mostra la istanza e server FemsWS su YANG corrispondenti con filtro ad un istanza o server di arrivo
cod_0156(){
  SQLSTRING="select distinct Client_FemsWs, Client_Host, Server_FemsWs,	Server_Host "
  SQLSTRING=${SQLSTRING}"from FemsWS_Circuit_Inst where Server_FemsWs LIKE '%${IST}%' and Server_Host LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}

################################### da completare per FIRE  ##################################################################
# 157 Mostra la istanza e server FIRE su YANG corrispondenti ad un istanza o server di partenza
cod_0157(){
  SQLSTRING="select ServerId,FireId,NetPort,DataCre "
  SQLSTRING=${SQLSTRING}"from Fire where FireId LIKE '%${IST}%' and ServerId LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}

# 158 Mostra la istanza e server su YANG corrispondenti ad un istanza o server di arrivo
cod_0158(){
  SQLSTRING="select distinct Client_FemsWs, Client_Host, Server_FemsWs,	Server_Host "
  SQLSTRING=${SQLSTRING}"from FemsWS_Circuit_Inst where Server_FemsWs LIKE '%${IST}%' and Server_Host LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}
######################################################################################################################

# 159 Mostra la istanza e server su TANGRAM corrispondenti ad un istanza o server di partenza
cod_0159(){
  SQLSTRING="select ServerId,FemsId,EasId,Implementation, DataCre "
  SQLSTRING=${SQLSTRING}"from Tangram_Eas_Srv where Implementation LIKE '%${TIP}%' and FemsId LIKE '%${IST}%' and ServerId LIKE '%${SRV}%'"
  echo "${SQLSTRING}"
}




# 161 Elenco Istanze da listafinale
cod_0161(){
   # 0151: Mostra tutte le istanze e stato
   #echo "IST=${IST}"
   #exit
  SQLSTRING="select FemsId_Fire, TipoFems2, ServerPartenza, Da_Buttare.Eliminata, Da_Buttare.Note,StatoIstanze, ServerArrivo,  Check_Istanze.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze on Elencoserver_Feng_Listafinale.FemsId_Fire = Istanza where TipoFems2 LIKE '%${TIP}%' and FemsId_Fire LIKE '%${IST}%' and ServerPartenza LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" order by  ServerPartenza, FemsId_Fire ;"

   echo "${SQLSTRING}"
}

# 162 Elenco Istanze da 2016
cod_0162(){
   # 0151: Mostra tutte le istanze e stato
   #echo "IST=${IST}"
   #exit
  SQLSTRING="select Istanze, TipoIstanza, Macchina,  Versione, SpostareIn, Da_Buttare.Eliminata, Da_Buttare.Note,  Check_Istanze.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_2016 left join Da_Buttare on Elencoserver_Feng_2016.Macchina = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze on Elencoserver_Feng_2016.Istanze = Istanza where TipoIstanza LIKE '%${TIP}%' and Istanze LIKE '%${IST}%' and Macchina LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" order by  Macchina, Istanza ;"

   echo "${SQLSTRING}"
}

#0165: Mostra tutte le istanze presenti sia nella tabella listafinale che 2016
cod_0165(){
   # 0165: Mostra tutte le istanze presenti sia nella tabella listafinale che 2016 per ServerPartenza
   #echo "IST=${IST}"
   #exit
  SQLSTRING="select FemsId_Fire, ServerPartenza, Istanze, ServerArrivo,  Macchina, TipoIstanza, SpostareIn, Eliminata "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale join Elencoserver_Feng_2016 on Elencoserver_Feng_Listafinale.FemsId_Fire = Elencoserver_Feng_2016.Istanze "
  SQLSTRING=${SQLSTRING}"left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}" where FemsId_Fire != '' and TipoIstanza LIKE '%${TIP}%' and Istanze LIKE '%${IST}%' and ServerPartenza LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" order by  Istanze, ServerPartenza;"

   echo "${SQLSTRING}"
}

cod_0166(){
   # 0165: Mostra tutte le istanze presenti sia nella tabella listafinale che 2016 per Macchina
   #echo "IST=${IST}"
   #exit
  SQLSTRING="select FemsId_Fire, ServerPartenza, Istanze, TipoIstanza, ServerArrivo,  Macchina, B.ip, Versione,  SpostareIn, Eliminata  "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_Listafinale join Elencoserver_Feng_2016 as B on Elencoserver_Feng_Listafinale.FemsId_Fire = B.Istanze "
  SQLSTRING=${SQLSTRING}"left join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare "
  SQLSTRING=${SQLSTRING}" where FemsId_Fire != '' and TipoIstanza LIKE '%${TIP}%' and Istanze LIKE '%${IST}%' and Macchina LIKE '%${SRV}%'"
  SQLSTRING=${SQLSTRING}" order by  Istanze, Macchina;"

   echo "${SQLSTRING}"
}

cod_0201(){
  #echo "0201: Recupera tutte le info sulle macchine di Test"
  SQLSTRING="select name, ip_address, ObjectCat, DataCre from Anag_Srv where name LIKE '%${SRV}%' order by Name"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

  echo "${SQLSTRING}"
}

cod_0202(){
  #echo "0202: Recupera tutte le info dal PizzoTool"
  SQLSTRING="select Server, OS, FEMS_V, DNS_Server, RPC_ports,  Numero_CPU_Core_Type, RAM,  Ip_Address,  ActiveMQ "
  SQLSTRING=${SQLSTRING}"from Serverlist  "
  SQLSTRING=${SQLSTRING}" where  Server LIKE '%${SRV}%' and Ip_Address LIKE '%${IPA}%'"
  SQLSTRING=${SQLSTRING}" order by  Server;"

  echo "${SQLSTRING}"
}

cod_0205(){
  #echo "0201: Recupera tutte le info sulle macchine di Test"
  SQLSTRING="select name, ip_address, ObjectCat, DataCre, Note, Data from Anag_Srv left join Note_Server on name = server where name LIKE '%${SRV}%' order by Name"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

  echo "${SQLSTRING}"
}

cod_0210(){
  #echo "0210: Situazione macchine di test con macchine eliminate"
  SQLSTRING="select Name, Anag_Srv.IP_Address, Eliminata, Stato_Server.Stato, Stato_Server.StatoDesc, Note_Server.Data, Note_Server.Note from Anag_Srv left join Da_Buttare on Name = Da_Buttare.daButtare left join Note_Server on Name = Note_Server.Server left join Stato_Server on Name = Stato_Server.Server where Name LIKE '%${SRV}%' and Anag_Srv.IP_Address LIKE '%${IPA}%'   order by Name asc, Data desc"
  #SQLSTRING="select ServerPartenza, FemsId_Fire, TipoFems2, StatoIstanze, daButtare from Elencoserver_Feng_Listafinale right join Da_Buttare on Elencoserver_Feng_Listafinale.ServerPartenza = Da_Buttare.daButtare where StatoIstanze like '%butta%' order by ServerPartenza, FemsId_Fire"

  echo "${SQLSTRING}"
}

cod_0251(){
  #echo "0251: Situazione stato delle istanze per server partenza in lista finale"
  #SQLSTRING="select Istanza, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, Stato, StatoDesc, Data from Stato_Istanza left join Elencoserver_Feng_Listafinale as A on Istanza = FemsId_Fire where TipoFems2 LIKE '%${TIP}%' and ServerPartenza LIKE '%${SRV}%' and Istanza LIKE '%${IST}%' order by Istanza asc, ServerPartenza asc"
  #SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, C.Stato, C.StatoDesc, B.stato, B.statoDesc from Stato_Istanza as C left join Elencoserver_Feng_Listafinale as A  on A.FemsId_Fire = C.Istanza   left join Stato_Server as B on A.ServerPartenza = B.Server where A.TipoFems2 LIKE '%${TIP}%' and A.ServerPartenza LIKE '%${SRV}%' and A.FemsId_Fire LIKE '%${IST}%' order by A.ServerPartenza asc, A.FemsId_Fire asc"
  SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, C.Stato, C.StatoDesc "
  SQLSTRING=${SQLSTRING}"from Stato_Istanza as C left join Elencoserver_Feng_Listafinale as A  on A.FemsId_Fire = C.Istanza "
  SQLSTRING=${SQLSTRING}"where A.TipoFems2 LIKE '%${TIP}%' and A.ServerPartenza LIKE '%${SRV}%' and A.FemsId_Fire LIKE '%${IST}%' "
  SQLSTRING=${SQLSTRING}" order by A.ServerPartenza asc, A.FemsId_Fire asc"

  echo "${SQLSTRING}"
}

cod_0252(){
  #echo "0252: Situazione stato delle istanze in relazione a lista 2016 per server partenza"
  #SQLSTRING="select ServerPartenza, ServerArrivo, FemsId_Fire, StatoIstanze, stato, statoDesc, Data, TipoFems2, ServerArrivo from Elencoserver_Feng_Listafinale left join stato_istanza on FemsId_Fire=Istanza where TipoFems2 LIKE '%${TIP}%' and FemsId_Fire LIKE '%${IST}%' and ServerPartenza LIKE '%${SRV}%' order by Istanza asc, ServerPartenza asc"
  #SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, C.Stato, C.StatoDesc, B.Server, B.stato, B.statoDesc from  Elencoserver_Feng_Listafinale as A left join Stato_Istanza as C on A.FemsId_Fire = C.Istanza left join Stato_Server as B on A.ServerPartenza = B.Server where A.TipoFems2 LIKE '%${TIP}%' and A.ServerPartenza LIKE '%${SRV}%' and C.Istanza LIKE '%${IST}%' order by A.ServerPartenza asc, A.TipoFems2 asc"
  SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, C.Stato as I_Stato, C.StatoDesc as I_Desc, B.stato as S_Stato , B.statoDesc as S_Desc from  Elencoserver_Feng_Listafinale as A left join Stato_Istanza as C on A.FemsId_Fire = C.Istanza left join Stato_Server as B on A.ServerPartenza = B.Server where A.TipoFems2 LIKE '%${TIP}%' and A.ServerPartenza LIKE '%${SRV}%' and A.FemsId_Fire LIKE '%${IST}%' order by A.ServerPartenza asc, A.TipoFems2 asc , A.FemsId_Fire  asc"

  echo "${SQLSTRING}"
}

cod_0253(){
  #echo "0251: Situazione stato delle istanze per server arrivo"
  SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, Stato, StatoDesc, Data from Stato_Istanza left join Elencoserver_Feng_Listafinale as A on Istanza = FemsId_Fire where TipoFems2 LIKE '%${TIP}%' and ServerArrivo LIKE '%${SRV}%' and Istanza LIKE '%${IST}%' order by Istanza asc, ServerArrivo asc"

  echo "${SQLSTRING}"
}

cod_0254(){
  #echo "0252: Situazione stato delle istanze in relazione a lista finale per server arrivo"
  #SQLSTRING="select ServerPartenza, ServerArrivo, FemsId_Fire, StatoIstanze, stato, statoDesc, Data, TipoFems2, ServerArrivo from Elencoserver_Feng_Listafinale left join stato_istanza on FemsId_Fire=Istanza where TipoFems2 LIKE '%${TIP}%' and FemsId_Fire LIKE '%${IST}%' and ServerArrivo LIKE '%${SRV}%' oder by by Istanza asc, ServerArrivo asc"
  SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, C.Stato as I_Stato, C.StatoDesc as I_Desc, B.stato as S_Stato , B.statoDesc as S_Desc from  Elencoserver_Feng_Listafinale as A left join Stato_Istanza as C on A.FemsId_Fire = C.Istanza left join Stato_Server as B on A.ServerArrivo = B.Server where A.TipoFems2 LIKE '%${TIP}%' and A.ServerArrivo LIKE '%${SRV}%' and A.FemsId_Fire LIKE '%${IST}%' order by A.ServerArrivo asc, A.TipoFems2 asc , A.FemsId_Fire  asc"

  echo "${SQLSTRING}"
}

cod_0255(){
  #echo "0253: Situazione stato delle istanze in relazione a lista 2016"
  SQLSTRING="select Macchina, Istanze, SpostareIn, stato, statoDesc, Data, TipoIstanza from Elencoserver_Feng_2016 left join stato_istanza on Istanze=Istanza where Istanze LIKE '%${IST}%' and TipoIstanza LIKE '%${TIP}%' and Macchina LIKE '%${SRV}%'"

  echo "${SQLSTRING}"
}



cod_0261(){
  #echo "0261:  Situazione stato dei servers"
  SQLSTRING="select Server, Stato, StatoDesc, Data from Stato_Server where Server LIKE '%${SRV}%' order by Server asc"

  echo "${SQLSTRING}"
}


cod_0301(){
  #echo "0301: Lista la tabella dei check istanze"
  #SQLSTRING="select name, ip_address, ObjectCat, DataCre from Anag_Srv where name LIKE '%${SRV}%' order by Name"
  SQLSTRING="select id, Istanza, Tipo, Server, Note, DataCheck, Firma from Check_Istanze where  Tipo LIKE '%${TIP}%' and Istanza LIKE '%${IST}%' and Server LIKE '%${SRV}%' order by Istanza asc, DataCheck desc"
  #SQLSTRING='select * from Check_Istanze where  Tipo LIKE '%${TIP}%' and Istanza LIKE '%${IST}%' and Server LIKE '%${SRV}%' order by Istanza;'

  #SQLSTRING="select "
  #SQLSTRING=$SQLSTRING" * "
  #SQLSTRING=$SQLSTRING"from Check_Istanze where  Tipo LIKE '%${TIP}%' and Istanza LIKE '%${IST}%' and Server LIKE '%${SRV}%' order by Istanza;"

  echo "${SQLSTRING}"
}

cod_0305(){
  #echo "0305: Ricerca Istanze con Stato da listafinale"
  SQLSTRING="select A.FemsId_Fire, A.ServerPartenza, A.ServerArrivo, A.TipoFems2, C.Stato, C.StatoDesc "
  SQLSTRING=${SQLSTRING}"from Stato_Istanza as C left join Elencoserver_Feng_Listafinale as A  on A.FemsId_Fire = C.Istanza "
  SQLSTRING=${SQLSTRING}"where A.TipoFems2 LIKE '%${TIP}%' and A.ServerPartenza LIKE '%${SRV}%' and A.FemsId_Fire LIKE '%${IST}%' and  C.Stato LIKE '%${STATO}' "
  SQLSTRING=${SQLSTRING}" order by A.ServerPartenza asc, A.FemsId_Fire asc"

  echo "${SQLSTRING}"
}

cod_0306(){
  #echo "0306: Ricerca Istanze con Stato da 2016"
  SQLSTRING="select A.Istanze, D.Stato, D.StatoDesc, A.TipoIstanza, A.Macchina, E.Stato, E.StatoDesc,  A.Versione, A.SpostareIn, B.Eliminata, B.Note,  C.Note "
  SQLSTRING=${SQLSTRING}"from Elencoserver_Feng_2016 as A left join Da_Buttare as B on A.Macchina = B.daButtare "
  SQLSTRING=${SQLSTRING}"left join Check_Istanze as C on A.Istanze = C.Istanza left join Stato_istanza as D on A.Istanze = D.istanza left join Stato_Server as E on A.Macchina = E.server "
  SQLSTRING=${SQLSTRING}"where A.TipoIstanza LIKE '%${TIP}%' and A.Istanze LIKE '%${IST}%' and A.Macchina LIKE '%${SRV}%' and  D.Stato LIKE '%${STATO}'"
  SQLSTRING=${SQLSTRING}" order by  A.Macchina, A.Istanze ;"

  echo "${SQLSTRING}"
}



cod_0350(){
  #echo "0305: Ricerca Server con Stato dato dalla tabella stato_server"
  SQLSTRING="select Server, Stato, StatoDesc, Data from Stato_Server where Server LIKE '%${SRV}%' and Stato LIKE '%${STATO}' order by Data desc"

  echo "${SQLSTRING}"
}





echo "File: preloadQuery Loaded"
