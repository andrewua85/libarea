-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Мар 16 2021 г., 15:26
-- Версия сервера: 8.0.23-0ubuntu0.20.04.1
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `myareadev`
--

-- --------------------------------------------------------

--
-- Структура таблицы `auth_logins`
--

CREATE TABLE `auth_logins` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `successfull` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
 
-- --------------------------------------------------------

--
-- Структура таблицы `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(255) NOT NULL,
  `hashedvalidator` varchar(255) NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `comment_id` int NOT NULL,
  `comment_type` enum('normal','admin','private') NOT NULL DEFAULT 'normal',
  `comment_post_id` int NOT NULL DEFAULT '0',
  `comment_user_id` int NOT NULL DEFAULT '0',
  `comment_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `comment_modified` timestamp NOT NULL DEFAULT '2020-12-31 09:00:00',
  `comment_ip` varbinary(42) DEFAULT NULL,
  `comment_order` smallint NOT NULL DEFAULT '0',
  `comment_on` smallint NOT NULL DEFAULT '0',
  `comment_after` smallint NOT NULL DEFAULT '0',
  `comment_votes` smallint NOT NULL DEFAULT '0',
  `comment_content` text NOT NULL,
  `comment_del` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `post_id` int UNSIGNED NOT NULL,
  `post_title` varchar(250) NOT NULL,
  `post_slug` varchar(128) NOT NULL,
  `post_space_id` int NOT NULL DEFAULT '0',
  `post_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `edit_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `post_user_id` int UNSIGNED NOT NULL,
  `post_visible` enum('all','friends') NOT NULL DEFAULT 'all',
  `post_ip_int` varchar(112) DEFAULT NULL,
  `post_votes` smallint NOT NULL DEFAULT '0',
  `post_karma` smallint NOT NULL DEFAULT '0',
  `post_comments` smallint NOT NULL DEFAULT '0',
  `post_content` text NOT NULL,
  `post_top` tinyint(1) NOT NULL DEFAULT '0',
  `post_is_delete` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `posts`
--

