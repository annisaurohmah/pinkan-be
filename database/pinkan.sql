-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2024 at 08:31 AM
-- Server version: 8.0.36
-- PHP Version: 8.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pinkan`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` bigint UNSIGNED NOT NULL,
  `id_game` bigint UNSIGNED NOT NULL,
  `chapter_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `id_game`, `chapter_name`) VALUES
(1, 1, 'Mengenal Huruf'),
(2, 1, 'Merangkai Kata'),
(3, 1, 'Bermain Kata'),
(4, 2, 'Jalan dan Cari\r\n'),
(5, 2, 'Keranjang dan Angka\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint UNSIGNED NOT NULL,
  `game_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `game_name`) VALUES
(1, 'membaca'),
(2, 'berhitung');

-- --------------------------------------------------------

--
-- Table structure for table `levels`
--

CREATE TABLE `levels` (
  `id` bigint UNSIGNED NOT NULL,
  `id_chapter` bigint UNSIGNED NOT NULL,
  `level_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `levels`
--

INSERT INTO `levels` (`id`, `id_chapter`, `level_name`) VALUES
(1, 1, 'Huruf A-C'),
(2, 1, 'Huruf D-F'),
(3, 2, 'Huruf A-E'),
(4, 3, 'Huruf A-E'),
(5, 3, 'Huruf F-J'),
(6, 3, 'Tarik Garis Level 1'),
(7, 3, 'Tarik Garis Level 2'),
(8, 4, 'Jalan dan Cari'),
(9, 5, 'Keranjang dan Angka');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_05_08_121328_create_games_table', 1),
(6, '2024_05_08_121637_create_chapters_table', 1),
(7, '2024_05_08_121743_create_levels_table', 1),
(8, '2024_05_08_122102_create_questions_table', 1),
(9, '2024_05_08_122208_create_sessions_table', 1),
(10, '2024_05_08_122218_create_responses_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(8, 'App\\Models\\User', 25, 'api-token', 'a75158da82cbc17e14df3e6ff1ac962d914cd6bac39374f460250e1f9c259fa8', '[\"*\"]', '2024-07-08 22:09:07', NULL, '2024-07-08 22:07:23', '2024-07-08 22:09:07'),
(10, 'App\\Models\\User', 26, 'api-token', 'f4a831dc333bba64d717bf9b30a3df3a2d7c0e29e0870686a2a9aa4e4decc87e', '[\"*\"]', '2024-07-09 00:47:06', NULL, '2024-07-09 00:05:28', '2024-07-09 00:47:06');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` bigint UNSIGNED NOT NULL,
  `id_level` bigint UNSIGNED NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `id_level`, `question`, `correct_answer`) VALUES
