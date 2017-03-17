-- phpMyAdmin SQL Dump
-- version 4.4.13.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 16, 2017 at 11:06 PM
-- Server version: 10.0.29-MariaDB-cll-lve
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ezcmscom_sbd639-1`
--

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE IF NOT EXISTS `clinic` (
  `clinic_id` bigint(20) unsigned NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_sanmax_hosting` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `contact_info` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`clinic_id`, `status`, `domain`, `is_sanmax_hosting`, `contact_info`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 0, '', '1', NULL, NULL, NULL, '2017-03-15 14:49:12', '2017-03-15 14:49:12'),
(5, 0, '', '1', NULL, NULL, NULL, '2017-03-15 14:58:17', '2017-03-15 14:58:17'),
(6, 0, '', '1', NULL, NULL, NULL, '2017-03-15 15:22:22', '2017-03-15 15:22:22'),
(7, 0, '', '1', NULL, NULL, NULL, '2017-03-15 15:28:38', '2017-03-15 15:28:38'),
(8, 0, '', '1', NULL, NULL, NULL, '2017-03-15 16:27:47', '2017-03-15 16:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_database`
--

CREATE TABLE IF NOT EXISTS `clinic_database` (
  `clinic_database_id` bigint(20) unsigned NOT NULL,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `database_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `table_prefix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinic_database`
--

INSERT INTO `clinic_database` (`clinic_database_id`, `clinic_id`, `host`, `port`, `database_name`, `table_prefix`, `username`, `password`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 4, '', NULL, '', NULL, '', '$2y$10$IVKn24mS.2oB59G5QwZD0ukF0R28u5TtzSk9X7naAQw2G3pDoeQ1i', NULL, NULL, '2017-03-15 14:49:12', '2017-03-15 14:49:12'),
(5, 5, '', NULL, '', NULL, '', '$2y$10$RsYF7fEyMWdJahYA2XJLNeXSMuC6EuxIhoxcieNsut4xaWKfgmfCW', NULL, NULL, '2017-03-15 14:58:17', '2017-03-15 14:58:17'),
(6, 6, '', NULL, '', NULL, '', '$2y$10$/zt8v.POyh/omZ1r0kaMqOmqCp2khAy7qVDJln4/76OXLgCoaGjQC', NULL, NULL, '2017-03-15 15:22:22', '2017-03-15 15:22:22'),
(7, 7, '', NULL, '', NULL, '', '$2y$10$PUVBv8IV47nMfp3X6kZU8.WgRb2Hv/Pg6TrT40y/tUFeKAjN1t/2O', NULL, NULL, '2017-03-15 15:28:38', '2017-03-15 15:28:38'),
(8, 8, '', NULL, '', NULL, '', '$2y$10$ZZaVEUTIVsHwnb08XeBPoeBj7vrLwIdFGB5JzqhKXEKXAroSxMOpK', NULL, NULL, '2017-03-15 16:27:47', '2017-03-15 16:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_hosting`
--

CREATE TABLE IF NOT EXISTS `clinic_hosting` (
  `clinic_hosting_id` bigint(20) unsigned NOT NULL,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinic_hosting`
--

INSERT INTO `clinic_hosting` (`clinic_hosting_id`, `clinic_id`, `host`, `port`, `username`, `password`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 4, '', NULL, '', '$2y$10$4by9HJIbi4z/k/z5M6xKguoZCIwAmJriIVReXziyMeeDJ42I/x71W', NULL, NULL, '2017-03-15 14:49:13', '2017-03-15 14:49:13'),
(5, 5, '', NULL, '', '$2y$10$YMDNOGwVEYqOJeO3H0lSOujRZ5SLgsQf3yLAkgqO9DJMHr.8/Mpxq', NULL, NULL, '2017-03-15 14:58:17', '2017-03-15 14:58:17'),
(6, 6, '', NULL, '', '$2y$10$5CUdyuTjBVXOc8f1zpO7sOxON4Qmu3LOXzkTE4R3mIcwip0i7cwyC', NULL, NULL, '2017-03-15 15:22:22', '2017-03-15 15:22:22'),
(7, 7, '', NULL, '', '$2y$10$i3/DBQQ27XhranrFmI1QYuIXM50kTa87kemDqxNKq9RJPncj4Q.YO', NULL, NULL, '2017-03-15 15:28:38', '2017-03-15 15:28:38'),
(8, 8, '', NULL, '', '$2y$10$dBTXMmjOQvHzk2f52jYwpu5KralxKo5tzBqzPfm.XMXE7Ee9ehUR2', NULL, NULL, '2017-03-15 16:27:48', '2017-03-15 16:27:48');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_info`
--

CREATE TABLE IF NOT EXISTS `clinic_info` (
  `clinic_info_id` bigint(20) unsigned NOT NULL,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `telephone` int(11) NOT NULL DEFAULT '0',
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_slogan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinic_info`
--

INSERT INTO `clinic_info` (`clinic_info_id`, `clinic_id`, `telephone`, `address`, `site_name`, `site_slogan`, `username`, `email`, `password`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(4, 4, 1212, 'qwqw qư', 'dan tri', NULL, 'themanhss', 'abc@gmail.com', NULL, NULL, NULL, '2017-03-15 14:49:12', '2017-03-15 14:49:12'),
(5, 5, 1212, 'qwqw qư', 'kenh 14', NULL, 'themanhss', 'abc@gmail.com', NULL, NULL, NULL, '2017-03-15 14:58:17', '2017-03-15 14:58:17'),
(6, 6, 1212, 'Dương Quảng Hàm', 'van hoc nghe thuat', NULL, 'themanhss', 'abc@gmail.com', NULL, NULL, NULL, '2017-03-15 15:22:22', '2017-03-15 15:22:22'),
(7, 7, 1212, 'qwqw qư', 'bong da trong nuoc', NULL, 'themanhss', 'abc@gmail.com', NULL, NULL, NULL, '2017-03-15 15:28:38', '2017-03-15 15:28:38'),
(8, 8, 1212, 'qwqw qư', 'giai tri cuoi tuan', NULL, 'themanhss', 'abc@gmail.com', NULL, NULL, NULL, '2017-03-15 16:27:47', '2017-03-15 16:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `clinic_language`
--

CREATE TABLE IF NOT EXISTS `clinic_language` (
  `clinic_language_id` bigint(20) unsigned NOT NULL,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language_id` bigint(20) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clinic_theme`
--

CREATE TABLE IF NOT EXISTS `clinic_theme` (
  `clinic_theme_id` bigint(20) unsigned NOT NULL,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `theme_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clinic_theme`
--

INSERT INTO `clinic_theme` (`clinic_theme_id`, `clinic_id`, `theme_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
(20, 4, 5, '2017-03-15 14:49:13', '2017-03-15 14:49:13', NULL),
(21, 4, 6, '2017-03-15 14:49:13', '2017-03-15 14:49:13', NULL),
(22, 4, 7, '2017-03-15 14:49:13', '2017-03-15 14:49:13', NULL),
(23, 5, 8, '2017-03-15 14:58:17', '2017-03-15 14:58:17', NULL),
(24, 5, 5, '2017-03-15 14:58:17', '2017-03-15 14:58:17', NULL),
(25, 5, 6, '2017-03-15 14:58:18', '2017-03-15 14:58:18', NULL),
(26, 6, 5, '2017-03-15 15:22:22', '2017-03-15 15:22:22', NULL),
(27, 6, 6, '2017-03-15 15:22:22', '2017-03-15 15:22:22', NULL),
(28, 6, 7, '2017-03-15 15:22:22', '2017-03-15 15:22:22', NULL),
(29, 7, 5, '2017-03-15 15:28:39', '2017-03-15 15:28:39', NULL),
(30, 7, 8, '2017-03-15 15:28:39', '2017-03-15 15:28:39', NULL),
(31, 7, 7, '2017-03-15 15:28:39', '2017-03-15 15:28:39', NULL),
(32, 8, 5, '2017-03-15 16:27:48', '2017-03-15 16:27:48', NULL),
(33, 8, 6, '2017-03-15 16:27:48', '2017-03-15 16:27:48', NULL),
(34, 8, 7, '2017-03-15 16:27:48', '2017-03-15 16:27:48', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `parent` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
  `country_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`country_id`, `name`, `locale`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Netherlands', 'nl', NULL, NULL, NULL),
(2, 'English', 'en', NULL, NULL, NULL),
(3, 'Rusia', 'ru', NULL, NULL, NULL),
(4, 'Tây Ban Nha', 'tu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `galleries`
--

CREATE TABLE IF NOT EXISTS `galleries` (
  `id` bigint(20) unsigned NOT NULL,
  `gallery_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gallery_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_images`
--

CREATE TABLE IF NOT EXISTS `gallery_images` (
  `id` bigint(20) unsigned NOT NULL,
  `gallery_id` bigint(20) unsigned NOT NULL,
  `image_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_description` text COLLATE utf8_unicode_ci NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` bigint(20) unsigned NOT NULL,
  `country_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `country_id`, `name`, `image`, `description`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(10, 2, 'English', '', '', 1, NULL, NULL, NULL),
(11, 1, 'Netherlands', '', '', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_roles_table', 1),
('2014_10_12_000001_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_06_05_151525_create_table_articles', 1),
('2016_07_22_213333_create_table_term_relationships', 1),
('2016_07_23_103628_create_table_term_taxonomy', 1),
('2016_07_23_103647_create_table_terms', 1),
('2016_07_23_105531_create_table_article_meta', 1),
('2016_08_18_143846_create_options_table', 1),
('2016_08_24_190534_create_table_themes', 1),
('2016_08_25_151736_create_table_theme_meta', 1),
('2016_08_26_082921_create_table_widget_groups', 1),
('2016_08_26_082938_create_table_widget', 1),
('2016_08_31_100931_create_table_user_meta', 1),
('2016_08_31_151324_create_table_comments', 1),
('2016_11_01_081606_galleries', 1),
('2016_11_01_081617_gallery_images', 1),
('2016_11_03_153632_create_contacts_table', 1),
('2016_11_11_035809_add_provider_to_users_table', 1),
('2017_02_17_072353_create_clinic_table', 1),
('2017_02_17_075212_create_clinic_database_table', 2),
('2017_02_17_075510_create_clinic_hosting_table', 2),
('2017_02_17_075520_create_clinic_info_table', 3),
('2017_02_17_091202_create_post_translations_table', 3),
('2017_02_17_092510_create_countries_table', 3),
('2017_02_17_092547_create_language_table', 3),
('2017_02_17_092951_create_clinic_language_table', 3),
('2017_02_21_033231_create_theme_type_table', 4),
('2017_02_21_034328_add_publish_parent_to_theme_table', 5),
('2017_02_28_071937_drop_theme_id_from_clinic_table', 5),
('2017_02_28_080337_create_clinic_theme_table', 6),
('2017_02_28_102355_add_status_to_clinic_table', 7),
('2017_03_02_121655_add_field_machine_name_to_themes', 8),
('2017_03_03_074358_add_telephone_to_clinic_info_table', 9),
('2017_03_07_071127_update_foreign_key_language_table', 10),
('2017_03_13_025012_add_status_to_language_table', 11),
('2017_03_13_033156_translate_table', 11),
('2017_03_14_125332_create_term_translations_tabel', 11);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `value`) VALUES
(1, 'site_title', 'QSoft Vietnam'),
(2, 'site_tagline', 'Content Management System'),
(3, 'email_administrator', 'hoaitn@qsoft.com.vn'),
(4, 'frontpage_blog', '0'),
(5, 'view_post_index', '10'),
(6, 'image_thumbnail_width', '150'),
(7, 'image_thumbnail_height', '150'),
(8, 'image_medium_width', '300'),
(9, 'image_medium_height', '300'),
(10, 'image_large_width', '1024'),
(11, 'image_large_height', '800'),
(12, 'menu_name', 'a:1:{i:0;s:9:"main-menu";}'),
(13, 'show_on_front', 'page'),
(14, 'page_on_front', '22');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) unsigned NOT NULL,
  `post_author` int(10) unsigned NOT NULL DEFAULT '0',
  `post_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `post_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_parent` bigint(20) NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `post_hit` int(11) NOT NULL DEFAULT '0',
  `post_mime_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'post',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_author`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `post_password`, `post_name`, `post_parent`, `guid`, `menu_order`, `menu_group`, `post_type`, `post_hit`, `post_mime_type`, `created_at`, `updated_at`) VALUES
(29, 1, '', '', '', 'publish', 'close', '', 'home', 0, '', 3, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-16 11:03:26', '2017-03-16 11:10:24'),
(30, 1, '', '', '', 'publish', 'close', '', 'blog', 0, '', 4, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-16 11:03:26', '2017-03-16 11:10:24'),
(31, 1, '', '', '', 'publish', 'open', '', '22', 0, '', 0, '', 'page', 0, 'post', '2017-03-16 11:05:20', '2017-03-16 11:05:20'),
(32, 1, '', '', '', 'publish', 'close', '', 'a', 0, '', 0, '', 'post', 0, 'post', '2017-03-16 11:06:24', '2017-03-16 11:06:24'),
(33, 1, '', '', '', 'publish', 'close', '', '22', 0, '', 2, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-16 11:06:58', '2017-03-16 11:10:24'),
(34, 1, '', '', '', 'publish', 'close', '', 'post-blog-eng', 0, '', 0, '', 'post', 0, 'post', '2017-03-16 11:07:59', '2017-03-16 11:07:59'),
(35, 1, '', '', '', 'inherit', 'open', '', '8616670b3f511795137c65ef0151c3f2.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-16 11:09:37', '2017-03-16 11:09:37'),
(36, 1, '', '', '', 'publish', 'open', '', 'blog-eng', 0, '', 0, '', 'page', 0, 'post', '2017-03-16 11:10:00', '2017-03-16 11:10:00'),
(37, 1, '', '', '', 'publish', 'close', '', 'blog-eng', 0, '', 1, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-16 11:10:14', '2017-03-16 11:10:24'),
(38, 1, '', '', '', 'publish', 'open', '', 'ad', 0, '', 0, '', 'page', 0, 'post', '2017-03-16 15:28:00', '2017-03-16 15:28:00'),
(39, 1, '', '', '', 'publish', 'open', '', 'sd', 0, '', 0, '', 'page', 0, 'post', '2017-03-16 15:33:14', '2017-03-16 15:33:14');

-- --------------------------------------------------------

--
-- Table structure for table `post_meta`
--

CREATE TABLE IF NOT EXISTS `post_meta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_meta`
--

INSERT INTO `post_meta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 29, '_nav_item_parent', ''),
(2, 29, '_nav_item_url', ''),
(3, 29, '_nav_item_type', 'home'),
(4, 30, '_nav_item_parent', ''),
(5, 30, '_nav_item_url', 'blog'),
(6, 30, '_nav_item_type', 'home'),
(7, 31, 'layout', ''),
(8, 31, 'featured_img', ''),
(9, 32, 'layout', ''),
(10, 32, 'featured_img', ''),
(11, 33, '_nav_item_parent', ''),
(12, 33, '_nav_item_url', '22'),
(13, 33, '_nav_item_type', 'page'),
(14, 34, 'layout', ''),
(15, 34, 'featured_img', ''),
(16, 35, '_file_size', '106600'),
(17, 36, 'layout', ''),
(18, 36, 'featured_img', 'http://sbd639-2.2ezcms.com/public/uploads/8616670b3f511795137c65ef0151c3f2.jpg'),
(19, 37, '_nav_item_parent', ''),
(20, 37, '_nav_item_url', 'blog-eng'),
(21, 37, '_nav_item_type', 'page'),
(22, 38, 'layout', ''),
(23, 38, 'featured_img', ''),
(24, 39, 'layout', ''),
(25, 39, 'featured_img', '');

-- --------------------------------------------------------

--
-- Table structure for table `post_translations`
--

CREATE TABLE IF NOT EXISTS `post_translations` (
  `post_translations_id` bigint(20) unsigned NOT NULL,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `post_content` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `post_translations`
--

INSERT INTO `post_translations` (`post_translations_id`, `post_id`, `locale`, `post_title`, `post_excerpt`, `deleted_at`, `created_at`, `updated_at`, `post_content`) VALUES
(1, 29, 'nl', 'Home', '', NULL, '2017-03-16 11:03:26', '2017-03-16 11:03:26', ''),
(2, 29, 'en', 'Home', '', NULL, '2017-03-16 11:03:26', '2017-03-16 11:03:26', ''),
(3, 30, 'nl', 'Blog', '', NULL, '2017-03-16 11:03:26', '2017-03-16 11:03:26', ''),
(4, 30, 'en', 'Blog', '', NULL, '2017-03-16 11:03:26', '2017-03-16 11:03:26', ''),
(5, 31, 'nl', '11', '', NULL, '2017-03-16 11:05:20', '2017-03-16 11:05:20', '<p>11</p>'),
(6, 31, 'en', '22', '', NULL, '2017-03-16 11:05:20', '2017-03-16 11:05:20', '<p>22</p>'),
(7, 32, 'nl', 'è', '', NULL, '2017-03-16 11:06:24', '2017-03-16 11:06:24', '<p>à<br></p>'),
(8, 32, 'en', 'à', '', NULL, '2017-03-16 11:06:24', '2017-03-16 11:06:24', '<p>sf<br></p>'),
(9, 33, 'nl', '11', '', NULL, '2017-03-16 11:06:58', '2017-03-16 11:06:58', ''),
(10, 33, 'en', '22', '', NULL, '2017-03-16 11:06:58', '2017-03-16 11:06:58', ''),
(11, 34, 'nl', 'post blog ne', '', NULL, '2017-03-16 11:07:59', '2017-03-16 11:07:59', ''),
(12, 34, 'en', 'post blog eng', '', NULL, '2017-03-16 11:07:59', '2017-03-16 11:07:59', '<p>ádfd<br></p>'),
(13, 35, 'en', '8616670b3f511795137c65ef0151c3f2', '', NULL, '2017-03-16 11:09:37', '2017-03-16 11:09:37', ''),
(14, 36, 'nl', 'blog ne', '', NULL, '2017-03-16 11:10:00', '2017-03-16 11:10:00', ''),
(15, 36, 'en', 'blog eng', '', NULL, '2017-03-16 11:10:00', '2017-03-16 11:10:00', '<p>af<br></p>'),
(16, 37, 'nl', 'blog ne', '', NULL, '2017-03-16 11:10:14', '2017-03-16 11:10:14', ''),
(17, 37, 'en', 'blog eng', '', NULL, '2017-03-16 11:10:14', '2017-03-16 11:10:14', ''),
(18, 38, 'nl', 'werf', '', NULL, '2017-03-16 15:28:00', '2017-03-16 15:28:00', '<p>eswf<br></p>'),
(19, 38, 'en', 'ad', '', NULL, '2017-03-16 15:28:00', '2017-03-16 15:28:00', '<p>qwd<br></p>'),
(20, 39, 'nl', '', '', NULL, '2017-03-16 15:33:14', '2017-03-16 15:33:14', ''),
(21, 39, 'en', 'sd', '', NULL, '2017-03-16 15:33:14', '2017-03-16 15:33:14', '<p>sg<br></p>');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint(20) unsigned NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` longtext COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `type`, `permission`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Administrator', 'This is supper admin', 'admin', '{"page":["index","create","edit","update","destroy"],"post":["index","create","edit","update","destroy"],"category":["index","create","edit","update","destroy"],"tag":["index","create","edit","update","destroy"],"comment":["approve","destroy"],"menu":["index","create","edit","update","destroy"],"media":["index","upload","destroy"],"theme":["index","edit","destroy"],"widget":["index","create","edit","destroy"],"gallery":["index","create","edit","destroy"],"gallery-images":["index","create","edit","destroy"],"contacts":["index","destroy"],"roles":["index","create","edit","destroy"],"users":["create","edit","destroy","profile"],"setting":["index"]}', 1, '2017-02-20 16:05:33', '2017-02-20 16:05:33', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE IF NOT EXISTS `terms` (
  `term_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxonomy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_group` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `term_relationships`
--

CREATE TABLE IF NOT EXISTS `term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `term_translations`
--

CREATE TABLE IF NOT EXISTS `term_translations` (
  `id` bigint(20) unsigned NOT NULL,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id` bigint(20) unsigned NOT NULL,
  `machine_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` bigint(20) NOT NULL DEFAULT '0',
  `is_publish` bigint(20) NOT NULL DEFAULT '0',
  `theme_type_id` bigint(20) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `author_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image_preview` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `machine_name`, `parent_id`, `is_publish`, `theme_type_id`, `name`, `version`, `author`, `author_url`, `description`, `image_preview`, `status`) VALUES
(5, 'Sanmax58c8e4fc0d1e4', 0, 1, 1, 'Sanmax Simple', '1.0.0', 'Sanmax', '#', 'Clinic simple template', 'http://sbd639.local/themes/Sanmax58c8e4fc0d1e4/images/preview.jpg', 1),
(6, 'Sanmax58c8e55781d52', 5, 1, 1, 'simple_manhnt', '1.0.0', 'Sanmax', '#', 'Clinic simple template', 'http://sbd639.local/themes/Sanmax58c8e4fc0d1e4/images/preview.jpg', 0),
(7, 'Sanmax58c8e663d5574', 5, 1, 1, 'simple_kiki', '1.0.0', 'Sanmax', '#', 'Clinic simple template', 'http://sbd639.local/themes/Sanmax58c8e4fc0d1e4/images/preview.jpg', 0),
(8, 'Sanmax58c8ea865655a', 5, 1, 1, 'simple_momo', '1.0.0', 'Sanmax', '#', 'Clinic simple template', 'http://sbd639.local/themes/Sanmax58c8e4fc0d1e4/images/preview.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `theme_meta`
--

CREATE TABLE IF NOT EXISTS `theme_meta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `theme_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_meta`
--

INSERT INTO `theme_meta` (`meta_id`, `theme_id`, `meta_group`, `meta_key`, `meta_value`) VALUES
(33, 5, 'menu_position', 'menu-top', 'main-menu'),
(34, 5, 'menu_position', 'menu-bottom', ''),
(35, 5, 'menu_position', 'menu-left', ''),
(36, 5, 'menu_position', 'menu-right', ''),
(37, 5, 'options', 'general', 'a:4:{i:0;a:4:{s:4:"name";s:4:"logo";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:4:"Logo";}i:1;a:4:{s:4:"name";s:16:"background_image";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:16:"Background image";}i:2;a:4:{s:4:"name";s:9:"copyright";s:4:"type";s:4:"text";s:5:"value";s:28:"Copyright &copy; 2016 ITLSVN";s:5:"label";s:14:"Copyright Text";}i:3;a:4:{s:4:"name";s:9:"customcss";s:4:"type";s:8:"textarea";s:5:"value";s:0:"";s:5:"label";s:10:"Custom CSS";}}'),
(38, 5, 'options', 'social_media', 'a:4:{i:0;a:4:{s:4:"name";s:8:"facebook";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:8:"Facebook";}i:1;a:4:{s:4:"name";s:7:"twitter";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Twitter";}i:2;a:4:{s:4:"name";s:11:"google_plus";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:11:"Google Plus";}i:3;a:4:{s:4:"name";s:7:"youtube";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Youtube";}}'),
(39, 5, 'options', 'layouts', 'a:1:{i:0;a:6:{s:4:"name";s:12:"layout_style";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"right-sidebar";s:13:"Right Sidebar";s:12:"left-sidebar";s:12:"Left Sidebar";s:12:"none-sidebar";s:12:"None Sidebar";s:14:"center-content";s:14:"Center Content";}s:5:"value";a:3:{s:13:"right-sidebar";s:13:"Right Sidebar";s:12:"left-sidebar";s:12:"Left Sidebar";s:14:"center-content";s:14:"Center Content";}s:6:"xvalue";a:1:{s:7:"default";s:13:"right-sidebar";}s:5:"label";s:12:"Layout Style";}}'),
(40, 5, 'options', 'typography', 'a:7:{i:0;a:4:{s:4:"name";s:10:"site_title";s:5:"label";s:10:"Site title";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"20px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"25px";s:4:"25px";s:4:"26px";s:4:"26px";s:4:"27px";s:4:"27px";s:4:"28px";s:4:"28px";s:4:"29px";s:4:"29px";s:4:"30px";s:4:"30px";s:4:"31px";s:4:"31px";s:4:"32px";s:4:"32px";s:4:"33px";s:4:"33px";s:4:"34px";s:4:"34px";s:4:"35px";s:4:"35px";}}}}i:1;a:4:{s:4:"name";s:6:"slogan";s:5:"label";s:6:"Slogan";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:2;a:4:{s:4:"name";s:4:"page";s:5:"label";s:4:"Text";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:3;a:4:{s:4:"name";s:4:"link";s:5:"label";s:4:"Link";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";}}i:3;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:11:"Hover color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:4;a:4:{s:4:"name";s:6:"button";s:5:"label";s:6:"Button";s:4:"type";s:8:"fieldset";s:5:"items";a:6:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:16:"Text hover color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:2;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#f48100";s:4:"type";s:11:"colorpicker";}i:4;a:4:{s:4:"name";s:22:"background_hover_color";s:5:"label";s:22:"Background hover color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:5;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:5;a:4:{s:4:"name";s:6:"header";s:5:"label";s:6:"Header";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:6;a:4:{s:4:"name";s:6:"footer";s:5:"label";s:6:"Footer";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#fafafa";s:4:"type";s:11:"colorpicker";}}}}'),
(41, 6, 'menu_position', 'menu-top', ''),
(42, 6, 'menu_position', 'menu-bottom', ''),
(43, 6, 'menu_position', 'menu-left', ''),
(44, 6, 'menu_position', 'menu-right', ''),
(45, 6, 'options', 'general', 'a:4:{i:0;a:4:{s:4:"name";s:4:"logo";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:4:"Logo";}i:1;a:4:{s:4:"name";s:16:"background_image";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:16:"Background image";}i:2;a:4:{s:4:"name";s:9:"copyright";s:4:"type";s:4:"text";s:5:"value";s:28:"Copyright &copy; 2016 ITLSVN";s:5:"label";s:14:"Copyright Text";}i:3;a:4:{s:4:"name";s:9:"customcss";s:4:"type";s:8:"textarea";s:5:"value";s:0:"";s:5:"label";s:10:"Custom CSS";}}'),
(46, 6, 'options', 'social_media', 'a:4:{i:0;a:4:{s:4:"name";s:8:"facebook";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:8:"Facebook";}i:1;a:4:{s:4:"name";s:7:"twitter";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Twitter";}i:2;a:4:{s:4:"name";s:11:"google_plus";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:11:"Google Plus";}i:3;a:4:{s:4:"name";s:7:"youtube";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Youtube";}}'),
(47, 6, 'options', 'layouts', 'a:1:{i:0;a:6:{s:4:"name";s:12:"layout_style";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"right-sidebar";s:13:"Right Sidebar";s:12:"left-sidebar";s:12:"Left Sidebar";s:12:"none-sidebar";s:12:"None Sidebar";s:14:"center-content";s:14:"Center Content";}s:5:"value";a:4:{s:13:"right-sidebar";s:13:"right-sidebar";s:12:"left-sidebar";s:12:"left-sidebar";s:12:"none-sidebar";s:12:"none-sidebar";s:14:"center-content";s:14:"center-content";}s:6:"xvalue";a:1:{s:7:"default";s:13:"right-sidebar";}s:5:"label";s:12:"Layout Style";}}'),
(48, 6, 'options', 'typography', 'a:7:{i:0;a:4:{s:4:"name";s:10:"site_title";s:5:"label";s:10:"Site title";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"25px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"25px";s:4:"25px";s:4:"26px";s:4:"26px";s:4:"27px";s:4:"27px";s:4:"28px";s:4:"28px";s:4:"29px";s:4:"29px";s:4:"30px";s:4:"30px";s:4:"31px";s:4:"31px";s:4:"32px";s:4:"32px";s:4:"33px";s:4:"33px";s:4:"34px";s:4:"34px";s:4:"35px";s:4:"35px";}}}}i:1;a:4:{s:4:"name";s:6:"slogan";s:5:"label";s:6:"Slogan";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:2;a:4:{s:4:"name";s:4:"page";s:5:"label";s:4:"Text";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:3;a:4:{s:4:"name";s:4:"link";s:5:"label";s:4:"Link";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";}}i:3;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:11:"Hover color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:4;a:4:{s:4:"name";s:6:"button";s:5:"label";s:6:"Button";s:4:"type";s:8:"fieldset";s:5:"items";a:6:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:16:"Text hover color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:2;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#f48100";s:4:"type";s:11:"colorpicker";}i:4;a:4:{s:4:"name";s:22:"background_hover_color";s:5:"label";s:22:"Background hover color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:5;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:5;a:4:{s:4:"name";s:6:"header";s:5:"label";s:6:"Header";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:6;a:4:{s:4:"name";s:6:"footer";s:5:"label";s:6:"Footer";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#fafafa";s:4:"type";s:11:"colorpicker";}}}}'),
(49, 7, 'menu_position', 'menu-top', ''),
(50, 7, 'menu_position', 'menu-bottom', ''),
(51, 7, 'menu_position', 'menu-left', ''),
(52, 7, 'menu_position', 'menu-right', ''),
(53, 7, 'options', 'general', 'a:4:{i:0;a:4:{s:4:"name";s:4:"logo";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:4:"Logo";}i:1;a:4:{s:4:"name";s:16:"background_image";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:16:"Background image";}i:2;a:4:{s:4:"name";s:9:"copyright";s:4:"type";s:4:"text";s:5:"value";s:28:"Copyright &copy; 2016 ITLSVN";s:5:"label";s:14:"Copyright Text";}i:3;a:4:{s:4:"name";s:9:"customcss";s:4:"type";s:8:"textarea";s:5:"value";s:0:"";s:5:"label";s:10:"Custom CSS";}}'),
(54, 7, 'options', 'social_media', 'a:4:{i:0;a:4:{s:4:"name";s:8:"facebook";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:8:"Facebook";}i:1;a:4:{s:4:"name";s:7:"twitter";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Twitter";}i:2;a:4:{s:4:"name";s:11:"google_plus";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:11:"Google Plus";}i:3;a:4:{s:4:"name";s:7:"youtube";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Youtube";}}'),
(55, 7, 'options', 'layouts', 'a:1:{i:0;a:6:{s:4:"name";s:12:"layout_style";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"right-sidebar";s:13:"Right Sidebar";s:12:"left-sidebar";s:12:"Left Sidebar";s:12:"none-sidebar";s:12:"None Sidebar";s:14:"center-content";s:14:"Center Content";}s:5:"value";a:4:{s:13:"right-sidebar";s:13:"right-sidebar";s:12:"left-sidebar";s:12:"left-sidebar";s:12:"none-sidebar";s:12:"none-sidebar";s:14:"center-content";s:14:"center-content";}s:6:"xvalue";a:1:{s:7:"default";s:13:"right-sidebar";}s:5:"label";s:12:"Layout Style";}}'),
(56, 7, 'options', 'typography', 'a:7:{i:0;a:4:{s:4:"name";s:10:"site_title";s:5:"label";s:10:"Site title";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"25px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"25px";s:4:"25px";s:4:"26px";s:4:"26px";s:4:"27px";s:4:"27px";s:4:"28px";s:4:"28px";s:4:"29px";s:4:"29px";s:4:"30px";s:4:"30px";s:4:"31px";s:4:"31px";s:4:"32px";s:4:"32px";s:4:"33px";s:4:"33px";s:4:"34px";s:4:"34px";s:4:"35px";s:4:"35px";}}}}i:1;a:4:{s:4:"name";s:6:"slogan";s:5:"label";s:6:"Slogan";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:2;a:4:{s:4:"name";s:4:"page";s:5:"label";s:4:"Text";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:3;a:4:{s:4:"name";s:4:"link";s:5:"label";s:4:"Link";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";}}i:3;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:11:"Hover color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:4;a:4:{s:4:"name";s:6:"button";s:5:"label";s:6:"Button";s:4:"type";s:8:"fieldset";s:5:"items";a:6:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:16:"Text hover color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:2;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#f48100";s:4:"type";s:11:"colorpicker";}i:4;a:4:{s:4:"name";s:22:"background_hover_color";s:5:"label";s:22:"Background hover color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:5;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:5;a:4:{s:4:"name";s:6:"header";s:5:"label";s:6:"Header";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:6;a:4:{s:4:"name";s:6:"footer";s:5:"label";s:6:"Footer";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#fafafa";s:4:"type";s:11:"colorpicker";}}}}'),
(57, 8, 'menu_position', 'menu-top', ''),
(58, 8, 'menu_position', 'menu-bottom', ''),
(59, 8, 'menu_position', 'menu-left', ''),
(60, 8, 'menu_position', 'menu-right', ''),
(61, 8, 'options', 'general', 'a:4:{i:0;a:4:{s:4:"name";s:4:"logo";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:4:"Logo";}i:1;a:4:{s:4:"name";s:16:"background_image";s:4:"type";s:12:"input_upload";s:5:"value";s:0:"";s:5:"label";s:16:"Background image";}i:2;a:4:{s:4:"name";s:9:"copyright";s:4:"type";s:4:"text";s:5:"value";s:28:"Copyright &copy; 2016 ITLSVN";s:5:"label";s:14:"Copyright Text";}i:3;a:4:{s:4:"name";s:9:"customcss";s:4:"type";s:8:"textarea";s:5:"value";s:0:"";s:5:"label";s:10:"Custom CSS";}}'),
(62, 8, 'options', 'social_media', 'a:4:{i:0;a:4:{s:4:"name";s:8:"facebook";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:8:"Facebook";}i:1;a:4:{s:4:"name";s:7:"twitter";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Twitter";}i:2;a:4:{s:4:"name";s:11:"google_plus";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:11:"Google Plus";}i:3;a:4:{s:4:"name";s:7:"youtube";s:4:"type";s:4:"text";s:5:"value";s:0:"";s:5:"label";s:7:"Youtube";}}'),
(63, 8, 'options', 'layouts', 'a:1:{i:0;a:6:{s:4:"name";s:12:"layout_style";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"right-sidebar";s:13:"Right Sidebar";s:12:"left-sidebar";s:12:"Left Sidebar";s:12:"none-sidebar";s:12:"None Sidebar";s:14:"center-content";s:14:"Center Content";}s:5:"value";a:4:{s:13:"right-sidebar";s:13:"right-sidebar";s:12:"left-sidebar";s:12:"left-sidebar";s:12:"none-sidebar";s:12:"none-sidebar";s:14:"center-content";s:14:"center-content";}s:6:"xvalue";a:1:{s:7:"default";s:13:"right-sidebar";}s:5:"label";s:12:"Layout Style";}}'),
(64, 8, 'options', 'typography', 'a:7:{i:0;a:4:{s:4:"name";s:10:"site_title";s:5:"label";s:10:"Site title";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"25px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"25px";s:4:"25px";s:4:"26px";s:4:"26px";s:4:"27px";s:4:"27px";s:4:"28px";s:4:"28px";s:4:"29px";s:4:"29px";s:4:"30px";s:4:"30px";s:4:"31px";s:4:"31px";s:4:"32px";s:4:"32px";s:4:"33px";s:4:"33px";s:4:"34px";s:4:"34px";s:4:"35px";s:4:"35px";}}}}i:1;a:4:{s:4:"name";s:6:"slogan";s:5:"label";s:6:"Slogan";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:2;a:4:{s:4:"name";s:4:"page";s:5:"label";s:4:"Text";s:4:"type";s:8:"fieldset";s:5:"items";a:3:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:3;a:4:{s:4:"name";s:4:"link";s:5:"label";s:4:"Link";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"25px";s:4:"25px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";}}i:3;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:11:"Hover color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:4;a:4:{s:4:"name";s:6:"button";s:5:"label";s:6:"Button";s:4:"type";s:8:"fieldset";s:5:"items";a:6:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:4:{s:4:"name";s:11:"hover_color";s:5:"label";s:16:"Text hover color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:2;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:14:"Raleway-Medium";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#f48100";s:4:"type";s:11:"colorpicker";}i:4;a:4:{s:4:"name";s:22:"background_hover_color";s:5:"label";s:22:"Background hover color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:5;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"14px";s:4:"type";s:8:"combobox";s:7:"options";a:11:{s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";s:4:"17px";s:4:"17px";s:4:"18px";s:4:"18px";s:4:"19px";s:4:"19px";s:4:"20px";s:4:"20px";s:4:"21px";s:4:"21px";s:4:"22px";s:4:"22px";}}}}i:5;a:4:{s:4:"name";s:6:"header";s:5:"label";s:6:"Header";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#ffffff";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:13:"Raleway-Black";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#c2c7d1";s:4:"type";s:11:"colorpicker";}}}i:6;a:4:{s:4:"name";s:6:"footer";s:5:"label";s:6:"Footer";s:4:"type";s:8:"fieldset";s:5:"items";a:4:{i:0;a:4:{s:4:"name";s:5:"color";s:5:"label";s:10:"Text color";s:5:"value";s:7:"#222222";s:4:"type";s:11:"colorpicker";}i:1;a:5:{s:4:"name";s:11:"font_family";s:5:"label";s:11:"Font family";s:5:"value";s:12:"Raleway-Bold";s:4:"type";s:8:"combobox";s:7:"options";a:4:{s:13:"Raleway-Black";s:13:"Raleway Black";s:12:"Raleway-Bold";s:12:"Raleway Bold";s:14:"Raleway-Medium";s:14:"Raleway Medium";s:14:"Raleway-Italic";s:14:"Raleway Italic";}}i:2;a:5:{s:4:"name";s:9:"font_size";s:5:"label";s:9:"Font size";s:5:"value";s:4:"12px";s:4:"type";s:8:"combobox";s:7:"options";a:7:{s:4:"10px";s:4:"10px";s:4:"11px";s:4:"11px";s:4:"12px";s:4:"12px";s:4:"13px";s:4:"13px";s:4:"14px";s:4:"14px";s:4:"15px";s:4:"15px";s:4:"16px";s:4:"16px";}}i:3;a:4:{s:4:"name";s:16:"background_color";s:5:"label";s:16:"Background color";s:5:"value";s:7:"#fafafa";s:4:"type";s:11:"colorpicker";}}}}');

-- --------------------------------------------------------

--
-- Table structure for table `theme_type`
--

CREATE TABLE IF NOT EXISTS `theme_type` (
  `theme_type_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_type`
--

INSERT INTO `theme_type` (`theme_type_id`, `name`, `description`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Simple Site', '', NULL, NULL, NULL),
(2, 'Medium Site', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `translate`
--

CREATE TABLE IF NOT EXISTS `translate` (
  `id` int(10) unsigned NOT NULL,
  `trans_key` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `trans_meta` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `photo` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT '0',
  `provider` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `password`, `photo`, `description`, `is_admin`, `provider`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrator', 'henry.tran@qsoft.com.vn', '$2y$10$rRfP75dC/XJ39POKPe5ch.kNkG38EfvFB.Ju8UnWBW3b/6i9lmNA2', 'default-user.png', '', 1, 'local', 'k2uHqjWY1OOq6rOBi9JsNIAqPD6cJmM9cGDNNdbg6JStjbAw7KSYBuU2SgcQ', '2017-02-20 16:05:34', '2017-03-14 09:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE IF NOT EXISTS `user_meta` (
  `meta_id` bigint(20) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_meta`
--

INSERT INTO `user_meta` (`meta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-02-28 03:14:58";s:4:"desc";s:21:"Delete language id :5";}'),
(2, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-02-28 03:15:31";s:4:"desc";s:21:"Delete language id :2";}'),
(3, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-02-28 03:15:51";s:4:"desc";s:27:"Delete language id :6,4,3,1";}'),
(4, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-02-28 03:51:39";s:4:"desc";s:29:"Delete language id :undefined";}'),
(5, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-02-28 03:55:12";s:4:"desc";s:21:"Delete language id :8";}'),
(6, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-02 09:06:15";s:4:"desc";s:22:"Delete language id :41";}'),
(7, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 02:26:13";s:4:"desc";s:21:"Delete language id :7";}'),
(8, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 02:26:18";s:4:"desc";s:21:"Delete language id :9";}'),
(9, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 03:43:13";s:4:"desc";s:15:"Create page 333";}'),
(10, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 03:43:24";s:4:"desc";s:18:"Delete page id :25";}'),
(11, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 03:57:44";s:4:"desc";s:24:"Create page Homepage eng";}'),
(12, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 03:58:32";s:4:"desc";s:20:"Create page News eng";}'),
(13, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 04:05:20";s:4:"desc";s:14:"Create page 22";}'),
(14, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 04:06:24";s:4:"desc";s:14:"Create post à";}'),
(15, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 04:07:59";s:4:"desc";s:25:"Create post post blog eng";}'),
(16, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 04:10:00";s:4:"desc";s:20:"Create page blog eng";}'),
(17, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 08:28:00";s:4:"desc";s:14:"Create page ad";}'),
(18, 1, 'user_log', 'a:2:{s:4:"date";s:19:"2017-03-16 08:33:14";s:4:"desc";s:14:"Create page sd";}');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE IF NOT EXISTS `widgets` (
  `id` bigint(20) unsigned NOT NULL,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `class_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widget_groups`
--

CREATE TABLE IF NOT EXISTS `widget_groups` (
  `id` bigint(20) unsigned NOT NULL,
  `theme_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `widget_groups`
--

INSERT INTO `widget_groups` (`id`, `theme_id`, `name`) VALUES
(8, 5, 'post_slider'),
(9, 5, 'left_sidebar'),
(10, 5, 'right_sidebar'),
(11, 6, 'post_slider'),
(12, 6, 'left_sidebar'),
(13, 6, 'right_sidebar'),
(14, 7, 'post_slider'),
(15, 7, 'left_sidebar'),
(16, 7, 'right_sidebar'),
(17, 8, 'post_slider'),
(18, 8, 'left_sidebar'),
(19, 8, 'right_sidebar');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `clinic_database`
--
ALTER TABLE `clinic_database`
  ADD PRIMARY KEY (`clinic_database_id`),
  ADD KEY `clinic_database_clinic_id_foreign` (`clinic_id`);

--
-- Indexes for table `clinic_hosting`
--
ALTER TABLE `clinic_hosting`
  ADD PRIMARY KEY (`clinic_hosting_id`),
  ADD KEY `clinic_hosting_clinic_id_foreign` (`clinic_id`);

--
-- Indexes for table `clinic_info`
--
ALTER TABLE `clinic_info`
  ADD PRIMARY KEY (`clinic_info_id`),
  ADD KEY `clinic_info_clinic_id_foreign` (`clinic_id`);

--
-- Indexes for table `clinic_language`
--
ALTER TABLE `clinic_language`
  ADD PRIMARY KEY (`clinic_language_id`),
  ADD KEY `clinic_language_clinic_id_foreign` (`clinic_id`),
  ADD KEY `clinic_language_language_id_foreign` (`language_id`);

--
-- Indexes for table `clinic_theme`
--
ALTER TABLE `clinic_theme`
  ADD PRIMARY KEY (`clinic_theme_id`),
  ADD KEY `clinic_theme_clinic_id_foreign` (`clinic_id`),
  ADD KEY `clinic_theme_theme_id_foreign` (`theme_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `comments_email_unique` (`email`),
  ADD KEY `comments_post_id_index` (`post_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gallery_images_gallery_id_index` (`gallery_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `language_country_id_foreign` (`country_id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_post_author_foreign` (`post_author`);

--
-- Indexes for table `post_meta`
--
ALTER TABLE `post_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_meta_post_id_index` (`post_id`),
  ADD KEY `post_meta_meta_key_index` (`meta_key`);

--
-- Indexes for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD PRIMARY KEY (`post_translations_id`),
  ADD KEY `post_translations_post_id_foreign` (`post_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `terms_slug_index` (`slug`),
  ADD KEY `terms_name_index` (`name`),
  ADD KEY `terms_taxonomy_index` (`taxonomy`);

--
-- Indexes for table `term_relationships`
--
ALTER TABLE `term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_relationships_term_taxonomy_id_index` (`term_taxonomy_id`);

--
-- Indexes for table `term_translations`
--
ALTER TABLE `term_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `term_translations_term_id_foreign` (`term_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_meta`
--
ALTER TABLE `theme_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `theme_meta_theme_id_index` (`theme_id`),
  ADD KEY `theme_meta_meta_key_index` (`meta_key`);

--
-- Indexes for table `theme_type`
--
ALTER TABLE `theme_type`
  ADD PRIMARY KEY (`theme_type_id`);

--
-- Indexes for table `translate`
--
ALTER TABLE `translate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `user_meta_user_id_index` (`user_id`),
  ADD KEY `user_meta_meta_key_index` (`meta_key`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_group_id_index` (`group_id`);

--
-- Indexes for table `widget_groups`
--
ALTER TABLE `widget_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widget_groups_theme_id_index` (`theme_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clinic`
--
ALTER TABLE `clinic`
  MODIFY `clinic_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `clinic_database`
--
ALTER TABLE `clinic_database`
  MODIFY `clinic_database_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `clinic_hosting`
--
ALTER TABLE `clinic_hosting`
  MODIFY `clinic_hosting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `clinic_info`
--
ALTER TABLE `clinic_info`
  MODIFY `clinic_info_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `clinic_language`
--
ALTER TABLE `clinic_language`
  MODIFY `clinic_language_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `clinic_theme`
--
ALTER TABLE `clinic_theme`
  MODIFY `clinic_theme_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `country_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `gallery_images`
--
ALTER TABLE `gallery_images`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `post_meta`
--
ALTER TABLE `post_meta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `post_translations`
--
ALTER TABLE `post_translations`
  MODIFY `post_translations_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `term_translations`
--
ALTER TABLE `term_translations`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `theme_meta`
--
ALTER TABLE `theme_meta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `theme_type`
--
ALTER TABLE `theme_type`
  MODIFY `theme_type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `translate`
--
ALTER TABLE `translate`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_meta`
--
ALTER TABLE `user_meta`
  MODIFY `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `widget_groups`
--
ALTER TABLE `widget_groups`
  MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `clinic_database`
--
ALTER TABLE `clinic_database`
  ADD CONSTRAINT `clinic_database_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_hosting`
--
ALTER TABLE `clinic_hosting`
  ADD CONSTRAINT `clinic_hosting_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_info`
--
ALTER TABLE `clinic_info`
  ADD CONSTRAINT `clinic_info_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_language`
--
ALTER TABLE `clinic_language`
  ADD CONSTRAINT `clinic_language_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clinic_language_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE;

--
-- Constraints for table `clinic_theme`
--
ALTER TABLE `clinic_theme`
  ADD CONSTRAINT `clinic_theme_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `clinic_theme_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gallery_images`
--
ALTER TABLE `gallery_images`
  ADD CONSTRAINT `gallery_images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `language`
--
ALTER TABLE `language`
  ADD CONSTRAINT `language_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_post_author_foreign` FOREIGN KEY (`post_author`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_meta`
--
ALTER TABLE `post_meta`
  ADD CONSTRAINT `post_meta_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `post_translations`
--
ALTER TABLE `post_translations`
  ADD CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `term_translations`
--
ALTER TABLE `term_translations`
  ADD CONSTRAINT `term_translations_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_meta`
--
ALTER TABLE `theme_meta`
  ADD CONSTRAINT `theme_meta_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_meta`
--
ALTER TABLE `user_meta`
  ADD CONSTRAINT `user_meta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `widgets`
--
ALTER TABLE `widgets`
  ADD CONSTRAINT `widgets_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `widget_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `widget_groups`
--
ALTER TABLE `widget_groups`
  ADD CONSTRAINT `widget_groups_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
