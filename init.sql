CREATE DATABASE IF NOT EXISTS `gestitrain` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `gestitrain`;


CREATE TABLE IF NOT EXISTS `gare` (
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


CREATE TABLE IF NOT EXISTS `train` (
  `ID_train` int(10) NOT NULL,
  `Heure_départ` datetime NOT NULL,
  `Heure_arrivée` datetime NOT NULL,
  `ID_gare_départ` int(10) NOT NULL REFERENCES gare(ID_gare),
  `ID_gare_arrivée` int(10) NOT NULL REFERENCES gare(ID_gare)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


INSERT INTO `train` (`ID_train`, `Heure_départ`, `Heure_arrivée`, `ID_gare_départ`, `ID_gare_arrivée`) VALUES
(1000, '2020-01-21 08:00:00', '2020-01-21 10:00:00', 1, 2),
(1010, '2020-01-21 08:30:00', '2020-01-21 09:45:00', 6, 1);


COMMIT;
