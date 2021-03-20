--
-- Structure de la base de données
--

CREATE DATABASE IF NOT EXISTS `gestionnaire_livres` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `gestionnaire_livres`;

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('USER','ADMIN') DEFAULT NULL,
  `date_inscription` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `livre`;
CREATE TABLE IF NOT EXISTS `livre` (
  `id_livre` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `auteur` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_publication` timestamp NULL DEFAULT NULL,
  `id_utilisateur` int(11),
  `id_liste` int(11),
  PRIMARY KEY (`id_livre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `liste`;
CREATE TABLE IF NOT EXISTS `liste` (
  `id_liste` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) DEFAULT NULL,
  `type` enum('PUBLIC','PRIVÉ') DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `taille` int(2) DEFAULT NULL,
  `date_publication` timestamp NULL DEFAULT NULL,
  `date_modif` timestamp NULL DEFAULT NULL,
  `id_utilisateur` int(11),
  PRIMARY KEY (`id_liste`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `livre` 
	ADD CONSTRAINT FK_LivreUtilisateur
	FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE;
	ADD CONSTRAINT FK_LivreListe
	FOREIGN KEY (id_liste) REFERENCES liste(id_liste) ON DELETE CASCADE;


ALTER TABLE `liste` 
	ADD CONSTRAINT FK_ListeUtilisateur
	FOREIGN KEY (id_utilisateur) REFERENCES utilisateur(id_utilisateur) ON DELETE CASCADE;


--
-- Jeu de données de la table `liste`, `utilisateur` et `livre`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `pseudo`, `email`, `password`, `role`, `date_inscription`) VALUES
(1, 'Limsa13', 'limsa@gmail.fr', 'salim13', 'ADMIN', '2020-06-18 06:00:00'),
(2, 'PeterParker13', 'parker@gmail.fr', 'parker13', 'ADMIN', '2020-06-18 06:00:00'),
(3, 'inconnu13', 'inconnu@gmail.fr', 'inconnu13', 'USER', '2020-06-18 06:00:00');

INSERT INTO `liste` (`id_liste`, `titre`, `type`, `description`, `taille`, `date_publication`, `date_modif`, `id_utilisateur`) VALUES
(1, 'SpiderBook', 'PUBLIC', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Temporibus minima labore debitis pariatur vero nulla facere ipsum. Ullam excepturi molestiae, impedit ratione vel sit doloremque, quo iure consequatur alias quaerat.', 2, '2021-03-20 17:39:40', '2021-03-20 17:39:40', 2),
(2, 'Assassin\'s Creed', 'PRIVÉ', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Temporibus minima labore debitis pariatur vero nulla facere ipsum. Ullam excepturi molestiae.', 6, '2021-03-20 17:39:40', '2021-03-20 17:39:40', 1);

INSERT INTO `livre` (`id_livre`, `titre`, `auteur`, `description`, `image`, `date_publication`, `id_utilisateur`, `id_liste`) VALUES
(1, 'Assassin\'s creed Russia', 'Ezio Auditore', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Temporibus minima labore debitis pariatur vero nulla facere ipsum. Ullam excepturi molestiae, impedit ratione vel sit doloremque, quo iure consequatur alias quaerat.', NULL, '2021-03-20 17:53:07', 1, 2),
(2, 'Spiderman 2039', 'Connor McGregor', 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Temporibus minima labore debitis pariatur vero nulla facere ipsum.', NULL, '2021-03-20 17:59:28', 2, 1);



