-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Jun 18, 2020 at 10:03 AM
-- Server version: 8.0.18
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `job`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
CREATE TABLE IF NOT EXISTS `admins` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 1, 'Super Admin', 'admin@admin.com', '$2y$10$lAATWjcwZGUf.BJDXepdCeSgdWPVnmr3c./oQX07D0ZW.81UMb8Wy', '4ORuPNTMRkUtd8oa6nUssw988e7wc3laKqegm5SVs943x5mfTunyNJnAOT55', '2018-09-12 16:53:27', '2020-04-09 11:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

DROP TABLE IF EXISTS `admin_password_resets`;
CREATE TABLE IF NOT EXISTS `admin_password_resets` (
  `email` varchar(100) NOT NULL,
  `token` varchar(190) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `admin_password_resets_email_index` (`email`),
  KEY `admin_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_messages`
--

DROP TABLE IF EXISTS `applicant_messages`;
CREATE TABLE IF NOT EXISTS `applicant_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(150) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_email` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `from_phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext,
  `subject` varchar(200) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `applicant_messages`
--

INSERT INTO `applicant_messages` (`id`, `user_id`, `user_name`, `from_id`, `to_id`, `to_email`, `to_name`, `from_name`, `from_email`, `from_phone`, `message_txt`, `subject`, `is_read`, `created_at`, `updated_at`) VALUES
(2, 9, 'sony gurung', NULL, 9, 'mail.sonygrg@gmail.com', 'sony gurung', 'Mayan', 'abc@gmail.com', '121212', 'I like your profile', 'test message', 1, '2020-05-26 01:58:59', '2020-05-26 01:59:34'),
(3, 9, 'sony gurung', NULL, 9, 'mail.sonygrg@gmail.com', 'sony gurung', 'test', 'puccagrg@gmail.com', '454545454', 'message message', 'this is a test message', 1, '2020-06-09 01:33:11', '2020-06-09 01:33:53');

-- --------------------------------------------------------

--
-- Table structure for table `career_levels`
--

DROP TABLE IF EXISTS `career_levels`;
CREATE TABLE IF NOT EXISTS `career_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `career_level_id` int(11) DEFAULT '0',
  `career_level` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `career_levels`
--

INSERT INTO `career_levels` (`id`, `career_level_id`, `career_level`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Student', 0, 1, 1, 'en', '2020-05-01 06:47:20', '2020-05-11 20:16:20'),
(2, 2, 'Entry Level', 1, 1, 2, 'en', '2020-05-01 06:47:45', '2020-05-11 20:16:20'),
(23, 23, 'first level management', 1, 1, 23, 'EN', '2020-06-10 17:48:24', '2020-06-10 17:48:24'),
(24, 24, 'high level management', 1, 1, 24, 'EN', '2020-06-10 17:48:52', '2020-06-10 17:48:52'),
(25, 25, 'experienced', 1, 1, 25, 'EN', '2020-06-10 17:49:38', '2020-06-10 17:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
CREATE TABLE IF NOT EXISTS `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT '0',
  `city` varchar(30) NOT NULL,
  `state_id` int(11) NOT NULL,
  `is_default` int(1) DEFAULT '0',
  `is_active` int(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '9999',
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48696 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_id`, `city`, `state_id`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Melbourne', 1, 1, 1, 1, 'en', '2020-05-01 06:45:43', NULL),
(48666, 48666, 'phagwara', 4122, 1, 1, 48666, 'EN', '2020-06-10 17:23:10', '2020-06-10 17:23:10'),
(48667, 48667, 'ludhiana', 4122, 1, 1, 48667, 'EN', '2020-06-10 17:23:39', '2020-06-10 17:23:39'),
(48668, 48668, 'jalandher', 4122, 1, 1, 48668, 'EN', '2020-06-10 17:24:07', '2020-06-10 17:24:07'),
(48669, 48669, 'amritsar', 4122, 1, 1, 48669, 'EN', '2020-06-10 17:24:42', '2020-06-10 17:24:43'),
(48670, 48670, 'jaipur', 4123, 1, 1, 48670, 'EN', '2020-06-10 17:25:31', '2020-06-10 17:25:31'),
(48671, 48671, 'ajmer', 4123, 1, 1, 48671, 'EN', '2020-06-10 17:26:08', '2020-06-10 17:26:08'),
(48672, 48672, 'kota', 4123, 1, 1, 48672, 'EN', '2020-06-10 17:26:35', '2020-06-10 17:26:36'),
(48673, 48673, 'alwar', 4123, 1, 1, 48673, 'EN', '2020-06-10 17:26:59', '2020-06-10 17:26:59'),
(48674, 48674, 'chennai', 4125, 1, 1, 48674, 'EN', '2020-06-10 17:27:47', '2020-06-10 17:27:47'),
(48675, 48675, 'salem', 4123, 1, 1, 48675, 'EN', '2020-06-10 17:28:13', '2020-06-10 17:28:13'),
(48676, 48676, 'ooty', 4125, 1, 1, 48676, 'EN', '2020-06-10 17:28:52', '2020-06-10 17:28:52'),
(48677, 48677, 'karur', 4125, 1, 1, 48677, 'EN', '2020-06-10 17:29:21', '2020-06-10 17:29:21'),
(48678, 48678, 'ranchi', 4127, 1, 1, 48678, 'EN', '2020-06-10 17:30:06', '2020-06-10 17:30:06'),
(48679, 48679, 'munger', 4127, 1, 1, 48679, 'EN', '2020-06-10 17:30:46', '2020-06-10 17:30:46'),
(48680, 48680, 'patna', 4127, 1, 1, 48680, 'EN', '2020-06-10 17:31:23', '2020-06-10 17:31:23'),
(48681, 48681, 'Craigieburn', 1, 1, 1, 48681, 'EN', '2020-06-10 17:31:51', '2020-06-10 17:31:51'),
(48683, 48683, 'geelong', 1, 1, 1, 48683, 'EN', '2020-06-10 17:33:21', '2020-06-10 17:33:21'),
(48684, 48684, 'ballarat', 1, 1, 1, 48684, 'EN', '2020-06-10 17:33:53', '2020-06-10 17:33:53'),
(48685, 48685, 'hobart', 4128, 1, 1, 48685, 'EN', '2020-06-10 17:34:36', '2020-06-10 17:34:36'),
(48686, 48686, 'port arthur', 4128, 1, 1, 48686, 'EN', '2020-06-10 17:35:12', '2020-06-10 17:35:12'),
(48687, 48687, 'kingston', 4128, 1, 1, 48687, 'EN', '2020-06-10 17:36:05', '2020-06-10 17:36:05'),
(48688, 48688, 'sydney', 4129, 1, 1, 48688, 'EN', '2020-06-10 17:38:12', '2020-06-10 17:38:12'),
(48689, 48689, 'newcastle', 4129, 1, 1, 48689, 'EN', '2020-06-10 17:38:54', '2020-06-10 17:38:55'),
(48690, 48690, 'orange', 4129, 1, 1, 48690, 'EN', '2020-06-10 17:39:39', '2020-06-10 17:39:39'),
(48691, 48691, 'brisbane', 4130, 1, 1, 48691, 'EN', '2020-06-10 17:40:22', '2020-06-10 17:40:22'),
(48692, 48692, 'goldcoast', 4130, 1, 1, 48692, 'EN', '2020-06-10 17:40:50', '2020-06-10 17:40:51'),
(48693, 48693, 'gladestone central', 4130, 1, 1, 48693, 'EN', '2020-06-10 17:42:15', '2020-06-10 17:42:15'),
(48694, 48694, 'logan city', 4130, 1, 1, 48694, 'EN', '2020-06-10 17:42:58', '2020-06-10 17:42:58'),
(48695, 48695, 'roma', 4130, 1, 1, 48695, 'EN', '2020-06-10 17:46:13', '2020-06-10 17:46:13');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

DROP TABLE IF EXISTS `cms`;
CREATE TABLE IF NOT EXISTS `cms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_slug` varchar(250) DEFAULT NULL,
  `show_in_top_menu` tinyint(1) DEFAULT '0',
  `show_in_footer_menu` tinyint(1) DEFAULT '0',
  `seo_title` text,
  `seo_description` text,
  `seo_keywords` text,
  `seo_other` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `page_slug`, `show_in_top_menu`, `show_in_footer_menu`, `seo_title`, `seo_description`, `seo_keywords`, `seo_other`, `created_at`, `updated_at`) VALUES
(3, 'about-us', 1, 1, 'Jobs In Australia', 'Find best Jobs in Australia, jobs listings and job opportunities on CAREERS. Browse more than 1M jobs and apply for free! CAREERS is Australia\'s leading job website where more than 100K top companies are posting jobs', 'Jobs in Australia, Jobs Australia, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Australia, Resume, Work,', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-04-02 05:08:57', '2020-05-23 04:34:40'),
(4, 'new-page', 0, 1, 'New Page', 'new page abc abc', 'new page abc abc', '<metakjadshfasf', '2020-06-02 03:30:34', '2020-06-02 03:30:34');

-- --------------------------------------------------------

--
-- Table structure for table `cms_content`
--

DROP TABLE IF EXISTS `cms_content`;
CREATE TABLE IF NOT EXISTS `cms_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `page_title` text,
  `page_content` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(10) DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cms_content`
--

INSERT INTO `cms_content` (`id`, `page_id`, `page_title`, `page_content`, `created_at`, `updated_at`, `lang`) VALUES
(7, 3, 'About Us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend posuere magna vel suscipit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi hendrerit imperdiet ex quis rutrum. Phasellus mattis mauris tincidunt, facilisis tortor ut, tincidunt justo. Duis interdum metus libero, vitae finibus quam bibendum a. Duis est nisi, rutrum id purus id, condimentum rutrum nulla. Suspendisse sodales cursus dolor, ac vehicula elit semper eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean bibendum leo metus, non sagittis arcu pharetra quis. Nullam sollicitudin ultricies lectus, id tincidunt odio. In hac habitasse platea dictumst. Nunc in nisi nibh. Ut dignissim ex id iaculis interdum. Donec ullamcorper nec orci a ullamcorper. Mauris volutpat tincidunt tellus, vitae sagittis urna pharetra pharetra.<br /><br /></p>\r\n<p>Curabitur fermentum, massa a finibus porttitor, felis lorem congue lacus, imperdiet sollicitudin nisl tortor a magna. Phasellus eget arcu sed elit sagittis pellentesque. Sed sit amet mattis lacus. Suspendisse quis vehicula lorem, eget ullamcorper neque. Aliquam vitae sapien erat. Vestibulum eget mauris sit amet turpis dapibus dignissim et ac libero. Etiam vulputate, ex vel dictum volutpat, arcu arcu varius massa, a pulvinar velit justo non ligula. Donec a metus sit amet purus fermentum pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.<br /><br /></p>\r\n<p>Nam aliquet odio vitae finibus auctor. Etiam lorem dui, sollicitudin placerat felis quis, molestie posuere eros. Nunc id tellus quis ligula iaculis tempor. Etiam tincidunt augue diam, et faucibus lacus rhoncus id. Integer eu lectus at sem sollicitudin dapibus. Cras blandit urna sit amet nulla fermentum, in pulvinar mi tempor. Nam mollis justo arcu, non rutrum orci pharetra vitae. Duis eleifend quam ac arcu posuere imperdiet. Suspendisse eget viverra lectus. Sed laoreet vestibulum posuere. Phasellus dictum ultrices egestas.</p>', '2018-09-11 18:45:03', '2018-09-11 18:45:17', 'en'),
(8, 4, 'New Page', 'this is new page', '2020-06-02 03:30:56', '2020-06-02 03:30:56', 'EN');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
CREATE TABLE IF NOT EXISTS `companies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(155) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ceo` varchar(60) DEFAULT NULL,
  `industry_id` int(11) DEFAULT '0',
  `ownership_type_id` int(11) DEFAULT '0',
  `description` mediumtext,
  `location` varchar(155) DEFAULT NULL,
  `no_of_offices` int(11) DEFAULT NULL,
  `website` varchar(155) DEFAULT NULL,
  `no_of_employees` varchar(15) DEFAULT NULL,
  `established_in` varchar(12) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `logo` varchar(155) DEFAULT NULL,
  `country_id` int(11) DEFAULT '0',
  `state_id` int(11) DEFAULT '0',
  `city_id` int(11) DEFAULT '0',
  `slug` varchar(155) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_featured` tinyint(1) DEFAULT '0',
  `verified` tinyint(1) DEFAULT '0',
  `verification_token` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `map` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `facebook` varchar(250) DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `linkedin` varchar(250) DEFAULT NULL,
  `google_plus` varchar(250) DEFAULT NULL,
  `pinterest` varchar(250) DEFAULT NULL,
  `package_id` int(11) DEFAULT '0',
  `package_start_date` timestamp NULL DEFAULT NULL,
  `package_end_date` timestamp NULL DEFAULT NULL,
  `jobs_quota` int(5) DEFAULT '0',
  `availed_jobs_quota` int(5) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `ceo`, `industry_id`, `ownership_type_id`, `description`, `location`, `no_of_offices`, `website`, `no_of_employees`, `established_in`, `fax`, `phone`, `logo`, `country_id`, `state_id`, `city_id`, `slug`, `is_active`, `is_featured`, `verified`, `verification_token`, `password`, `remember_token`, `map`, `created_at`, `updated_at`, `facebook`, `twitter`, `linkedin`, `google_plus`, `pinterest`, `package_id`, `package_start_date`, `package_end_date`, `jobs_quota`, `availed_jobs_quota`) VALUES
(9, 'Multimedia Design', 'employer@careers.com', 'Multimedia Design', 1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus. Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi. Sed ultrices sollicitudin vehicula. Proin in ullamcorper massa.', 'Australia', 5, 'http://www.comapnydomain.com', '301-600', '2003', '33333333333', '+1234567890', 'multimedia-design-1536859266-262.jpg', 231, 3926, 43395, 'multimedia-design-9', 1, 1, 0, NULL, '$2y$10$IqLNY6C6PoSnMyD4ul3gP.yQSqlD3PJWqP/N91um8fRKkcLdWa3wy', 'a2f8KUvAd4L0uDnmcwjAGKTU9oBZPqZmRNrwS6qXdw1DkJ6BpbX4CKP9nnoj', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d8310.686427880151!2d-74.00585671025667!3d40.7098868133123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1536851502771\"  frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '2018-07-27 08:22:15', '2020-05-19 11:00:49', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.pinterest.com/', 5, '2018-09-18 15:25:10', '2021-01-16 10:19:17', 40, 2),
(17, 'Mayan', 'naveensonia12@gmail.com', 'Sonia', 1, 2, 'test employee', 'Melbourne', 2, 'http://google.com', '11-50', '2007', '1212', '1212', 'mayan-1589891861-20.jpg', 1, 1, 1, 'mayan-17', 1, 0, 1, '33c474aa7372df3c1ba2cb4e50fdf59bb92d1b7932d007c62d7569d6d3d220d3', '$2y$10$ZE2VTA02wBAwo8gd8Hqj1OF6C3Q8Lbw43RGc30G9RbPtnIkkP1nfC', 's5p34ILKCAXOM05tLVkrhNpfRJEkHbXcPCLvLB07ThDAoN0FiyRvpcs16PWL', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.0192178510856!2d144.95843561492484!3d-37.81301884177313!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4acea8d23b%3A0xd3747ef03b73cd76!2s399%20Lonsdale%20St%2C%20Melbourne%20VIC%203000!5e0!3m2!1sen!2sau!4v1589287607192!5m2!1sen!2sau\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', '2020-04-22 15:38:19', '2020-06-14 05:49:41', NULL, NULL, NULL, NULL, NULL, 4, '2018-09-12 01:44:56', '2021-01-16 10:19:17', 40, 14),
(21, 'Montdami Constructions', 'test@employer.com', 'Rajvir Kaur', 1, 2, 'Montdami Constructions is a well-established civil construction company based in Melbourne which has a great reputation in the land development industry. With the focus on finding the best technical solutions for our clients, our business has a long-standing history spanning more than three decades.', 'Melbourne', 1, 'https://www.google.com/', '11-50', '1994', '03333333', '0312121212', 'montdami-constructions-1589886150-641.png', 1, 1, 1, 'montdami-constructions-21', 1, 1, 1, 'db1ca12bac4a6ee5afc1381ce1efef966e67855d7368bbc4ff8d2c00660b60cb', '$2y$10$ihn3dL1311gyGbCR/rw6guE4Jtfq7m9P6FgP3hjkoLC9fKgkLr.CC', 'vEOvoyDKPx4zIsZ8Lhd95w5DNIqGudD98J8Aun5FwaHqp8bRQxn9RFIwlXiR', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.0192178510856!2d144.95843561492484!3d-37.81301884177313!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4acea8d23b%3A0xd3747ef03b73cd76!2s399%20Lonsdale%20St%2C%20Melbourne%20VIC%203000!5e0!3m2!1sen!2sau!4v1589885808628!5m2!1sen!2sau\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', '2020-05-19 00:53:19', '2020-06-18 09:20:08', NULL, NULL, NULL, NULL, NULL, 4, '2020-01-16 10:19:17', '2021-01-16 10:19:17', 40, 12),
(22, 'Gough Recruitment', 'abc@gmail.com', 'Gough', 230, 2, 'this is a company', 'Melbourne', 2, 'https://www.google.com/', '1-10', '2007', '984455669', '984455669', 'gough-recruitment-1591263640-985.jpg', 1, 1, 1, 'gough-recruitment-22', 1, 1, 1, '201051478c17c86f0b58015aa698ae2d307be89297446efca1d02fefaf65eed2', '$2y$10$tVlYDTtgNGV6cZm6nL9tceLoM4XdRMgR2ltkjmmAoL25B.gxuMxx2', 'EHvU1O2bEjcEGp6EGZixu7YutVNtGXj5wlCLfnkMbQqT8gfmXxRR4kfRu1cE', NULL, '2020-06-03 23:35:47', '2020-06-04 10:17:50', NULL, NULL, NULL, NULL, NULL, 3, '2020-06-03 23:35:47', '2021-06-03 23:35:47', 30, 2),
(23, 'PAREXEL', 'new@gmail.com', 'Jagpreet', 230, 1, '<div style=\"text-align: justify;\"><span class=\"cmp-NewLineToBr\"><span class=\"cmp-NewLineToBr-text\">Parexel strives to be the premier provider to the biopharmaceutical and medical device industries for the development and commercialization of new medical therapies worldwide.</span><span class=\"cmp-NewLineToBr-text\"><br /></span><span class=\"cmp-NewLineToBr-text\"><br />Headquartered near Boston, Massachusetts, Parexel operates in 82 locations in 51 countries around the world, and has 18,450 employees.</span><span class=\"cmp-NewLineToBr-text\"><br /></span><span class=\"cmp-NewLineToBr-text\"><br />We provide the most comprehensive</span></span>&nbsp;<span class=\"cmp-TextWithMoreLink-moreText\"><span class=\"cmp-NewLineToBr\"><span class=\"cmp-NewLineToBr-text\">drug development capabilities of any CRO worldwide. Our global regulatory expertise, Phase I-IV clinical research services, integrated eClinical technologies, and advanced commercialization services all work together to move you through the development journey more smoothly and cost-effectively from beginning to end.</span><span class=\"cmp-NewLineToBr-text\"><br /></span><span class=\"cmp-NewLineToBr-text\"><br />Parexel\'s mission is to combine the strength of our expertise, experience and innovation to advance the worldwide success of the biopharmaceutical and medical device industries in preventing and curing disease.</span></span></span><span class=\"cmp-TextWithMoreLink-less\">&nbsp;</span></div>', 'Chadstone', 4, 'https://www.google.com/', '51-100', '2011', '87778888', '87778888', 'parexel-1591265539-73.jpg', 1, 1, 1, 'parexel-23', 1, 1, 1, 'eb8c0dec0a0ed20be9b304d192fea369d1c695dd86d2e5f8e0e2d7d7bae93bb9', '$2y$10$TcJLd2Vh8ePtC1lwpDKLSeYiEgtl0VEE7KNcMPymkGTkviv561BlG', 'fEs8L5JRTMILPRw8XZw2BqC1Qx9TIHFY1EbrYMdli3t79BaEuT7EdSghBHEU', NULL, '2020-06-03 23:43:43', '2020-06-04 11:20:39', NULL, NULL, NULL, NULL, NULL, 3, '2020-06-03 23:43:43', '2021-06-03 23:43:43', 30, 5),
(24, 'Labourpower Recruitment Services', 'newemp@gmail.com', 'Jagpreet', 230, 1, '<p>Labourpower Recruitment Services specialises in labour hire solutions for businesses in key industry sectors right across Australia.</p>\r\n<p style=\"text-align: justify;\">We pride ourselves on our industry knowledge and have effective processes in place to match the right candidate to the right job every time. So, whether you need one candidate or an entire managed labour solution, the team at Labourpower can deliver.</p>', 'Port Botany', 1, 'https://www.google.com/', '11-50', '2008', '877666776', '877666776', 'labourpower-recruitment-services-1591264352-489.jpg', 1, 1, 1, 'labourpower-recruitment-services-24', 1, 1, 1, '59dca7b7639e675f4219627e801b59ecc5f6cc00570466c7248dca3c36af657b', '$2y$10$7VxsBPaMF6dy4tFsDlH0UulpX7JnSpb1IIyBxW3CluthdxxGJCXoi', 'zPNSnzx9aMyABwczXXifdCy6awxMp4pHr9KEI6YecJ5WgpI7bYmMSri3XSm2', NULL, '2020-06-03 23:48:02', '2020-06-04 10:19:53', NULL, NULL, NULL, NULL, NULL, 4, '2020-06-03 23:48:02', '2021-06-03 23:48:02', 40, 2),
(25, 'Western Health Australia', 'testempl@gmail.com', 'Sonia', 230, 2, '<div style=\"text-align: justify;\">Western Health (WH) manages three acute public hospitals:&nbsp;<a href=\"http://www.westernhealth.org.au/OurSites/WesternHospital\">Footscray Hospital</a>&nbsp;at Footscray;&nbsp;<a href=\"http://www.westernhealth.org.au/OurSites/SunshineHospital\">Sunshine Hospital</a>&nbsp;at St Albans; and the&nbsp;<a href=\"http://www.westernhealth.org.au/OurSites/WilliamstownHospital\">Williamstown Hospital</a>. It also operates the&nbsp;<a href=\"http://www.westernhealth.org.au/OurSites/SunburyDayHospital\">Sunbury Day Hospital</a>, and a&nbsp;<a href=\"http://www.westernhealth.org.au/OurSites/HazeldeanTransitionCare\">Transition Care Program&nbsp;</a>at Hazeldean in Williamstown. A wide range of community based services are also managed by Western Health, along with a large Drug and Alcohol Service.</div>\r\n<div style=\"text-align: justify;\">Services are provided to the western region of Melbourne which has a population of approximately 800,000 people.</div>\r\n<div style=\"text-align: justify;\">Western Health provides a comprehensive, integrated range of services from its various sites; ranging from acute tertiary services in areas of emergency medicine, intensive care, medical and surgical services, through to subacute care and specialist ambulatory clinics. Western Health provides a combination of hospital and community-based services to aged, adult and paediatric patients and newborn babies.</div>\r\n<div style=\"text-align: justify;\">Employing nearly 6500 staff Western Health has a strong philosophy of working with its local community to deliver excellence in patient care.</div>', 'Footscray', 2, 'https://www.google.com/', '51-100', '2010', '2233412', '223412', 'western-health-australia-1591264721-778.jpg', 1, 1, 1, 'western-health-australia-25', 1, 1, 1, '72edbd3c70b8fc10f26a92c6c77e5f750d5114697f793ba0ea7f6898fb473f1e', '$2y$10$VAfn7lkq8oBJFebMByFvm.E50wlPbPQg2iy6UrjQUtXZzLYozySeu', 'h8KiMHm8iccAZZc5LwAybFTCHBlHQtPLk0GfWrYtCwt1Qo7eWUGX7Qyr64ba', NULL, '2020-06-03 23:55:24', '2020-06-04 10:20:58', NULL, NULL, NULL, NULL, NULL, 5, '2020-06-03 23:48:02', '2021-06-03 23:48:02', 50, 0),
(26, 'EBSCO Australia', 'empemp@gmail.com', 'Rajvir', 1, 2, '<div dir=\"ltr\" style=\"text-align: justify;\">EBSCO Information Services is a division of EBSCO,&nbsp;one of the largest privately held and family-owned companies in the United States. EBSCO Industries, Inc. has been in business since 1944. Starting out as a small subscription agency, EBSCO quickly became a pioneer in the library services industry.</div>\r\n<div dir=\"ltr\" style=\"text-align: justify;\">Through vision, action and innovation, EBSCO invests in the library business to ensure the long-term growth of products, services and technologies for our customers.</div>', 'Sunshine', 7, 'https://www.google.com/', '11-50', '2002', '0474645678', '0474645678', 'ebsco-australia-1591265321-246.jpg', 1, 1, 1, 'ebsco-australia-26', 0, 0, 0, '0195ecb3fd580776e0062a0446f39e6f69ceb96d07a1e2f0cb3062c238bdae28', '$2y$10$MZHZ.SYh0p2P5c.7ImH8qOMQ8zWT7vjJTxAdazHTezFZXJWnH19uS', 'ggJ6pEJpNK6kVQODzCYKHBY8UBRXleTpL87T31BDUhbFfNdsKdl8wrnl0v75', NULL, '2020-06-04 00:04:11', '2020-06-04 10:21:34', NULL, NULL, NULL, NULL, NULL, 5, '2020-06-04 00:04:11', '2021-06-04 00:04:11', 50, 5),
(27, 'new emp', 'newemplr@gmail.com', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 'new-emp-27', 0, 0, 0, 'b59fb27a80614d4d5f0d8d8d83ae7e713378c1244fbe79f39031c691ce521b72', '$2y$10$q.csUbporuO2NSHFa8h6vu2jzcUR9Nab/3CdAzUSvg/0Y5JCXka7q', 'IpY18PlMcUmnYc0jI59lmTOBAL4sycLN7vKsum0537NmXJgrQY6MYZI1jUGn', NULL, '2020-06-13 03:05:32', '2020-06-13 13:50:38', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0),
(28, 'EMP Ltd', 'employer@career.com', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, 'emp-ltd-28', 1, 1, 1, NULL, '$2y$10$VkjIYA8l18XOfLYcUN6xmuHbpvxKdIMek0WmASiWbed7/fiujyC6G', 'rCTAdnR1eTzf8KXnD3IJxMmCpgiy0bcs6Dy4g8iho30czHbd3iDbLpemFu6T', NULL, '2020-06-17 23:32:03', '2020-06-18 09:37:28', NULL, NULL, NULL, NULL, NULL, 5, '2020-06-04 00:04:11', '2021-06-04 00:04:11', 50, 2);

-- --------------------------------------------------------

--
-- Table structure for table `company_messages`
--

DROP TABLE IF EXISTS `company_messages`;
CREATE TABLE IF NOT EXISTS `company_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `company_name` varchar(150) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_email` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `from_phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext,
  `subject` varchar(200) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `company_messages`
--

INSERT INTO `company_messages` (`id`, `company_id`, `company_name`, `from_id`, `to_id`, `to_email`, `to_name`, `from_name`, `from_email`, `from_phone`, `message_txt`, `subject`, `is_read`, `created_at`, `updated_at`) VALUES
(5, 17, 'Mayan', 20, 17, 'naveensonia12@gmail.com', 'Mayan', 'test candidate', 'test@gmail.com', '123456', 'contact message', 'contact', 1, '2020-05-26 02:24:35', '2020-05-26 02:30:23'),
(6, 21, 'Montdami Constructions', 9, 21, 'test@employer.com', 'Montdami Constructions', 'sony gurung', 'mail.sonygrg@gmail.com', '1234567', 'message', 'test message', 1, '2020-05-26 16:24:35', '2020-05-26 16:25:12');

-- --------------------------------------------------------

--
-- Table structure for table `company_password_resets`
--

DROP TABLE IF EXISTS `company_password_resets`;
CREATE TABLE IF NOT EXISTS `company_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext,
  `subject` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `full_name`, `email`, `phone`, `message_txt`, `subject`, `created_at`, `updated_at`) VALUES
(3, 'John Smith', 'puccagrg@gmail.com', '0101', 'this is a test contact message', 'contact message', '2020-05-25 20:05:05', '2020-05-25 20:05:05'),
(4, 'abc', 'mail.sonygrg@gmail.com', '121212', 'abc', 'abc', '2020-05-25 20:32:58', '2020-05-25 20:32:58'),
(5, 'new', 'puccagrg@gmail.com', '112121', 'message', 'new message', '2020-05-25 20:34:55', '2020-05-25 20:34:55'),
(6, 'abcacbc', 'testemail@mail.com', '121212', 'this is test message', 'test message', '2020-05-26 15:33:01', '2020-05-26 15:33:01'),
(7, 'test', 'email@email.com', '1212', 'message', 'message', '2020-05-26 16:26:04', '2020-05-26 16:26:04'),
(8, 'sony', 'mail.sonygrg@gmail.com', '456456546', 'new new new new', 'sdfasdf', '2020-06-09 01:38:56', '2020-06-09 01:38:56'),
(9, 'John Smith', 'abc@gmail.com', '0444488888', 'This is a test message.', 'Test Message', '2020-06-13 03:21:02', '2020-06-13 03:21:02'),
(10, 'Jagpreet Singh', 'abc@gmail.com', '455646546', 'this is a test message', 'test message', '2020-06-13 19:52:52', '2020-06-13 19:52:52'),
(11, 'sony', 'sony@gmail.com', '32452356', 'this is a test message', 'test test', '2020-06-13 20:27:04', '2020-06-13 20:27:04'),
(12, 'sprint', 'abc@gmail.com', '3452356', 'sprint 3 test message', 'sprint 3', '2020-06-13 20:34:29', '2020-06-13 20:34:29');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
CREATE TABLE IF NOT EXISTS `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT '0',
  `country` varchar(150) DEFAULT NULL,
  `nationality` varchar(150) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0',
  `sort_order` int(11) DEFAULT '9999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=986 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_id`, `country`, `nationality`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Australia', 'Australian', 1, 1, 1, 'en', '2020-05-01 06:44:05', NULL),
(985, 985, 'india', 'indian', 1, 1, 985, 'EN', '2020-06-10 17:16:10', '2020-06-10 17:16:10');

-- --------------------------------------------------------

--
-- Table structure for table `countries_details`
--

DROP TABLE IF EXISTS `countries_details`;
CREATE TABLE IF NOT EXISTS `countries_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT '0',
  `sort_name` varchar(5) NOT NULL,
  `phone_code` int(7) NOT NULL,
  `currency` varchar(60) DEFAULT NULL,
  `code` varchar(7) DEFAULT NULL,
  `symbol` varchar(7) DEFAULT NULL,
  `thousand_separator` varchar(2) DEFAULT NULL,
  `decimal_separator` varchar(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries_details`
--

INSERT INTO `countries_details` (`id`, `country_id`, `sort_name`, `phone_code`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 1, 'AU', 61, 'AUD', 'AUD', '$', ',', '.', '2020-06-02 13:37:39', '2020-06-09 11:28:06'),
(2, 985, 'IN', 97, 'INR', 'INR', '₹', ',', '.', '2020-06-12 13:12:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `degree_levels`
--

DROP TABLE IF EXISTS `degree_levels`;
CREATE TABLE IF NOT EXISTS `degree_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_level_id` int(11) DEFAULT '0',
  `degree_level` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `degree_levels`
--

INSERT INTO `degree_levels` (`id`, `degree_level_id`, `degree_level`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Bachelor', 1, 1, 1, 'en', '2020-05-05 23:56:39', NULL),
(41, 41, 'doctoral degree', 1, 1, 41, 'EN', '2020-06-10 17:56:13', '2020-06-10 17:56:46'),
(42, 42, 'high school diploma', 1, 1, 42, 'EN', '2020-06-10 17:57:07', '2020-06-10 17:57:07');

-- --------------------------------------------------------

--
-- Table structure for table `degree_types`
--

DROP TABLE IF EXISTS `degree_types`;
CREATE TABLE IF NOT EXISTS `degree_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree_level_id` int(11) DEFAULT '0',
  `degree_type_id` int(11) DEFAULT '0',
  `degree_type` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `degree_types`
--

INSERT INTO `degree_types` (`id`, `degree_level_id`, `degree_type_id`, `degree_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(133, 1, 133, 'Completed', 1, 1, 133, 'EN', '2020-05-11 22:42:24', '2020-05-11 22:42:24'),
(134, 1, 134, 'Ongoing', 0, 1, 134, 'EN', '2020-05-11 22:47:10', '2020-05-11 22:47:10');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
CREATE TABLE IF NOT EXISTS `faqs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `faq_question` mediumtext,
  `faq_answer` mediumtext,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `favourites_company`
--

DROP TABLE IF EXISTS `favourites_company`;
CREATE TABLE IF NOT EXISTS `favourites_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_slug` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites_company`
--

INSERT INTO `favourites_company` (`id`, `user_id`, `company_slug`, `created_at`, `updated_at`) VALUES
(1, 9, 'montdami-constructions-21', '2020-05-26 02:33:26', '2020-05-26 02:33:26');

-- --------------------------------------------------------

--
-- Table structure for table `favourites_job`
--

DROP TABLE IF EXISTS `favourites_job`;
CREATE TABLE IF NOT EXISTS `favourites_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `job_slug` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourites_job`
--

INSERT INTO `favourites_job` (`id`, `user_id`, `job_slug`, `created_at`, `updated_at`) VALUES
(3, 9, 'project-engineer-post-graduate-33', '2020-05-26 01:30:10', '2020-05-26 01:30:10');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_applicants`
--

DROP TABLE IF EXISTS `favourite_applicants`;
CREATE TABLE IF NOT EXISTS `favourite_applicants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `favourite_applicants`
--

INSERT INTO `favourite_applicants` (`id`, `user_id`, `job_id`, `company_id`, `created_at`, `updated_at`) VALUES
(2, 9, 31, 17, '2020-05-17 19:09:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `functional_areas`
--

DROP TABLE IF EXISTS `functional_areas`;
CREATE TABLE IF NOT EXISTS `functional_areas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `functional_area_id` int(11) DEFAULT '0',
  `functional_area` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=592 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `functional_areas`
--

INSERT INTO `functional_areas` (`id`, `functional_area_id`, `functional_area`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Programming', 1, 1, 1, 'en', '2020-05-06 00:02:57', NULL),
(588, 588, 'Engineering', 1, 1, 588, 'EN', '2020-05-19 00:40:06', '2020-05-19 00:40:06'),
(589, 589, 'Accounting', 1, 1, 589, 'EN', '2020-05-19 00:40:28', '2020-05-19 00:40:28'),
(590, 590, 'customer service', 1, 1, 590, 'EN', '2020-06-10 17:50:51', '2020-06-10 17:50:51'),
(591, 591, 'fiance and accounting', 1, 1, 591, 'EN', '2020-06-10 17:51:49', '2020-06-10 17:51:49');

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

DROP TABLE IF EXISTS `genders`;
CREATE TABLE IF NOT EXISTS `genders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gender_id` int(11) DEFAULT '0',
  `gender` varchar(30) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `gender_id`, `gender`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Female', 1, 1, 2, 'en', '2020-04-06 02:17:43', NULL),
(2, 2, 'Male', 1, 1, 1, 'en', '2020-04-06 02:17:52', NULL),
(3, 3, 'Transgender', 1, 1, 3, 'en', '2020-04-11 13:26:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

DROP TABLE IF EXISTS `industries`;
CREATE TABLE IF NOT EXISTS `industries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `industry_id` int(11) DEFAULT '0',
  `industry` varchar(150) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `is_default` tinyint(1) DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=233 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `industry_id`, `industry`, `is_active`, `sort_order`, `lang`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Information Technology', 1, 1, 'en', 1, '2020-05-01 07:14:22', NULL),
(2, 2, 'Telecommunication', 1, 1, 'en', 0, '2020-05-01 07:14:22', NULL),
(230, 230, 'Commerce', 1, 230, 'EN', 1, '2020-05-19 00:40:51', '2020-05-19 00:40:51'),
(231, 231, 'sales', 1, 231, 'EN', 1, '2020-06-10 17:52:56', '2020-06-10 17:52:56'),
(232, 232, 'construction', 1, 232, 'EN', 1, '2020-06-10 17:53:11', '2020-06-10 17:53:12');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `is_freelance` tinyint(1) DEFAULT '0',
  `career_level_id` int(11) DEFAULT NULL,
  `salary_from` int(11) DEFAULT NULL,
  `salary_to` int(11) DEFAULT NULL,
  `hide_salary` tinyint(1) DEFAULT '0',
  `salary_currency` varchar(5) DEFAULT NULL,
  `salary_period_id` int(11) DEFAULT NULL,
  `functional_area_id` int(11) DEFAULT NULL,
  `job_type_id` int(11) DEFAULT NULL,
  `job_shift_id` int(11) DEFAULT NULL,
  `num_of_positions` int(3) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `degree_level_id` int(11) DEFAULT NULL,
  `job_experience_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_featured` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `search` text,
  `slug` varchar(210) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `company_id`, `title`, `description`, `country_id`, `state_id`, `city_id`, `is_freelance`, `career_level_id`, `salary_from`, `salary_to`, `hide_salary`, `salary_currency`, `salary_period_id`, `functional_area_id`, `job_type_id`, `job_shift_id`, `num_of_positions`, `gender_id`, `expiry_date`, `degree_level_id`, `job_experience_id`, `is_active`, `is_featured`, `created_at`, `updated_at`, `search`, `slug`) VALUES
(32, 17, 'CNC Machinist/Programmer', '<p style=\"text-align: justify;\">Manufacturing Company established for over 30 years is seeking an experienced and qualified CNC Machinist/Programmer.</p>\r\n<p style=\"text-align: justify;\">The company is a leader in supplying CNC machined and fabricated components.</p>\r\n<p style=\"text-align: justify;\">The applicant needs to be reliable, self-motivated, able to work with minimum supervision and be QA &amp; OH&amp;S minded.</p>\r\n<p style=\"text-align: justify;\">The company has a vast range of modern CNC Machines.</p>\r\n<p style=\"text-align: justify;\">&middot; Trade qualified CNC Machinist/Programmer with a minimum of 5 years experience in CNC Milling Machine setting &amp; programming skills</p>\r\n<p style=\"text-align: justify;\">&middot; Experience in Unigraphics (not required but an advantage)</p>\r\n<p style=\"text-align: justify;\">&middot; Committed to safe working practices</p>\r\n<p style=\"text-align: justify;\">&middot; Methodical approach to QA &amp; work procedures</p>\r\n<p style=\"text-align: justify;\">&middot; A positive and proactive attitude toward work</p>', 1, 1, 1, 0, 2, 50000, 75000, 0, 'AUD', 2, 588, 1, 17, 2, NULL, '2020-06-25 14:00:00', 1, 2, 1, 1, '2020-05-19 00:43:10', '2020-06-12 13:15:15', 'naveen sonia Australia VIC Melbourne CNC Machinist/Programmer <p>Manufacturing Company established for over 30 years is seeking an experienced and qualified CNC Machinist/Programmer.</p>\r\n<p>The company is a leader in supplying CNC machined and fabricated components.</p>\r\n<p>The applicant needs to be reliable, self-motivated, able to work with minimum supervision and be QA &amp; OH&amp;S minded.</p>\r\n<p>The company has a vast range of modern CNC Machines.</p>\r\n<p>&middot; Trade qualified CNC Machinist/Programmer with a minimum of 5 years experience in CNC Milling Machine setting &amp; programming skills</p>\r\n<p>&middot; Experience in Unigraphics (not required but an advantage)</p>\r\n<p>&middot; Committed to safe working practices</p>\r\n<p>&middot; Methodical approach to QA &amp; work procedures</p>\r\n<p>&middot; A positive and proactive attitude toward work</p> Communication Skill Problem-solving Good decision-making Entry Level 50000 75000Yearly Engineering Contract Full Time No Preference Bachelor More than 1 year', 'cnc-machinistprogrammer-32'),
(33, 21, 'Project Engineer (Post-Graduate)', '<p style=\"text-align: justify;\">Montdami Constructions is a well-established civil construction company based in Melbourne which has a great reputation in the land development industry. With the focus on finding the best technical solutions for our clients, our business has a long-standing history spanning more than three decades.</p>\r\n<p style=\"text-align: justify;\">We are seeking a qualified, competent, hands-on civil engineer who thrives on working under pressure, stands out when working in a team and seeks a long-term career. You will have the possibility to work in an incredibly supportive environment being involved in a vast variety of projects such as roads, underground services, bulk earthworks and subdivisions. The position is a post-graduate role and would suit a recent graduate with some industry experience.</p>\r\n<p style=\"text-align: justify;\">RESPONSIBILITIES OF THE ROLE INCLUDE:</p>\r\n<p style=\"text-align: justify;\">- Leading the team in delivering multi-million-dollar projects in a timely manner and within a specific budget.</p>\r\n<p style=\"text-align: justify;\">- Working closely with Project Managers to allocate resources, plant and equipment.</p>\r\n<p style=\"text-align: justify;\">- Working closely with consultant engineers and clients.</p>\r\n<p style=\"text-align: justify;\">- Being involved in all aspects of construction survey set-out from preparing AutoCAD files to field set-out using the latest survey instruments.</p>\r\n<p style=\"text-align: justify;\">- Procuring materials for several construction activities.</p>\r\n<p style=\"text-align: justify;\">- Ensure compliance with authority construction standards.</p>\r\n<p style=\"text-align: justify;\">- Manage cost to budges and be accountable for regular project forecasting.</p>\r\n<p style=\"text-align: justify;\">- Deliver and maintain project documentation.</p>\r\n<p style=\"text-align: justify;\">TO BE SUCCESSFUL THE APPLICANT MUST HAVE THE FOLLOWING SKILLS:</p>\r\n<p style=\"text-align: justify;\">- Bachelor degree in Civil Engineering is required.</p>\r\n<p style=\"text-align: justify;\">- Excellent computer skills (Microsoft Office, Microsoft Project and AutoCAD Civil 3D is a must).</p>\r\n<p style=\"text-align: justify;\">- Undertaking field survey set-out for several construction activities such as earthworks, sewerage, drainage, etc.</p>\r\n<p style=\"text-align: justify;\">- High level communication skills &ndash; you will need the ability to communicate with and influence experienced workers on site, board level directors, project consultants and clients.</p>\r\n<p style=\"text-align: justify;\">- The ambition and drive to continuously better yourself.</p>\r\n<p style=\"text-align: justify;\">- Well developed skills in programming, cost control, quality assurance, safety, supervision and people management.</p>\r\n<p style=\"text-align: justify;\">- Ability to work to deadlines and targets and ability to prioritize tasks under pressure by applying great attention to details.</p>\r\n<p style=\"text-align: justify;\">- Willing to travel to Melbourne outer suburbs.</p>\r\n<p style=\"text-align: justify;\">- Relevant experience is not a requirement; however having some relevant experience will be looked at very favourably.</p>\r\n<p style=\"text-align: justify;\">To express your interest please email your resume and a detailed cover letter addressing the required skill set to the provided email.</p>\r\n<p style=\"text-align: justify;\">Only successful applicants will be contacted.</p>\r\n<p>Job Types: Full-time, Contract</p>\r\n<p>Salary: $80,000.00 to $120,000.00 /year</p>\r\n<p>Experience:</p>\r\n<ul>\r\n<li>Civil Construction: 1 year (Required)</li>\r\n</ul>\r\n<p>Location:</p>\r\n<ul>\r\n<li>Melbourne VIC (Required)</li>\r\n</ul>\r\n<p>Licence:</p>\r\n<ul>\r\n<li>Full (Required)</li>\r\n</ul>\r\n<p>Language:</p>\r\n<ul>\r\n<li>English (Required)</li>\r\n</ul>\r\n<p>Work Eligibility:</p>\r\n<ul>\r\n<li>The candidate can work permanently with no restriction on hours (Preferred)</li>\r\n</ul>', 1, 1, 1, 0, 2, 80000, 120000, 0, 'AUD', 2, 588, 1, 17, 3, NULL, '2020-06-25 14:00:00', 1, 2, 1, 1, '2020-05-19 01:04:35', '2020-06-12 13:14:58', 'Montdami Constructions Australia VIC Melbourne Project Engineer (Post-Graduate) <p>Montdami Constructions is a well-established civil construction company based in Melbourne which has a great reputation in the land development industry. With the focus on finding the best technical solutions for our clients, our business has a long-standing history spanning more than three decades.</p>\r\n<p>We are seeking a qualified, competent, hands-on civil engineer who thrives on working under pressure, stands out when working in a team and seeks a long-term career. You will have the possibility to work in an incredibly supportive environment being involved in a vast variety of projects such as roads, underground services, bulk earthworks and subdivisions. The position is a post-graduate role and would suit a recent graduate with some industry experience.</p>\r\n<p>RESPONSIBILITIES OF THE ROLE INCLUDE:</p>\r\n<p>- Leading the team in delivering multi-million-dollar projects in a timely manner and within a specific budget.</p>\r\n<p>- Working closely with Project Managers to allocate resources, plant and equipment.</p>\r\n<p>- Working closely with consultant engineers and clients.</p>\r\n<p>- Being involved in all aspects of construction survey set-out from preparing AutoCAD files to field set-out using the latest survey instruments.</p>\r\n<p>- Procuring materials for several construction activities.</p>\r\n<p>- Ensure compliance with authority construction standards.</p>\r\n<p>- Manage cost to budges and be accountable for regular project forecasting.</p>\r\n<p>- Deliver and maintain project documentation.</p>\r\n<p>TO BE SUCCESSFUL THE APPLICANT MUST HAVE THE FOLLOWING SKILLS:</p>\r\n<p>- Bachelor degree in Civil Engineering is required.</p>\r\n<p>- Excellent computer skills (Microsoft Office, Microsoft Project and AutoCAD Civil 3D is a must).</p>\r\n<p>- Undertaking field survey set-out for several construction activities such as earthworks, sewerage, drainage, etc.</p>\r\n<p>- High level communication skills &ndash; you will need the ability to communicate with and influence experienced workers on site, board level directors, project consultants and clients.</p>\r\n<p>- The ambition and drive to continuously better yourself.</p>\r\n<p>- Well developed skills in programming, cost control, quality assurance, safety, supervision and people management.</p>\r\n<p>- Ability to work to deadlines and targets and ability to prioritize tasks under pressure by applying great attention to details.</p>\r\n<p>- Willing to travel to Melbourne outer suburbs.</p>\r\n<p>- Relevant experience is not a requirement; however having some relevant experience will be looked at very favourably.</p>\r\n<p>To express your interest please email your resume and a detailed cover letter addressing the required skill set to the provided email.</p>\r\n<p>Only successful applicants will be contacted.</p>\r\n<p>Job Types: Full-time, Contract</p>\r\n<p>Salary: $80,000.00 to $120,000.00 /year</p>\r\n<p>Experience:</p>\r\n<ul>\r\n<li>Civil Construction: 1 year (Required)</li>\r\n</ul>\r\n<p>Location:</p>\r\n<ul>\r\n<li>Melbourne VIC (Required)</li>\r\n</ul>\r\n<p>Licence:</p>\r\n<ul>\r\n<li>Full (Required)</li>\r\n</ul>\r\n<p>Language:</p>\r\n<ul>\r\n<li>English (Required)</li>\r\n</ul>\r\n<p>Work Eligibility:</p>\r\n<ul>\r\n<li>The candidate can work permanently with no restriction on hours (Preferred)</li>\r\n</ul> Leadership Skill Problem-solving Entry Level 80000 120000Yearly Engineering Contract Office Hours No Preference Bachelor More than 1 year', 'project-engineer-post-graduate-33'),
(35, 23, 'technical product manager', '<p>Sitemate is on a mission to connect the heavy industries - construction, engineering and manufacturing in real-time.</p>\r\n<p>Our first product - Dashpivot, is a platform where organisations standardise their operating procedures in a new digital format. Dashpivot is a new way to capture, organise and track work in the office and on-site - with user-friendly software structured around the daily work of people, projects and teams.</p>\r\n<p>Customers can then track progress in real-time and analyse how their business performs by extracting insights.</p>\r\n<p>See some of our user reviews here:</p>\r\n<ul>\r\n<li>Capterra: https://capterra.com/p/178010/Dashpivot/</li>\r\n</ul>\r\n<ul>\r\n<li>G2 Crowd: https://www.g2.com/products/dashpivot/reviews</li>\r\n</ul>\r\n<ul>\r\n<li>Trust Radius: https://www.trustradius.com/products/dashpivot-by-sitemate/reviews?o=recent</li>\r\n</ul>\r\n<p>Due to COVID19, we also just released a fast-tracked contactless signing functionality, read the announcement post here; https://www.linkedin.com/feed/update/urn: li: activity: 6666485542827499520/</p>\r\n<p><strong>What you&rsquo;ll do</strong></p>\r\n<ul>\r\n<li>Take complete ownership of the &lsquo;last mile&rsquo; in our product development cycle - full ownership and authority to convert quarterly strategic development initiatives into the smallest possible releases, and then manage those releases all the way through to users.</li>\r\n</ul>\r\n<ul>\r\n<li>Own the collective quality of our products when delivered to customers, ensuring that the highest bar is set for product quality and stability once on production. This will require coordination and management of multiple quality gates - unit testing, integration testing, manual regression testing, manual exploratory testing, load testing and both mobile/desktop browser/device coverage testing.</li>\r\n</ul>\r\n<ul>\r\n<li>You&rsquo;ll be running our entire development team and will be heavily engaged with our CTO, Product Designer and all engineers. This will involve weekly coordination of all tasks in the current quarter&rsquo;s backlog, and constant monitoring of the current sprint&rsquo;s progress and production issue reports.</li>\r\n</ul>\r\n<ul>\r\n<li>Day to day you&rsquo;ll be extracting estimates, revising scope, breaking work down into bite-size chunks, scheduling short term priorities, actioning QA plans, managing production issues, reviewing debugging results, creating and shipping minor and major releases.</li>\r\n</ul>\r\n<p><strong>What we&rsquo;re looking for</strong></p>\r\n<ul>\r\n<li>An experienced operator with a track record of delivering best in class products at a rapid pace.</li>\r\n</ul>\r\n<ul>\r\n<li>Someone with the ability to execute as an individual contributor, as well as scale procedures/systems and steer our product team as it grows.</li>\r\n</ul>\r\n<ul>\r\n<li>Prior experience managing product development and owning all of the aspects mentioned above.</li>\r\n</ul>\r\n<p><strong>Technical skills</strong></p>\r\n<ul>\r\n<li>4+ years of product management experience in SaaS and technology</li>\r\n</ul>\r\n<ul>\r\n<li>Experience shipping software to users continuously</li>\r\n</ul>\r\n<ul>\r\n<li>If you can write code, great, if not, you\'re not shy about jumping into GitHub and engaging on PRs.</li>\r\n</ul>\r\n<ul>\r\n<li>Experience with APIs</li>\r\n</ul>\r\n<ul>\r\n<li>Experience with integrations</li>\r\n</ul>\r\n<ul>\r\n<li>Have an understanding of business application software architecture - both web and cloud applications</li>\r\n</ul>\r\n<p><strong>Why work with us</strong></p>\r\n<p>We&rsquo;re growing and are at the start of creating something big - with real impact. Making great software that powers the people who build the world\'s infrastructure.</p>\r\n<p>We&rsquo;re building out an engineering hub in Melbourne, with head office in Sydney and remote team members around the world.</p>\r\n<ul>\r\n<li>Provide products to people on sites that have never experienced best in class SaaS before</li>\r\n</ul>\r\n<ul>\r\n<li>High performing team with a great culture</li>\r\n</ul>\r\n<ul>\r\n<li>Ability to join early and have a global impact</li>\r\n</ul>\r\n<ul>\r\n<li>Modern technologies, tools &amp; processes</li>\r\n</ul>\r\n<p>&nbsp;</p>', 1, 4129, 48688, 0, 24, 80000, 120000, 0, 'AUD', 2, 588, 1, 17, 2, NULL, '2020-06-25 14:00:00', 41, 52, 1, 0, '2020-06-10 18:05:54', '2020-06-12 13:15:24', 'PAREXEL Australia new south wales sydney technical product manager <p>Sitemate is on a mission to connect the heavy industries - construction, engineering and manufacturing in real-time.</p>\r\n<p>Our first product - Dashpivot, is a platform where organisations standardise their operating procedures in a new digital format. Dashpivot is a new way to capture, organise and track work in the office and on-site - with user-friendly software structured around the daily work of people, projects and teams.</p>\r\n<p>Customers can then track progress in real-time and analyse how their business performs by extracting insights.</p>\r\n<p>See some of our user reviews here:</p>\r\n<ul>\r\n<li>Capterra: https://capterra.com/p/178010/Dashpivot/</li>\r\n</ul>\r\n<ul>\r\n<li>G2 Crowd: https://www.g2.com/products/dashpivot/reviews</li>\r\n</ul>\r\n<ul>\r\n<li>Trust Radius: https://www.trustradius.com/products/dashpivot-by-sitemate/reviews?o=recent</li>\r\n</ul>\r\n<p>Due to COVID19, we also just released a fast-tracked contactless signing functionality, read the announcement post here; https://www.linkedin.com/feed/update/urn: li: activity: 6666485542827499520/</p>\r\n<p><strong>What you&rsquo;ll do</strong></p>\r\n<ul>\r\n<li>Take complete ownership of the &lsquo;last mile&rsquo; in our product development cycle - full ownership and authority to convert quarterly strategic development initiatives into the smallest possible releases, and then manage those releases all the way through to users.</li>\r\n</ul>\r\n<ul>\r\n<li>Own the collective quality of our products when delivered to customers, ensuring that the highest bar is set for product quality and stability once on production. This will require coordination and management of multiple quality gates - unit testing, integration testing, manual regression testing, manual exploratory testing, load testing and both mobile/desktop browser/device coverage testing.</li>\r\n</ul>\r\n<ul>\r\n<li>You&rsquo;ll be running our entire development team and will be heavily engaged with our CTO, Product Designer and all engineers. This will involve weekly coordination of all tasks in the current quarter&rsquo;s backlog, and constant monitoring of the current sprint&rsquo;s progress and production issue reports.</li>\r\n</ul>\r\n<ul>\r\n<li>Day to day you&rsquo;ll be extracting estimates, revising scope, breaking work down into bite-size chunks, scheduling short term priorities, actioning QA plans, managing production issues, reviewing debugging results, creating and shipping minor and major releases.</li>\r\n</ul>\r\n<p><strong>What we&rsquo;re looking for</strong></p>\r\n<ul>\r\n<li>An experienced operator with a track record of delivering best in class products at a rapid pace.</li>\r\n</ul>\r\n<ul>\r\n<li>Someone with the ability to execute as an individual contributor, as well as scale procedures/systems and steer our product team as it grows.</li>\r\n</ul>\r\n<ul>\r\n<li>Prior experience managing product development and owning all of the aspects mentioned above.</li>\r\n</ul>\r\n<p><strong>Technical skills</strong></p>\r\n<ul>\r\n<li>4+ years of product management experience in SaaS and technology</li>\r\n</ul>\r\n<ul>\r\n<li>Experience shipping software to users continuously</li>\r\n</ul>\r\n<ul>\r\n<li>If you can write code, great, if not, you\'re not shy about jumping into GitHub and engaging on PRs.</li>\r\n</ul>\r\n<ul>\r\n<li>Experience with APIs</li>\r\n</ul>\r\n<ul>\r\n<li>Experience with integrations</li>\r\n</ul>\r\n<ul>\r\n<li>Have an understanding of business application software architecture - both web and cloud applications</li>\r\n</ul>\r\n<p><strong>Why work with us</strong></p>\r\n<p>We&rsquo;re growing and are at the start of creating something big - with real impact. Making great software that powers the people who build the world\'s infrastructure.</p>\r\n<p>We&rsquo;re building out an engineering hub in Melbourne, with head office in Sydney and remote team members around the world.</p>\r\n<ul>\r\n<li>Provide products to people on sites that have never experienced best in class SaaS before</li>\r\n</ul>\r\n<ul>\r\n<li>High performing team with a great culture</li>\r\n</ul>\r\n<ul>\r\n<li>Ability to join early and have a global impact</li>\r\n</ul>\r\n<ul>\r\n<li>Modern technologies, tools &amp; processes</li>\r\n</ul>\r\n<p>&nbsp;</p> Communication Skill Problem-solving Good decision-making high level management 80000 120000Yearly Engineering Contract Full Time No Preference doctoral degree more than 3 years', 'technical-product-manager-35'),
(36, 24, 'admin assistant', '<p>The Role will involve:</p>\r\n<ul>\r\n<li>Customer Service duties</li>\r\n<li>Data Entry</li>\r\n<li>Taking and processing of customers orders</li>\r\n<li>Liaising with senior representatives in a professional manner</li>\r\n<li>Use of internal software &ndash; Maximas is an advantage</li>\r\n</ul>\r\n<p>As an Admin Assistant &ndash; Customer Service Officer you will have:</p>\r\n<ul>\r\n<li>A strong work ethic with a can-do, team player focus</li>\r\n<li>Excellent administration skills</li>\r\n<li>Experience working in a customer service position (preferably in an industrial setting)</li>\r\n<li>Excellent time management skills and the ability to multi-task in a fast paced environment</li>\r\n</ul>\r\n<p>&nbsp;</p>', 1, 1, 1, 0, 25, 26, 27, 0, 'AUD', 3, 590, 5, 20, 1, NULL, '2020-06-24 14:00:00', 1, 1, 1, 0, '2020-06-10 20:11:53', '2020-06-10 20:11:54', 'Labourpower Recruitment Services Australia VIC Melbourne admin assistant <p>The Role will involve:</p>\r\n<ul>\r\n<li>Customer Service duties</li>\r\n<li>Data Entry</li>\r\n<li>Taking and processing of customers orders</li>\r\n<li>Liaising with senior representatives in a professional manner</li>\r\n<li>Use of internal software &ndash; Maximas is an advantage</li>\r\n</ul>\r\n<p>As an Admin Assistant &ndash; Customer Service Officer you will have:</p>\r\n<ul>\r\n<li>A strong work ethic with a can-do, team player focus</li>\r\n<li>Excellent administration skills</li>\r\n<li>Experience working in a customer service position (preferably in an industrial setting)</li>\r\n<li>Excellent time management skills and the ability to multi-task in a fast paced environment</li>\r\n</ul>\r\n<p>&nbsp;</p> Communication Skill Punctual experienced 26 27Weekly customer service Part Time monday to friday No Preference Bachelor Less than 1 year', 'admin-assistant-36'),
(37, 9, 'frontend developer', '<p>Mahatta Art&rsquo; is an initiative taken by the &lsquo;Mahatta Group&rsquo; which is involved with the business of Photography, since 1918.<br />In the year 2002, Mahatta evolved into the Digital Photography by venturing into the Online Image Licensing Business, fulfilled the Image needs of Advertising Agencies, Marketing, Media Professionals, Newspapers &amp; Publications etc.<br />After success and 14 years of experience in the digital image stock industry, Mahatta introduced Mahatta Art- the only web portal of its kind in India in the year 2014.<br />Mahatta Art is a print on demand business model with more than 5.5 lakh images which includes Photography, Paintings, Posters and Illustrations from world renowned Collections and Artists.<br />The content ranges from Abstracts to Nature Photography, Legendary to Amateur Artists, Heritage to Modern Indian Art, Modern to Contemporary Art, Humorous Quotes to Serious and Hollywood Vintage Posters etc.</p>\r\n<p>&nbsp;</p>', 1, 4130, 48691, 0, 24, 50000, 70000, 0, 'AUD', 1, 1, 1, 17, 2, NULL, '2020-06-25 14:00:00', 41, 52, 1, 0, '2020-06-10 20:17:26', '2020-06-10 20:17:26', 'Multimedia Design Australia queensland brisbane frontend developer <p>Mahatta Art&rsquo; is an initiative taken by the &lsquo;Mahatta Group&rsquo; which is involved with the business of Photography, since 1918.<br />In the year 2002, Mahatta evolved into the Digital Photography by venturing into the Online Image Licensing Business, fulfilled the Image needs of Advertising Agencies, Marketing, Media Professionals, Newspapers &amp; Publications etc.<br />After success and 14 years of experience in the digital image stock industry, Mahatta introduced Mahatta Art- the only web portal of its kind in India in the year 2014.<br />Mahatta Art is a print on demand business model with more than 5.5 lakh images which includes Photography, Paintings, Posters and Illustrations from world renowned Collections and Artists.<br />The content ranges from Abstracts to Nature Photography, Legendary to Amateur Artists, Heritage to Modern Indian Art, Modern to Contemporary Art, Humorous Quotes to Serious and Hollywood Vintage Posters etc.</p>\r\n<p>&nbsp;</p> Communication Skill Good decision-making high level management 50000 70000Monthly Programming Contract Full Time No Preference doctoral degree more than 3 years', 'frontend-developer-37'),
(38, 22, 'C++ Programmer', '<p>We are an Australian-owned game development studio, with strong, established relationships with publishers in the US and Europe. We are based in Melbourne&rsquo;s East, close to public transport with free onsite parking.</p>\r\n<p>We&rsquo;ve worked on licensed products for Disney, Dreamworks, Sony, Mattel, Nickelodeon, and others. Currently, we&rsquo;re working on both original and licensed titles in the tactics, RTS, sports and FPS genres.</p>\r\n<p>We are looking for a C++ Programmer. The role will be full time, fixed-term for 12 months, with potential to extend the contract. Salary will be commensurate with experience.</p>\r\n<p>*</p>\r\n<ul>\r\n<li>Strong understanding of C++</li>\r\n<li>Sound knowledge of 3-D maths and physics</li>\r\n<li>Ability to work on tasks unsupervised</li>\r\n<li>Self-motivated</li>\r\n<li>Strong technical problem-solving skills</li>\r\n<li>Ability to identify and implement fun game-play</li>\r\n<li>Provide creative input to the design and implementation of game-play mechanics</li>\r\n<li>Able to integrate quickly into an existing team</li>\r\n<li>Huge passion for creating and playing games</li>\r\n</ul>\r\n<p><strong>Desired skills:</strong></p>\r\n<ul>\r\n<li>Vendor certification experience</li>\r\n<li>Experience in Unreal Engine 3 and/or 4</li>\r\n<li>Experience in one or more of the following game-play disciplines:</li>\r\n</ul>\r\n<ul>\r\n<li>Character animation implementation</li>\r\n<li>Artificial intelligence</li>\r\n<li>Game camera logic and behaviour</li>\r\n<li>Game-play and vehicle physics</li>\r\n<li>Effects, including both particle and sound</li>\r\n<li>User Interface design and implementation</li>\r\n<li>Experience with graphics and shader programming</li>\r\n</ul>\r\n<p><strong>Selection Criteria:</strong></p>\r\n<ul>\r\n<li>Excellent skills in C++</li>\r\n<li>Two or more years experience</li>\r\n<li>Worked on at least one completed or soon-to-be-released game title</li>\r\n<li>Experience working with current generation consoles and/or mobile devices and/or PC</li>\r\n</ul>\r\n<p>Job Types: Full-time, Permanent</p>\r\n<p>Work Eligibility:</p>\r\n<ul>\r\n<li>The candidate can work permanently with no restriction on hours (Preferred)</li>\r\n</ul>\r\n<p>Work Remotely:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">No</li>\r\n</ul>', 1, 4129, 48689, 0, 25, 30000, 35000, 0, 'AUD', 1, 1, 1, 17, 12, NULL, '2020-06-30 14:00:00', 1, 52, 1, 1, '2020-06-13 15:14:27', '2020-06-13 15:14:27', 'Gough Recruitment Australia new south wales newcastle C++ Programmer <p>We are an Australian-owned game development studio, with strong, established relationships with publishers in the US and Europe. We are based in Melbourne&rsquo;s East, close to public transport with free onsite parking.</p>\r\n<p>We&rsquo;ve worked on licensed products for Disney, Dreamworks, Sony, Mattel, Nickelodeon, and others. Currently, we&rsquo;re working on both original and licensed titles in the tactics, RTS, sports and FPS genres.</p>\r\n<p>We are looking for a C++ Programmer. The role will be full time, fixed-term for 12 months, with potential to extend the contract. Salary will be commensurate with experience.</p>\r\n<p>*</p>\r\n<ul>\r\n<li>Strong understanding of C++</li>\r\n<li>Sound knowledge of 3-D maths and physics</li>\r\n<li>Ability to work on tasks unsupervised</li>\r\n<li>Self-motivated</li>\r\n<li>Strong technical problem-solving skills</li>\r\n<li>Ability to identify and implement fun game-play</li>\r\n<li>Provide creative input to the design and implementation of game-play mechanics</li>\r\n<li>Able to integrate quickly into an existing team</li>\r\n<li>Huge passion for creating and playing games</li>\r\n</ul>\r\n<p><strong>Desired skills:</strong></p>\r\n<ul>\r\n<li>Vendor certification experience</li>\r\n<li>Experience in Unreal Engine 3 and/or 4</li>\r\n<li>Experience in one or more of the following game-play disciplines:</li>\r\n</ul>\r\n<ul>\r\n<li>Character animation implementation</li>\r\n<li>Artificial intelligence</li>\r\n<li>Game camera logic and behaviour</li>\r\n<li>Game-play and vehicle physics</li>\r\n<li>Effects, including both particle and sound</li>\r\n<li>User Interface design and implementation</li>\r\n<li>Experience with graphics and shader programming</li>\r\n</ul>\r\n<p><strong>Selection Criteria:</strong></p>\r\n<ul>\r\n<li>Excellent skills in C++</li>\r\n<li>Two or more years experience</li>\r\n<li>Worked on at least one completed or soon-to-be-released game title</li>\r\n<li>Experience working with current generation consoles and/or mobile devices and/or PC</li>\r\n</ul>\r\n<p>Job Types: Full-time, Permanent</p>\r\n<p>Work Eligibility:</p>\r\n<ul>\r\n<li>The candidate can work permanently with no restriction on hours (Preferred)</li>\r\n</ul>\r\n<p>Work Remotely:</p>\r\n<ul>\r\n<li style=\"text-align: justify;\">No</li>\r\n</ul> Leadership Skill Punctual experienced 30000 35000Monthly Programming Contract Full Time No Preference Bachelor more than 3 years', 'c-programmer-38'),
(39, 17, 'Test Job', 'This is a test job', 1, 1, 48681, 0, 2, 2000, 2500, 0, 'AUD', 1, 588, 1, 17, 3, NULL, '2020-07-07 14:00:00', 1, 1, 1, 0, '2020-06-13 19:48:50', '2020-06-13 19:48:51', 'Mayan Australia VIC Craigieburn Test Job This is a test job Leadership Skill Punctual Entry Level 2000 2500Monthly Engineering Contract Full Time No Preference Bachelor Less than 1 year', 'test-job-39');

-- --------------------------------------------------------

--
-- Table structure for table `job_apply`
--

DROP TABLE IF EXISTS `job_apply`;
CREATE TABLE IF NOT EXISTS `job_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `cv_id` int(11) DEFAULT NULL,
  `current_salary` int(11) DEFAULT NULL,
  `expected_salary` int(11) DEFAULT NULL,
  `salary_currency` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_apply`
--

INSERT INTO `job_apply` (`id`, `user_id`, `job_id`, `cv_id`, `current_salary`, `expected_salary`, `salary_currency`, `created_at`, `updated_at`) VALUES
(24, 9, 33, 12, 2000, 3000, 'AUD', '2020-06-06 17:14:18', '2020-06-06 17:14:18'),
(25, 9, 39, 12, 2000, 2500, 'AUD', '2020-06-13 19:50:55', '2020-06-13 19:50:55');

-- --------------------------------------------------------

--
-- Table structure for table `job_experiences`
--

DROP TABLE IF EXISTS `job_experiences`;
CREATE TABLE IF NOT EXISTS `job_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_experience_id` int(11) DEFAULT '0',
  `job_experience` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_experiences`
--

INSERT INTO `job_experiences` (`id`, `job_experience_id`, `job_experience`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Less than 1 year', 1, 1, 1, 'en', '2020-05-01 07:11:17', NULL),
(2, 2, 'More than 1 year', 0, 1, 2, 'en', '2020-05-01 07:11:17', NULL),
(52, 52, 'more than 3 years', 1, 1, 52, 'EN', '2020-06-10 17:53:45', '2020-06-10 17:53:45');

-- --------------------------------------------------------

--
-- Table structure for table `job_shifts`
--

DROP TABLE IF EXISTS `job_shifts`;
CREATE TABLE IF NOT EXISTS `job_shifts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_shift_id` int(11) DEFAULT '0',
  `job_shift` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_shifts`
--

INSERT INTO `job_shifts` (`id`, `job_shift_id`, `job_shift`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(17, 17, 'Full Time', 1, 1, 17, 'EN', '2020-05-11 21:55:51', NULL),
(18, 18, 'part time', 1, 1, 18, 'EN', '2020-06-10 17:54:56', '2020-06-10 17:54:56'),
(19, 19, 'evening shift', 1, 1, 19, 'EN', '2020-06-10 17:55:27', '2020-06-10 17:55:27'),
(20, 20, 'monday to friday', 1, 1, 20, 'EN', '2020-06-10 17:55:43', '2020-06-10 17:55:43');

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

DROP TABLE IF EXISTS `job_skills`;
CREATE TABLE IF NOT EXISTS `job_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_skill_id` int(11) DEFAULT '0',
  `job_skill` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_skills`
--

INSERT INTO `job_skills` (`id`, `job_skill_id`, `job_skill`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(80, 80, 'Communication Skill', 1, 1, 80, 'EN', '2020-05-17 18:55:44', '2020-05-17 18:55:45'),
(81, 81, 'Leadership Skill', 1, 1, 81, 'EN', '2020-05-17 18:58:52', '2020-05-17 18:58:53'),
(82, 82, 'Punctual', 1, 1, 82, 'EN', '2020-05-17 18:59:14', '2020-05-17 18:59:15'),
(83, 83, 'Problem-solving', 1, 1, 83, 'EN', '2020-05-19 00:36:40', '2020-05-19 00:36:40'),
(84, 84, 'Good decision-making', 1, 1, 84, 'EN', '2020-05-19 00:37:03', '2020-05-19 00:37:03');

-- --------------------------------------------------------

--
-- Table structure for table `job_titles`
--

DROP TABLE IF EXISTS `job_titles`;
CREATE TABLE IF NOT EXISTS `job_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_title_id` int(11) DEFAULT '0',
  `job_title` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_titles`
--

INSERT INTO `job_titles` (`id`, `job_title_id`, `job_title`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Accountant', 1, 1, 1, 'en', '2018-04-05 06:16:40', '2018-04-08 13:47:30'),
(2, 2, 'Accounts Officer', 1, 1, 2, 'en', '2018-04-05 06:16:58', '2018-04-05 06:16:58'),
(3, 3, 'Business Development Executive', 1, 1, 3, 'en', '2018-04-05 06:17:59', '2018-04-05 06:17:59'),
(4, 4, 'Business Development Officer', 1, 1, 4, 'en', '2018-04-05 06:18:26', '2018-04-05 06:18:26'),
(5, 5, 'Call Center Agent', 1, 1, 5, 'en', '2018-04-06 07:24:47', NULL),
(6, 6, 'Computer Operator', 1, 1, 6, 'en', '2018-04-06 07:24:47', NULL),
(7, 7, 'Content Writer', 1, 1, 7, 'en', '2018-04-06 07:24:47', NULL),
(8, 8, 'Customer Representative Officer', 1, 1, 8, 'en', '2018-04-06 07:24:47', NULL),
(9, 9, 'Data Entry Operator', 1, 1, 9, 'en', '2018-04-06 07:24:47', NULL),
(10, 10, 'Graphic Designer', 1, 1, 10, 'en', '2018-04-06 07:24:47', NULL),
(11, 11, 'Marketing Executive', 1, 1, 11, 'en', '2018-04-06 07:24:47', NULL),
(12, 12, 'Marketing Manager', 1, 1, 12, 'en', '2018-04-06 07:24:47', NULL),
(13, 13, 'Office Assistant', 1, 1, 13, 'en', '2018-04-06 07:24:47', NULL),
(14, 14, 'PHP Developer', 1, 1, 14, 'en', '2018-04-06 07:24:47', NULL),
(15, 15, 'Receptionist', 1, 1, 15, 'en', '2018-04-06 07:24:47', NULL),
(16, 16, 'Sales / Marketing Executive', 1, 1, 16, 'en', '2018-04-06 07:24:47', NULL),
(17, 17, 'Sales Executive', 1, 1, 17, 'en', '2018-04-06 07:24:47', NULL),
(18, 18, 'Sales Officer', 1, 1, 18, 'en', '2018-04-06 07:24:47', NULL),
(19, 19, 'Subject Teacher', 1, 1, 19, 'en', '2018-04-06 07:24:47', NULL),
(20, 20, 'Web Developer', 1, 1, 20, 'en', '2018-04-06 07:24:47', '2018-04-08 13:49:35'),
(21, 5, 'Agente de centro de llamadas', 0, 1, 1, 'es', '2018-04-06 07:25:12', NULL),
(22, 13, 'Asistente de oficina', 0, 1, 2, 'es', '2018-04-06 07:25:12', NULL),
(23, 1, 'Contador', 0, 1, 3, 'es', '2018-04-06 07:25:12', NULL),
(24, 14, 'Desarrollador PHP', 0, 1, 4, 'es', '2018-04-06 07:25:12', NULL),
(25, 20, 'Desarrollador web', 0, 1, 5, 'es', '2018-04-06 07:25:12', NULL),
(26, 10, 'Diseñador grafico', 0, 1, 6, 'es', '2018-04-06 07:25:12', NULL),
(27, 11, 'Ejecutivo de marketing', 0, 1, 7, 'es', '2018-04-06 07:25:12', NULL),
(28, 3, 'Ejecutivo de Negocios para el Desarrollo', 0, 1, 8, 'es', '2018-04-06 07:25:12', NULL),
(29, 17, 'Ejecutivo de ventas', 0, 1, 9, 'es', '2018-04-06 07:25:12', NULL),
(30, 16, 'Ejecutivo en Ventas y Mercadotecnia', 0, 1, 10, 'es', '2018-04-06 07:25:12', NULL),
(31, 7, 'Escritor de contenido', 0, 1, 11, 'es', '2018-04-06 07:25:12', NULL),
(32, 12, 'Gerente de Marketing', 0, 1, 12, 'es', '2018-04-06 07:25:12', NULL),
(33, 19, 'Maestro de asignatura', 0, 1, 13, 'es', '2018-04-06 07:25:12', NULL),
(34, 2, 'Oficial de cuentas', 0, 1, 14, 'es', '2018-04-06 07:25:12', NULL),
(35, 4, 'Oficial de desarrollo de negocios', 0, 1, 15, 'es', '2018-04-06 07:25:12', NULL),
(36, 18, 'Oficial de las ventas', 0, 1, 16, 'es', '2018-04-06 07:25:12', NULL),
(37, 9, 'Operador de entrada de datos', 0, 1, 17, 'es', '2018-04-06 07:25:12', NULL),
(38, 6, 'Operador de la computadora', 0, 1, 18, 'es', '2018-04-06 07:25:12', NULL),
(39, 15, 'Recepcionista', 0, 1, 19, 'es', '2018-04-06 07:25:12', NULL),
(40, 8, 'Representante del cliente', 0, 1, 20, 'es', '2018-04-06 07:25:12', NULL),
(41, 11, 'التسويق التنفيذي', 0, 1, 1, 'ar', '2018-04-11 18:39:03', NULL),
(42, 17, 'المبيعات التنفيذي', 0, 1, 2, 'ar', '2018-04-11 18:39:03', NULL),
(43, 7, 'كاتب المحتوى', 0, 1, 3, 'ar', '2018-04-11 18:39:03', NULL),
(44, 16, 'مبيعات & أمبير؛ التسويق التنفيذي', 0, 1, 4, 'ar', '2018-04-11 18:39:03', NULL),
(45, 1, 'محاسب', 0, 1, 5, 'ar', '2018-04-11 18:39:03', NULL),
(46, 9, 'مدخل بيانات', 0, 1, 6, 'ar', '2018-04-11 18:39:03', NULL),
(47, 19, 'مدرس المادة', 0, 1, 7, 'ar', '2018-04-11 18:39:03', NULL),
(48, 12, 'مدير التسويق', 0, 1, 8, 'ar', '2018-04-11 18:39:03', NULL),
(49, 13, 'مساعد المكتب', 0, 1, 9, 'ar', '2018-04-11 18:39:03', NULL),
(50, 18, 'مسؤول المبيعات', 0, 1, 10, 'ar', '2018-04-11 18:39:03', NULL),
(51, 6, 'مشغل كمبيوتر', 0, 1, 11, 'ar', '2018-04-11 18:39:03', NULL),
(52, 10, 'مصمم جرافيك', 0, 1, 12, 'ar', '2018-04-11 18:39:03', NULL),
(53, 14, 'مطور PHP', 0, 1, 13, 'ar', '2018-04-11 18:39:03', NULL),
(54, 3, 'مطور الاعمال التنفيذيه', 0, 1, 14, 'ar', '2018-04-11 18:39:03', NULL),
(55, 20, 'مطور ويب', 0, 1, 15, 'ar', '2018-04-11 18:39:03', NULL),
(56, 8, 'ممثل مندوب العميل', 0, 1, 16, 'ar', '2018-04-11 18:39:03', NULL),
(57, 15, 'موظف الإستقبال', 0, 1, 17, 'ar', '2018-04-11 18:39:03', NULL),
(58, 4, 'موظف تطويرالعمل', 0, 1, 18, 'ar', '2018-04-11 18:39:03', NULL),
(59, 2, 'موظف حسابات', 0, 1, 19, 'ar', '2018-04-11 18:39:03', NULL),
(60, 5, 'وكيل مركز الاتصال', 0, 1, 20, 'ar', '2018-04-11 18:39:03', NULL),
(61, 15, 'استقبال', 0, 1, 1, 'ur', '2018-04-11 18:40:24', NULL),
(62, 2, 'اکاؤنٹس آفیسر', 0, 1, 2, 'ur', '2018-04-11 18:40:24', NULL),
(63, 1, 'اکاؤنٹنٹ', 0, 1, 3, 'ur', '2018-04-11 18:40:24', NULL),
(64, 13, 'آفس اسسٹنٹ. دفتری معاون', 0, 1, 4, 'ur', '2018-04-11 18:40:24', NULL),
(65, 14, 'پی ایچ پی ڈیولپر', 0, 1, 5, 'ur', '2018-04-11 18:40:24', NULL),
(66, 9, 'ڈیٹا انٹری آپریٹر', 0, 1, 6, 'ur', '2018-04-11 18:40:24', NULL),
(67, 16, 'سیلز / مارکیٹنگ ایگزیکٹو', 0, 1, 7, 'ur', '2018-04-11 18:40:24', NULL),
(68, 17, 'سیلز ایگزیکٹو', 0, 1, 8, 'ur', '2018-04-11 18:40:24', NULL),
(69, 18, 'سیلز آفیسر', 0, 1, 9, 'ur', '2018-04-11 18:40:24', NULL),
(70, 4, 'کاروباری ترقی افسر', 0, 1, 10, 'ur', '2018-04-11 18:40:24', NULL),
(71, 3, 'کاروباری ترقی ایگزیکٹو', 0, 1, 11, 'ur', '2018-04-11 18:40:24', NULL),
(72, 5, 'کال سینٹر ایجنٹ', 0, 1, 12, 'ur', '2018-04-11 18:40:24', NULL),
(73, 8, 'کسٹمر نمائندے آفیسر', 0, 1, 13, 'ur', '2018-04-11 18:40:24', NULL),
(74, 6, 'کمپیوٹر چلانے والا', 0, 1, 14, 'ur', '2018-04-11 18:40:24', NULL),
(75, 10, 'گرافک ڈیزائنر', 0, 1, 15, 'ur', '2018-04-11 18:40:24', NULL),
(76, 11, 'مارکیٹنگ ایگزیکٹو', 0, 1, 16, 'ur', '2018-04-11 18:40:24', NULL),
(77, 12, 'مارکیٹنگ مینیجر', 0, 1, 17, 'ur', '2018-04-11 18:40:24', NULL),
(78, 7, 'مواد مصنف', 0, 1, 18, 'ur', '2018-04-11 18:40:24', NULL),
(79, 19, 'موضوع ٹیچر', 0, 1, 19, 'ur', '2018-04-11 18:40:24', NULL),
(80, 20, 'ویب ڈویلپر', 0, 1, 20, 'ur', '2018-04-11 18:40:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

DROP TABLE IF EXISTS `job_types`;
CREATE TABLE IF NOT EXISTS `job_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_id` int(11) DEFAULT '0',
  `job_type` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `job_type_id`, `job_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Contract', 1, 1, 1, 'en', '2018-04-05 23:24:38', '2018-04-08 13:18:35'),
(2, 2, 'Freelance', 1, 1, 2, 'en', '2018-04-05 23:25:25', '2018-04-08 13:18:35'),
(3, 3, 'Temporary', 1, 1, 3, 'en', '2018-04-05 23:26:14', '2018-04-08 13:18:35'),
(4, 4, 'Internship', 1, 1, 4, 'en', '2018-04-05 23:26:58', '2018-04-08 13:18:27'),
(5, 5, 'Part Time', 1, 1, 5, 'en', '2018-04-05 23:29:17', '2018-04-08 13:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
CREATE TABLE IF NOT EXISTS `languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lang` varchar(250) DEFAULT NULL,
  `native` varchar(250) DEFAULT NULL,
  `iso_code` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '0',
  `is_rtl` tinyint(1) NOT NULL DEFAULT '0',
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang`, `native`, `iso_code`, `is_active`, `is_rtl`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'English', 'EN', 1, 0, 1, '2020-05-07 07:25:25', '2020-05-12 07:55:34'),
(193, 'Spanish', 'Spanish', 'es', 1, 0, 0, '2020-06-03 15:36:32', '2020-06-03 15:36:32');

-- --------------------------------------------------------

--
-- Table structure for table `language_levels`
--

DROP TABLE IF EXISTS `language_levels`;
CREATE TABLE IF NOT EXISTS `language_levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language_level_id` int(11) DEFAULT '0',
  `language_level` varchar(40) NOT NULL,
  `is_default` int(1) DEFAULT '0',
  `is_active` int(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '9999',
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `language_levels`
--

INSERT INTO `language_levels` (`id`, `language_level_id`, `language_level`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Beginner', 1, 1, 1, 'en', '2020-05-12 04:10:45', NULL),
(2, 2, 'Intermediate', 1, 1, 2, 'en', '2020-05-12 04:11:05', NULL),
(3, 3, 'Expert', 1, 1, 3, 'en', '2020-05-10 04:11:22', NULL),
(13, 13, 'fluent', 1, 1, 13, 'EN', '2020-06-10 17:47:39', '2020-06-10 17:47:39');

-- --------------------------------------------------------

--
-- Table structure for table `major_subjects`
--

DROP TABLE IF EXISTS `major_subjects`;
CREATE TABLE IF NOT EXISTS `major_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_subject_id` int(11) DEFAULT '0',
  `major_subject` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1735 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `major_subjects`
--

INSERT INTO `major_subjects` (`id`, `major_subject_id`, `major_subject`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Accounting', 1, 1, 1, 'en', '2020-05-12 08:54:31', NULL),
(2, 2, 'Programming', 0, 1, 2, 'en', '2020-05-12 10:50:02', NULL),
(3, 3, 'Commerce', 0, 1, 3, 'en', '2020-05-12 10:50:02', NULL),
(1733, 1733, 'testing', 1, 1, 1733, 'EN', '2020-06-10 17:59:12', '2020-06-10 17:59:12'),
(1734, 1734, 'methodology', 1, 1, 1734, 'EN', '2020-06-10 17:59:29', '2020-06-10 17:59:29');

-- --------------------------------------------------------

--
-- Table structure for table `manage_job_skills`
--

DROP TABLE IF EXISTS `manage_job_skills`;
CREATE TABLE IF NOT EXISTS `manage_job_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT '0',
  `job_skill_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=393 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `manage_job_skills`
--

INSERT INTO `manage_job_skills` (`id`, `job_id`, `job_skill_id`, `created_at`, `updated_at`) VALUES
(292, 20, 15, '2018-09-17 12:25:50', '2018-09-17 12:25:50'),
(293, 20, 16, '2018-09-17 12:25:50', '2018-09-17 12:25:50'),
(294, 20, 18, '2018-09-17 12:25:50', '2018-09-17 12:25:50'),
(308, 21, 2, '2018-09-18 11:23:47', '2018-09-18 11:23:47'),
(309, 21, 6, '2018-09-18 11:23:47', '2018-09-18 11:23:47'),
(310, 21, 8, '2018-09-18 11:23:47', '2018-09-18 11:23:47'),
(311, 22, 6, '2018-09-18 11:24:56', '2018-09-18 11:24:56'),
(312, 22, 8, '2018-09-18 11:24:56', '2018-09-18 11:24:56'),
(313, 22, 10, '2018-09-18 11:24:56', '2018-09-18 11:24:56'),
(314, 22, 11, '2018-09-18 11:24:56', '2018-09-18 11:24:56'),
(315, 6, 15, '2018-09-18 11:25:22', '2018-09-18 11:25:22'),
(316, 6, 16, '2018-09-18 11:25:22', '2018-09-18 11:25:22'),
(317, 6, 19, '2018-09-18 11:25:22', '2018-09-18 11:25:22'),
(318, 4, 5, '2018-09-18 11:26:48', '2018-09-18 11:26:48'),
(319, 4, 12, '2018-09-18 11:26:48', '2018-09-18 11:26:48'),
(320, 4, 17, '2018-09-18 11:26:48', '2018-09-18 11:26:48'),
(321, 5, 6, '2018-09-18 11:26:57', '2018-09-18 11:26:57'),
(322, 5, 8, '2018-09-18 11:26:57', '2018-09-18 11:26:57'),
(323, 5, 15, '2018-09-18 11:26:57', '2018-09-18 11:26:57'),
(324, 5, 16, '2018-09-18 11:26:57', '2018-09-18 11:26:57'),
(325, 23, 6, '2018-09-18 11:29:51', '2018-09-18 11:29:51'),
(326, 23, 8, '2018-09-18 11:29:51', '2018-09-18 11:29:51'),
(327, 23, 10, '2018-09-18 11:29:51', '2018-09-18 11:29:51'),
(328, 23, 19, '2018-09-18 11:29:51', '2018-09-18 11:29:51'),
(329, 24, 10, '2018-09-18 11:34:35', '2018-09-18 11:34:35'),
(330, 24, 11, '2018-09-18 11:34:35', '2018-09-18 11:34:35'),
(331, 24, 15, '2018-09-18 11:34:35', '2018-09-18 11:34:35'),
(332, 24, 16, '2018-09-18 11:34:35', '2018-09-18 11:34:35'),
(340, 26, 1, '2018-09-18 11:47:13', '2018-09-18 11:47:13'),
(341, 26, 2, '2018-09-18 11:47:13', '2018-09-18 11:47:13'),
(342, 26, 6, '2018-09-18 11:47:13', '2018-09-18 11:47:13'),
(343, 26, 8, '2018-09-18 11:47:13', '2018-09-18 11:47:13'),
(347, 27, 5, '2018-09-18 11:51:39', '2018-09-18 11:51:39'),
(348, 27, 7, '2018-09-18 11:51:39', '2018-09-18 11:51:39'),
(349, 27, 12, '2018-09-18 11:51:39', '2018-09-18 11:51:39'),
(350, 28, 4, '2018-09-18 11:54:18', '2018-09-18 11:54:18'),
(351, 28, 6, '2018-09-18 11:54:18', '2018-09-18 11:54:18'),
(352, 28, 8, '2018-09-18 11:54:18', '2018-09-18 11:54:18'),
(353, 28, 12, '2018-09-18 11:54:18', '2018-09-18 11:54:18'),
(354, 2, 6, '2020-04-05 10:55:33', '2020-04-05 10:55:33'),
(355, 2, 8, '2020-04-05 10:55:33', '2020-04-05 10:55:33'),
(356, 2, 10, '2020-04-05 10:55:33', '2020-04-05 10:55:33'),
(365, 29, 5, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(366, 29, 6, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(367, 29, 8, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(368, 29, 9, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(369, 29, 10, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(370, 29, 11, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(371, 29, 15, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(372, 29, 16, '2020-04-17 10:09:35', '2020-04-17 10:09:35'),
(375, 32, 80, '2020-05-19 00:43:10', '2020-05-19 00:43:10'),
(376, 32, 83, '2020-05-19 00:43:10', '2020-05-19 00:43:10'),
(377, 32, 84, '2020-05-19 00:43:10', '2020-05-19 00:43:10'),
(378, 33, 81, '2020-05-19 01:04:35', '2020-05-19 01:04:35'),
(379, 33, 83, '2020-05-19 01:04:35', '2020-05-19 01:04:35'),
(382, 35, 80, '2020-06-10 18:05:54', '2020-06-10 18:05:54'),
(383, 35, 83, '2020-06-10 18:05:55', '2020-06-10 18:05:55'),
(384, 35, 84, '2020-06-10 18:05:55', '2020-06-10 18:05:55'),
(385, 36, 80, '2020-06-10 20:11:54', '2020-06-10 20:11:54'),
(386, 36, 82, '2020-06-10 20:11:54', '2020-06-10 20:11:54'),
(387, 37, 80, '2020-06-10 20:17:26', '2020-06-10 20:17:26'),
(388, 37, 84, '2020-06-10 20:17:26', '2020-06-10 20:17:26'),
(389, 38, 81, '2020-06-13 15:14:27', '2020-06-13 15:14:27'),
(390, 38, 82, '2020-06-13 15:14:27', '2020-06-13 15:14:27'),
(391, 39, 81, '2020-06-13 19:48:51', '2020-06-13 19:48:51'),
(392, 39, 82, '2020-06-13 19:48:51', '2020-06-13 19:48:51');

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

DROP TABLE IF EXISTS `marital_statuses`;
CREATE TABLE IF NOT EXISTS `marital_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marital_status_id` int(11) DEFAULT '0',
  `marital_status` varchar(40) NOT NULL,
  `is_default` int(1) DEFAULT '0',
  `is_active` int(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '9999',
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`, `marital_status_id`, `marital_status`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Married', 1, 1, 1, 'en', '2020-05-12 09:12:18', NULL),
(2, 2, 'Unmarried', 0, 1, 2, 'en', '2020-05-12 09:12:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_26_195605_create_categories_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ownership_types`
--

DROP TABLE IF EXISTS `ownership_types`;
CREATE TABLE IF NOT EXISTS `ownership_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ownership_type_id` int(11) DEFAULT '0',
  `ownership_type` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ownership_types`
--

INSERT INTO `ownership_types` (`id`, `ownership_type_id`, `ownership_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sole Proprietorship', 1, 1, 3, 'en', '2020-04-11 03:25:21', NULL),
(2, 2, 'Public', 1, 1, 1, 'en', '2020-04-11 03:26:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

DROP TABLE IF EXISTS `packages`;
CREATE TABLE IF NOT EXISTS `packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `package_title` varchar(150) DEFAULT NULL,
  `package_price` float(7,2) DEFAULT '0.00',
  `package_num_days` int(11) DEFAULT '0',
  `package_num_listings` int(11) DEFAULT '0',
  `package_for` enum('job_seeker','employer') DEFAULT 'job_seeker',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_title`, `package_price`, `package_num_days`, `package_num_listings`, `package_for`, `created_at`, `updated_at`) VALUES
(3, 'Basic', 9.99, 30, 10, 'employer', '2020-04-20 05:18:59', NULL),
(4, 'Premium', 19.99, 90, 30, 'employer', '2020-04-20 05:19:32', NULL),
(5, 'Gold', 299.00, 60, 50, 'employer', '2020-04-20 10:35:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('mail.sonygrg@gmail.com', '$2y$10$wEG/eH01fBeSR4ZIbj.QIe6PNXS6i7JhoMCGeqXIp8oMpxiU0IT7a', '2020-06-02 14:10:29');

-- --------------------------------------------------------

--
-- Table structure for table `profile_cvs`
--

DROP TABLE IF EXISTS `profile_cvs`;
CREATE TABLE IF NOT EXISTS `profile_cvs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `cv_file` varchar(120) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_cvs`
--

INSERT INTO `profile_cvs` (`id`, `user_id`, `title`, `cv_file`, `is_default`, `created_at`, `updated_at`) VALUES
(4, 4, 'Jawad CV -1', 'jawad-cv-1-1533894081-29.doc', 0, '2018-08-10 04:41:21', '2018-09-01 01:11:26'),
(5, 5, 'my cv', 'my-cv-1536901935-235.pdf', 0, '2018-09-14 10:12:15', '2018-09-18 15:30:13'),
(10, 13, 'Game Of Thrones Season 8 Episode 1', 'game-of-thrones-season-8-episode-1-1586617041-414.docx', 0, '2020-04-11 09:57:21', '2020-05-12 00:44:30'),
(11, 15, 'MY CV', 'my-cv-1586720402-967.pdf', 0, '2020-04-12 14:40:02', '2020-04-12 14:40:02'),
(12, 9, 'my cv', 'my-cv-1589280270-701.docx', 1, '2020-05-12 00:44:30', '2020-05-12 00:44:30');

-- --------------------------------------------------------

--
-- Table structure for table `profile_educations`
--

DROP TABLE IF EXISTS `profile_educations`;
CREATE TABLE IF NOT EXISTS `profile_educations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `degree_level_id` int(11) DEFAULT NULL,
  `degree_type_id` int(11) DEFAULT NULL,
  `degree_title` varchar(150) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `date_completion` varchar(15) DEFAULT NULL,
  `institution` varchar(150) DEFAULT NULL,
  `degree_result` varchar(20) DEFAULT NULL,
  `result_type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_educations`
--

INSERT INTO `profile_educations` (`id`, `user_id`, `degree_level_id`, `degree_type_id`, `degree_title`, `country_id`, `state_id`, `city_id`, `date_completion`, `institution`, `degree_result`, `result_type_id`, `created_at`, `updated_at`) VALUES
(6, 4, 5, 110, 'MCS', 166, 2728, 31351, '2009', 'VU', '65', 3, '2018-08-10 04:44:41', '2018-08-10 04:44:41'),
(9, 9, 1, 133, 'Computer Engineering', 1, 1, 1, '2017', 'ABC College', '3.5', 1, '2020-05-12 00:51:32', '2020-05-12 00:51:32');

-- --------------------------------------------------------

--
-- Table structure for table `profile_education_major_subjects`
--

DROP TABLE IF EXISTS `profile_education_major_subjects`;
CREATE TABLE IF NOT EXISTS `profile_education_major_subjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_education_id` int(11) DEFAULT NULL,
  `major_subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_education_major_subjects`
--

INSERT INTO `profile_education_major_subjects` (`id`, `profile_education_id`, `major_subject_id`, `created_at`, `updated_at`) VALUES
(15, 6, 7, '2018-08-10 04:44:41', '2018-08-10 04:44:41'),
(16, 6, 123, '2018-08-10 04:44:41', '2018-08-10 04:44:41'),
(20, 9, 2, '2020-05-12 00:51:33', '2020-05-12 00:51:33');

-- --------------------------------------------------------

--
-- Table structure for table `profile_experiences`
--

DROP TABLE IF EXISTS `profile_experiences`;
CREATE TABLE IF NOT EXISTS `profile_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date_end` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_currently_working` tinyint(1) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_experiences`
--

INSERT INTO `profile_experiences` (`id`, `user_id`, `title`, `company`, `country_id`, `state_id`, `city_id`, `date_start`, `date_end`, `is_currently_working`, `description`, `created_at`, `updated_at`) VALUES
(9, 9, 'Junior developer', 'ABC COmpany', 1, 1, 1, '2020-03-01 13:00:00', NULL, 1, 'I worked in ABC Company', '2020-05-12 00:46:24', '2020-05-12 00:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `profile_languages`
--

DROP TABLE IF EXISTS `profile_languages`;
CREATE TABLE IF NOT EXISTS `profile_languages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `language_level_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_languages`
--

INSERT INTO `profile_languages` (`id`, `user_id`, `language_id`, `language_level_id`, `created_at`, `updated_at`) VALUES
(18, 9, 1, 2, '2020-05-12 01:04:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `profile_projects`
--

DROP TABLE IF EXISTS `profile_projects`;
CREATE TABLE IF NOT EXISTS `profile_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(120) DEFAULT NULL,
  `description` text,
  `url` tinytext,
  `date_start` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `date_end` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_on_going` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_projects`
--

INSERT INTO `profile_projects` (`id`, `user_id`, `name`, `image`, `description`, `url`, `date_start`, `date_end`, `is_on_going`, `created_at`, `updated_at`) VALUES
(5, 4, 'Job Portal', 'job-portal-ju9qr-19.jpg', 'testing', 'http://www.aquasureuae.com/about_us.php', '2018-08-10 09:42:17', '2018-08-10 09:42:17', 0, '2018-08-10 04:42:17', '2018-08-10 04:42:17'),
(13, 15, 'TEST', 'test-cueni-288.jpg', 'dfdfd', 'TEST', '2020-04-12 19:40:32', '2020-04-12 19:40:32', 0, '2020-04-12 14:40:32', '2020-04-12 14:40:32');

-- --------------------------------------------------------

--
-- Table structure for table `profile_skills`
--

DROP TABLE IF EXISTS `profile_skills`;
CREATE TABLE IF NOT EXISTS `profile_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `job_skill_id` int(11) DEFAULT NULL,
  `job_experience_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_skills`
--

INSERT INTO `profile_skills` (`id`, `user_id`, `job_skill_id`, `job_experience_id`, `created_at`, `updated_at`) VALUES
(9, 4, 16, 8, '2018-08-10 04:44:57', '2018-08-10 04:44:57'),
(11, 5, 1, 8, '2018-08-29 09:13:38', '2018-08-29 09:13:38'),
(12, 5, 2, 9, '2018-08-29 09:13:53', '2018-08-29 09:13:53'),
(13, 5, 9, 5, '2018-08-29 11:37:24', '2018-08-29 11:37:24'),
(24, 15, 2, 11, '2020-04-12 14:41:43', '2020-04-12 14:41:43');

-- --------------------------------------------------------

--
-- Table structure for table `profile_summaries`
--

DROP TABLE IF EXISTS `profile_summaries`;
CREATE TABLE IF NOT EXISTS `profile_summaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `summary` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_summaries`
--

INSERT INTO `profile_summaries` (`id`, `user_id`, `summary`, `created_at`, `updated_at`) VALUES
(17, 4, 'yahoo', '2018-08-10 04:57:22', '2018-08-10 04:57:22'),
(25, 5, 'gfhdfLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis nibh feugiat, suscipit enim quis, aliquam eros. Nam congue odio sit amet pellentesque ultrices. Morbi et felis vel lacus vestibulum euismod eu sit amet velit. Proin rhoncus auctor vehicula. Duis quis elit sapien. Cras convallis risus eu justo posuere varius. Cras a imperdiet nisi. Quisque urna enim, posuere ut pretium imperdiet, rhoncus quis ipsum. Ut nec congue dolor. Curabitur eu purus ut leo ultrices iaculis. Quisque ac finibus velit, quis malesuada ex. Mauris lobortis condimentum urna, nec convallis tortor scelerisque porttitor. Ut consequat hendrerit nibh, vitae molestie quam tempus a. Maecenas eget malesuada tortor. Quisque lacinia, mauris ut placerat porttitor, orci erat interdum dolor, et porta mi ipsum sed mi.', '2018-08-29 09:15:48', '2018-08-29 09:15:48'),
(28, 13, 'sdsdsdsd', '2020-04-11 09:56:28', '2020-04-11 09:56:28'),
(29, 15, 'sddsfdfdfd', '2020-04-12 14:39:45', '2020-04-12 14:39:45');

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs`
--

DROP TABLE IF EXISTS `queue_jobs`;
CREATE TABLE IF NOT EXISTS `queue_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_abuse_company_messages`
--

DROP TABLE IF EXISTS `report_abuse_company_messages`;
CREATE TABLE IF NOT EXISTS `report_abuse_company_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `your_name` varchar(100) DEFAULT NULL,
  `your_email` varchar(100) DEFAULT NULL,
  `company_url` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `report_abuse_messages`
--

DROP TABLE IF EXISTS `report_abuse_messages`;
CREATE TABLE IF NOT EXISTS `report_abuse_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `your_name` varchar(100) DEFAULT NULL,
  `your_email` varchar(100) DEFAULT NULL,
  `job_url` mediumtext,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `report_abuse_messages`
--

INSERT INTO `report_abuse_messages` (`id`, `your_name`, `your_email`, `job_url`, `created_at`, `updated_at`) VALUES
(1, 'sony gurung', 'mail.sonygrg@gmail.com', 'http://localhost/careers/public/job/project-engineer-post-graduate-33', '2020-05-25 20:37:39', '2020-05-25 20:37:39');

-- --------------------------------------------------------

--
-- Table structure for table `result_types`
--

DROP TABLE IF EXISTS `result_types`;
CREATE TABLE IF NOT EXISTS `result_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `result_type_id` int(11) DEFAULT '0',
  `result_type` varchar(40) NOT NULL,
  `is_default` int(1) DEFAULT '0',
  `is_active` int(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '9999',
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `result_types`
--

INSERT INTO `result_types` (`id`, `result_type_id`, `result_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'GPA', 1, 1, 1, 'en', '2018-07-02 04:10:45', '2018-07-02 04:10:45'),
(2, 2, 'Grade', 1, 1, 2, 'en', '2018-07-02 04:11:05', '2018-07-02 04:11:05'),
(3, 3, 'Percentage', 1, 1, 3, 'en', '2018-07-02 04:11:22', '2018-07-02 04:11:22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_abbreviation` varchar(30) NOT NULL,
  `role_description` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_abbreviation`, `role_description`) VALUES
(1, 'Super Admin', 'SUP_ADM', 'Super Admin'),
(2, 'Sub Admin', 'SUB_ADM', 'Sub Admin');

-- --------------------------------------------------------

--
-- Table structure for table `salary_periods`
--

DROP TABLE IF EXISTS `salary_periods`;
CREATE TABLE IF NOT EXISTS `salary_periods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salary_period_id` int(11) DEFAULT '0',
  `salary_period` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `salary_periods`
--

INSERT INTO `salary_periods` (`id`, `salary_period_id`, `salary_period`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monthly', 1, 1, 2, 'en', '2018-08-15 09:55:46', '2018-08-15 05:08:45'),
(2, 2, 'Yearly', 1, 1, 3, 'en', '2018-08-15 09:56:23', '2018-08-15 05:08:45'),
(3, 3, 'Weekly', 1, 1, 1, 'en', '2018-08-15 05:08:09', '2018-08-15 05:08:45'),
(4, 4, 'daily', 1, 1, 4, 'EN', '2020-06-10 18:01:14', '2020-06-10 18:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `send_to_friend_messages`
--

DROP TABLE IF EXISTS `send_to_friend_messages`;
CREATE TABLE IF NOT EXISTS `send_to_friend_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `your_name` varchar(100) DEFAULT NULL,
  `your_email` varchar(100) DEFAULT NULL,
  `job_url` mediumtext,
  `friend_name` varchar(100) DEFAULT NULL,
  `friend_email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `send_to_friend_messages`
--

INSERT INTO `send_to_friend_messages` (`id`, `your_name`, `your_email`, `job_url`, `friend_name`, `friend_email`, `created_at`, `updated_at`) VALUES
(1, 'sony', 'mail.sonygrg@gmail.com', 'http://localhost/careers/public/job/project-engineer-post-graduate-33', 'new', 'puccagrg@gmail.com', '2020-06-13 18:10:26', '2020-06-13 18:10:26');

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

DROP TABLE IF EXISTS `seo`;
CREATE TABLE IF NOT EXISTS `seo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_title` text,
  `seo_title` text,
  `seo_description` text,
  `seo_keywords` text,
  `seo_other` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `page_title`, `seo_title`, `seo_description`, `seo_keywords`, `seo_other`, `created_at`, `updated_at`) VALUES
(1, 'front_index_page', 'Jobs In Australia', 'Find best Jobs in Australia, jobs listings and job opportunities on CAREERS. Browse more than 100K jobs in Australia and apply for free! CAREERS is Australia\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Australia, Jobs Australia, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work,', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />\r\n<meta name=\"author\" content=\"CAREERS\" />', '2018-08-25 10:01:47', '2020-04-12 01:19:51'),
(2, 'email_to_friend', 'Jobs In Australia', 'Find best Jobs in Australia, jobs listings and job opportunities on CAREERS. Browse more than 100K jobs in Australia and apply for free! CAREERS is Australia\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Australia, Jobs Australia, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work,', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 10:03:08', '2020-04-12 01:22:55'),
(3, 'report_abuse', 'Jobs In Australia', 'Find best Jobs in Australia, jobs listings and job opportunities on CAREERS. Browse more than 100K jobs in Australia and apply for free! CAREERS is Australia\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Australia, Jobs Australia, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work,', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 10:03:26', '2020-04-12 01:22:18'),
(4, 'faq', 'Jobs In Australia', 'Find best Jobs in Australia, jobs listings and job opportunities on CAREERS. Browse more than 100K jobs in Australia and apply for free! CAREERS is Australia\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Australia, Jobs Australia, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 10:03:41', '2020-04-12 01:21:33'),
(5, 'contact', 'Jobs In Australia', 'Find best Jobs in Australia, jobs listings and job opportunities on CAREERS. Browse more than 100K jobs in Australia and apply for free! CAREERS is Australia\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Australia, Jobs Australia, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity, Resume, Work,', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 10:03:50', '2020-05-23 04:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(100) DEFAULT NULL,
  `site_slogan` varchar(150) DEFAULT NULL,
  `site_logo` varchar(100) DEFAULT NULL,
  `site_phone_primary` varchar(20) DEFAULT NULL,
  `site_phone_secondary` varchar(20) DEFAULT NULL,
  `default_country_id` int(11) DEFAULT NULL,
  `default_currency_code` varchar(4) DEFAULT NULL,
  `site_street_address` varchar(250) DEFAULT NULL,
  `site_google_map` mediumtext,
  `mail_driver` enum('array','log','sparkpost','ses','mandrill','mailgun','sendmail','smtp','mail') DEFAULT 'smtp',
  `mail_host` varchar(100) DEFAULT NULL,
  `mail_port` int(5) DEFAULT NULL,
  `mail_from_address` varchar(100) DEFAULT NULL,
  `mail_from_name` varchar(100) DEFAULT NULL,
  `mail_to_address` varchar(100) DEFAULT NULL,
  `mail_to_name` varchar(100) DEFAULT NULL,
  `mail_encryption` varchar(10) DEFAULT NULL,
  `mail_username` varchar(100) DEFAULT NULL,
  `mail_password` varchar(100) DEFAULT NULL,
  `mail_sendmail` varchar(50) DEFAULT NULL,
  `mail_pretend` varchar(50) DEFAULT NULL,
  `mailgun_domain` varchar(100) DEFAULT NULL,
  `mailgun_secret` varchar(100) DEFAULT NULL,
  `mandrill_secret` varchar(100) DEFAULT NULL,
  `sparkpost_secret` varchar(100) DEFAULT NULL,
  `ses_key` varchar(100) DEFAULT NULL,
  `ses_secret` varchar(100) DEFAULT NULL,
  `ses_region` varchar(100) DEFAULT NULL,
  `facebook_address` text,
  `twitter_address` text,
  `google_plus_address` text,
  `youtube_address` text,
  `instagram_address` text,
  `pinterest_address` text,
  `linkedin_address` text,
  `tumblr_address` text,
  `flickr_address` text,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `index_page_below_top_employes_ad` mediumtext,
  `above_footer_ad` mediumtext,
  `dashboard_page_ad` mediumtext,
  `cms_page_ad` mediumtext,
  `listing_page_vertical_ad` mediumtext,
  `listing_page_horizontal_ad` mediumtext,
  `nocaptcha_sitekey` varchar(150) DEFAULT NULL,
  `nocaptcha_secret` varchar(150) DEFAULT NULL,
  `facebook_app_id` varchar(150) DEFAULT NULL,
  `facebeek_app_secret` varchar(150) DEFAULT NULL,
  `google_app_id` varchar(150) DEFAULT NULL,
  `google_app_secret` varchar(150) DEFAULT NULL,
  `twitter_app_id` varchar(150) DEFAULT NULL,
  `twitter_app_secret` varchar(150) DEFAULT NULL,
  `paypal_account` varchar(250) DEFAULT NULL,
  `paypal_client_id` varchar(250) DEFAULT NULL,
  `paypal_secret` varchar(250) DEFAULT NULL,
  `paypal_live_sandbox` enum('live','sandbox') DEFAULT 'sandbox',
  `stripe_key` varchar(250) DEFAULT NULL,
  `stripe_secret` varchar(250) DEFAULT NULL,
  `is_stripe_active` tinyint(1) DEFAULT '1',
  `bank_details` mediumtext,
  `listing_age` int(3) NOT NULL DEFAULT '15',
  `country_specific_site` tinyint(1) DEFAULT '0',
  `is_paypal_active` tinyint(1) DEFAULT '1',
  `is_bank_transfer_active` tinyint(1) DEFAULT '1',
  `is_jobseeker_package_active` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1273 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `site_slogan`, `site_logo`, `site_phone_primary`, `site_phone_secondary`, `default_country_id`, `default_currency_code`, `site_street_address`, `site_google_map`, `mail_driver`, `mail_host`, `mail_port`, `mail_from_address`, `mail_from_name`, `mail_to_address`, `mail_to_name`, `mail_encryption`, `mail_username`, `mail_password`, `mail_sendmail`, `mail_pretend`, `mailgun_domain`, `mailgun_secret`, `mandrill_secret`, `sparkpost_secret`, `ses_key`, `ses_secret`, `ses_region`, `facebook_address`, `twitter_address`, `google_plus_address`, `youtube_address`, `instagram_address`, `pinterest_address`, `linkedin_address`, `tumblr_address`, `flickr_address`, `created_at`, `updated_at`, `index_page_below_top_employes_ad`, `above_footer_ad`, `dashboard_page_ad`, `cms_page_ad`, `listing_page_vertical_ad`, `listing_page_horizontal_ad`, `nocaptcha_sitekey`, `nocaptcha_secret`, `facebook_app_id`, `facebeek_app_secret`, `google_app_id`, `google_app_secret`, `twitter_app_id`, `twitter_app_secret`, `paypal_account`, `paypal_client_id`, `paypal_secret`, `paypal_live_sandbox`, `stripe_key`, `stripe_secret`, `is_stripe_active`, `bank_details`, `listing_age`, `country_specific_site`, `is_paypal_active`, `is_bank_transfer_active`, `is_jobseeker_package_active`) VALUES
(1272, 'Careers', 'We Care About Your Career', 'careers-1586086035-616.png', '1800 111 222', '1800 111 333', 1, 'AUD', '399 Lonsdale Street, \r\nMelbourne VIC', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3152.0201656259533!2d144.9584785149249!3d-37.812996641771804!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d4ac82f2205%3A0xded043b2b7fbf1b8!2sATMC!5e0!3m2!1sen!2sau!4v1588117900740!5m2!1sen!2sau\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>', 'smtp', 'smtp.gmail.com', 587, 'support@careers.com', 'CAREERS', 'careers.jobs.portal@gmail.com', 'CAREERS', 'tls', 'careers.jobs.portal@gmail.com', 'asdf@12345', '/usr/sbin/sendmail -bs', 'true', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.facebook.com/', 'https://www.twitter.com', 'https://plus.google.com/', 'https://www.youtube.com', 'https://www.instagram.com/', 'https://www.pinterest.com/', 'https://linkedin.com/', 'https://www.tumblr.com/', 'https://www.flickr.com/', '2017-09-23 22:27:10', '2020-06-09 01:29:27', NULL, NULL, NULL, NULL, NULL, NULL, '6Les2eYUAAAAALsXuAfWyDX-srBa9xlSP3IyIQYH', '6Les2eYUAAAAAPFSH_xjuHnFq9a8-yHrzZu1oT22', NULL, NULL, '516910969272-97eoca09urgqr251voafh5nl963matt0.apps.googleusercontent.com', 'iye5IGqPpe9wJD2ItVeR7NF_', NULL, NULL, 'jagpreetsinghraina@gmail.com', 'AQwixqlVb8XDob1ibBrw7Dai6_rY2g3595GI-Tgkjm3L1i-WvzWho0X8kbTi1aijWEGMYaTQzWtKKtCx', 'ECiNw8r9IODbTDhSwFYvg-C637VE8UhwlAFwUnxOlCOMtHygZnbUiWdJmWTc03kvcbUHYEIrPoW8pD-t', 'sandbox', NULL, NULL, NULL, '<h5>Bank Details</h5>\r\n<br />\r\n<p>Lorem ipsum dolor sit amet,<br /><br />consectetur adipiscing elit.</p>\r\n<br />\r\n<p><strong>Account Number:</strong> 123456789130</p>\r\n<br />\r\n<p><strong>Branch Code:</strong> 123456789130</p>\r\n<br />\r\n<p><strong>Bank Name:</strong> Bank of America</p>\r\n<br />\r\n<p><strong>Bank Address:</strong> New York</p>', 15, 1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
CREATE TABLE IF NOT EXISTS `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state_id` int(11) DEFAULT '0',
  `state` varchar(40) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '1',
  `is_default` int(1) DEFAULT '0',
  `is_active` int(1) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '9999',
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4132 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_id`, `state`, `country_id`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'VIC', 1, 1, 1, 1, 'en', '2020-05-01 06:58:43', '2020-05-01 07:04:59'),
(4122, 4122, 'punjab', 985, 1, 1, 4122, 'EN', '2020-06-10 17:17:08', '2020-06-10 17:17:08'),
(4123, 4123, 'rajasthan', 985, 1, 1, 4123, 'EN', '2020-06-10 17:17:55', '2020-06-10 17:18:09'),
(4125, 4125, 'tamil nadu', 985, 1, 1, 4125, 'EN', '2020-06-10 17:19:16', '2020-06-10 17:19:16'),
(4127, 4127, 'bihar', 985, 1, 1, 4127, 'EN', '2020-06-10 17:20:32', '2020-06-10 17:20:32'),
(4128, 4128, 'tasmania', 1, 1, 1, 4128, 'EN', '2020-06-10 17:21:21', '2020-06-10 17:21:21'),
(4129, 4129, 'new south wales', 1, 1, 1, 4129, 'EN', '2020-06-10 17:21:50', '2020-06-10 17:21:50'),
(4130, 4130, 'queensland', 1, 1, 1, 4130, 'EN', '2020-06-10 17:22:21', '2020-06-10 17:22:21');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
CREATE TABLE IF NOT EXISTS `testimonials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `testimonial_id` int(11) DEFAULT '0',
  `testimonial_by` varchar(100) DEFAULT NULL,
  `testimonial` varchar(600) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `testimonial_id`, `testimonial_by`, `testimonial`, `company`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(4, 4, 'Sony Gurung', 'Carrers has helped me find a job easily than what I had gone through in the past experience.', 'Mayan, Employee', 1, 1, 4, 'EN', '2020-06-13 14:57:56', '2020-06-13 14:57:56');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender_id` int(2) DEFAULT NULL,
  `marital_status_id` int(2) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `national_id_card_number` varchar(100) DEFAULT NULL,
  `country_id` varchar(50) DEFAULT NULL,
  `state_id` varchar(50) DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile_num` varchar(25) DEFAULT NULL,
  `job_experience_id` int(2) DEFAULT NULL,
  `career_level_id` int(2) DEFAULT NULL,
  `industry_id` int(2) DEFAULT NULL,
  `functional_area_id` int(2) DEFAULT NULL,
  `current_salary` varchar(100) DEFAULT NULL,
  `expected_salary` varchar(100) DEFAULT NULL,
  `salary_currency` varchar(10) DEFAULT NULL,
  `street_address` tinytext,
  `is_active` int(1) DEFAULT '0',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `verification_token` varchar(255) DEFAULT NULL,
  `provider` varchar(35) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_immediate_available` tinyint(1) DEFAULT '1',
  `num_profile_views` int(11) DEFAULT '0',
  `package_id` int(11) DEFAULT '0',
  `package_start_date` timestamp NULL DEFAULT NULL,
  `package_end_date` timestamp NULL DEFAULT NULL,
  `jobs_quota` int(5) DEFAULT '0',
  `availed_jobs_quota` int(5) DEFAULT '0',
  `search` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `name`, `email`, `father_name`, `date_of_birth`, `gender_id`, `marital_status_id`, `nationality_id`, `national_id_card_number`, `country_id`, `state_id`, `city_id`, `phone`, `mobile_num`, `job_experience_id`, `career_level_id`, `industry_id`, `functional_area_id`, `current_salary`, `expected_salary`, `salary_currency`, `street_address`, `is_active`, `verified`, `verification_token`, `provider`, `provider_id`, `password`, `remember_token`, `image`, `lang`, `created_at`, `updated_at`, `is_immediate_available`, `num_profile_views`, `package_id`, `package_start_date`, `package_end_date`, `jobs_quota`, `availed_jobs_quota`, `search`) VALUES
(9, 'sony', NULL, 'gurung', 'sony gurung', 'mail.sonygrg@gmail.com', NULL, '1990-01-02', 1, 2, 1, '98989898', '1', '1', '1', '1234567', '987987987', 1, 1, 1, 1, '5000', '7000', 'AUD', '1 abc street', 1, 1, NULL, NULL, NULL, '$2y$10$KTHtyq7DWuGdoRWfhmfRee.PakYgg7BJNEHkPpInDD1mv1Ff7FAA6', 'u60EB7IZbAzAzQ60GJhdRt5uPAipMLoZPObgZdqGDFiYB5NuL4UUcwNPHmVq', NULL, NULL, '2020-04-30 16:34:16', '2020-06-09 01:32:27', 1, 13, 0, NULL, NULL, 0, 0, 'sony gurung Australia VIC Melbourne  1990-01-02 1234567 987987987 Female Less than 1 year 5000 - 7000 Student Information Technology Programming 1 abc street '),
(19, 'John', NULL, 'Smith', 'John Smith', 'puccagrg@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL, NULL, NULL, '$2y$10$QJMbmwwTTlTP6bN3Ba1jfOBIouAER7PWx1fIOjnp6oeT9uaKe8QD2', 'yuvvwI50ZNu1rOLsLJHZXF87FNyUccIrnRMcaQNVwZebp9gDv7t6sD6aF5Tg', NULL, NULL, '2020-05-26 01:41:14', '2020-05-26 01:41:26', 1, 0, 0, NULL, NULL, 0, 0, NULL),
(20, 'test', NULL, 'candidate', 'test candidate', 'test@gmail.com', 'test', '2007-12-31', 1, 1, 1, '121212', '1', '1', '1', '123456', '121212', 1, 2, 1, 588, '30000', '50000', 'AUD', '1/1 abc street', 1, 1, NULL, NULL, NULL, '$2y$10$zGCamVx7i3a/cDisauh2qO2gWLO0aWT/Tg4dh/0Y/eScBH.fwS..a', 'xNC5Yayv3T5xl7oGVt5h2MUV0XUuopVKXQC8KAD8aztzJBg85qoFz0G27xxC', NULL, NULL, '2020-05-26 01:52:24', '2020-06-03 16:10:26', 1, 1, 0, NULL, NULL, 0, 0, 'test candidate Australia VIC Melbourne test 2007-12-31 123456 121212 Female Less than 1 year 30000 - 50000 Entry Level Information Technology Engineering 1/1 abc street '),
(21, 'John', NULL, 'Smith', 'John Smith', 'candidate@career.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, NULL, NULL, '$2y$10$Ccs04b/W3WJVtLBbjA0pPOKtt44UQLlT6cWWRM30iGLn/SbfHkGxy', 'ERadXeZ6ILqRSohxaxqwX1h8o1StEgsqNI7TQzmqveOpU5wwZ3urZ1cjEJJL', NULL, NULL, '2020-06-17 23:26:12', '2020-06-17 23:26:20', 1, 0, 0, NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

DROP TABLE IF EXISTS `user_messages`;
CREATE TABLE IF NOT EXISTS `user_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) DEFAULT NULL,
  `listing_title` varchar(150) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_email` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `from_phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext,
  `subject` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
CREATE TABLE IF NOT EXISTS `videos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `video_id` int(11) DEFAULT '0',
  `video_title` tinytext,
  `video_text` text,
  `video_link` text,
  `is_default` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(5) DEFAULT '99999',
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_id`, `video_title`, `video_text`, `video_link`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Turn a challenge into a chance', 'Our partners make Milestone products more dynamic and integrations push the limits of what is possible.', 'https://www.youtube.com/watch?v=AWAjhMoVgYA', 1, 1, 1, 'en', '2018-09-11 01:41:33', '2020-04-08 14:08:47');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users` ADD FULLTEXT KEY `full_search` (`search`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
