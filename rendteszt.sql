-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Feb 11. 11:17
-- Kiszolgáló verziója: 10.4.17-MariaDB
-- PHP verzió: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `rendteszt`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `eloado`
--

CREATE TABLE `eloado` (
  `eloado_id` int(11) NOT NULL,
  `eloado_nev` varchar(50) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `bio` varchar(250) COLLATE utf8mb4_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `eloado`
--

INSERT INTO `eloado` (`eloado_id`, `eloado_nev`, `bio`) VALUES
(1, 'Fingó Mókusok', 'Sziasztok, mi vagyunk a Fingó Mókusok, és szeretünk nevünkhöz híven cselekedni SONKA evés után. Különleges számunk a HamUp.'),
(2, 'Kiss Apám zenekar', 'Sziasztok, mi vagyunk a Kiss Apám zenekar, 2002-ben alapultunk meg, mi vagyunk a magyar könnyű rockzene megtestesítője'),
(3, 'KilakikItt', 'Sziasztok, mi vagyunk a KILAKIKITT, 2004-ben alapultunk meg, mi vagyunk a magyar underground megtestesítője'),
(4, 'Korda Gyuri', 'Sziasztok, Korda György vagyok, a mulatós megtestesítője, legtöbbször a feleségemmel, Klárikával lépek fel'),
(5, 'Alma Együttes', 'Sziasztok, mi vagyunk az Alma Együttes, egyetlen ismert számunk a ma van a szülinapom!'),
(8, 'Kecske', 'A káposzta is megmarad'),
(9, 'Ivett', 'Aki nem vett');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `helyszin`
--

CREATE TABLE `helyszin` (
  `helyszin_id` int(3) NOT NULL,
  `helyszin_nev` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `helyszin_cim` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `helyszin_bemutatas` varchar(200) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `e-mail` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `weblap` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `helyszin`
--

INSERT INTO `helyszin` (`helyszin_id`, `helyszin_nev`, `helyszin_cim`, `helyszin_bemutatas`, `e-mail`, `weblap`) VALUES
(1, 'Csodák Palotája', '1038 Budapest, Bécsi út 38-44.', '2017-ben Óbudán a két helyszín összeköltözésével testet öltött egy világszínvonalú, többféle tudományágat felölelő, minden korosztálynak programot nyújtó science center. A Csopa egy 5000 m2-es tudomán', 'csodakpalotaja@gmail.com', 'https://www.csopa.hu/'),
(2, 'Kobuci Kert', '1033 Budapest, Fő tér 1., Zich', 'Kobuci Kert\', \'1033 Budapest, Fő tér 1., Zichy-kastély udvar\', \'A Kobuci Kert 2005-ben indult Kapolcson, és 2009-ben költözött a Zichy-kastély udvarába. Különböző szabadtéri zenei rendezvényeket tarta', 'kobuci@kert.com', 'https://https://kobuci.hu/'),
(3, 'ÖTKERT', 'Budapest', 'Éjszakai rendezvényközpont, kisebb rendezvényeknek, több teremmel.', '', 'https://otkert.hu/'),
(4, 'SZIMPLA kert', 'Budapest', 'Éjszakai rendezvényközpont, sok alkohol és sok kultúra.', '', 'https://szimpla.hu/'),
(5, 'ARÉNA GARDEN', 'Budapest', 'Rendezvényközpont, nagyobb rendezvényeknek, szabadtéri élmény.', '', 'https://arena-garden.hu/'),
(6, 'Gamer Land', 'Budapest', 'Rendezvény és szórakoztató központ. Kisebb, illetve nagyobb rendezvényeknek, több teremmel, gépekkel.', '', 'https://gamerland.hu/');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendezveny`
--

CREATE TABLE `rendezveny` (
  `rend_id` int(3) NOT NULL,
  `helyszin_id` int(3) NOT NULL,
  `rend_nev` varchar(30) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `idopont` date NOT NULL,
  `kategoria` varchar(20) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `korosztaly` varchar(20) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `leiras` varchar(200) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `ar` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rendezveny`
--

INSERT INTO `rendezveny` (`rend_id`, `helyszin_id`, `rend_nev`, `idopont`, `kategoria`, `korosztaly`, `leiras`, `ar`) VALUES
(1, 1, 'Fingó mókusok szülinapi koncer', '2022-02-18', 'koncert', 'Családi', 'A Fingó Mókusok megalakulásuk alkalmából koncertet adnak elő, hogy megünnepeljék harmadik havi életben maradásuk.', 0),
(2, 2, 'KIS APÁM koncert', '2022-01-05', 'koncert', '+18', 'Kiss Apám 20. szülinapi koncertje', 1000),
(3, 3, 'Ki lakik itt koncert', '2022-01-31', 'koncert', '+16', 'Ki lakik itt?.', 2000),
(4, 4, 'Eper fesztivál', '2022-06-18', 'fesztivál', '+5', 'Gyere és te is szedd le a legszebb és legfinomabb epreket.', 500),
(5, 6, 'Boldog Szülinapot Vanessza', '2022-04-22', 'HB', '+16', 'Czégel Vanessza születésnapja, be kell inni', 0),
(6, 4, 'Kilakik Itt nyárindító koncert', '2022-05-11', 'koncert', '+16', 'Sziasztok mindenkit várunk szeretettel a kilakik itt nyárindító májusi koncertjére, fergeteges lesz!', 2500),
(8, 1, 'Egyszervolt hol nem volt', '2022-05-26', 'Bál', '+16', 'Gyere és légy te is valaki más.', 0),
(9, 1, 'Egyszervolt hol nem volt', '2022-05-26', 'Bál', '+16', 'Gyere és légy te is valaki más.', 0),
(10, 2, 'Jómóka', '2022-05-16', 'Koncert', '+16', 'juhu.', 0),
(11, 1, 'Egyszervolt hol nem volt', '2022-05-26', 'Bál', '+16', 'Gyere és légy te is valaki más.', 0),
(12, 2, 'Jómóka', '2022-05-16', 'Koncert', '+16', 'juhu.', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rend_eloado`
--

CREATE TABLE `rend_eloado` (
  `rend_id` int(3) NOT NULL,
  `eloado_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `rend_eloado`
--

INSERT INTO `rend_eloado` (`rend_id`, `eloado_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 3),
(8, 1),
(9, 2),
(10, 3),
(11, 8),
(12, 9),
(8, 3),
(9, 5),
(10, 4),
(11, 2),
(12, 3);

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `eloado`
--
ALTER TABLE `eloado`
  ADD PRIMARY KEY (`eloado_id`),
  ADD UNIQUE KEY `id` (`eloado_id`);

--
-- A tábla indexei `helyszin`
--
ALTER TABLE `helyszin`
  ADD PRIMARY KEY (`helyszin_id`);

--
-- A tábla indexei `rendezveny`
--
ALTER TABLE `rendezveny`
  ADD PRIMARY KEY (`rend_id`),
  ADD KEY `helyszin_id` (`helyszin_id`);

--
-- A tábla indexei `rend_eloado`
--
ALTER TABLE `rend_eloado`
  ADD KEY `rend_id` (`rend_id`),
  ADD KEY `eloado_id` (`eloado_id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `eloado`
--
ALTER TABLE `eloado`
  MODIFY `eloado_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT a táblához `helyszin`
--
ALTER TABLE `helyszin`
  MODIFY `helyszin_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT a táblához `rendezveny`
--
ALTER TABLE `rendezveny`
  MODIFY `rend_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `rendezveny`
--
ALTER TABLE `rendezveny`
  ADD CONSTRAINT `rendezveny_ibfk_1` FOREIGN KEY (`helyszin_id`) REFERENCES `helyszin` (`helyszin_id`);

--
-- Megkötések a táblához `rend_eloado`
--
ALTER TABLE `rend_eloado`
  ADD CONSTRAINT `rend_eloado_ibfk_1` FOREIGN KEY (`rend_id`) REFERENCES `rendezveny` (`rend_id`),
  ADD CONSTRAINT `rend_eloado_ibfk_2` FOREIGN KEY (`eloado_id`) REFERENCES `eloado` (`eloado_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
