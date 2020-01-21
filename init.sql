CREATE DATABASE IF NOT EXISTS `gestitrain` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `gestitrain`;


CREATE TABLE `gare` (
  `ID_gare` int(10) NOT NULL,
  `Nom_gare` varchar(20) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `gare` (`ID_gare`, `Nom_gare`) VALUES
(1, 'Lyon'),
(2, 'Paris'),
(3, 'Nantes'),
(4, 'Marseille'),
(5, 'Veauche'),
(6, 'Tassin');


CREATE TABLE `train` (
  `ID_train` int(10) NOT NULL,
  `Heure_départ` datetime NOT NULL,
  `Heure_arrivée` datetime NOT NULL,
  `ID_gare_départ` int(10) NOT NULL,
  `ID_gare_arrivée` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `train` (`ID_train`, `Heure_départ`, `Heure_arrivée`, `ID_gare_départ`, `ID_gare_arrivée`) VALUES
(1000, '2020-01-21 08:00:00', '2020-01-21 10:00:00', 1, 2),
(1010, '2020-01-21 08:30:00', '2020-01-21 09:45:00', 6, 1);


ALTER TABLE `gare`
  ADD PRIMARY KEY (`ID_gare`);


ALTER TABLE `train`
  ADD PRIMARY KEY (`ID_train`),
  ADD KEY `gareariv` (`ID_gare_arrivée`)
  ADD KEY `garedep` (`ID_gare_départ`);
  
ALTER TABLE `tgv`
  ADD CONSTRAINT `gareariv` FOREIGN KEY (`ID_gare_arrivée`) REFERENCES `gare` (`ID_gare`),
  ADD CONSTRAINT `garedep` FOREIGN KEY (`ID_gare_départ`) REFERENCES `gare` (`ID_gare`);
  
COMMIT;
