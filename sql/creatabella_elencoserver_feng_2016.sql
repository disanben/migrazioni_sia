
USE migrazioni

DROP TABLE IF EXISTS `Elencoserver_Feng_2016` 

CREATE TABLE `Elencoserver_Feng_2016` (
`macchina` VARCHAR(15),
`tipo macchina` VARCHAR(15),
`spostare in` VARCHAR(15),
`istanze` VARCHAR(15),
`tipo istanza` VARCHAR(15),
`easid` VARCHAR(15),
`ruolo` VARCHAR(15),
`performance` VARCHAR(15),
`versione` VARCHAR(25),
`ip` VARCHAR(15),
`SO` VARCHAR(15),
`note` VARCHAR(15))



ALTER TABLE `Elencoserver_Feng_2016` 
ADD `id` INT AUTO_INCREMENT NOT NULL,
ADD PRIMARY KEY (`id`)


