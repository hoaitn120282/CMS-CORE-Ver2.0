/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : clinic-site

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2017-03-13 17:22:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clinic
-- ----------------------------
DROP TABLE IF EXISTS `clinic`;
CREATE TABLE `clinic` (
  `clinic_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `domain` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_sanmax_hosting` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `contact_info` text COLLATE utf8_unicode_ci,
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clinic
-- ----------------------------

-- ----------------------------
-- Table structure for clinic_database
-- ----------------------------
DROP TABLE IF EXISTS `clinic_database`;
CREATE TABLE `clinic_database` (
  `clinic_database_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_database_id`),
  KEY `clinic_database_clinic_id_foreign` (`clinic_id`),
  CONSTRAINT `clinic_database_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clinic_database
-- ----------------------------

-- ----------------------------
-- Table structure for clinic_hosting
-- ----------------------------
DROP TABLE IF EXISTS `clinic_hosting`;
CREATE TABLE `clinic_hosting` (
  `clinic_hosting_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `port` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_hosting_id`),
  KEY `clinic_hosting_clinic_id_foreign` (`clinic_id`),
  CONSTRAINT `clinic_hosting_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clinic_hosting
-- ----------------------------

-- ----------------------------
-- Table structure for clinic_info
-- ----------------------------
DROP TABLE IF EXISTS `clinic_info`;
CREATE TABLE `clinic_info` (
  `clinic_info_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_info_id`),
  KEY `clinic_info_clinic_id_foreign` (`clinic_id`),
  CONSTRAINT `clinic_info_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clinic_info
-- ----------------------------

-- ----------------------------
-- Table structure for clinic_language
-- ----------------------------
DROP TABLE IF EXISTS `clinic_language`;
CREATE TABLE `clinic_language` (
  `clinic_language_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `language_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`clinic_language_id`),
  KEY `clinic_language_clinic_id_foreign` (`clinic_id`),
  KEY `clinic_language_language_id_foreign` (`language_id`),
  CONSTRAINT `clinic_language_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE,
  CONSTRAINT `clinic_language_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clinic_language
-- ----------------------------

-- ----------------------------
-- Table structure for clinic_theme
-- ----------------------------
DROP TABLE IF EXISTS `clinic_theme`;
CREATE TABLE `clinic_theme` (
  `clinic_theme_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `theme_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_theme_id`),
  KEY `clinic_theme_clinic_id_foreign` (`clinic_id`),
  KEY `clinic_theme_theme_id_foreign` (`theme_id`),
  CONSTRAINT `clinic_theme_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE,
  CONSTRAINT `clinic_theme_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of clinic_theme
-- ----------------------------

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `author` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `parent` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `comments_email_unique` (`email`),
  KEY `comments_post_id_index` (`post_id`),
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of contacts
-- ----------------------------

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `country_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES ('1', 'Việt Nam', 'vn', null, null, null);
INSERT INTO `countries` VALUES ('2', 'English', 'en', null, null, null);
INSERT INTO `countries` VALUES ('3', 'Rusia', 'ru', null, null, null);
INSERT INTO `countries` VALUES ('4', 'Tây Ban Nha', 'tu', null, null, null);

-- ----------------------------
-- Table structure for galleries
-- ----------------------------
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gallery_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of galleries
-- ----------------------------

-- ----------------------------
-- Table structure for gallery_images
-- ----------------------------
DROP TABLE IF EXISTS `gallery_images`;
CREATE TABLE `gallery_images` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gallery_id` bigint(20) unsigned NOT NULL,
  `image_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_description` text COLLATE utf8_unicode_ci NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gallery_images_gallery_id_index` (`gallery_id`),
  CONSTRAINT `gallery_images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of gallery_images
-- ----------------------------

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language` (
  `language_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`),
  KEY `language_country_id_foreign` (`country_id`),
  CONSTRAINT `language_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES ('7', '2', 'Tiếng Anh 1', '', '', null, null, null);
