-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 31 okt 2025 om 09:05
-- Serverversie: 10.4.32-MariaDB
-- PHP-versie: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
                                               `version` varchar(191) NOT NULL,
                                               `executed_at` datetime DEFAULT NULL,
                                               `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
                                      `id` bigint(20) NOT NULL,
                                      `body` longtext NOT NULL,
                                      `headers` longtext NOT NULL,
                                      `queue_name` varchar(190) NOT NULL,
                                      `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
                                      `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
                                      `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `school_group`
--

CREATE TABLE `school_group` (
                                `id` int(11) NOT NULL,
                                `name` varchar(255) NOT NULL,
                                `year` int(11) NOT NULL,
                                `teacher` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `school_group`
--

INSERT INTO `school_group` (`id`, `name`, `year`, `teacher`) VALUES
                                                                 (1, 'SD1A', 1, 'M Hutten'),
                                                                 (2, 'SD1B', 1, 'W Stolk'),
                                                                 (3, 'SD1C', 1, 'K Mooijman'),
                                                                 (4, 'SD1D', 1, 'F Dasci'),
                                                                 (5, 'SD2A', 2, 'M Sarikaya'),
                                                                 (6, 'SD2B', 2, 'M Kleijwegt'),
                                                                 (7, 'SD2C', 2, 'K Mooijman'),
                                                                 (8, 'SD2D', 2, 'L Govea'),
                                                                 (9, 'SD3A', 3, 'M van der Linden'),
                                                                 (10, 'SD3B', 3, 'M Kleijwegt'),
                                                                 (11, 'SD3C', 3, 'W Hulzebosch'),
                                                                 (12, 'SD3D', 3, 'M Hutten');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `student`
--

CREATE TABLE `student` (
                           `id` int(11) NOT NULL,
                           `first_name` varchar(255) NOT NULL,
                           `email` varchar(255) NOT NULL,
                           `last_name` varchar(255) NOT NULL,
                           `age` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `student`
--

INSERT INTO `student` (`id`, `first_name`, `email`, `last_name`, `age`) VALUES
                                                                            (1, 'Piet', 'p.jansen@rocmondriaan.nl', 'Jansen', 18),
                                                                            (2, 'Klaas', 'k.devries@rocmondriaan.nl', 'de Vries', 17),
                                                                            (3, 'Ria', 'r.degraaf@rocmondriaan.nl', 'de Graaf', 16);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vacation`
--

CREATE TABLE `vacation` (
                            `id` int(11) NOT NULL,
                            `name` varchar(255) NOT NULL,
                            `start_date` date NOT NULL,
                            `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `vacation`
--

INSERT INTO `vacation` (`id`, `name`, `start_date`, `end_date`) VALUES
                                                                    (1, 'Herfstvakantie', '2025-10-18', '2025-10-26'),
                                                                    (2, 'Kerstvakantie', '2025-12-20', '2026-01-04'),
                                                                    (3, 'Voorjaarsvakantie', '2026-02-14', '2026-02-22'),
                                                                    (4, 'Meivakantie', '2026-04-18', '2026-05-03'),
                                                                    (5, 'Zomervakantie', '2026-07-18', '2026-08-30');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
    ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
    ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `school_group`
--
ALTER TABLE `school_group`
    ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `student`
--
ALTER TABLE `student`
    ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `vacation`
--
ALTER TABLE `vacation`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `school_group`
--
ALTER TABLE `school_group`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT voor een tabel `student`
--
ALTER TABLE `student`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT voor een tabel `vacation`
--
ALTER TABLE `vacation`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
