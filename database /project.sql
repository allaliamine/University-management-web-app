-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : mer. 02 oct. 2024 à 18:26
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `project`
--

-- --------------------------------------------------------

--
-- Structure de la table `Abscence`
--

CREATE TABLE `Abscence` (
  `IdAbscence` int(11) NOT NULL,
  `Duree` double DEFAULT NULL,
  `Date_abscence` date DEFAULT NULL,
  `Type` varchar(20) DEFAULT NULL,
  `Etat` varchar(10) DEFAULT NULL,
  `IdProf` int(11) DEFAULT NULL,
  `idEtudiant` int(11) DEFAULT NULL,
  `idModule` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Abscence`
--

INSERT INTO `Abscence` (`IdAbscence`, `Duree`, `Date_abscence`, `Type`, `Etat`, `IdProf`, `idEtudiant`, `idModule`) VALUES
(53, 2, '2024-05-16', 'Cours', 'NJ', 9, 50, 71),
(54, 2, '2024-05-16', 'Cours', 'J', 9, 51, 71),
(55, 2, '2024-05-18', 'Cours', 'NJ', 9, 6, 20),
(56, 2, '2024-05-18', 'Cours', 'NJ', 9, 10, 20),
(57, 2, '2024-05-20', 'Cours', 'NJ', 9, 21, 9),
(58, 2, '2024-05-20', 'Cours', 'NJ', 9, 22, 9),
(59, 2, '2024-05-20', 'Cours', 'NJ', 9, 23, 9),
(60, 2, '2024-05-20', 'Cours', 'NJ', 9, 24, 9),
(61, 2, '2024-05-20', 'Cours', 'NJ', 9, 25, 9),
(62, 2, '2024-05-20', 'TD', 'NJ', 9, 1, 71),
(63, 2, '2024-05-20', 'TD', 'NJ', 9, 50, 71),
(64, 2, '2024-05-20', 'TD', 'NJ', 9, 51, 71),
(65, 2, '2024-05-31', 'TP', 'NJ', 9, 50, 71),
(66, 2, '2024-05-31', 'TP', 'NJ', 9, 51, 71),
(67, 2, '2024-05-31', 'Cours', 'NJ', 9, 1, 71),
(68, 2, '2024-05-31', 'Cours', 'NJ', 9, 2, 71),
(69, 2, '2024-06-01', 'Cours', 'NJ', 9, 1, 71),
(70, 2, '2024-06-01', 'Cours', 'NJ', 9, 4, 71),
(71, 2, '2024-06-01', 'Cours', 'NJ', 9, 50, 71),
(72, 2, '2024-06-01', 'Cours', 'NJ', 9, 51, 71);

-- --------------------------------------------------------

--
-- Structure de la table `Admin`
--

CREATE TABLE `Admin` (
  `IdAdmin` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `CIN` varchar(8) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL,
  `Activite` char(1) DEFAULT NULL,
  `IdCompte` int(11) DEFAULT NULL,
  `Idrole` int(11) DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Mdp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Admin`
--

INSERT INTO `Admin` (`IdAdmin`, `Nom`, `Prenom`, `CIN`, `Email`, `Tel`, `Activite`, `IdCompte`, `Idrole`, `Login`, `Mdp`) VALUES
(1, 'El-Hlaissi', 'Nada', 'CD792463', 'Nadaelhlaissi@uae.adm.ac.ma', 622322281, 'A', 1, 0, 'Nadaelhlaissi@uae.adm.ac.ma', 'XXXXXX');

-- --------------------------------------------------------

--
-- Structure de la table `Annonce`
--

CREATE TABLE `Annonce` (
  `IdAnnonce` int(11) NOT NULL,
  `Titre` varchar(150) DEFAULT NULL,
  `Descriptif` varchar(200) DEFAULT NULL,
  `Nom_fichier` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `IdAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Annonce`
--

INSERT INTO `Annonce` (`IdAnnonce`, `Titre`, `Descriptif`, `Nom_fichier`, `date`, `IdAdmin`) VALUES
(29, 'Examen final', 'avis de l\'examen final de tdia', 'exam_tdia.pdf', '2024-05-31', 1),
(30, 'avis', 'avis concernant l\'inscription a l\'internat', 'internat.pdf', '2024-05-31', 1),
(31, 'seance de ratt', 'rattrapage pour les gi1 du module theorie de language', 'ratt_gi1.pdf', '2024-05-31', 1),
(32, 'avis pour les IDs', 'visite a Atos casablanca', 'IDs_annonce.pdf', '2024-05-31', 1),
(33, 'matlab', 'qwertyui', 'TD1_insudtrie.pdf', '2024-06-01', 1);

-- --------------------------------------------------------

--
-- Structure de la table `annonce_niveau`
--

CREATE TABLE `annonce_niveau` (
  `IdAnnonce` int(11) NOT NULL,
  `IdNiveau` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `annonce_niveau`
--

INSERT INTO `annonce_niveau` (`IdAnnonce`, `IdNiveau`) VALUES
(29, 7),
(30, 1),
(30, 2),
(30, 3),
(30, 4),
(30, 5),
(30, 6),
(30, 7),
(31, 1),
(32, 2),
(32, 4),
(32, 6),
(33, 7);

-- --------------------------------------------------------

--
-- Structure de la table `calendrierevent`
--

CREATE TABLE `calendrierevent` (
  `IdEvent` int(11) NOT NULL,
  `Titre` varchar(50) DEFAULT NULL,
  `DateStart` date DEFAULT NULL,
  `DateEnd` date DEFAULT NULL,
  `IdNiveau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `calendrierevent`
--

INSERT INTO `calendrierevent` (`IdEvent`, `Titre`, `DateStart`, `DateEnd`, `IdNiveau`) VALUES
(1, 'rapport du web', '2024-05-18', '2024-05-18', 7),
(2, 'test rapport2', '2024-06-06', '2024-06-06', 7),
(3, 'rapport sur KNN', '2024-06-05', '2024-06-05', 2);

-- --------------------------------------------------------

--
-- Structure de la table `Compte`
--

CREATE TABLE `Compte` (
  `IdCompte` int(11) NOT NULL,
  `Idrole` int(11) DEFAULT NULL,
  `Login` varchar(256) DEFAULT NULL,
  `Mdp` char(255) DEFAULT NULL,
  `Activite` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Compte`
--

INSERT INTO `Compte` (`IdCompte`, `Idrole`, `Login`, `Mdp`, `Activite`) VALUES
(1, 0, 'Nadaelhlaissi@uae.adm.ac.ma', 'XXXX', 'A'),
(2, 1, 'yabouelhanoune@uae.prof.ac.ma', 'elhanoune123', 'A'),
(3, 1, 'm.addam@uae.prof.ac.ma', 'addam123', 'A'),
(4, 1, 'abahri@uae.prof.ac.ma', 'bahri123', 'A'),
(5, 1, 't.boudaa@uae.prof.ac.ma', 'boudaa123', 'A'),
(6, 1, 'ebouazza@uae.prof.ac.ma', 'bouazza123', 'A'),
(7, 1, 'm.cherradi@uae.prof.ac.ma', 'cherradi123', 'A'),
(8, 1, 'w.dadi@uae.prof.ac.ma', 'dadi123', 'A'),
(9, 1, 'f.moradi@uae.prof.ac.ma', 'moradi123', 'A'),
(10, 1, 'asalmani@uae.prof.ac.ma', 'salmani123', 'A'),
(11, 1, 'ahmoussaid@uae.prof.ac.ma', 'moussaid123', 'A'),
(12, 2, 'laila.ahmadi@uae.etu.ac.ma', 'laila123', 'A'),
(13, 2, 'meryem.alaoui@uae.etu.ac.ma', 'meryem123', 'A'),
(14, 2, 'zineb.maach@uae.etu.ac.ma', 'zineb123', 'A'),
(15, 2, 'Amine.allali@uae.etu.ac.ma', 'allali123', 'A'),
(16, 2, 'insaf.badri@uae.etu.ac.ma', 'insaf123', 'A'),
(17, 2, 'maroua.seghir@uae.etu.ac.ma', 'maroua123', 'D'),
(18, 2, 'soukaina.hanafi@uae.etu.ac.ma', 'soukaina123', 'A'),
(19, 2, 'amine.essaouiqi@uae.etu.ac.ma', 'amine123', 'A'),
(20, 2, 'anas.hakimi@uae.etu.ac.ma', 'anas123', 'A'),
(21, 2, 'ahlam.ouarti@uae.etu.ac.ma', 'ahlam123', 'A'),
(22, 2, 'hajar.zniti@uae.etu.ac.ma', 'hajar123', 'A'),
(23, 2, 'ayman.amarti@uae.etu.ac.ma', 'ayman123', 'A'),
(24, 2, 'mohamed.jebarri@uae.etu.ac.ma', 'mohamed123', 'A'),
(25, 2, 'yasmine.rahhaoui@uae.etu.ac.ma', 'yasmine123', 'A'),
(26, 2, 'manal.kasimi@uae.etu.ac.ma', 'manal123', 'A'),
(27, 2, 'amal.wahibi@uae.etu.ac.ma', 'amal123', 'A'),
(28, 2, 'asmae.ouazani@uae.etu.ac.ma', 'asmae123', 'A'),
(29, 2, 'fatima.imzouri@uae.etu.ac.ma', 'fatima123', 'A'),
(30, 2, 'houda.hanafi@uae.etu.ac.ma', 'houda321', 'A'),
(31, 2, 'yassin.kaabi@uae.etu.ac.ma', 'yassin321', 'A'),
(32, 2, 'ouafae.outmani@uae.etu.ac.ma', 'ouafae321', 'A'),
(33, 2, 'yahya.aarab@uae.etu.ac.ma', 'yahya321', 'A'),
(34, 2, 'yassir.fillali@uae.etu.ac.ma', 'yassir321', 'D'),
(35, 2, 'nadia.idari@uae.etu.ac.ma', 'nadia321', 'A'),
(36, 2, 'niema.choukri@uae.etu.ac.ma', 'niema321', 'A'),
(37, 2, 'sanae.raghibi@uae.etu.ac.ma', 'sanae321', 'A'),
(38, 2, 'meryem.moujahid@uae.etu.ac.ma', 'meryem321', 'A'),
(39, 2, 'samia.sami@uae.etu.ac.ma', 'samia321', 'A'),
(40, 2, 'amina.mellouki@uae.etu.ac.ma', 'amina321', 'A'),
(41, 2, 'rayan.nali@uae.etu.ac.ma', 'rayan321', 'A'),
(42, 2, 'khadija.stitou@uae.etu.ac.ma', 'khadija321', 'A'),
(43, 2, 'oussama.hami@uae.etu.ac.ma', 'oussama321', 'A'),
(44, 2, 'jaouad.malki@uae.etu.ac.ma', 'jaouad321', 'A'),
(45, 2, 'roukaya.fathi@uae.etu.ac.ma', 'rouakaya321', 'A'),
(46, 2, 'ismail.ismaili@uae.etu.ac.ma', 'ismail321', 'A'),
(61, 2, 'hamidhamdon@etu.uae.ac.ma', 'ab949b5e7422bdea7f848f76a701cfa8259324e1cb11832f59abe25fdee409da', 'A'),
(62, 2, 'olamohamed@etu.uae.ac.ma', 'ola123', 'A');

-- --------------------------------------------------------

--
-- Structure de la table `Consultation_annonce`
--

CREATE TABLE `Consultation_annonce` (
  `IdAnnonce` int(11) NOT NULL,
  `IdEtudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Consultation_annonce`
--

INSERT INTO `Consultation_annonce` (`IdAnnonce`, `IdEtudiant`) VALUES
(29, 1),
(30, 1),
(31, 1),
(32, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Consultation_cours`
--

CREATE TABLE `Consultation_cours` (
  `IdCours` int(11) NOT NULL,
  `IdEtudiant` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `Cours`
--

CREATE TABLE `Cours` (
  `IdCours` int(11) NOT NULL,
  `Nom` varchar(255) NOT NULL,
  `Type` varchar(20) NOT NULL,
  `etat` varchar(20) NOT NULL,
  `IdProf` int(11) NOT NULL,
  `IdNiveau` int(11) NOT NULL,
  `IdModule` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Cours`
--

INSERT INTO `Cours` (`IdCours`, `Nom`, `Type`, `etat`, `IdProf`, `IdNiveau`, `IdModule`) VALUES
(8, 'chap1_insudtrie.pdf', 'Cours', 'desarchiver', 9, 7, 71),
(9, 'chap2_insudtrie.pdf', 'Cours', 'desarchiver', 9, 7, 71),
(10, 'TD1_insudtrie.pdf', 'TD', 'desarchiver', 9, 7, 71);

-- --------------------------------------------------------

--
-- Structure de la table `Etudiant`
--

CREATE TABLE `Etudiant` (
  `IdEtudiant` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `CIN` varchar(8) DEFAULT NULL,
  `CNE` varchar(15) DEFAULT NULL,
  `Sexe` char(1) DEFAULT NULL,
  `Date_naissance` date DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL,
  `Activite` char(1) DEFAULT NULL,
  `IdCompte` int(11) DEFAULT NULL,
  `Idrole` int(11) DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Mdp` varchar(15) DEFAULT NULL,
  `IdAdmin` int(11) DEFAULT NULL,
  `IdNiveau` int(11) DEFAULT NULL,
  `IdFiliere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Etudiant`
--

INSERT INTO `Etudiant` (`IdEtudiant`, `Nom`, `Prenom`, `CIN`, `CNE`, `Sexe`, `Date_naissance`, `Email`, `Tel`, `Activite`, `IdCompte`, `Idrole`, `Login`, `Mdp`, `IdAdmin`, `IdNiveau`, `IdFiliere`) VALUES
(1, 'allali', 'mohamed amine', 'R373102', 'S130003719', 'H', '2003-01-20', 'amine@gmail.com', 671709134, 'A', 15, 2, 'amine.allali@uae.etu.ac.ma', 'allali123', 1, 7, 3),
(2, 'ahmadi', 'laila', 'R390702', 'S130006743', 'F', '2002-05-10', 'laila.ahmadi@uae.etu.ac.ma', 601020344, 'A', 12, 2, 'laila.ahmadi@uae.etu.ac.ma', 'laila123', 1, 7, 3),
(3, 'alaoui', 'meryem', 'D370402', 'F145006743', 'F', '2000-05-10', 'meryem.alaoui@uae.etu.ac.ma', 601763344, 'A', 13, 2, 'meryem.alaoui@uae.etu.ac.ma', 'meryem123', 1, 7, 3),
(4, 'maach', 'zineb', 'G650402', 'L147606743', 'F', '2003-07-15', 'zineb.maach@uae.etu.ac.ma', 621364644, 'A', 14, 2, 'zineb.maach@uae.etu.ac.ma', 'zineb123', 1, 7, 3),
(5, 'badri', 'insaf', 'N351002', 'N147600043', 'F', '2002-01-01', 'insaf.badri@uae.etu.ac.ma', 677064094, 'A', 16, 2, 'insaf.badri@uae.etu.ac.ma', 'insaf123', 1, 7, 3),
(6, 'seghir', 'maroua', 'P384802', 'S117243719', 'F', '2002-08-26', 'maroua.seghir@uae.etu.ac.ma', 635240975, 'D', 17, 2, 'maroua.seghir@uae.etu.ac.ma', 'maroua123', 1, 2, 2),
(7, 'hanafi', 'soukaina', 'Y672543', 'D137900709', 'F', '2004-05-26', 'soukaina.hanafi@uae.etu.ac.ma', 678345332, 'A', 18, 2, 'soukaina.hanafi@uae.etu.ac.ma', 'soukaina123', 1, 2, 2),
(8, 'essaouiqi', 'amine', 'B671009', 'R230700709', 'H', '2002-03-17', 'amine.essaouiqi@uae.etu.ac.ma', 689005456, 'A', 19, 2, 'amine.essaouiqi@uae.etu.ac.ma', 'amine123', 1, 2, 2),
(9, 'hakimi', 'anas', 'U129836', 'H129865341', 'H', '2005-03-29', 'anas.hakimi@uae.etu.ac.ma', 698884312, 'A', 20, 2, 'anas.hakimi@uae.etu.ac.ma', 'anas123', 1, 2, 2),
(10, 'ouarti', 'ahlam', 'T123465', 'P12986789', 'F', '2002-02-01', 'ahlam.ouarti@uae.etu.ac.ma', 765201936, 'A', 21, 2, 'ahlam.ouarti@uae.etu.ac.ma', 'ahlam123', 1, 2, 2),
(11, 'zniti', 'hajar', 'R537209', 'F24351093', 'F', '2002-06-22', 'hajar.zniti@uae.etu.ac.ma', 712345678, 'A', 22, 2, 'hajar.zniti@uae.etu.ac.ma', 'hajar123', 1, 4, 2),
(12, 'amarti', 'ayman', 'U093473', 'D19482503', 'H', '2005-05-24', 'ayman.amarti@uae.etu.ac.ma', 745102934, 'A', 23, 2, 'ayman.amarti@uae.etu.ac.ma', 'ayman123', 1, 4, 2),
(13, 'jebarri', 'mohamed', 'K837253', 'R92735619', 'H', '2004-12-12', 'mohamed.jebarri@uae.etu.ac.ma', 617194356, 'A', 24, 2, 'mohamed.jebarri@uae.etu.ac.ma', 'mohamed123', 1, 4, 2),
(14, 'rahhaou', 'yasmine', 'T786523', 'H98256712', 'F', '2003-11-26', 'yasmine.rahhaoui@uae.etu.ac.ma', 689542901, 'A', 25, 2, 'yasmine.rahhaoui@uae.etu.ac.ma', 'yasmine123', 1, 4, 2),
(15, 'kasimi', 'manal', 'S209311', 'N10225671', 'F', '2003-10-16', 'manal.kasimi@uae.etu.ac.ma', 691230121, 'A', 26, 2, 'manal.kasimi@uae.etu.ac.ma', 'manal123', 1, 4, 2),
(16, 'wahibi', 'amal', 'AB453892', 'N120021873', 'F', '2002-02-21', 'amal.wahibi@uae.etu.ac.ma', 610935462, 'A', 27, 2, 'amal.wahibi@uae.etu.ac.ma', 'amal123', 1, 6, 2),
(17, 'ouazani', 'asmae', 'E277743', 'D109821874', 'F', '2001-12-02', 'asmae.ouazani@uae.etu.ac.ma', 634529801, 'A', 28, 2, 'asmae.ouazani@uae.etu.ac.ma', 'asmae123', 1, 6, 2),
(18, 'imzouri', 'fatima', 'M722313', 'M120231654', 'F', '2002-07-20', 'fatima.imzouri@uae.etu.ac.ma', 665439204, 'A', 29, 2, 'fatima.imzouri@uae.etu.ac.ma', 'fatima123', 1, 6, 2),
(19, 'hanafi', 'houda', 'H128909', 'H190987223', 'F', '2003-11-11', 'houda.hanafi@uae.etu.ac.ma', 610902132, 'A', 30, 2, 'houda.hanafi@uae.etu.ac.ma', 'houda123', 1, 6, 2),
(20, 'kaabi', 'yassin', 'Y212234', 'Y120921655', 'H', '2002-03-20', 'yassin.kaabi@uae.etu.ac.ma', 689111289, 'A', 31, 2, 'yassin.kaabi@uae.etu.ac.ma', 'yassin123', 1, 6, 2),
(21, 'outmani', 'ouafae', 'S129908', 'W120921330', 'F', '2001-02-02', 'ouafae.outmani@uae.etu.ac.ma', 678990812, 'A', 32, 2, 'ouafae.outmani@uae.etu.ac.ma', 'ouafae123', 1, 1, 1),
(22, 'aarab', 'yahya', 'AB26523', 'Y130567121', 'H', '2003-07-19', 'yahya.aarab@uae.etu.ac.ma', 609911231, 'A', 33, 2, 'yahya.aarab@uae.etu.ac.ma', 'yahya123', 1, 1, 1),
(23, 'fillali', 'yassir', 'B122143', 'N300321689', 'H', '2002-04-11', 'yassir.fillali@uae.etu.ac.ma', 688127634, 'D', 34, 2, 'yassir.fillali@uae.etu.ac.ma', 'yassir123', 1, 1, 1),
(24, 'idari', 'nadia', 'W232287', 'N130098007', 'F', '2001-06-16', 'nadia.idari@uae.etu.ac.ma', 601112336, 'A', 35, 2, 'nadia.idari@uae.etu.ac.ma', 'nadia321', 1, 1, 1),
(25, 'choukri', 'niema', 'F480021', 'F210021356', 'F', '2001-10-12', 'niema.choukri@uae.etu.ac.ma', 611128760, 'A', 36, 2, 'niema.choukri@uae.etu.ac.ma', 'niema321', 1, 1, 1),
(26, 'raghibi', 'sanae', 'E120013', 'E122556122', 'F', '2002-04-22', 'sanae.raghibi@uae.etu.ac.ma', 622468091, 'A', 37, 2, 'sanae.raghibi@uae.etu.ac.ma', 'sanae321', 1, 3, 1),
(27, 'moujahid', 'meryem', 'M312664', 'M321567712', 'F', '2002-06-21', 'meryem.moujahid@uae.etu.ac.ma', 611980076, 'A', 38, 2, 'meryem.moujahid@uae.etu.ac.ma', 'meryem321', 1, 3, 1),
(28, 'sami', 'samia', 'S238879', 'S140041872', 'F', '2002-01-09', 'samia.sami@uae.etu.ac.ma', 688212238, 'A', 39, 2, 'samia.sami@uae.etu.ac.ma', 'samia321', 1, 3, 1),
(29, 'mellouki', 'amina', 'A232209', 'N120092154', 'F', '2002-08-22', 'amina.mellouki@uae.etu.ac.ma', 641679802, 'A', 40, 2, 'amina.mellouki@uae.etu.ac.ma', 'amina321', 1, 3, 1),
(30, 'nali', 'rayan', 'R321523', 'R120967212', 'H', '2003-01-12', 'rayan.nali@uae.etu.ac.ma', 620223456, 'A', 41, 2, 'rayan.nali@uae.etu.ac.ma', 'rayan321', 1, 3, 1),
(31, 'stitou', 'khadija', 'E120966', 'K1400421851', 'F', '2002-09-26', 'khadija.stitou@uae.etu.ac.ma', 681779234, 'A', 42, 2, 'khadija.stitou@uae.etu.ac.ma', 'khadija321', 1, 5, 1),
(32, 'hami', 'oussama', 'O233100', 'O150054321', 'H', '2002-12-22', 'oussama.hami@uae.etu.ac.ma', 655342231, 'A', 43, 2, 'oussama.hami@uae.etu.ac.ma', 'oussam321', 1, 5, 1),
(33, 'malki', 'jaouad', 'E230954', 'E450912789', 'H', '2002-01-25', 'jaouad.malki@uae.etu.ac.ma', 699086678, 'A', 44, 2, 'jaouad.malki@uae.etu.ac.ma', 'jaouad321', 1, 5, 1),
(34, 'fathi', 'roukaya', 'E321123', 'R120034778', 'F', '2002-05-07', 'roukaya.fathi@uae.etu.ac.ma', 612964456, 'A', 45, 2, 'roukaya.fathi@uae.etu.ac.ma', 'roukaya321', 1, 5, 1),
(35, 'ismaili', 'ismail', 'I118903', 'I180912334', 'H', '2003-10-29', 'ismail.ismaili@uae.etu.ac.ma', 689541233, 'A', 46, 2, 'ismail.ismaili@uae.etu.ac.ma', 'ismail321', 1, 5, 1),
(50, 'hamdon', 'hamid', 'R125687', 'S139836712', 'H', '2002-10-10', 'hamdonhamid67@gmail.com', 671709134, 'A', 61, 2, 'hamidhamdon@etu.uae.ac.ma', 'hamid123', 1, 7, 3),
(51, 'mohamed', 'ola', 'R435622', 'Y13972582', 'H', '2003-12-12', 'mohamed@gmail.com', 2345678, 'A', 62, 2, 'olamohamed@etu.uae.ac.ma', 'ola123', 1, 7, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Filiere`
--

CREATE TABLE `Filiere` (
  `IdFiliere` int(11) NOT NULL,
  `Nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Filiere`
--

INSERT INTO `Filiere` (`IdFiliere`, `Nom`) VALUES
(1, 'Génie Informatique'),
(2, 'Ingénierie des données'),
(3, 'Transformation Digitale et Intelligence Artificielle');

-- --------------------------------------------------------

--
-- Structure de la table `Journalisation`
--

CREATE TABLE `Journalisation` (
  `IdJournalisation` int(11) NOT NULL,
  `CNE` varchar(20) DEFAULT NULL,
  `AdressIP` varchar(30) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Heure` time DEFAULT NULL,
  `Criticite` varchar(20) DEFAULT NULL,
  `action` varchar(500) NOT NULL,
  `IdAdmin` int(11) DEFAULT NULL,
  `IdCompte` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Journalisation`
--

INSERT INTO `Journalisation` (`IdJournalisation`, `CNE`, `AdressIP`, `Date`, `Heure`, `Criticite`, `action`, `IdAdmin`, `IdCompte`) VALUES
(46, 'CD792463', '127.0.0.1', '2024-05-13', '23:58:55', 'info', 'admin authentifier au compte', 1, 1),
(47, 'CD792463', '127.0.0.1', '2024-05-13', '23:58:57', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(48, 'CD792463', '127.0.0.1', '2024-05-13', '23:59:13', 'info', 'admin: a publier des notes ', 1, 1),
(49, 'CD792463', '127.0.0.1', '2024-05-13', '00:00:00', 'error', 'admin: tenter de mettre un fichier non excel', 1, 1),
(50, 'D239801', '127.0.0.1', '2024-05-13', '00:00:32', 'info', 'prof authentifier au compte', 1, 10),
(51, 'D239801', '127.0.0.1', '2024-05-13', '00:00:34', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(52, 'D239801', '127.0.0.1', '2024-05-13', '00:01:13', 'error', 'prof: veut publier les cours sans specifier les criteres ', 1, 10),
(53, 'D239801', '127.0.0.1', '2024-05-13', '00:01:29', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(54, 'D239801', '127.0.0.1', '2024-05-13', '00:01:35', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(55, 'D239801', '127.0.0.1', '2024-05-13', '00:01:38', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(56, 'D239801', '127.0.0.1', '2024-05-13', '00:30:45', 'info', 'prof authentifier au compte', 1, 10),
(57, 'D239801', '127.0.0.1', '2024-05-13', '00:30:47', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(58, 'D239801', '127.0.0.1', '2024-05-13', '00:31:02', 'info', 'prof: a publier un cour ', 1, 10),
(59, 'CD792463', '127.0.0.1', '2024-05-13', '00:34:59', 'info', 'admin authentifier au compte', 1, 1),
(60, 'CD792463', '127.0.0.1', '2024-05-13', '00:35:01', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(61, 'CD792463', '127.0.0.1', '2024-05-13', '00:35:08', 'error', 'admin: tenter de mettre un fichier non pdf', 1, 1),
(62, 'D239801', '127.0.0.1', '2024-05-13', '00:35:40', 'info', 'prof authentifier au compte', 1, 10),
(63, 'D239801', '127.0.0.1', '2024-05-13', '00:35:41', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(64, 'D239801', '127.0.0.1', '2024-05-13', '00:35:57', 'error', 'admin: tenter de mettre un fichier non pdf', 1, 10),
(65, 'D239801', '127.0.0.1', '2024-05-13', '00:37:02', 'info', 'prof: a publier un cour ', 1, 10),
(66, 'S130003719', '127.0.0.1', '2024-05-13', '00:38:45', 'info', 'etudiant authentifier au compte', 1, 15),
(67, 'S130003719', '127.0.0.1', '2024-05-13', '00:38:54', 'info', 'etudiant authentifier au compte', 1, 15),
(68, 'S130003719', '127.0.0.1', '2024-05-13', '00:38:56', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(69, 'S130003719', '127.0.0.1', '2024-05-13', '00:39:30', 'info', 'etudiant authentifier au compte', 1, 15),
(70, 'S130003719', '127.0.0.1', '2024-05-13', '00:39:33', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(71, 'S130003719', '127.0.0.1', '2024-05-13', '00:44:36', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(72, 'CD792463', '127.0.0.1', '2024-05-13', '00:53:49', 'info', 'admin authentifier au compte', 1, 1),
(73, 'CD792463', '127.0.0.1', '2024-05-13', '00:53:51', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(74, 'CD792463', '127.0.0.1', '2024-05-13', '00:54:13', 'info', 'admin: a publier des notes ', 1, 1),
(75, 'CD792463', '127.0.0.1', '2024-05-13', '00:54:53', 'error', 'admin: tenter de mettre un fichier non excel', 1, 1),
(76, 'CD792463', '127.0.0.1', '2024-05-13', '00:54:58', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(77, 'CD792463', '127.0.0.1', '2024-05-13', '00:55:09', 'error', 'etd: a tenter ajouter un rapport avec un fichier non pdf ', 1, 1),
(78, 'CD792463', '127.0.0.1', '2024-05-13', '00:55:37', 'error', 'etd: a tenter ajouter un rapport avec un fichier non pdf ', 1, 1),
(79, 'CD792463', '127.0.0.1', '2024-05-13', '00:55:52', 'error', 'etd: a tenter ajouter un rapport avec un fichier non pdf ', 1, 1),
(80, 'CD792463', '127.0.0.1', '2024-05-13', '00:56:32', 'info', 'admin: a publier une annonce ', 1, 1),
(81, 'CD792463', '127.0.0.1', '2024-05-13', '00:57:35', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(82, 'CD792463', '127.0.0.1', '2024-05-13', '00:57:58', 'error', 'admin: a tenter ajouter etudiant avec un fichier non excel ', 1, 1),
(83, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:31', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(84, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:33', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(85, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:35', 'info', 'admin: a desactiver un compte', 1, 1),
(86, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:37', 'info', 'admin: a desactiver un compte', 1, 1),
(87, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:39', 'info', 'admin: a desactiver un compte', 1, 1),
(88, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:40', 'info', 'admin: a desactiver un compte', 1, 1),
(89, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:42', 'info', 'admin: a desactiver un compte', 1, 1),
(90, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:57', 'info', 'admin: a activer un compte', 1, 1),
(91, 'CD792463', '127.0.0.1', '2024-05-13', '00:58:59', 'info', 'admin: a activer un compte', 1, 1),
(92, 'CD792463', '127.0.0.1', '2024-05-13', '00:59:00', 'info', 'admin: a activer un compte', 1, 1),
(93, 'CD792463', '127.0.0.1', '2024-05-13', '00:59:01', 'info', 'admin: a activer un compte', 1, 1),
(94, 'D239801', '127.0.0.1', '2024-05-13', '00:59:11', 'info', 'prof authentifier au compte', 1, 10),
(95, 'D239801', '127.0.0.1', '2024-05-13', '00:59:12', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(96, 'D239801', '127.0.0.1', '2024-05-13', '00:59:42', 'error', 'prof: a tenter ajouter un rapport avec un fichier non pdf ', 1, 10),
(97, 'D239801', '127.0.0.1', '2024-05-13', '01:01:59', 'error', 'prof: a tenter ajouter un rapport avec un fichier non pdf ', 1, 10),
(98, 'D239801', '127.0.0.1', '2024-05-13', '01:03:10', 'error', 'prof: veut publier les cours sans specifier les criteres ', 1, 10),
(99, 'D239801', '127.0.0.1', '2024-05-13', '01:03:35', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(100, 'D239801', '127.0.0.1', '2024-05-13', '01:03:38', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(101, 'D239801', '127.0.0.1', '2024-05-13', '01:03:40', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(102, 'D239801', '127.0.0.1', '2024-05-13', '01:03:40', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(103, 'D239801', '127.0.0.1', '2024-05-13', '01:03:42', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(104, 'D239801', '127.0.0.1', '2024-05-13', '01:03:42', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(105, 'D239801', '127.0.0.1', '2024-05-13', '01:03:43', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(106, 'D239801', '127.0.0.1', '2024-05-13', '01:03:43', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(107, 'D239801', '127.0.0.1', '2024-05-13', '01:03:46', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(108, 'D239801', '127.0.0.1', '2024-05-13', '01:03:53', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(109, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(110, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(111, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(112, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(113, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(114, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(115, 'D239801', '127.0.0.1', '2024-05-13', '01:03:59', 'info', 'prof: a fait l absence ', 1, 10),
(116, 'D239801', '127.0.0.1', '2024-05-13', '01:04:02', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(117, 'D239801', '127.0.0.1', '2024-05-13', '01:04:06', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(118, 'D239801', '127.0.0.1', '2024-05-13', '01:04:09', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(119, 'D239801', '127.0.0.1', '2024-05-13', '01:05:14', 'info', 'prof authentifier au compte', 1, 10),
(120, 'D239801', '127.0.0.1', '2024-05-13', '01:05:15', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(121, 'D239801', '127.0.0.1', '2024-05-13', '01:05:22', 'info', 'prof authentifier au compte', 1, 10),
(122, 'D239801', '127.0.0.1', '2024-05-13', '01:05:24', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(123, 'D239801', '127.0.0.1', '2024-05-13', '01:05:27', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(124, 'D239801', '127.0.0.1', '2024-05-13', '01:05:39', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(125, 'D239801', '127.0.0.1', '2024-05-13', '01:08:39', 'info', 'prof authentifier au compte', 1, 10),
(126, 'D239801', '127.0.0.1', '2024-05-13', '01:08:41', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(127, 'D239801', '127.0.0.1', '2024-05-13', '01:08:41', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(128, 'D239801', '127.0.0.1', '2024-05-13', '01:08:43', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(129, 'D239801', '127.0.0.1', '2024-05-13', '01:09:22', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(130, 'D239801', '127.0.0.1', '2024-05-13', '01:10:30', 'info', 'prof authentifier au compte', 1, 10),
(131, 'D239801', '127.0.0.1', '2024-05-13', '01:11:37', 'info', 'prof authentifier au compte', 1, 10),
(132, 'D239801', '127.0.0.1', '2024-05-13', '01:11:46', 'info', 'prof authentifier au compte', 1, 10),
(133, 'D239801', '127.0.0.1', '2024-05-13', '01:11:48', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(134, 'D239801', '127.0.0.1', '2024-05-13', '01:11:49', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(135, 'D239801', '127.0.0.1', '2024-05-13', '01:11:50', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(136, 'D239801', '127.0.0.1', '2024-05-13', '01:12:59', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(137, 'D239801', '127.0.0.1', '2024-05-13', '01:13:27', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(138, 'D239801', '127.0.0.1', '2024-05-13', '01:13:50', 'info', 'prof authentifier au compte', 1, 10),
(139, 'D239801', '127.0.0.1', '2024-05-13', '01:13:51', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(140, 'D239801', '127.0.0.1', '2024-05-13', '01:15:10', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(141, 'D239801', '127.0.0.1', '2024-05-13', '01:15:26', 'info', 'prof: a publier un Rapport ', 1, 10),
(142, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:36', 'info', 'etudiant authentifier au compte', 1, 15),
(143, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:39', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(144, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:44', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(145, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:47', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(146, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:51', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(147, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:52', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(148, 'S130003719', '127.0.0.1', '2024-05-13', '01:15:56', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(149, 'S130003719', '127.0.0.1', '2024-05-13', '01:16:01', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(150, 'S130003719', '127.0.0.1', '2024-05-13', '01:16:10', 'error', 'etd: tenter de submiter un rapport deux fois ', 1, 15),
(151, 'S130003719', '127.0.0.1', '2024-05-13', '01:17:14', 'error', 'etd: a tenter ajouter un rapport avec un fichier non pdf ', 1, 15),
(152, 'S130003719', '127.0.0.1', '2024-05-13', '01:17:58', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(153, 'S130003719', '127.0.0.1', '2024-05-13', '01:17:59', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(154, 'S130003719', '127.0.0.1', '2024-05-13', '01:18:00', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(155, 'S130003719', '127.0.0.1', '2024-05-13', '01:18:04', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(156, 'CD792463', '127.0.0.1', '2024-05-13', '01:31:28', 'info', 'admin authentifier au compte', 1, 1),
(157, 'CD792463', '127.0.0.1', '2024-05-13', '01:38:44', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(158, 'CD792463', '127.0.0.1', '2024-05-13', '01:38:57', 'info', 'admin: a publier des notes ', 1, 1),
(159, 'CD792463', '127.0.0.1', '2024-05-13', '11:52:36', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(160, 'CD792463', '127.0.0.1', '2024-05-13', '11:52:59', 'info', 'admin: a publier une annonce ', 1, 1),
(161, 'CD792463', '127.0.0.1', '2024-05-13', '11:53:29', 'info', 'admin: a publier une annonce ', 1, 1),
(162, 'CD792463', '127.0.0.1', '2024-05-13', '11:56:24', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(163, 'CD792463', '127.0.0.1', '2024-05-13', '11:58:08', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(164, 'CD792463', '127.0.0.1', '2024-05-13', '11:58:08', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(165, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:16', 'info', 'etudiant authentifier au compte', 1, 15),
(166, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:17', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(167, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:27', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(168, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:29', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(169, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:30', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(170, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:33', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(171, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:36', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(172, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:42', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(173, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:45', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(174, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:50', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(175, 'S130003719', '127.0.0.1', '2024-05-13', '11:58:54', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(176, 'S130003719', '127.0.0.1', '2024-05-13', '11:59:14', 'info', 'etudiant authentifier au compte', 1, 15),
(177, 'S130003719', '127.0.0.1', '2024-05-13', '11:59:15', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(178, 'S130003719', '127.0.0.1', '2024-05-13', '11:59:21', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(179, 'S130003719', '127.0.0.1', '2024-05-13', '11:59:50', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(180, 'S130003719', '127.0.0.1', '2024-05-13', '12:01:25', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(181, 'S130003719', '127.0.0.1', '2024-05-13', '12:01:31', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(182, 'S130003719', '127.0.0.1', '2024-05-13', '12:01:32', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(183, 'S130003719', '127.0.0.1', '2024-05-13', '12:01:35', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(184, 'S130003719', '127.0.0.1', '2024-05-13', '12:01:38', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(185, 'D239801', '127.0.0.1', '2024-05-13', '12:01:55', 'info', 'prof authentifier au compte', 1, 10),
(186, 'D239801', '127.0.0.1', '2024-05-13', '12:02:10', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(187, 'D239801', '127.0.0.1', '2024-05-13', '12:02:13', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(188, 'D239801', '127.0.0.1', '2024-05-13', '12:02:17', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(189, 'D239801', '127.0.0.1', '2024-05-13', '12:31:40', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(190, 'D239801', '127.0.0.1', '2024-05-13', '12:31:43', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(191, 'D239801', '127.0.0.1', '2024-05-13', '12:31:44', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(192, 'D239801', '127.0.0.1', '2024-05-13', '12:31:47', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(193, 'D239801', '127.0.0.1', '2024-05-13', '12:31:51', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(194, 'D239801', '127.0.0.1', '2024-05-13', '12:31:52', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(195, 'D239801', '127.0.0.1', '2024-05-13', '12:31:54', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(196, 'D239801', '127.0.0.1', '2024-05-13', '12:31:56', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(197, 'D239801', '127.0.0.1', '2024-05-13', '12:31:57', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(198, 'D239801', '127.0.0.1', '2024-05-13', '12:31:58', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(199, 'D239801', '127.0.0.1', '2024-05-13', '12:31:59', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(200, 'D239801', '127.0.0.1', '2024-05-13', '12:31:59', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(201, 'D239801', '127.0.0.1', '2024-05-13', '12:32:01', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(202, 'D239801', '127.0.0.1', '2024-05-13', '12:32:06', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(203, 'D239801', '127.0.0.1', '2024-05-13', '12:32:28', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(204, 'D239801', '127.0.0.1', '2024-05-13', '12:53:11', 'info', 'prof authentifier au compte', 1, 10),
(205, 'CD792463', '127.0.0.1', '2024-05-13', '12:56:50', 'info', 'admin authentifier au compte', 1, 1),
(206, 'CD792463', '127.0.0.1', '2024-05-13', '12:56:56', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(207, 'CD792463', '127.0.0.1', '2024-05-13', '12:57:40', 'error', 'admin: error lors de publication d annonce ', 1, 1),
(208, 'D239801', '127.0.0.1', '2024-05-13', '12:57:50', 'info', 'prof authentifier au compte', 1, 10),
(209, 'CD792463', '127.0.0.1', '2024-05-13', '12:58:03', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(210, 'CD792463', '127.0.0.1', '2024-05-13', '12:58:35', 'info', 'admin authentifier au compte', 1, 1),
(211, 'CD792463', '127.0.0.1', '2024-05-13', '12:58:38', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(212, 'CD792463', '127.0.0.1', '2024-05-13', '12:58:47', 'error', 'admin: error lors de publication d annonce ', 1, 1),
(213, 'CD792463', '127.0.0.1', '2024-05-13', '13:03:03', 'error', 'admin: error lors de publication d annonce ', 1, 1),
(214, 'CD792463', '127.0.0.1', '2024-05-13', '13:03:39', 'error', 'admin: error lors de publication d annonce ', 1, 1),
(215, 'CD792463', '127.0.0.1', '2024-05-13', '13:04:44', 'info', 'admin authentifier au compte', 1, 1),
(216, 'CD792463', '127.0.0.1', '2024-05-13', '13:04:50', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(217, 'CD792463', '127.0.0.1', '2024-05-13', '13:06:44', 'error', 'admin: error lors de publication d annonce ', 1, 1),
(218, 'CD792463', '127.0.0.1', '2024-05-13', '13:14:25', 'info', 'admin authentifier au compte', 1, 1),
(219, 'CD792463', '127.0.0.1', '2024-05-13', '13:14:31', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(220, 'CD792463', '127.0.0.1', '2024-05-13', '13:14:38', 'info', 'admin: a publier une annonce ', 1, 1),
(221, 'D239801', '127.0.0.1', '2024-05-13', '15:26:47', 'info', 'prof authentifier au compte', 1, 10),
(222, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:01', 'info', 'admin authentifier au compte', 1, 1),
(223, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:03', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(224, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:04', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(225, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:05', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(226, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:07', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(227, 'D239801', '127.0.0.1', '2024-05-13', '15:27:09', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(228, 'D239801', '127.0.0.1', '2024-05-13', '15:27:10', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(229, 'D239801', '127.0.0.1', '2024-05-13', '15:27:10', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(230, 'D239801', '127.0.0.1', '2024-05-13', '15:27:11', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(231, 'D239801', '127.0.0.1', '2024-05-13', '15:27:11', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(232, 'D239801', '127.0.0.1', '2024-05-13', '15:27:20', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(233, 'D239801', '127.0.0.1', '2024-05-13', '15:27:20', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(234, 'D239801', '127.0.0.1', '2024-05-13', '15:27:20', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(235, 'D239801', '127.0.0.1', '2024-05-13', '15:27:21', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(236, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:25', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(237, 'CD792463', '127.0.0.1', '2024-05-13', '15:27:25', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(238, 'D239801', '127.0.0.1', '2024-05-13', '15:27:33', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(239, 'S130003719', '127.0.0.1', '2024-05-13', '15:27:48', 'info', 'etudiant authentifier au compte', 1, 15),
(240, 'S130003719', '127.0.0.1', '2024-05-13', '15:27:50', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(241, 'S130003719', '127.0.0.1', '2024-05-13', '15:27:52', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(242, 'S130003719', '127.0.0.1', '2024-05-13', '15:28:28', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(243, 'S130003719', '127.0.0.1', '2024-05-13', '15:28:30', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(244, 'S130003719', '127.0.0.1', '2024-05-13', '15:28:33', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(245, 'S130003719', '127.0.0.1', '2024-05-13', '15:28:38', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(246, 'S130003719', '127.0.0.1', '2024-05-13', '15:28:38', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(247, 'CD792463', '127.0.0.1', '2024-05-13', '15:29:31', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(248, 'S130003719', '127.0.0.1', '2024-05-13', '15:29:43', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(249, 'S130003719', '127.0.0.1', '2024-05-13', '15:29:47', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(250, 'S130003719', '127.0.0.1', '2024-05-13', '15:29:48', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(251, 'S130003719', '127.0.0.1', '2024-05-13', '15:29:52', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(252, 'S130003719', '127.0.0.1', '2024-05-13', '15:29:56', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(253, 'D239801', '127.0.0.1', '2024-05-13', '16:17:36', 'info', 'prof authentifier au compte', 1, 10),
(254, 'CD792463', '127.0.0.1', '2024-05-13', '17:19:22', 'info', 'admin authentifier au compte', 1, 1),
(255, 'CD792463', '127.0.0.1', '2024-05-13', '17:30:29', 'info', 'admin authentifier au compte', 1, 1),
(256, 'CD792463', '127.0.0.1', '2024-05-13', '17:38:39', 'info', 'admin authentifier au compte', 1, 1),
(257, 'CD792463', '127.0.0.1', '2024-05-13', '17:41:09', 'info', 'admin authentifier au compte', 1, 1),
(258, 'CD792463', '127.0.0.1', '2024-05-13', '17:41:28', 'info', 'admin authentifier au compte', 1, 1),
(259, 'CD792463', '127.0.0.1', '2024-05-13', '17:45:07', 'info', 'admin authentifier au compte', 1, 1),
(260, 'CD792463', '127.0.0.1', '2024-05-13', '17:47:31', 'info', 'admin authentifier au compte', 1, 1),
(261, 'CD792463', '127.0.0.1', '2024-05-13', '17:49:15', 'info', 'admin authentifier au compte', 1, 1),
(262, 'CD792463', '127.0.0.1', '2024-05-13', '17:49:48', 'info', 'admin authentifier au compte', 1, 1),
(263, 'CD792463', '127.0.0.1', '2024-05-13', '17:50:20', 'info', 'admin authentifier au compte', 1, 1),
(264, 'CD792463', '127.0.0.1', '2024-05-13', '17:50:47', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(265, 'CD792463', '127.0.0.1', '2024-05-13', '17:52:48', 'info', 'admin authentifier au compte', 1, 1),
(266, 'D239801', '127.0.0.1', '2024-05-13', '17:53:02', 'info', 'prof authentifier au compte', 1, 10),
(267, 'S130003719', '127.0.0.1', '2024-05-13', '17:53:11', 'info', 'etudiant authentifier au compte', 1, 15),
(268, 'D239801', '127.0.0.1', '2024-05-13', '17:55:34', 'info', 'prof authentifier au compte', 1, 10),
(269, 'D239801', '127.0.0.1', '2024-05-13', '18:20:48', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(270, 'CD792463', '127.0.0.1', '2024-05-13', '19:15:57', 'info', 'admin authentifier au compte', 1, 1),
(271, 'D239801', '127.0.0.1', '2024-05-13', '19:25:32', 'info', 'prof authentifier au compte', 1, 10),
(272, 'S130003719', '127.0.0.1', '2024-05-13', '19:26:59', 'info', 'etudiant authentifier au compte', 1, 15),
(273, 'CD792463', '127.0.0.1', '2024-05-13', '19:31:31', 'info', 'admin authentifier au compte', 1, 1),
(274, 'CD792463', '127.0.0.1', '2024-05-13', '20:15:08', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(275, 'CD792463', '127.0.0.1', '2024-05-13', '20:21:15', 'info', 'admin authentifier au compte', 1, 1),
(276, 'CD792463', '127.0.0.1', '2024-05-13', '20:21:17', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(277, 'CD792463', '127.0.0.1', '2024-05-13', '20:21:23', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(278, 'CD792463', '127.0.0.1', '2024-05-13', '20:21:24', 'info', 'admin: a desactiver un compte', 1, 1),
(279, NULL, '127.0.0.1', '2024-05-13', '20:22:17', 'error', 'Etudiant authentifier a un compte desactiver', 1, NULL),
(280, 'CD792463', '127.0.0.1', '2024-05-13', '20:22:50', 'info', 'admin authentifier au compte', 1, 1),
(281, 'D239801', '127.0.0.1', '2024-05-13', '20:27:37', 'info', 'prof authentifier au compte', 1, 10),
(282, 'D239801', '127.0.0.1', '2024-05-13', '20:31:24', 'info', 'prof authentifier au compte', 1, 10),
(283, 'D239801', '127.0.0.1', '2024-05-13', '20:31:31', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(284, 'CD792463', '127.0.0.1', '2024-05-13', '20:32:50', 'info', 'admin authentifier au compte', 1, 1),
(285, 'CD792463', '127.0.0.1', '2024-05-13', '20:32:55', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(286, NULL, '127.0.0.1', '2024-05-13', '20:34:42', 'error', 'Etudiant authentifier a un compte desactiver', 1, NULL),
(287, 'CD792463', '127.0.0.1', '2024-05-13', '20:34:50', 'info', 'admin authentifier au compte', 1, 1),
(288, 'CD792463', '127.0.0.1', '2024-05-13', '20:34:52', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(289, 'CD792463', '127.0.0.1', '2024-05-13', '20:34:53', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(290, 'CD792463', '127.0.0.1', '2024-05-13', '20:34:54', 'info', 'admin: a activer un compte', 1, 1),
(291, 'S130003719', '127.0.0.1', '2024-05-13', '20:35:01', 'info', 'etudiant authentifier au compte', 1, 15),
(292, 'CD792463', '127.0.0.1', '2024-05-13', '21:01:16', 'info', 'admin authentifier au compte', 1, 1),
(293, 'CD792463', '127.0.0.1', '2024-05-13', '21:11:04', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(294, 'CD792463', '127.0.0.1', '2024-05-13', '21:11:05', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(295, 'CD792463', '127.0.0.1', '2024-05-13', '21:11:21', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(296, 'CD792463', '127.0.0.1', '2024-05-13', '21:11:25', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(297, 'CD792463', '127.0.0.1', '2024-05-13', '21:17:32', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(298, 'CD792463', '127.0.0.1', '2024-05-13', '21:17:32', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(299, 'CD792463', '127.0.0.1', '2024-05-13', '21:17:34', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(300, 'CD792463', '127.0.0.1', '2024-05-13', '21:17:40', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(301, 'CD792463', '127.0.0.1', '2024-05-13', '21:18:14', 'info', 'admin authentifier au compte', 1, 1),
(302, 'CD792463', '127.0.0.1', '2024-05-13', '21:18:17', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(303, 'CD792463', '127.0.0.1', '2024-05-13', '21:18:19', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(304, 'CD792463', '127.0.0.1', '2024-05-13', '21:18:23', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(305, 'CD792463', '127.0.0.1', '2024-05-13', '21:18:30', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(306, 'CD792463', '127.0.0.1', '2024-05-13', '21:18:32', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(307, NULL, '127.0.0.1', '2024-05-13', '21:18:46', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(308, 'CD792463', '127.0.0.1', '2024-05-13', '21:19:08', 'info', 'admin authentifier au compte', 1, 1),
(309, 'CD792463', '127.0.0.1', '2024-05-13', '21:19:10', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(310, 'CD792463', '127.0.0.1', '2024-05-13', '21:19:11', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(311, 'CD792463', '127.0.0.1', '2024-05-13', '21:19:16', 'info', 'admin: a desactiver un compte', 1, 1),
(312, NULL, '127.0.0.1', '2024-05-13', '21:19:25', 'error', 'Etudiant authentifier a un compte desactiver', 1, NULL),
(313, 'CD792463', '127.0.0.1', '2024-05-13', '21:19:57', 'info', 'admin authentifier au compte', 1, 1),
(314, 'CD792463', '127.0.0.1', '2024-05-13', '21:19:59', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(315, 'CD792463', '127.0.0.1', '2024-05-13', '21:20:00', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(316, 'CD792463', '127.0.0.1', '2024-05-13', '21:20:01', 'info', 'admin: a activer un compte', 1, 1),
(317, 'S130003719', '127.0.0.1', '2024-05-13', '21:46:51', 'info', 'etudiant authentifier au compte', 1, 15),
(318, 'CD792463', '127.0.0.1', '2024-05-14', '12:52:52', 'info', 'admin authentifier au compte', 1, 1),
(319, 'CD792463', '127.0.0.1', '2024-05-14', '12:52:57', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(320, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:06', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(321, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:07', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(322, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:10', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(323, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:11', 'info', 'admin: a desactiver un compte', 1, 1),
(324, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:12', 'info', 'admin: a activer un compte', 1, 1),
(325, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:19', 'info', 'admin: a chercher des etudiant dans retrancher etudiant  ', 1, 1),
(326, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:20', 'info', 'admin: a desactiver un compte', 1, 1),
(327, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:27', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(328, 'CD792463', '127.0.0.1', '2024-05-14', '12:53:45', 'info', 'admin: a publier des notes ', 1, 1),
(329, 'CD792463', '127.0.0.1', '2024-05-14', '12:54:25', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(330, 'CD792463', '127.0.0.1', '2024-05-14', '12:55:33', 'error', 'admin: a tenter ajouter etudiant avec un fichier non excel ', 1, 1),
(331, 'CD792463', '127.0.0.1', '2024-05-14', '12:57:21', 'error', 'admin: a tenter ajouter etudiant avec un fichier non excel ', 1, 1),
(332, 'CD792463', '127.0.0.1', '2024-05-14', '12:58:15', 'error', 'admin: a tenter ajouter etudiant avec un fichier non excel ', 1, 1),
(333, 'CD792463', '127.0.0.1', '2024-05-14', '12:58:56', 'info', 'admin: a ajouter des etudiant ', 1, 1),
(334, 'CD792463', '127.0.0.1', '2024-05-14', '12:58:56', 'info', 'admin: a ajouter des etudiant ', 1, 1),
(335, 'CD792463', '127.0.0.1', '2024-05-14', '13:11:35', 'error', 'admin: a tenter ajouter etudiant avec un fichier non excel ', 1, 1),
(336, 'CD792463', '127.0.0.1', '2024-05-14', '13:12:40', 'info', 'admin: a ajouter des etudiant ', 1, 1),
(337, 'CD792463', '127.0.0.1', '2024-05-14', '13:12:40', 'info', 'admin: a ajouter des etudiant ', 1, 1),
(338, 'CD792463', '127.0.0.1', '2024-05-14', '13:13:21', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(339, 'S130003719', '127.0.0.1', '2024-05-14', '13:13:28', 'info', 'etudiant authentifier au compte', 1, 15),
(340, 'S130003719', '127.0.0.1', '2024-05-14', '13:13:29', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(341, 'D239801', '127.0.0.1', '2024-05-14', '13:14:04', 'info', 'prof authentifier au compte', 1, 10),
(342, 'D239801', '127.0.0.1', '2024-05-14', '13:14:14', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(343, 'S139836712', '127.0.0.1', '2024-05-14', '13:42:27', 'info', 'etudiant authentifier au compte', 1, 61),
(344, NULL, '127.0.0.1', '2024-05-14', '13:46:06', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(345, NULL, '127.0.0.1', '2024-05-14', '13:46:12', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(346, NULL, '127.0.0.1', '2024-05-14', '13:46:24', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(347, 'CD792463', '127.0.0.1', '2024-05-14', '13:55:39', 'info', 'admin authentifier au compte', 1, 1),
(348, 'CD792463', '127.0.0.1', '2024-05-14', '13:56:16', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(349, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:02', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(350, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:03', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(351, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:05', 'info', 'admin: a desactiver un compte', 1, 1),
(352, NULL, '127.0.0.1', '2024-05-14', '13:57:12', 'error', 'Etudiant authentifier a un compte desactiver', 1, NULL),
(353, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:24', 'info', 'admin authentifier au compte', 1, 1),
(354, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:26', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(355, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:28', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(356, 'CD792463', '127.0.0.1', '2024-05-14', '13:57:29', 'info', 'admin: a activer un compte', 1, 1),
(357, 'S130003719', '127.0.0.1', '2024-05-14', '13:57:34', 'info', 'etudiant authentifier au compte', 1, 15),
(358, 'S130003719', '127.0.0.1', '2024-05-14', '13:57:36', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(359, 'S130003719', '127.0.0.1', '2024-05-14', '13:57:38', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(360, 'S130003719', '127.0.0.1', '2024-05-14', '13:57:43', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(361, 'S130003719', '127.0.0.1', '2024-05-14', '13:57:51', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(362, 'D239801', '127.0.0.1', '2024-05-14', '13:58:07', 'info', 'prof authentifier au compte', 1, 10),
(363, 'D239801', '127.0.0.1', '2024-05-14', '13:58:26', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(364, 'D239801', '127.0.0.1', '2024-05-14', '13:58:29', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(365, 'D239801', '127.0.0.1', '2024-05-14', '13:58:40', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(366, 'D239801', '127.0.0.1', '2024-05-14', '13:58:44', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(367, 'D239801', '127.0.0.1', '2024-05-14', '13:58:50', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(368, 'D239801', '127.0.0.1', '2024-05-14', '13:58:58', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(369, 'D239801', '127.0.0.1', '2024-05-14', '13:59:01', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(370, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(371, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(372, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(373, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(374, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(375, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(376, 'D239801', '127.0.0.1', '2024-05-14', '13:59:11', 'info', 'prof: a fait l absence ', 1, 10),
(377, 'D239801', '127.0.0.1', '2024-05-14', '13:59:15', 'error', 'prof: exceder l absence de jour  ', 1, 10),
(378, 'D239801', '127.0.0.1', '2024-05-14', '13:59:26', 'error', 'prof: exceder l absence de jour  ', 1, 10),
(379, 'D239801', '127.0.0.1', '2024-05-14', '13:59:37', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(380, 'S130003719', '127.0.0.1', '2024-05-14', '14:40:49', 'info', 'etudiant authentifier au compte', 1, 15),
(381, 'S130003719', '127.0.0.1', '2024-05-14', '14:41:36', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(382, 'S130003719', '127.0.0.1', '2024-05-14', '14:41:38', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(383, 'S130003719', '127.0.0.1', '2024-05-14', '14:41:44', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(384, 'CD792463', '127.0.0.1', '2024-05-14', '14:56:20', 'info', 'admin authentifier au compte', 1, 1),
(385, 'CD792463', '127.0.0.1', '2024-05-14', '14:56:22', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(386, 'CD792463', '127.0.0.1', '2024-05-14', '15:17:03', 'info', 'admin: a publier une annonce ', 1, 1),
(387, 'CD792463', '127.0.0.1', '2024-05-14', '15:18:47', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(388, 'CD792463', '127.0.0.1', '2024-05-14', '15:19:19', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(389, 'CD792463', '127.0.0.1', '2024-05-14', '15:20:24', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(390, 'CD792463', '127.0.0.1', '2024-05-14', '15:20:26', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(391, 'CD792463', '127.0.0.1', '2024-05-14', '15:20:27', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(392, 'CD792463', '127.0.0.1', '2024-05-14', '15:23:47', 'info', 'admin: a publier une annonce ', 1, 1),
(393, 'CD792463', '127.0.0.1', '2024-05-14', '15:39:25', 'info', 'admin: a publier une annonce ', 1, 1),
(394, 'CD792463', '127.0.0.1', '2024-05-14', '16:15:41', 'info', 'admin: a publier une annonce ', 1, 1),
(395, 'CD792463', '127.0.0.1', '2024-05-14', '16:26:04', 'info', 'admin: a publier une annonce ', 1, 1),
(396, 'CD792463', '127.0.0.1', '2024-05-14', '16:27:33', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(397, 'CD792463', '127.0.0.1', '2024-05-14', '16:27:35', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(398, 'CD792463', '127.0.0.1', '2024-05-14', '16:27:43', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(399, 'CD792463', '127.0.0.1', '2024-05-14', '16:27:45', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(400, 'S130003719', '127.0.0.1', '2024-05-14', '16:32:35', 'info', 'etudiant authentifier au compte', 1, 15),
(401, 'CD792463', '127.0.0.1', '2024-05-14', '16:43:10', 'info', 'admin authentifier au compte', 1, 1),
(402, 'CD792463', '127.0.0.1', '2024-05-14', '16:43:12', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(403, 'CD792463', '127.0.0.1', '2024-05-14', '16:43:45', 'info', 'admin: a publier une annonce ', 1, 1),
(404, 'S130003719', '127.0.0.1', '2024-05-14', '16:43:59', 'info', 'etudiant authentifier au compte', 1, 15),
(405, 'CD792463', '127.0.0.1', '2024-05-14', '16:46:35', 'info', 'admin authentifier au compte', 1, 1),
(406, 'S130003719', '127.0.0.1', '2024-05-14', '16:57:35', 'info', 'etudiant authentifier au compte', 1, 15),
(407, 'CD792463', '127.0.0.1', '2024-05-14', '17:09:58', 'info', 'admin authentifier au compte', 1, 1),
(408, 'D239801', '127.0.0.1', '2024-05-14', '17:22:37', 'info', 'prof authentifier au compte', 1, 10),
(409, 'S130003719', '127.0.0.1', '2024-05-14', '17:22:55', 'info', 'etudiant authentifier au compte', 1, 15),
(410, 'CD792463', '127.0.0.1', '2024-05-14', '17:35:25', 'info', 'admin authentifier au compte', 1, 1),
(411, 'S130003719', '127.0.0.1', '2024-05-14', '17:36:13', 'info', 'etudiant authentifier au compte', 1, 15),
(412, 'S130003719', '127.0.0.1', '2024-05-14', '17:36:17', 'info', 'etd: est allé a \"notification\"', 1, 15),
(413, 'S130003719', '127.0.0.1', '2024-05-14', '17:36:19', 'info', 'etd: a consulter une notification', 1, 15),
(414, 'CD792463', '127.0.0.1', '2024-05-14', '17:36:26', 'info', 'admin authentifier au compte', 1, 1),
(415, 'CD792463', '127.0.0.1', '2024-05-14', '17:38:21', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(416, 'D239801', '127.0.0.1', '2024-05-14', '17:39:53', 'info', 'prof authentifier au compte', 1, 10),
(417, 'D239801', '127.0.0.1', '2024-05-14', '17:39:54', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(418, 'CD792463', '127.0.0.1', '2024-05-14', '17:40:02', 'info', 'admin authentifier au compte', 1, 1),
(419, 'CD792463', '127.0.0.1', '2024-05-15', '11:45:38', 'info', 'admin authentifier au compte', 1, 1),
(420, 'CD792463', '127.0.0.1', '2024-05-15', '13:19:44', 'info', 'admin authentifier au compte', 1, 1),
(421, 'CD792463', '127.0.0.1', '2024-05-15', '13:23:42', 'info', 'admin authentifier au compte', 1, 1),
(422, 'CD792463', '127.0.0.1', '2024-05-15', '13:24:28', 'info', 'admin authentifier au compte', 1, 1),
(423, 'CD792463', '127.0.0.1', '2024-05-15', '13:27:18', 'info', 'admin authentifier au compte', 1, 1),
(424, 'CD792463', '127.0.0.1', '2024-05-15', '13:44:25', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(425, 'D239801', '127.0.0.1', '2024-05-15', '13:55:43', 'info', 'prof authentifier au compte', 1, 10),
(426, 'D239801', '127.0.0.1', '2024-05-15', '14:05:20', 'info', 'prof authentifier au compte', 1, 10),
(427, 'D239801', '127.0.0.1', '2024-05-15', '14:08:03', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(428, 'D239801', '127.0.0.1', '2024-05-15', '14:30:33', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(429, 'CD792463', '127.0.0.1', '2024-05-15', '14:35:11', 'info', 'admin authentifier au compte', 1, 1),
(430, 'CD792463', '127.0.0.1', '2024-05-15', '14:39:56', 'info', 'admin: a changer le numero de telephone ', 1, 1),
(431, 'CD792463', '127.0.0.1', '2024-05-15', '14:40:06', 'info', 'admin: a changer le numero de telephone ', 1, 1),
(432, 'D239801', '127.0.0.1', '2024-05-15', '15:20:22', 'info', 'prof authentifier au compte', 1, 10),
(433, 'D239801', '127.0.0.1', '2024-05-15', '15:21:39', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(434, 'D239801', '127.0.0.1', '2024-05-15', '15:21:54', 'info', 'prof: est allé à \"Compte\" ', 1, 10),
(435, 'CD792463', '127.0.0.1', '2024-05-15', '15:22:01', 'info', 'admin authentifier au compte', 1, 1),
(436, 'CD792463', '127.0.0.1', '2024-05-15', '15:26:03', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(437, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:33', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(438, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:34', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(439, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:35', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(440, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:42', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(441, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:46', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(442, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:52', 'info', 'admin: a changer l\'emal ', 1, 1),
(443, 'CD792463', '127.0.0.1', '2024-05-15', '15:29:52', 'info', 'admin: a changer le numero de telephone ', 1, 1),
(444, 'CD792463', '127.0.0.1', '2024-05-15', '15:30:04', 'info', 'admin: a changer l\'emal ', 1, 1),
(445, 'CD792463', '127.0.0.1', '2024-05-15', '15:30:04', 'info', 'admin: a changer le numero de telephone ', 1, 1),
(446, 'S130003719', '127.0.0.1', '2024-05-15', '15:37:25', 'info', 'etudiant authentifier au compte', 1, 15),
(447, 'S130003719', '127.0.0.1', '2024-05-15', '15:37:28', 'info', 'etd: est allé à \"Compte\" ', 1, 15),
(448, 'S130003719', '127.0.0.1', '2024-05-15', '15:37:33', 'info', 'etd: est allé à \"editer compte\" ', 1, 15),
(449, 'CD792463', '127.0.0.1', '2024-05-15', '15:38:34', 'info', 'admin authentifier au compte', 1, 1),
(450, 'S130003719', '127.0.0.1', '2024-05-15', '16:58:21', 'info', 'etudiant authentifier au compte', 1, 15),
(451, 'S130003719', '127.0.0.1', '2024-05-15', '16:58:24', 'info', 'etd: est allé à \"Compte\" ', 1, 15),
(452, 'S130003719', '127.0.0.1', '2024-05-15', '16:58:32', 'info', 'etd: est allé à \"editer compte\" ', 1, 15),
(453, 'S130003719', '127.0.0.1', '2024-05-15', '16:58:43', 'info', 'etd: a changer l\'email ', 1, 15),
(454, 'S130003719', '127.0.0.1', '2024-05-15', '16:58:43', 'info', 'etd: a changer le numero de telephone ', 1, 15),
(455, 'S130003719', '127.0.0.1', '2024-05-15', '17:00:08', 'info', 'etd: a changer l\'email ', 1, 15),
(456, 'S130003719', '127.0.0.1', '2024-05-15', '17:00:42', 'info', 'etd: a changer l\'email ', 1, 15),
(457, 'S130003719', '127.0.0.1', '2024-05-15', '17:00:42', 'info', 'etd: a changer le numero de telephone ', 1, 15),
(458, 'S130003719', '127.0.0.1', '2024-05-15', '17:00:53', 'info', 'etd: a changer mot de passe', 1, 15),
(459, 'S130003719', '127.0.0.1', '2024-05-15', '17:01:18', 'info', 'etd: a changer mot de passe', 1, 15),
(460, 'S130003719', '127.0.0.1', '2024-05-15', '17:01:49', 'info', 'etd: est allé à \"Compte\" ', 1, 15),
(461, 'CD792463', '127.0.0.1', '2024-05-15', '17:01:57', 'info', 'admin authentifier au compte', 1, 1),
(462, 'CD792463', '127.0.0.1', '2024-05-15', '17:12:11', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(463, 'CD792463', '127.0.0.1', '2024-05-15', '17:12:22', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(464, 'S130003719', '127.0.0.1', '2024-05-15', '17:36:33', 'info', 'etudiant authentifier au compte', 1, 15),
(465, 'S130006743', '127.0.0.1', '2024-05-15', '17:36:59', 'info', 'etudiant authentifier au compte', 1, 12),
(466, 'S130006743', '127.0.0.1', '2024-05-15', '17:37:08', 'info', 'etd: est allé a \"notification\"', 1, 12),
(467, 'N147600043', '127.0.0.1', '2024-05-15', '17:37:40', 'info', 'etudiant authentifier au compte', 1, 16),
(468, 'S130003719', '127.0.0.1', '2024-05-15', '17:38:07', 'info', 'etudiant authentifier au compte', 1, 15),
(469, 'F24351093', '127.0.0.1', '2024-05-15', '17:39:35', 'info', 'etudiant authentifier au compte', 1, 22),
(470, 'F24351093', '127.0.0.1', '2024-05-15', '17:40:08', 'info', 'etudiant authentifier au compte', 1, 22),
(471, 'F24351093', '127.0.0.1', '2024-05-15', '17:40:47', 'info', 'etudiant authentifier au compte', 1, 22),
(472, 'F24351093', '127.0.0.1', '2024-05-15', '17:40:50', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(473, 'F24351093', '127.0.0.1', '2024-05-15', '17:40:52', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(474, 'F24351093', '127.0.0.1', '2024-05-15', '17:40:57', 'info', 'etd: est allé a \"notification\"', 1, 22),
(475, 'S130003719', '127.0.0.1', '2024-05-15', '17:42:24', 'info', 'etudiant authentifier au compte', 1, 15),
(476, 'S130003719', '127.0.0.1', '2024-05-15', '17:44:01', 'info', 'etudiant authentifier au compte', 1, 15),
(477, 'S130003719', '127.0.0.1', '2024-05-15', '17:44:52', 'info', 'etudiant authentifier au compte', 1, 15),
(478, 'S130003719', '127.0.0.1', '2024-05-15', '17:45:51', 'info', 'etudiant authentifier au compte', 1, 15),
(479, 'S130003719', '127.0.0.1', '2024-05-15', '17:48:49', 'info', 'etudiant authentifier au compte', 1, 15),
(480, 'S130003719', '127.0.0.1', '2024-05-15', '17:49:51', 'info', 'etudiant authentifier au compte', 1, 15),
(481, 'S130003719', '127.0.0.1', '2024-05-15', '17:49:58', 'info', 'etudiant authentifier au compte', 1, 15),
(482, 'S130003719', '127.0.0.1', '2024-05-15', '17:50:32', 'info', 'etudiant authentifier au compte', 1, 15),
(483, 'S130003719', '127.0.0.1', '2024-05-15', '17:51:47', 'info', 'etudiant authentifier au compte', 1, 15),
(484, 'S130003719', '127.0.0.1', '2024-05-15', '17:52:54', 'info', 'etudiant authentifier au compte', 1, 15),
(485, 'S130003719', '127.0.0.1', '2024-05-15', '17:57:34', 'info', 'etudiant authentifier au compte', 1, 15),
(486, 'S130003719', '127.0.0.1', '2024-05-15', '18:00:42', 'info', 'etudiant authentifier au compte', 1, 15),
(487, 'F24351093', '127.0.0.1', '2024-05-15', '18:01:08', 'info', 'etudiant authentifier au compte', 1, 22),
(488, 'S130003719', '127.0.0.1', '2024-05-15', '18:01:59', 'info', 'etudiant authentifier au compte', 1, 15),
(489, 'S130003719', '127.0.0.1', '2024-05-15', '18:02:32', 'info', 'etudiant authentifier au compte', 1, 15),
(490, 'S130003719', '127.0.0.1', '2024-05-15', '18:02:50', 'info', 'etudiant authentifier au compte', 1, 15),
(491, 'S130003719', '127.0.0.1', '2024-05-15', '18:03:48', 'info', 'etudiant authentifier au compte', 1, 15),
(492, 'S130003719', '127.0.0.1', '2024-05-15', '18:04:35', 'info', 'etudiant authentifier au compte', 1, 15),
(493, 'S130003719', '127.0.0.1', '2024-05-15', '18:05:04', 'info', 'etudiant authentifier au compte', 1, 15),
(494, 'S130003719', '127.0.0.1', '2024-05-15', '18:05:45', 'info', 'etudiant authentifier au compte', 1, 15),
(495, 'S130003719', '127.0.0.1', '2024-05-15', '18:06:38', 'info', 'etudiant authentifier au compte', 1, 15),
(496, 'S130003719', '127.0.0.1', '2024-05-15', '18:07:31', 'info', 'etudiant authentifier au compte', 1, 15),
(497, 'S130003719', '127.0.0.1', '2024-05-15', '18:08:21', 'info', 'etudiant authentifier au compte', 1, 15),
(498, 'S130003719', '127.0.0.1', '2024-05-15', '18:08:44', 'info', 'etudiant authentifier au compte', 1, 15),
(499, 'F24351093', '127.0.0.1', '2024-05-15', '18:08:51', 'info', 'etudiant authentifier au compte', 1, 22),
(500, 'F24351093', '127.0.0.1', '2024-05-15', '18:10:29', 'info', 'etd: est allé a \"notification\"', 1, 22),
(501, 'S130003719', '127.0.0.1', '2024-05-15', '18:19:53', 'info', 'etudiant authentifier au compte', 1, 15),
(502, 'S130003719', '127.0.0.1', '2024-05-15', '18:20:03', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(503, 'S130003719', '127.0.0.1', '2024-05-15', '18:20:04', 'info', 'etd: est allé a \"notification\"', 1, 15);
INSERT INTO `Journalisation` (`IdJournalisation`, `CNE`, `AdressIP`, `Date`, `Heure`, `Criticite`, `action`, `IdAdmin`, `IdCompte`) VALUES
(504, 'S130003719', '127.0.0.1', '2024-05-15', '18:20:13', 'info', 'etd: est allé a \"notification\"', 1, 15),
(505, 'CD792463', '127.0.0.1', '2024-05-15', '18:20:34', 'info', 'admin authentifier au compte', 1, 1),
(506, 'F24351093', '127.0.0.1', '2024-05-15', '18:28:42', 'info', 'etudiant authentifier au compte', 1, 22),
(507, 'S130003719', '127.0.0.1', '2024-05-15', '18:28:59', 'info', 'etudiant authentifier au compte', 1, 15),
(508, 'S130003719', '127.0.0.1', '2024-05-15', '18:29:11', 'info', 'etudiant authentifier au compte', 1, 15),
(509, 'S130003719', '127.0.0.1', '2024-05-15', '18:29:45', 'info', 'etudiant authentifier au compte', 1, 15),
(510, 'S130003719', '127.0.0.1', '2024-05-15', '18:30:20', 'info', 'etudiant authentifier au compte', 1, 15),
(511, 'F24351093', '127.0.0.1', '2024-05-15', '18:30:37', 'info', 'etudiant authentifier au compte', 1, 22),
(512, 'F24351093', '127.0.0.1', '2024-05-15', '18:30:40', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(513, 'F24351093', '127.0.0.1', '2024-05-15', '18:31:01', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(514, 'S130003719', '127.0.0.1', '2024-05-15', '18:32:24', 'info', 'etudiant authentifier au compte', 1, 15),
(515, 'F24351093', '127.0.0.1', '2024-05-15', '18:32:31', 'info', 'etudiant authentifier au compte', 1, 22),
(516, 'F24351093', '127.0.0.1', '2024-05-15', '18:32:33', 'info', 'etd: est allé à \"Compte\" ', 1, 22),
(517, 'F24351093', '127.0.0.1', '2024-05-15', '18:32:39', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(518, 'S130003719', '127.0.0.1', '2024-05-15', '18:34:07', 'info', 'etudiant authentifier au compte', 1, 15),
(519, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:14', 'info', 'etudiant authentifier au compte', 1, 22),
(520, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:17', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(521, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:18', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(522, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:19', 'info', 'etd: est allé à \"Rapport\" ', 1, 22),
(523, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:21', 'info', 'etd: est allé a \"notification\"', 1, 22),
(524, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:22', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(525, 'F24351093', '127.0.0.1', '2024-05-15', '18:34:23', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(526, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:10', 'info', 'etudiant authentifier au compte', 1, 22),
(527, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:12', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(528, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:13', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(529, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:28', 'info', 'etd: a consulter une Actualite', 1, 22),
(530, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:38', 'info', 'etd: a consulter une Actualite', 1, 22),
(531, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:45', 'info', 'etd: a consulter une Actualite', 1, 22),
(532, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:53', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(533, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:55', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(534, 'F24351093', '127.0.0.1', '2024-05-15', '18:35:56', 'info', 'etd: est allé à \"Rapport\" ', 1, 22),
(535, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:13', 'info', 'etudiant authentifier au compte', 1, 16),
(536, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:15', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(537, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:17', 'info', 'etd: est allé à \"Note\" ', 1, 16),
(538, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:18', 'info', 'etd: est allé à \"Rapport\" ', 1, 16),
(539, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:19', 'info', 'etd: est allé a \"notification\"', 1, 16),
(540, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:20', 'info', 'etd: est allé a \"notification\"', 1, 16),
(541, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:21', 'info', 'etd: est allé a \"notification\"', 1, 16),
(542, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:22', 'info', 'etd: est allé a \"notification\"', 1, 16),
(543, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:22', 'info', 'etd: est allé a \"notification\"', 1, 16),
(544, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:22', 'info', 'etd: est allé a \"notification\"', 1, 16),
(545, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:23', 'info', 'etd: est allé a \"notification\"', 1, 16),
(546, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:25', 'info', 'etd: est allé a \"notification\"', 1, 16),
(547, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:26', 'info', 'etd: est allé a \"notification\"', 1, 16),
(548, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:26', 'info', 'etd: est allé a \"notification\"', 1, 16),
(549, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:27', 'info', 'etd: est allé a \"notification\"', 1, 16),
(550, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:30', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(551, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:31', 'info', 'etd: est allé a \"notification\"', 1, 16),
(552, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:31', 'info', 'etd: est allé a \"notification\"', 1, 16),
(553, 'N147600043', '127.0.0.1', '2024-05-15', '18:47:32', 'info', 'etd: est allé a \"notification\"', 1, 16),
(554, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:19', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(555, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:20', 'info', 'etd: est allé à \"Note\" ', 1, 16),
(556, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:20', 'info', 'etd: est allé à \"Rapport\" ', 1, 16),
(557, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:21', 'info', 'etd: est allé a \"notification\"', 1, 16),
(558, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:21', 'info', 'etd: est allé à \"Rapport\" ', 1, 16),
(559, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:22', 'info', 'etd: est allé à \"Note\" ', 1, 16),
(560, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:24', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(561, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:28', 'info', 'etd: est allé a \"notification\"', 1, 16),
(562, 'N147600043', '127.0.0.1', '2024-05-15', '18:48:29', 'info', 'etd: a consulter une notification', 1, 16),
(563, 'N147600043', '127.0.0.1', '2024-05-15', '18:49:40', 'info', 'etd: est allé a \"notification\"', 1, 16),
(564, 'N147600043', '127.0.0.1', '2024-05-15', '18:50:11', 'info', 'etd: est allé à \"Rapport\" ', 1, 16),
(565, 'N147600043', '127.0.0.1', '2024-05-15', '18:51:00', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(566, 'N147600043', '127.0.0.1', '2024-05-15', '18:51:02', 'info', 'etd: est allé a \"notification\"', 1, 16),
(567, 'N147600043', '127.0.0.1', '2024-05-15', '18:51:04', 'info', 'etd: est allé à \"Rapport\" ', 1, 16),
(568, 'N147600043', '127.0.0.1', '2024-05-15', '18:51:07', 'info', 'etd: est allé à \"Note\" ', 1, 16),
(569, 'N147600043', '127.0.0.1', '2024-05-15', '18:52:35', 'info', 'etd: est allé a \"notification\"', 1, 16),
(570, 'N147600043', '127.0.0.1', '2024-05-15', '18:52:45', 'info', 'etd: est allé a \"notification\"', 1, 16),
(571, 'N147600043', '127.0.0.1', '2024-05-15', '18:52:53', 'info', 'etd: a consulter une notification', 1, 16),
(572, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:00', 'info', 'etd: est allé a \"notification\"', 1, 16),
(573, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:01', 'info', 'etd: a consulter une notification', 1, 16),
(574, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:18', 'info', 'etd: est allé à \"Rapport\" ', 1, 16),
(575, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:21', 'info', 'etd: est allé a \"notification\"', 1, 16),
(576, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:24', 'info', 'etd: est allé à \"Note\" ', 1, 16),
(577, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:28', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(578, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:31', 'info', 'etd: est allé consulter les cours de module ', 1, 16),
(579, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:34', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(580, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:50', 'info', 'etd: est allé à \"Compte\" ', 1, 16),
(581, 'N147600043', '127.0.0.1', '2024-05-15', '18:53:53', 'info', 'etd: est allé à \"editer compte\" ', 1, 16),
(582, 'N147600043', '127.0.0.1', '2024-05-15', '18:54:37', 'info', 'etd: est allé à \"Cours\" ', 1, 16),
(583, 'N147600043', '127.0.0.1', '2024-05-15', '18:54:45', 'info', 'etd: est allé consulter les cours de module ', 1, 16),
(584, 'N147600043', '127.0.0.1', '2024-05-15', '18:54:57', 'info', 'etd: est allé consulter les cours de module ', 1, 16),
(585, 'N147600043', '127.0.0.1', '2024-05-15', '18:55:04', 'info', 'etd: est allé consulter les cours de module ', 1, 16),
(586, 'CD792463', '127.0.0.1', '2024-05-15', '18:55:20', 'info', 'admin authentifier au compte', 1, 1),
(587, 'CD792463', '127.0.0.1', '2024-05-15', '18:55:54', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(588, 'D239801', '127.0.0.1', '2024-05-15', '18:56:17', 'info', 'prof authentifier au compte', 1, 10),
(589, 'D239801', '127.0.0.1', '2024-05-15', '18:56:23', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(590, 'D239801', '127.0.0.1', '2024-05-15', '18:56:27', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(591, 'D239801', '127.0.0.1', '2024-05-15', '18:56:30', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(592, 'D239801', '127.0.0.1', '2024-05-15', '18:56:38', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(593, 'D239801', '127.0.0.1', '2024-05-15', '18:56:43', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(594, 'D239801', '127.0.0.1', '2024-05-15', '18:57:50', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(595, 'D239801', '127.0.0.1', '2024-05-15', '18:58:00', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(596, 'D239801', '127.0.0.1', '2024-05-15', '18:58:08', 'info', 'prof: a desarchiver un cour ', 1, 10),
(597, 'D239801', '127.0.0.1', '2024-05-15', '18:58:09', 'info', 'prof: a desarchiver un cour ', 1, 10),
(598, 'D239801', '127.0.0.1', '2024-05-15', '18:58:09', 'info', 'prof: a desarchiver un cour ', 1, 10),
(599, 'D239801', '127.0.0.1', '2024-05-15', '18:58:11', 'info', 'prof: a archiver un cour ', 1, 10),
(600, 'D239801', '127.0.0.1', '2024-05-15', '18:58:12', 'info', 'prof: a archiver un cour ', 1, 10),
(601, 'D239801', '127.0.0.1', '2024-05-15', '18:58:12', 'info', 'prof: a archiver un cour ', 1, 10),
(602, 'D239801', '127.0.0.1', '2024-05-15', '18:58:13', 'info', 'prof: a archiver un cour ', 1, 10),
(603, 'S130003719', '127.0.0.1', '2024-05-15', '18:58:21', 'info', 'etudiant authentifier au compte', 1, 15),
(604, 'S130003719', '127.0.0.1', '2024-05-15', '18:58:23', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(605, 'S130003719', '127.0.0.1', '2024-05-15', '18:58:24', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(606, 'CD792463', '127.0.0.1', '2024-05-15', '19:04:17', 'info', 'admin authentifier au compte', 1, 1),
(607, 'CD792463', '127.0.0.1', '2024-05-15', '19:04:20', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(608, 'CD792463', '127.0.0.1', '2024-05-15', '19:04:41', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(609, 'CD792463', '127.0.0.1', '2024-05-15', '19:05:39', 'info', 'admin: a publier une annonce ', 1, 1),
(610, 'S130003719', '127.0.0.1', '2024-05-15', '19:05:53', 'info', 'etudiant authentifier au compte', 1, 15),
(611, 'S130003719', '127.0.0.1', '2024-05-15', '19:06:10', 'info', 'etd: a consulter une Actualite', 1, 15),
(612, 'S130003719', '127.0.0.1', '2024-05-15', '19:06:16', 'info', 'etd: est allé a \"notification\"', 1, 15),
(613, 'S130003719', '127.0.0.1', '2024-05-15', '19:06:20', 'info', 'etd: a consulter une Actualite', 1, 15),
(614, 'S130003719', '127.0.0.1', '2024-05-15', '19:06:28', 'info', 'etd: a consulter une Actualite', 1, 15),
(615, 'D239801', '127.0.0.1', '2024-05-15', '19:07:17', 'info', 'prof authentifier au compte', 1, 10),
(616, 'D239801', '127.0.0.1', '2024-05-15', '19:08:23', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(617, 'D239801', '127.0.0.1', '2024-05-15', '19:08:29', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(618, 'D239801', '127.0.0.1', '2024-05-15', '19:08:37', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(619, 'D239801', '127.0.0.1', '2024-05-15', '19:08:49', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(620, 'D239801', '127.0.0.1', '2024-05-15', '19:08:50', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(621, 'D239801', '127.0.0.1', '2024-05-15', '19:08:51', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(622, 'D239801', '127.0.0.1', '2024-05-15', '19:08:54', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(623, 'CD792463', '127.0.0.1', '2024-05-15', '19:14:24', 'info', 'admin authentifier au compte', 1, 1),
(624, 'CD792463', '127.0.0.1', '2024-05-15', '19:15:43', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(625, 'CD792463', '127.0.0.1', '2024-05-15', '19:16:25', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(626, 'CD792463', '127.0.0.1', '2024-05-15', '19:16:26', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(627, 'CD792463', '127.0.0.1', '2024-05-15', '19:16:28', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(628, 'CD792463', '127.0.0.1', '2024-05-15', '19:19:19', 'info', 'admin authentifier au compte', 1, 1),
(629, 'CD792463', '127.0.0.1', '2024-05-15', '19:19:20', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(630, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:05', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(631, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:13', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(632, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:14', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(633, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:16', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(634, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:16', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(635, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:21', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(636, 'CD792463', '127.0.0.1', '2024-05-15', '19:20:56', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(637, 'CD792463', '127.0.0.1', '2024-05-15', '19:21:00', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(638, 'CD792463', '127.0.0.1', '2024-05-15', '19:21:21', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(639, 'CD792463', '127.0.0.1', '2024-05-15', '19:21:53', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(640, 'CD792463', '127.0.0.1', '2024-05-15', '19:21:58', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(641, 'CD792463', '127.0.0.1', '2024-05-15', '19:24:59', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(642, 'CD792463', '127.0.0.1', '2024-05-15', '19:25:05', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(643, 'CD792463', '127.0.0.1', '2024-05-15', '19:25:06', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(644, 'CD792463', '127.0.0.1', '2024-05-15', '19:32:15', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(645, 'CD792463', '127.0.0.1', '2024-05-15', '19:32:25', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(646, 'CD792463', '127.0.0.1', '2024-05-15', '19:32:26', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(647, 'CD792463', '127.0.0.1', '2024-05-15', '19:35:55', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(648, 'CD792463', '127.0.0.1', '2024-05-15', '19:35:57', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(649, 'CD792463', '127.0.0.1', '2024-05-15', '19:36:08', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(650, 'CD792463', '127.0.0.1', '2024-05-15', '19:36:09', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(651, 'CD792463', '127.0.0.1', '2024-05-15', '19:36:16', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(652, 'CD792463', '127.0.0.1', '2024-05-15', '19:36:21', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(653, 'CD792463', '127.0.0.1', '2024-05-15', '19:36:23', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(654, 'CD792463', '127.0.0.1', '2024-05-15', '19:37:16', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(655, 'CD792463', '127.0.0.1', '2024-05-15', '19:37:18', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(656, 'CD792463', '127.0.0.1', '2024-05-15', '19:37:20', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(657, 'CD792463', '127.0.0.1', '2024-05-15', '19:37:22', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(658, 'CD792463', '127.0.0.1', '2024-05-15', '19:37:24', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(659, 'D239801', '127.0.0.1', '2024-05-15', '19:37:34', 'info', 'prof authentifier au compte', 1, 10),
(660, 'D239801', '127.0.0.1', '2024-05-15', '19:37:36', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(661, 'D239801', '127.0.0.1', '2024-05-15', '19:37:42', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(662, 'D239801', '127.0.0.1', '2024-05-15', '19:37:44', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(663, 'D239801', '127.0.0.1', '2024-05-15', '19:38:40', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(664, 'D239801', '127.0.0.1', '2024-05-15', '19:38:42', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(665, 'D239801', '127.0.0.1', '2024-05-15', '19:38:43', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(666, 'D239801', '127.0.0.1', '2024-05-15', '19:39:09', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(667, 'D239801', '127.0.0.1', '2024-05-15', '19:39:47', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(668, 'D239801', '127.0.0.1', '2024-05-15', '19:40:09', 'info', 'prof: est allé à \"editer compte\" ', 1, 10),
(669, 'D239801', '127.0.0.1', '2024-05-15', '19:40:53', 'info', 'prof: est allé à \"editer compte\" ', 1, 10),
(670, 'D239801', '127.0.0.1', '2024-05-15', '19:41:07', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(671, 'D239801', '127.0.0.1', '2024-05-15', '19:41:08', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(672, 'D239801', '127.0.0.1', '2024-05-15', '19:41:10', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(673, 'D239801', '127.0.0.1', '2024-05-15', '19:41:11', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(674, 'D239801', '127.0.0.1', '2024-05-15', '19:41:12', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(675, 'D239801', '127.0.0.1', '2024-05-15', '19:41:12', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(676, 'D239801', '127.0.0.1', '2024-05-15', '19:41:13', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(677, 'D239801', '127.0.0.1', '2024-05-15', '19:41:14', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(678, 'S130003719', '127.0.0.1', '2024-05-15', '19:42:16', 'info', 'etudiant authentifier au compte', 1, 15),
(679, 'S130003719', '127.0.0.1', '2024-05-15', '19:42:26', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(680, 'S130003719', '127.0.0.1', '2024-05-15', '19:42:27', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(681, 'S130003719', '127.0.0.1', '2024-05-15', '19:42:29', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(682, 'D239801', '127.0.0.1', '2024-05-15', '19:42:58', 'info', 'prof authentifier au compte', 1, 10),
(683, 'D239801', '127.0.0.1', '2024-05-15', '19:47:24', 'info', 'prof authentifier au compte', 1, 10),
(684, 'D239801', '127.0.0.1', '2024-05-15', '19:47:29', 'info', 'prof authentifier au compte', 1, 10),
(685, 'D239801', '127.0.0.1', '2024-05-15', '19:47:49', 'info', 'prof authentifier au compte', 1, 10),
(686, 'D239801', '127.0.0.1', '2024-05-15', '19:47:52', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(687, 'D239801', '127.0.0.1', '2024-05-15', '19:48:17', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(688, 'D239801', '127.0.0.1', '2024-05-15', '19:48:18', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(689, 'D239801', '127.0.0.1', '2024-05-15', '19:48:19', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(690, 'D239801', '127.0.0.1', '2024-05-15', '19:48:20', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(691, 'S130003719', '127.0.0.1', '2024-05-16', '13:26:41', 'info', 'etudiant authentifier au compte', 1, 15),
(692, 'CD792463', '127.0.0.1', '2024-05-16', '13:27:35', 'info', 'admin authentifier au compte', 1, 1),
(693, 'CD792463', '127.0.0.1', '2024-05-16', '13:27:44', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(694, 'CD792463', '127.0.0.1', '2024-05-16', '13:27:52', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(695, 'CD792463', '127.0.0.1', '2024-05-16', '13:28:50', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(696, 'CD792463', '127.0.0.1', '2024-05-16', '13:28:57', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(697, 'CD792463', '127.0.0.1', '2024-05-16', '13:29:11', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(698, 'CD792463', '127.0.0.1', '2024-05-16', '13:40:31', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(699, 'CD792463', '127.0.0.1', '2024-05-16', '13:54:26', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(700, 'CD792463', '127.0.0.1', '2024-05-16', '13:54:58', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(701, 'CD792463', '127.0.0.1', '2024-05-16', '13:55:06', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(702, 'S130003719', '127.0.0.1', '2024-05-16', '13:56:54', 'info', 'etudiant authentifier au compte', 1, 15),
(703, 'CD792463', '127.0.0.1', '2024-05-16', '13:58:12', 'info', 'admin authentifier au compte', 1, 1),
(704, NULL, '127.0.0.1', '2024-05-16', '13:58:36', 'info', 'etd: est allé à \"Cours\" ', 1, NULL),
(705, 'CD792463', '127.0.0.1', '2024-05-16', '14:01:25', 'info', 'admin authentifier au compte', 1, 1),
(706, 'D239801', '127.0.0.1', '2024-05-16', '14:07:33', 'info', 'prof authentifier au compte', 1, 10),
(707, 'D239801', '127.0.0.1', '2024-05-16', '14:07:45', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(708, 'D239801', '127.0.0.1', '2024-05-16', '14:23:54', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(709, 'D239801', '127.0.0.1', '2024-05-16', '14:23:55', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(710, 'D239801', '127.0.0.1', '2024-05-16', '14:23:59', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(711, 'D239801', '127.0.0.1', '2024-05-16', '14:24:01', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(712, 'D239801', '127.0.0.1', '2024-05-16', '14:24:05', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(713, 'D239801', '127.0.0.1', '2024-05-16', '14:24:06', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(714, 'D239801', '127.0.0.1', '2024-05-16', '14:24:08', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(715, 'D239801', '127.0.0.1', '2024-05-16', '14:24:08', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(716, 'D239801', '127.0.0.1', '2024-05-16', '14:24:09', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(717, 'D239801', '127.0.0.1', '2024-05-16', '14:24:10', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(718, 'D239801', '127.0.0.1', '2024-05-16', '14:24:17', 'info', 'prof: est allé à \"Compte\" ', 1, 10),
(719, 'D239801', '127.0.0.1', '2024-05-16', '14:24:22', 'info', 'prof: est allé à \"editer compte\" ', 1, 10),
(720, 'D239801', '127.0.0.1', '2024-05-16', '14:32:57', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(721, 'D239801', '127.0.0.1', '2024-05-16', '14:55:04', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(722, 'D239801', '127.0.0.1', '2024-05-16', '14:55:10', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(723, 'D239801', '127.0.0.1', '2024-05-16', '14:55:55', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(724, 'D239801', '127.0.0.1', '2024-05-16', '14:56:00', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(725, 'D239801', '127.0.0.1', '2024-05-16', '14:56:03', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(726, 'D239801', '127.0.0.1', '2024-05-16', '14:56:07', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(727, 'D239801', '127.0.0.1', '2024-05-16', '14:56:12', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(728, 'D239801', '127.0.0.1', '2024-05-16', '14:56:21', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(729, 'D239801', '127.0.0.1', '2024-05-16', '14:56:24', 'error', 'prof: error lors de l absence\" ', 1, 10),
(730, 'D239801', '127.0.0.1', '2024-05-16', '14:56:24', 'error', 'prof: error lors de l absence\" ', 1, 10),
(731, 'D239801', '127.0.0.1', '2024-05-16', '14:56:29', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(732, 'D239801', '127.0.0.1', '2024-05-16', '14:56:32', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(733, 'D239801', '127.0.0.1', '2024-05-16', '14:59:25', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(734, 'D239801', '127.0.0.1', '2024-05-16', '14:59:30', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(735, 'D239801', '127.0.0.1', '2024-05-16', '14:59:33', 'info', 'prof: a fait l absence ', 1, 10),
(736, 'D239801', '127.0.0.1', '2024-05-16', '14:59:33', 'info', 'prof: a fait l absence ', 1, 10),
(737, 'D239801', '127.0.0.1', '2024-05-16', '15:02:29', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(738, 'D239801', '127.0.0.1', '2024-05-16', '15:02:35', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(739, 'D239801', '127.0.0.1', '2024-05-16', '15:02:38', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(740, 'D239801', '127.0.0.1', '2024-05-16', '15:02:43', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(741, 'D239801', '127.0.0.1', '2024-05-16', '15:02:45', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(742, 'D239801', '127.0.0.1', '2024-05-16', '15:02:46', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(743, 'D239801', '127.0.0.1', '2024-05-16', '15:02:47', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(744, 'D239801', '127.0.0.1', '2024-05-16', '15:02:48', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(745, 'D239801', '127.0.0.1', '2024-05-16', '15:02:49', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(746, 'D239801', '127.0.0.1', '2024-05-16', '15:02:50', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(747, 'D239801', '127.0.0.1', '2024-05-16', '15:02:52', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(748, 'D239801', '127.0.0.1', '2024-05-16', '15:02:59', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(749, 'D239801', '127.0.0.1', '2024-05-16', '15:03:02', 'info', 'prof: a fait l absence ', 1, 10),
(750, 'D239801', '127.0.0.1', '2024-05-16', '15:03:02', 'info', 'prof: a fait l absence ', 1, 10),
(751, 'D239801', '127.0.0.1', '2024-05-16', '15:03:14', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(752, 'D239801', '127.0.0.1', '2024-05-16', '15:03:18', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(753, 'D239801', '127.0.0.1', '2024-05-16', '15:03:22', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(754, 'D239801', '127.0.0.1', '2024-05-16', '15:03:24', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(755, 'D239801', '127.0.0.1', '2024-05-16', '15:03:29', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(756, 'D239801', '127.0.0.1', '2024-05-16', '15:03:31', 'info', 'prof: a fait l absence ', 1, 10),
(757, 'D239801', '127.0.0.1', '2024-05-16', '15:03:31', 'info', 'prof: a fait l absence ', 1, 10),
(758, 'D239801', '127.0.0.1', '2024-05-16', '15:03:36', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(759, 'D239801', '127.0.0.1', '2024-05-16', '15:03:41', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(760, 'D239801', '127.0.0.1', '2024-05-16', '15:03:45', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(761, 'D239801', '127.0.0.1', '2024-05-16', '15:04:09', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(762, 'D239801', '127.0.0.1', '2024-05-16', '15:04:13', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(763, 'D239801', '127.0.0.1', '2024-05-16', '15:04:15', 'error', 'prof: error lors de l absence\" ', 1, 10),
(764, 'D239801', '127.0.0.1', '2024-05-16', '15:04:15', 'error', 'prof: error lors de l absence\" ', 1, 10),
(765, 'D239801', '127.0.0.1', '2024-05-16', '15:04:20', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(766, 'D239801', '127.0.0.1', '2024-05-16', '15:04:23', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(767, 'D239801', '127.0.0.1', '2024-05-16', '15:04:26', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(768, 'D239801', '127.0.0.1', '2024-05-16', '15:06:57', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(769, 'D239801', '127.0.0.1', '2024-05-16', '15:07:04', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(770, 'D239801', '127.0.0.1', '2024-05-16', '15:07:09', 'error', 'prof: error lors de l absence\" ', 1, 10),
(771, 'D239801', '127.0.0.1', '2024-05-16', '15:07:09', 'error', 'prof: error lors de l absence\" ', 1, 10),
(772, 'D239801', '127.0.0.1', '2024-05-16', '15:10:26', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(773, 'D239801', '127.0.0.1', '2024-05-16', '15:10:32', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(774, 'D239801', '127.0.0.1', '2024-05-16', '15:10:35', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(775, 'D239801', '127.0.0.1', '2024-05-16', '15:10:38', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(776, 'D239801', '127.0.0.1', '2024-05-16', '15:10:39', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(777, 'D239801', '127.0.0.1', '2024-05-16', '15:10:41', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(778, 'D239801', '127.0.0.1', '2024-05-16', '15:12:43', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(779, 'D239801', '127.0.0.1', '2024-05-16', '15:12:47', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(780, 'D239801', '127.0.0.1', '2024-05-16', '15:12:50', 'error', 'prof: error lors de l absence\" ', 1, 10),
(781, 'D239801', '127.0.0.1', '2024-05-16', '15:12:50', 'error', 'prof: error lors de l absence\" ', 1, 10),
(782, 'D239801', '127.0.0.1', '2024-05-16', '15:12:53', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(783, 'D239801', '127.0.0.1', '2024-05-16', '15:16:36', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(784, 'D239801', '127.0.0.1', '2024-05-16', '15:16:38', 'error', 'prof: error lors de l absence\" ', 1, 10),
(785, 'D239801', '127.0.0.1', '2024-05-16', '15:16:38', 'error', 'prof: error lors de l absence\" ', 1, 10),
(786, 'D239801', '127.0.0.1', '2024-05-16', '15:17:35', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(787, 'D239801', '127.0.0.1', '2024-05-16', '15:17:39', 'error', 'prof: error lors de l absence\" ', 1, 10),
(788, 'D239801', '127.0.0.1', '2024-05-16', '15:18:09', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(789, 'D239801', '127.0.0.1', '2024-05-16', '15:18:18', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(790, 'D239801', '127.0.0.1', '2024-05-16', '15:18:20', 'error', 'prof: error lors de l absence\" ', 1, 10),
(791, 'D239801', '127.0.0.1', '2024-05-16', '15:20:00', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(792, 'D239801', '127.0.0.1', '2024-05-16', '15:24:48', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(793, 'D239801', '127.0.0.1', '2024-05-16', '15:24:51', 'info', 'prof: a fait l absence ', 1, 10),
(794, 'D239801', '127.0.0.1', '2024-05-16', '15:24:51', 'info', 'prof: a fait l absence ', 1, 10),
(795, 'D239801', '127.0.0.1', '2024-05-16', '15:24:54', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(796, 'D239801', '127.0.0.1', '2024-05-16', '15:29:30', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(797, 'D239801', '127.0.0.1', '2024-05-16', '15:29:34', 'error', 'prof: error lors de l absence\" ', 1, 10),
(798, 'D239801', '127.0.0.1', '2024-05-16', '15:29:34', 'error', 'prof: error lors de l absence\" ', 1, 10),
(799, 'D239801', '127.0.0.1', '2024-05-16', '15:29:42', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(800, 'D239801', '127.0.0.1', '2024-05-16', '15:29:45', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(801, 'D239801', '127.0.0.1', '2024-05-16', '15:31:38', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(802, 'D239801', '127.0.0.1', '2024-05-16', '15:31:44', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(803, 'D239801', '127.0.0.1', '2024-05-16', '15:31:47', 'info', 'prof: a fait l absence ', 1, 10),
(804, 'D239801', '127.0.0.1', '2024-05-16', '15:31:47', 'info', 'prof: a fait l absence ', 1, 10),
(805, 'D239801', '127.0.0.1', '2024-05-16', '15:31:49', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(806, 'D239801', '127.0.0.1', '2024-05-16', '15:31:51', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(807, 'D239801', '127.0.0.1', '2024-05-16', '15:31:53', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(808, 'D239801', '127.0.0.1', '2024-05-16', '15:33:26', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(809, 'CD792463', '127.0.0.1', '2024-05-16', '15:33:31', 'info', 'admin authentifier au compte', 1, 1),
(810, 'CD792463', '127.0.0.1', '2024-05-16', '15:36:40', 'info', 'admin authentifier au compte', 1, 1),
(811, 'CD792463', '127.0.0.1', '2024-05-16', '15:38:47', 'info', 'admin authentifier au compte', 1, 1),
(812, 'CD792463', '127.0.0.1', '2024-05-18', '17:46:45', 'info', 'admin authentifier au compte', 1, 1),
(813, 'CD792463', '127.0.0.1', '2024-05-18', '17:46:53', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(814, 'CD792463', '127.0.0.1', '2024-05-18', '17:47:27', 'info', 'admin: a changer l\'email ', 1, 1),
(815, 'CD792463', '127.0.0.1', '2024-05-18', '17:47:33', 'info', 'admin: a changer l\'email ', 1, 1),
(816, 'CD792463', '127.0.0.1', '2024-05-18', '17:50:24', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(817, 'CD792463', '127.0.0.1', '2024-05-18', '17:50:26', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(818, 'CD792463', '127.0.0.1', '2024-05-18', '17:50:41', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(819, 'CD792463', '127.0.0.1', '2024-05-18', '17:50:46', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(820, 'CD792463', '127.0.0.1', '2024-05-18', '17:50:47', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(821, 'CD792463', '127.0.0.1', '2024-05-18', '17:50:58', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(822, 'D239801', '127.0.0.1', '2024-05-18', '17:51:09', 'info', 'prof authentifier au compte', 1, 10),
(823, 'D239801', '127.0.0.1', '2024-05-18', '17:51:14', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(824, 'D239801', '127.0.0.1', '2024-05-18', '17:51:20', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(825, 'D239801', '127.0.0.1', '2024-05-18', '17:51:30', 'info', 'prof: a fait l absence ', 1, 10),
(826, 'D239801', '127.0.0.1', '2024-05-18', '17:51:30', 'info', 'prof: a fait l absence ', 1, 10),
(827, 'D239801', '127.0.0.1', '2024-05-18', '17:51:38', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(828, 'D239801', '127.0.0.1', '2024-05-18', '17:51:43', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(829, 'D239801', '127.0.0.1', '2024-05-18', '17:51:45', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(830, 'D239801', '127.0.0.1', '2024-05-18', '17:51:46', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(831, 'D239801', '127.0.0.1', '2024-05-18', '17:51:47', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(832, 'D239801', '127.0.0.1', '2024-05-18', '17:51:54', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(833, 'D239801', '127.0.0.1', '2024-05-18', '17:52:01', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(834, 'D239801', '127.0.0.1', '2024-05-18', '17:52:03', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(835, 'D239801', '127.0.0.1', '2024-05-18', '17:52:11', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(836, 'D239801', '127.0.0.1', '2024-05-18', '17:52:41', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(837, 'D239801', '127.0.0.1', '2024-05-18', '17:52:45', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(838, 'D239801', '127.0.0.1', '2024-05-18', '17:52:47', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(839, 'D239801', '127.0.0.1', '2024-05-18', '17:52:51', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(840, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:10', 'info', 'etudiant authentifier au compte', 1, 15),
(841, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:17', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(842, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:20', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(843, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:28', 'info', 'etd: est allé a \"notification\"', 1, 15),
(844, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:30', 'info', 'etd: a consulter une notification', 1, 15),
(845, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:31', 'info', 'etd: a consulter une notification', 1, 15),
(846, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:32', 'info', 'etd: est allé a \"notification\"', 1, 15),
(847, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:33', 'info', 'etd: est allé a \"notification\"', 1, 15),
(848, 'S130003719', '127.0.0.1', '2024-05-18', '17:53:34', 'info', 'etd: est allé a \"notification\"', 1, 15),
(849, 'CD792463', '127.0.0.1', '2024-05-18', '17:53:49', 'info', 'admin authentifier au compte', 1, 1),
(850, 'CD792463', '127.0.0.1', '2024-05-18', '17:53:51', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(851, 'CD792463', '127.0.0.1', '2024-05-18', '17:54:26', 'info', 'admin: a publier une annonce ', 1, 1),
(852, 'S130003719', '127.0.0.1', '2024-05-18', '17:54:35', 'info', 'etudiant authentifier au compte', 1, 15),
(853, 'S130003719', '127.0.0.1', '2024-05-18', '17:54:55', 'info', 'etd: est allé a \"notification\"', 1, 15),
(854, 'S130003719', '127.0.0.1', '2024-05-18', '17:55:02', 'info', 'etd: a consulter une notification', 1, 15),
(855, 'S130003719', '127.0.0.1', '2024-05-18', '17:55:26', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(856, 'S130003719', '127.0.0.1', '2024-05-18', '17:55:39', 'info', 'etd: a submiter un rapport ', 1, 15),
(857, 'S130003719', '127.0.0.1', '2024-05-18', '17:55:52', 'error', 'etd: tenter de submiter un rapport deux fois ', 1, 15),
(858, 'S130003719', '127.0.0.1', '2024-05-18', '17:58:25', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(859, 'S130003719', '127.0.0.1', '2024-05-18', '17:58:34', 'info', 'etd: est allé a \"notification\"', 1, 15),
(860, 'CD792463', '127.0.0.1', '2024-05-18', '17:58:47', 'info', 'admin authentifier au compte', 1, 1),
(861, NULL, '127.0.0.1', '2024-05-19', '12:41:58', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(862, 'D239801', '127.0.0.1', '2024-05-19', '12:42:04', 'info', 'prof authentifier au compte', 1, 10),
(863, 'D239801', '127.0.0.1', '2024-05-19', '12:42:11', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(864, 'D239801', '127.0.0.1', '2024-05-19', '12:42:13', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(865, 'D239801', '127.0.0.1', '2024-05-19', '12:42:16', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(866, 'D239801', '127.0.0.1', '2024-05-19', '12:42:19', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(867, 'D239801', '127.0.0.1', '2024-05-19', '12:42:20', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(868, 'D239801', '127.0.0.1', '2024-05-19', '12:42:23', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(869, 'D239801', '127.0.0.1', '2024-05-19', '12:42:24', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(870, 'D239801', '127.0.0.1', '2024-05-19', '12:42:25', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(871, 'D239801', '127.0.0.1', '2024-05-19', '12:42:29', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(872, 'D239801', '127.0.0.1', '2024-05-19', '12:42:30', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(873, 'D239801', '127.0.0.1', '2024-05-19', '12:42:31', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(874, 'D239801', '127.0.0.1', '2024-05-19', '12:42:40', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(875, 'D239801', '127.0.0.1', '2024-05-19', '12:42:43', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(876, 'CD792463', '127.0.0.1', '2024-05-19', '12:55:53', 'info', 'admin authentifier au compte', 1, 1),
(877, NULL, '127.0.0.1', '2024-05-19', '13:20:49', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, NULL),
(878, NULL, '127.0.0.1', '2024-05-19', '13:20:54', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, NULL),
(879, NULL, '127.0.0.1', '2024-05-19', '13:21:28', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, NULL),
(880, NULL, '127.0.0.1', '2024-05-19', '13:23:04', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, NULL),
(881, 'CD792463', '127.0.0.1', '2024-05-19', '13:23:18', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(882, 'CD792463', '127.0.0.1', '2024-05-19', '13:23:19', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(883, 'CD792463', '127.0.0.1', '2024-05-19', '13:24:33', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(884, 'CD792463', '127.0.0.1', '2024-05-19', '13:24:33', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(885, 'CD792463', '127.0.0.1', '2024-05-19', '13:24:51', 'info', 'admin authentifier au compte', 1, 1),
(886, 'CD792463', '127.0.0.1', '2024-05-19', '13:24:58', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(887, 'CD792463', '127.0.0.1', '2024-05-19', '13:25:03', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(888, 'CD792463', '127.0.0.1', '2024-05-19', '13:25:13', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(889, 'CD792463', '127.0.0.1', '2024-05-19', '13:25:14', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(890, 'CD792463', '127.0.0.1', '2024-05-19', '13:25:15', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(891, 'CD792463', '127.0.0.1', '2024-05-19', '13:25:16', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(892, 'CD792463', '127.0.0.1', '2024-05-19', '13:31:32', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(893, 'D239801', '127.0.0.1', '2024-05-19', '13:33:06', 'info', 'prof authentifier au compte', 1, 10),
(894, 'CD792463', '127.0.0.1', '2024-05-19', '13:33:37', 'info', 'admin authentifier au compte', 1, 1),
(895, 'CD792463', '127.0.0.1', '2024-05-19', '13:37:23', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(896, 'CD792463', '127.0.0.1', '2024-05-19', '13:38:31', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(897, 'CD792463', '127.0.0.1', '2024-05-19', '13:38:36', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(898, 'CD792463', '127.0.0.1', '2024-05-19', '13:38:39', 'info', 'admin: a desactiver un compte', 1, 1),
(899, 'CD792463', '127.0.0.1', '2024-05-19', '13:40:06', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(900, 'CD792463', '127.0.0.1', '2024-05-19', '13:41:00', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(901, 'S130003719', '127.0.0.1', '2024-05-19', '13:41:21', 'info', 'etudiant authentifier au compte', 1, 15),
(902, 'S130003719', '127.0.0.1', '2024-05-19', '13:41:27', 'info', 'etd: a consulter une Actualite', 1, 15),
(903, 'S130003719', '127.0.0.1', '2024-05-19', '13:41:33', 'info', 'etd: a consulter une Actualite', 1, 15),
(904, 'CD792463', '127.0.0.1', '2024-05-19', '13:45:37', 'info', 'admin authentifier au compte', 1, 1),
(905, 'S130003719', '127.0.0.1', '2024-05-19', '13:45:40', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(906, 'CD792463', '127.0.0.1', '2024-05-19', '13:45:44', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(907, 'S130003719', '127.0.0.1', '2024-05-19', '13:59:12', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(908, 'S130003719', '127.0.0.1', '2024-05-19', '14:44:09', 'info', 'etudiant authentifier au compte', 1, 15),
(909, 'S130003719', '127.0.0.1', '2024-05-19', '14:47:32', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(910, 'S130003719', '127.0.0.1', '2024-05-19', '14:48:06', 'info', 'etd: est allé à \"Compte\" ', 1, 15),
(911, 'S130003719', '127.0.0.1', '2024-05-19', '14:49:20', 'info', 'etudiant authentifier au compte', 1, 15),
(912, 'S130003719', '127.0.0.1', '2024-05-19', '14:49:23', 'info', 'etd: est allé a \"notification\"', 1, 15),
(913, 'S130003719', '127.0.0.1', '2024-05-19', '14:53:51', 'info', 'etudiant authentifier au compte', 1, 15),
(914, 'S130003719', '127.0.0.1', '2024-05-19', '14:53:59', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(915, 'S130003719', '127.0.0.1', '2024-05-19', '14:54:01', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(916, 'S130003719', '127.0.0.1', '2024-05-19', '14:54:13', 'info', 'etd: est allé a \"notification\"', 1, 15),
(917, 'S130003719', '127.0.0.1', '2024-05-19', '14:54:35', 'info', 'etd: a consulter une notification', 1, 15),
(918, 'CD792463', '127.0.0.1', '2024-05-19', '14:57:26', 'info', 'admin authentifier au compte', 1, 1),
(919, 'S130003719', '127.0.0.1', '2024-05-19', '14:57:52', 'info', 'etudiant authentifier au compte', 1, 15),
(920, 'S130003719', '127.0.0.1', '2024-05-19', '14:57:54', 'info', 'etd: est allé a \"notification\"', 1, 15),
(921, 'S130003719', '127.0.0.1', '2024-05-19', '15:00:55', 'info', 'etudiant authentifier au compte', 1, 15),
(922, 'S130003719', '127.0.0.1', '2024-05-19', '15:00:57', 'info', 'etd: est allé a \"notification\"', 1, 15),
(923, 'S130003719', '127.0.0.1', '2024-05-19', '15:12:25', 'info', 'etd: est allé à \"Compte\" ', 1, 15),
(924, 'S130003719', '127.0.0.1', '2024-05-19', '15:18:05', 'info', 'etd: est allé a \"notification\"', 1, 15),
(925, 'CD792463', '127.0.0.1', '2024-05-19', '15:18:22', 'info', 'admin authentifier au compte', 1, 1),
(926, 'S130003719', '127.0.0.1', '2024-05-19', '15:18:32', 'info', 'etudiant authentifier au compte', 1, 15),
(927, 'CD792463', '127.0.0.1', '2024-05-19', '15:18:37', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(928, 'CD792463', '127.0.0.1', '2024-05-19', '15:18:42', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(929, 'CD792463', '127.0.0.1', '2024-05-19', '15:18:44', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(930, 'CD792463', '127.0.0.1', '2024-05-19', '15:26:36', 'info', 'admin authentifier au compte', 1, 1),
(933, 'CD792463', '127.0.0.1', '2024-05-19', '15:37:42', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(934, 'CD792463', '127.0.0.1', '2024-05-19', '15:38:52', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(935, 'CD792463', '127.0.0.1', '2024-05-19', '15:52:09', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(936, 'S130003719', '127.0.0.1', '2024-05-19', '15:52:49', 'info', 'etudiant authentifier au compte', 1, 15),
(937, NULL, '127.0.0.1', '2024-05-19', '15:52:52', 'info', 'admin: est allé à \"publier annonce\" ', 1, NULL),
(938, 'CD792463', '127.0.0.1', '2024-05-19', '15:52:59', 'info', 'admin authentifier au compte', 1, 1),
(939, 'CD792463', '127.0.0.1', '2024-05-19', '15:53:00', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(940, NULL, '127.0.0.1', '2024-05-19', '15:53:03', 'info', 'etd: est allé à \"Note\" ', 1, NULL),
(941, 'CD792463', '127.0.0.1', '2024-05-19', '16:10:04', 'info', 'admin authentifier au compte', 1, 1),
(942, 'CD792463', '127.0.0.1', '2024-05-19', '16:10:04', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(943, 'CD792463', '127.0.0.1', '2024-05-19', '16:10:05', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(944, 'CD792463', '127.0.0.1', '2024-05-19', '16:10:06', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(945, 'CD792463', '127.0.0.1', '2024-05-19', '16:10:06', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(946, 'CD792463', '127.0.0.1', '2024-05-19', '16:10:11', 'info', 'admin authentifier au compte', 1, 1),
(947, 'CD792463', '127.0.0.1', '2024-05-19', '18:10:32', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(948, 'CD792463', '127.0.0.1', '2024-05-19', '18:10:35', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(949, 'S130003719', '127.0.0.1', '2024-05-20', '13:18:12', 'info', 'etudiant authentifier au compte', 1, 15),
(950, 'D239801', '127.0.0.1', '2024-05-20', '13:19:28', 'info', 'prof authentifier au compte', 1, 10),
(951, 'CD792463', '127.0.0.1', '2024-05-20', '13:19:36', 'info', 'admin authentifier au compte', 1, 1),
(952, 'CD792463', '127.0.0.1', '2024-05-20', '13:33:33', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(953, 'CD792463', '127.0.0.1', '2024-05-20', '13:33:35', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(954, 'CD792463', '127.0.0.1', '2024-05-20', '13:34:50', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(955, 'CD792463', '127.0.0.1', '2024-05-20', '13:34:56', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(956, 'CD792463', '127.0.0.1', '2024-05-20', '13:34:57', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1);
INSERT INTO `Journalisation` (`IdJournalisation`, `CNE`, `AdressIP`, `Date`, `Heure`, `Criticite`, `action`, `IdAdmin`, `IdCompte`) VALUES
(957, 'CD792463', '127.0.0.1', '2024-05-20', '13:34:59', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(958, 'S130003719', '127.0.0.1', '2024-05-20', '13:35:33', 'info', 'etudiant authentifier au compte', 1, 15),
(959, 'S130003719', '127.0.0.1', '2024-05-20', '13:35:36', 'info', 'etd: est allé a \"notification\"', 1, 15),
(960, 'S130003719', '127.0.0.1', '2024-05-20', '13:35:37', 'info', 'etd: a consulter une notification', 1, 15),
(961, 'S130003719', '127.0.0.1', '2024-05-20', '13:35:53', 'info', 'etd: a consulter une notification', 1, 15),
(962, 'CD792463', '127.0.0.1', '2024-05-20', '13:56:12', 'info', 'admin authentifier au compte', 1, 1),
(963, 'CD792463', '127.0.0.1', '2024-05-20', '14:03:27', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(964, 'S130003719', '127.0.0.1', '2024-05-20', '14:32:22', 'info', 'etudiant authentifier au compte', 1, 15),
(965, 'S130003719', '127.0.0.1', '2024-05-20', '14:32:24', 'info', 'etd: a consulter une Actualite', 1, 15),
(966, 'CD792463', '127.0.0.1', '2024-05-20', '14:32:33', 'info', 'admin authentifier au compte', 1, 1),
(967, 'D239801', '127.0.0.1', '2024-05-20', '14:59:37', 'info', 'prof authentifier au compte', 1, 10),
(968, 'CD792463', '127.0.0.1', '2024-05-20', '15:00:12', 'info', 'admin authentifier au compte', 1, 1),
(969, 'D239801', '127.0.0.1', '2024-05-20', '15:11:44', 'info', 'prof authentifier au compte', 1, 10),
(970, 'CD792463', '127.0.0.1', '2024-05-20', '15:14:45', 'info', 'admin authentifier au compte', 1, 1),
(971, 'CD792463', '127.0.0.1', '2024-05-20', '15:35:42', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(972, 'CD792463', '127.0.0.1', '2024-05-20', '15:49:34', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(973, 'CD792463', '127.0.0.1', '2024-05-20', '15:49:49', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(974, 'CD792463', '127.0.0.1', '2024-05-20', '15:49:54', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(975, 'CD792463', '127.0.0.1', '2024-05-20', '15:52:35', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(976, 'CD792463', '127.0.0.1', '2024-05-20', '16:03:12', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(977, 'CD792463', '127.0.0.1', '2024-05-20', '16:03:27', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(978, 'CD792463', '127.0.0.1', '2024-05-20', '16:03:35', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(979, 'CD792463', '127.0.0.1', '2024-05-20', '16:05:53', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(980, 'CD792463', '127.0.0.1', '2024-05-20', '16:05:53', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(981, 'CD792463', '127.0.0.1', '2024-05-20', '16:05:57', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(982, 'CD792463', '127.0.0.1', '2024-05-20', '16:05:57', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(983, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:17', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(984, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:17', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(985, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:19', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(986, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:19', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(987, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:22', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(988, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:23', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(989, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:23', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(990, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:28', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(991, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:29', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(992, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:29', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(993, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:32', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(994, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:33', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(995, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:33', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(996, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:36', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(997, 'CD792463', '127.0.0.1', '2024-05-20', '16:06:36', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(998, 'CD792463', '127.0.0.1', '2024-05-20', '16:09:14', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(999, 'CD792463', '127.0.0.1', '2024-05-20', '16:09:16', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(1000, 'CD792463', '127.0.0.1', '2024-05-20', '16:09:16', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1001, 'CD792463', '127.0.0.1', '2024-05-20', '16:09:17', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(1002, 'CD792463', '127.0.0.1', '2024-05-20', '16:09:17', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1003, 'CD792463', '127.0.0.1', '2024-05-20', '16:11:05', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(1004, 'CD792463', '127.0.0.1', '2024-05-20', '16:11:05', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1005, 'CD792463', '127.0.0.1', '2024-05-20', '16:13:17', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(1006, 'CD792463', '127.0.0.1', '2024-05-20', '16:13:18', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1007, 'CD792463', '127.0.0.1', '2024-05-20', '16:14:52', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1008, 'CD792463', '127.0.0.1', '2024-05-20', '16:15:05', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1009, 'CD792463', '127.0.0.1', '2024-05-20', '16:15:22', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1010, 'CD792463', '127.0.0.1', '2024-05-20', '16:15:24', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1011, 'CD792463', '127.0.0.1', '2024-05-20', '16:15:29', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(1012, 'CD792463', '127.0.0.1', '2024-05-20', '16:19:05', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1013, 'CD792463', '127.0.0.1', '2024-05-20', '16:19:11', 'info', 'admin: a desactiver le compte d\'un prof ', 1, 1),
(1014, 'CD792463', '127.0.0.1', '2024-05-20', '16:21:40', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(1015, 'CD792463', '127.0.0.1', '2024-05-20', '16:21:41', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(1016, 'CD792463', '127.0.0.1', '2024-05-20', '16:21:54', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(1017, 'CD792463', '127.0.0.1', '2024-05-20', '16:22:13', 'info', 'admin: a activer le compte d\'un prof ', 1, 1),
(1018, 'CD792463', '127.0.0.1', '2024-05-20', '16:28:52', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1019, 'CD792463', '127.0.0.1', '2024-05-20', '16:29:09', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1020, 'CD792463', '127.0.0.1', '2024-05-20', '16:29:13', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1021, 'CD792463', '127.0.0.1', '2024-05-20', '16:29:16', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1022, 'CD792463', '127.0.0.1', '2024-05-20', '16:29:20', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1023, 'D239801', '127.0.0.1', '2024-05-20', '16:30:40', 'info', 'prof authentifier au compte', 1, 10),
(1024, 'D239801', '127.0.0.1', '2024-05-20', '16:30:43', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1025, 'D239801', '127.0.0.1', '2024-05-20', '16:30:46', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1026, 'D239801', '127.0.0.1', '2024-05-20', '16:30:47', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1027, 'D239801', '127.0.0.1', '2024-05-20', '16:31:10', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1028, 'D239801', '127.0.0.1', '2024-05-20', '16:45:22', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1029, 'D239801', '127.0.0.1', '2024-05-20', '16:45:23', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1030, 'D239801', '127.0.0.1', '2024-05-20', '16:45:25', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1031, 'D239801', '127.0.0.1', '2024-05-20', '16:46:15', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1032, 'D239801', '127.0.0.1', '2024-05-20', '16:46:39', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1033, 'D239801', '127.0.0.1', '2024-05-20', '16:46:46', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1034, 'D239801', '127.0.0.1', '2024-05-20', '16:46:47', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1035, 'D239801', '127.0.0.1', '2024-05-20', '16:46:48', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1036, 'D239801', '127.0.0.1', '2024-05-20', '16:46:49', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1037, 'D239801', '127.0.0.1', '2024-05-20', '16:46:49', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1038, 'D239801', '127.0.0.1', '2024-05-20', '16:46:50', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1039, 'D239801', '127.0.0.1', '2024-05-20', '16:46:51', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1040, 'D239801', '127.0.0.1', '2024-05-20', '16:46:52', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1041, 'D239801', '127.0.0.1', '2024-05-20', '16:46:53', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1042, 'D239801', '127.0.0.1', '2024-05-20', '16:47:25', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1043, 'D239801', '127.0.0.1', '2024-05-20', '16:47:26', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1044, 'D239801', '127.0.0.1', '2024-05-20', '16:47:29', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1045, 'D239801', '127.0.0.1', '2024-05-20', '16:47:32', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1046, 'D239801', '127.0.0.1', '2024-05-20', '16:47:35', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1047, 'D239801', '127.0.0.1', '2024-05-20', '16:47:36', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1048, 'D239801', '127.0.0.1', '2024-05-20', '16:56:36', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1049, 'D239801', '127.0.0.1', '2024-05-20', '16:56:37', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1050, 'D239801', '127.0.0.1', '2024-05-20', '16:56:39', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1051, 'D239801', '127.0.0.1', '2024-05-20', '16:56:41', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1052, 'D239801', '127.0.0.1', '2024-05-20', '16:57:07', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1053, 'D239801', '127.0.0.1', '2024-05-20', '16:57:10', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1054, 'D239801', '127.0.0.1', '2024-05-20', '16:57:11', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1055, 'D239801', '127.0.0.1', '2024-05-20', '17:10:25', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1056, 'D239801', '127.0.0.1', '2024-05-20', '17:10:29', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1057, 'D239801', '127.0.0.1', '2024-05-20', '17:10:30', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1058, 'D239801', '127.0.0.1', '2024-05-20', '17:10:46', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1059, 'D239801', '127.0.0.1', '2024-05-20', '17:12:59', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1060, 'D239801', '127.0.0.1', '2024-05-20', '17:13:42', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1061, 'D239801', '127.0.0.1', '2024-05-20', '17:13:47', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1062, 'D239801', '127.0.0.1', '2024-05-20', '17:26:48', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1063, 'D239801', '127.0.0.1', '2024-05-20', '17:26:53', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1064, 'D239801', '127.0.0.1', '2024-05-20', '17:26:54', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1065, 'D239801', '127.0.0.1', '2024-05-20', '17:27:03', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1066, 'D239801', '127.0.0.1', '2024-05-20', '17:27:05', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1067, 'D239801', '127.0.0.1', '2024-05-20', '17:27:09', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1068, 'D239801', '127.0.0.1', '2024-05-20', '17:27:09', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1069, 'D239801', '127.0.0.1', '2024-05-20', '17:27:23', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1070, 'D239801', '127.0.0.1', '2024-05-20', '17:27:34', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1071, 'D239801', '127.0.0.1', '2024-05-20', '17:27:37', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1072, 'D239801', '127.0.0.1', '2024-05-20', '17:27:39', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1073, 'D239801', '127.0.0.1', '2024-05-20', '17:30:25', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1074, 'D239801', '127.0.0.1', '2024-05-20', '17:32:23', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1075, 'D239801', '127.0.0.1', '2024-05-20', '17:32:24', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1076, 'D239801', '127.0.0.1', '2024-05-20', '17:32:25', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1077, 'D239801', '127.0.0.1', '2024-05-20', '17:33:02', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1078, 'D239801', '127.0.0.1', '2024-05-20', '17:33:06', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1079, 'D239801', '127.0.0.1', '2024-05-20', '17:33:07', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1080, 'D239801', '127.0.0.1', '2024-05-20', '17:33:36', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1081, 'D239801', '127.0.0.1', '2024-05-20', '17:34:14', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1082, 'D239801', '127.0.0.1', '2024-05-20', '17:34:33', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1083, 'D239801', '127.0.0.1', '2024-05-20', '17:34:38', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1084, 'D239801', '127.0.0.1', '2024-05-20', '17:34:44', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1085, 'D239801', '127.0.0.1', '2024-05-20', '17:34:47', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1086, 'D239801', '127.0.0.1', '2024-05-20', '17:34:48', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1087, 'D239801', '127.0.0.1', '2024-05-20', '17:34:49', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1088, 'D239801', '127.0.0.1', '2024-05-20', '17:34:50', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1089, 'D239801', '127.0.0.1', '2024-05-20', '17:35:35', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1090, 'D239801', '127.0.0.1', '2024-05-20', '17:35:38', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1091, 'D239801', '127.0.0.1', '2024-05-20', '17:35:53', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1092, 'D239801', '127.0.0.1', '2024-05-20', '17:35:55', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1093, 'D239801', '127.0.0.1', '2024-05-20', '17:35:58', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1094, 'D239801', '127.0.0.1', '2024-05-20', '17:38:26', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1095, 'D239801', '127.0.0.1', '2024-05-20', '17:38:32', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1096, 'D239801', '127.0.0.1', '2024-05-20', '17:38:34', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1097, 'D239801', '127.0.0.1', '2024-05-20', '17:38:41', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1098, 'D239801', '127.0.0.1', '2024-05-20', '17:38:45', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1099, 'D239801', '127.0.0.1', '2024-05-20', '17:38:45', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1100, 'D239801', '127.0.0.1', '2024-05-20', '17:38:49', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1101, 'D239801', '127.0.0.1', '2024-05-20', '17:41:28', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1102, 'D239801', '127.0.0.1', '2024-05-20', '17:41:32', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1103, 'D239801', '127.0.0.1', '2024-05-20', '17:41:33', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1104, 'D239801', '127.0.0.1', '2024-05-20', '17:41:42', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1105, 'D239801', '127.0.0.1', '2024-05-20', '17:42:06', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1106, 'D239801', '127.0.0.1', '2024-05-20', '17:42:38', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1107, 'D239801', '127.0.0.1', '2024-05-20', '17:42:39', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1108, 'D239801', '127.0.0.1', '2024-05-20', '17:42:40', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1109, 'D239801', '127.0.0.1', '2024-05-20', '17:42:45', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1110, 'D239801', '127.0.0.1', '2024-05-20', '17:42:49', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1111, 'D239801', '127.0.0.1', '2024-05-20', '17:43:39', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1112, 'D239801', '127.0.0.1', '2024-05-20', '17:43:43', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1113, 'D239801', '127.0.0.1', '2024-05-20', '17:43:57', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1114, 'D239801', '127.0.0.1', '2024-05-20', '17:44:18', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1115, 'D239801', '127.0.0.1', '2024-05-20', '17:44:20', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1116, 'D239801', '127.0.0.1', '2024-05-20', '17:44:23', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1117, 'D239801', '127.0.0.1', '2024-05-20', '17:44:25', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1118, 'D239801', '127.0.0.1', '2024-05-20', '17:44:28', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1119, 'D239801', '127.0.0.1', '2024-05-20', '17:44:46', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1120, 'D239801', '127.0.0.1', '2024-05-20', '17:47:12', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1121, 'D239801', '127.0.0.1', '2024-05-20', '17:47:18', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1122, 'D239801', '127.0.0.1', '2024-05-20', '17:47:23', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1123, 'D239801', '127.0.0.1', '2024-05-20', '17:47:28', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1124, 'D239801', '127.0.0.1', '2024-05-20', '17:47:32', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1125, 'D239801', '127.0.0.1', '2024-05-20', '17:47:36', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1126, 'D239801', '127.0.0.1', '2024-05-20', '17:47:41', 'info', 'prof: a fait l absence ', 1, 10),
(1127, 'D239801', '127.0.0.1', '2024-05-20', '17:47:41', 'info', 'prof: a fait l absence ', 1, 10),
(1128, 'D239801', '127.0.0.1', '2024-05-20', '17:47:41', 'info', 'prof: a fait l absence ', 1, 10),
(1129, 'D239801', '127.0.0.1', '2024-05-20', '17:47:41', 'info', 'prof: a fait l absence ', 1, 10),
(1130, 'D239801', '127.0.0.1', '2024-05-20', '17:47:41', 'info', 'prof: a fait l absence ', 1, 10),
(1131, 'D239801', '127.0.0.1', '2024-05-20', '17:47:44', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1132, 'D239801', '127.0.0.1', '2024-05-20', '17:47:47', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1133, 'D239801', '127.0.0.1', '2024-05-20', '17:47:49', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1134, 'D239801', '127.0.0.1', '2024-05-20', '17:48:38', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1135, 'D239801', '127.0.0.1', '2024-05-20', '17:48:41', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1136, 'D239801', '127.0.0.1', '2024-05-20', '17:48:45', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1137, 'D239801', '127.0.0.1', '2024-05-20', '17:51:09', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1138, 'D239801', '127.0.0.1', '2024-05-20', '17:51:13', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1139, 'D239801', '127.0.0.1', '2024-05-20', '17:51:17', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1140, 'D239801', '127.0.0.1', '2024-05-20', '17:51:23', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1141, 'D239801', '127.0.0.1', '2024-05-20', '17:51:32', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1142, 'D239801', '127.0.0.1', '2024-05-20', '17:51:52', 'info', 'prof: est allé à \"Compte\" ', 1, 10),
(1143, 'CD792463', '127.0.0.1', '2024-05-20', '17:51:57', 'info', 'admin authentifier au compte', 1, 1),
(1144, 'CD792463', '127.0.0.1', '2024-05-20', '17:51:59', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1145, 'CD792463', '127.0.0.1', '2024-05-20', '17:52:19', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1146, 'CD792463', '127.0.0.1', '2024-05-20', '17:52:25', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(1147, 'CD792463', '127.0.0.1', '2024-05-20', '17:52:31', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(1148, 'CD792463', '127.0.0.1', '2024-05-20', '17:53:05', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(1149, 'CD792463', '127.0.0.1', '2024-05-20', '17:53:22', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1150, 'CD792463', '127.0.0.1', '2024-05-20', '17:53:33', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1151, 'CD792463', '127.0.0.1', '2024-05-20', '17:53:50', 'info', 'admin authentifier au compte', 1, 1),
(1152, 'CD792463', '127.0.0.1', '2024-05-20', '17:53:54', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1153, 'CD792463', '127.0.0.1', '2024-05-20', '17:54:22', 'info', 'admin: a publier une annonce ', 1, 1),
(1154, 'S130003719', '127.0.0.1', '2024-05-20', '17:54:29', 'info', 'etudiant authentifier au compte', 1, 15),
(1155, 'S130003719', '127.0.0.1', '2024-05-20', '17:54:33', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1156, 'S130003719', '127.0.0.1', '2024-05-20', '17:54:36', 'info', 'etd: a consulter une notification', 1, 15),
(1157, 'S130003719', '127.0.0.1', '2024-05-20', '17:54:45', 'info', 'etudiant authentifier au compte', 1, 15),
(1158, 'S130003719', '127.0.0.1', '2024-05-20', '17:54:56', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1159, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:04', 'info', 'etudiant authentifier au compte', 1, 15),
(1160, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:06', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1161, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:11', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1162, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:13', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1163, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:22', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1164, 'CD792463', '127.0.0.1', '2024-05-20', '17:55:29', 'info', 'admin authentifier au compte', 1, 1),
(1165, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:37', 'info', 'etudiant authentifier au compte', 1, 15),
(1166, 'S130003719', '127.0.0.1', '2024-05-20', '17:55:43', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1167, 'D239801', '127.0.0.1', '2024-05-20', '17:56:00', 'info', 'prof authentifier au compte', 1, 10),
(1168, 'D239801', '127.0.0.1', '2024-05-20', '17:56:01', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1169, 'D239801', '127.0.0.1', '2024-05-20', '17:56:03', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1170, 'D239801', '127.0.0.1', '2024-05-20', '17:56:04', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1171, 'D239801', '127.0.0.1', '2024-05-20', '17:56:06', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1172, 'D239801', '127.0.0.1', '2024-05-20', '17:56:08', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1173, 'D239801', '127.0.0.1', '2024-05-20', '17:56:09', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1174, 'S130003719', '127.0.0.1', '2024-05-20', '17:58:39', 'info', 'etudiant authentifier au compte', 1, 15),
(1175, 'S130003719', '127.0.0.1', '2024-05-20', '17:58:40', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1176, 'S130003719', '127.0.0.1', '2024-05-20', '17:58:40', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1177, 'D239801', '127.0.0.1', '2024-05-20', '19:24:15', 'info', 'prof authentifier au compte', 1, 10),
(1178, 'D239801', '127.0.0.1', '2024-05-20', '19:24:19', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1179, 'D239801', '127.0.0.1', '2024-05-20', '19:24:25', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1180, 'D239801', '127.0.0.1', '2024-05-20', '19:24:30', 'info', 'prof: a fait l absence ', 1, 10),
(1181, 'D239801', '127.0.0.1', '2024-05-20', '19:24:30', 'info', 'prof: a fait l absence ', 1, 10),
(1182, 'D239801', '127.0.0.1', '2024-05-20', '19:24:30', 'info', 'prof: a fait l absence ', 1, 10),
(1183, 'D239801', '127.0.0.1', '2024-05-20', '19:24:31', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1184, 'D239801', '127.0.0.1', '2024-05-20', '19:24:35', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1185, 'D239801', '127.0.0.1', '2024-05-20', '19:24:37', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1186, 'D239801', '127.0.0.1', '2024-05-20', '19:24:38', 'info', 'prof: a justifier un absence ', 1, 10),
(1187, 'D239801', '127.0.0.1', '2024-05-20', '19:24:40', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1188, 'D239801', '127.0.0.1', '2024-05-20', '19:24:42', 'info', 'prof: a supprimer un absence ', 1, 10),
(1189, 'D239801', '127.0.0.1', '2024-05-20', '19:24:43', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1190, 'D239801', '127.0.0.1', '2024-05-20', '19:24:45', 'info', 'prof: a supprimer un absence ', 1, 10),
(1191, 'D239801', '127.0.0.1', '2024-05-20', '19:24:49', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1192, 'D239801', '127.0.0.1', '2024-05-20', '19:24:50', 'info', 'prof: a justifier un absence ', 1, 10),
(1193, 'D239801', '127.0.0.1', '2024-05-20', '19:30:01', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1194, 'D239801', '127.0.0.1', '2024-05-20', '19:30:04', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1195, 'D239801', '127.0.0.1', '2024-05-20', '19:30:05', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1196, 'D239801', '127.0.0.1', '2024-05-20', '19:30:10', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1197, 'D239801', '127.0.0.1', '2024-05-20', '19:30:12', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1198, 'D239801', '127.0.0.1', '2024-05-20', '19:30:14', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1199, 'D239801', '127.0.0.1', '2024-05-20', '19:30:16', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1200, 'D239801', '127.0.0.1', '2024-05-20', '19:30:17', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1201, 'D239801', '127.0.0.1', '2024-05-20', '19:30:18', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1202, 'D239801', '127.0.0.1', '2024-05-20', '19:30:18', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1203, 'D239801', '127.0.0.1', '2024-05-20', '19:30:19', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1204, 'D239801', '127.0.0.1', '2024-05-20', '19:30:42', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1205, 'D239801', '127.0.0.1', '2024-05-20', '19:31:20', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1206, 'D239801', '127.0.0.1', '2024-05-20', '19:31:24', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1207, 'D239801', '127.0.0.1', '2024-05-20', '19:31:28', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1208, 'D239801', '127.0.0.1', '2024-05-20', '19:31:33', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1209, 'D239801', '127.0.0.1', '2024-05-20', '19:31:36', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1210, 'D239801', '127.0.0.1', '2024-05-20', '19:31:45', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1211, 'D239801', '127.0.0.1', '2024-05-20', '19:32:23', 'error', 'prof: veut afficher les etudiants sans specifier les criteres ', 1, 10),
(1212, 'D239801', '127.0.0.1', '2024-05-20', '19:34:05', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1213, 'D239801', '127.0.0.1', '2024-05-20', '19:34:36', 'error', 'prof: veut afficher les etudiants sans specifier les criteres ', 1, 10),
(1214, 'D239801', '127.0.0.1', '2024-05-20', '19:35:07', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1215, 'D239801', '127.0.0.1', '2024-05-20', '19:35:25', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1216, 'D239801', '127.0.0.1', '2024-05-20', '19:37:29', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1217, 'D239801', '127.0.0.1', '2024-05-20', '19:37:48', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1218, 'D239801', '127.0.0.1', '2024-05-20', '19:40:33', 'info', 'prof authentifier au compte', 1, 10),
(1219, 'D239801', '127.0.0.1', '2024-05-20', '19:41:51', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1220, 'D239801', '127.0.0.1', '2024-05-20', '19:42:17', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1221, 'S130003719', '127.0.0.1', '2024-05-20', '19:42:51', 'info', 'etudiant authentifier au compte', 1, 15),
(1222, 'D239801', '127.0.0.1', '2024-05-23', '17:42:17', 'info', 'prof authentifier au compte', 1, 10),
(1223, 'D239801', '127.0.0.1', '2024-05-23', '17:42:29', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1224, 'D239801', '127.0.0.1', '2024-05-23', '17:42:36', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1225, 'D239801', '127.0.0.1', '2024-05-23', '17:42:40', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1226, 'D239801', '127.0.0.1', '2024-05-23', '17:42:53', 'info', 'prof: a justifier un absence ', 1, 10),
(1227, 'D239801', '127.0.0.1', '2024-05-23', '17:42:57', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1228, 'D239801', '127.0.0.1', '2024-05-23', '17:43:02', 'info', 'prof: a supprimer un absence ', 1, 10),
(1229, 'D239801', '127.0.0.1', '2024-05-23', '17:43:15', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1230, 'S130003719', '127.0.0.1', '2024-05-23', '17:43:27', 'info', 'etudiant authentifier au compte', 1, 15),
(1231, 'S130003719', '127.0.0.1', '2024-05-23', '17:43:32', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1232, 'S130003719', '127.0.0.1', '2024-05-23', '17:43:37', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1233, 'CD792463', '127.0.0.1', '2024-05-23', '17:44:52', 'info', 'admin authentifier au compte', 1, 1),
(1234, 'S130003719', '127.0.0.1', '2024-05-23', '17:45:51', 'info', 'etudiant authentifier au compte', 1, 15),
(1235, 'S130003719', '127.0.0.1', '2024-05-23', '17:45:55', 'info', 'etd: est allé à \"editer compte\" ', 1, 15),
(1236, 'S130003719', '127.0.0.1', '2024-05-23', '17:46:54', 'info', 'etd: a changer mot de passe', 1, 15),
(1237, 'D239801', '127.0.0.1', '2024-05-26', '13:31:27', 'info', 'prof authentifier au compte', 1, 10),
(1238, 'D239801', '127.0.0.1', '2024-05-26', '13:31:44', 'info', 'prof authentifier au compte', 1, 10),
(1239, 'D239801', '127.0.0.1', '2024-05-26', '13:31:52', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1240, 'D239801', '127.0.0.1', '2024-05-26', '13:31:56', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1241, 'D239801', '127.0.0.1', '2024-05-26', '13:32:01', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1242, 'D239801', '127.0.0.1', '2024-05-26', '13:32:08', 'info', 'prof: est allé à \"Compte\" ', 1, 10),
(1243, 'D239801', '127.0.0.1', '2024-05-26', '13:32:11', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1244, 'D239801', '127.0.0.1', '2024-05-26', '13:32:12', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1245, 'D239801', '127.0.0.1', '2024-05-26', '13:32:15', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1246, 'D239801', '127.0.0.1', '2024-05-26', '13:32:17', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1247, 'D239801', '127.0.0.1', '2024-05-26', '13:32:20', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(1248, NULL, '127.0.0.1', '2024-05-26', '13:32:32', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(1249, NULL, '127.0.0.1', '2024-05-26', '13:32:37', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(1250, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:07', 'info', 'etudiant authentifier au compte', 1, 15),
(1251, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:10', 'info', 'etd: est allé à \"editer compte\" ', 1, 15),
(1252, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:21', 'info', 'etd: a changer mot de passe', 1, 15),
(1253, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:28', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1254, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:28', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1255, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:29', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1256, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:37', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1257, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:38', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1258, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:38', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1259, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:39', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1260, 'S130003719', '127.0.0.1', '2024-05-26', '13:33:40', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1261, 'S130003719', '127.0.0.1', '2024-05-26', '13:35:00', 'info', 'etudiant authentifier au compte', 1, 15),
(1262, 'CD792463', '127.0.0.1', '2024-05-26', '13:39:24', 'info', 'admin authentifier au compte', 1, 1),
(1263, 'S130003719', '127.0.0.1', '2024-05-28', '13:06:48', 'info', 'etudiant authentifier au compte', 1, 15),
(1264, 'S130003719', '127.0.0.1', '2024-05-28', '13:08:28', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1265, 'S130003719', '127.0.0.1', '2024-05-28', '13:08:30', 'info', 'etd: a consulter une notification', 1, 15),
(1266, 'S130003719', '127.0.0.1', '2024-05-28', '13:09:08', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1267, 'S130003719', '127.0.0.1', '2024-05-28', '13:09:10', 'info', 'etd: a consulter une notification', 1, 15),
(1268, 'CD792463', '127.0.0.1', '2024-05-28', '13:11:04', 'info', 'admin authentifier au compte', 1, 1),
(1269, 'CD792463', '127.0.0.1', '2024-05-28', '13:11:19', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1270, 'F24351093', '127.0.0.1', '2024-05-28', '13:15:16', 'info', 'etudiant authentifier au compte', 1, 22),
(1271, 'D239801', '127.0.0.1', '2024-05-28', '13:23:50', 'info', 'prof authentifier au compte', 1, 10),
(1272, 'D239801', '127.0.0.1', '2024-05-28', '13:24:42', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1273, 'D239801', '127.0.0.1', '2024-05-28', '13:27:11', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1274, 'D239801', '127.0.0.1', '2024-05-28', '13:44:00', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1275, 'D239801', '127.0.0.1', '2024-05-28', '13:44:30', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1276, 'D239801', '127.0.0.1', '2024-05-28', '13:44:34', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1277, 'D239801', '127.0.0.1', '2024-05-28', '13:44:39', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1278, 'D239801', '127.0.0.1', '2024-05-28', '13:44:49', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1279, 'D239801', '127.0.0.1', '2024-05-28', '13:46:29', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1280, 'S130003719', '127.0.0.1', '2024-05-28', '13:50:22', 'info', 'etudiant authentifier au compte', 1, 15),
(1281, 'S130003719', '127.0.0.1', '2024-05-28', '13:50:23', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1282, 'CD792463', '127.0.0.1', '2024-05-28', '13:51:27', 'info', 'admin authentifier au compte', 1, 1),
(1283, 'CD792463', '127.0.0.1', '2024-05-28', '13:51:31', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1284, 'CD792463', '127.0.0.1', '2024-05-28', '13:51:52', 'info', 'admin: a publier des notes ', 1, 1),
(1285, 'S130003719', '127.0.0.1', '2024-05-28', '13:52:01', 'info', 'etudiant authentifier au compte', 1, 15),
(1286, 'S130003719', '127.0.0.1', '2024-05-28', '13:52:03', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1287, 'CD792463', '127.0.0.1', '2024-05-28', '13:52:32', 'info', 'admin authentifier au compte', 1, 1),
(1288, 'CD792463', '127.0.0.1', '2024-05-28', '13:52:34', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1289, 'CD792463', '127.0.0.1', '2024-05-28', '13:52:52', 'info', 'admin: a publier des notes ', 1, 1),
(1290, 'S130003719', '127.0.0.1', '2024-05-28', '13:53:02', 'info', 'etudiant authentifier au compte', 1, 15),
(1291, 'S130003719', '127.0.0.1', '2024-05-28', '13:53:05', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1292, 'CD792463', '127.0.0.1', '2024-05-28', '13:53:36', 'info', 'admin authentifier au compte', 1, 1),
(1293, 'CD792463', '127.0.0.1', '2024-05-28', '13:53:38', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1294, 'CD792463', '127.0.0.1', '2024-05-28', '13:53:52', 'info', 'admin: a publier des notes ', 1, 1),
(1295, 'S130003719', '127.0.0.1', '2024-05-28', '13:54:11', 'info', 'etudiant authentifier au compte', 1, 15),
(1296, 'S130003719', '127.0.0.1', '2024-05-28', '13:54:13', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1297, 'CD792463', '127.0.0.1', '2024-05-28', '14:44:31', 'info', 'admin authentifier au compte', 1, 1),
(1298, 'S130003719', '127.0.0.1', '2024-05-28', '14:44:40', 'info', 'etudiant authentifier au compte', 1, 15),
(1299, 'S130003719', '127.0.0.1', '2024-05-28', '14:48:00', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1300, 'S130003719', '127.0.0.1', '2024-05-28', '14:48:02', 'info', 'etd: a consulter une notification', 1, 15),
(1301, 'S130003719', '127.0.0.1', '2024-05-28', '14:48:17', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1302, 'S130003719', '127.0.0.1', '2024-05-28', '14:48:22', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1303, 'S130003719', '127.0.0.1', '2024-05-28', '14:48:26', 'info', 'etd: a consulter une notification', 1, 15),
(1304, 'S130003719', '127.0.0.1', '2024-05-28', '14:48:29', 'info', 'etd: a consulter une notification', 1, 15),
(1305, 'S130003719', '127.0.0.1', '2024-05-29', '10:35:02', 'info', 'etudiant authentifier au compte', 1, 15),
(1306, 'S130003719', '127.0.0.1', '2024-05-29', '10:35:03', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1307, 'S130003719', '127.0.0.1', '2024-05-29', '10:35:09', 'info', 'etd: a consulter une Actualite', 1, 15),
(1308, 'S130003719', '127.0.0.1', '2024-05-29', '10:35:36', 'info', 'etd: a consulter une Actualite', 1, 15),
(1309, 'S130003719', '127.0.0.1', '2024-05-29', '12:59:26', 'info', 'etudiant authentifier au compte', 1, 15),
(1310, 'S130003719', '127.0.0.1', '2024-05-29', '12:59:38', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1311, 'S130003719', '127.0.0.1', '2024-05-29', '12:59:40', 'info', 'etd: a consulter une notification', 1, 15),
(1312, 'S130003719', '127.0.0.1', '2024-05-29', '13:03:03', 'info', 'etudiant authentifier au compte', 1, 15),
(1313, 'S130003719', '127.0.0.1', '2024-05-29', '13:03:07', 'info', 'etd: a consulter une Actualite', 1, 15),
(1314, 'CD792463', '127.0.0.1', '2024-05-29', '15:11:28', 'info', 'admin authentifier au compte', 1, 1),
(1315, 'S130003719', '127.0.0.1', '2024-05-29', '16:07:39', 'info', 'etudiant authentifier au compte', 1, 15),
(1316, 'S130003719', '127.0.0.1', '2024-05-29', '17:33:03', 'info', 'etudiant authentifier au compte', 1, 15),
(1317, 'S130003719', '127.0.0.1', '2024-05-29', '17:33:05', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1318, 'S130003719', '127.0.0.1', '2024-05-29', '17:33:06', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(1319, 'D239801', '127.0.0.1', '2024-05-29', '17:49:25', 'info', 'prof authentifier au compte', 1, 10),
(1320, 'D239801', '127.0.0.1', '2024-05-29', '17:49:27', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1321, 'D239801', '127.0.0.1', '2024-05-29', '17:49:30', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(1322, 'D239801', '127.0.0.1', '2024-05-29', '17:49:36', 'info', 'prof: a desarchiver un cour ', 1, 10),
(1323, 'S130003719', '127.0.0.1', '2024-05-29', '17:49:42', 'info', 'etudiant authentifier au compte', 1, 15),
(1324, 'S130003719', '127.0.0.1', '2024-05-29', '17:49:44', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1325, 'S130003719', '127.0.0.1', '2024-05-29', '17:49:46', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(1326, 'CD792463', '127.0.0.1', '2024-05-29', '18:20:33', 'info', 'admin authentifier au compte', 1, 1),
(1327, 'CD792463', '127.0.0.1', '2024-05-29', '18:20:40', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1328, 'CD792463', '127.0.0.1', '2024-05-30', '10:45:08', 'info', 'admin authentifier au compte', 1, 1),
(1329, 'CD792463', '127.0.0.1', '2024-05-30', '10:52:51', 'info', 'admin authentifier au compte', 1, 1),
(1330, 'CD792463', '127.0.0.1', '2024-05-30', '10:58:30', 'info', 'admin authentifier au compte', 1, 1),
(1331, 'S130003719', '127.0.0.1', '2024-05-30', '11:00:09', 'info', 'etudiant authentifier au compte', 1, 15),
(1332, 'S130003719', '127.0.0.1', '2024-05-30', '11:00:13', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1333, 'CD792463', '127.0.0.1', '2024-05-30', '11:14:44', 'info', 'admin authentifier au compte', 1, 1),
(1334, 'CD792463', '127.0.0.1', '2024-05-30', '11:30:09', 'info', 'admin authentifier au compte', 1, 1),
(1335, 'CD792463', '127.0.0.1', '2024-05-30', '12:01:41', 'info', 'admin authentifier au compte', 1, 1),
(1336, 'CD792463', '127.0.0.1', '2024-05-30', '12:01:42', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1337, 'CD792463', '127.0.0.1', '2024-05-30', '12:01:46', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1338, 'CD792463', '127.0.0.1', '2024-05-30', '12:01:47', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1339, 'CD792463', '127.0.0.1', '2024-05-30', '12:01:49', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1340, 'CD792463', '127.0.0.1', '2024-05-30', '12:01:49', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1341, 'CD792463', '127.0.0.1', '2024-05-30', '12:02:04', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(1342, 'S130003719', '127.0.0.1', '2024-05-30', '12:05:22', 'info', 'etudiant authentifier au compte', 1, 15),
(1343, 'S130003719', '127.0.0.1', '2024-05-30', '12:07:05', 'info', 'etudiant authentifier au compte', 1, 15),
(1344, 'S130003719', '127.0.0.1', '2024-05-30', '12:07:10', 'info', 'etudiant authentifier au compte', 1, 15),
(1345, 'CD792463', '127.0.0.1', '2024-05-30', '12:07:16', 'info', 'admin authentifier au compte', 1, 1),
(1346, 'S130003719', '127.0.0.1', '2024-05-30', '12:07:22', 'info', 'etudiant authentifier au compte', 1, 15),
(1347, 'S130003719', '127.0.0.1', '2024-05-30', '12:07:58', 'info', 'etudiant authentifier au compte', 1, 15),
(1348, 'S130003719', '127.0.0.1', '2024-05-30', '12:08:07', 'info', 'etudiant authentifier au compte', 1, 15),
(1349, 'CD792463', '127.0.0.1', '2024-05-30', '12:10:17', 'info', 'admin authentifier au compte', 1, 1),
(1350, 'D239801', '127.0.0.1', '2024-05-30', '12:10:23', 'info', 'prof authentifier au compte', 1, 10),
(1351, 'S130003719', '127.0.0.1', '2024-05-30', '12:10:29', 'info', 'etudiant authentifier au compte', 1, 15),
(1352, 'S130003719', '127.0.0.1', '2024-05-30', '12:11:26', 'info', 'etudiant authentifier au compte', 1, 15),
(1353, 'S130003719', '127.0.0.1', '2024-05-30', '12:11:55', 'info', 'etudiant authentifier au compte', 1, 15),
(1354, 'S130003719', '127.0.0.1', '2024-05-30', '12:12:06', 'info', 'etudiant authentifier au compte', 1, 15),
(1355, 'S130003719', '127.0.0.1', '2024-05-30', '12:12:31', 'info', 'etudiant authentifier au compte', 1, 15),
(1356, 'S130003719', '127.0.0.1', '2024-05-30', '12:12:52', 'info', 'etudiant authentifier au compte', 1, 15),
(1357, 'S130003719', '127.0.0.1', '2024-05-30', '12:13:24', 'info', 'etudiant authentifier au compte', 1, 15),
(1358, 'S130003719', '127.0.0.1', '2024-05-30', '12:13:37', 'info', 'etudiant authentifier au compte', 1, 15),
(1359, 'S130003719', '127.0.0.1', '2024-05-30', '12:13:42', 'info', 'etudiant authentifier au compte', 1, 15),
(1360, 'S130003719', '127.0.0.1', '2024-05-30', '12:14:06', 'info', 'etudiant authentifier au compte', 1, 15),
(1361, 'S130003719', '127.0.0.1', '2024-05-30', '12:14:22', 'info', 'etudiant authentifier au compte', 1, 15),
(1362, 'S130003719', '127.0.0.1', '2024-05-30', '12:16:00', 'info', 'etudiant authentifier au compte', 1, 15),
(1363, 'S130003719', '127.0.0.1', '2024-05-30', '12:16:38', 'info', 'etudiant authentifier au compte', 1, 15),
(1364, 'S130003719', '127.0.0.1', '2024-05-30', '12:19:20', 'info', 'etudiant authentifier au compte', 1, 15),
(1365, 'S130003719', '127.0.0.1', '2024-05-30', '12:19:30', 'info', 'etudiant authentifier au compte', 1, 15),
(1366, 'S130003719', '127.0.0.1', '2024-05-30', '12:19:41', 'info', 'etudiant authentifier au compte', 1, 15),
(1367, 'S130003719', '127.0.0.1', '2024-05-30', '12:19:49', 'info', 'etudiant authentifier au compte', 1, 15),
(1368, 'S130003719', '127.0.0.1', '2024-05-30', '12:20:21', 'info', 'etudiant authentifier au compte', 1, 15),
(1369, 'S130003719', '127.0.0.1', '2024-05-30', '12:20:32', 'info', 'etudiant authentifier au compte', 1, 15),
(1370, 'S130003719', '127.0.0.1', '2024-05-30', '12:24:22', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1371, 'D239801', '127.0.0.1', '2024-05-30', '12:25:44', 'info', 'prof authentifier au compte', 1, 10),
(1372, 'D239801', '127.0.0.1', '2024-05-30', '12:26:03', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1373, 'D239801', '127.0.0.1', '2024-05-30', '12:26:04', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1374, 'D239801', '127.0.0.1', '2024-05-30', '12:26:19', 'info', 'prof: a publier un Rapport ', 1, 10),
(1375, 'S130003719', '127.0.0.1', '2024-05-30', '12:26:30', 'info', 'etudiant authentifier au compte', 1, 15),
(1376, 'S130003719', '127.0.0.1', '2024-05-30', '12:27:02', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1377, 'S130003719', '127.0.0.1', '2024-05-30', '12:29:10', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1378, 'S130003719', '127.0.0.1', '2024-05-30', '12:39:19', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1379, 'D239801', '127.0.0.1', '2024-05-30', '12:39:42', 'info', 'prof authentifier au compte', 1, 10),
(1380, 'D239801', '127.0.0.1', '2024-05-30', '12:39:44', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1381, 'D239801', '127.0.0.1', '2024-05-30', '12:40:12', 'info', 'prof: a publier un Rapport ', 1, 10),
(1382, 'D239801', '127.0.0.1', '2024-05-30', '12:43:28', 'info', 'prof: a publier un Rapport ', 1, 10),
(1383, 'D239801', '127.0.0.1', '2024-05-30', '12:44:16', 'info', 'prof: a publier un Rapport ', 1, 10),
(1384, 'D239801', '127.0.0.1', '2024-05-30', '12:46:13', 'info', 'prof: a publier un Rapport ', 1, 10),
(1385, 'S130003719', '127.0.0.1', '2024-05-30', '12:46:49', 'info', 'etudiant authentifier au compte', 1, 15),
(1386, 'D239801', '127.0.0.1', '2024-05-30', '12:58:05', 'info', 'prof authentifier au compte', 1, 10),
(1387, 'D239801', '127.0.0.1', '2024-05-30', '12:58:07', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1388, 'D239801', '127.0.0.1', '2024-05-30', '12:58:29', 'info', 'prof: a publier un Rapport ', 1, 10),
(1389, NULL, '127.0.0.1', '2024-05-30', '12:59:15', 'error', 'Etudiant authentifier a un compte desactiver', 1, NULL),
(1390, 'R230700709', '127.0.0.1', '2024-05-30', '12:59:47', 'info', 'etudiant authentifier au compte', 1, 19),
(1391, 'R230700709', '127.0.0.1', '2024-05-30', '12:59:53', 'info', 'etd: a consulter une Actualite', 1, 19),
(1392, 'R230700709', '127.0.0.1', '2024-05-30', '13:00:09', 'info', 'etd: est allé a \"notification\"', 1, 19),
(1393, 'R230700709', '127.0.0.1', '2024-05-30', '13:00:11', 'info', 'etd: a consulter une notification', 1, 19),
(1394, NULL, '127.0.0.1', '2024-05-30', '22:17:57', 'info', 'prof: est allé à \"Rapport\" ', 1, NULL),
(1395, 'S130003719', '127.0.0.1', '2024-05-30', '22:18:45', 'info', 'etudiant authentifier au compte', 1, 15);
INSERT INTO `Journalisation` (`IdJournalisation`, `CNE`, `AdressIP`, `Date`, `Heure`, `Criticite`, `action`, `IdAdmin`, `IdCompte`) VALUES
(1396, 'S130003719', '127.0.0.1', '2024-05-30', '22:20:08', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1397, 'S130003719', '127.0.0.1', '2024-05-30', '22:20:09', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1398, 'S130003719', '127.0.0.1', '2024-05-30', '22:20:10', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1399, 'D239801', '127.0.0.1', '2024-05-30', '22:20:43', 'info', 'prof authentifier au compte', 1, 10),
(1400, 'D239801', '127.0.0.1', '2024-05-30', '22:20:47', 'info', 'prof: est allé à \"Compte\" ', 1, 10),
(1401, 'D239801', '127.0.0.1', '2024-05-30', '22:20:50', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1402, 'D239801', '127.0.0.1', '2024-05-30', '22:20:50', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1403, 'D239801', '127.0.0.1', '2024-05-30', '22:20:51', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1404, 'D239801', '127.0.0.1', '2024-05-30', '22:20:52', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1405, 'D239801', '127.0.0.1', '2024-05-30', '22:20:53', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1406, 'S130003719', '127.0.0.1', '2024-05-31', '11:58:09', 'info', 'etudiant authentifier au compte', 1, 15),
(1407, 'S130003719', '127.0.0.1', '2024-05-31', '11:58:13', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1408, 'S130003719', '127.0.0.1', '2024-05-31', '11:58:14', 'info', 'etd: a consulter une notification', 1, 15),
(1409, 'S130003719', '127.0.0.1', '2024-05-31', '11:58:43', 'info', 'etd: a consulter une notification', 1, 15),
(1410, 'S130003719', '127.0.0.1', '2024-05-31', '11:58:46', 'info', 'etd: a consulter une notification', 1, 15),
(1411, 'CD792463', '127.0.0.1', '2024-05-31', '12:05:58', 'info', 'admin authentifier au compte', 1, 1),
(1412, 'CD792463', '127.0.0.1', '2024-05-31', '12:06:26', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(1413, 'CD792463', '127.0.0.1', '2024-05-31', '12:06:33', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(1414, 'CD792463', '127.0.0.1', '2024-05-31', '12:06:39', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1415, 'CD792463', '127.0.0.1', '2024-05-31', '12:06:54', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(1416, 'CD792463', '127.0.0.1', '2024-05-31', '12:06:57', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(1417, 'CD792463', '127.0.0.1', '2024-05-31', '12:07:00', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1418, 'CD792463', '127.0.0.1', '2024-05-31', '12:29:47', 'info', 'admin authentifier au compte', 1, 1),
(1419, 'S130003719', '127.0.0.1', '2024-05-31', '12:29:53', 'info', 'etudiant authentifier au compte', 1, 15),
(1420, 'D239801', '127.0.0.1', '2024-05-31', '12:30:00', 'info', 'prof authentifier au compte', 1, 10),
(1421, 'D239801', '127.0.0.1', '2024-05-31', '12:30:05', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1422, 'D239801', '127.0.0.1', '2024-05-31', '12:30:10', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1423, 'D239801', '127.0.0.1', '2024-05-31', '12:30:15', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1424, 'D239801', '127.0.0.1', '2024-05-31', '12:30:18', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1425, 'D239801', '127.0.0.1', '2024-05-31', '12:30:20', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1426, 'D239801', '127.0.0.1', '2024-05-31', '12:30:21', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1427, 'D239801', '127.0.0.1', '2024-05-31', '12:30:22', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1428, 'D239801', '127.0.0.1', '2024-05-31', '12:30:23', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1429, 'D239801', '127.0.0.1', '2024-05-31', '12:30:25', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1430, 'D239801', '127.0.0.1', '2024-05-31', '12:30:26', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1431, 'D239801', '127.0.0.1', '2024-05-31', '12:30:28', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1432, 'D239801', '127.0.0.1', '2024-05-31', '12:30:29', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1433, 'D239801', '127.0.0.1', '2024-05-31', '12:30:30', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1434, 'D239801', '127.0.0.1', '2024-05-31', '12:30:30', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1435, 'D239801', '127.0.0.1', '2024-05-31', '12:30:31', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1436, 'D239801', '127.0.0.1', '2024-05-31', '12:30:31', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1437, 'D239801', '127.0.0.1', '2024-05-31', '12:30:34', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1438, 'S130003719', '127.0.0.1', '2024-05-31', '12:33:05', 'info', 'etudiant authentifier au compte', 1, 15),
(1439, 'S130003719', '127.0.0.1', '2024-05-31', '12:33:31', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1440, 'S130003719', '127.0.0.1', '2024-05-31', '12:33:36', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1441, 'CD792463', '127.0.0.1', '2024-05-31', '12:33:42', 'info', 'admin authentifier au compte', 1, 1),
(1442, 'CD792463', '127.0.0.1', '2024-05-31', '12:33:48', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1443, 'CD792463', '127.0.0.1', '2024-05-31', '12:35:22', 'info', 'admin: a publier une annonce ', 1, 1),
(1444, 'CD792463', '127.0.0.1', '2024-05-31', '12:35:29', 'info', 'admin authentifier au compte', 1, 1),
(1445, 'CD792463', '127.0.0.1', '2024-05-31', '12:35:33', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1446, 'CD792463', '127.0.0.1', '2024-05-31', '12:36:13', 'info', 'admin: a publier une annonce ', 1, 1),
(1447, 'CD792463', '127.0.0.1', '2024-05-31', '12:36:37', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1448, 'CD792463', '127.0.0.1', '2024-05-31', '12:37:26', 'info', 'admin: a publier une annonce ', 1, 1),
(1449, 'CD792463', '127.0.0.1', '2024-05-31', '12:38:32', 'info', 'admin authentifier au compte', 1, 1),
(1450, 'S130003719', '127.0.0.1', '2024-05-31', '12:38:38', 'info', 'etudiant authentifier au compte', 1, 15),
(1451, 'CD792463', '127.0.0.1', '2024-05-31', '12:50:57', 'info', 'admin authentifier au compte', 1, 1),
(1452, 'CD792463', '127.0.0.1', '2024-05-31', '12:51:12', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1453, 'CD792463', '127.0.0.1', '2024-05-31', '12:55:42', 'info', 'admin: a publier une annonce ', 1, 1),
(1454, 'CD792463', '127.0.0.1', '2024-05-31', '12:55:52', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1455, 'CD792463', '127.0.0.1', '2024-05-31', '13:04:59', 'info', 'admin: a publié des notes ', 1, 1),
(1456, 'S130003719', '127.0.0.1', '2024-05-31', '13:05:05', 'info', 'etudiant authentifier au compte', 1, 15),
(1457, 'S130003719', '127.0.0.1', '2024-05-31', '13:05:07', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1458, 'CD792463', '127.0.0.1', '2024-05-31', '13:06:46', 'info', 'admin authentifier au compte', 1, 1),
(1459, 'CD792463', '127.0.0.1', '2024-05-31', '13:06:48', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1460, 'CD792463', '127.0.0.1', '2024-05-31', '13:06:48', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1461, 'CD792463', '127.0.0.1', '2024-05-31', '13:07:14', 'info', 'admin: a publié des notes ', 1, 1),
(1462, 'S130003719', '127.0.0.1', '2024-05-31', '13:07:30', 'info', 'etudiant authentifier au compte', 1, 15),
(1463, 'S130003719', '127.0.0.1', '2024-05-31', '13:07:32', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1464, 'S130003719', '127.0.0.1', '2024-05-31', '13:07:33', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1465, NULL, '127.0.0.1', '2024-05-31', '13:08:27', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(1466, 'CD792463', '127.0.0.1', '2024-05-31', '13:08:33', 'info', 'admin authentifier au compte', 1, 1),
(1467, 'CD792463', '127.0.0.1', '2024-05-31', '13:08:34', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1468, 'CD792463', '127.0.0.1', '2024-05-31', '13:08:37', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1469, 'CD792463', '127.0.0.1', '2024-05-31', '13:08:52', 'info', 'admin: a publié des notes ', 1, 1),
(1470, 'S130003719', '127.0.0.1', '2024-05-31', '13:09:00', 'info', 'etudiant authentifier au compte', 1, 15),
(1471, 'S130003719', '127.0.0.1', '2024-05-31', '13:09:02', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1472, 'CD792463', '127.0.0.1', '2024-05-31', '13:09:16', 'info', 'admin authentifier au compte', 1, 1),
(1473, 'CD792463', '127.0.0.1', '2024-05-31', '13:09:17', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1474, 'CD792463', '127.0.0.1', '2024-05-31', '13:09:19', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1475, 'D239801', '127.0.0.1', '2024-05-31', '13:16:30', 'info', 'prof authentifier au compte', 1, 10),
(1476, 'D239801', '127.0.0.1', '2024-05-31', '13:22:48', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1477, 'D239801', '127.0.0.1', '2024-05-31', '13:23:11', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1478, 'D239801', '127.0.0.1', '2024-05-31', '13:23:15', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1479, 'D239801', '127.0.0.1', '2024-05-31', '13:23:19', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1480, 'D239801', '127.0.0.1', '2024-05-31', '13:23:23', 'info', 'prof: a fait l absence ', 1, 10),
(1481, 'D239801', '127.0.0.1', '2024-05-31', '13:23:23', 'info', 'prof: a fait l absence ', 1, 10),
(1482, 'D239801', '127.0.0.1', '2024-05-31', '13:23:25', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1483, 'D239801', '127.0.0.1', '2024-05-31', '13:23:29', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1484, 'D239801', '127.0.0.1', '2024-05-31', '13:23:30', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1485, 'D239801', '127.0.0.1', '2024-05-31', '13:23:32', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1486, 'D239801', '127.0.0.1', '2024-05-31', '13:23:37', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1487, 'D239801', '127.0.0.1', '2024-05-31', '13:23:40', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(1488, 'D239801', '127.0.0.1', '2024-05-31', '13:23:44', 'info', 'prof: a archiver un cour ', 1, 10),
(1489, 'D239801', '127.0.0.1', '2024-05-31', '13:23:49', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1490, 'D239801', '127.0.0.1', '2024-05-31', '13:23:56', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1491, 'D239801', '127.0.0.1', '2024-05-31', '13:23:57', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1492, 'D239801', '127.0.0.1', '2024-05-31', '13:23:58', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1493, 'D239801', '127.0.0.1', '2024-05-31', '13:23:59', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1494, 'D239801', '127.0.0.1', '2024-05-31', '13:24:01', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1495, 'D239801', '127.0.0.1', '2024-05-31', '13:24:03', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1496, 'D239801', '127.0.0.1', '2024-05-31', '13:24:03', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1497, 'D239801', '127.0.0.1', '2024-05-31', '13:24:04', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1498, 'D239801', '127.0.0.1', '2024-05-31', '13:24:04', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1499, 'D239801', '127.0.0.1', '2024-05-31', '13:24:05', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1500, 'D239801', '127.0.0.1', '2024-05-31', '13:24:10', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1501, 'D239801', '127.0.0.1', '2024-05-31', '13:24:15', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(1502, 'D239801', '127.0.0.1', '2024-05-31', '13:24:16', 'info', 'prof: a desarchiver un cour ', 1, 10),
(1503, 'D239801', '127.0.0.1', '2024-05-31', '13:24:17', 'info', 'prof: a desarchiver un cour ', 1, 10),
(1504, 'D239801', '127.0.0.1', '2024-05-31', '13:24:18', 'info', 'prof: a desarchiver un cour ', 1, 10),
(1505, 'D239801', '127.0.0.1', '2024-05-31', '13:24:18', 'info', 'prof: a desarchiver un cour ', 1, 10),
(1506, 'D239801', '127.0.0.1', '2024-05-31', '13:24:19', 'info', 'prof: a desarchiver un cour ', 1, 10),
(1507, 'S130003719', '127.0.0.1', '2024-05-31', '13:24:28', 'info', 'etudiant authentifier au compte', 1, 15),
(1508, 'S130003719', '127.0.0.1', '2024-05-31', '13:24:31', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1509, 'S130003719', '127.0.0.1', '2024-05-31', '13:24:32', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(1510, 'S130003719', '127.0.0.1', '2024-05-31', '13:24:33', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(1511, 'S130003719', '127.0.0.1', '2024-05-31', '13:24:59', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1512, 'S130003719', '127.0.0.1', '2024-05-31', '13:25:01', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(1513, 'D239801', '127.0.0.1', '2024-05-31', '13:25:08', 'info', 'prof authentifier au compte', 1, 10),
(1514, 'D239801', '127.0.0.1', '2024-05-31', '13:25:47', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1515, 'D239801', '127.0.0.1', '2024-05-31', '13:26:19', 'info', 'prof: a publier un cour ', 1, 10),
(1516, 'D239801', '127.0.0.1', '2024-05-31', '13:26:45', 'info', 'prof: a publier un cour ', 1, 10),
(1517, 'D239801', '127.0.0.1', '2024-05-31', '13:27:09', 'info', 'prof: a publier un cour ', 1, 10),
(1518, 'D239801', '127.0.0.1', '2024-05-31', '13:27:10', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1519, 'D239801', '127.0.0.1', '2024-05-31', '13:27:13', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(1520, 'D239801', '127.0.0.1', '2024-05-31', '13:27:20', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1521, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:27', 'info', 'etudiant authentifier au compte', 1, 22),
(1522, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:30', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(1523, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:32', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(1524, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:33', 'info', 'etd: est allé à \"Note\" ', 1, 22),
(1525, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:34', 'info', 'etd: est allé à \"Cours\" ', 1, 22),
(1526, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:43', 'info', 'etd: est allé consulter les cours de module ', 1, 22),
(1527, 'F24351093', '127.0.0.1', '2024-05-31', '13:27:47', 'info', 'etd: est allé à \"Rapport\" ', 1, 22),
(1528, 'S130003719', '127.0.0.1', '2024-05-31', '13:28:03', 'info', 'etudiant authentifier au compte', 1, 15),
(1529, 'S130003719', '127.0.0.1', '2024-05-31', '13:28:22', 'info', 'etd: est allé à \"Compte\" ', 1, 15),
(1530, 'S130003719', '127.0.0.1', '2024-05-31', '13:28:26', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1531, 'S130003719', '127.0.0.1', '2024-05-31', '13:28:27', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1532, 'S130003719', '127.0.0.1', '2024-05-31', '13:28:28', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1533, 'S130003719', '127.0.0.1', '2024-05-31', '13:28:29', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1534, 'S130003719', '127.0.0.1', '2024-05-31', '13:29:49', 'info', 'etd: est allé à \"Cours\" ', 1, 15),
(1535, 'S130003719', '127.0.0.1', '2024-05-31', '13:29:52', 'info', 'etd: est allé consulter les cours de module ', 1, 15),
(1536, 'S130003719', '127.0.0.1', '2024-05-31', '13:30:15', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1537, 'S130003719', '127.0.0.1', '2024-05-31', '13:30:37', 'info', 'etd: a submiter un rapport ', 1, 15),
(1538, 'S130003719', '127.0.0.1', '2024-05-31', '13:30:44', 'error', 'etd: tenter de submiter un rapport deux fois ', 1, 15),
(1539, 'D239801', '127.0.0.1', '2024-05-31', '13:30:54', 'info', 'prof authentifier au compte', 1, 10),
(1540, 'D239801', '127.0.0.1', '2024-05-31', '13:30:58', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1541, 'D239801', '127.0.0.1', '2024-05-31', '13:31:01', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1542, 'D239801', '127.0.0.1', '2024-05-31', '13:31:07', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1543, 'D239801', '127.0.0.1', '2024-05-31', '13:31:11', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1544, 'D239801', '127.0.0.1', '2024-05-31', '13:34:59', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1545, 'D239801', '127.0.0.1', '2024-05-31', '13:35:02', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1546, 'CD792463', '127.0.0.1', '2024-05-31', '15:36:51', 'info', 'admin authentifier au compte', 1, 1),
(1547, 'CD792463', '127.0.0.1', '2024-05-31', '15:36:56', 'info', 'admin: est allé à \"Compte\" ', 1, 1),
(1548, 'D239801', '127.0.0.1', '2024-05-31', '15:37:20', 'info', 'prof authentifier au compte', 1, 10),
(1549, 'D239801', '127.0.0.1', '2024-05-31', '15:38:22', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1550, 'D239801', '127.0.0.1', '2024-05-31', '15:38:27', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1551, 'D239801', '127.0.0.1', '2024-05-31', '15:38:30', 'info', 'prof: a fait l absence ', 1, 10),
(1552, 'D239801', '127.0.0.1', '2024-05-31', '15:38:30', 'info', 'prof: a fait l absence ', 1, 10),
(1553, 'D239801', '127.0.0.1', '2024-05-31', '15:38:32', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1554, 'D239801', '127.0.0.1', '2024-05-31', '15:38:35', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1555, 'S130003719', '127.0.0.1', '2024-05-31', '15:39:45', 'info', 'etudiant authentifier au compte', 1, 15),
(1556, 'S130003719', '127.0.0.1', '2024-05-31', '15:39:48', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1557, 'CD792463', '127.0.0.1', '2024-05-31', '15:39:55', 'info', 'admin authentifier au compte', 1, 1),
(1558, 'CD792463', '127.0.0.1', '2024-05-31', '15:39:57', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1559, 'S130003719', '127.0.0.1', '2024-05-31', '15:40:25', 'info', 'etudiant authentifier au compte', 1, 15),
(1560, 'S130003719', '127.0.0.1', '2024-05-31', '15:40:28', 'info', 'etd: est allé à \"Note\" ', 1, 15),
(1561, 'D239801', '127.0.0.1', '2024-05-31', '16:34:02', 'info', 'prof authentifier au compte', 1, 10),
(1562, 'D239801', '127.0.0.1', '2024-05-31', '16:34:04', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1563, 'D239801', '127.0.0.1', '2024-05-31', '16:53:25', 'info', 'prof authentifier au compte', 1, 10),
(1564, 'S130003719', '127.0.0.1', '2024-05-31', '16:53:34', 'info', 'etudiant authentifier au compte', 1, 15),
(1565, 'S130003719', '127.0.0.1', '2024-05-31', '16:53:36', 'info', 'etd: a consulter une Actualite', 1, 15),
(1566, 'S130003719', '127.0.0.1', '2024-05-31', '16:53:46', 'info', 'etd: a consulter une Actualite', 1, 15),
(1567, 'S130003719', '127.0.0.1', '2024-05-31', '16:53:50', 'info', 'etd: a consulter une Actualite', 1, 15),
(1568, 'S130003719', '127.0.0.1', '2024-05-31', '16:53:54', 'info', 'etd: a consulter une Actualite', 1, 15),
(1569, 'S130003719', '127.0.0.1', '2024-05-31', '16:53:57', 'info', 'etd: a consulter une Actualite', 1, 15),
(1570, 'S130003719', '127.0.0.1', '2024-05-31', '16:54:05', 'info', 'etd: a consulter une Actualite', 1, 15),
(1571, 'S130003719', '127.0.0.1', '2024-05-31', '16:54:12', 'info', 'etd: a consulter une Actualite', 1, 15),
(1572, 'S130003719', '127.0.0.1', '2024-05-31', '16:54:25', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1573, 'S130003719', '127.0.0.1', '2024-05-31', '16:54:27', 'info', 'etd: est allé a \"notification\"', 1, 15),
(1574, 'S130003719', '127.0.0.1', '2024-05-31', '16:54:28', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1575, 'S130003719', '127.0.0.1', '2024-05-31', '17:05:38', 'info', 'etudiant authentifier au compte', 1, 15),
(1576, 'S130003719', '127.0.0.1', '2024-05-31', '17:05:40', 'info', 'etd: a consulter une Actualite', 1, 15),
(1577, 'CD792463', '127.0.0.1', '2024-06-01', '00:05:45', 'info', 'admin authentifier au compte', 1, 1),
(1578, 'D239801', '127.0.0.1', '2024-06-01', '00:05:50', 'info', 'prof authentifier au compte', 1, 10),
(1579, 'CD792463', '127.0.0.1', '2024-06-01', '00:05:55', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1580, 'D239801', '127.0.0.1', '2024-06-01', '00:05:58', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1581, 'D239801', '127.0.0.1', '2024-06-01', '00:05:59', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1582, 'CD792463', '127.0.0.1', '2024-06-01', '00:06:40', 'info', 'admin authentifier au compte', 1, 1),
(1583, 'CD792463', '127.0.0.1', '2024-06-01', '00:06:49', 'info', 'admin authentifier au compte', 1, 1),
(1584, 'CD792463', '127.0.0.1', '2024-06-01', '00:07:28', 'info', 'admin authentifier au compte', 1, 1),
(1585, 'S130003719', '127.0.0.1', '2024-06-01', '00:07:34', 'info', 'etudiant authentifier au compte', 1, 15),
(1586, NULL, '127.0.0.1', '2024-06-01', '00:07:39', 'info', 'etd: est allé à \"Cours\" ', 1, NULL),
(1587, 'CD792463', '127.0.0.1', '2024-06-01', '00:10:51', 'info', 'admin authentifier au compte', 1, 1),
(1588, 'D239801', '127.0.0.1', '2024-06-01', '00:10:59', 'info', 'prof authentifier au compte', 1, 10),
(1589, 'D239801', '127.0.0.1', '2024-06-01', '00:11:01', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1590, 'D239801', '127.0.0.1', '2024-06-01', '00:11:01', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1591, 'CD792463', '127.0.0.1', '2024-06-01', '00:11:03', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1592, 'CD792463', '127.0.0.1', '2024-06-01', '00:11:04', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1593, 'CD792463', '127.0.0.1', '2024-06-01', '00:11:05', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1594, 'CD792463', '127.0.0.1', '2024-06-01', '00:11:06', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1595, 'CD792463', '127.0.0.1', '2024-06-01', '00:11:07', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1596, 'CD792463', '127.0.0.1', '2024-06-01', '00:12:37', 'info', 'admin authentifier au compte', 1, 1),
(1597, 'D239801', '127.0.0.1', '2024-06-01', '00:12:43', 'info', 'prof authentifier au compte', 1, 10),
(1598, 'CD792463', '127.0.0.1', '2024-06-01', '00:12:46', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1599, 'CD792463', '127.0.0.1', '2024-06-01', '00:12:46', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1600, 'D239801', '127.0.0.1', '2024-06-01', '00:12:49', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1601, 'D239801', '127.0.0.1', '2024-06-01', '00:12:49', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1602, 'D239801', '127.0.0.1', '2024-06-01', '00:12:49', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1603, 'CD792463', '127.0.0.1', '2024-06-01', '00:13:26', 'info', 'admin authentifier au compte', 1, 1),
(1604, 'D239801', '127.0.0.1', '2024-06-01', '00:13:31', 'info', 'prof authentifier au compte', 1, 10),
(1605, 'CD792463', '127.0.0.1', '2024-06-01', '00:13:34', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1606, 'CD792463', '127.0.0.1', '2024-06-01', '00:13:35', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1607, 'CD792463', '127.0.0.1', '2024-06-01', '00:13:36', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1608, 'CD792463', '127.0.0.1', '2024-06-01', '00:13:37', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1609, 'D239801', '127.0.0.1', '2024-06-01', '00:13:39', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1610, 'D239801', '127.0.0.1', '2024-06-01', '00:13:40', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1611, 'D239801', '127.0.0.1', '2024-06-01', '00:13:41', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1612, 'D239801', '127.0.0.1', '2024-06-01', '00:13:41', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1613, 'D239801', '127.0.0.1', '2024-06-01', '00:13:41', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1614, 'D239801', '127.0.0.1', '2024-06-01', '00:13:42', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1615, 'CD792463', '127.0.0.1', '2024-06-01', '00:17:25', 'info', 'admin authentifier au compte', 1, 1),
(1616, 'D239801', '127.0.0.1', '2024-06-01', '00:17:30', 'info', 'prof authentifier au compte', 1, 10),
(1617, 'D239801', '127.0.0.1', '2024-06-01', '00:17:35', 'info', 'prof authentifier au compte', 1, 10),
(1618, 'CD792463', '127.0.0.1', '2024-06-01', '00:17:37', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1619, 'CD792463', '127.0.0.1', '2024-06-01', '00:17:39', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1620, 'CD792463', '127.0.0.1', '2024-06-01', '00:17:39', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1621, 'CD792463', '127.0.0.1', '2024-06-01', '00:17:40', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1622, 'D239801', '127.0.0.1', '2024-06-01', '00:17:45', 'info', 'prof authentifier au compte', 1, 10),
(1623, 'D239801', '127.0.0.1', '2024-06-01', '00:17:47', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1624, 'D239801', '127.0.0.1', '2024-06-01', '00:17:48', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1625, 'CD792463', '127.0.0.1', '2024-06-01', '00:17:53', 'info', 'admin authentifier au compte', 1, 1),
(1626, 'CD792463', '127.0.0.1', '2024-06-01', '00:20:46', 'info', 'admin authentifier au compte', 1, 1),
(1627, 'CD792463', '127.0.0.1', '2024-06-01', '00:20:48', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1628, 'CD792463', '127.0.0.1', '2024-06-01', '00:20:48', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1629, 'D239801', '127.0.0.1', '2024-06-01', '00:20:54', 'info', 'prof authentifier au compte', 1, 10),
(1630, 'CD792463', '127.0.0.1', '2024-06-01', '00:21:15', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1631, 'D239801', '127.0.0.1', '2024-06-01', '00:21:20', 'info', 'prof authentifier au compte', 1, 10),
(1632, 'CD792463', '127.0.0.1', '2024-06-01', '00:21:22', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1633, 'CD792463', '127.0.0.1', '2024-06-01', '00:21:23', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1634, 'CD792463', '127.0.0.1', '2024-06-01', '00:21:24', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1635, 'CD792463', '127.0.0.1', '2024-06-01', '00:21:25', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1636, 'D239801', '127.0.0.1', '2024-06-01', '00:21:27', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1637, 'D239801', '127.0.0.1', '2024-06-01', '00:21:28', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1638, 'S130003719', '127.0.0.1', '2024-06-01', '00:25:05', 'info', 'etudiant authentifier au compte', 1, 15),
(1639, NULL, '127.0.0.1', '2024-06-01', '00:25:11', 'error', 'mote de passe ou login incorrect lors de authentification', 1, NULL),
(1640, 'CD792463', '127.0.0.1', '2024-06-01', '09:34:24', 'info', 'admin authentifier au compte', 1, 1),
(1641, 'CD792463', '127.0.0.1', '2024-06-01', '09:34:26', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1642, 'CD792463', '127.0.0.1', '2024-06-01', '09:34:35', 'info', 'admin: a publié des notes ', 1, 1),
(1643, 'D239801', '127.0.0.1', '2024-06-01', '09:38:40', 'info', 'prof authentifier au compte', 1, 10),
(1644, 'D239801', '127.0.0.1', '2024-06-01', '09:38:44', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1645, 'D239801', '127.0.0.1', '2024-06-01', '09:38:47', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1646, 'D239801', '127.0.0.1', '2024-06-01', '09:38:50', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1647, 'D239801', '127.0.0.1', '2024-06-01', '09:38:55', 'info', 'prof: est allé à \'Cours\' ', 1, 10),
(1648, 'D239801', '127.0.0.1', '2024-06-01', '09:39:01', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1649, 'D239801', '127.0.0.1', '2024-06-01', '09:39:02', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1650, 'D239801', '127.0.0.1', '2024-06-01', '09:39:04', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1651, 'D239801', '127.0.0.1', '2024-06-01', '09:39:06', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1652, 'D239801', '127.0.0.1', '2024-06-01', '09:39:08', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1653, 'D239801', '127.0.0.1', '2024-06-01', '09:39:25', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1654, 'CD792463', '127.0.0.1', '2024-06-01', '10:09:00', 'info', 'admin authentifier au compte', 1, 1),
(1655, 'CD792463', '127.0.0.1', '2024-06-01', '10:10:20', 'info', 'admin: est allé à \"ajouter etudiant\" ', 1, 1),
(1656, 'CD792463', '127.0.0.1', '2024-06-01', '10:11:06', 'info', 'admin: a ajouter des etudiant ', 1, 1),
(1657, 'S130003719', '127.0.0.1', '2024-06-01', '10:21:33', 'info', 'etudiant authentifier au compte', 1, 15),
(1658, 'D239801', '127.0.0.1', '2024-06-01', '10:21:47', 'info', 'prof authentifier au compte', 1, 10),
(1659, 'D239801', '127.0.0.1', '2024-06-01', '10:21:56', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1660, 'D239801', '127.0.0.1', '2024-06-01', '10:23:47', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1661, 'D239801', '127.0.0.1', '2024-06-01', '10:23:50', 'info', 'prof: a afficher la liste des cours pour la gestion ', 1, 10),
(1662, 'D239801', '127.0.0.1', '2024-06-01', '10:24:11', 'info', 'prof: est allé à \"Consulter Rapport\" ', 1, 10),
(1663, 'D239801', '127.0.0.1', '2024-06-01', '10:24:15', 'info', 'prof: a consulter les Rapports des etudiants ', 1, 10),
(1664, 'D239801', '127.0.0.1', '2024-06-01', '10:24:19', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1665, 'S130003719', '127.0.0.1', '2024-06-01', '10:24:31', 'info', 'etudiant authentifier au compte', 1, 15),
(1666, 'S130003719', '127.0.0.1', '2024-06-01', '10:24:33', 'info', 'etd: est allé à \"Rapport\" ', 1, 15),
(1667, 'CD792463', '127.0.0.1', '2024-06-01', '10:59:35', 'info', 'admin authentifier au compte', 1, 1),
(1668, 'CD792463', '127.0.0.1', '2024-06-01', '11:00:38', 'info', 'admin: est allé à \"publier note\" ', 1, 1),
(1669, 'CD792463', '127.0.0.1', '2024-06-01', '11:01:52', 'info', 'admin: a chercher les logs d\'un utilisateur ', 1, 1),
(1670, 'CD792463', '127.0.0.1', '2024-06-01', '11:02:01', 'info', 'admin: est allé à \"retrancher etudiant\" ', 1, 1),
(1671, 'CD792463', '127.0.0.1', '2024-06-01', '11:02:02', 'info', 'admin: a chercher des etudiant pour retrancher etudiant ', 1, 1),
(1672, 'CD792463', '127.0.0.1', '2024-06-01', '11:02:35', 'info', 'admin: a desactiver un compte', 1, 1),
(1673, 'CD792463', '127.0.0.1', '2024-06-01', '11:02:41', 'info', 'admin: a activer un compte', 1, 1),
(1674, 'CD792463', '127.0.0.1', '2024-06-01', '11:02:48', 'info', 'admin: est allé à \"Supprimer Prof\" ', 1, 1),
(1675, 'CD792463', '127.0.0.1', '2024-06-01', '11:03:03', 'info', 'admin: est allé à \"editer compte\" ', 1, 1),
(1676, 'CD792463', '127.0.0.1', '2024-06-01', '11:03:11', 'info', 'admin: est allé à \"publier annonce\" ', 1, 1),
(1677, 'CD792463', '127.0.0.1', '2024-06-01', '11:03:25', 'info', 'admin: a publier une annonce ', 1, 1),
(1678, 'D239801', '127.0.0.1', '2024-06-01', '11:04:00', 'info', 'prof authentifier au compte', 1, 10),
(1679, 'D239801', '127.0.0.1', '2024-06-01', '11:04:05', 'info', 'prof: est allé à \"gestion des cours\" ', 1, 10),
(1680, 'D239801', '127.0.0.1', '2024-06-01', '11:04:07', 'info', 'prof: est allé à \"Gestion des Absences\" ', 1, 10),
(1681, 'D239801', '127.0.0.1', '2024-06-01', '11:04:12', 'info', 'prof: a acceder pour faire l absence ', 1, 10),
(1682, 'D239801', '127.0.0.1', '2024-06-01', '11:04:17', 'info', 'prof: a fait l absence ', 1, 10),
(1683, 'D239801', '127.0.0.1', '2024-06-01', '11:04:18', 'info', 'prof: a fait l absence ', 1, 10),
(1684, 'D239801', '127.0.0.1', '2024-06-01', '11:04:18', 'info', 'prof: a fait l absence ', 1, 10),
(1685, 'D239801', '127.0.0.1', '2024-06-01', '11:04:18', 'info', 'prof: a fait l absence ', 1, 10),
(1686, 'D239801', '127.0.0.1', '2024-06-01', '11:04:23', 'info', 'prof: est allé à \"Etudiants pour consulter les absences\" ', 1, 10),
(1687, 'D239801', '127.0.0.1', '2024-06-01', '11:04:26', 'info', 'prof: a acceder pour consulter l absence ', 1, 10),
(1688, 'D239801', '127.0.0.1', '2024-06-01', '11:04:29', 'info', 'prof: a vu les details d\'absence d\'un etudiant', 1, 10),
(1689, 'D239801', '127.0.0.1', '2024-06-01', '11:04:41', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1690, 'D239801', '127.0.0.1', '2024-06-01', '11:04:43', 'info', 'prof: est allé à \"to do list\" ', 1, 10),
(1691, 'D239801', '127.0.0.1', '2024-06-01', '11:05:47', 'info', 'prof authentifier au compte', 1, 10),
(1692, 'D239801', '127.0.0.1', '2024-06-01', '11:05:57', 'info', 'prof: est allé à \"Rapport\" ', 1, 10),
(1693, 'CD792463', '127.0.0.1', '2024-06-01', '11:08:51', 'info', 'admin authentifier au compte', 1, 1),
(1694, 'CD792463', '127.0.0.1', '2024-06-08', '09:28:31', 'info', 'admin authentifier au compte', 1, 1),
(1695, 'CD792463', '127.0.0.1', '2024-06-08', '09:33:27', 'info', 'admin authentifier au compte', 1, 1),
(1696, 'CD792463', '127.0.0.1', '2024-06-08', '09:33:36', 'info', 'admin authentifier au compte', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Module`
--

CREATE TABLE `Module` (
  `IdModule` int(11) NOT NULL,
  `Intitule` varchar(100) DEFAULT NULL,
  `Volume_Horaire` int(11) DEFAULT NULL,
  `IdProf` int(11) DEFAULT NULL,
  `IdNiveau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Module`
--

INSERT INTO `Module` (`IdModule`, `Intitule`, `Volume_Horaire`, `IdProf`, `IdNiveau`) VALUES
(1, 'Architecture des ordinateurs', 10, 1, 1),
(2, 'Langage C avancé et structures de données', 10, 2, 1),
(3, 'Langues et Communication Professionnelles 1', 10, 3, 1),
(4, 'Recherche opérationnelle et théorie des graphes', 10, 4, 1),
(5, 'Réseaux informatiques', 10, 5, 1),
(6, 'Systèmes d’Information et Bases de Données Relationnelles', 10, 6, 1),
(7, 'Algorithmique Avancée et complexité', 10, 7, 1),
(8, 'Architecture Logicielle et UML', 10, 8, 1),
(9, 'Entreprenariat 1 & Atelier Start up', 10, 9, 1),
(10, 'Programmation Orientée Objet C++', 10, 10, 1),
(11, 'Théorie des langages et compilation', 10, 1, 1),
(12, 'Web1 : Technologies de Web et PHP5', 10, 2, 1),
(13, 'Analyse numérique matricielle et Statistique Inférentielle', 10, 3, 2),
(14, 'Architecture des ordinateurs et systèmes d’exploitation', 10, 3, 2),
(15, 'Communication Professionnelle et Soft Skills I', 10, 4, 2),
(16, 'Structure de données et Algorithmique avancée', 10, 5, 2),
(17, 'Systèmes d’Information et Bases de Données', 10, 6, 2),
(18, 'Théorie des langages et compilation', 10, 7, 2),
(19, 'Administration et Optimisation des Bases de Données', 10, 8, 2),
(20, 'Data Mining', 10, 9, 2),
(21, 'Entreprenariat I', 10, 10, 2),
(22, 'Programmation Orientée Objet Java', 10, 1, 2),
(23, 'Programmation Python / Les bases du Web', 10, 2, 2),
(24, 'Statistique en grande dimension', 10, 3, 2),
(25, 'Administration des Bases de données Avancées', 10, 4, 3),
(26, 'Administration réseaux et systèmes', 10, 5, 3),
(27, 'Langues et Communication Professionnelle 2 & Soft Skils', 10, 6, 3),
(28, 'Linux et programmation système', 10, 7, 3),
(29, 'Programmation Java Avancée', 10, 8, 3),
(30, 'Python pour les sciences de données', 10, 9, 3),
(31, 'Crypto-systèmes et sécurité Informatique', 10, 10, 3),
(32, 'Entreprenariat 2', 10, 1, 3),
(33, 'Frameworks Java EE avancés et .Net', 10, 2, 3),
(34, 'Gestion de projet et Génie logiciel', 10, 3, 3),
(35, 'Machine Learning', 10, 4, 3),
(36, 'Web 2 : Applications Web modernes', 10, 5, 3),
(37, 'Architecture Logicielle et UML', 10, 6, 4),
(38, 'Bases de données avancées', 10, 7, 4),
(39, 'Communication Professionnelle et Soft Skills -II-', 10, 8, 4),
(40, 'Fondements du Big Data', 10, 9, 4),
(41, 'Intelligence Artificielle I – Machine Learning', 10, 10, 4),
(42, 'Modélisation Stochastique / Techniques Mathématiques d’Optimisation', 10, 1, 4),
(43, 'Applications Web avancées avec Java et Spring', 10, 2, 4),
(44, 'Big Data Avancées', 10, 3, 4),
(45, 'Data Warehouse et Data Lake', 10, 4, 4),
(46, 'Entreprenariat II', 10, 5, 4),
(47, 'Intelligence Artificielle II – Deep Learning', 10, 6, 4),
(48, 'Traitement Automatique de Langue (TAL) naturelle et ses applications', 10, 7, 4),
(49, 'Développement des applications mobiles', 10, 8, 5),
(50, 'Enterprise Resource Planning ERP', 10, 9, 5),
(51, 'Entreprenariat 3', 10, 10, 5),
(52, 'Ingénierie logicielle, Qualité, Test et Intégration', 10, 1, 5),
(53, 'Système embarqué et temps réel', 10, 2, 5),
(54, 'Virtualisation et Cloud Computing', 10, 3, 5),
(56, 'Big Data Visualisation et Cloud Computing', 10, 4, 6),
(57, 'Business Intelligence et Veille Stratégique', 10, 5, 6),
(58, 'Entreprenariat III', 10, 6, 6),
(59, 'Social Network Mining', 10, 7, 6),
(60, 'Transformation digitale', 10, 8, 6),
(61, 'Web Marketing et CRM', 10, 9, 6),
(62, 'Architecture des ordinateurs et systèmes d’exploitation', 10, 10, 7),
(63, 'Architecture d’entreprise et transformation digitale', 10, 1, 7),
(64, 'Communication Professionnelle et Soft Skills 1', 10, 2, 7),
(65, 'Structure de données et Algorithmique avancée', 10, 3, 7),
(66, 'Systèmes d’Information et Bases de Données', 10, 4, 7),
(67, 'Théorie des langages et compilation', 10, 5, 7),
(68, 'Business, Marketing, and Management Principles for IT', 10, 6, 7),
(69, 'Développement Web', 10, 7, 7),
(70, 'Gestion de projets informatiques', 10, 8, 7),
(71, 'Industrie de numérique', 10, 9, 7),
(72, 'Programmation Orientée Objet Java', 10, 10, 7),
(73, 'Programmation Python / Programmation fonctionnelle', 10, 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `Niveau`
--

CREATE TABLE `Niveau` (
  `IdNiveau` int(11) NOT NULL,
  `Nom` varchar(100) DEFAULT NULL,
  `IdFiliere` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Niveau`
--

INSERT INTO `Niveau` (`IdNiveau`, `Nom`, `IdFiliere`) VALUES
(1, 'GI1', 1),
(2, 'ID1', 2),
(3, 'GI2', 1),
(4, 'ID2', 2),
(5, 'GI3', 1),
(6, 'ID3', 2),
(7, 'TDIA1', 3);

-- --------------------------------------------------------

--
-- Structure de la table `Note`
--

CREATE TABLE `Note` (
  `IdNote` int(11) NOT NULL,
  `Valeur` double DEFAULT NULL,
  `idModule` int(11) DEFAULT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `idEtudiant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Note`
--

INSERT INTO `Note` (`IdNote`, `Valeur`, `idModule`, `idAdmin`, `idEtudiant`) VALUES
(23, 15, 63, 1, 1),
(24, 18, 63, 1, 5),
(25, 11.5, 63, 1, 50),
(26, 10, 63, 1, 5),
(27, 13, 63, 1, 3),
(33, 15, 62, 1, 1),
(34, 18, 62, 1, 5),
(35, 10, 62, 1, 5),
(36, 13, 62, 1, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Prof`
--

CREATE TABLE `Prof` (
  `IdProf` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `CIN` varchar(8) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Tel` int(11) DEFAULT NULL,
  `Activite` char(1) DEFAULT NULL,
  `IdCompte` int(11) DEFAULT NULL,
  `Idrole` int(11) DEFAULT NULL,
  `Login` varchar(50) DEFAULT NULL,
  `Mdp` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `Prof`
--

INSERT INTO `Prof` (`IdProf`, `Nom`, `Prenom`, `CIN`, `Email`, `Tel`, `Activite`, `IdCompte`, `Idrole`, `Login`, `Mdp`) VALUES
(1, 'abou el hanoune', 'youness', 'AB019283', 'yabouelhanoune@gmail.com', 623489801, 'A', 2, 1, 'yabouelhanoune@uae.prof.ac.ma', 'elhanoune123'),
(2, 'addam', 'mohamed', 'R319274', 'm.addam@gmail.com', 623561811, 'A', 3, 1, 'm.addam@uae.prof.ac.ma', 'addam123'),
(3, 'abde khallek', 'bahri', 'R312374', 'abahri@gmail.com', 610983426, 'A', 4, 1, 'abahri@uae.prof.ac.ma', 'bahri123'),
(4, 'boudaa', 'tarek', 'E123435', 't.boudaa@gmail.com', 693791029, 'A', 5, 1, 't.boudaa@uae.prof.ac.ma', 'boudaa123'),
(5, 'el haj', 'bouazza', 'E192035', 'ebouazza@gmail.com', 623561811, 'A', 6, 1, 'ebouazza@uae.prof.ac.ma', 'bouazza123'),
(6, 'cherradi', 'mohamed', 'CD982356', 'm.cherradi@gmail.com', 723091273, 'A', 7, 1, 'm.cherradi@uae.prof.ac.ma', 'cherradi123'),
(7, 'dadi', 'wardani', 'T125474', 'w.dadi@gmail.com', 653870912, 'A', 8, 1, 'w.dadi@uae.prof.ac.ma', 'dadi123'),
(8, 'moradi', 'fouzia', 'F129803', 'f.moradi@gmail.com', 719102367, 'A', 9, 1, 'f.moradi@uae.prof.ac.ma', 'moradi123'),
(9, 'salmani', 'abdelhafid', 'D239801', 'asalmani@gmail.com', 671452987, 'A', 10, 1, 'asalmani@uae.prof.ac.ma', 'salmani123'),
(10, 'moussaid', 'ahmed', 'R334174', 'ahmoussaid@gmail.com', 643612254, 'A', 11, 1, 'ahmoussaid@uae.prof.ac.ma', 'moussaid123');

-- --------------------------------------------------------

--
-- Structure de la table `rapport`
--

CREATE TABLE `rapport` (
  `IdRapport` int(11) NOT NULL,
  `Descriptive` varchar(2000) NOT NULL,
  `IdProf` int(11) NOT NULL,
  `IdNiveau` int(11) NOT NULL,
  `IdModule` int(11) NOT NULL,
  `Deadline` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rapport`
--

INSERT INTO `rapport` (`IdRapport`, `Descriptive`, `IdProf`, `IdNiveau`, `IdModule`, `Deadline`) VALUES
(4, 'new rapport', 9, 7, 71, '2024-05-13'),
(6, 'rapport test', 9, 7, 71, '2024-05-31'),
(7, 'new repport', 9, 7, 71, '2024-05-24'),
(13, 'test rapport2', 9, 7, 71, '2024-06-06'),
(14, 'rapport sur KNN', 9, 2, 20, '2024-06-05');

-- --------------------------------------------------------

--
-- Structure de la table `rapportetd`
--

CREATE TABLE `rapportetd` (
  `IdEtudiant` int(11) NOT NULL,
  `IdRapport` int(11) NOT NULL,
  `pdf_nom` varchar(50) NOT NULL,
  `pdf_path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `rapportetd`
--

INSERT INTO `rapportetd` (`IdEtudiant`, `IdRapport`, `pdf_nom`, `pdf_path`) VALUES
(1, 6, 'allali_amine_rapport1.pdf', '../uploads/rapport/allali_amine_rapport1.pdf');

-- --------------------------------------------------------

--
-- Structure de la table `todolist`
--

CREATE TABLE `todolist` (
  `id` int(11) NOT NULL,
  `task` varchar(255) NOT NULL,
  `date_created` datetime NOT NULL,
  `act` varchar(255) NOT NULL,
  `idprof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `todolist`
--

INSERT INTO `todolist` (`id`, `task`, `date_created`, `act`, `idprof`) VALUES
(13, 'seance de ratt a 16:00', '2024-05-31 13:23:06', 'Non Termine', 9),
(14, 'tdia prj', '2024-06-01 10:22:07', 'Non Termine', 9);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Abscence`
--
ALTER TABLE `Abscence`
  ADD PRIMARY KEY (`IdAbscence`),
  ADD KEY `IdProf` (`IdProf`),
  ADD KEY `idModule` (`idModule`),
  ADD KEY `idEtudiant` (`idEtudiant`);

--
-- Index pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD PRIMARY KEY (`IdAdmin`),
  ADD KEY `IdCompte` (`IdCompte`);

--
-- Index pour la table `Annonce`
--
ALTER TABLE `Annonce`
  ADD PRIMARY KEY (`IdAnnonce`),
  ADD KEY `annonce_ibfk_1` (`IdAdmin`);

--
-- Index pour la table `annonce_niveau`
--
ALTER TABLE `annonce_niveau`
  ADD PRIMARY KEY (`IdAnnonce`,`IdNiveau`),
  ADD KEY `IdNiveau` (`IdNiveau`);

--
-- Index pour la table `calendrierevent`
--
ALTER TABLE `calendrierevent`
  ADD PRIMARY KEY (`IdEvent`),
  ADD KEY `IdNiveau` (`IdNiveau`);

--
-- Index pour la table `Compte`
--
ALTER TABLE `Compte`
  ADD PRIMARY KEY (`IdCompte`);

--
-- Index pour la table `Consultation_annonce`
--
ALTER TABLE `Consultation_annonce`
  ADD PRIMARY KEY (`IdAnnonce`,`IdEtudiant`),
  ADD KEY `IdEtudiant` (`IdEtudiant`);

--
-- Index pour la table `Consultation_cours`
--
ALTER TABLE `Consultation_cours`
  ADD PRIMARY KEY (`IdCours`,`IdEtudiant`),
  ADD KEY `IdEtudiant` (`IdEtudiant`);

--
-- Index pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD PRIMARY KEY (`IdCours`),
  ADD KEY `cours_ibfk1` (`IdProf`),
  ADD KEY `cours_ibfk2` (`IdNiveau`),
  ADD KEY `cours_ibfk3` (`IdModule`);

--
-- Index pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD PRIMARY KEY (`IdEtudiant`),
  ADD KEY `IdCompte` (`IdCompte`),
  ADD KEY `IdAdmin` (`IdAdmin`),
  ADD KEY `IdNiveau` (`IdNiveau`),
  ADD KEY `IdFiliere` (`IdFiliere`);

--
-- Index pour la table `Filiere`
--
ALTER TABLE `Filiere`
  ADD PRIMARY KEY (`IdFiliere`);

--
-- Index pour la table `Journalisation`
--
ALTER TABLE `Journalisation`
  ADD PRIMARY KEY (`IdJournalisation`),
  ADD KEY `IdCompte` (`IdCompte`),
  ADD KEY `IdAdmin` (`IdAdmin`);

--
-- Index pour la table `Module`
--
ALTER TABLE `Module`
  ADD PRIMARY KEY (`IdModule`),
  ADD KEY `IdProf` (`IdProf`),
  ADD KEY `IdNiveau` (`IdNiveau`);

--
-- Index pour la table `Niveau`
--
ALTER TABLE `Niveau`
  ADD PRIMARY KEY (`IdNiveau`),
  ADD KEY `IdFiliere` (`IdFiliere`);

--
-- Index pour la table `Note`
--
ALTER TABLE `Note`
  ADD PRIMARY KEY (`IdNote`),
  ADD KEY `idModule` (`idModule`),
  ADD KEY `idAdmin` (`idAdmin`),
  ADD KEY `idEtudiant` (`idEtudiant`);

--
-- Index pour la table `Prof`
--
ALTER TABLE `Prof`
  ADD PRIMARY KEY (`IdProf`),
  ADD KEY `IdCompte` (`IdCompte`);

--
-- Index pour la table `rapport`
--
ALTER TABLE `rapport`
  ADD PRIMARY KEY (`IdRapport`);

--
-- Index pour la table `rapportetd`
--
ALTER TABLE `rapportetd`
  ADD PRIMARY KEY (`IdEtudiant`,`IdRapport`),
  ADD KEY `IdRapport` (`IdRapport`);

--
-- Index pour la table `todolist`
--
ALTER TABLE `todolist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Abscence`
--
ALTER TABLE `Abscence`
  MODIFY `IdAbscence` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT pour la table `Admin`
--
ALTER TABLE `Admin`
  MODIFY `IdAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `Annonce`
--
ALTER TABLE `Annonce`
  MODIFY `IdAnnonce` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT pour la table `calendrierevent`
--
ALTER TABLE `calendrierevent`
  MODIFY `IdEvent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Compte`
--
ALTER TABLE `Compte`
  MODIFY `IdCompte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT pour la table `Cours`
--
ALTER TABLE `Cours`
  MODIFY `IdCours` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  MODIFY `IdEtudiant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT pour la table `Filiere`
--
ALTER TABLE `Filiere`
  MODIFY `IdFiliere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `Journalisation`
--
ALTER TABLE `Journalisation`
  MODIFY `IdJournalisation` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1697;

--
-- AUTO_INCREMENT pour la table `Module`
--
ALTER TABLE `Module`
  MODIFY `IdModule` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT pour la table `Niveau`
--
ALTER TABLE `Niveau`
  MODIFY `IdNiveau` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `Note`
--
ALTER TABLE `Note`
  MODIFY `IdNote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT pour la table `Prof`
--
ALTER TABLE `Prof`
  MODIFY `IdProf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `rapport`
--
ALTER TABLE `rapport`
  MODIFY `IdRapport` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `todolist`
--
ALTER TABLE `todolist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Abscence`
--
ALTER TABLE `Abscence`
  ADD CONSTRAINT `abscence_ibfk_1` FOREIGN KEY (`IdProf`) REFERENCES `Prof` (`IdProf`),
  ADD CONSTRAINT `abscence_ibfk_2` FOREIGN KEY (`idModule`) REFERENCES `Module` (`IdModule`),
  ADD CONSTRAINT `abscence_ibfk_3` FOREIGN KEY (`idEtudiant`) REFERENCES `Etudiant` (`IdEtudiant`);

--
-- Contraintes pour la table `Admin`
--
ALTER TABLE `Admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`IdCompte`) REFERENCES `Compte` (`IdCompte`);

--
-- Contraintes pour la table `Annonce`
--
ALTER TABLE `Annonce`
  ADD CONSTRAINT `annonce_ibfk_1` FOREIGN KEY (`IdAdmin`) REFERENCES `Admin` (`IdAdmin`);

--
-- Contraintes pour la table `annonce_niveau`
--
ALTER TABLE `annonce_niveau`
  ADD CONSTRAINT `annonce_niveau_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`),
  ADD CONSTRAINT `annonce_niveau_ibfk_2` FOREIGN KEY (`IdNiveau`) REFERENCES `Niveau` (`IdNiveau`);

--
-- Contraintes pour la table `calendrierevent`
--
ALTER TABLE `calendrierevent`
  ADD CONSTRAINT `calendrierevent_ibfk_1` FOREIGN KEY (`IdNiveau`) REFERENCES `niveau` (`IdNiveau`);

--
-- Contraintes pour la table `Consultation_annonce`
--
ALTER TABLE `Consultation_annonce`
  ADD CONSTRAINT `consultation_annonce_ibfk_1` FOREIGN KEY (`IdAnnonce`) REFERENCES `Annonce` (`IdAnnonce`),
  ADD CONSTRAINT `consultation_annonce_ibfk_2` FOREIGN KEY (`IdEtudiant`) REFERENCES `Etudiant` (`IdEtudiant`);

--
-- Contraintes pour la table `Consultation_cours`
--
ALTER TABLE `Consultation_cours`
  ADD CONSTRAINT `consultation_cours_ibfk_1` FOREIGN KEY (`IdCours`) REFERENCES `Cours` (`IdCours`),
  ADD CONSTRAINT `consultation_cours_ibfk_2` FOREIGN KEY (`IdEtudiant`) REFERENCES `Etudiant` (`IdEtudiant`);

--
-- Contraintes pour la table `Cours`
--
ALTER TABLE `Cours`
  ADD CONSTRAINT `cours_ibfk1` FOREIGN KEY (`IdProf`) REFERENCES `Prof` (`IdProf`),
  ADD CONSTRAINT `cours_ibfk2` FOREIGN KEY (`IdNiveau`) REFERENCES `Niveau` (`IdNiveau`),
  ADD CONSTRAINT `cours_ibfk3` FOREIGN KEY (`IdModule`) REFERENCES `Module` (`IdModule`);

--
-- Contraintes pour la table `Etudiant`
--
ALTER TABLE `Etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`IdCompte`) REFERENCES `Compte` (`IdCompte`),
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`IdAdmin`) REFERENCES `Admin` (`IdAdmin`),
  ADD CONSTRAINT `etudiant_ibfk_3` FOREIGN KEY (`IdFiliere`) REFERENCES `Filiere` (`IdFiliere`),
  ADD CONSTRAINT `etudiant_ibfk_4` FOREIGN KEY (`IdNiveau`) REFERENCES `Niveau` (`IdNiveau`);

--
-- Contraintes pour la table `Journalisation`
--
ALTER TABLE `Journalisation`
  ADD CONSTRAINT `journalisation_ibfk_1` FOREIGN KEY (`IdCompte`) REFERENCES `Compte` (`IdCompte`),
  ADD CONSTRAINT `journalisation_ibfk_2` FOREIGN KEY (`IdAdmin`) REFERENCES `Admin` (`IdAdmin`);

--
-- Contraintes pour la table `Module`
--
ALTER TABLE `Module`
  ADD CONSTRAINT `module_ibfk_1` FOREIGN KEY (`IdProf`) REFERENCES `Prof` (`IdProf`),
  ADD CONSTRAINT `module_ibfk_2` FOREIGN KEY (`IdNiveau`) REFERENCES `Niveau` (`IdNiveau`);

--
-- Contraintes pour la table `Niveau`
--
ALTER TABLE `Niveau`
  ADD CONSTRAINT `niveau_ibfk_1` FOREIGN KEY (`IdFiliere`) REFERENCES `Filiere` (`IdFiliere`);

--
-- Contraintes pour la table `Note`
--
ALTER TABLE `Note`
  ADD CONSTRAINT `note_ibfk_1` FOREIGN KEY (`idModule`) REFERENCES `Module` (`IdModule`),
  ADD CONSTRAINT `note_ibfk_2` FOREIGN KEY (`idAdmin`) REFERENCES `Admin` (`IdAdmin`),
  ADD CONSTRAINT `note_ibfk_3` FOREIGN KEY (`idEtudiant`) REFERENCES `Etudiant` (`IdEtudiant`);

--
-- Contraintes pour la table `Prof`
--
ALTER TABLE `Prof`
  ADD CONSTRAINT `prof_ibfk_1` FOREIGN KEY (`IdCompte`) REFERENCES `Compte` (`IdCompte`);

--
-- Contraintes pour la table `rapportetd`
--
ALTER TABLE `rapportetd`
  ADD CONSTRAINT `rapportetd_ibfk_1` FOREIGN KEY (`IdEtudiant`) REFERENCES `etudiant` (`IdEtudiant`),
  ADD CONSTRAINT `rapportetd_ibfk_2` FOREIGN KEY (`IdRapport`) REFERENCES `rapport` (`IdRapport`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