(1, 1, 'Menggambar huruf A', 'true'),
(2, 1, 'Memasukkan suara A', 'true'),
(3, 1, 'Menggambar huruf B', 'true'),
(4, 1, 'Memasukkan suara B', 'true'),
(5, 1, 'Menggambar huruf C', 'true'),
(6, 1, 'Memasukkan suara C\r\n', 'true'),
(7, 1, 'Suara A (A, C)', 'true'),
(8, 1, 'Suara B (C, B)', 'true'),
(9, 1, 'Suara C (C, B)', 'true'),
(10, 2, 'Menggambar huruf D\r\n', 'true'),
(11, 2, 'Memasukkan suara D', 'true'),
(12, 2, 'Menggambar huruf E', 'true'),
(13, 2, 'Memasukkan suara E', 'true'),
(14, 2, 'Menggambar huruf F', 'true'),
(15, 2, 'Memasukkan suara F', 'true'),
(16, 2, 'Suara D (D, F)', 'true'),
(17, 2, 'Suara E (E, F)', 'true'),
(18, 2, 'Suara F (D, F)', 'true'),
(19, 3, 'Ba-ca baca\r\n', 'true'),
(20, 3, 'Ca-ca caca', 'true'),
(21, 3, 'da-da dada', 'true'),
(22, 3, 'be-da beda', 'true'),
(23, 3, 'Be-ca beca', 'true'),
(24, 3, 'Ca-be cabe', 'true'),
(25, 4, 'BOL_ (a,e)', 'true'),
(26, 4, '_UKU (b,t)', 'true'),
(27, 4, '_ANGKUL (c,d)', 'true'),
(28, 4, 'KAC_ (a,e)', 'true'),
(29, 4, 'T_NDA (e,a)', 'true'),
(30, 4, 'SAN_AL (d,b)', 'true'),
(31, 4, '_OMBA (d,b)', 'true'),
(32, 4, '_I_AK (c,d)', 'true'),
(33, 4, '_ATU (b,r)', 'true'),
(34, 4, '_IN_IN (c,d)', 'true'),
(35, 5, '_ILM (c,f)', 'true'),
(36, 5, '_OTO (c,f)', 'true'),
(37, 5, '_ANDUK (k,h)', 'true'),
(38, 5, 'PA_AR (g,c)', 'true'),
(39, 5, 'PAD_ (i,a)', 'true'),
(40, 5, 'ME_A (k,j)', 'true'),
(41, 5, '_UJAN (h,b)', 'true'),
(42, 5, '_ITAR (g,c)', 'true'),
(43, 5, '_KAN (i,a)', 'true'),
(44, 5, '_AMUR (k,j)', 'true'),
(45, 8, '1', 'true'),
(46, 8, '2', ''),
(47, 8, '3', 'true'),
(48, 8, '4', 'true'),
(49, 8, '5', 'true'),
(50, 8, '6', 'true'),
(51, 8, '7', 'true'),
(52, 8, '8', 'true'),
(53, 8, '9', 'true'),
(54, 8, '10', 'true'),
(55, 9, '1', 'true'),
(56, 9, '2', 'true'),
(57, 9, '3', 'true'),
(58, 9, '4', 'true'),
(59, 9, '5', 'true'),
(60, 9, '6', 'true'),
(61, 9, '7', 'true'),
(62, 9, '8', 'true'),
(63, 9, '9', 'true'),
(64, 9, '10', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `responses`
--

CREATE TABLE `responses` (
  `id` bigint UNSIGNED NOT NULL,
  `id_question` bigint UNSIGNED NOT NULL,
  `id_session` bigint UNSIGNED NOT NULL,
  `response` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `responses`
--

INSERT INTO `responses` (`id`, `id_question`, `id_session`, `response`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', '2024-06-30 21:57:39', '2024-06-30 21:57:39'),
(2, 1, 3, '1', '2024-07-09 00:06:31', '2024-07-09 00:06:31'),
(7, 2, 4, '1', '2024-07-09 00:18:37', '2024-07-09 00:18:37'),
(8, 3, 5, '1', '2024-07-09 00:35:39', '2024-07-09 00:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NOT NULL,
  `score` int DEFAULT NULL,
  `start_time` timestamp NOT NULL,
  `end_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `id_user`, `score`, `start_time`, `end_time`) VALUES
(1, 24, NULL, '2024-07-09 02:13:35', '2024-07-08 02:12:44'),
(2, 24, 10, '2024-07-09 02:13:20', '2024-07-09 02:12:44'),
(3, 26, 0, '2024-07-09 00:05:59', '2024-07-09 00:06:48'),
(4, 26, 100, '2024-07-09 07:20:16', '2024-07-09 00:20:25'),
(5, 26, 100, '2024-07-09 00:35:24', '2024-07-09 00:35:48');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `date_of_birth` date NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `email`, `email_verified_at`, `date_of_birth`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(12, 'june.will', 'Dan', 'Kutch', 'priscilla09@example.org', '2024-06-14 18:45:13', '2017-12-29', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'Rpmkbdol4I', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(13, 'lura.okeefe', 'Fabiola', 'Bosco', 'fadel.raoul@example.net', '2024-06-14 18:45:13', '2000-10-27', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', '93Mp9Pzg0G', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(14, 'yazmin48', 'Marta', 'Daugherty', 'gutkowski.jaydon@example.com', '2024-06-14 18:45:13', '2007-03-29', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'qpLlAcbqCq', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(15, 'stevie.hand', 'Ora', 'Adams', 'ernser.terrance@example.net', '2024-06-14 18:45:13', '1987-01-02', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'a3Wl0f2ImT', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(16, 'jessica.russel', 'Chandler', 'Halvorson', 'wisozk.queen@example.com', '2024-06-14 18:45:13', '2016-08-16', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', '4FndLaB79T', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(17, 'fausto40', 'Mathew', 'Rau', 'vince.kiehn@example.net', '2024-06-14 18:45:13', '2022-02-08', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', '6p03FrFC8g', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(18, 'heidenreich.norene', 'Jayde', 'Dietrich', 'clint42@example.org', '2024-06-14 18:45:13', '1989-08-06', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'Cc5Bus2nbG', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(19, 'ikunde', 'Marianne', 'Stamm', 'fmonahan@example.com', '2024-06-14 18:45:13', '1978-05-04', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'Vb9BmCqooG', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(20, 'randal.breitenberg', 'Carey', 'Pagac', 'willms.brielle@example.net', '2024-06-14 18:45:13', '2010-03-07', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'SFuhaAgW9u', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(21, 'eliza43', 'Rashawn', 'West', 'hettinger.imelda@example.com', '2024-06-14 18:45:13', '2021-10-21', '$2y$12$OZqWU4j45aBgcJGXolWEJe.L55pX5sRbeo8cEHogmQU59F6RjXSUK', 'n11T22RGPU', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(22, 'testuser', 'Test', 'User', 'test@example.com', '2024-06-14 18:45:13', '1990-01-01', '$2y$12$UN/ByuiTxYxAEUsw0p2nre/hwLwjQiUha29tcI0NLEV8aZhex5ANe', 'gZNndNmcil', '2024-06-14 18:45:13', '2024-06-14 18:45:13'),
(24, 'annisaurohmah', 'Annisa', 'Urohmah', 'urohmahannisa2@gmail.com', NULL, '2004-09-08', '$2y$12$jrfMoNeO4lsVJ.9/Axlp2eypd3muBaJaqTz1VYazNUvJhJK.C4G36', 'DhNfZCVRoThMPP6JIJgPi0D97Jt2l6YkbCr9QPjP8w2UmiP89i2L1VHGXf6h', '2024-06-30 03:51:57', '2024-07-04 04:48:40'),
(26, 'annisaurohmah', 'Annisa', 'Urohmah', 'urohmahannisa@gmail.com', NULL, '2004-09-08', '$2y$12$X8qb5H19cWoomYw9L5a65OCMohYurKyEhEFY0OY9b0cEBgXiGMgUi', NULL, '2024-07-09 00:05:22', '2024-07-09 00:05:22');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `chapters_id_game_foreign` (`id_game`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `levels_id_chapter_foreign` (`id_chapter`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `questions_id_level_foreign` (`id_level`);

--
-- Indexes for table `responses`
--
ALTER TABLE `responses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `responses_id_question_foreign` (`id_question`),
  ADD KEY `responses_id_session_foreign` (`id_session`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_id_user_foreign` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `levels`
--
ALTER TABLE `levels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `responses`
--
ALTER TABLE `responses`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `sessions`
--
ALTER TABLE `sessions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_id_game_foreign` FOREIGN KEY (`id_game`) REFERENCES `games` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `levels`
--
ALTER TABLE `levels`
  ADD CONSTRAINT `levels_id_chapter_foreign` FOREIGN KEY (`id_chapter`) REFERENCES `chapters` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_id_level_foreign` FOREIGN KEY (`id_level`) REFERENCES `levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `responses`
--
ALTER TABLE `responses`
  ADD CONSTRAINT `responses_id_question_foreign` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `responses_id_session_foreign` FOREIGN KEY (`id_session`) REFERENCES `sessions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sessions`
--
ALTER TABLE `sessions`
  ADD CONSTRAINT `sessions_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