INSERT INTO `posts` (`post_id`, `post_title`, `post_slug`, `post_space_id`, `post_date`, `edit_date`, `post_user_id`, `post_visible`, `post_ip_int`, `post_votes`, `post_karma`, `post_comments`, `post_content`, `post_top`, `post_is_delete`) VALUES
(1, 'Муха села на варенье, Вот и всё стихотворенье...', 'muha-stih', 1, '2021-02-28 12:08:09', '2021-03-05 10:05:25', 1, 'all', NULL, 0, 0, 0, '> \"Нет не всё!\" - сказала Муха,\r\n\r\n> Почесала себе брюхо,\r\n\r\n> Свесив с блюдца две ноги,\r\n\r\n> Мне сказала:\"Погоди!\r\n\r\n> Прежде чем сесть на варенье,\r\n\r\n> Я прочла стихотворенье,\r\n\r\n> Неизвестного поэта,\r\n\r\n> Написавшего про это.\r\n\r\n\r\n## Заголовок\r\n\r\nЧто-то в модели много кода:\r\n\r\n```\r\n$db = \\Config\\Database::connect();\r\n$builder = $db->table(\'Posts AS a\');\r\n$builder->select(\'a.*, b.id, b.nickname, b.avatar\');\r\n$builder->join(\"users AS b\", \"b.id = a.post_user_id\");\r\n$builder->where(\'a.post_slug\', $slug);\r\n$builder->orderBy(\'a.post_id\', \'DESC\');\r\n```\r\n\r\nВот. Это первый пост.', 0, 0),
(2, 'Второй пост...', 'vtoroi-post', 2, '2021-02-28 12:15:58', '2021-03-05 10:05:25', 2, 'all', NULL, 0, 0, 0, 'Не будет тут про муху. Просто второй пост.\r\n\r\n> в лесу родилась ёлка, зеленая была...', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `space`
--

CREATE TABLE `space` (
  `space_id` int NOT NULL,
  `space_name` varchar(250) NOT NULL,
  `space_slug` varchar(128) NOT NULL,
  `space_description` varchar(250) NOT NULL,
  `space_category_id` int NOT NULL DEFAULT '1',
  `space_tip` int NOT NULL DEFAULT '1',
  `space_permit_users` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `space`
--

INSERT INTO `space` (`space_id`, `space_name`, `space_slug`, `space_description`, `space_category_id`, `space_tip`, `space_permit_users`) VALUES
(1, 'cms', 'cms', 'Системы управления сайтами...', 0, 1, 0),
(2, 'Вопросы', 'qa', 'Вопросы и ответы', 0, 2, 0),
(3, 'флуд', 'flud', 'Просто обычные разговоры', 0, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `space_hidden`
--

CREATE TABLE `space_hidden` (
  `hidden_id` int NOT NULL,
  `hidden_space_id` int NOT NULL,
  `hidden_user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `login` varchar(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `reset_token` varchar(250) DEFAULT NULL,
  `reset_expire` datetime DEFAULT NULL,
  `activated` tinyint(1) NOT NULL,
  `activate_token` varchar(250) DEFAULT NULL,
  `activate_expire` varchar(250) DEFAULT NULL,
  `role` int NOT NULL COMMENT 'По умолчанию 2 (1 - админ)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` tinyint(1) DEFAULT '0',
  `avatar` varchar(250) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `rating` int NOT NULL DEFAULT '0',
  `status` varchar(250) DEFAULT NULL,
  `my_post` int DEFAULT NULL COMMENT 'Пост выведенный в профиль',
  `post_profile` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `login`, `name`, `email`, `password`, `reset_token`, `reset_expire`, `activated`, `activate_token`, `activate_expire`, `role`, `created_at`, `updated_at`, `deleted_at`, `avatar`, `about`, `rating`, `status`, `my_post`, `post_profile`) VALUES
(1, 'AdreS', 'Олег', 'ss@sdf.ru', '$2y$10$oR5VZ.zk7IN/og70gQq/f.0Sb.GQJ33VZHIES4pyIpU3W2vF6aiaW', '', NULL, 1, NULL, NULL, 1, '2021-03-08 21:37:04', '2021-03-08 21:37:04', 0, '', 'Тестовый аккаунт', 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `votes_comm`
--

CREATE TABLE `votes_comm` (
  `votes_comm_id` int NOT NULL,
  `votes_comm_item_id` int NOT NULL,
  `votes_comm_points` int NOT NULL,
  `votes_comm_ip` varchar(20) NOT NULL,
  `votes_comm_user_id` int NOT NULL DEFAULT '1',
  `votes_comm_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL COMMENT 'Отправитель',
  `dialog_id` int(11) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `add_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `sender_remove` tinyint(1) DEFAULT 0,
  `recipient_remove` tinyint(1) DEFAULT 0,
  `receipt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


CREATE TABLE `messages_dialog` (
  `id` int(11) NOT NULL,
  `sender_uid` int(11) DEFAULT NULL COMMENT 'Отправитель',
  `sender_unread` int(11) DEFAULT NULL COMMENT 'Отправитель, 0 непрочитано',
  `recipient_uid` int(11) DEFAULT NULL COMMENT 'Получатель',
  `recipient_unread` int(11) DEFAULT NULL COMMENT 'Получатель, 0 непрочитано',
  `add_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `update_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `sender_count` int(11) DEFAULT NULL COMMENT 'Отправитель кол.',
  `recipient_count` int(11) DEFAULT NULL COMMENT 'Получатель кол.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dialog_id` (`dialog_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `sender_remove` (`sender_remove`),
  ADD KEY `recipient_remove` (`recipient_remove`),
  ADD KEY `sender_receipt` (`receipt`);

--
-- Индексы таблицы `messages_dialog`
--
ALTER TABLE `messages_dialog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_uid` (`recipient_uid`),
  ADD KEY `sender_uid` (`sender_uid`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `add_time` (`add_time`);


--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `messages_dialog`
--
ALTER TABLE `messages_dialog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;


--
-- Таблица уведомления
--

CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL,
  `sender_uid` int(11) DEFAULT NULL COMMENT 'Отправитель',
  `recipient_uid` int(11) DEFAULT '0' COMMENT 'Получает ID',
  `action_type` int(4) DEFAULT NULL COMMENT 'Тип оповещения',
  `connection_type` int(11) DEFAULT NULL COMMENT 'Данные источника',
  `add_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_flag` tinyint(1) DEFAULT '0' COMMENT 'Состояние прочтения',
  `is_del` tinyint(1) UNSIGNED DEFAULT '0' COMMENT 'Стоит ли удалять'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `recipient_read_flag` (`recipient_uid`,`read_flag`),
  ADD KEY `sender_uid` (`sender_uid`),
  ADD KEY `action_type` (`action_type`),
  ADD KEY `add_time` (`add_time`);
  

ALTER TABLE `notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;  

 


--
-- Таблицы `users_notification_setting`
--

CREATE TABLE `users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `data` text COMMENT 'Информация'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `users_notification_setting`
  ADD PRIMARY KEY (`notice_setting_id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `users_notification_setting`
  MODIFY `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- Индексы таблицы `auth_logins`
--
ALTER TABLE `auth_logins`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comment_link_id_2` (`comment_post_id`,`comment_date`),
  ADD KEY `comment_date` (`comment_date`),
  ADD KEY `comment_user_id` (`comment_user_id`,`comment_date`),
  ADD KEY `comment_post_id` (`comment_post_id`,`comment_order`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `post_date` (`post_date`),
  ADD KEY `post_user_id` (`post_user_id`,`post_date`);

--
-- Индексы таблицы `space`
--
ALTER TABLE `space`
  ADD PRIMARY KEY (`space_id`);

--
-- Индексы таблицы `space_hidden`
--
ALTER TABLE `space_hidden`
  ADD PRIMARY KEY (`hidden_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `votes_comm`
--
ALTER TABLE `votes_comm`
  ADD PRIMARY KEY (`votes_comm_id`),
  ADD KEY `votes_comm_item_id` (`votes_comm_item_id`,`votes_comm_user_id`),
  ADD KEY `votes_comm_ip` (`votes_comm_item_id`,`votes_comm_ip`),
  ADD KEY `votes_comm_user_id` (`votes_comm_user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `auth_logins`
--
ALTER TABLE `auth_logins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `space`
--
ALTER TABLE `space`
  MODIFY `space_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `space_hidden`
--
ALTER TABLE `space_hidden`
  MODIFY `hidden_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `votes_comm`
--
ALTER TABLE `votes_comm`
  MODIFY `votes_comm_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
