/*
 Navicat Premium Data Transfer

 Source Server         : [Localhost] MySQL
 Source Server Type    : MySQL
 Source Server Version : 100133
 Source Host           : localhost:3306
 Source Schema         : sbd369

 Target Server Type    : MySQL
 Target Server Version : 100133
 File Encoding         : 65001

 Date: 12/11/2018 16:03:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clinic
-- ----------------------------
DROP TABLE IF EXISTS `clinic`;
CREATE TABLE `clinic`  (
  `clinic_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT 0,
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `is_sanmax_hosting` enum('0','1') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `contact_info` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clinic
-- ----------------------------
INSERT INTO `clinic` VALUES (1, 0, '', '1', NULL, NULL, NULL, '2017-03-17 11:37:51', '2017-03-17 11:37:51');

-- ----------------------------
-- Table structure for clinic_database
-- ----------------------------
DROP TABLE IF EXISTS `clinic_database`;
CREATE TABLE `clinic_database`  (
  `clinic_database_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `database_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `table_prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_database_id`) USING BTREE,
  INDEX `clinic_database_clinic_id_foreign`(`clinic_id`) USING BTREE,
  CONSTRAINT `clinic_database_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clinic_database
-- ----------------------------
INSERT INTO `clinic_database` VALUES (1, 1, '', NULL, '', NULL, '', '$2y$10$K/fETjmnUeyND06155Ycoef.m5G/Ftqt.aDIpmRkG9DFXILKwezX6', NULL, NULL, '2017-03-17 11:37:51', '2017-03-17 11:37:51');

-- ----------------------------
-- Table structure for clinic_hosting
-- ----------------------------
DROP TABLE IF EXISTS `clinic_hosting`;
CREATE TABLE `clinic_hosting`  (
  `clinic_hosting_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_hosting_id`) USING BTREE,
  INDEX `clinic_hosting_clinic_id_foreign`(`clinic_id`) USING BTREE,
  CONSTRAINT `clinic_hosting_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clinic_hosting
-- ----------------------------
INSERT INTO `clinic_hosting` VALUES (1, 1, '', NULL, '', '$2y$10$qQM/sUUppO8MTg4FFjWw..NA58otRzukAExqSnI1efBW5Twnaa6zC', NULL, NULL, '2017-03-17 11:37:52', '2017-03-17 11:37:52');

-- ----------------------------
-- Table structure for clinic_info
-- ----------------------------
DROP TABLE IF EXISTS `clinic_info`;
CREATE TABLE `clinic_info`  (
  `clinic_info_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `telephone` int(11) NOT NULL DEFAULT 0,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `site_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `site_slogan` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_info_id`) USING BTREE,
  INDEX `clinic_info_clinic_id_foreign`(`clinic_id`) USING BTREE,
  CONSTRAINT `clinic_info_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of clinic_info
-- ----------------------------
INSERT INTO `clinic_info` VALUES (1, 1, 9876543, 'HN', 'Sanmax', NULL, 'Sanmax', 'hoangdv1112@gmail.com', NULL, NULL, NULL, '2017-03-17 11:37:51', '2017-03-17 11:37:51');

-- ----------------------------
-- Table structure for clinic_language
-- ----------------------------
DROP TABLE IF EXISTS `clinic_language`;
CREATE TABLE `clinic_language`  (
  `clinic_language_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`clinic_language_id`) USING BTREE,
  INDEX `clinic_language_clinic_id_foreign`(`clinic_id`) USING BTREE,
  INDEX `clinic_language_language_id_foreign`(`language_id`) USING BTREE,
  CONSTRAINT `clinic_language_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `clinic_language_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for clinic_theme
-- ----------------------------
DROP TABLE IF EXISTS `clinic_theme`;
CREATE TABLE `clinic_theme`  (
  `clinic_theme_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `clinic_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `theme_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`clinic_theme_id`) USING BTREE,
  INDEX `clinic_theme_clinic_id_foreign`(`clinic_id`) USING BTREE,
  INDEX `clinic_theme_theme_id_foreign`(`theme_id`) USING BTREE,
  CONSTRAINT `clinic_theme_clinic_id_foreign` FOREIGN KEY (`clinic_id`) REFERENCES `clinic` (`clinic_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `clinic_theme_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 0,
  `parent` bigint(20) NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `comments_email_unique`(`email`) USING BTREE,
  INDEX `comments_post_id_index`(`post_id`) USING BTREE,
  CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for contacts
-- ----------------------------
DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for countries
-- ----------------------------
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries`  (
  `country_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`country_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of countries
-- ----------------------------
INSERT INTO `countries` VALUES (2, 'English', 'en', NULL, NULL, NULL);
INSERT INTO `countries` VALUES (3, 'Deutsch', 'de', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for galleries
-- ----------------------------
DROP TABLE IF EXISTS `galleries`;
CREATE TABLE `galleries`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `gallery_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gallery_status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `galleries_author_id_foreign`(`author_id`) USING BTREE,
  CONSTRAINT `galleries_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of galleries
-- ----------------------------
INSERT INTO `galleries` VALUES (4, 1, 'Slides', 1, '2017-03-27 02:06:23', '2017-03-27 02:06:45', NULL);
INSERT INTO `galleries` VALUES (5, 1, '34523', 1, '2017-03-27 04:24:52', '2017-03-27 04:24:56', '2017-03-27 04:24:56');

-- ----------------------------
-- Table structure for gallery_image_translations
-- ----------------------------
DROP TABLE IF EXISTS `gallery_image_translations`;
CREATE TABLE `gallery_image_translations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gallery_image_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gallery_image_translations_gallery_image_id_foreign`(`gallery_image_id`) USING BTREE,
  CONSTRAINT `gallery_image_translations_gallery_image_id_foreign` FOREIGN KEY (`gallery_image_id`) REFERENCES `gallery_images` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gallery_image_translations
-- ----------------------------
INSERT INTO `gallery_image_translations` VALUES (1, 12, 'de', 'de', 'de', '2017-03-27 03:59:40', '2017-03-27 03:59:40');
INSERT INTO `gallery_image_translations` VALUES (2, 12, 'en', 'en', 'en', '2017-03-27 03:59:40', '2017-03-27 03:59:40');
INSERT INTO `gallery_image_translations` VALUES (3, 13, 'de', '', '', '2017-03-27 04:00:15', '2017-03-27 04:00:15');
INSERT INTO `gallery_image_translations` VALUES (4, 13, 'en', '', '', '2017-03-27 04:00:15', '2017-03-27 04:00:15');
INSERT INTO `gallery_image_translations` VALUES (5, 14, 'de', '5678eeeee', '', '2017-03-27 04:00:54', '2017-03-27 04:01:35');
INSERT INTO `gallery_image_translations` VALUES (6, 14, 'en', '5678eeeee', '56785678', '2017-03-27 04:00:54', '2017-03-27 04:01:35');
INSERT INTO `gallery_image_translations` VALUES (7, 15, 'de', '', '', '2017-03-27 04:22:52', '2017-03-27 04:22:52');
INSERT INTO `gallery_image_translations` VALUES (8, 15, 'en', '2341234', '234', '2017-03-27 04:22:52', '2017-03-27 04:22:52');
INSERT INTO `gallery_image_translations` VALUES (9, 16, 'de', '', '', '2017-03-27 04:48:37', '2017-03-27 04:48:37');
INSERT INTO `gallery_image_translations` VALUES (10, 16, 'en', 'tryẻty', 'rty', '2017-03-27 04:48:37', '2017-03-27 04:48:37');
INSERT INTO `gallery_image_translations` VALUES (11, 17, 'de', '', '', '2017-03-27 06:53:00', '2017-03-27 06:53:00');
INSERT INTO `gallery_image_translations` VALUES (12, 17, 'en', '54674567', '', '2017-03-27 06:53:00', '2017-03-27 06:53:00');
INSERT INTO `gallery_image_translations` VALUES (13, 18, 'vi', '', '', '2018-02-23 09:33:14', '2018-02-23 09:33:14');
INSERT INTO `gallery_image_translations` VALUES (14, 18, 'de', '', '', '2018-02-23 09:33:14', '2018-02-23 09:33:14');
INSERT INTO `gallery_image_translations` VALUES (15, 18, 'en', '', '', '2018-02-23 09:33:14', '2018-02-23 09:33:14');

-- ----------------------------
-- Table structure for gallery_images
-- ----------------------------
DROP TABLE IF EXISTS `gallery_images`;
CREATE TABLE `gallery_images`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `gallery_id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_title` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_status` tinyint(1) NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `gallery_images_gallery_id_index`(`gallery_id`) USING BTREE,
  CONSTRAINT `gallery_images_gallery_id_foreign` FOREIGN KEY (`gallery_id`) REFERENCES `galleries` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gallery_images
-- ----------------------------
INSERT INTO `gallery_images` VALUES (2, 4, '1490586079-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:41:19', '2017-03-27 10:41:19', '2017-03-27 03:59:52');
INSERT INTO `gallery_images` VALUES (3, 4, '1490586141-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:42:21', '2017-03-27 10:42:21', '2017-03-27 03:59:55');
INSERT INTO `gallery_images` VALUES (4, 4, '1490586163-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:42:43', '2017-03-27 10:42:43', '2017-03-27 03:59:49');
INSERT INTO `gallery_images` VALUES (5, 4, '1490586191-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:43:11', '2017-03-27 10:43:11', '2017-03-27 03:59:58');
INSERT INTO `gallery_images` VALUES (6, 4, '1490586752-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:52:32', '2017-03-27 10:52:32', '2017-03-27 04:00:00');
INSERT INTO `gallery_images` VALUES (7, 4, '1490586975-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:56:15', '2017-03-27 10:56:15', '2017-03-27 04:00:03');
INSERT INTO `gallery_images` VALUES (8, 4, '1490587048-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:57:28', '2017-03-27 10:57:28', '2017-03-27 04:00:05');
INSERT INTO `gallery_images` VALUES (9, 4, '1490587062-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:57:42', '2017-03-27 10:57:42', '2017-03-27 04:00:07');
INSERT INTO `gallery_images` VALUES (10, 4, '1490587144-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:59:04', '2017-03-27 10:59:04', '2017-03-27 04:00:10');
INSERT INTO `gallery_images` VALUES (11, 4, '1490587163-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:59:23', '2017-03-27 10:59:23', '2017-03-27 04:00:12');
INSERT INTO `gallery_images` VALUES (12, 4, '1490587180-doctor-2.jpg', '', 'de', '', 1, '2017-03-27 10:59:40', '2017-03-27 10:59:40', '2017-03-27 03:59:46');
INSERT INTO `gallery_images` VALUES (13, 4, '', '', '', '', 1, '2017-03-27 11:00:15', '2017-03-27 11:00:15', '2017-03-27 04:00:19');
INSERT INTO `gallery_images` VALUES (14, 4, '1490587304-doctor-1.jpg', '', '', '', 1, '2017-03-27 11:00:54', '2017-03-27 11:00:54', '2017-03-27 04:20:37');
INSERT INTO `gallery_images` VALUES (15, 4, '1490588572-doctor-1.jpg', '', '', '', 1, '2017-03-27 11:22:52', '2017-03-27 11:22:52', '2017-03-27 04:22:55');
INSERT INTO `gallery_images` VALUES (16, 4, '1490590117-doctor-2.jpg', '', '', '', 1, '2017-03-27 11:48:37', '2017-03-27 11:48:37', '2017-03-27 06:53:06');
INSERT INTO `gallery_images` VALUES (17, 4, '1490597580-doctor-1.jpg', '', '', '', 1, '2017-03-27 13:53:00', '2017-03-27 13:53:00', NULL);
INSERT INTO `gallery_images` VALUES (18, 4, '1519378393-ont-684-style-art-2.png', '', '', '', 1, '2018-02-23 16:33:13', '2018-02-23 16:33:13', NULL);

-- ----------------------------
-- Table structure for language
-- ----------------------------
DROP TABLE IF EXISTS `language`;
CREATE TABLE `language`  (
  `language_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`) USING BTREE,
  INDEX `language_country_id_foreign`(`country_id`) USING BTREE,
  CONSTRAINT `language_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of language
-- ----------------------------
INSERT INTO `language` VALUES (8, 2, 'English', '', '', 1, NULL, NULL, NULL);
INSERT INTO `language` VALUES (9, 3, 'Deutsch', '', '', 1, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `migration` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_10_12_000000_create_roles_table', 1);
INSERT INTO `migrations` VALUES ('2014_10_12_000001_create_users_table', 1);
INSERT INTO `migrations` VALUES ('2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES ('2016_06_05_151525_create_table_articles', 1);
INSERT INTO `migrations` VALUES ('2016_07_22_213333_create_table_term_relationships', 1);
INSERT INTO `migrations` VALUES ('2016_07_23_103628_create_table_term_taxonomy', 1);
INSERT INTO `migrations` VALUES ('2016_07_23_103647_create_table_terms', 1);
INSERT INTO `migrations` VALUES ('2016_07_23_105531_create_table_article_meta', 1);
INSERT INTO `migrations` VALUES ('2016_08_18_143846_create_options_table', 1);
INSERT INTO `migrations` VALUES ('2016_08_24_190534_create_table_themes', 1);
INSERT INTO `migrations` VALUES ('2016_08_25_151736_create_table_theme_meta', 1);
INSERT INTO `migrations` VALUES ('2016_08_26_082921_create_table_widget_groups', 1);
INSERT INTO `migrations` VALUES ('2016_08_26_082938_create_table_widget', 1);
INSERT INTO `migrations` VALUES ('2016_08_31_100931_create_table_user_meta', 1);
INSERT INTO `migrations` VALUES ('2016_08_31_151324_create_table_comments', 1);
INSERT INTO `migrations` VALUES ('2016_11_01_081606_galleries', 1);
INSERT INTO `migrations` VALUES ('2016_11_01_081617_gallery_images', 1);
INSERT INTO `migrations` VALUES ('2016_11_03_153632_create_contacts_table', 1);
INSERT INTO `migrations` VALUES ('2016_11_11_035809_add_provider_to_users_table', 1);
INSERT INTO `migrations` VALUES ('2017_02_17_072353_create_clinic_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_075212_create_clinic_database_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_075510_create_clinic_hosting_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_075520_create_clinic_info_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_091202_create_post_translations_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_092510_create_countries_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_092547_create_language_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_17_092951_create_clinic_language_table', 2);
INSERT INTO `migrations` VALUES ('2017_02_21_033231_create_theme_type_table', 3);
INSERT INTO `migrations` VALUES ('2017_02_21_034328_add_publish_parent_to_theme_table', 4);
INSERT INTO `migrations` VALUES ('2017_02_28_071937_drop_theme_id_from_clinic_table', 4);
INSERT INTO `migrations` VALUES ('2017_02_28_080337_create_clinic_theme_table', 4);
INSERT INTO `migrations` VALUES ('2017_02_28_102355_add_status_to_clinic_table', 4);
INSERT INTO `migrations` VALUES ('2017_03_02_121655_add_field_machine_name_to_themes', 5);
INSERT INTO `migrations` VALUES ('2017_03_03_074358_add_telephone_to_clinic_info_table', 5);
INSERT INTO `migrations` VALUES ('2017_03_07_071127_update_foreign_key_language_table', 5);
INSERT INTO `migrations` VALUES ('2017_03_13_025012_add_status_to_language_table', 6);
INSERT INTO `migrations` VALUES ('2017_03_13_033156_translate_table', 7);
INSERT INTO `migrations` VALUES ('2017_03_14_125332_create_term_translations_tabel', 8);
INSERT INTO `migrations` VALUES ('2017_03_16_084343_add_theme_root_to_themes_table', 9);
INSERT INTO `migrations` VALUES ('2017_03_21_074654_add_createdat_updateat_to_user_meta_table', 10);
INSERT INTO `migrations` VALUES ('2017_03_22_094835_add_phone_field_to_contacts_table', 11);
INSERT INTO `migrations` VALUES ('2017_03_27_015039_add_author_id_field_to_galleries_table', 12);
INSERT INTO `migrations` VALUES ('2017_03_27_033219_create_gallery_image_translations_table', 13);

-- ----------------------------
-- Table structure for options
-- ----------------------------
DROP TABLE IF EXISTS `options`;
CREATE TABLE `options`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of options
-- ----------------------------
INSERT INTO `options` VALUES (1, 'site_title', 'QSoft Vietnam');
INSERT INTO `options` VALUES (2, 'site_tagline', 'Content Management System');
INSERT INTO `options` VALUES (3, 'email_administrator', 'hoaitn@qsoft.com.vn');
INSERT INTO `options` VALUES (4, 'frontpage_blog', '0');
INSERT INTO `options` VALUES (5, 'view_post_index', '10');
INSERT INTO `options` VALUES (6, 'image_thumbnail_width', '150');
INSERT INTO `options` VALUES (7, 'image_thumbnail_height', '150');
INSERT INTO `options` VALUES (8, 'image_medium_width', '300');
INSERT INTO `options` VALUES (9, 'image_medium_height', '300');
INSERT INTO `options` VALUES (10, 'image_large_width', '1024');
INSERT INTO `options` VALUES (11, 'image_large_height', '800');
INSERT INTO `options` VALUES (12, 'menu_name', 'a:1:{i:0;s:9:\"main-menu\";}');
INSERT INTO `options` VALUES (15, 'show_on_front', 'page');
INSERT INTO `options` VALUES (16, 'page_on_front', 'tieng-anh');
INSERT INTO `options` VALUES (17, 'show_on_front', 'page');
INSERT INTO `options` VALUES (18, 'frontpage_blog', '0');
INSERT INTO `options` VALUES (19, 'frontpage_blog', '0');

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  INDEX `password_resets_email_index`(`email`) USING BTREE,
  INDEX `password_resets_token_index`(`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for post_meta
-- ----------------------------
DROP TABLE IF EXISTS `post_meta`;
CREATE TABLE `post_meta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `post_meta_post_id_index`(`post_id`) USING BTREE,
  INDEX `post_meta_meta_key_index`(`meta_key`) USING BTREE,
  CONSTRAINT `post_meta_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 722 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post_meta
-- ----------------------------
INSERT INTO `post_meta` VALUES (24, 22, '_file_size', '2170560');
INSERT INTO `post_meta` VALUES (25, 23, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (26, 24, '_file_size', '2386043');
INSERT INTO `post_meta` VALUES (27, 25, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (28, 26, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (29, 27, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (30, 28, '_file_size', '2386043');
INSERT INTO `post_meta` VALUES (31, 29, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (32, 30, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (33, 31, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (34, 32, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (35, 33, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (36, 34, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (37, 35, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (38, 36, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (39, 37, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (40, 38, '_file_size', '2453100');
INSERT INTO `post_meta` VALUES (41, 39, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (42, 40, '_file_size', '2386043');
INSERT INTO `post_meta` VALUES (43, 41, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (44, 42, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (45, 43, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (46, 44, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (47, 45, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (48, 46, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (49, 47, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (50, 48, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (51, 49, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (52, 50, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (53, 51, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (54, 52, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (55, 53, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (56, 54, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (57, 55, '_file_size', '2453100');
INSERT INTO `post_meta` VALUES (58, 56, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (59, 57, '_file_size', '2453100');
INSERT INTO `post_meta` VALUES (60, 58, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (61, 59, '_file_size', '152991');
INSERT INTO `post_meta` VALUES (62, 60, '_file_size', '7612');
INSERT INTO `post_meta` VALUES (63, 61, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (64, 62, '_file_size', '83856');
INSERT INTO `post_meta` VALUES (81, 69, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (82, 70, '_file_size', '72478');
INSERT INTO `post_meta` VALUES (121, 86, '_file_size', '142685');
INSERT INTO `post_meta` VALUES (133, 91, '_file_size', '6167');
INSERT INTO `post_meta` VALUES (134, 92, '_file_size', '72478');
INSERT INTO `post_meta` VALUES (135, 93, '_file_size', '142685');
INSERT INTO `post_meta` VALUES (168, 109, 'appointment_link', 'Tieng Ha Lan');
INSERT INTO `post_meta` VALUES (169, 109, 'layout', '');
INSERT INTO `post_meta` VALUES (170, 109, 'featured_img', 'http://sbd639.loc/uploads/content-img.jpg');
INSERT INTO `post_meta` VALUES (240, 135, 'appointment_link', 'http://ec2-52-221-247-51.ap-southeast-1.compute.amazonaws.com/admin/contentManager/post');
INSERT INTO `post_meta` VALUES (241, 135, 'layout', '');
INSERT INTO `post_meta` VALUES (242, 135, 'featured_img', 'http://sbd639.loc/uploads/hoangdv.jpg');
INSERT INTO `post_meta` VALUES (245, 137, '_file_size', '24512');
INSERT INTO `post_meta` VALUES (246, 138, '_file_size', '37797');
INSERT INTO `post_meta` VALUES (247, 139, '_file_size', '24512');
INSERT INTO `post_meta` VALUES (248, 140, '_file_size', '4658');
INSERT INTO `post_meta` VALUES (659, 278, 'appointment_link', 'http://sbd639.loc/admin/contentManager/doctor/create');
INSERT INTO `post_meta` VALUES (660, 278, 'layout', '');
INSERT INTO `post_meta` VALUES (661, 278, 'featured_img', 'http://sbd639.loc/uploads/doctor-2.jpg');
INSERT INTO `post_meta` VALUES (662, 279, 'layout', '');
INSERT INTO `post_meta` VALUES (663, 279, 'featured_img', 'http://sbd639.loc/uploads/content-img.jpg');
INSERT INTO `post_meta` VALUES (679, 285, 'layout', '');
INSERT INTO `post_meta` VALUES (680, 285, 'featured_img', '');
INSERT INTO `post_meta` VALUES (681, 286, 'layout', '');
INSERT INTO `post_meta` VALUES (682, 286, 'featured_img', 'http://sbd639.loc/uploads/content-img.jpg');
INSERT INTO `post_meta` VALUES (683, 287, 'layout', '');
INSERT INTO `post_meta` VALUES (684, 287, 'featured_img', 'http://sbd639.loc/uploads/content-img.jpg');
INSERT INTO `post_meta` VALUES (694, 291, 'appointment_link', 'http://sbd639.loc/admin/contentManager/doctor/create');
INSERT INTO `post_meta` VALUES (695, 291, 'layout', '');
INSERT INTO `post_meta` VALUES (696, 291, 'featured_img', 'http://sbd639.loc/uploads/doctor-2.jpg');
INSERT INTO `post_meta` VALUES (697, 292, 'layout', '');
INSERT INTO `post_meta` VALUES (698, 292, 'featured_img', 'http://sbd639.loc/uploads/content-img.jpg');
INSERT INTO `post_meta` VALUES (699, 293, 'layout', '');
INSERT INTO `post_meta` VALUES (700, 293, 'featured_img', 'http://sbd639.loc/uploads/content-img.jpg');
INSERT INTO `post_meta` VALUES (707, 296, '_nav_item_parent', '');
INSERT INTO `post_meta` VALUES (708, 296, '_nav_item_url', '');
INSERT INTO `post_meta` VALUES (709, 296, '_nav_item_type', 'home');
INSERT INTO `post_meta` VALUES (710, 297, '_nav_item_parent', '');
INSERT INTO `post_meta` VALUES (711, 297, '_nav_item_url', 'team');
INSERT INTO `post_meta` VALUES (712, 297, '_nav_item_type', 'home');
INSERT INTO `post_meta` VALUES (713, 298, '_nav_item_parent', '');
INSERT INTO `post_meta` VALUES (714, 298, '_nav_item_url', 'news');
INSERT INTO `post_meta` VALUES (715, 298, '_nav_item_type', 'home');
INSERT INTO `post_meta` VALUES (716, 299, '_nav_item_parent', '');
INSERT INTO `post_meta` VALUES (717, 299, '_nav_item_url', 'contact-us');
INSERT INTO `post_meta` VALUES (718, 299, '_nav_item_type', 'page');

-- ----------------------------
-- Table structure for post_translations
-- ----------------------------
DROP TABLE IF EXISTS `post_translations`;
CREATE TABLE `post_translations`  (
  `post_translations_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`post_translations_id`) USING BTREE,
  INDEX `post_translations_post_id_foreign`(`post_id`) USING BTREE,
  CONSTRAINT `post_translations_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 406 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of post_translations
-- ----------------------------
INSERT INTO `post_translations` VALUES (30, 109, 'de', '', '                                                                \r\n                            Tieng Ha Lan1\r\n                            ', '<div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Why do we use it?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p></div><br style=\"margin: 0px; padding: 0px; clear: both; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px; text-align: center;\"><div style=\"margin: 0px 14.3906px 0px 28.7969px; padding: 0px; width: 436.797px; float: left; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Where does it come from?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p></div><div style=\"margin: 0px 28.7969px 0px 14.3906px; padding: 0px; width: 436.797px; float: right; font-family: \"Open Sans\", Arial, sans-serif; font-size: 14px;\"><h2 style=\"margin-top: 0px; margin-right: 0px; margin-left: 0px; padding: 0px; line-height: 24px; font-family: DauphinPlain; font-size: 24px;\">Where can I get some?</h2><p style=\"margin-bottom: 15px; padding: 0px; text-align: justify;\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p></div>', NULL, '2017-03-15 04:38:32', '2017-03-20 10:56:56');
INSERT INTO `post_translations` VALUES (31, 109, 'en', 'Tieng Anh', '                                                                \r\n                            Tieng Ha Lan1\r\n                            ', '                                Tieng Anh\r\n                            ', NULL, '2017-03-15 04:38:32', '2017-03-15 07:42:26');
INSERT INTO `post_translations` VALUES (78, 135, 'de', 'r', 'rrr', '<p><img src=\"http://sbd639.loc/uploads/doctor-2.jpg\" style=\"width: 267px;\">rrr</p>', NULL, '2017-03-15 11:37:28', '2017-03-16 05:55:16');
INSERT INTO `post_translations` VALUES (79, 135, 'en', 'Dr. Hoang Dona', 'Sample Position', '<h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Info</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Experience</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p><h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Contact</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>', NULL, '2017-03-15 11:37:28', '2017-03-21 07:27:21');
INSERT INTO `post_translations` VALUES (82, 137, 'en', 'Doctor 1', '', '', NULL, '2017-03-16 04:35:41', '2017-03-16 04:35:41');
INSERT INTO `post_translations` VALUES (83, 138, 'en', 'Doctor 2', '', '', NULL, '2017-03-16 05:44:37', '2017-03-16 05:44:37');
INSERT INTO `post_translations` VALUES (84, 139, 'en', 'Doctor 1', '', '', NULL, '2017-03-16 05:45:04', '2017-03-16 05:45:04');
INSERT INTO `post_translations` VALUES (85, 140, 'en', 'Logo', '', '', NULL, '2017-03-16 07:25:31', '2017-03-16 07:25:31');
INSERT INTO `post_translations` VALUES (360, 278, 'de', '', '', '', NULL, '2017-03-20 07:40:20', '2017-03-20 07:40:20');
INSERT INTO `post_translations` VALUES (361, 278, 'en', 'Dr. Anna Doe', 'Sample Position', '<h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Info</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Experience</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p><h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Contact</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>', NULL, '2017-03-20 07:40:20', '2017-03-21 07:26:55');
INSERT INTO `post_translations` VALUES (362, 279, 'de', '', '', '', NULL, '2017-03-21 02:59:18', '2017-03-21 02:59:18');
INSERT INTO `post_translations` VALUES (363, 279, 'en', 'Lorem ipsum dolor sit amet', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer;</p><p style=\"text-align: center; \"><img src=\"http://sbd639.loc/uploads/content-img.jpg\" style=\"width: 810px;\"><br></p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer;</p><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer;<br></p>', NULL, '2017-03-21 02:59:18', '2017-03-21 04:34:44');
INSERT INTO `post_translations` VALUES (374, 285, 'de', '', '', '', NULL, '2017-03-21 03:26:45', '2017-03-21 03:26:45');
INSERT INTO `post_translations` VALUES (375, 285, 'en', 'Contact us', '', '<p><span style=\"color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; text-align: center;\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam,</span><br style=\"margin: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; text-align: center;\"><span style=\"color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; text-align: center;\">eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.</span><br></p>', NULL, '2017-03-21 03:26:45', '2017-03-21 03:26:45');
INSERT INTO `post_translations` VALUES (376, 286, 'de', '', '', '', NULL, '2017-03-21 03:39:03', '2017-03-21 03:39:03');
INSERT INTO `post_translations` VALUES (377, 286, 'en', 'which resembles a Latin sentence', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer; Hendrerit phasellus litora nulla suspendisse... Id est cum tincidunt? Ornare felis laoreet ullamcorper vestibulum interdum, aliquam natoque tristique phasellus sodales mauris primis... Gravida hac ut inceptos sagittis varius lorem! Dui integer tellus neque, penatibus dictumst ante volutpat nulla? Torquent libero consectetuer risus lacinia tincidunt? Litora risus litora id fusce congue! Vestibulum condimentum sociosqu cursus fames aliquet purus. Per odio litora aliquam a dapibus neque proin! Velit ultrices nam condimentum quisque iaculis eget a! Mattis in convallis; Interdum dignissim lectus in sagittis accumsan, turpis hac duis ultrices diam purus pellentesque... Tristique torquent ligula commodo conubia posuere scelerisque: Congue tristique adipiscing gravida. Mus hymenaeos habitasse! Commodo sociosqu aliquam est montes urna hac: Dis varius commodo vehicula et? Aenean tellus sociis bibendum class ac... Sollicitudin sit congue sapien vestibulum in, suscipit ligula eleifend eros ut diam malesuada, nibh penatibus bibendum morbi rutrum elementum sit. Sed senectus sociis penatibus commodo purus sollicitudin senectus: Rutrum suscipit vulputate fusce tellus... Neque bibendum facilisi. Montes integer dis hymenaeos accumsan dapibus congue ornare: Quis vivamus neque! At rutrum arcu hendrerit felis molestie? Mattis platea sagittis lorem augue? Dapibus quis auctor imperdiet imperdiet amet dictumst! Dapibus volutpat est penatibus augue montes fringilla. At phasellus sodales. Tellus nullam rutrum tempus platea: Netus odio consequat aenean a etiam porta at: Arcu torquent orci sodales vulputate phasellus tortor? Accumsan tempor aenean. Ac ut proin. Taciti potenti sed felis... Congue mi laoreet turpis cras, sodales sapien litora? Venenatis tincidunt ad molestie: Gravida nullam felis... Libero fringilla cum mauris? Natoque accumsan varius nisi... Libero sodales potenti quam bibendum justo facilisis laoreet! Elementum nonummy potenti mattis lectus sociosqu! Ligula eu dictumst imperdiet feugiat; Tempus senectus cursus iaculis aliquet. Quisque ullamcorper auctor velit molestie! Molestie suspendisse malesuada litora habitant! Ante commodo tempus eros congue ridiculus aliquet; Condimentum odio sollicitudin penatibus etiam nisl... Lacus nostra a gravida enim nec? Conubia nulla consectetuer justo curae;! Tristique rutrum diam parturient primis porttitor, adipiscing phasellus leo posuere quisque, auctor pretium donec. Augue fermentum taciti eu auctor cursus risus at! Turpis elit ultricies conubia tellus placerat? Taciti sapien volutpat montes diam ac per, enim quisque mus; Diam neque enim quis lorem faucibus dui, placerat porttitor posuere non taciti etiam quam... Congue nec dui duis eu montes lacinia... Tortor nibh netus ligula: Curae; dolor imperdiet lobortis. Cras magnis curabitur feugiat... Ultrices sagittis eget nisi? Tristique bibendum molestie volutpat. Primis dui lectus quisque nisl, sapien primis convallis lacinia: At nam leo vitae laoreet! Class neque sodales egestas luctus cum mauris, nibh interdum taciti imperdiet vulputate per habitant nisl, nonummy etiam netus quisque elementum dapibus curabitur; Tortor quam hac ridiculus; Inceptos pellentesque augue malesuada dapibus pellentesque dolor at! Condimentum sociosqu sagittis felis faucibus vivamus, dictum fringilla nascetur parturient... Suscipit conubia pellentesque blandit hendrerit egestas ad consectetuer. Quis suspendisse sagittis mollis tempor egestas facilisi, sem tortor nulla vivamus sociosqu ultricies egestas amet. Scelerisque arcu curae; nec, adipiscing suspendisse diam ut purus bibendum tempus ipsum: Sapien blandit placerat tempor... Nec purus vel laoreet sodales.Habitant donec tristique arcu; Sollicitudin ac per neque senectus luctus; Nam venenatis nam fames! Habitant gravida commodo hymenaeos neque. Maecenas sollicitudin molestie; A non dis: Turpis iaculis pede per dolor ultrices nec! Sociis justo lectus sociis euismod nonummy... Placerat morbi enim et euismod habitasse ultricies; Fringilla malesuada euismod ultricies semper? Sed elementum cursus vivamus et quisque nibh. Mollis facilisi potenti fusce rhoncus quam. Pharetra hymenaeos nisi commodo inceptos vehicula, lorem nullam dapibus nunc: Mollis volutpat dignissim, curae; aenean enim porttitor? Est facilisis amet ad hac laoreet ante: Nonummy dictum risus mauris semper: Malesuada odio est; Lobortis imperdiet nisl ornare volutpat integer? Egestas proin mollis tortor... Hymenaeos ridiculus potenti cras suspendisse? Porttitor enim eros suspendisse quis, lectus iaculis augue magnis dapibus ipsum vestibulum... Etiam urna placerat... Sapien augue parturient luctus nascetur; Hymenaeos leo consequat urna dictumst sagittis; Pretium porttitor aliquet congue dignissim? Non porttitor aliquet. Enim scelerisque vitae taciti vehicula nec dolor tellus; Cursus malesuada penatibus; Quis semper viverra non lobortis mi eget hac; Aptent diam egestas mollis volutpat quis eleifend nec: Et sagittis maecenas tincidunt, pulvinar mi imperdiet arcu, imperdiet porta urna nisi suscipit consectetuer! Senectus est pulvinar euismod morbi, fermentum maecenas sociis interdum... Penatibus dictumst ante vitae consectetuer nonummy taciti: Elit cum vestibulum malesuada mauris imperdiet. Enim turpis lacus. Nibh curabitur aenean netus eleifend neque lacinia; Phasellus auctor pellentesque; Eget ullamcorper turpis. Sociosqu ligula malesuada; Semper dapibus enim. Nunc cubilia duis facilisis; Fusce torquent augue phasellus vulputate; Malesuada sem justo aliquam... Lobortis ullamcorper urna magnis odio! Felis facilisi odio imperdiet! Id sem velit class proin amet tincidunt? Mollis leo cubilia cras scelerisque nullam. Rutrum ultricies magnis erat ullamcorper ridiculus parturient molestie; Turpis rhoncus vel; Viverra neque semper facilisis. Magna enim arcu! Laoreet cubilia velit; Orci vivamus risus quisque sit maecenas? Id montes dictumst ridiculus rhoncus imperdiet torquent ornare. Morbi class congue: Mauris est ac luctus aliquam posuere! Cursus dignissim mus... Enim integer adipiscing euismod leo vel mus; Luctus laoreet ut: Praesent mauris ac; Sodales molestie mauris dolor platea; Ligula felis cum amet libero lobortis tortor cubilia! Molestie ligula mauris mollis vehicula vehicula pharetra dis, nisl mauris ornare aenean? Mauris et sociosqu penatibus non viverra habitant? Non sapien pharetra natoque morbi eu! Orci eros ullamcorper cras cras per. Sapien orci ante: Taciti vel torquent tristique: Nunc facilisis pretium nostra amet? Facilisis mus nibh facilisi quam aptent elit... Egestas mattis erat maecenas magnis; Pulvinar faucibus congue vestibulum imperdiet tempor? Mattis nunc nunc cum: Condimentum vel sollicitudin auctor, lobortis velit risus cum nisl ridiculus hymenaeos? Euismod magnis fermentum quisque. Nostra pharetra sagittis magnis... Magnis sit nec amet netus. Nostra scelerisque mi lorem! Habitasse torquent felis vulputate! Nascetur consectetuer purus bibendum imperdiet iaculis; Feugiat porttitor volutpat id mollis montes aenean sem! Id vestibulum ultrices: Facilisis massa faucibus dictum nibh per vel consequat, elit elementum et hac, lorem mus sed: Iaculis tristique facilisis ipsum sed! Senectus magna nulla suspendisse ac risus... Et fringilla aliquam nostra penatibus nonummy tincidunt fusce. In libero maecenas iaculis ut porta mus: Eu ac libero, ornare cursus leo mattis.Et erat magnis mus mollis iaculis lacinia ad: Turpis dapibus fringilla a... Luctus leo eleifend feugiat suscipit nisl habitant turpis... Fringilla ligula fusce tristique amet consequat, convallis eu felis, pede accumsan tortor dolor: Senectus id scelerisque eu... Hac velit pede taciti dui facilisi dictumst? Vestibulum bibendum interdum a fermentum. Conubia commodo malesuada lobortis tellus dui. Conubia vestibulum diam tincidunt sodales! Orci leo torquent; Tristique inceptos consequat lorem iaculis! Odio praesent ultricies; Turpis eleifend habitasse; Suspendisse justo vulputate eros etiam. Aliquet ornare rhoncus elementum ut nonummy nascetur justo? Nunc magnis lacinia fringilla diam platea... Dolor orci lectus accumsan ullamcorper nostra phasellus: Venenatis mollis habitant blandit. Ornare fames neque, non morbi sem pellentesque ultricies? Montes praesent nisl imperdiet porta hendrerit est, ante cras metus dis dignissim... <br></p>', NULL, '2017-03-21 03:39:03', '2017-03-21 03:40:28');
INSERT INTO `post_translations` VALUES (378, 287, 'de', '', '', '', NULL, '2017-03-21 03:39:50', '2017-03-21 03:39:50');
INSERT INTO `post_translations` VALUES (379, 287, 'en', 'Lorem Ipsum is the whole of a text made up', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer; Hendrerit phasellus litora nulla suspendisse... Id est cum tincidunt? Ornare felis laoreet ullamcorper vestibulum interdum, aliquam natoque tristique phasellus sodales mauris primis... Gravida hac ut inceptos sagittis varius lorem! Dui integer tellus neque, penatibus dictumst ante volutpat nulla? Torquent libero consectetuer risus lacinia tincidunt? Litora risus litora id fusce congue! Vestibulum condimentum sociosqu cursus fames aliquet purus. Per odio litora aliquam a dapibus neque proin! Velit ultrices nam condimentum quisque iaculis eget a! Mattis in convallis; Interdum dignissim lectus in sagittis accumsan, turpis hac duis ultrices diam purus pellentesque... Tristique torquent ligula commodo conubia posuere scelerisque: Congue tristique adipiscing gravida. Mus hymenaeos habitasse! Commodo sociosqu aliquam est montes urna hac: Dis varius commodo vehicula et? Aenean tellus sociis bibendum class ac... Sollicitudin sit congue sapien vestibulum in, suscipit ligula eleifend eros ut diam malesuada, nibh penatibus bibendum morbi rutrum elementum sit. Sed senectus sociis penatibus commodo purus sollicitudin senectus: Rutrum suscipit vulputate fusce tellus... Neque bibendum facilisi. Montes integer dis hymenaeos accumsan dapibus congue ornare: Quis vivamus neque! At rutrum arcu hendrerit felis molestie? Mattis platea sagittis lorem augue? Dapibus quis auctor imperdiet imperdiet amet dictumst! Dapibus volutpat est penatibus augue montes fringilla. At phasellus sodales. Tellus nullam rutrum tempus platea: Netus odio consequat aenean a etiam porta at: Arcu torquent orci sodales vulputate phasellus tortor? Accumsan tempor aenean. Ac ut proin. Taciti potenti sed felis... Congue mi laoreet turpis cras, sodales sapien litora? Venenatis tincidunt ad molestie: Gravida nullam felis... Libero fringilla cum mauris? Natoque accumsan varius nisi... Libero sodales potenti quam bibendum justo facilisis laoreet! Elementum nonummy potenti mattis lectus sociosqu! Ligula eu dictumst imperdiet feugiat; Tempus senectus cursus iaculis aliquet. Quisque ullamcorper auctor velit molestie! Molestie suspendisse malesuada litora habitant! Ante commodo tempus eros congue ridiculus aliquet; Condimentum odio sollicitudin penatibus etiam nisl... Lacus nostra a gravida enim nec? Conubia nulla consectetuer justo curae;! Tristique rutrum diam parturient primis porttitor, adipiscing phasellus leo posuere quisque, auctor pretium donec. Augue fermentum taciti eu auctor cursus risus at! Turpis elit ultricies conubia tellus placerat? Taciti sapien volutpat montes diam ac per, enim quisque mus; Diam neque enim quis lorem faucibus dui, placerat porttitor posuere non taciti etiam quam... Congue nec dui duis eu montes lacinia... Tortor nibh netus ligula: Curae; dolor imperdiet lobortis. Cras magnis curabitur feugiat... Ultrices sagittis eget nisi? Tristique bibendum molestie volutpat. Primis dui lectus quisque nisl, sapien primis convallis lacinia: At nam leo vitae laoreet! Class neque sodales egestas luctus cum mauris, nibh interdum taciti imperdiet vulputate per habitant nisl, nonummy etiam netus quisque elementum dapibus curabitur; Tortor quam hac ridiculus; Inceptos pellentesque augue malesuada dapibus pellentesque dolor at! Condimentum sociosqu sagittis felis faucibus vivamus, dictum fringilla nascetur parturient... Suscipit conubia pellentesque blandit hendrerit egestas ad consectetuer. Quis suspendisse sagittis mollis tempor egestas facilisi, sem tortor nulla vivamus sociosqu ultricies egestas amet. Scelerisque arcu curae; nec, adipiscing suspendisse diam ut purus bibendum tempus ipsum: Sapien blandit placerat tempor... Nec purus vel laoreet sodales.Habitant donec tristique arcu; Sollicitudin ac per neque senectus luctus; Nam venenatis nam fames! Habitant gravida commodo hymenaeos neque. Maecenas sollicitudin molestie; A non dis: Turpis iaculis pede per dolor ultrices nec! Sociis justo lectus sociis euismod nonummy... Placerat morbi enim et euismod habitasse ultricies; Fringilla malesuada euismod ultricies semper? Sed elementum cursus vivamus et quisque nibh. Mollis facilisi potenti fusce rhoncus quam. Pharetra hymenaeos nisi commodo inceptos vehicula, lorem nullam dapibus nunc: Mollis volutpat dignissim, curae; aenean enim porttitor? Est facilisis amet ad hac laoreet ante: Nonummy dictum risus mauris semper: Malesuada odio est; Lobortis imperdiet nisl ornare volutpat integer? Egestas proin mollis tortor... Hymenaeos ridiculus potenti cras suspendisse? Porttitor enim eros suspendisse quis, lectus iaculis augue magnis dapibus ipsum vestibulum... Etiam urna placerat... Sapien augue parturient luctus nascetur; Hymenaeos leo consequat urna dictumst sagittis; Pretium porttitor aliquet congue dignissim? Non porttitor aliquet. Enim scelerisque vitae taciti vehicula nec dolor tellus; Cursus malesuada penatibus; Quis semper viverra non lobortis mi eget hac; Aptent diam egestas mollis volutpat quis eleifend nec: Et sagittis maecenas tincidunt, pulvinar mi imperdiet arcu, imperdiet porta urna nisi suscipit consectetuer! Senectus est pulvinar euismod morbi, fermentum maecenas sociis interdum... Penatibus dictumst ante vitae consectetuer nonummy taciti: Elit cum vestibulum malesuada mauris imperdiet. Enim turpis lacus. Nibh curabitur aenean netus eleifend neque lacinia; Phasellus auctor pellentesque; Eget ullamcorper turpis. Sociosqu ligula malesuada; Semper dapibus enim. Nunc cubilia duis facilisis; Fusce torquent augue phasellus vulputate; Malesuada sem justo aliquam... Lobortis ullamcorper urna magnis odio! Felis facilisi odio imperdiet! Id sem velit class proin amet tincidunt? Mollis leo cubilia cras scelerisque nullam. Rutrum ultricies magnis erat ullamcorper ridiculus parturient molestie; Turpis rhoncus vel; Viverra neque semper facilisis. Magna enim arcu! Laoreet cubilia velit; Orci vivamus risus quisque sit maecenas? Id montes dictumst ridiculus rhoncus imperdiet torquent ornare. Morbi class congue: Mauris est ac luctus aliquam posuere! Cursus dignissim mus... Enim integer adipiscing euismod leo vel mus; Luctus laoreet ut: Praesent mauris ac; Sodales molestie mauris dolor platea; Ligula felis cum amet libero lobortis tortor cubilia! Molestie ligula mauris mollis vehicula vehicula pharetra dis, nisl mauris ornare aenean? Mauris et sociosqu penatibus non viverra habitant? Non sapien pharetra natoque morbi eu! Orci eros ullamcorper cras cras per. Sapien orci ante: Taciti vel torquent tristique: Nunc facilisis pretium nostra amet? Facilisis mus nibh facilisi quam aptent elit... Egestas mattis erat maecenas magnis; Pulvinar faucibus congue vestibulum imperdiet tempor? Mattis nunc nunc cum: Condimentum vel sollicitudin auctor, lobortis velit risus cum nisl ridiculus hymenaeos? Euismod magnis fermentum quisque. Nostra pharetra sagittis magnis... Magnis sit nec amet netus. Nostra scelerisque mi lorem! Habitasse torquent felis vulputate! Nascetur consectetuer purus bibendum imperdiet iaculis; Feugiat porttitor volutpat id mollis montes aenean sem! Id vestibulum ultrices: Facilisis massa faucibus dictum nibh per vel consequat, elit elementum et hac, lorem mus sed: Iaculis tristique facilisis ipsum sed! Senectus magna nulla suspendisse ac risus... Et fringilla aliquam nostra penatibus nonummy tincidunt fusce. In libero maecenas iaculis ut porta mus: Eu ac libero, ornare cursus leo mattis.Et erat magnis mus mollis iaculis lacinia ad: Turpis dapibus fringilla a... Luctus leo eleifend feugiat suscipit nisl habitant turpis... Fringilla ligula fusce tristique amet consequat, convallis eu felis, pede accumsan tortor dolor: Senectus id scelerisque eu... Hac velit pede taciti dui facilisi dictumst? Vestibulum bibendum interdum a fermentum. Conubia commodo malesuada lobortis tellus dui. Conubia vestibulum diam tincidunt sodales! Orci leo torquent; Tristique inceptos consequat lorem iaculis! Odio praesent ultricies; Turpis eleifend habitasse; Suspendisse justo vulputate eros etiam. Aliquet ornare rhoncus elementum ut nonummy nascetur justo? Nunc magnis lacinia fringilla diam platea... Dolor orci lectus accumsan ullamcorper nostra phasellus: Venenatis mollis habitant blandit. Ornare fames neque, non morbi sem pellentesque ultricies? Montes praesent nisl imperdiet porta hendrerit est, ante cras metus dis dignissim... <br></p>', NULL, '2017-03-21 03:39:50', '2017-03-21 03:39:50');
INSERT INTO `post_translations` VALUES (386, 291, 'de', '', '', '', NULL, '2017-03-22 02:10:38', '2017-03-22 02:10:38');
INSERT INTO `post_translations` VALUES (387, 291, 'en', 'Dr.Ana', 'Dr.Ana', '<h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Info</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?</p><h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Experience</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p><h5 style=\"margin-right: 0px; margin-left: 0px; padding: 0px; font-family: Raleway-Bold; color: rgb(34, 34, 34); font-size: 20px; background-color: rgb(246, 246, 246);\">Contact</h5><p style=\"margin-bottom: 0px; padding: 0px; color: rgb(34, 34, 34); font-family: Raleway-Medium, Arial, serif; font-size: 14px; background-color: rgb(246, 246, 246);\">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.</p>', NULL, '2017-03-22 02:10:38', '2017-03-22 02:10:38');
INSERT INTO `post_translations` VALUES (388, 292, 'de', '', '', '', NULL, '2017-03-22 02:59:23', '2017-03-22 02:59:23');
INSERT INTO `post_translations` VALUES (389, 292, 'en', ' Laoreet cubilia velit', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer; Hendrerit phasellus litora nulla suspendisse... Id est cum tincidunt? Ornare felis laoreet ullamcorper vestibulum interdum, aliquam natoque tristique phasellus sodales mauris primis... Gravida hac ut inceptos sagittis varius lorem! Dui integer tellus neque, penatibus dictumst ante volutpat nulla? Torquent libero consectetuer risus lacinia tincidunt? Litora risus litora id fusce congue! Vestibulum condimentum sociosqu cursus fames aliquet purus. Per odio litora aliquam a dapibus neque proin! Velit ultrices nam condimentum quisque iaculis eget a! Mattis in convallis; Interdum dignissim lectus in sagittis accumsan, turpis hac duis ultrices diam purus pellentesque... Tristique torquent ligula commodo conubia posuere scelerisque: Congue tristique adipiscing gravida. Mus hymenaeos habitasse! Commodo sociosqu aliquam est montes urna hac: Dis varius commodo vehicula et? Aenean tellus sociis bibendum class ac... Sollicitudin sit congue sapien vestibulum in, suscipit ligula eleifend eros ut diam malesuada, nibh penatibus bibendum morbi rutrum elementum sit. Sed senectus sociis penatibus commodo purus sollicitudin senectus: Rutrum suscipit vulputate fusce tellus... Neque bibendum facilisi. Montes integer dis hymenaeos accumsan dapibus congue ornare: Quis vivamus neque! At rutrum arcu hendrerit felis molestie? Mattis platea sagittis lorem augue? Dapibus quis auctor imperdiet imperdiet amet dictumst! Dapibus volutpat est penatibus augue montes fringilla. At phasellus sodales. Tellus nullam rutrum tempus platea: Netus odio consequat aenean a etiam porta at: Arcu torquent orci sodales vulputate phasellus tortor? Accumsan tempor aenean. Ac ut proin. Taciti potenti sed felis... Congue mi laoreet turpis cras, sodales sapien litora? Venenatis tincidunt ad molestie: Gravida nullam felis... Libero fringilla cum mauris? Natoque accumsan varius nisi... Libero sodales potenti quam bibendum justo facilisis laoreet! Elementum nonummy potenti mattis lectus sociosqu! Ligula eu dictumst imperdiet feugiat; Tempus senectus cursus iaculis aliquet. Quisque ullamcorper auctor velit molestie! Molestie suspendisse malesuada litora habitant! Ante commodo tempus eros congue ridiculus aliquet; Condimentum odio sollicitudin penatibus etiam nisl... Lacus nostra a gravida enim nec? Conubia nulla consectetuer justo curae;! Tristique rutrum diam parturient primis porttitor, adipiscing phasellus leo posuere quisque, auctor pretium donec. Augue fermentum taciti eu auctor cursus risus at! Turpis elit ultricies conubia tellus placerat? Taciti sapien volutpat montes diam ac per, enim quisque mus; Diam neque enim quis lorem faucibus dui, placerat porttitor posuere non taciti etiam quam... Congue nec dui duis eu montes lacinia... Tortor nibh netus ligula: Curae; dolor imperdiet lobortis. Cras magnis curabitur feugiat... Ultrices sagittis eget nisi? Tristique bibendum molestie volutpat. Primis dui lectus quisque nisl, sapien primis convallis lacinia: At nam leo vitae laoreet! Class neque sodales egestas luctus cum mauris, nibh interdum taciti imperdiet vulputate per habitant nisl, nonummy etiam netus quisque elementum dapibus curabitur; Tortor quam hac ridiculus; Inceptos pellentesque augue malesuada dapibus pellentesque dolor at! Condimentum sociosqu sagittis felis faucibus vivamus, dictum fringilla nascetur parturient... Suscipit conubia pellentesque blandit hendrerit egestas ad consectetuer. Quis suspendisse sagittis mollis tempor egestas facilisi, sem tortor nulla vivamus sociosqu ultricies egestas amet. Scelerisque arcu curae; nec, adipiscing suspendisse diam ut purus bibendum tempus ipsum: Sapien blandit placerat tempor... Nec purus vel laoreet sodales.Habitant donec tristique arcu; Sollicitudin ac per neque senectus luctus; Nam venenatis nam fames! Habitant gravida commodo hymenaeos neque. Maecenas sollicitudin molestie; A non dis: Turpis iaculis pede per dolor ultrices nec! Sociis justo lectus sociis euismod nonummy... Placerat morbi enim et euismod habitasse ultricies; Fringilla malesuada euismod ultricies semper? Sed elementum cursus vivamus et quisque nibh. Mollis facilisi potenti fusce rhoncus quam. Pharetra hymenaeos nisi commodo inceptos vehicula, lorem nullam dapibus nunc: Mollis volutpat dignissim, curae; aenean enim porttitor? Est facilisis amet ad hac laoreet ante: Nonummy dictum risus mauris semper: Malesuada odio est; Lobortis imperdiet nisl ornare volutpat integer? Egestas proin mollis tortor... Hymenaeos ridiculus potenti cras suspendisse? Porttitor enim eros suspendisse quis, lectus iaculis augue magnis dapibus ipsum vestibulum... Etiam urna placerat... Sapien augue parturient luctus nascetur; Hymenaeos leo consequat urna dictumst sagittis; Pretium porttitor aliquet congue dignissim? Non porttitor aliquet. Enim scelerisque vitae taciti vehicula nec dolor tellus; Cursus malesuada penatibus; Quis semper viverra non lobortis mi eget hac; Aptent diam egestas mollis volutpat quis eleifend nec: Et sagittis maecenas tincidunt, pulvinar mi imperdiet arcu, imperdiet porta urna nisi suscipit consectetuer! Senectus est pulvinar euismod morbi, fermentum maecenas sociis interdum... Penatibus dictumst ante vitae consectetuer nonummy taciti: Elit cum vestibulum malesuada mauris imperdiet. Enim turpis lacus. Nibh curabitur aenean netus eleifend neque lacinia; Phasellus auctor pellentesque; Eget ullamcorper turpis. Sociosqu ligula malesuada; Semper dapibus enim. Nunc cubilia duis facilisis; Fusce torquent augue phasellus vulputate; Malesuada sem justo aliquam... Lobortis ullamcorper urna magnis odio! Felis facilisi odio imperdiet! Id sem velit class proin amet tincidunt? Mollis leo cubilia cras scelerisque nullam. Rutrum ultricies magnis erat ullamcorper ridiculus parturient molestie; Turpis rhoncus vel; Viverra neque semper facilisis. Magna enim arcu! Laoreet cubilia velit; Orci vivamus risus quisque sit maecenas? Id montes dictumst ridiculus rhoncus imperdiet torquent ornare. Morbi class congue: Mauris est ac luctus aliquam posuere! Cursus dignissim mus... Enim integer adipiscing euismod leo vel mus; Luctus laoreet ut: Praesent mauris ac; Sodales molestie mauris dolor platea; Ligula felis cum amet libero lobortis tortor cubilia! Molestie ligula mauris mollis vehicula vehicula pharetra dis, nisl mauris ornare aenean? Mauris et sociosqu penatibus non viverra habitant? Non sapien pharetra natoque morbi eu! Orci eros ullamcorper cras cras per. Sapien orci ante: Taciti vel torquent tristique: Nunc facilisis pretium nostra amet? Facilisis mus nibh facilisi quam aptent elit... Egestas mattis erat maecenas magnis; Pulvinar faucibus congue vestibulum imperdiet tempor? Mattis nunc nunc cum: Condimentum vel sollicitudin auctor, lobortis velit risus cum nisl ridiculus hymenaeos? Euismod magnis fermentum quisque. Nostra pharetra sagittis magnis... Magnis sit nec amet netus. Nostra scelerisque mi lorem! Habitasse torquent felis vulputate! Nascetur consectetuer purus bibendum imperdiet iaculis; Feugiat porttitor volutpat id mollis montes aenean sem! Id vestibulum ultrices: Facilisis massa faucibus dictum nibh per vel consequat, elit elementum et hac, lorem mus sed: Iaculis tristique facilisis ipsum sed! Senectus magna nulla suspendisse ac risus... Et fringilla aliquam nostra penatibus nonummy tincidunt fusce. In libero maecenas iaculis ut porta mus: Eu ac libero, ornare cursus leo mattis.Et erat magnis mus mollis iaculis lacinia ad: Turpis dapibus fringilla a... Luctus leo eleifend feugiat suscipit nisl habitant turpis... Fringilla ligula fusce tristique amet consequat, convallis eu felis, pede accumsan tortor dolor: Senectus id scelerisque eu... Hac velit pede taciti dui facilisi dictumst? Vestibulum bibendum interdum a fermentum. Conubia commodo malesuada lobortis tellus dui. Conubia vestibulum diam tincidunt sodales! Orci leo torquent; Tristique inceptos consequat lorem iaculis! Odio praesent ultricies; Turpis eleifend habitasse; Suspendisse justo vulputate eros etiam. Aliquet ornare rhoncus elementum ut nonummy nascetur justo? Nunc magnis lacinia fringilla diam platea... Dolor orci lectus accumsan ullamcorper nostra phasellus: Venenatis mollis habitant blandit. Ornare fames neque, non morbi sem pellentesque ultricies? Montes praesent nisl imperdiet porta hendrerit est, ante cras metus dis dignissim... <br></p>', NULL, '2017-03-22 02:59:23', '2017-03-22 04:39:03');
INSERT INTO `post_translations` VALUES (390, 293, 'de', '', '', '', NULL, '2017-03-22 02:59:37', '2017-03-22 02:59:37');
INSERT INTO `post_translations` VALUES (391, 293, 'en', 'Odio praesent ultricies', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis laoreet ipsum pede mi dolor: Gravida arcu blandit natoque feugiat ullamcorper tristique: Litora cubilia imperdiet vulputate urna fermentum varius: Semper mi accumsan scelerisque adipiscing euismod facilisi aenean, ac vehicula sem blandit, per sed mauris sagittis aliquam nisi risus consectetuer... Sodales torquent fringilla cras malesuada iaculis hac parturient... Pede congue convallis viverra aliquet natoque? Vestibulum justo mauris quam blandit feugiat. Curae; facilisis ornare! Dis habitant urna justo purus egestas! Laoreet etiam convallis; At feugiat phasellus mi sit sem venenatis euismod? Pretium sed laoreet conubia rutrum laoreet elit fames: Gravida neque metus ornare turpis nullam dignissim! Nulla iaculis dis cum fermentum conubia eu est. Turpis nisi pulvinar felis aenean torquent scelerisque! Rhoncus habitant lectus ligula dictum amet metus consectetuer; Hendrerit phasellus litora nulla suspendisse... Id est cum tincidunt? Ornare felis laoreet ullamcorper vestibulum interdum, aliquam natoque tristique phasellus sodales mauris primis... Gravida hac ut inceptos sagittis varius lorem! Dui integer tellus neque, penatibus dictumst ante volutpat nulla? Torquent libero consectetuer risus lacinia tincidunt? Litora risus litora id fusce congue! Vestibulum condimentum sociosqu cursus fames aliquet purus. Per odio litora aliquam a dapibus neque proin! Velit ultrices nam condimentum quisque iaculis eget a! Mattis in convallis; Interdum dignissim lectus in sagittis accumsan, turpis hac duis ultrices diam purus pellentesque... Tristique torquent ligula commodo conubia posuere scelerisque: Congue tristique adipiscing gravida. Mus hymenaeos habitasse! Commodo sociosqu aliquam est montes urna hac: Dis varius commodo vehicula et? Aenean tellus sociis bibendum class ac... Sollicitudin sit congue sapien vestibulum in, suscipit ligula eleifend eros ut diam malesuada, nibh penatibus bibendum morbi rutrum elementum sit. Sed senectus sociis penatibus commodo purus sollicitudin senectus: Rutrum suscipit vulputate fusce tellus... Neque bibendum facilisi. Montes integer dis hymenaeos accumsan dapibus congue ornare: Quis vivamus neque! At rutrum arcu hendrerit felis molestie? Mattis platea sagittis lorem augue? Dapibus quis auctor imperdiet imperdiet amet dictumst! Dapibus volutpat est penatibus augue montes fringilla. At phasellus sodales. Tellus nullam rutrum tempus platea: Netus odio consequat aenean a etiam porta at: Arcu torquent orci sodales vulputate phasellus tortor? Accumsan tempor aenean. Ac ut proin. Taciti potenti sed felis... Congue mi laoreet turpis cras, sodales sapien litora? Venenatis tincidunt ad molestie: Gravida nullam felis... Libero fringilla cum mauris? Natoque accumsan varius nisi... Libero sodales potenti quam bibendum justo facilisis laoreet! Elementum nonummy potenti mattis lectus sociosqu! Ligula eu dictumst imperdiet feugiat; Tempus senectus cursus iaculis aliquet. Quisque ullamcorper auctor velit molestie! Molestie suspendisse malesuada litora habitant! Ante commodo tempus eros congue ridiculus aliquet; Condimentum odio sollicitudin penatibus etiam nisl... Lacus nostra a gravida enim nec? Conubia nulla consectetuer justo curae;! Tristique rutrum diam parturient primis porttitor, adipiscing phasellus leo posuere quisque, auctor pretium donec. Augue fermentum taciti eu auctor cursus risus at! Turpis elit ultricies conubia tellus placerat? Taciti sapien volutpat montes diam ac per, enim quisque mus; Diam neque enim quis lorem faucibus dui, placerat porttitor posuere non taciti etiam quam... Congue nec dui duis eu montes lacinia... Tortor nibh netus ligula: Curae; dolor imperdiet lobortis. Cras magnis curabitur feugiat... Ultrices sagittis eget nisi? Tristique bibendum molestie volutpat. Primis dui lectus quisque nisl, sapien primis convallis lacinia: At nam leo vitae laoreet! Class neque sodales egestas luctus cum mauris, nibh interdum taciti imperdiet vulputate per habitant nisl, nonummy etiam netus quisque elementum dapibus curabitur; Tortor quam hac ridiculus; Inceptos pellentesque augue malesuada dapibus pellentesque dolor at! Condimentum sociosqu sagittis felis faucibus vivamus, dictum fringilla nascetur parturient... Suscipit conubia pellentesque blandit hendrerit egestas ad consectetuer. Quis suspendisse sagittis mollis tempor egestas facilisi, sem tortor nulla vivamus sociosqu ultricies egestas amet. Scelerisque arcu curae; nec, adipiscing suspendisse diam ut purus bibendum tempus ipsum: Sapien blandit placerat tempor... Nec purus vel laoreet sodales.Habitant donec tristique arcu; Sollicitudin ac per neque senectus luctus; Nam venenatis nam fames! Habitant gravida commodo hymenaeos neque. Maecenas sollicitudin molestie; A non dis: Turpis iaculis pede per dolor ultrices nec! Sociis justo lectus sociis euismod nonummy... Placerat morbi enim et euismod habitasse ultricies; Fringilla malesuada euismod ultricies semper? Sed elementum cursus vivamus et quisque nibh. Mollis facilisi potenti fusce rhoncus quam. Pharetra hymenaeos nisi commodo inceptos vehicula, lorem nullam dapibus nunc: Mollis volutpat dignissim, curae; aenean enim porttitor? Est facilisis amet ad hac laoreet ante: Nonummy dictum risus mauris semper: Malesuada odio est; Lobortis imperdiet nisl ornare volutpat integer? Egestas proin mollis tortor... Hymenaeos ridiculus potenti cras suspendisse? Porttitor enim eros suspendisse quis, lectus iaculis augue magnis dapibus ipsum vestibulum... Etiam urna placerat... Sapien augue parturient luctus nascetur; Hymenaeos leo consequat urna dictumst sagittis; Pretium porttitor aliquet congue dignissim? Non porttitor aliquet. Enim scelerisque vitae taciti vehicula nec dolor tellus; Cursus malesuada penatibus; Quis semper viverra non lobortis mi eget hac; Aptent diam egestas mollis volutpat quis eleifend nec: Et sagittis maecenas tincidunt, pulvinar mi imperdiet arcu, imperdiet porta urna nisi suscipit consectetuer! Senectus est pulvinar euismod morbi, fermentum maecenas sociis interdum... Penatibus dictumst ante vitae consectetuer nonummy taciti: Elit cum vestibulum malesuada mauris imperdiet. Enim turpis lacus. Nibh curabitur aenean netus eleifend neque lacinia; Phasellus auctor pellentesque; Eget ullamcorper turpis. Sociosqu ligula malesuada; Semper dapibus enim. Nunc cubilia duis facilisis; Fusce torquent augue phasellus vulputate; Malesuada sem justo aliquam... Lobortis ullamcorper urna magnis odio! Felis facilisi odio imperdiet! Id sem velit class proin amet tincidunt? Mollis leo cubilia cras scelerisque nullam. Rutrum ultricies magnis erat ullamcorper ridiculus parturient molestie; Turpis rhoncus vel; Viverra neque semper facilisis. Magna enim arcu! Laoreet cubilia velit; Orci vivamus risus quisque sit maecenas? Id montes dictumst ridiculus rhoncus imperdiet torquent ornare. Morbi class congue: Mauris est ac luctus aliquam posuere! Cursus dignissim mus... Enim integer adipiscing euismod leo vel mus; Luctus laoreet ut: Praesent mauris ac; Sodales molestie mauris dolor platea; Ligula felis cum amet libero lobortis tortor cubilia! Molestie ligula mauris mollis vehicula vehicula pharetra dis, nisl mauris ornare aenean? Mauris et sociosqu penatibus non viverra habitant? Non sapien pharetra natoque morbi eu! Orci eros ullamcorper cras cras per. Sapien orci ante: Taciti vel torquent tristique: Nunc facilisis pretium nostra amet? Facilisis mus nibh facilisi quam aptent elit... Egestas mattis erat maecenas magnis; Pulvinar faucibus congue vestibulum imperdiet tempor? Mattis nunc nunc cum: Condimentum vel sollicitudin auctor, lobortis velit risus cum nisl ridiculus hymenaeos? Euismod magnis fermentum quisque. Nostra pharetra sagittis magnis... Magnis sit nec amet netus. Nostra scelerisque mi lorem! Habitasse torquent felis vulputate! Nascetur consectetuer purus bibendum imperdiet iaculis; Feugiat porttitor volutpat id mollis montes aenean sem! Id vestibulum ultrices: Facilisis massa faucibus dictum nibh per vel consequat, elit elementum et hac, lorem mus sed: Iaculis tristique facilisis ipsum sed! Senectus magna nulla suspendisse ac risus... Et fringilla aliquam nostra penatibus nonummy tincidunt fusce. In libero maecenas iaculis ut porta mus: Eu ac libero, ornare cursus leo mattis.Et erat magnis mus mollis iaculis lacinia ad: Turpis dapibus fringilla a... Luctus leo eleifend feugiat suscipit nisl habitant turpis... Fringilla ligula fusce tristique amet consequat, convallis eu felis, pede accumsan tortor dolor: Senectus id scelerisque eu... Hac velit pede taciti dui facilisi dictumst? Vestibulum bibendum interdum a fermentum. Conubia commodo malesuada lobortis tellus dui. Conubia vestibulum diam tincidunt sodales! Orci leo torquent; Tristique inceptos consequat lorem iaculis! Odio praesent ultricies; Turpis eleifend habitasse; Suspendisse justo vulputate eros etiam. Aliquet ornare rhoncus elementum ut nonummy nascetur justo? Nunc magnis lacinia fringilla diam platea... Dolor orci lectus accumsan ullamcorper nostra phasellus: Venenatis mollis habitant blandit. Ornare fames neque, non morbi sem pellentesque ultricies? Montes praesent nisl imperdiet porta hendrerit est, ante cras metus dis dignissim... <br></p>', NULL, '2017-03-22 02:59:37', '2017-03-23 04:35:54');
INSERT INTO `post_translations` VALUES (396, 296, 'de', 'Home', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (397, 296, 'en', 'Home', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (398, 297, 'de', 'Team', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (399, 297, 'en', 'Team', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (400, 298, 'de', 'News', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (401, 298, 'en', 'News', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (402, 299, 'de', '', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');
INSERT INTO `post_translations` VALUES (403, 299, 'en', 'Contact us', '', '', NULL, '2017-03-23 04:36:33', '2017-03-23 04:36:33');

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_author` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `post_content` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_parent` bigint(20) NOT NULL DEFAULT 0,
  `guid` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `menu_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `post_hit` int(11) NOT NULL DEFAULT 0,
  `post_mime_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'post',
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `posts_post_author_foreign`(`post_author`) USING BTREE,
  CONSTRAINT `posts_post_author_foreign` FOREIGN KEY (`post_author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 301 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (22, 1, '', 'Qtranslate X.3.4.6.8', '', 'inherit', 'open', '', 'qtranslate-x3468.zip', 0, '', 0, '', 'attachment', 0, 'application/x-zip-compressed', '2017-02-17 04:24:03', '2017-02-17 04:24:03');
INSERT INTO `posts` VALUES (23, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 04:25:29', '2017-02-17 04:25:29');
INSERT INTO `posts` VALUES (24, 1, '', 'One_Ring_Render', '', 'inherit', 'open', '', 'one-ring-render.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 04:30:06', '2017-02-17 04:30:06');
INSERT INTO `posts` VALUES (25, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 07:13:00', '2017-02-17 07:13:00');
INSERT INTO `posts` VALUES (26, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 07:13:41', '2017-02-17 07:13:41');
INSERT INTO `posts` VALUES (27, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 07:17:30', '2017-02-17 07:17:30');
INSERT INTO `posts` VALUES (28, 1, '', 'One_Ring_Render', '', 'inherit', 'open', '', 'one-ring-render.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 07:18:11', '2017-02-17 07:18:11');
INSERT INTO `posts` VALUES (29, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 08:28:54', '2017-02-17 08:28:54');
INSERT INTO `posts` VALUES (30, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 08:30:32', '2017-02-17 08:30:32');
INSERT INTO `posts` VALUES (31, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 08:31:22', '2017-02-17 08:31:22');
INSERT INTO `posts` VALUES (32, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-17 08:32:43', '2017-02-17 08:32:43');
INSERT INTO `posts` VALUES (33, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 02:42:47', '2017-02-21 02:42:47');
INSERT INTO `posts` VALUES (34, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 02:50:01', '2017-02-21 02:50:01');
INSERT INTO `posts` VALUES (35, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 02:56:23', '2017-02-21 02:56:23');
INSERT INTO `posts` VALUES (36, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 02:59:13', '2017-02-21 02:59:13');
INSERT INTO `posts` VALUES (37, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 03:00:02', '2017-02-21 03:00:02');
INSERT INTO `posts` VALUES (38, 1, '', 'IMG_0582', '', 'inherit', 'open', '', 'img-0582.JPG', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 03:00:22', '2017-02-21 03:00:22');
INSERT INTO `posts` VALUES (39, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 03:02:26', '2017-02-21 03:02:26');
INSERT INTO `posts` VALUES (40, 1, '', 'One_Ring_Render', '', 'inherit', 'open', '', 'one-ring-render.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 03:02:32', '2017-02-21 03:02:32');
INSERT INTO `posts` VALUES (41, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 03:02:40', '2017-02-21 03:02:40');
INSERT INTO `posts` VALUES (42, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:16:56', '2017-02-21 07:16:56');
INSERT INTO `posts` VALUES (43, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:22:06', '2017-02-21 07:22:06');
INSERT INTO `posts` VALUES (44, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:23:12', '2017-02-21 07:23:12');
INSERT INTO `posts` VALUES (45, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:25:38', '2017-02-21 07:25:38');
INSERT INTO `posts` VALUES (46, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:27:42', '2017-02-21 07:27:42');
INSERT INTO `posts` VALUES (47, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:27:53', '2017-02-21 07:27:53');
INSERT INTO `posts` VALUES (48, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:29:47', '2017-02-21 07:29:47');
INSERT INTO `posts` VALUES (49, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:43:40', '2017-02-21 07:43:40');
INSERT INTO `posts` VALUES (50, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:47:20', '2017-02-21 07:47:20');
INSERT INTO `posts` VALUES (51, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:48:32', '2017-02-21 07:48:32');
INSERT INTO `posts` VALUES (52, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 07:55:28', '2017-02-21 07:55:28');
INSERT INTO `posts` VALUES (53, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 07:55:54', '2017-02-21 07:55:54');
INSERT INTO `posts` VALUES (54, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 07:58:37', '2017-02-21 07:58:37');
INSERT INTO `posts` VALUES (55, 1, '', 'IMG_0582', '', 'inherit', 'open', '', 'img-0582.JPG', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 08:00:34', '2017-02-21 08:00:34');
INSERT INTO `posts` VALUES (56, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 08:01:08', '2017-02-21 08:01:08');
INSERT INTO `posts` VALUES (57, 1, '', 'IMG_0582', '', 'inherit', 'open', '', 'img-0582.JPG', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 08:01:24', '2017-02-21 08:01:24');
INSERT INTO `posts` VALUES (58, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 08:01:31', '2017-02-21 08:01:31');
INSERT INTO `posts` VALUES (59, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-02-21 08:01:42', '2017-02-21 08:01:42');
INSERT INTO `posts` VALUES (60, 1, '', 'Hoangdv_log_checkout_24.01.17', '', 'inherit', 'open', '', 'hoangdv-log-checkout-240117.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-21 08:01:49', '2017-02-21 08:01:49');
INSERT INTO `posts` VALUES (61, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-02-22 07:11:43', '2017-02-22 07:11:43');
INSERT INTO `posts` VALUES (62, 1, '', 'Screenshot_1', '', 'inherit', 'open', '', 'screenshot-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-06 01:34:33', '2017-03-06 01:34:33');
INSERT INTO `posts` VALUES (69, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-03-08 09:39:38', '2017-03-08 09:39:38');
INSERT INTO `posts` VALUES (70, 1, '', 'Hoangdv', '', 'inherit', 'open', '', 'hoangdv.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-08 10:09:53', '2017-03-08 10:09:53');
INSERT INTO `posts` VALUES (86, 1, '', 'Content Img', '', 'inherit', 'open', '', 'content-img.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-09 04:55:13', '2017-03-09 04:55:13');
INSERT INTO `posts` VALUES (91, 1, '', 'Default User', '', 'inherit', 'open', '', 'default-user.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-03-09 09:03:10', '2017-03-09 09:03:10');
INSERT INTO `posts` VALUES (92, 1, '', 'Hoangdv', '', 'inherit', 'open', '', 'hoangdv.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-09 09:14:20', '2017-03-09 09:14:20');
INSERT INTO `posts` VALUES (93, 1, '', 'Content Img', '', 'inherit', 'open', '', 'content-img.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-10 03:20:37', '2017-03-10 03:20:37');
INSERT INTO `posts` VALUES (109, 1, '', '', '', 'publish', 'open', '', 'tieng-anh', 0, '', 0, '', 'page', 0, 'post', '2017-03-15 04:38:32', '2017-03-20 10:56:56');
INSERT INTO `posts` VALUES (135, 1, '', '', '', 'publish', 'open', '', 'dr-hoang-dona', 0, '', 0, '', 'doctor', 0, 'post', '2017-03-15 11:37:28', '2017-03-21 07:27:21');
INSERT INTO `posts` VALUES (137, 1, '', '', '', 'inherit', 'open', '', 'doctor-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-16 04:35:41', '2017-03-16 04:35:41');
INSERT INTO `posts` VALUES (138, 1, '', '', '', 'inherit', 'open', '', 'doctor-2.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-16 05:44:37', '2017-03-16 05:44:37');
INSERT INTO `posts` VALUES (139, 1, '', '', '', 'inherit', 'open', '', 'doctor-1.jpg', 0, '', 0, '', 'attachment', 0, 'image/jpeg', '2017-03-16 05:45:04', '2017-03-16 05:45:04');
INSERT INTO `posts` VALUES (140, 1, '', '', '', 'inherit', 'open', '', 'logo.png', 0, '', 0, '', 'attachment', 0, 'image/png', '2017-03-16 07:25:31', '2017-03-16 07:25:31');
INSERT INTO `posts` VALUES (278, 1, '', '', '', 'publish', 'open', '', 'dr-anna-doe', 0, '', 0, '', 'doctor', 0, 'post', '2017-03-20 07:40:20', '2017-03-21 07:26:54');
INSERT INTO `posts` VALUES (279, 1, '', '', '', 'publish', '', '', 'lorem-ipsum-dolor-sit-amet', 0, '', 0, '', 'post', 29, 'post', '2017-03-21 02:59:18', '2017-03-21 07:46:03');
INSERT INTO `posts` VALUES (285, 1, '', '', '', 'publish', 'open', '', 'contact-us', 0, '', 0, '', 'page', 0, 'post', '2017-03-21 03:26:45', '2017-03-21 03:26:45');
INSERT INTO `posts` VALUES (286, 1, '', '', '', 'publish', '', '', 'which-resembles-a-latin-sentence', 0, '', 0, '', 'post', 3, 'post', '2017-03-21 03:39:03', '2017-03-21 03:50:35');
INSERT INTO `posts` VALUES (287, 1, '', '', '', 'publish', '', '', 'lorem-ipsum-is-the-whole-of-a-text-made-up', 0, '', 0, '', 'post', 0, 'post', '2017-03-21 03:39:50', '2017-03-21 03:40:34');
INSERT INTO `posts` VALUES (291, 1, '', '', '', 'publish', 'open', '', 'drana', 0, '', 0, '', 'doctor', 0, 'post', '2017-03-22 02:10:38', '2017-03-22 02:10:38');
INSERT INTO `posts` VALUES (292, 1, '', '', '', 'publish', '', '', 'laoreet-cubilia-velit', 0, '', 0, '', 'post', 0, 'post', '2017-03-22 02:59:23', '2017-03-22 04:39:03');
INSERT INTO `posts` VALUES (293, 1, '', '', '', 'publish', '', '', 'odio-praesent-ultricies', 0, '', 0, '', 'post', 0, 'post', '2017-03-22 02:59:37', '2017-03-23 04:35:54');
INSERT INTO `posts` VALUES (296, 1, '', '', '', 'publish', 'close', '', 'home', 0, '', 2, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-23 04:36:33', '2017-03-24 10:08:33');
INSERT INTO `posts` VALUES (297, 1, '', '', '', 'publish', 'close', '', 'team', 0, '', 3, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-23 04:36:33', '2017-03-24 10:08:33');
INSERT INTO `posts` VALUES (298, 1, '', '', '', 'publish', 'close', '', 'news', 0, '', 4, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-23 04:36:33', '2017-03-24 10:08:33');
INSERT INTO `posts` VALUES (299, 1, '', '', '', 'publish', 'close', '', 'contact-us', 0, '', 5, 'main-menu', 'nav-menu', 0, 'nav-menu', '2017-03-23 04:36:33', '2017-03-24 10:08:33');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `permission` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, 'Administrator', 'This is supper admin', 'admin', '{\"DefaultController\":[\"index\"],\"PageController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"PostController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"CategoryController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"TagController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"DoctorController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"MenuController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\",\"storemulti\",\"addGroupMenu\",\"deleteGroup\"],\"MediaController\":[\"index\",\"create\",\"store\",\"images\",\"destroy\"],\"TemplateController\":[\"install\",\"installed\",\"create\",\"store\",\"edit\",\"update\",\"publish\",\"preview\",\"delete\"],\"SiteController\":[\"index\",\"getSiteDetail\",\"editInfo\",\"updateInfo\",\"updateTemplate\",\"saveTemplate\",\"selectTemplate\",\"addInfo\",\"createInfo\",\"toggleTemplateSession\",\"toggleUpdateTemplateSession\",\"destroyInfo\",\"sendEmail\",\"download\",\"deploy\"],\"GenerateController\":[\"compress\"],\"LanguageController\":[\"index\",\"create\",\"edit\",\"destroy\"],\"TranslateController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"ThemeController\":[\"index\",\"view\",\"active\",\"update\",\"install\",\"installed\"],\"WidgetController\":[\"index\",\"addWidget\",\"store\",\"reorder\",\"destroy\"],\"GalleriesController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"show\",\"destroy\"],\"GalleryImagesController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"show\",\"destroy\"],\"ContactController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"show\",\"destroy\"],\"RolesController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"show\",\"destroy\"],\"UsersController\":[\"index\",\"add\",\"store\",\"edit\",\"update\",\"destroy\"],\"OptionsController\":[\"index\",\"update\"]}', 1, '2017-02-14 17:54:13', '2017-02-14 17:54:13', NULL);
INSERT INTO `roles` VALUES (2, 'Test', '', 'admin', '{\"DefaultController\":[\"index\"],\"PageController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"PostController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"CategoryController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"],\"DoctorController\":[\"index\",\"create\",\"store\",\"edit\",\"update\",\"destroy\"]}', 1, '2017-03-27 14:20:50', '2017-03-27 14:20:50', NULL);
INSERT INTO `roles` VALUES (3, '66', '', 'users', '{\"page\":[\"page@index\",\"page@create\",\"page@edit\",\"page@update\",\"page@destroy\"]}', 1, '2017-03-27 14:23:11', '2017-03-27 14:23:11', NULL);

-- ----------------------------
-- Table structure for term_relationships
-- ----------------------------
DROP TABLE IF EXISTS `term_relationships`;
CREATE TABLE `term_relationships`  (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`object_id`, `term_taxonomy_id`) USING BTREE,
  INDEX `term_relationships_term_taxonomy_id_index`(`term_taxonomy_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of term_relationships
-- ----------------------------
INSERT INTO `term_relationships` VALUES (279, 30, 0);
INSERT INTO `term_relationships` VALUES (286, 30, 0);
INSERT INTO `term_relationships` VALUES (287, 30, 0);
INSERT INTO `term_relationships` VALUES (292, 30, 0);
INSERT INTO `term_relationships` VALUES (293, 30, 0);

-- ----------------------------
-- Table structure for term_translations
-- ----------------------------
DROP TABLE IF EXISTS `term_translations`;
CREATE TABLE `term_translations`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `locale` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `term_translations_term_id_foreign`(`term_id`) USING BTREE,
  CONSTRAINT `term_translations_term_id_foreign` FOREIGN KEY (`term_id`) REFERENCES `terms` (`term_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of term_translations
-- ----------------------------
INSERT INTO `term_translations` VALUES (7, 17, 'de', 'tag deutsch1', 'tag deutsch1', '2017-03-14 13:24:10', '2017-03-14 13:24:25');
INSERT INTO `term_translations` VALUES (8, 17, 'en', 'tag english1', 'tag english1', '2017-03-14 13:24:10', '2017-03-14 13:24:25');
INSERT INTO `term_translations` VALUES (9, 17, 'vi', 'tag vietnam1', 'tag vietnam1', '2017-03-14 13:24:10', '2017-03-14 13:24:25');
INSERT INTO `term_translations` VALUES (16, 25, 'de', 'rrr', '', '2017-03-16 03:08:14', '2017-03-16 03:08:14');
INSERT INTO `term_translations` VALUES (17, 25, 'en', 'rrr', '', '2017-03-16 03:08:14', '2017-03-16 03:08:14');
INSERT INTO `term_translations` VALUES (18, 26, 'de', '4444', '', '2017-03-16 03:08:15', '2017-03-16 03:08:15');
INSERT INTO `term_translations` VALUES (19, 26, 'en', '4444', '', '2017-03-16 03:08:15', '2017-03-16 03:08:15');
INSERT INTO `term_translations` VALUES (25, 30, 'de', '678567', '678567', '2017-03-16 08:16:58', '2017-03-16 08:16:58');
INSERT INTO `term_translations` VALUES (26, 30, 'en', 'News', 'news', '2017-03-16 08:16:58', '2017-03-21 03:37:30');
INSERT INTO `term_translations` VALUES (27, 31, 'de', '6785678', '', '2017-03-16 08:17:09', '2017-03-16 08:17:09');
INSERT INTO `term_translations` VALUES (28, 31, 'en', '6785678', '', '2017-03-16 08:17:09', '2017-03-16 08:17:09');

-- ----------------------------
-- Table structure for terms
-- ----------------------------
DROP TABLE IF EXISTS `terms`;
CREATE TABLE `terms`  (
  `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `taxonomy` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_group` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`term_id`) USING BTREE,
  INDEX `terms_slug_index`(`slug`) USING BTREE,
  INDEX `terms_name_index`(`name`) USING BTREE,
  INDEX `terms_taxonomy_index`(`taxonomy`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of terms
-- ----------------------------
INSERT INTO `terms` VALUES (17, '', 'tag-english1', 'tag', '', 0, 0);
INSERT INTO `terms` VALUES (25, '', 'rrr', 'tag', '', 0, 0);
INSERT INTO `terms` VALUES (26, '', '4444', 'tag', '', 0, 0);
INSERT INTO `terms` VALUES (30, '', 'news', 'category', '', 0, 0);
INSERT INTO `terms` VALUES (31, '', '6785678', 'tag', '', 0, 0);

-- ----------------------------
-- Table structure for theme_meta
-- ----------------------------
DROP TABLE IF EXISTS `theme_meta`;
CREATE TABLE `theme_meta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_group` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `theme_meta_theme_id_index`(`theme_id`) USING BTREE,
  INDEX `theme_meta_meta_key_index`(`meta_key`) USING BTREE,
  CONSTRAINT `theme_meta_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of theme_meta
-- ----------------------------
INSERT INTO `theme_meta` VALUES (6, 2, 'menu_position', 'top-menu', 'main-menu');
INSERT INTO `theme_meta` VALUES (7, 2, 'options', 'general', 'a:4:{i:0;a:4:{s:4:\"name\";s:4:\"logo\";s:4:\"type\";s:12:\"input_upload\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:4:\"Logo\";}i:1;a:4:{s:4:\"name\";s:16:\"background_image\";s:4:\"type\";s:12:\"input_upload\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:13:\"Feature image\";}i:2;a:4:{s:4:\"name\";s:9:\"copyright\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:28:\"Copyright &copy; 2016 Sanmax\";s:5:\"label\";s:14:\"Copyright Text\";}i:3;a:4:{s:4:\"name\";s:9:\"customcss\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:10:\"Custom CSS\";}}');
INSERT INTO `theme_meta` VALUES (8, 2, 'options', 'social_media', 'a:4:{i:0;a:4:{s:4:\"name\";s:8:\"facebook\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:8:\"Facebook\";}i:1;a:4:{s:4:\"name\";s:7:\"twitter\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Twitter\";}i:2;a:4:{s:4:\"name\";s:11:\"google_plus\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:11:\"Google Plus\";}i:3;a:4:{s:4:\"name\";s:7:\"youtube\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Youtube\";}}');
INSERT INTO `theme_meta` VALUES (9, 2, 'options', 'layouts', 'a:1:{i:0;a:6:{s:4:\"name\";s:12:\"layout_style\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"right-sidebar\";s:13:\"Right Sidebar\";s:12:\"left-sidebar\";s:12:\"Left Sidebar\";s:12:\"none-sidebar\";s:12:\"None Sidebar\";s:14:\"center-content\";s:14:\"Center Content\";}s:5:\"value\";a:4:{s:13:\"right-sidebar\";s:13:\"Right Sidebar\";s:12:\"left-sidebar\";s:12:\"Left Sidebar\";s:12:\"none-sidebar\";s:12:\"None Sidebar\";s:14:\"center-content\";s:14:\"Center Content\";}s:6:\"xvalue\";a:1:{s:7:\"default\";s:13:\"right-sidebar\";}s:5:\"label\";s:12:\"Layout Style\";}}');
INSERT INTO `theme_meta` VALUES (10, 2, 'options', 'typography', 'a:11:{i:0;a:4:{s:4:\"name\";s:10:\"site_title\";s:5:\"label\";s:10:\"Site title\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:13:\"Raleway-Black\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"30px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"25px\";s:4:\"25px\";s:4:\"26px\";s:4:\"26px\";s:4:\"27px\";s:4:\"27px\";s:4:\"28px\";s:4:\"28px\";s:4:\"29px\";s:4:\"29px\";s:4:\"30px\";s:4:\"30px\";s:4:\"31px\";s:4:\"31px\";s:4:\"32px\";s:4:\"32px\";s:4:\"33px\";s:4:\"33px\";s:4:\"34px\";s:4:\"34px\";s:4:\"35px\";s:4:\"35px\";}}}}i:1;a:4:{s:4:\"name\";s:6:\"slogan\";s:5:\"label\";s:6:\"Slogan\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:14:\"Raleway-Medium\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"16px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"25px\";s:4:\"25px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";s:4:\"21px\";s:4:\"21px\";s:4:\"22px\";s:4:\"22px\";}}}}i:2;a:4:{s:4:\"name\";s:4:\"page\";s:5:\"label\";s:4:\"Text\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:14:\"Raleway-Medium\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"14px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"25px\";s:4:\"25px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";s:4:\"21px\";s:4:\"21px\";s:4:\"22px\";s:4:\"22px\";}}}}i:3;a:4:{s:4:\"name\";s:4:\"link\";s:5:\"label\";s:4:\"Link\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:13:\"Raleway-Black\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"10px\";s:4:\"10px\";s:4:\"11px\";s:4:\"11px\";s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"25px\";s:4:\"25px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";}}i:3;a:4:{s:4:\"name\";s:11:\"hover_color\";s:5:\"label\";s:11:\"Hover color\";s:5:\"value\";s:7:\"#c2c7d1\";s:4:\"type\";s:11:\"colorpicker\";}}}i:4;a:4:{s:4:\"name\";s:6:\"button\";s:5:\"label\";s:6:\"Button\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:6:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:4:{s:4:\"name\";s:11:\"hover_color\";s:5:\"label\";s:16:\"Text hover color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:2;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:14:\"Raleway-Medium\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_color\";s:5:\"label\";s:16:\"Background color\";s:5:\"value\";s:7:\"#f48100\";s:4:\"type\";s:11:\"colorpicker\";}i:4;a:4:{s:4:\"name\";s:22:\"background_hover_color\";s:5:\"label\";s:22:\"Background hover color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:5;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"14px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";s:4:\"21px\";s:4:\"21px\";s:4:\"22px\";s:4:\"22px\";}}}}i:5;a:4:{s:4:\"name\";s:6:\"header\";s:5:\"label\";s:6:\"Header\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#909090\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:12:\"Raleway-Bold\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:7:{s:4:\"10px\";s:4:\"10px\";s:4:\"11px\";s:4:\"11px\";s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_color\";s:5:\"label\";s:16:\"Background color\";s:5:\"value\";s:7:\"#b3cdde\";s:4:\"type\";s:11:\"colorpicker\";}}}i:6;a:4:{s:4:\"name\";s:6:\"footer\";s:5:\"label\";s:6:\"Footer\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:14:\"Raleway-Medium\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:7:{s:4:\"10px\";s:4:\"10px\";s:4:\"11px\";s:4:\"11px\";s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_color\";s:5:\"label\";s:16:\"Background color\";s:5:\"value\";s:7:\"#b3cdde\";s:4:\"type\";s:11:\"colorpicker\";}}}i:7;a:5:{s:4:\"name\";s:4:\"menu\";s:5:\"label\";s:4:\"Menu\";s:4:\"type\";s:8:\"fieldset\";s:5:\"xtype\";s:7:\"advance\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:12:\"Raleway-Bold\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:7:{s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";}}i:3;a:4:{s:4:\"name\";s:11:\"hover_color\";s:5:\"label\";s:10:\"Text hover\";s:5:\"value\";s:7:\"#c2c7d1\";s:4:\"type\";s:11:\"colorpicker\";}}}i:8;a:5:{s:4:\"name\";s:5:\"slide\";s:5:\"label\";s:5:\"Slide\";s:4:\"type\";s:8:\"fieldset\";s:5:\"xtype\";s:7:\"advance\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:11:\"title_color\";s:5:\"label\";s:11:\"Title color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:17:\"title_font_family\";s:5:\"label\";s:17:\"Title font family\";s:5:\"value\";s:12:\"Raleway-Bold\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:15:\"title_font_size\";s:5:\"label\";s:15:\"Title font size\";s:5:\"value\";s:4:\"50px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"45px\";s:4:\"45px\";s:4:\"46px\";s:4:\"46px\";s:4:\"47px\";s:4:\"47px\";s:4:\"48px\";s:4:\"48px\";s:4:\"49px\";s:4:\"49px\";s:4:\"50px\";s:4:\"50px\";s:4:\"51px\";s:4:\"51px\";s:4:\"52px\";s:4:\"52px\";s:4:\"53px\";s:4:\"53px\";s:4:\"54px\";s:4:\"54px\";s:4:\"55px\";s:4:\"55px\";}}}}i:9;a:5:{s:4:\"name\";s:6:\"banner\";s:5:\"label\";s:6:\"Banner\";s:4:\"type\";s:8:\"fieldset\";s:5:\"xtype\";s:7:\"advance\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:11:\"title_color\";s:5:\"label\";s:11:\"Title color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:17:\"title_font_family\";s:5:\"label\";s:17:\"Title font family\";s:5:\"value\";s:12:\"Raleway-Bold\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:15:\"title_font_size\";s:5:\"label\";s:15:\"Title font size\";s:5:\"value\";s:4:\"50px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"45px\";s:4:\"45px\";s:4:\"46px\";s:4:\"46px\";s:4:\"47px\";s:4:\"47px\";s:4:\"48px\";s:4:\"48px\";s:4:\"49px\";s:4:\"49px\";s:4:\"50px\";s:4:\"50px\";s:4:\"51px\";s:4:\"51px\";s:4:\"52px\";s:4:\"52px\";s:4:\"53px\";s:4:\"53px\";s:4:\"54px\";s:4:\"54px\";s:4:\"55px\";s:4:\"55px\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_image\";s:5:\"label\";s:24:\"Background image default\";s:5:\"value\";s:0:\"\";s:4:\"type\";s:12:\"input_upload\";}}}i:10;a:5:{s:4:\"name\";s:6:\"widget\";s:5:\"label\";s:6:\"Widget\";s:4:\"type\";s:8:\"fieldset\";s:5:\"xtype\";s:7:\"advance\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:11:\"title_color\";s:5:\"label\";s:11:\"Title color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:17:\"title_font_family\";s:5:\"label\";s:17:\"Title font family\";s:5:\"value\";s:13:\"Raleway-Black\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:15:\"title_font_size\";s:5:\"label\";s:15:\"Title font size\";s:5:\"value\";s:4:\"30px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"25px\";s:4:\"25px\";s:4:\"26px\";s:4:\"26px\";s:4:\"27px\";s:4:\"27px\";s:4:\"28px\";s:4:\"28px\";s:4:\"29px\";s:4:\"29px\";s:4:\"30px\";s:4:\"30px\";s:4:\"31px\";s:4:\"31px\";s:4:\"32px\";s:4:\"32px\";s:4:\"33px\";s:4:\"33px\";s:4:\"34px\";s:4:\"34px\";s:4:\"35px\";s:4:\"35px\";}}}}}');
INSERT INTO `theme_meta` VALUES (16, 4, 'menu_position', 'menu-top', '');
INSERT INTO `theme_meta` VALUES (17, 4, 'options', 'general', 'a:4:{i:0;a:4:{s:4:\"name\";s:4:\"logo\";s:4:\"type\";s:12:\"input_upload\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:4:\"Logo\";}i:1;a:4:{s:4:\"name\";s:16:\"background_image\";s:4:\"type\";s:12:\"input_upload\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:16:\"Background image\";}i:2;a:4:{s:4:\"name\";s:9:\"copyright\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:28:\"Copyright &copy; 2016 ITLSVN\";s:5:\"label\";s:14:\"Copyright Text\";}i:3;a:4:{s:4:\"name\";s:9:\"customcss\";s:4:\"type\";s:8:\"textarea\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:10:\"Custom CSS\";}}');
INSERT INTO `theme_meta` VALUES (18, 4, 'options', 'social_media', 'a:4:{i:0;a:4:{s:4:\"name\";s:8:\"facebook\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:8:\"Facebook\";}i:1;a:4:{s:4:\"name\";s:7:\"twitter\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Twitter\";}i:2;a:4:{s:4:\"name\";s:11:\"google_plus\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:11:\"Google Plus\";}i:3;a:4:{s:4:\"name\";s:7:\"youtube\";s:4:\"type\";s:4:\"text\";s:5:\"value\";s:0:\"\";s:5:\"label\";s:7:\"Youtube\";}}');
INSERT INTO `theme_meta` VALUES (19, 4, 'options', 'layouts', 'a:1:{i:0;a:6:{s:4:\"name\";s:12:\"layout_style\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"right-sidebar\";s:13:\"Right Sidebar\";s:12:\"left-sidebar\";s:12:\"Left Sidebar\";s:12:\"none-sidebar\";s:12:\"None Sidebar\";s:14:\"center-content\";s:14:\"Center Content\";}s:5:\"value\";a:4:{s:13:\"right-sidebar\";s:13:\"Right Sidebar\";s:12:\"left-sidebar\";s:12:\"Left Sidebar\";s:12:\"none-sidebar\";s:12:\"None Sidebar\";s:14:\"center-content\";s:14:\"Center Content\";}s:6:\"xvalue\";a:1:{s:7:\"default\";s:13:\"right-sidebar\";}s:5:\"label\";s:12:\"Layout Style\";}}');
INSERT INTO `theme_meta` VALUES (20, 4, 'options', 'typography', 'a:7:{i:0;a:4:{s:4:\"name\";s:10:\"site_title\";s:5:\"label\";s:10:\"Site title\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:13:\"Raleway-Black\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"20px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"25px\";s:4:\"25px\";s:4:\"26px\";s:4:\"26px\";s:4:\"27px\";s:4:\"27px\";s:4:\"28px\";s:4:\"28px\";s:4:\"29px\";s:4:\"29px\";s:4:\"30px\";s:4:\"30px\";s:4:\"31px\";s:4:\"31px\";s:4:\"32px\";s:4:\"32px\";s:4:\"33px\";s:4:\"33px\";s:4:\"34px\";s:4:\"34px\";s:4:\"35px\";s:4:\"35px\";}}}}i:1;a:4:{s:4:\"name\";s:6:\"slogan\";s:5:\"label\";s:6:\"Slogan\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:12:\"Raleway-Bold\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"25px\";s:4:\"25px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";s:4:\"21px\";s:4:\"21px\";s:4:\"22px\";s:4:\"22px\";}}}}i:2;a:4:{s:4:\"name\";s:4:\"page\";s:5:\"label\";s:4:\"Text\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:3:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:14:\"Raleway-Medium\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"14px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"25px\";s:4:\"25px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";s:4:\"21px\";s:4:\"21px\";s:4:\"22px\";s:4:\"22px\";}}}}i:3;a:4:{s:4:\"name\";s:4:\"link\";s:5:\"label\";s:4:\"Link\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:13:\"Raleway-Black\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"10px\";s:4:\"10px\";s:4:\"11px\";s:4:\"11px\";s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"25px\";s:4:\"25px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";}}i:3;a:4:{s:4:\"name\";s:11:\"hover_color\";s:5:\"label\";s:11:\"Hover color\";s:5:\"value\";s:7:\"#c2c7d1\";s:4:\"type\";s:11:\"colorpicker\";}}}i:4;a:4:{s:4:\"name\";s:6:\"button\";s:5:\"label\";s:6:\"Button\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:6:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:4:{s:4:\"name\";s:11:\"hover_color\";s:5:\"label\";s:16:\"Text hover color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:2;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:14:\"Raleway-Medium\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_color\";s:5:\"label\";s:16:\"Background color\";s:5:\"value\";s:7:\"#f48100\";s:4:\"type\";s:11:\"colorpicker\";}i:4;a:4:{s:4:\"name\";s:22:\"background_hover_color\";s:5:\"label\";s:22:\"Background hover color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:5;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"14px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:11:{s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";s:4:\"17px\";s:4:\"17px\";s:4:\"18px\";s:4:\"18px\";s:4:\"19px\";s:4:\"19px\";s:4:\"20px\";s:4:\"20px\";s:4:\"21px\";s:4:\"21px\";s:4:\"22px\";s:4:\"22px\";}}}}i:5;a:4:{s:4:\"name\";s:6:\"header\";s:5:\"label\";s:6:\"Header\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#ffffff\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:13:\"Raleway-Black\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:7:{s:4:\"10px\";s:4:\"10px\";s:4:\"11px\";s:4:\"11px\";s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_color\";s:5:\"label\";s:16:\"Background color\";s:5:\"value\";s:7:\"#c2c7d1\";s:4:\"type\";s:11:\"colorpicker\";}}}i:6;a:4:{s:4:\"name\";s:6:\"footer\";s:5:\"label\";s:6:\"Footer\";s:4:\"type\";s:8:\"fieldset\";s:5:\"items\";a:4:{i:0;a:4:{s:4:\"name\";s:5:\"color\";s:5:\"label\";s:10:\"Text color\";s:5:\"value\";s:7:\"#222222\";s:4:\"type\";s:11:\"colorpicker\";}i:1;a:5:{s:4:\"name\";s:11:\"font_family\";s:5:\"label\";s:11:\"Font family\";s:5:\"value\";s:12:\"Raleway-Bold\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:4:{s:13:\"Raleway-Black\";s:13:\"Raleway Black\";s:12:\"Raleway-Bold\";s:12:\"Raleway Bold\";s:14:\"Raleway-Medium\";s:14:\"Raleway Medium\";s:14:\"Raleway-Italic\";s:14:\"Raleway Italic\";}}i:2;a:5:{s:4:\"name\";s:9:\"font_size\";s:5:\"label\";s:9:\"Font size\";s:5:\"value\";s:4:\"12px\";s:4:\"type\";s:8:\"combobox\";s:7:\"options\";a:7:{s:4:\"10px\";s:4:\"10px\";s:4:\"11px\";s:4:\"11px\";s:4:\"12px\";s:4:\"12px\";s:4:\"13px\";s:4:\"13px\";s:4:\"14px\";s:4:\"14px\";s:4:\"15px\";s:4:\"15px\";s:4:\"16px\";s:4:\"16px\";}}i:3;a:4:{s:4:\"name\";s:16:\"background_color\";s:5:\"label\";s:16:\"Background color\";s:5:\"value\";s:7:\"#fafafa\";s:4:\"type\";s:11:\"colorpicker\";}}}}');

-- ----------------------------
-- Table structure for theme_type
-- ----------------------------
DROP TABLE IF EXISTS `theme_type`;
CREATE TABLE `theme_type`  (
  `theme_type_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`theme_type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for themes
-- ----------------------------
DROP TABLE IF EXISTS `themes`;
CREATE TABLE `themes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) NOT NULL DEFAULT 0,
  `is_publish` bigint(20) NOT NULL DEFAULT 0,
  `theme_type_id` bigint(20) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `author_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_preview` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `machine_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `theme_root` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of themes
-- ----------------------------
INSERT INTO `themes` VALUES (2, 0, 1, 2, 'Clinic medium', '1.0.0', 'Sanmax', '#', 'clinic medium template', 'http://sbd639.loc/themes/Sanmax5a3104e0655df/images/preview.jpg', 1, 'Sanmax5a3104e0655df', 'Sanmax5a3104e0655df');
INSERT INTO `themes` VALUES (4, 0, 1, 1, 'Clinic Simple', '1.0.0', 'Sanmax', '#', 'Clinic simple template', 'http://sbd639.loc/themes/Sanmax5be93f718feee/images/preview.jpg', 0, 'Sanmax5be93f718feee', 'Sanmax5be93f718feee');

-- ----------------------------
-- Table structure for translate
-- ----------------------------
DROP TABLE IF EXISTS `translate`;
CREATE TABLE `translate`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `trans_key` char(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `trans_meta` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of translate
-- ----------------------------
INSERT INTO `translate` VALUES (4, 'make_appointment', 'a:3:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"4\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:13:\"Maak afspraak\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"2\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:16:\"Make Appointment\";}s:2:\"vi\";a:3:{s:11:\"language_id\";s:1:\"1\";s:10:\"country_id\";s:1:\"1\";s:5:\"trans\";s:19:\"Đặt lịch hẹn\";}}', '2017-03-13 07:15:25', '2017-03-14 06:57:33');
INSERT INTO `translate` VALUES (5, 'see_more_news', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"4\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:13:\"See more news\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"2\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:13:\"See more news\";}}', '2017-03-21 04:22:56', '2017-03-21 04:25:16');
INSERT INTO `translate` VALUES (6, 'read_more', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"4\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:9:\"Read more\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"2\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:9:\"Read more\";}}', '2017-03-21 04:24:45', '2017-03-21 04:24:45');
INSERT INTO `translate` VALUES (7, 'Posted_on', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"4\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:9:\"Posted on\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"2\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:9:\"Posted on\";}}', '2017-03-21 04:25:47', '2017-03-21 04:27:58');
INSERT INTO `translate` VALUES (8, 'at', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"4\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:2:\"at\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"2\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:2:\"at\";}}', '2017-03-21 04:25:54', '2017-03-21 04:25:54');
INSERT INTO `translate` VALUES (9, 'see_more', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"4\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:8:\"See more\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"2\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:8:\"See more\";}}', '2017-03-22 02:09:42', '2017-03-22 02:09:42');
INSERT INTO `translate` VALUES (10, 'Name', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"9\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:4:\"Name\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"8\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:4:\"Name\";}}', '2017-03-23 04:53:01', '2017-03-23 04:53:01');
INSERT INTO `translate` VALUES (11, 'Email_address', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"9\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:13:\"Email address\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"8\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:12:\"Emai address\";}}', '2017-03-23 04:53:15', '2017-03-23 04:53:15');
INSERT INTO `translate` VALUES (12, 'Phone_number', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"9\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:12:\"Phone number\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"8\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:12:\"Phone number\";}}', '2017-03-23 04:53:27', '2017-03-23 04:53:27');
INSERT INTO `translate` VALUES (13, 'Message', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"9\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:7:\"Message\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"8\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:7:\"Message\";}}', '2017-03-23 04:53:38', '2017-03-23 04:53:38');
INSERT INTO `translate` VALUES (14, 'send_message', 'a:2:{s:2:\"de\";a:3:{s:11:\"language_id\";s:1:\"9\";s:10:\"country_id\";s:1:\"3\";s:5:\"trans\";s:12:\"send message\";}s:2:\"en\";a:3:{s:11:\"language_id\";s:1:\"8\";s:10:\"country_id\";s:1:\"2\";s:5:\"trans\";s:12:\"send message\";}}', '2017-03-23 04:53:59', '2017-03-23 04:54:16');

-- ----------------------------
-- Table structure for user_meta
-- ----------------------------
DROP TABLE IF EXISTS `user_meta`;
CREATE TABLE `user_meta`  (
  `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `meta_value` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `updated_at` timestamp(0) NOT NULL,
  PRIMARY KEY (`meta_id`) USING BTREE,
  INDEX `user_meta_user_id_index`(`user_id`) USING BTREE,
  INDEX `user_meta_meta_key_index`(`meta_key`) USING BTREE,
  CONSTRAINT `user_meta_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 221 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user_meta
-- ----------------------------
INSERT INTO `user_meta` VALUES (1, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-06 06:56:57\";s:4:\"desc\";s:21:\"Create post Test post\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (2, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 11:10:08\";s:4:\"desc\";s:22:\"Create page Infomation\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (3, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 11:24:24\";s:4:\"desc\";s:22:\"Update page Infomation\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (4, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 11:29:21\";s:4:\"desc\";s:22:\"Update page Infomation\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (5, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 12:03:03\";s:4:\"desc\";s:22:\"Create page Contact us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (6, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 12:04:44\";s:4:\"desc\";s:22:\"Update page Contact us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (7, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 12:07:02\";s:4:\"desc\";s:22:\"Update page Contact us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (8, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 12:07:33\";s:4:\"desc\";s:22:\"Update page Contact us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (9, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-08 19:16:53\";s:4:\"desc\";s:16:\"Create page yyyy\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (10, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:53:39\";s:4:\"desc\";s:17:\"Create page About\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (11, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:53:39\";s:4:\"desc\";s:17:\"Create page About\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (12, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:55:54\";s:4:\"desc\";s:18:\"Delete page id :76\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (13, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:56:00\";s:4:\"desc\";s:18:\"Delete page id :77\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (14, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:56:05\";s:4:\"desc\";s:18:\"Delete page id :75\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (15, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:56:14\";s:4:\"desc\";s:22:\"Update page Infomation\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (16, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:56:14\";s:4:\"desc\";s:22:\"Update page Infomation\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (17, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:57:03\";s:4:\"desc\";s:18:\"Delete page id :71\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (18, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:58:10\";s:4:\"desc\";s:16:\"Create page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (19, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 02:58:21\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (20, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:09:24\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (21, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:09:24\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (22, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:30:39\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (23, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:30:39\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (24, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:42:41\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (25, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:49:23\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (26, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:49:32\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (27, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:52:18\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (28, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:52:18\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (29, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:52:29\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (30, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:52:37\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (31, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:53:41\";s:4:\"desc\";s:22:\"Update page Contact us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (32, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 03:54:01\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (33, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:07:55\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (34, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:08:08\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (35, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:08:08\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (36, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:08:08\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (37, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:08:17\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (38, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:08:17\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (39, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:26:40\";s:4:\"desc\";s:16:\"Update page Info\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (40, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:44:16\";s:4:\"desc\";s:83:\"Update post Consequuntur saepe voluptatem consectetur et molestias animi explicabo.\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (41, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:55:23\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (42, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 04:56:31\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (43, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 05:05:53\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (44, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 05:05:53\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (45, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-09 09:00:30\";s:4:\"desc\";s:16:\"Create page Home\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (46, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 02:22:04\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (47, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 02:22:13\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (48, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:12:18\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (49, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:14:56\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (50, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:19:55\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (51, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:20:04\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (52, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:20:11\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (53, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:20:40\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (54, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:53:41\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (55, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:53:53\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (56, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 03:54:49\";s:4:\"desc\";s:28:\"Update page INFO FOR PATIENT\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (57, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 04:15:47\";s:4:\"desc\";s:21:\"Update post Test post\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (58, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 06:25:41\";s:4:\"desc\";s:21:\"Update post Test post\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (59, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:07:12\";s:4:\"desc\";s:18:\"Delete page id :73\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (60, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:12:39\";s:4:\"desc\";s:16:\"Create page 4567\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (61, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:12:42\";s:4:\"desc\";s:18:\"Delete page id :94\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (62, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:13:57\";s:4:\"desc\";s:18:\"Create page 456745\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (63, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:14:02\";s:4:\"desc\";s:18:\"Delete page id :95\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (64, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:15:17\";s:4:\"desc\";s:18:\"Create page 674567\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (65, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:15:21\";s:4:\"desc\";s:18:\"Delete page id :96\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (66, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:16:55\";s:4:\"desc\";s:19:\"Create page 4567456\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (67, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:17:01\";s:4:\"desc\";s:18:\"Delete page id :97\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (68, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-10 07:28:56\";s:4:\"desc\";s:18:\"Delete post id :63\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (69, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-13 08:19:37\";s:4:\"desc\";s:24:\"Delete translation id :1\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (70, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-13 08:19:42\";s:4:\"desc\";s:24:\"Delete translation id :2\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (71, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-13 08:19:47\";s:4:\"desc\";s:24:\"Delete translation id :3\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (72, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-13 08:29:38\";s:4:\"desc\";s:21:\"Delete language id :6\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (73, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-13 08:31:14\";s:4:\"desc\";s:24:\"Delete translation id :6\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (74, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-13 09:03:29\";s:4:\"desc\";s:20:\"Create page About us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (75, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 04:56:30\";s:4:\"desc\";s:83:\"Update post Consequuntur saepe voluptatem consectetur et molestias animi explicabo.\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (76, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:43:22\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (77, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:43:48\";s:4:\"desc\";s:18:\"Delete page id :94\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (78, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:43:52\";s:4:\"desc\";s:18:\"Delete page id :95\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (79, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:44:16\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (80, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:44:21\";s:4:\"desc\";s:18:\"Delete page id :96\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (81, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:46:51\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (82, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:53:15\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (83, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:56:57\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (84, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 08:57:05\";s:4:\"desc\";s:25:\"Delete page id :100,99,98\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (85, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:02:36\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (86, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:04:10\";s:4:\"desc\";s:19:\"Delete page id :101\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (87, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:04:31\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (88, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:05:42\";s:4:\"desc\";s:19:\"Delete page id :102\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (89, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:06:00\";s:4:\"desc\";s:12:\"Create page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (90, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:16:59\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (91, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:17:13\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (92, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:17:56\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (93, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:18:08\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (94, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:46:46\";s:4:\"desc\";s:12:\"Create post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (95, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:47:06\";s:4:\"desc\";s:19:\"Delete post id :104\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (96, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:47:38\";s:4:\"desc\";s:45:\"Delete post id :20,19,18,17,16,15,14,13,12,11\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (97, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 09:49:38\";s:4:\"desc\";s:36:\"Delete post id :10,9,8,7,6,5,4,3,2,1\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (98, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 10:34:27\";s:4:\"desc\";s:19:\"Delete page id :103\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (99, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 10:35:51\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (100, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 12:45:00\";s:4:\"desc\";s:12:\"Create post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (101, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-14 12:46:14\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (102, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 02:34:00\";s:4:\"desc\";s:18:\"Delete page id :97\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (103, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 02:48:20\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (104, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:06:03\";s:4:\"desc\";s:21:\"Delete language id :4\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (105, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:08:42\";s:4:\"desc\";s:21:\"Delete language id :4\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (106, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:08:48\";s:4:\"desc\";s:25:\"Delete language id :4,2,1\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (107, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:09:48\";s:4:\"desc\";s:25:\"Delete language id :5,4,2\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (108, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:09:56\";s:4:\"desc\";s:21:\"Delete language id :5\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (109, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:10:04\";s:4:\"desc\";s:23:\"Delete language id :4,2\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (110, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 03:10:46\";s:4:\"desc\";s:25:\"Delete language id :4,2,1\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (111, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:05:44\";s:4:\"desc\";s:18:\"Create post Hoàng\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (112, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:06:45\";s:4:\"desc\";s:19:\"Delete post id :107\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (113, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:07:14\";s:4:\"desc\";s:20:\"Create doctor Hoangf\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (114, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:37:19\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (115, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:38:02\";s:4:\"desc\";s:19:\"Delete page id :108\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (116, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:38:32\";s:4:\"desc\";s:27:\"Create doctor Tieng Ha Lan1\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (117, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:38:44\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (118, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:41:24\";s:4:\"desc\";s:15:\"Create doctor 3\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (119, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:42:21\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (120, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:42:54\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (121, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:43:03\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (122, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:43:10\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (123, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:49:39\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (124, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:49:45\";s:4:\"desc\";s:19:\"Delete page id :110\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (125, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:50:00\";s:4:\"desc\";s:28:\"Create doctor ssssssssssssss\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (126, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 04:50:24\";s:4:\"desc\";s:19:\"Delete page id :111\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (127, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 06:49:46\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (128, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 07:42:26\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (129, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 11:23:38\";s:4:\"desc\";s:21:\"Delete language id :6\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (130, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 11:24:21\";s:4:\"desc\";s:21:\"Delete language id :7\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (131, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 11:24:28\";s:4:\"desc\";s:24:\"Delete translation id :5\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (132, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 11:36:13\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (133, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-15 11:37:28\";s:4:\"desc\";s:16:\"Create doctor rr\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (134, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 02:56:46\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (135, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 02:59:01\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (136, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 03:04:55\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (137, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 03:05:10\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (138, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 03:05:20\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (139, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 03:08:14\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (140, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 04:35:11\";s:4:\"desc\";s:22:\"Create page eeeeeeeeee\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (141, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 04:35:30\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (142, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:48:48\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (143, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:49:39\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (144, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:50:00\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (145, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:50:05\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (146, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:50:14\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (147, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:51:03\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (148, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:51:27\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (149, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:51:37\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (150, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:51:48\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (151, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 05:55:16\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (152, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 08:17:09\";s:4:\"desc\";s:20:\"Create post 75678567\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (153, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 09:15:06\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (154, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 10:06:41\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (155, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 10:07:15\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (156, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-16 10:09:58\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (157, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 07:26:10\";s:4:\"desc\";s:19:\"Delete page id :136\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (158, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:43:07\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (159, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:43:49\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (160, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:48:11\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (161, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:51:25\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (162, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:51:35\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (163, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:52:01\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (164, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 08:54:31\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (165, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:00:04\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (166, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:00:34\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (167, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:00:52\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (168, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:14:42\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (169, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:15:26\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (170, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:16:08\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (171, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:16:52\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (172, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:17:59\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (173, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:18:15\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (174, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:19:04\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (175, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:22:08\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (176, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:22:53\";s:4:\"desc\";s:22:\"Delete menu group :777\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (177, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:23:44\";s:4:\"desc\";s:23:\"Delete menu group :aaaa\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (178, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:24:41\";s:4:\"desc\";s:25:\"Delete menu group :565675\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (179, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:28:38\";s:4:\"desc\";s:25:\"Delete menu group :563543\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (180, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:30:31\";s:4:\"desc\";s:26:\"Delete menu group :6789678\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (181, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:30:54\";s:4:\"desc\";s:24:\"Delete menu group :76856\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (182, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:32:00\";s:4:\"desc\";s:24:\"Delete menu group :56785\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (183, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:33:51\";s:4:\"desc\";s:22:\"Delete menu group :567\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (184, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:34:59\";s:4:\"desc\";s:26:\"Delete menu group :4567456\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (185, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:35:45\";s:4:\"desc\";s:24:\"Delete menu group :56745\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (186, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 09:36:13\";s:4:\"desc\";s:24:\"Delete menu group :56745\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (187, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 10:03:46\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (188, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-17 11:14:31\";s:4:\"desc\";s:28:\"Delete menu group :main-menu\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (189, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-20 07:40:20\";s:4:\"desc\";s:20:\"Create doctor rtwert\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (190, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-20 10:50:17\";s:4:\"desc\";s:23:\"Delete post id :141,105\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (191, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-20 10:56:56\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (192, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 02:59:18\";s:4:\"desc\";s:14:\"Create post er\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (193, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:26:45\";s:4:\"desc\";s:22:\"Create page Contact us\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (194, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:38:20\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (195, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:39:04\";s:4:\"desc\";s:44:\"Create post which resembles a Latin sentence\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (196, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:39:50\";s:4:\"desc\";s:54:\"Create post Lorem Ipsum is the whole of a text made up\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (197, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:40:21\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (198, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:40:28\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (199, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 03:40:34\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (200, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 04:34:12\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (201, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 04:34:25\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (202, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 04:34:44\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (203, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 07:26:55\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (204, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 07:27:21\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (205, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-21 07:27:41\";s:4:\"desc\";s:14:\"Update doctor \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (206, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-22 02:10:38\";s:4:\"desc\";s:20:\"Create doctor Dr.Ana\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (207, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-22 02:59:23\";s:4:\"desc\";s:34:\"Create post  Laoreet cubilia velit\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (208, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-22 02:59:37\";s:4:\"desc\";s:35:\"Create post Odio praesent ultricies\";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (209, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-22 04:39:03\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-22 14:16:28', '0000-00-00 00:00:00');
INSERT INTO `user_meta` VALUES (210, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-23 04:34:34\";s:4:\"desc\";s:21:\"Delete language id :7\";}', '2017-03-23 04:34:34', '2017-03-23 04:34:34');
INSERT INTO `user_meta` VALUES (211, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-23 04:35:54\";s:4:\"desc\";s:12:\"Update post \";}', '2017-03-23 04:35:54', '2017-03-23 04:35:54');
INSERT INTO `user_meta` VALUES (212, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-23 04:48:51\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-23 04:48:51', '2017-03-23 04:48:51');
INSERT INTO `user_meta` VALUES (213, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-23 04:48:56\";s:4:\"desc\";s:12:\"Update page \";}', '2017-03-23 04:48:56', '2017-03-23 04:48:56');
INSERT INTO `user_meta` VALUES (214, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-27 07:20:23\";s:4:\"desc\";s:19:\"Create user Hoangdv\";}', '2017-03-27 07:20:23', '2017-03-27 07:20:23');
INSERT INTO `user_meta` VALUES (215, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-27 07:21:21\";s:4:\"desc\";s:19:\"Update user Hoangdv\";}', '2017-03-27 07:21:21', '2017-03-27 07:21:21');
INSERT INTO `user_meta` VALUES (216, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-27 07:23:22\";s:4:\"desc\";s:19:\"Update user Hoangdv\";}', '2017-03-27 07:23:22', '2017-03-27 07:23:22');
INSERT INTO `user_meta` VALUES (217, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-03-28 08:33:59\";s:4:\"desc\";s:19:\"Update user Hoangdv\";}', '2017-03-28 08:33:59', '2017-03-28 08:33:59');
INSERT INTO `user_meta` VALUES (218, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2017-09-19 07:15:11\";s:4:\"desc\";s:19:\"Update user Hoangdv\";}', '2017-09-19 07:15:11', '2017-09-19 07:15:11');
INSERT INTO `user_meta` VALUES (219, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2018-02-22 09:11:41\";s:4:\"desc\";s:16:\"Create post Test\";}', '2018-02-22 09:11:41', '2018-02-22 09:11:41');
INSERT INTO `user_meta` VALUES (220, 1, 'user_log', 'a:2:{s:4:\"date\";s:19:\"2018-02-22 09:13:44\";s:4:\"desc\";s:19:\"Delete post id :301\";}', '2018-02-22 09:13:44', '2018-02-22 09:13:44');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `photo` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` int(11) NOT NULL DEFAULT 0,
  `provider` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_role_id_foreign`(`role_id`) USING BTREE,
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 'Administrator', 'henry.tran@qsoft.com.vn', '$2y$10$6L7NP4fa8f6sPmdZrdVB6u7exIDR4NsKKWmf3S.inV45XTPuWqAdG', 'http://52.221.247.51/uploads/default-user.png', '', 1, 'local', 'iL1mdBAdoip3DbD3Dmh0zwQkgwXOK7L3K642oJv8cwb0vphMLGEyChTpoyQ5', '2017-02-14 17:54:13', '2017-03-28 02:30:42');
INSERT INTO `users` VALUES (2, 2, 'Hoangdv', 'hoangdv1112@gmail.com', '$2y$10$1UdMhXasJMGnMDx0cgxh5.1B.lp5WeIZzPw8XJF6JuidFR6JpMMtO', 'http://52.221.247.51/uploads/default-user.png', '', 1, 'local', 'grsB5nD2QizPDxQKEgGckZAcVLAlQ3DwC73R7grKjyE4ALcL0zUjQIce4QaW', '2017-03-27 07:20:23', '2017-03-27 07:24:46');

-- ----------------------------
-- Table structure for widget_groups
-- ----------------------------
DROP TABLE IF EXISTS `widget_groups`;
CREATE TABLE `widget_groups`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `theme_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `widget_groups_theme_id_index`(`theme_id`) USING BTREE,
  CONSTRAINT `widget_groups_theme_id_foreign` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of widget_groups
-- ----------------------------
INSERT INTO `widget_groups` VALUES (6, 2, 'post_slider');
INSERT INTO `widget_groups` VALUES (7, 2, 'top_content');
INSERT INTO `widget_groups` VALUES (8, 2, 'bottom_content');
INSERT INTO `widget_groups` VALUES (9, 2, 'left_sidebar');
INSERT INTO `widget_groups` VALUES (10, 2, 'right_sidebar');
INSERT INTO `widget_groups` VALUES (16, 4, 'post_slider');
INSERT INTO `widget_groups` VALUES (17, 4, 'left_sidebar');
INSERT INTO `widget_groups` VALUES (18, 4, 'right_sidebar');
INSERT INTO `widget_groups` VALUES (19, 4, 'top_content');
INSERT INTO `widget_groups` VALUES (20, 4, 'bottom_content');

-- ----------------------------
-- Table structure for widgets
-- ----------------------------
DROP TABLE IF EXISTS `widgets`;
CREATE TABLE `widgets`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `class_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `options` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `widgets_group_id_index`(`group_id`) USING BTREE,
  CONSTRAINT `widgets_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `widget_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of widgets
-- ----------------------------
INSERT INTO `widgets` VALUES (2, 6, 'App\\Widgets\\Sanmax5a3104e0655df\\LightSliderWidget', 'a:6:{s:6:\"baseID\";s:10:\"c1wkdw6aE8\";s:5:\"title\";s:19:\"Light Slider Widget\";s:4:\"type\";s:11:\"recent-post\";s:10:\"gallery_id\";s:1:\"4\";s:16:\"appointment_link\";s:0:\"\";s:10:\"visibility\";s:0:\"\";}', 0);

SET FOREIGN_KEY_CHECKS = 1;
