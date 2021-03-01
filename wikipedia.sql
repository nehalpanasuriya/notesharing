-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 01, 2021 at 01:00 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wikipedia`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
CREATE TABLE IF NOT EXISTS `account_emailaddress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
CREATE TABLE IF NOT EXISTS `account_emailconfirmation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) NOT NULL,
  `email_address_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirmation_email_address_id_5b7f8c58` (`email_address_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add site', 7, 'add_site'),
(26, 'Can change site', 7, 'change_site'),
(27, 'Can delete site', 7, 'delete_site'),
(28, 'Can view site', 7, 'view_site'),
(29, 'Can add regi', 8, 'add_regi'),
(30, 'Can change regi', 8, 'change_regi'),
(31, 'Can delete regi', 8, 'delete_regi'),
(32, 'Can view regi', 8, 'view_regi'),
(33, 'Can add upload', 9, 'add_upload'),
(34, 'Can change upload', 9, 'change_upload'),
(35, 'Can delete upload', 9, 'delete_upload'),
(36, 'Can view upload', 9, 'view_upload'),
(37, 'Can add feedback', 10, 'add_feedback'),
(38, 'Can change feedback', 10, 'change_feedback'),
(39, 'Can delete feedback', 10, 'delete_feedback'),
(40, 'Can view feedback', 10, 'view_feedback'),
(41, 'Can add email address', 11, 'add_emailaddress'),
(42, 'Can change email address', 11, 'change_emailaddress'),
(43, 'Can delete email address', 11, 'delete_emailaddress'),
(44, 'Can view email address', 11, 'view_emailaddress'),
(45, 'Can add email confirmation', 12, 'add_emailconfirmation'),
(46, 'Can change email confirmation', 12, 'change_emailconfirmation'),
(47, 'Can delete email confirmation', 12, 'delete_emailconfirmation'),
(48, 'Can view email confirmation', 12, 'view_emailconfirmation'),
(49, 'Can add social account', 13, 'add_socialaccount'),
(50, 'Can change social account', 13, 'change_socialaccount'),
(51, 'Can delete social account', 13, 'delete_socialaccount'),
(52, 'Can view social account', 13, 'view_socialaccount'),
(53, 'Can add social application', 14, 'add_socialapp'),
(54, 'Can change social application', 14, 'change_socialapp'),
(55, 'Can delete social application', 14, 'delete_socialapp'),
(56, 'Can view social application', 14, 'view_socialapp'),
(57, 'Can add social application token', 15, 'add_socialtoken'),
(58, 'Can change social application token', 15, 'change_socialtoken'),
(59, 'Can delete social application token', 15, 'delete_socialtoken'),
(60, 'Can view social application token', 15, 'view_socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$216000$ZM2a3mGVFb6X$PZojb3UtDCBgyjGWNaHbbjbfTPq/NVF4KTa201sVxSQ=', '2021-02-28 16:05:34.494887', 1, 'admin123', '', '', 'admin@gmail.com', 1, 1, '2021-02-28 15:31:11.947605'),
(2, '!sxzzB3EbCjXjE0OButx6VwJkbrCUOnufpk815GCj', '2021-03-01 12:57:24.812454', 0, 'python', 'Python', 'Django', '', 0, 1, '2021-02-28 16:23:20.895025');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-02-28 16:06:16.236025', '1', 'fb', 1, '[{\"added\": {}}]', 14, 1),
(2, '2021-02-28 16:06:50.757628', '2', 'insta', 1, '[{\"added\": {}}]', 14, 1),
(3, '2021-02-28 16:22:57.379026', '3', 'google', 1, '[{\"added\": {}}]', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'sites', 'site'),
(8, 'wikipedia', 'regi'),
(9, 'wikipedia', 'upload'),
(10, 'wikipedia', 'feedback'),
(11, 'account', 'emailaddress'),
(12, 'account', 'emailconfirmation'),
(13, 'socialaccount', 'socialaccount'),
(14, 'socialaccount', 'socialapp'),
(15, 'socialaccount', 'socialtoken');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-02-28 15:13:43.544837'),
(2, 'auth', '0001_initial', '2021-02-28 15:13:43.784087'),
(3, 'account', '0001_initial', '2021-02-28 15:13:44.483288'),
(4, 'account', '0002_email_max_length', '2021-02-28 15:13:44.663944'),
(5, 'admin', '0001_initial', '2021-02-28 15:13:44.729376'),
(6, 'admin', '0002_logentry_remove_auto_add', '2021-02-28 15:13:44.887574'),
(7, 'admin', '0003_logentry_add_action_flag_choices', '2021-02-28 15:13:44.902223'),
(8, 'contenttypes', '0002_remove_content_type_name', '2021-02-28 15:13:45.018429'),
(9, 'auth', '0002_alter_permission_name_max_length', '2021-02-28 15:13:45.064326'),
(10, 'auth', '0003_alter_user_email_max_length', '2021-02-28 15:13:45.127799'),
(11, 'auth', '0004_alter_user_username_opts', '2021-02-28 15:13:45.145380'),
(12, 'auth', '0005_alter_user_last_login_null', '2021-02-28 15:13:45.204946'),
(13, 'auth', '0006_require_contenttypes_0002', '2021-02-28 15:13:45.209829'),
(14, 'auth', '0007_alter_validators_add_error_messages', '2021-02-28 15:13:45.229361'),
(15, 'auth', '0008_alter_user_username_max_length', '2021-02-28 15:13:45.287953'),
(16, 'auth', '0009_alter_user_last_name_max_length', '2021-02-28 15:13:45.335802'),
(17, 'auth', '0010_alter_group_name_max_length', '2021-02-28 15:13:45.393419'),
(18, 'auth', '0011_update_proxy_permissions', '2021-02-28 15:13:45.416853'),
(19, 'auth', '0012_alter_user_first_name_max_length', '2021-02-28 15:13:45.467635'),
(20, 'sessions', '0001_initial', '2021-02-28 15:13:45.507673'),
(21, 'sites', '0001_initial', '2021-02-28 15:13:45.580915'),
(22, 'sites', '0002_alter_domain_unique', '2021-02-28 15:13:45.622903'),
(23, 'socialaccount', '0001_initial', '2021-02-28 15:13:45.898284'),
(24, 'socialaccount', '0002_token_max_lengths', '2021-02-28 15:13:46.400711'),
(25, 'socialaccount', '0003_extra_data_default_dict', '2021-02-28 15:13:46.428544'),
(26, 'wikipedia', '0001_initial', '2021-02-28 15:13:46.485183'),
(27, 'wikipedia', '0002_auto_20210120_1004', '2021-02-28 15:13:46.492019'),
(28, 'wikipedia', '0003_remove_registration_zipcode', '2021-02-28 15:13:46.534012'),
(29, 'wikipedia', '0004_auto_20210120_1031', '2021-02-28 15:13:46.713202'),
(30, 'wikipedia', '0005_auto_20210120_1042', '2021-02-28 15:13:46.774239'),
(31, 'wikipedia', '0006_uploaddata', '2021-02-28 15:13:46.821114'),
(32, 'wikipedia', '0007_auto_20210127_1144', '2021-02-28 15:13:46.870916'),
(33, 'wikipedia', '0008_feedback', '2021-02-28 15:13:46.917786');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('lt3xjbnbccb760ax631511yp3uurtcp5', '.eJxVjMsOgjAUBf-la9O09JHi0r3f0NwXFjUlobAi_ruQsNDtmZmzqQzrUvLaZM4jq6uy6vK7IdBL6gH4CfUxaZrqMo-oD0WftOn7xPK-ne7fQYFW9hq9IeMHcpSsQAB0zqNxgb3xHEKiBAkodtGSEXHU78BiipxiP3Qk6vMF6Zs4HQ:1lGO2g:y34c1y2eFBjqy3FgiN9q38k7-xMoyFh_v1jq7uwwNfA', '2021-03-14 15:31:34.276572'),
('du2bd3m8maozstwf5q9kux73zsnmnzr7', '.eJxljEEOwiAQRe_CumlaQCvd6UXIzDCkRKRJATfGu9s2jYlxOe_9eS8BRHNNxT55CT6ws_yAEMWYaozN19bMixiFFI2wUMu0AxvcP0OgO6dNQIwbbo9Gu28OndvrenEqgaCEOd2Or5_UBHlaO8bos3Z46dkMDo3vjdSEoDx0g_MMEr3y3J2ox0ExOYUoJXitDJEyshPvDyEXTvI:1lGOqm:M8eDo_XjvuooizrPI-EDvSn2SbGqNjcm_PVSjeqqlbs', '2021-03-14 16:23:20.971197'),
('8m57iif2zjc6mzve11hwz9f5ztbztmp4', '.eJxVjEsOwjAMRO-SNYqaDxSzoxeJbMdRI6pUIukKcXca1E2X82bmfVSO6mEuKuDW5rBVeYdOlFUnRsgvKb3AZelYI_O6lab_m6Ou-rknKS0ztryW6XidVDPWefcA-JuPdDcCYyRIBqxnQpdwGGMStJRckuHKhkYnHB2RtZi8A2YHdlDfHxKXPwk:1lGi72:HwH5AyKt0Od0bxp4F0T05MmzWm56aOAOxvv53Kw6hic', '2021-03-15 12:57:24.812454');

-- --------------------------------------------------------

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
CREATE TABLE IF NOT EXISTS `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_site`
--

INSERT INTO `django_site` (`id`, `domain`, `name`) VALUES
(1, 'example.com', 'example.com');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialaccount` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `uid` varchar(191) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialaccount`
--

INSERT INTO `socialaccount_socialaccount` (`id`, `provider`, `uid`, `last_login`, `date_joined`, `extra_data`, `user_id`) VALUES
(1, 'google', '103650828110209932628', '2021-03-01 12:57:24.781207', '2021-02-28 16:23:20.933112', '{\"id\": \"103650828110209932628\", \"name\": \"Python Django\", \"given_name\": \"Python\", \"family_name\": \"Django\", \"picture\": \"https://lh5.googleusercontent.com/-4DUEZlMB5yQ/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclerwZld468bZqOE-JBWTSHHxLf0g/s96-c/photo.jpg\", \"locale\": \"en-GB\"}', 2);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) NOT NULL,
  `name` varchar(40) NOT NULL,
  `client_id` varchar(191) NOT NULL,
  `secret` varchar(191) NOT NULL,
  `key` varchar(191) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialapp`
--

INSERT INTO `socialaccount_socialapp` (`id`, `provider`, `name`, `client_id`, `secret`, `key`) VALUES
(1, 'facebook', 'fb', '129747202302297', '4127721063c630cba3407c0210c8eea9', ''),
(2, 'instagram', 'insta', '129747202302297', '4127721063c630cba3407c0210c8eea9', ''),
(3, 'google', 'google', '968312904081-q9bsetutn504c1jbeg8ih7voeudin0lb.apps.googleusercontent.com', 'yLSmLhkQt2CVD_v9fxE-2iXi', '');

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialapp_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `socialapp_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_socialapp_id_97fb6e7d` (`socialapp_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5` (`site_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

INSERT INTO `socialaccount_socialapp_sites` (`id`, `socialapp_id`, `site_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
CREATE TABLE IF NOT EXISTS `socialaccount_socialtoken` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `token_secret` longtext NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_socialtoken_account_id_951f210e` (`account_id`),
  KEY `socialaccount_socialtoken_app_id_636a42d7` (`app_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `socialaccount_socialtoken`
--

INSERT INTO `socialaccount_socialtoken` (`id`, `token`, `token_secret`, `expires_at`, `account_id`, `app_id`) VALUES
(1, 'ya29.a0AfH6SMDq6Wg1n4mtjkoTltPWLQgGyJiFkqS5eIQxV0Dym36PaTC4XKYooS3mHoonw6eJQ5dzOQ1wsgPVvvCHH1kzhcZH_H-r692EGRrpNnZ3xFuVbJ58L7qcKmhvANTe2rcDaGRyI28bxbDYuSkm6nwRoPuV', '', '2021-03-01 13:57:23.546837', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `wikipedia_feedback`
--

DROP TABLE IF EXISTS `wikipedia_feedback`;
CREATE TABLE IF NOT EXISTS `wikipedia_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `feedback` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wikipedia_feedback`
--

INSERT INTO `wikipedia_feedback` (`id`, `email`, `feedback`) VALUES
(1, 'divu123viradiya@gmail.com', 'great...');

-- --------------------------------------------------------

--
-- Table structure for table `wikipedia_regi`
--

DROP TABLE IF EXISTS `wikipedia_regi`;
CREATE TABLE IF NOT EXISTS `wikipedia_regi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `password` varchar(6) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `zipcode` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wikipedia_regi`
--

INSERT INTO `wikipedia_regi` (`id`, `fname`, `lname`, `email`, `password`, `address`, `city`, `state`, `zipcode`) VALUES
(1, 'divya', 'viradiya', 'divuviradiya123@gmail.com', '98765', 'farenidham', 'rajkot', 'gujarat', 36046);

-- --------------------------------------------------------

--
-- Table structure for table `wikipedia_upload`
--

DROP TABLE IF EXISTS `wikipedia_upload`;
CREATE TABLE IF NOT EXISTS `wikipedia_upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `comments` varchar(50) NOT NULL,
  `fileupload` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wikipedia_upload`
--

INSERT INTO `wikipedia_upload` (`id`, `title`, `comments`, `fileupload`) VALUES
(1, 'assignment', 'module 1', 'upload/lap.jpg'),
(2, 'oop consept', 'ch..1 to 5', 'upload/font-awesome.css');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
