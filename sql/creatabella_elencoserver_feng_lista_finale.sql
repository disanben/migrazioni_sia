
USE migrazioni;

DROP TABLE IF EXISTS `Elencoserver_Feng_Listafinale`; 

CREATE TABLE `Elencoserver_Feng_Listafinale` ( 
`SITO` VARCHAR(15),
`ServerPartenza` VARCHAR(15),
`SITOARR` VARCHAR(15),
`Server ARRIVO` VARCHAR(15),
`stato instanze` VARCHAR(30),
`Flag2` VARCHAR(15),
`FemsId/Fire` VARCHAR(15),
`Colonna1` VARCHAR(15),
`COLONNA12` VARCHAR(15),
`TIPO FEMS2` VARCHAR(15),
`EASID2` VARCHAR(15),
`EP utilizzato` VARCHAR(15),
`ROLE2` VARCHAR(15),
`EP utilizzato3` VARCHAR(15),
`Performance` VARCHAR(15),
`Vers` VARCHAR(15),
`IP` VARCHAR(30),
`Colonna22` VARCHAR(15), 
`NOTE` VARCHAR(30));

ALTER TABLE `Elencoserver_Feng_Listafinale` 
ADD `id` INT AUTO_INCREMENT NOT NULL,
ADD PRIMARY KEY (`id`)
