-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 26 mai 2023 à 09:49
-- Version du serveur : 8.0.32
-- Version de PHP : 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `travel2`
--

-- --------------------------------------------------------

--
-- Structure de la table `campus`
--

DROP TABLE IF EXISTS `campus`;
CREATE TABLE IF NOT EXISTS `campus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9D0968115E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `campus`
--

INSERT INTO `campus` (`id`, `name`) VALUES
(25, 'BernierVille'),
(23, 'Carlier'),
(21, 'Chauveau'),
(24, 'De OliveiraBourg'),
(3, 'dieppe'),
(22, 'Turpin-sur-Masse');

-- --------------------------------------------------------

--
-- Structure de la table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip_code` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2D5B02345E237E06` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `name`, `zip_code`) VALUES
(5, 'Pottier-sur-Rey', 87278),
(6, 'Pasquier-la-Forêt', 12048),
(7, 'BruneauVille', 91075),
(8, 'Lemaire', 71266),
(9, 'Francois', 26580);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

DROP TABLE IF EXISTS `messenger_messages`;
CREATE TABLE IF NOT EXISTS `messenger_messages` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  KEY `IDX_75EA56E016BA31DB` (`delivered_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `place`
--

DROP TABLE IF EXISTS `place`;
CREATE TABLE IF NOT EXISTS `place` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_741D53CD8BAC62AF` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `place`
--

INSERT INTO `place` (`id`, `city_id`, `name`, `street`, `latitude`, `longitude`) VALUES
(5, 7, 'MartinezVille', 'rue Gautier', -48.256945, 94.73327),
(6, 7, 'Daviddan', 'impasse Guillou', 58.95135, -124.19162),
(7, 8, 'Vidal', 'rue de Merle', 10.776136, -28.207502),
(8, 6, 'Briand-sur-Antoine', 'chemin Bernier', -26.373545, 139.47024),
(9, 6, 'Morel', 'boulevard Roussel', -1.178222, 85.133211),
(10, 7, 'Jacob', 'place Alfred Allain', -52.341136, -42.959308),
(11, 9, 'Marchand-sur-Guibert', 'avenue Édouard Hubert', 70.227037, -68.834795),
(12, 9, 'Techer', 'rue de Daniel', 74.611444, -0.623412),
(13, 6, 'Sanchez', 'rue de Garcia', -27.531408, 159.133311),
(14, 7, 'AllainVille', 'rue Danielle Loiseau', -80.914238, 166.750519),
(15, 8, 'Roux', 'place Françoise Fontaine', 81.452652, -36.471261),
(16, 5, 'Guillaumeboeuf', 'impasse de Maurice', 89.355165, 25.292496),
(17, 6, 'Lebrundan', 'rue de Cordier', 34.736173, 64.966662),
(18, 5, 'Vaillant-sur-Mer', 'rue Benoît Michel', 84.171694, 179.973221),
(19, 9, 'Leleu', 'place Bouchet', -65.94377, 17.495181),
(20, 7, 'Letellier', 'chemin Faure', 58.077173, -81.705282),
(21, 7, 'LedouxBourg', 'place Antoine Allain', -27.031209, -124.865288),
(22, 7, 'Hubert', 'rue de Boutin', 17.393471, -148.018154),
(23, 7, 'Michel', 'place Morvan', -14.424072, 35.973798),
(24, 7, 'Leclerc-sur-Martins', 'avenue Andrée Benoit', -29.450032, -138.731603),
(25, 7, 'Ruiz', 'rue Salmon', -2.771714, -112.235236),
(26, 8, 'Lefebvre', 'boulevard Bertin', -4.553672, -86.172408),
(27, 8, 'Toussaint-sur-Sanchez', 'rue Maurice Jean', 60.909027, 25.952863),
(28, 5, 'MorvanBourg', 'place Stéphane Huet', -13.961413, -102.858179),
(29, 6, 'Gerarddan', 'rue de Andre', -26.463248, -10.372087),
(30, 5, 'Leduc', 'rue Marin', 45.907172, 173.709276),
(31, 6, 'GiraudVille', 'chemin Matthieu Hamon', -72.531864, 142.061768),
(32, 8, 'Verdier-les-Bains', 'rue Xavier Durand', 18.408314, -119.058422),
(33, 7, 'Le Goff', 'rue Bonnet', 46.376553, -130.52692),
(34, 5, 'DuhamelVille', 'boulevard Julien Ollivier', -26.077271, 137.916936),
(35, 6, 'Guyot', 'rue Dupuis', -23.415445, 115.936272),
(36, 7, 'Menard', 'impasse Agathe Leclercq', -85.86222, 99.487193),
(37, 8, 'Carre', 'rue de Pruvost', -10.813474, 76.85038),
(38, 7, 'Martinez-sur-Mer', 'avenue de Valette', 54.987914, -121.09335),
(39, 8, 'Jacques', 'rue Éléonore Besson', 26.93793, 168.798042),
(40, 5, 'Breton', 'place Guyot', 36.750426, 150.562098),
(41, 5, 'Thomas-sur-Mer', 'chemin Claire Masse', 23.914914, -31.867555),
(42, 5, 'Delaunay-sur-Lacombe', 'rue de Charrier', -32.230457, -178.476493),
(43, 8, 'Vidal', 'impasse de Maillard', 66.048289, 88.680415),
(44, 9, 'Pires', 'rue Benoit', 19.793293, 82.944746),
(45, 9, 'RogerBourg', 'boulevard Suzanne Pruvost', 23.792549, 7.496705),
(46, 6, 'Arnaud-sur-Lefebvre', 'chemin Céline Brunel', -23.907088, -141.030145),
(47, 8, 'Bertrand', 'place de Le Gall', -76.925812, -23.618916),
(48, 9, 'Hardy', 'rue de Colas', 24.032915, -104.00412),
(49, 6, 'FernandezVille', 'impasse de Becker', -70.439633, 22.278697),
(50, 8, 'Legrand', 'boulevard de Teixeira', 29.844983, 140.535612),
(51, 7, 'Pires', 'rue Seguin', -82.990809, 107.72156),
(52, 7, 'Delorme-sur-Rodrigues', 'boulevard Dubois', -58.300503, -87.402096),
(53, 7, 'Royer', 'rue Jeannine Delannoy', 83.906644, -116.217721),
(54, 8, 'Guyot-les-Bains', 'avenue Alice Roche', -84.199602, 133.404872);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

DROP TABLE IF EXISTS `reset_password_request`;
CREATE TABLE IF NOT EXISTS `reset_password_request` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `selector` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  KEY `IDX_7CE748AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `wording` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `wording`) VALUES
(1, 'Créée'),
(2, 'Ouverte'),
(3, 'Clôturée'),
(4, 'Activité en cours'),
(5, 'Passée'),
(6, 'Annulée');