INSERT INTO `language` VALUES ('9', '3', 'Tiếng Pháp', '', '', null, null, null);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_000001_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('2016_06_05_151525_create_table_articles', '1');
INSERT INTO `migrations` VALUES ('2016_07_22_213333_create_table_term_relationships', '1');
INSERT INTO `migrations` VALUES ('2016_07_23_103628_create_table_term_taxonomy', '1');
INSERT INTO `migrations` VALUES ('2016_07_23_103647_create_table_terms', '1');
INSERT INTO `migrations` VALUES ('2016_07_23_105531_create_table_article_meta', '1');
INSERT INTO `migrations` VALUES ('2016_08_18_143846_create_options_table', '1');
INSERT INTO `migrations` VALUES ('2016_08_24_190534_create_table_themes', '1');
INSERT INTO `migrations` VALUES ('2016_08_25_151736_create_table_theme_meta', '1');
INSERT INTO `migrations` VALUES ('2016_08_26_082921_create_table_widget_groups', '1');
INSERT INTO `migrations` VALUES ('2016_08_26_082938_create_table_widget', '1');
INSERT INTO `migrations` VALUES ('2016_08_31_100931_create_table_user_meta', '1');
INSERT INTO `migrations` VALUES ('2016_08_31_151324_create_table_comments', '1');
INSERT INTO `migrations` VALUES ('2016_11_01_081606_galleries', '1');
INSERT INTO `migrations` VALUES ('2016_11_01_081617_gallery_images', '1');
INSERT INTO `migrations` VALUES ('2016_11_03_153632_create_contacts_table', '1');
INSERT INTO `migrations` VALUES ('2016_11_11_035809_add_provider_to_users_table', '1');
INSERT INTO `migrations` VALUES ('2017_02_17_072353_create_clinic_table', '1');
INSERT INTO `migrations` VALUES ('2017_02_17_075212_create_clinic_database_table', '2');
INSERT INTO `migrations` VALUES ('2017_02_17_075510_create_clinic_hosting_table', '2');
INSERT INTO `migrations` VALUES ('2017_02_17_075520_create_clinic_info_table', '3');
INSERT INTO `migrations` VALUES ('2017_02_17_091202_create_post_translations_table', '3');
INSERT INTO `migrations` VALUES ('2017_02_17_092510_create_countries_table', '3');
INSERT INTO `migrations` VALUES ('2017_02_17_092547_create_language_table', '3');
INSERT INTO `migrations` VALUES ('2017_02_17_092951_create_clinic_language_table', '3');
INSERT INTO `migrations` VALUES ('2017_02_21_033231_create_theme_type_table', '4');
INSERT INTO `migrations` VALUES ('2017_02_21_034328_add_publish_parent_to_theme_table', '5');
INSERT INTO `migrations` VALUES ('2017_02_28_071937_drop_theme_id_from_clinic_table', '5');
INSERT INTO `migrations` VALUES ('2017_02_28_080337_create_clinic_theme_table', '6');
INSERT INTO `migrations` VALUES ('2017_02_28_102355_add_status_to_clinic_table', '7');
INSERT INTO `migrations` VALUES ('2017_03_02_121655_add_field_machine_name_to_themes', '8');
INSERT INTO `migrations` VALUES ('2017_03_03_074358_add_telephone_to_clinic_info_table', '9');
INSERT INTO `migrations` VALUES ('2017_03_07_071127_update_foreign_key_language_table', '10');

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES ('1', 'site_title', 'QSoft Vietnam');
INSERT INTO `options` VALUES ('2', 'site_tagline', 'Content Management System');
INSERT INTO `options` VALUES ('3', 'email_administrator', 'hoaitn@qsoft.com.vn');
INSERT INTO `options` VALUES ('4', 'frontpage_blog', '0');
INSERT INTO `options` VALUES ('5', 'view_post_index', '10');
INSERT INTO `options` VALUES ('6', 'image_thumbnail_width', '150');
INSERT INTO `options` VALUES ('7', 'image_thumbnail_height', '150');
INSERT INTO `options` VALUES ('8', 'image_medium_width', '300');
INSERT INTO `options` VALUES ('9', 'image_medium_height', '300');
INSERT INTO `options` VALUES ('10', 'image_large_width', '1024');
INSERT INTO `options` VALUES ('11', 'image_large_height', '800');
INSERT INTO `options` VALUES ('12', 'menu_name', 'a:1:{i:0;s:9:\"main-menu\";}');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `posts_post_author_foreign` (`post_author`),
  CONSTRAINT `posts_post_author_foreign` FOREIGN KEY (`post_author`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------

-- ----------------------------
-- Table structure for post_meta
-- ----------------------------
DROP TABLE IF EXISTS `post_meta`;
CREATE TABLE `post_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `post_meta_post_id_index` (`post_id`),
  KEY `post_meta_meta_key_index` (`meta_key`),
  CONSTRAINT `post_meta_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_meta
-- ----------------------------

-- ----------------------------
-- Table structure for post_translations
-- ----------------------------
DROP TABLE IF EXISTS `post_translations`;
CREATE TABLE `post_translations` (
  `post_translations_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `locale` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`post_translations_id`),
  KEY `post_translations_post_id_foreign` (`post_id`),
  CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of post_translations
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permission` longtext COLLATE utf8_unicode_ci,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'Administrator', 'This is supper admin', 'admin', '{\"page\":[\"index\",\"create\",\"edit\",\"update\",\"destroy\"],\"post\":[\"index\",\"create\",\"edit\",\"update\",\"destroy\"],\"category\":[\"index\",\"create\",\"edit\",\"update\",\"destroy\"],\"tag\":[\"index\",\"create\",\"edit\",\"update\",\"destroy\"],\"comment\":[\"approve\",\"destroy\"],\"menu\":[\"index\",\"create\",\"edit\",\"update\",\"destroy\"],\"media\":[\"index\",\"upload\",\"destroy\"],\"theme\":[\"index\",\"edit\",\"destroy\"],\"widget\":[\"index\",\"create\",\"edit\",\"destroy\"],\"gallery\":[\"index\",\"create\",\"edit\",\"destroy\"],\"gallery-images\":[\"index\",\"create\",\"edit\",\"destroy\"],\"contacts\":[\"index\",\"destroy\"],\"roles\":[\"index\",\"create\",\"edit\",\"destroy\"],\"users\":[\"create\",\"edit\",\"destroy\",\"profile\"],\"setting\":[\"index\"]}', '1', '2017-02-20 09:05:33', '2017-02-20 09:05:33', null);

-- ----------------------------
-- Table structure for terms
-- ----------------------------
DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `taxonomy` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_group` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `terms_slug_index` (`slug`),
  KEY `terms_name_index` (`name`),
  KEY `terms_taxonomy_index` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of terms
-- ----------------------------
INSERT INTO `terms` VALUES ('1', 'doloremque', 'doloremque', 'category', '', '0', '0');
INSERT INTO `terms` VALUES ('2', 'sed', 'sed', 'category', '', '0', '0');
INSERT INTO `terms` VALUES ('3', 'quia', 'quia', 'category', '', '0', '0');
INSERT INTO `terms` VALUES ('4', 'aut', 'aut', 'category', '', '0', '0');

-- ----------------------------
-- Table structure for term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `term_relationships`;
CREATE TABLE `term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_relationships_term_taxonomy_id_index` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of term_relationships
-- ----------------------------
INSERT INTO `term_relationships` VALUES ('1', '2', '0');
INSERT INTO `term_relationships` VALUES ('2', '2', '0');
INSERT INTO `term_relationships` VALUES ('3', '2', '0');
INSERT INTO `term_relationships` VALUES ('4', '3', '0');
INSERT INTO `term_relationships` VALUES ('5', '4', '0');
INSERT INTO `term_relationships` VALUES ('6', '4', '0');
INSERT INTO `term_relationships` VALUES ('7', '1', '0');
INSERT INTO `term_relationships` VALUES ('8', '1', '0');
INSERT INTO `term_relationships` VALUES ('9', '3', '0');
INSERT INTO `term_relationships` VALUES ('10', '1', '0');
INSERT INTO `term_relationships` VALUES ('11', '3', '0');
INSERT INTO `term_relationships` VALUES ('12', '1', '0');
INSERT INTO `term_relationships` VALUES ('13', '4', '0');
INSERT INTO `term_relationships` VALUES ('14', '3', '0');
INSERT INTO `term_relationships` VALUES ('15', '2', '0');
INSERT INTO `term_relationships` VALUES ('16', '2', '0');
INSERT INTO `term_relationships` VALUES ('17', '2', '0');
INSERT INTO `term_relationships` VALUES ('18', '4', '0');
INSERT INTO `term_relationships` VALUES ('19', '4', '0');
INSERT INTO `term_relationships` VALUES ('20', '1', '0');

-- ----------------------------
-- Table structure for themes
-- ----------------------------
DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
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
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of themes
-- ----------------------------

-- ----------------------------
-- Table structure for theme_meta
-- ----------------------------
DROP TABLE IF EXISTS `theme_meta`;
CREATE TABLE `theme_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `theme_meta_theme_id_index` (`theme_id`),
  KEY `theme_meta_meta_key_index` (`meta_key`),
  CONSTRAINT `theme_meta_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of theme_meta
-- ----------------------------

-- ----------------------------
-- Table structure for theme_type
-- ----------------------------
DROP TABLE IF EXISTS `theme_type`;
CREATE TABLE `theme_type` (
  `theme_type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`theme_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of theme_type
-- ----------------------------
INSERT INTO `theme_type` VALUES ('1', 'Simple Site', '', null, null, null);
INSERT INTO `theme_type` VALUES ('2', 'Medium Site', null, null, null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
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
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1', 'Administrator', 'henry.tran@qsoft.com.vn', '$2y$10$rRfP75dC/XJ39POKPe5ch.kNkG38EfvFB.Ju8UnWBW3b/6i9lmNA2', 'default-user.png', '', '1', 'local', 'cmO0ri6ma2YhUxSRIO0IhJO76EnpwZ6ybzL26IzS8GTHV2nx3fsCC75gclWG', '2017-02-20 09:05:34', '2017-02-28 02:46:09');

-- ----------------------------
-- Table structure for user_meta
-- ----------------------------
DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE `user_meta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_id`),
  KEY `user_meta_user_id_index` (`user_id`),
  KEY `user_meta_meta_key_index` (`meta_key`),
  CONSTRAINT `user_meta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_meta
-- ----------------------------

-- ----------------------------
-- Table structure for widgets
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `class_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `options` longtext COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `widgets_group_id_index` (`group_id`),
  CONSTRAINT `widgets_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `widget_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widgets
-- ----------------------------

-- ----------------------------
-- Table structure for widget_groups
-- ----------------------------
DROP TABLE IF EXISTS `widget_groups`;
CREATE TABLE `widget_groups` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_groups_theme_id_index` (`theme_id`),
  CONSTRAINT `widget_groups_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of widget_groups
-- ----------------------------
