-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 05 2021 г., 19:07
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `file-manager`
--

-- --------------------------------------------------------

--
-- Структура таблицы `devises`
--

CREATE TABLE `devises` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `devises`
--

INSERT INTO `devises` (`id`, `created_at`, `updated_at`, `api_token`) VALUES
(14, '2021-03-05 05:14:58', '2021-03-05 05:14:58', 'cB6EWfmhYTtCAG0pwgBb7X7HLgtUEc8e'),
(15, '2021-03-05 05:17:29', '2021-03-05 05:17:29', 'aI4g1DzVzyXjIdxorWxpeserriDOy1Y3'),
(16, '2021-03-05 05:18:59', '2021-03-05 05:18:59', '3SeyuiqHLXn6R6ROmfejxi4EaY2jFuFd'),
(18, '2021-03-05 05:42:16', '2021-03-05 05:42:16', 'MWRc6BjRWMT40sx1yfM1IveJxXCkUkV0');

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id`, `created_at`, `updated_at`, `name`, `extension`, `root_id`, `path`) VALUES
(3, '2021-03-05 03:49:47', '2021-03-05 03:49:47', 'msc', 'jpg', 1, 'images/GOemAIeWnqgpB5SJoEVB8beQAp7gNkPGAJF9Tjcn.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `folders`
--

CREATE TABLE `folders` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  `name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `folders`
--

INSERT INTO `folders` (`id`, `created_at`, `updated_at`, `root_id`, `name`) VALUES
(1, '2021-03-05 03:50:26', '2021-03-05 03:50:26', NULL, 'Base'),
(2, '2021-03-05 06:25:35', '2021-03-05 06:25:35', 1, 'Projects'),
(3, '2021-03-05 06:25:47', '2021-03-05 06:25:47', 1, 'Images'),
(4, '2021-03-05 06:26:06', '2021-03-05 06:26:06', 1, 'Movies'),
(5, '2021-03-05 06:26:37', '2021-03-05 06:26:37', 2, 'Test1'),
(6, '2021-03-05 06:26:40', '2021-03-05 06:26:40', 2, 'Test2'),
(7, '2021-03-05 06:26:46', '2021-03-05 06:26:46', 3, 'Test1'),
(8, '2021-03-05 06:26:52', '2021-03-05 06:26:52', 4, 'Test2'),
(9, '2021-03-05 06:26:58', '2021-03-05 06:26:58', 5, 'Test1'),
(10, '2021-03-05 06:27:02', '2021-03-05 06:27:02', 5, 'Test2'),
(11, '2021-03-05 08:29:21', '2021-03-05 08:29:21', 1, 'NewFolder');

-- --------------------------------------------------------

--
-- Структура таблицы `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2021_03_03_081213_create_user_table', 1),
(2, '2021_03_03_091519_create_devises_table', 1),
(5, '2021_03_03_095920_create_table_files', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `login` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` text COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `login`, `password`, `api_token`) VALUES
(1, '2021-03-03 06:35:57', '2021-03-03 06:35:57', 'kruj', '$2y$10$cyTkbjNjEnBMA68d.1hRgurZz6KZkFa54YpRzgb8n2f9SbCrwo0nW', NULL),
(2, '2021-03-05 04:27:50', '2021-03-05 04:27:50', 'administrateur', '$2y$10$plWy2QjlYRbNQ9p9ur2xN.x4FzeHBJ27bL9Ak4OuDIy84JPOdreoO', NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `devises`
--
ALTER TABLE `devises`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `devises`
--
ALTER TABLE `devises`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `folders`
--
ALTER TABLE `folders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