-- --------------------------------------------------------

--
-- Structure de la table `travel`
--

DROP TABLE IF EXISTS `travel`;
CREATE TABLE IF NOT EXISTS `travel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `leader_id` int NOT NULL,
  `status_id` int NOT NULL,
  `campus_organiser_id` int NOT NULL,
  `place_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_start` datetime NOT NULL,
  `duration` time NOT NULL,
  `limit_date_subscription` datetime NOT NULL,
  `nb_max_traveler` int NOT NULL,
  `infos` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancel_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_2D0B6BCE73154ED4` (`leader_id`),
  KEY `IDX_2D0B6BCE6BF700BD` (`status_id`),
  KEY `IDX_2D0B6BCEF2EF26CE` (`campus_organiser_id`),
  KEY `IDX_2D0B6BCEDA6A219` (`place_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `travel`
--

INSERT INTO `travel` (`id`, `leader_id`, `status_id`, `campus_organiser_id`, `place_id`, `name`, `date_start`, `duration`, `limit_date_subscription`, `nb_max_traveler`, `infos`, `cancel_message`) VALUES
(20, 11, 3, 23, 40, 'massage en spa', '2023-06-04 22:37:00', '12:00:00', '2023-05-10 00:00:00', 14, 'qds', NULL),
(25, 11, 2, 23, 33, 'RTHRT', '2023-05-27 10:39:00', '07:00:00', '2023-05-27 00:00:00', 15, 'THRT', NULL),
(26, 11, 2, 23, 40, 'on essaye', '2023-06-10 11:43:00', '07:00:00', '2023-05-29 00:00:00', 14, 'dfgdgf', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_campus_id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `actif` tinyint(1) NOT NULL,
  `avatar_filesname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  UNIQUE KEY `UNIQ_8D93D64986CC499D` (`pseudo`),
  KEY `IDX_8D93D649AFBDD805` (`user_campus_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `user_campus_id`, `email`, `roles`, `password`, `pseudo`, `lastname`, `firstname`, `phone_number`, `admin`, `actif`, `avatar_filesname`) VALUES
(9, 21, 'admin1@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$dg6J2UK6RmRK5ANcsaVs9OSSWhyylFr.AOufFvgxTby570VUWQopO', 'Admin1', 'Numero1', 'Admin', '0202020202', 0, 1, 'avatarUser9.webp'),
(10, 25, 'admin2@admin.com', '[\"ROLE_ADMIN\"]', '$2y$13$dg6J2UK6RmRK5ANcsaVs9OSSWhyylFr.AOufFvgxTby570VUWQopO', 'Admin2', 'Numero2', 'Admin', '0202020202', 0, 1, NULL),
(11, 23, 'organiser1@organiser.com', '[\"ROLE_ORGANISER\"]', '$2y$13$dg6J2UK6RmRK5ANcsaVs9OSSWhyylFr.AOufFvgxTby570VUWQopO', 'Orga1', 'Numero1', 'Organiser', '0202020202', 0, 1, NULL),
(12, 22, 'organiser2@organiser.com', '[\"ROLE_ORGANISER\"]', '$2y$13$dg6J2UK6RmRK5ANcsaVs9OSSWhyylFr.AOufFvgxTby570VUWQopO', 'Orga2', 'Numero2', 'Organiser', '0202020202', 0, 1, 'avatarUser12.webp'),
(13, 21, 'user1@user.com', '[\"ROLE_USER\"]', '$2y$13$dg6J2UK6RmRK5ANcsaVs9OSSWhyylFr.AOufFvgxTby570VUWQopO', 'User1', 'Numero1', 'User', '0202020202', 0, 1, 'avatarUser13.webp'),
(14, 25, 'user2@user.com', '[\"ROLE_USER\"]', '$2y$13$dg6J2UK6RmRK5ANcsaVs9OSSWhyylFr.AOufFvgxTby570VUWQopO', 'User2', 'Numero2', 'User', '0202020202', 0, 1, NULL),
(15, 3, 'namjoon@test.com', '[\"ROLE_ADMIN\"]', '$2y$13$eOMjnpHsEffKgQg6TssnQ.vuDci4isVM9DtyZwJJt2/lP5fIX8fZ6', 'RM', 'Kim', 'Namjoon', '0505050200', 0, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user_travel`
--

DROP TABLE IF EXISTS `user_travel`;
CREATE TABLE IF NOT EXISTS `user_travel` (
  `user_id` int NOT NULL,
  `travel_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`travel_id`),
  KEY `IDX_485970F3A76ED395` (`user_id`),
  KEY `IDX_485970F3ECAB15B3` (`travel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_travel`
--

INSERT INTO `user_travel` (`user_id`, `travel_id`) VALUES
(11, 20),
(11, 25),
(11, 26);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `FK_741D53CD8BAC62AF` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `travel`
--
ALTER TABLE `travel`
  ADD CONSTRAINT `FK_2D0B6BCE6BF700BD` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  ADD CONSTRAINT `FK_2D0B6BCE73154ED4` FOREIGN KEY (`leader_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_2D0B6BCEDA6A219` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`),
  ADD CONSTRAINT `FK_2D0B6BCEF2EF26CE` FOREIGN KEY (`campus_organiser_id`) REFERENCES `campus` (`id`);

--
-- Contraintes pour la table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FK_8D93D649AFBDD805` FOREIGN KEY (`user_campus_id`) REFERENCES `campus` (`id`);

--
-- Contraintes pour la table `user_travel`
--
ALTER TABLE `user_travel`
  ADD CONSTRAINT `FK_485970F3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_485970F3ECAB15B3` FOREIGN KEY (`travel_id`) REFERENCES `travel` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
