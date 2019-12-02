-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 28, 2019 at 01:06 AM
-- Server version: 5.7.27
-- PHP Version: 7.2.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cocode`
--

-- --------------------------------------------------------

--
-- Table structure for table `adonis_schema`
--

CREATE TABLE `adonis_schema` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `batch` int(11) DEFAULT NULL,
  `migration_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `adonis_schema`
--

INSERT INTO `adonis_schema` (`id`, `name`, `batch`, `migration_time`) VALUES
(17, '1503248427885_user', 1, '2019-05-14 08:07:36'),
(18, '1507839709797_post_schema', 1, '2019-05-14 08:07:36'),
(19, '1557820939803_create_permissions_table', 1, '2019-05-14 08:07:37'),
(20, '1557820939837_create_roles_table', 1, '2019-05-14 08:07:37'),
(21, '1557820939852_create_permission_role_table', 1, '2019-05-14 08:07:37'),
(22, '1557820939871_create_permission_user_table', 1, '2019-05-14 08:07:37'),
(23, '1557820939881_create_role_user_table', 1, '2019-05-14 08:07:38'),
(24, '1560321903332_alter_users_schema', 2, '2019-06-12 06:54:34'),
(25, '1566446088921_create_menu_schema', 3, '2019-08-22 07:21:48');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'create_user', 'Create_user', 'create users permission', '2019-05-14 18:51:49', '2019-05-14 18:51:49'),
(2, 'update_users', 'Update Users', 'update users permission', '2019-07-02 10:33:17', '2019-07-02 10:33:17'),
(3, 'delete_users', 'Delete Users', 'delete users permission', '2019-07-02 10:33:17', '2019-07-02 10:33:17'),
(4, 'read_users', 'Read Users', 'read users permission', '2019-07-02 10:33:17', '2019-07-02 10:33:17');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 2, 1, NULL, NULL),
(3, 3, 1, NULL, NULL),
(4, 4, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` text,
  `user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `slug`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'administrator', 'Administrator', 'manage administration privileges', '2019-07-02 10:40:51', '2019-07-02 10:40:51'),
(2, 'user', 'User', 'manage user privileges', '2019-07-02 10:40:51', '2019-07-02 10:40:51'),
(3, 'moderator', 'Moderator', 'help admin manage aplication', '2019-07-29 22:00:34', '2019-07-29 22:00:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(5, 3, 1, NULL, NULL),
(10, 2, 8, NULL, NULL),
(16, 2, 11, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `hp` varchar(255) DEFAULT NULL,
  `address` text,
  `lat` varchar(255) DEFAULT NULL,
  `long` varchar(255) DEFAULT NULL,
  `avatar` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `email`, `password`, `fullname`, `hp`, `address`, `lat`, `long`, `avatar`) VALUES
(1, '2019-05-14 15:07:55', '2019-05-14 15:07:55', 'admin', 'sandisunandar99@gmail.com', '$2a$10$iXcsB08gyvF1oc20WPn5ReTr51uZh5ZsduZUhCR1PxoFCKp3fmcEu', NULL, NULL, NULL, NULL, NULL, 'cocode.png'),
(8, '2019-08-27 11:41:41', '2019-08-27 11:41:41', 'sandi1', 'sandi1@sandi.com', '$2a$10$.eqzpAbGxk0fDNOLg4syzO2JTAOgex2.rNr.gBqp6HDwjUdOFvIM6', 'sandi1', '09898787', 'jl. abjabdjahda', NULL, NULL, 'sandi1.png'),
(11, '2019-10-25 17:14:33', '2019-10-27 20:49:10', 'dadang', 'dadang@dut.com', '$2a$10$vhaZF1/hC4pAqby01ZwIE.lh2hfobjU669Pmry/oQeoj.NBEJzp1.', 'dadang ', '0809808', 'jl. sukamenak', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_permission`
-- (See below for the actual view)
--
CREATE TABLE `v_user_permission` (
`user_id` int(10) unsigned
,`username` varchar(80)
,`permissions_id` int(10) unsigned
,`permission` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_role`
-- (See below for the actual view)
--
CREATE TABLE `v_user_role` (
`user_id` int(10) unsigned
,`username` varchar(80)
,`roles_id` int(10) unsigned
,`roles` varchar(255)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_user_role_permission`
-- (See below for the actual view)
--
CREATE TABLE `v_user_role_permission` (
`user_id` int(10) unsigned
,`username` varchar(80)
,`roles_id` int(10) unsigned
,`roles` varchar(255)
,`permissions_id` int(10) unsigned
,`permission` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `v_user_permission`
--
DROP TABLE IF EXISTS `v_user_permission`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_permission`  AS  select `x`.`id` AS `user_id`,`x`.`username` AS `username`,`b`.`id` AS `permissions_id`,`b`.`slug` AS `permission` from ((`users` `x` left join `permission_user` `a` on((`x`.`id` = `a`.`user_id`))) left join `permissions` `b` on((`a`.`permission_id` = `b`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_user_role`
--
DROP TABLE IF EXISTS `v_user_role`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_role`  AS  select `x`.`id` AS `user_id`,`x`.`username` AS `username`,`b`.`id` AS `roles_id`,`b`.`slug` AS `roles` from ((`users` `x` left join `role_user` `a` on((`x`.`id` = `a`.`user_id`))) left join `roles` `b` on((`a`.`role_id` = `b`.`id`))) ;

-- --------------------------------------------------------

--
-- Structure for view `v_user_role_permission`
--
DROP TABLE IF EXISTS `v_user_role_permission`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_user_role_permission`  AS  select `x`.`id` AS `user_id`,`x`.`username` AS `username`,`b`.`id` AS `roles_id`,`b`.`slug` AS `roles`,`f`.`id` AS `permissions_id`,`f`.`slug` AS `permission` from (((((`users` `x` left join `role_user` `a` on((`x`.`id` = `a`.`user_id`))) left join `roles` `b` on((`a`.`role_id` = `b`.`id`))) left join `permission_role` `c` on((`a`.`role_id` = `c`.`role_id`))) left join `roles` `e` on((`c`.`role_id` = `e`.`id`))) left join `permissions` `f` on((`c`.`permission_id` = `f`.`id`))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_slug_unique` (`slug`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_user_permission_id_index` (`permission_id`),
  ADD KEY `permission_user_user_id_index` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_slug_unique` (`slug`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_index` (`role_id`),
  ADD KEY `role_user_user_id_index` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adonis_schema`
--
ALTER TABLE `adonis_schema`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD CONSTRAINT `permission_user_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
