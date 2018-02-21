# WordPress MySQL database migration
#
# Generated: Wednesday 21. February 2018 11:03 UTC
# Hostname: mariadb11.viacomkft.hu
# Database: `16385_penta`
# --------------------------------------------------------

/*!40101 SET NAMES utf8mb4 */;

SET sql_mode='NO_AUTO_VALUE_ON_ZERO';



#
# Delete any existing table `pe_commentmeta`
#

DROP TABLE IF EXISTS `pe_commentmeta`;


#
# Table structure of table `pe_commentmeta`
#

CREATE TABLE `pe_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_commentmeta`
#

#
# End of data contents of table `pe_commentmeta`
# --------------------------------------------------------



#
# Delete any existing table `pe_comments`
#

DROP TABLE IF EXISTS `pe_comments`;


#
# Table structure of table `pe_comments`
#

CREATE TABLE `pe_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_comments`
#
INSERT INTO `pe_comments` ( `comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'WordPress Magyarország', '', 'https://wordpress.org/', '', '2016-07-07 09:38:06', '2016-07-07 09:38:06', 'Szia, ez egy hozzászólás.\nEgy hozzászólás törléséhez, egyszerűen csak be kell jelentkeznünk, és megtekinteni a bejegyzés hozzászólásait, ahol lehetőségünk van a hozzászólások törlésére.', 0, '1', '', '', 0, 0) ;

#
# End of data contents of table `pe_comments`
# --------------------------------------------------------



#
# Delete any existing table `pe_datalist`
#

DROP TABLE IF EXISTS `pe_datalist`;


#
# Table structure of table `pe_datalist`
#

CREATE TABLE `pe_datalist` (
  `url` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `full_content` smallint(6) NOT NULL,
  PRIMARY KEY (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


#
# Data contents of table `pe_datalist`
#

#
# End of data contents of table `pe_datalist`
# --------------------------------------------------------



#
# Delete any existing table `pe_itsec_lockouts`
#

DROP TABLE IF EXISTS `pe_itsec_lockouts`;


#
# Table structure of table `pe_itsec_lockouts`
#

CREATE TABLE `pe_itsec_lockouts` (
  `lockout_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lockout_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `lockout_start` datetime NOT NULL,
  `lockout_start_gmt` datetime NOT NULL,
  `lockout_expire` datetime NOT NULL,
  `lockout_expire_gmt` datetime NOT NULL,
  `lockout_host` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lockout_user` bigint(20) unsigned DEFAULT NULL,
  `lockout_username` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lockout_active` int(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`lockout_id`),
  KEY `lockout_expire_gmt` (`lockout_expire_gmt`),
  KEY `lockout_host` (`lockout_host`),
  KEY `lockout_user` (`lockout_user`),
  KEY `lockout_username` (`lockout_username`),
  KEY `lockout_active` (`lockout_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_itsec_lockouts`
#

#
# End of data contents of table `pe_itsec_lockouts`
# --------------------------------------------------------



#
# Delete any existing table `pe_itsec_log`
#

DROP TABLE IF EXISTS `pe_itsec_log`;


#
# Table structure of table `pe_itsec_log`
#

CREATE TABLE `pe_itsec_log` (
  `log_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_function` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log_priority` int(2) NOT NULL DEFAULT '1',
  `log_date` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `log_date_gmt` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  `log_host` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_username` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_user` bigint(20) unsigned DEFAULT NULL,
  `log_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_referrer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `log_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`),
  KEY `log_date_gmt` (`log_date_gmt`)
) ENGINE=InnoDB AUTO_INCREMENT=476 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_itsec_log`
#
INSERT INTO `pe_itsec_log` ( `log_id`, `log_type`, `log_function`, `log_priority`, `log_date`, `log_date_gmt`, `log_host`, `log_username`, `log_user`, `log_url`, `log_referrer`, `log_data`) VALUES
(445, 'four_oh_four', '404 Error', 3, '2018-02-21 10:37:16', '2018-02-21 10:37:16', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/', 'a:1:{s:12:"query_string";s:0:"";}'),
(446, 'four_oh_four', '404 Error', 3, '2018-02-21 10:37:16', '2018-02-21 10:37:16', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/scripts/main.js', 'http://localhost/pentaschool/', 'a:1:{s:12:"query_string";s:0:"";}'),
(447, 'four_oh_four', '404 Error', 3, '2018-02-21 10:37:18', '2018-02-21 10:37:18', '81.183.153.51', '', 0, '/img/logo-light.png', 'http://localhost/pentaschool/', 'a:1:{s:12:"query_string";s:0:"";}'),
(448, 'four_oh_four', '404 Error', 3, '2018-02-21 10:37:22', '2018-02-21 10:37:22', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(449, 'four_oh_four', '404 Error', 3, '2018-02-21 10:37:22', '2018-02-21 10:37:22', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/scripts/main.js', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(450, 'four_oh_four', '404 Error', 3, '2018-02-21 10:37:23', '2018-02-21 10:37:23', '81.183.153.51', '', 0, '/tanfolyamok/office/excel-makro-vba-tanfolyam/img/logo-light.png', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(451, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:13', '2018-02-21 10:38:13', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(452, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:13', '2018-02-21 10:38:13', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/scripts/main.js', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(453, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:13', '2018-02-21 10:38:13', '81.183.153.51', '', 0, '/tanfolyamok/office/excel-makro-vba-tanfolyam/img/logo-light.png', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(454, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:17', '2018-02-21 10:38:17', '81.183.153.51', '', 0, '/not_found', '', 'a:1:{s:12:"query_string";s:0:"";}'),
(455, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:18', '2018-02-21 10:38:18', '81.183.153.51', '', 0, '/img/logo-light.png', 'http://localhost/pentaschool/not_found', 'a:1:{s:12:"query_string";s:0:"";}'),
(456, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:18', '2018-02-21 10:38:18', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/not_found', 'a:1:{s:12:"query_string";s:0:"";}'),
(457, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:18', '2018-02-21 10:38:18', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/scripts/main.js', 'http://localhost/pentaschool/not_found', 'a:1:{s:12:"query_string";s:0:"";}'),
(458, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:46', '2018-02-21 10:38:46', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=112&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(459, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:46', '2018-02-21 10:38:46', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=112&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(460, 'four_oh_four', '404 Error', 3, '2018-02-21 10:38:47', '2018-02-21 10:38:47', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=112&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(461, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:16', '2018-02-21 10:39:16', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(462, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:16', '2018-02-21 10:39:16', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/scripts/main.js', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(463, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:18', '2018-02-21 10:39:18', '81.183.153.51', '', 0, '/tanfolyamok/office/excel-makro-vba-tanfolyam/img/logo-light.png', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(464, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:20', '2018-02-21 10:39:20', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(465, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:20', '2018-02-21 10:39:20', '81.183.153.51', '', 0, '/tanfolyamok/office/excel-makro-vba-tanfolyam/img/logo-light.png', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(466, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:22', '2018-02-21 10:39:22', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/scripts/main.js', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(467, 'four_oh_four', '404 Error', 3, '2018-02-21 10:39:39', '2018-02-21 10:39:39', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/tanfolyamok/office/excel-makro-vba-tanfolyam/', 'a:1:{s:12:"query_string";s:0:"";}'),
(468, 'four_oh_four', '404 Error', 3, '2018-02-21 10:53:48', '2018-02-21 10:53:48', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=164&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(469, 'four_oh_four', '404 Error', 3, '2018-02-21 10:53:49', '2018-02-21 10:53:49', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=164&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(470, 'four_oh_four', '404 Error', 3, '2018-02-21 10:53:49', '2018-02-21 10:53:49', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=164&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(471, 'four_oh_four', '404 Error', 3, '2018-02-21 10:54:13', '2018-02-21 10:54:13', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=171&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(472, 'four_oh_four', '404 Error', 3, '2018-02-21 10:54:13', '2018-02-21 10:54:13', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=171&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(473, 'four_oh_four', '404 Error', 3, '2018-02-21 10:54:14', '2018-02-21 10:54:14', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=171&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(474, 'four_oh_four', '404 Error', 3, '2018-02-21 10:54:47', '2018-02-21 10:54:47', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=171&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}'),
(475, 'four_oh_four', '404 Error', 3, '2018-02-21 10:54:48', '2018-02-21 10:54:48', '81.183.153.51', '', 0, '/wp-content/themes/penta/dist/styles/main.css', 'http://localhost/pentaschool/wp-admin/post.php?post=171&action=edit', 'a:1:{s:12:"query_string";s:20:"wp-mce-4607-20180123";}') ;

#
# End of data contents of table `pe_itsec_log`
# --------------------------------------------------------



#
# Delete any existing table `pe_itsec_temp`
#

DROP TABLE IF EXISTS `pe_itsec_temp`;


#
# Table structure of table `pe_itsec_temp`
#

CREATE TABLE `pe_itsec_temp` (
  `temp_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `temp_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `temp_date` datetime NOT NULL,
  `temp_date_gmt` datetime NOT NULL,
  `temp_host` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp_user` bigint(20) unsigned DEFAULT NULL,
  `temp_username` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`temp_id`),
  KEY `temp_date_gmt` (`temp_date_gmt`),
  KEY `temp_host` (`temp_host`),
  KEY `temp_user` (`temp_user`),
  KEY `temp_username` (`temp_username`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_itsec_temp`
#
INSERT INTO `pe_itsec_temp` ( `temp_id`, `temp_type`, `temp_date`, `temp_date_gmt`, `temp_host`, `temp_user`, `temp_username`) VALUES
(1, 'four_oh_four', '2018-02-21 10:37:16', '2018-02-21 10:37:16', '81.183.153.51', NULL, NULL),
(2, 'four_oh_four', '2018-02-21 10:37:22', '2018-02-21 10:37:22', '81.183.153.51', NULL, NULL),
(3, 'four_oh_four', '2018-02-21 10:38:13', '2018-02-21 10:38:13', '81.183.153.51', NULL, NULL),
(4, 'four_oh_four', '2018-02-21 10:38:17', '2018-02-21 10:38:17', '81.183.153.51', NULL, NULL),
(5, 'four_oh_four', '2018-02-21 10:38:18', '2018-02-21 10:38:18', '81.183.153.51', NULL, NULL),
(6, 'four_oh_four', '2018-02-21 10:39:16', '2018-02-21 10:39:16', '81.183.153.51', NULL, NULL),
(7, 'four_oh_four', '2018-02-21 10:39:22', '2018-02-21 10:39:22', '81.183.153.51', NULL, NULL) ;

#
# End of data contents of table `pe_itsec_temp`
# --------------------------------------------------------



#
# Delete any existing table `pe_links`
#

DROP TABLE IF EXISTS `pe_links`;


#
# Table structure of table `pe_links`
#

CREATE TABLE `pe_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_links`
#

#
# End of data contents of table `pe_links`
# --------------------------------------------------------



#
# Delete any existing table `pe_options`
#

DROP TABLE IF EXISTS `pe_options`;


#
# Table structure of table `pe_options`
#

CREATE TABLE `pe_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB AUTO_INCREMENT=15088 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_options`
#
INSERT INTO `pe_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/pentaschool', 'yes'),
(2, 'home', 'http://localhost/pentaschool', 'yes'),
(3, 'blogname', 'Pentaschool', 'yes'),
(4, 'blogdescription', '... egy újabb WordPress honlap...', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'holevi96@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '0', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'Y-m-d', 'yes'),
(24, 'time_format', 'H:i', 'yes'),
(25, 'links_updated_date_format', 'Y-m-d H:i', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:261:{s:11:"^wp-json/?$";s:22:"index.php?rest_route=/";s:14:"^wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:21:"^index.php/wp-json/?$";s:22:"index.php?rest_route=/";s:24:"^index.php/wp-json/(.*)?";s:33:"index.php?rest_route=/$matches[1]";s:14:"tanfolyamok/?$";s:31:"index.php?post_type=tanfolyamok";s:44:"tanfolyamok/feed/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=tanfolyamok&feed=$matches[1]";s:39:"tanfolyamok/(feed|rdf|rss|rss2|atom)/?$";s:48:"index.php?post_type=tanfolyamok&feed=$matches[1]";s:31:"tanfolyamok/page/([0-9]{1,})/?$";s:49:"index.php?post_type=tanfolyamok&paged=$matches[1]";s:81:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:102:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]&post_type=tanfolyamok";s:76:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:102:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]&post_type=tanfolyamok";s:69:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:103:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]&post_type=tanfolyamok";s:51:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:85:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&post_type=tanfolyamok";s:68:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:86:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]&post_type=tanfolyamok";s:63:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:86:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]&post_type=tanfolyamok";s:56:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:87:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]&post_type=tanfolyamok";s:38:"tanfolyamok/([0-9]{4})/([0-9]{1,2})/?$";s:69:"index.php?year=$matches[1]&monthnum=$matches[2]&post_type=tanfolyamok";s:55:"tanfolyamok/([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:65:"index.php?year=$matches[1]&feed=$matches[2]&post_type=tanfolyamok";s:50:"tanfolyamok/([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:65:"index.php?year=$matches[1]&feed=$matches[2]&post_type=tanfolyamok";s:43:"tanfolyamok/([0-9]{4})/page/?([0-9]{1,})/?$";s:66:"index.php?year=$matches[1]&paged=$matches[2]&post_type=tanfolyamok";s:25:"tanfolyamok/([0-9]{4})/?$";s:48:"index.php?year=$matches[1]&post_type=tanfolyamok";s:47:"tanfolyamok/author/([^/]+)/page/?([0-9]{1,})/?$";s:73:"index.php?author_name=$matches[1]&paged=$matches[2]&post_type=tanfolyamok";s:29:"tanfolyamok/author/([^/]+)/?$";s:55:"index.php?author_name=$matches[1]&post_type=tanfolyamok";s:49:"tanfolyamok/category/([^/]+)/page/?([0-9]{1,})/?$";s:75:"index.php?category_name=$matches[1]&paged=$matches[2]&post_type=tanfolyamok";s:31:"tanfolyamok/category/([^/]+)/?$";s:57:"index.php?category_name=$matches[1]&post_type=tanfolyamok";s:47:"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:42:"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:52:"index.php?category_name=$matches[1]&feed=$matches[2]";s:23:"category/(.+?)/embed/?$";s:46:"index.php?category_name=$matches[1]&embed=true";s:35:"category/(.+?)/page/?([0-9]{1,})/?$";s:53:"index.php?category_name=$matches[1]&paged=$matches[2]";s:17:"category/(.+?)/?$";s:35:"index.php?category_name=$matches[1]";s:44:"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:39:"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?tag=$matches[1]&feed=$matches[2]";s:20:"tag/([^/]+)/embed/?$";s:36:"index.php?tag=$matches[1]&embed=true";s:32:"tag/([^/]+)/page/?([0-9]{1,})/?$";s:43:"index.php?tag=$matches[1]&paged=$matches[2]";s:14:"tag/([^/]+)/?$";s:25:"index.php?tag=$matches[1]";s:45:"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:40:"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?post_format=$matches[1]&feed=$matches[2]";s:21:"type/([^/]+)/embed/?$";s:44:"index.php?post_format=$matches[1]&embed=true";s:33:"type/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?post_format=$matches[1]&paged=$matches[2]";s:15:"type/([^/]+)/?$";s:33:"index.php?post_format=$matches[1]";s:50:"ajanlas_cat/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?ajanlas_cat=$matches[1]&feed=$matches[2]";s:45:"ajanlas_cat/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?ajanlas_cat=$matches[1]&feed=$matches[2]";s:26:"ajanlas_cat/(.+?)/embed/?$";s:44:"index.php?ajanlas_cat=$matches[1]&embed=true";s:38:"ajanlas_cat/(.+?)/page/?([0-9]{1,})/?$";s:51:"index.php?ajanlas_cat=$matches[1]&paged=$matches[2]";s:20:"ajanlas_cat/(.+?)/?$";s:33:"index.php?ajanlas_cat=$matches[1]";s:41:"tanfolyamok/.+?/.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:51:"tanfolyamok/.+?/.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:71:"tanfolyamok/.+?/.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"tanfolyamok/.+?/.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:66:"tanfolyamok/.+?/.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:47:"tanfolyamok/.+?/.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:34:"(tanfolyamok)/(.+?)/(.+?)/embed/?$";s:109:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&embed=true";s:38:"(tanfolyamok)/(.+?)/(.+?)/trackback/?$";s:103:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&tb=1";s:58:"(tanfolyamok)/(.+?)/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:115:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&feed=$matches[4]";s:53:"(tanfolyamok)/(.+?)/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:115:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&feed=$matches[4]";s:46:"(tanfolyamok)/(.+?)/(.+?)/page/?([0-9]{1,})/?$";s:116:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&paged=$matches[4]";s:53:"(tanfolyamok)/(.+?)/(.+?)/comment-page-([0-9]{1,})/?$";s:116:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&cpage=$matches[4]";s:42:"(tanfolyamok)/(.+?)/(.+?)(?:/([0-9]+))?/?$";s:115:"index.php?post_type=tanfolyamok&slug=$matches[1]&category_name=$matches[2]&tanfolyamok=$matches[3]&page=$matches[4]";s:35:"tesztek/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"tesztek/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"tesztek/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"tesztek/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"tesztek/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"tesztek/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"(tesztek)/([^/]+)/embed/?$";s:75:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&embed=true";s:30:"(tesztek)/([^/]+)/trackback/?$";s:69:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&tb=1";s:50:"(tesztek)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:81:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&feed=$matches[3]";s:45:"(tesztek)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:81:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&feed=$matches[3]";s:38:"(tesztek)/([^/]+)/page/?([0-9]{1,})/?$";s:82:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&paged=$matches[3]";s:45:"(tesztek)/([^/]+)/comment-page-([0-9]{1,})/?$";s:82:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&cpage=$matches[3]";s:34:"(tesztek)/([^/]+)(?:/([0-9]+))?/?$";s:81:"index.php?post_type=tesztek&slug=$matches[1]&tesztek=$matches[2]&page=$matches[3]";s:24:"tesztek/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"tesztek/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"tesztek/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"tesztek/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"tesztek/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"tesztek/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:39:"referenciak/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:49:"referenciak/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:69:"referenciak/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"referenciak/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:64:"referenciak/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:45:"referenciak/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:30:"(referenciak)/([^/]+)/embed/?$";s:83:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&embed=true";s:34:"(referenciak)/([^/]+)/trackback/?$";s:77:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&tb=1";s:54:"(referenciak)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:89:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&feed=$matches[3]";s:49:"(referenciak)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:89:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&feed=$matches[3]";s:42:"(referenciak)/([^/]+)/page/?([0-9]{1,})/?$";s:90:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&paged=$matches[3]";s:49:"(referenciak)/([^/]+)/comment-page-([0-9]{1,})/?$";s:90:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&cpage=$matches[3]";s:38:"(referenciak)/([^/]+)(?:/([0-9]+))?/?$";s:89:"index.php?post_type=referenciak&slug=$matches[1]&referenciak=$matches[2]&page=$matches[3]";s:28:"referenciak/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:38:"referenciak/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:58:"referenciak/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"referenciak/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:53:"referenciak/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:34:"referenciak/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:44:"tanfolyam-kiiras/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:54:"tanfolyam-kiiras/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:74:"tanfolyam-kiiras/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"tanfolyam-kiiras/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:69:"tanfolyam-kiiras/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:50:"tanfolyam-kiiras/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"(tanfolyam-kiiras)/([^/]+)/embed/?$";s:93:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&embed=true";s:39:"(tanfolyam-kiiras)/([^/]+)/trackback/?$";s:87:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&tb=1";s:59:"(tanfolyam-kiiras)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:99:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&feed=$matches[3]";s:54:"(tanfolyam-kiiras)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:99:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&feed=$matches[3]";s:47:"(tanfolyam-kiiras)/([^/]+)/page/?([0-9]{1,})/?$";s:100:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&paged=$matches[3]";s:54:"(tanfolyam-kiiras)/([^/]+)/comment-page-([0-9]{1,})/?$";s:100:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&cpage=$matches[3]";s:43:"(tanfolyam-kiiras)/([^/]+)(?:/([0-9]+))?/?$";s:99:"index.php?post_type=tanfolyam-kiiras&slug=$matches[1]&tanfolyam-kiiras=$matches[2]&page=$matches[3]";s:33:"tanfolyam-kiiras/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:43:"tanfolyam-kiiras/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:63:"tanfolyam-kiiras/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"tanfolyam-kiiras/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:58:"tanfolyam-kiiras/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:39:"tanfolyam-kiiras/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:35:"tanarok/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:45:"tanarok/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:65:"tanarok/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"tanarok/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:60:"tanarok/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:41:"tanarok/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:26:"(tanarok)/([^/]+)/embed/?$";s:75:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&embed=true";s:30:"(tanarok)/([^/]+)/trackback/?$";s:69:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&tb=1";s:50:"(tanarok)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:81:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&feed=$matches[3]";s:45:"(tanarok)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:81:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&feed=$matches[3]";s:38:"(tanarok)/([^/]+)/page/?([0-9]{1,})/?$";s:82:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&paged=$matches[3]";s:45:"(tanarok)/([^/]+)/comment-page-([0-9]{1,})/?$";s:82:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&cpage=$matches[3]";s:34:"(tanarok)/([^/]+)(?:/([0-9]+))?/?$";s:81:"index.php?post_type=tanarok&slug=$matches[1]&tanarok=$matches[2]&page=$matches[3]";s:24:"tanarok/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:34:"tanarok/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:54:"tanarok/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"tanarok/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:49:"tanarok/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:30:"tanarok/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:36:"helyszin/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:46:"helyszin/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:66:"helyszin/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"helyszin/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:61:"helyszin/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:42:"helyszin/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:27:"(helyszin)/([^/]+)/embed/?$";s:77:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&embed=true";s:31:"(helyszin)/([^/]+)/trackback/?$";s:71:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&tb=1";s:51:"(helyszin)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:83:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&feed=$matches[3]";s:46:"(helyszin)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:83:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&feed=$matches[3]";s:39:"(helyszin)/([^/]+)/page/?([0-9]{1,})/?$";s:84:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&paged=$matches[3]";s:46:"(helyszin)/([^/]+)/comment-page-([0-9]{1,})/?$";s:84:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&cpage=$matches[3]";s:35:"(helyszin)/([^/]+)(?:/([0-9]+))?/?$";s:83:"index.php?post_type=helyszin&slug=$matches[1]&helyszin=$matches[2]&page=$matches[3]";s:25:"helyszin/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:35:"helyszin/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:55:"helyszin/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"helyszin/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:50:"helyszin/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:31:"helyszin/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:37:"ajanlasok/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:47:"ajanlasok/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:67:"ajanlasok/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ajanlasok/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:62:"ajanlasok/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:43:"ajanlasok/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:28:"(ajanlasok)/([^/]+)/embed/?$";s:79:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&embed=true";s:32:"(ajanlasok)/([^/]+)/trackback/?$";s:73:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&tb=1";s:52:"(ajanlasok)/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:85:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&feed=$matches[3]";s:47:"(ajanlasok)/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:85:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&feed=$matches[3]";s:40:"(ajanlasok)/([^/]+)/page/?([0-9]{1,})/?$";s:86:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&paged=$matches[3]";s:47:"(ajanlasok)/([^/]+)/comment-page-([0-9]{1,})/?$";s:86:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&cpage=$matches[3]";s:36:"(ajanlasok)/([^/]+)(?:/([0-9]+))?/?$";s:85:"index.php?post_type=ajanlasok&slug=$matches[1]&ajanlasok=$matches[2]&page=$matches[3]";s:26:"ajanlasok/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:36:"ajanlasok/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:56:"ajanlasok/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ajanlasok/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:51:"ajanlasok/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:32:"ajanlasok/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:40:"vc_grid_item/[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:50:"vc_grid_item/[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:70:"vc_grid_item/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"vc_grid_item/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:65:"vc_grid_item/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:46:"vc_grid_item/[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:29:"vc_grid_item/([^/]+)/embed/?$";s:45:"index.php?vc_grid_item=$matches[1]&embed=true";s:33:"vc_grid_item/([^/]+)/trackback/?$";s:39:"index.php?vc_grid_item=$matches[1]&tb=1";s:41:"vc_grid_item/([^/]+)/page/?([0-9]{1,})/?$";s:52:"index.php?vc_grid_item=$matches[1]&paged=$matches[2]";s:48:"vc_grid_item/([^/]+)/comment-page-([0-9]{1,})/?$";s:52:"index.php?vc_grid_item=$matches[1]&cpage=$matches[2]";s:37:"vc_grid_item/([^/]+)(?:/([0-9]+))?/?$";s:51:"index.php?vc_grid_item=$matches[1]&page=$matches[2]";s:29:"vc_grid_item/[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:39:"vc_grid_item/[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:59:"vc_grid_item/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"vc_grid_item/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:54:"vc_grid_item/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:35:"vc_grid_item/[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:45:"marker/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?marker=$matches[1]&feed=$matches[2]";s:40:"marker/(.+?)/(feed|rdf|rss|rss2|atom)/?$";s:45:"index.php?marker=$matches[1]&feed=$matches[2]";s:21:"marker/(.+?)/embed/?$";s:39:"index.php?marker=$matches[1]&embed=true";s:33:"marker/(.+?)/page/?([0-9]{1,})/?$";s:46:"index.php?marker=$matches[1]&paged=$matches[2]";s:15:"marker/(.+?)/?$";s:28:"index.php?marker=$matches[1]";s:12:"robots\\.txt$";s:18:"index.php?robots=1";s:48:".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$";s:18:"index.php?feed=old";s:20:".*wp-app\\.php(/.*)?$";s:19:"index.php?error=403";s:18:".*wp-register.php$";s:23:"index.php?register=true";s:32:"feed/(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:27:"(feed|rdf|rss|rss2|atom)/?$";s:27:"index.php?&feed=$matches[1]";s:8:"embed/?$";s:21:"index.php?&embed=true";s:20:"page/?([0-9]{1,})/?$";s:28:"index.php?&paged=$matches[1]";s:41:"comments/feed/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:36:"comments/(feed|rdf|rss|rss2|atom)/?$";s:42:"index.php?&feed=$matches[1]&withcomments=1";s:17:"comments/embed/?$";s:21:"index.php?&embed=true";s:44:"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:39:"search/(.+)/(feed|rdf|rss|rss2|atom)/?$";s:40:"index.php?s=$matches[1]&feed=$matches[2]";s:20:"search/(.+)/embed/?$";s:34:"index.php?s=$matches[1]&embed=true";s:32:"search/(.+)/page/?([0-9]{1,})/?$";s:41:"index.php?s=$matches[1]&paged=$matches[2]";s:14:"search/(.+)/?$";s:23:"index.php?s=$matches[1]";s:47:"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:42:"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:50:"index.php?author_name=$matches[1]&feed=$matches[2]";s:23:"author/([^/]+)/embed/?$";s:44:"index.php?author_name=$matches[1]&embed=true";s:35:"author/([^/]+)/page/?([0-9]{1,})/?$";s:51:"index.php?author_name=$matches[1]&paged=$matches[2]";s:17:"author/([^/]+)/?$";s:33:"index.php?author_name=$matches[1]";s:69:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:64:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:80:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]";s:45:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$";s:74:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true";s:57:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:81:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]";s:39:"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$";s:63:"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]";s:56:"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:51:"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$";s:64:"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]";s:32:"([0-9]{4})/([0-9]{1,2})/embed/?$";s:58:"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true";s:44:"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$";s:65:"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]";s:26:"([0-9]{4})/([0-9]{1,2})/?$";s:47:"index.php?year=$matches[1]&monthnum=$matches[2]";s:43:"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:38:"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?year=$matches[1]&feed=$matches[2]";s:19:"([0-9]{4})/embed/?$";s:37:"index.php?year=$matches[1]&embed=true";s:31:"([0-9]{4})/page/?([0-9]{1,})/?$";s:44:"index.php?year=$matches[1]&paged=$matches[2]";s:13:"([0-9]{4})/?$";s:26:"index.php?year=$matches[1]";s:27:".?.+?/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:".?.+?/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:".?.+?/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"(.?.+?)/embed/?$";s:41:"index.php?pagename=$matches[1]&embed=true";s:20:"(.?.+?)/trackback/?$";s:35:"index.php?pagename=$matches[1]&tb=1";s:40:"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:35:"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$";s:47:"index.php?pagename=$matches[1]&feed=$matches[2]";s:28:"(.?.+?)/page/?([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&paged=$matches[2]";s:35:"(.?.+?)/comment-page-([0-9]{1,})/?$";s:48:"index.php?pagename=$matches[1]&cpage=$matches[2]";s:24:"(.?.+?)(?:/([0-9]+))?/?$";s:47:"index.php?pagename=$matches[1]&page=$matches[2]";s:27:"[^/]+/attachment/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:37:"[^/]+/attachment/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:57:"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:52:"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:33:"[^/]+/attachment/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";s:16:"([^/]+)/embed/?$";s:37:"index.php?name=$matches[1]&embed=true";s:20:"([^/]+)/trackback/?$";s:31:"index.php?name=$matches[1]&tb=1";s:40:"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:35:"([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:43:"index.php?name=$matches[1]&feed=$matches[2]";s:28:"([^/]+)/page/?([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&paged=$matches[2]";s:35:"([^/]+)/comment-page-([0-9]{1,})/?$";s:44:"index.php?name=$matches[1]&cpage=$matches[2]";s:24:"([^/]+)(?:/([0-9]+))?/?$";s:43:"index.php?name=$matches[1]&page=$matches[2]";s:16:"[^/]+/([^/]+)/?$";s:32:"index.php?attachment=$matches[1]";s:26:"[^/]+/([^/]+)/trackback/?$";s:37:"index.php?attachment=$matches[1]&tb=1";s:46:"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$";s:49:"index.php?attachment=$matches[1]&feed=$matches[2]";s:41:"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$";s:50:"index.php?attachment=$matches[1]&cpage=$matches[2]";s:22:"[^/]+/([^/]+)/embed/?$";s:43:"index.php?attachment=$matches[1]&embed=true";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:20:{i:0;s:29:"gravityforms/gravityforms.php";i:1;s:31:"acf-accordion/acf-accordion.php";i:2;s:27:"acf-gallery/acf-gallery.php";i:3;s:38:"acf-quick-edit-fields-master/index.php";i:4;s:31:"acf-recaptcha/acf-recaptcha.php";i:5;s:29:"acf-repeater/acf-repeater.php";i:6;s:34:"advanced-custom-fields-pro/acf.php";i:7;s:41:"better-wp-security/better-wp-security.php";i:8;s:59:"custom-post-type-permalinks/custom-post-type-permalinks.php";i:9;s:43:"custom-post-type-ui/custom-post-type-ui.php";i:10;s:66:"gravity-forms-image-in-html-master/gravity-forms-image-in-html.php";i:11;s:25:"gravityformsquiz/quiz.php";i:12;s:29:"gravityformssurvey/survey.php";i:13;s:27:"js_composer/js_composer.php";i:14;s:25:"mark-posts/mark-posts.php";i:15;s:32:"metronet-reorder-posts/index.php";i:16;s:47:"regenerate-thumbnails/regenerate-thumbnails.php";i:17;s:35:"reorder-by-term/reorder-by-term.php";i:18;s:39:"wp-all-import-pro/wp-all-import-pro.php";i:19;s:39:"wp-migrate-db-pro/wp-migrate-db-pro.php";}', 'yes'),
(34, 'category_base', '/category', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:84:"/data/domains/pentaschool.hu/web/webroot/dev/wp-content/themes/twentysixteen/404.php";i:2;s:86:"/data/domains/pentaschool.hu/web/webroot/dev/wp-content/themes/twentysixteen/style.css";i:3;s:69:"C:\\wamp\\www\\pentaschool/wp-content/themes/twentysixteen/functions.php";i:4;s:65:"C:\\wamp\\www\\pentaschool/wp-content/themes/twentysixteen/style.css";i:5;s:0:"";}', 'no'),
(40, 'template', 'penta', 'yes'),
(41, 'stylesheet', 'penta', 'yes'),
(42, 'comment_whitelist', '1', 'yes'),
(43, 'blacklist_keys', '', 'no'),
(44, 'comment_registration', '0', 'yes'),
(45, 'html_type', 'text/html', 'yes'),
(46, 'use_trackback', '0', 'yes'),
(47, 'default_role', 'subscriber', 'yes'),
(48, 'db_version', '38590', 'yes'),
(49, 'uploads_use_yearmonth_folders', '1', 'yes'),
(50, 'upload_path', '', 'yes'),
(51, 'blog_public', '0', 'yes'),
(52, 'default_link_category', '2', 'yes'),
(53, 'show_on_front', 'posts', 'yes'),
(54, 'tag_base', '/tag', 'yes'),
(55, 'show_avatars', '1', 'yes'),
(56, 'avatar_rating', 'G', 'yes'),
(57, 'upload_url_path', '', 'yes'),
(58, 'thumbnail_size_w', '150', 'yes'),
(59, 'thumbnail_size_h', '150', 'yes'),
(60, 'thumbnail_crop', '1', 'yes'),
(61, 'medium_size_w', '300', 'yes'),
(62, 'medium_size_h', '300', 'yes'),
(63, 'avatar_default', 'mystery', 'yes'),
(64, 'large_size_w', '1024', 'yes'),
(65, 'large_size_h', '1024', 'yes'),
(66, 'image_default_link_type', 'none', 'yes'),
(67, 'image_default_size', '', 'yes'),
(68, 'image_default_align', '', 'yes'),
(69, 'close_comments_for_old_posts', '0', 'yes'),
(70, 'close_comments_days_old', '14', 'yes'),
(71, 'thread_comments', '1', 'yes'),
(72, 'thread_comments_depth', '5', 'yes'),
(73, 'page_comments', '0', 'yes'),
(74, 'comments_per_page', '50', 'yes'),
(75, 'default_comments_page', 'newest', 'yes'),
(76, 'comment_order', 'asc', 'yes'),
(77, 'sticky_posts', 'a:0:{}', 'yes'),
(78, 'widget_categories', 'a:2:{i:2;a:4:{s:5:"title";s:0:"";s:5:"count";i:0;s:12:"hierarchical";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(79, 'widget_text', 'a:0:{}', 'yes'),
(80, 'widget_rss', 'a:0:{}', 'yes'),
(81, 'uninstall_plugins', 'a:3:{s:41:"better-wp-security/better-wp-security.php";a:2:{i:0;s:10:"ITSEC_Core";i:1;s:16:"handle_uninstall";}s:59:"custom-post-type-permalinks/custom-post-type-permalinks.php";a:2:{i:0;s:4:"CPTP";i:1;s:9:"uninstall";}s:47:"custom-bulkquick-edit/custom-bulkquick-edit.php";a:2:{i:0;s:21:"Custom_Bulkquick_Edit";i:1;s:9:"uninstall";}}', 'no'),
(82, 'timezone_string', '', 'yes'),
(83, 'page_for_posts', '0', 'yes'),
(84, 'page_on_front', '0', 'yes'),
(85, 'default_post_format', '0', 'yes'),
(86, 'link_manager_enabled', '0', 'yes'),
(87, 'finished_splitting_shared_terms', '1', 'yes'),
(88, 'site_icon', '0', 'yes'),
(89, 'medium_large_size_w', '768', 'yes'),
(90, 'medium_large_size_h', '0', 'yes'),
(91, 'initial_db_version', '36686', 'yes'),
(92, 'pe_user_roles', 'a:8:{s:13:"administrator";a:2:{s:4:"name";s:13:"Administrator";s:12:"capabilities";a:71:{s:13:"switch_themes";b:1;s:11:"edit_themes";b:1;s:16:"activate_plugins";b:1;s:12:"edit_plugins";b:1;s:10:"edit_users";b:1;s:10:"edit_files";b:1;s:14:"manage_options";b:1;s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:6:"import";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:8:"level_10";b:1;s:7:"level_9";b:1;s:7:"level_8";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;s:12:"delete_users";b:1;s:12:"create_users";b:1;s:17:"unfiltered_upload";b:1;s:14:"edit_dashboard";b:1;s:14:"update_plugins";b:1;s:14:"delete_plugins";b:1;s:15:"install_plugins";b:1;s:13:"update_themes";b:1;s:14:"install_themes";b:1;s:11:"update_core";b:1;s:10:"list_users";b:1;s:12:"remove_users";b:1;s:13:"promote_users";b:1;s:18:"edit_theme_options";b:1;s:13:"delete_themes";b:1;s:6:"export";b:1;s:8:"backwpup";b:1;s:13:"backwpup_jobs";b:1;s:18:"backwpup_jobs_edit";b:1;s:19:"backwpup_jobs_start";b:1;s:16:"backwpup_backups";b:1;s:25:"backwpup_backups_download";b:1;s:23:"backwpup_backups_delete";b:1;s:13:"backwpup_logs";b:1;s:20:"backwpup_logs_delete";b:1;s:17:"backwpup_settings";b:1;}}s:6:"editor";a:2:{s:4:"name";s:6:"Editor";s:12:"capabilities";a:34:{s:17:"moderate_comments";b:1;s:17:"manage_categories";b:1;s:12:"manage_links";b:1;s:12:"upload_files";b:1;s:15:"unfiltered_html";b:1;s:10:"edit_posts";b:1;s:17:"edit_others_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:10:"edit_pages";b:1;s:4:"read";b:1;s:7:"level_7";b:1;s:7:"level_6";b:1;s:7:"level_5";b:1;s:7:"level_4";b:1;s:7:"level_3";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:17:"edit_others_pages";b:1;s:20:"edit_published_pages";b:1;s:13:"publish_pages";b:1;s:12:"delete_pages";b:1;s:19:"delete_others_pages";b:1;s:22:"delete_published_pages";b:1;s:12:"delete_posts";b:1;s:19:"delete_others_posts";b:1;s:22:"delete_published_posts";b:1;s:20:"delete_private_posts";b:1;s:18:"edit_private_posts";b:1;s:18:"read_private_posts";b:1;s:20:"delete_private_pages";b:1;s:18:"edit_private_pages";b:1;s:18:"read_private_pages";b:1;}}s:6:"author";a:2:{s:4:"name";s:6:"Author";s:12:"capabilities";a:10:{s:12:"upload_files";b:1;s:10:"edit_posts";b:1;s:20:"edit_published_posts";b:1;s:13:"publish_posts";b:1;s:4:"read";b:1;s:7:"level_2";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;s:22:"delete_published_posts";b:1;}}s:11:"contributor";a:2:{s:4:"name";s:11:"Contributor";s:12:"capabilities";a:5:{s:10:"edit_posts";b:1;s:4:"read";b:1;s:7:"level_1";b:1;s:7:"level_0";b:1;s:12:"delete_posts";b:1;}}s:10:"subscriber";a:2:{s:4:"name";s:10:"Subscriber";s:12:"capabilities";a:2:{s:4:"read";b:1;s:7:"level_0";b:1;}}s:14:"backwpup_admin";a:2:{s:4:"name";s:14:"BackWPup Admin";s:12:"capabilities";a:11:{s:4:"read";b:1;s:8:"backwpup";b:1;s:13:"backwpup_jobs";b:1;s:18:"backwpup_jobs_edit";b:1;s:19:"backwpup_jobs_start";b:1;s:16:"backwpup_backups";b:1;s:25:"backwpup_backups_download";b:1;s:23:"backwpup_backups_delete";b:1;s:13:"backwpup_logs";b:1;s:20:"backwpup_logs_delete";b:1;s:17:"backwpup_settings";b:1;}}s:14:"backwpup_check";a:2:{s:4:"name";s:21:"BackWPup jobs checker";s:12:"capabilities";a:11:{s:4:"read";b:1;s:8:"backwpup";b:1;s:13:"backwpup_jobs";b:1;s:18:"backwpup_jobs_edit";b:0;s:19:"backwpup_jobs_start";b:0;s:16:"backwpup_backups";b:1;s:25:"backwpup_backups_download";b:0;s:23:"backwpup_backups_delete";b:0;s:13:"backwpup_logs";b:1;s:20:"backwpup_logs_delete";b:0;s:17:"backwpup_settings";b:0;}}s:15:"backwpup_helper";a:2:{s:4:"name";s:20:"BackWPup jobs helper";s:12:"capabilities";a:11:{s:4:"read";b:1;s:8:"backwpup";b:1;s:13:"backwpup_jobs";b:1;s:18:"backwpup_jobs_edit";b:0;s:19:"backwpup_jobs_start";b:1;s:16:"backwpup_backups";b:1;s:25:"backwpup_backups_download";b:1;s:23:"backwpup_backups_delete";b:1;s:13:"backwpup_logs";b:1;s:20:"backwpup_logs_delete";b:1;s:17:"backwpup_settings";b:0;}}}', 'yes'),
(93, 'WPLANG', 'hu_HU', 'yes'),
(94, 'widget_search', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(95, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(96, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:"title";s:0:"";s:6:"number";i:5;}s:12:"_multiwidget";i:1;}', 'yes'),
(97, 'widget_archives', 'a:2:{i:2;a:3:{s:5:"title";s:0:"";s:5:"count";i:0;s:8:"dropdown";i:0;}s:12:"_multiwidget";i:1;}', 'yes'),
(98, 'widget_meta', 'a:2:{i:2;a:1:{s:5:"title";s:0:"";}s:12:"_multiwidget";i:1;}', 'yes'),
(99, 'sidebars_widgets', 'a:4:{s:19:"wp_inactive_widgets";a:0:{}s:15:"sidebar-primary";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:14:"sidebar-footer";N;s:13:"array_version";i:3;}', 'yes'),
(100, 'widget_pages', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes') ;
INSERT INTO `pe_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(101, 'widget_calendar', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(102, 'widget_tag_cloud', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(103, 'widget_nav_menu', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(104, 'cron', 'a:10:{i:1519212382;a:1:{s:16:"itsec_purge_logs";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1519212660;a:1:{s:30:"wp_scheduled_auto_draft_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1519225461;a:1:{s:17:"gravityforms_cron";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1519229298;a:2:{s:20:"itsec_purge_lockouts";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}s:17:"itsec_clear_locks";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1519229922;a:1:{s:25:"delete_expired_transients";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}i:1519231435;a:1:{s:22:"backwpup_check_cleanup";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1519248374;a:1:{s:23:"backwpup_update_message";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1519249087;a:3:{s:16:"wp_version_check";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:17:"wp_update_plugins";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}s:16:"wp_update_themes";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:10:"twicedaily";s:4:"args";a:0:{}s:8:"interval";i:43200;}}}i:1519292315;a:1:{s:19:"wp_scheduled_delete";a:1:{s:32:"40cd750bba9870f18aada2478b24840a";a:3:{s:8:"schedule";s:5:"daily";s:4:"args";a:0:{}s:8:"interval";i:86400;}}}s:7:"version";i:2;}', 'yes'),
(133, 'recently_activated', 'a:0:{}', 'yes'),
(138, 'PMXI_Plugin_Options', 'a:29:{s:12:"info_api_url";s:26:"http://www.wpallimport.com";s:18:"history_file_count";i:10000;s:16:"history_file_age";i:365;s:15:"highlight_limit";i:10000;s:19:"upload_max_filesize";i:2048;s:13:"post_max_size";i:2048;s:14:"max_input_time";i:-1;s:18:"max_execution_time";i:-1;s:7:"dismiss";i:0;s:16:"dismiss_speed_up";i:0;s:13:"html_entities";i:0;s:11:"utf8_decode";i:0;s:12:"cron_job_key";s:11:"r-wt5mPipsI";s:10:"chunk_size";i:32;s:9:"pingbacks";i:1;s:33:"legacy_special_character_handling";i:1;s:14:"case_sensitive";i:1;s:12:"session_mode";s:7:"default";s:17:"enable_ftp_import";i:0;s:16:"large_feed_limit";i:1000;s:26:"cron_processing_time_limit";i:120;s:6:"secure";i:1;s:11:"log_storage";i:5;s:10:"cron_sleep";s:0:"";s:4:"port";s:0:"";s:16:"google_client_id";s:0:"";s:16:"google_signature";s:0:"";s:8:"licenses";a:0:{}s:8:"statuses";a:0:{}}', 'yes'),
(140, 'pmxi_is_migrated', '4.2.8', 'yes'),
(146, 'tto_options', 'a:3:{s:8:"autosort";s:1:"1";s:9:"adminsort";s:1:"1";s:10:"capability";s:15:"install_plugins";}', 'yes'),
(154, 'itsec_four_oh_four', 'a:5:{s:7:"enabled";b:0;s:12:"check_period";i:5;s:15:"error_threshold";i:20;s:10:"white_list";a:9:{i:0;s:12:"/favicon.ico";i:1;s:11:"/robots.txt";i:2;s:21:"/apple-touch-icon.png";i:3;s:33:"/apple-touch-icon-precomposed.png";i:4;s:17:"/wp-content/cache";i:5;s:18:"/browserconfig.xml";i:6;s:16:"/crossdomain.xml";i:7;s:11:"/labels.rdf";i:8;s:27:"/trafficbasedsspsitemap.xml";}s:5:"types";a:5:{i:0;s:4:".jpg";i:1;s:5:".jpeg";i:2;s:4:".png";i:3;s:4:".gif";i:4;s:4:".css";}}', 'yes'),
(155, 'itsec_away_mode', 'a:4:{s:7:"enabled";b:0;s:4:"type";b:0;s:5:"start";i:1;s:3:"end";i:1;}', 'yes'),
(158, 'itsec_brute_force', 'a:5:{s:7:"enabled";b:0;s:17:"max_attempts_host";i:5;s:17:"max_attempts_user";i:10;s:12:"check_period";i:5;s:14:"auto_ban_admin";b:0;}', 'yes'),
(160, 'itsec_file_change', 'a:8:{s:7:"enabled";b:0;s:5:"split";b:0;s:9:"file_list";a:0:{}s:6:"method";b:1;s:5:"types";a:6:{i:0;s:4:".jpg";i:1;s:5:".jpeg";i:2;s:4:".png";i:3;s:4:".log";i:4;s:3:".mo";i:5;s:3:".po";}s:5:"email";b:1;s:8:"last_run";i:0;s:12:"notify_admin";b:1;}', 'yes'),
(162, 'itsec_ssl', 'a:3:{s:8:"frontend";i:0;s:5:"admin";b:0;s:5:"login";b:0;}', 'yes'),
(164, 'itsec_strong_passwords', 'a:2:{s:7:"enabled";b:0;s:4:"roll";s:13:"administrator";}', 'yes'),
(175, 'itsec_active_modules', 'a:11:{s:9:"ban-users";b:1;s:11:"brute-force";b:1;s:6:"backup";b:1;s:19:"network-brute-force";b:1;s:16:"strong-passwords";b:1;s:16:"wordpress-tweaks";b:1;s:13:"404-detection";b:1;s:9:"away-mode";b:0;s:11:"file-change";b:0;s:3:"ssl";b:0;s:13:"system-tweaks";b:1;}', 'yes'),
(178, 'itsec-storage', 'a:13:{s:6:"global";a:31:{s:11:"write_files";b:1;s:15:"lockout_message";s:5:"error";s:20:"user_lockout_message";s:64:"You have been locked out due to too many invalid login attempts.";s:25:"community_lockout_message";s:77:"Your IP address has been flagged as a threat by the iThemes Security network.";s:9:"blacklist";b:1;s:15:"blacklist_count";i:3;s:16:"blacklist_period";i:7;s:14:"lockout_period";i:15;s:18:"lockout_white_list";a:0:{}s:8:"log_type";s:8:"database";s:12:"log_rotation";i:14;s:12:"log_location";s:64:"C:\\wamp\\www\\pentaschool/wp-content/uploads/ithemes-security/logs";s:16:"show_error_codes";b:0;s:14:"allow_tracking";b:0;s:14:"proxy_override";b:0;s:14:"hide_admin_bar";b:0;s:24:"infinitewp_compatibility";b:0;s:10:"nginx_file";s:34:"C:\\wamp\\www\\pentaschool/nginx.conf";s:11:"did_upgrade";b:0;s:8:"log_info";s:14:"pentaschool-Zi";s:25:"show_new_dashboard_notice";b:0;s:19:"show_security_check";b:0;s:16:"digest_last_sent";N;s:15:"digest_messages";N;s:5:"build";i:4078;s:20:"activation_timestamp";i:1467890782;s:9:"lock_file";b:0;s:12:"digest_email";b:0;s:19:"email_notifications";b:1;s:18:"notification_email";a:1:{i:0;s:18:"holevi96@gmail.com";}s:12:"backup_email";a:1:{i:0;s:18:"holevi96@gmail.com";}}s:13:"404-detection";a:4:{s:12:"check_period";i:5;s:15:"error_threshold";i:20;s:10:"white_list";a:9:{i:0;s:12:"/favicon.ico";i:1;s:11:"/robots.txt";i:2;s:21:"/apple-touch-icon.png";i:3;s:33:"/apple-touch-icon-precomposed.png";i:4;s:17:"/wp-content/cache";i:5;s:18:"/browserconfig.xml";i:6;s:16:"/crossdomain.xml";i:7;s:11:"/labels.rdf";i:8;s:27:"/trafficbasedsspsitemap.xml";}s:5:"types";a:5:{i:0;s:4:".jpg";i:1;s:5:".jpeg";i:2;s:4:".png";i:3;s:4:".gif";i:4;s:4:".css";}}s:9:"ban-users";a:4:{s:7:"default";b:0;s:16:"enable_ban_lists";b:1;s:9:"host_list";a:0:{}s:10:"agent_list";a:0:{}}s:11:"brute-force";a:4:{s:17:"max_attempts_host";i:5;s:17:"max_attempts_user";i:10;s:12:"check_period";i:5;s:14:"auto_ban_admin";b:0;}s:6:"backup";a:9:{s:9:"all_sites";b:0;s:6:"method";i:1;s:8:"location";s:67:"C:\\wamp\\www\\pentaschool/wp-content/uploads/ithemes-security/backups";s:6:"retain";i:0;s:3:"zip";b:1;s:7:"exclude";a:3:{i:0;s:9:"itsec_log";i:1;s:10:"itsec_temp";i:2;s:14:"itsec_lockouts";}s:7:"enabled";b:0;s:8:"interval";i:3;s:8:"last_run";i:0;}s:11:"file-change";a:9:{s:5:"split";b:0;s:9:"file_list";a:0:{}s:6:"method";s:7:"exclude";s:5:"types";a:6:{i:0;s:4:".jpg";i:1;s:5:".jpeg";i:2;s:4:".png";i:3;s:4:".log";i:4;s:3:".mo";i:5;s:3:".po";}s:5:"email";b:1;s:8:"last_run";i:1467804591;s:12:"notify_admin";b:1;s:10:"last_chunk";b:0;s:12:"show_warning";b:0;}s:12:"hide-backend";a:6:{s:7:"enabled";b:1;s:4:"slug";s:7:"belepes";s:12:"theme_compat";b:1;s:17:"theme_compat_slug";s:9:"not_found";s:16:"post_logout_slug";s:0:"";s:8:"register";s:15:"wp-register.php";}s:19:"network-brute-force";a:5:{s:7:"api_key";s:32:"jvjppFZhIw94iYBd5746TBDLyc9cVmw0";s:10:"api_secret";s:128:"KmS67vel601B227Y9XKB7g2b6f9uy7F0rO23ZfewDJ56c7Elg7cJ5yc1fNuNfeC56V802zw9dAKvYUBxLO911olw756l1f9c3eCshq5S0qbm0I389R2epc19t722G8cS";s:10:"enable_ban";b:1;s:13:"updates_optin";b:1;s:7:"api_nag";b:0;}s:16:"strong-passwords";a:1:{s:4:"role";s:13:"administrator";}s:13:"system-tweaks";a:10:{s:18:"directory_browsing";b:1;s:11:"uploads_php";b:1;s:13:"protect_files";b:0;s:15:"request_methods";b:0;s:24:"suspicious_query_strings";b:0;s:22:"non_english_characters";b:0;s:16:"long_url_strings";b:0;s:17:"write_permissions";b:0;s:11:"plugins_php";b:0;s:10:"themes_php";b:0;}s:16:"wordpress-tweaks";a:12:{s:18:"wlwmanifest_header";b:0;s:14:"edituri_header";b:0;s:12:"comment_spam";b:0;s:11:"file_editor";b:1;s:14:"disable_xmlrpc";i:0;s:22:"allow_xmlrpc_multiauth";b:0;s:8:"rest_api";s:15:"restrict-access";s:12:"login_errors";b:0;s:21:"force_unique_nicename";b:0;s:27:"disable_unused_author_pages";b:0;s:16:"block_tabnapping";b:0;s:21:"valid_user_login_type";s:4:"both";}s:19:"notification-center";a:6:{s:9:"last_sent";a:1:{s:6:"digest";N;}s:9:"resend_at";a:0:{}s:4:"data";a:0:{}s:11:"mail_errors";a:3:{s:13:"5a05d109d34b1";a:3:{s:5:"error";a:2:{s:7:"message";s:36:"Could not instantiate mail function.";s:4:"code";s:14:"wp_mail_failed";}s:4:"time";i:1510330628;s:12:"notification";s:12:"hide-backend";}s:13:"5a621923eee15";a:3:{s:5:"error";a:2:{s:7:"message";s:36:"Could not instantiate mail function.";s:4:"code";s:14:"wp_mail_failed";}s:4:"time";i:1516378397;s:12:"notification";s:7:"lockout";}s:13:"5a621941a68e7";a:3:{s:5:"error";a:2:{s:7:"message";s:36:"Could not instantiate mail function.";s:4:"code";s:14:"wp_mail_failed";}s:4:"time";i:1516378428;s:12:"notification";s:7:"lockout";}}s:13:"notifications";a:5:{s:6:"digest";a:5:{s:8:"schedule";s:5:"daily";s:7:"enabled";b:0;s:9:"user_list";a:1:{i:0;s:18:"role:administrator";}s:15:"previous_emails";a:0:{}s:7:"subject";N;}s:7:"lockout";a:4:{s:7:"enabled";b:1;s:9:"user_list";a:1:{i:0;s:18:"role:administrator";}s:15:"previous_emails";a:0:{}s:7:"subject";N;}s:6:"backup";a:1:{s:10:"email_list";a:1:{i:0;s:18:"holevi96@gmail.com";}}s:11:"file-change";a:0:{}s:12:"hide-backend";a:3:{s:9:"user_list";a:1:{i:0;s:18:"role:administrator";}s:7:"subject";s:31:"WordPress Login Address Changed";s:7:"message";s:144:"The login address for {{ $site_title }} has changed. The new login address is {{ $login_url }}. You will be unable to use the old login address.";}}s:12:"admin_emails";a:1:{i:0;s:18:"holevi96@gmail.com";}}s:10:"admin-user";a:2:{s:12:"new_username";s:8:"holevi96";s:9:"change_id";b:1;}}', 'yes'),
(180, 'cptui_post_types', 'a:7:{s:11:"tanfolyamok";a:27:{s:4:"name";s:11:"tanfolyamok";s:5:"label";s:11:"Tanfolyamok";s:14:"singular_label";s:9:"Tanfolyam";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:4:"true";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:4:"true";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:1:{i:0;s:8:"category";}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}s:7:"tesztek";a:27:{s:4:"name";s:7:"tesztek";s:5:"label";s:7:"Tesztek";s:14:"singular_label";s:5:"Teszt";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}s:11:"referenciak";a:27:{s:4:"name";s:11:"referenciak";s:5:"label";s:12:"Referenciák";s:14:"singular_label";s:10:"Referencia";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:1:{i:0;s:8:"category";}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}s:16:"tanfolyam-kiiras";a:27:{s:4:"name";s:16:"tanfolyam-kiiras";s:5:"label";s:20:"Tanfolyam kiírások";s:14:"singular_label";s:8:"Kiírás";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}s:7:"tanarok";a:27:{s:4:"name";s:7:"tanarok";s:5:"label";s:8:"Tanárok";s:14:"singular_label";s:5:"Tanar";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}s:8:"helyszin";a:27:{s:4:"name";s:8:"helyszin";s:5:"label";s:11:"Helyszínek";s:14:"singular_label";s:8:"Helyszin";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}s:9:"ajanlasok";a:27:{s:4:"name";s:9:"ajanlasok";s:5:"label";s:11:"Ajánlások";s:14:"singular_label";s:9:"Ajánlás";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:7:"show_ui";s:4:"true";s:17:"show_in_nav_menus";s:4:"true";s:12:"show_in_rest";s:5:"false";s:9:"rest_base";s:0:"";s:11:"has_archive";s:5:"false";s:18:"has_archive_string";s:0:"";s:19:"exclude_from_search";s:5:"false";s:15:"capability_type";s:4:"post";s:12:"hierarchical";s:5:"false";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:13:"menu_position";s:0:"";s:12:"show_in_menu";s:4:"true";s:19:"show_in_menu_string";s:0:"";s:9:"menu_icon";s:0:"";s:8:"supports";a:3:{i:0;s:5:"title";i:1;s:6:"editor";i:2;s:9:"thumbnail";}s:10:"taxonomies";a:0:{}s:6:"labels";a:21:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:7:"add_new";s:0:"";s:12:"add_new_item";s:0:"";s:9:"edit_item";s:0:"";s:8:"new_item";s:0:"";s:9:"view_item";s:0:"";s:12:"search_items";s:0:"";s:9:"not_found";s:0:"";s:18:"not_found_in_trash";s:0:"";s:6:"parent";s:0:"";s:14:"featured_image";s:0:"";s:18:"set_featured_image";s:0:"";s:21:"remove_featured_image";s:0:"";s:18:"use_featured_image";s:0:"";s:8:"archives";s:0:"";s:16:"insert_into_item";s:0:"";s:21:"uploaded_to_this_item";s:0:"";s:17:"filter_items_list";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:15:"custom_supports";s:0:"";}}', 'yes'),
(191, 'acf_version', '5.2.5', 'yes'),
(231, 'cpto_options', 'a:6:{s:23:"show_reorder_interfaces";a:4:{s:4:"post";s:4:"show";s:10:"attachment";s:4:"show";s:7:"tesztek";s:4:"show";s:11:"referenciak";s:4:"show";}s:8:"autosort";i:1;s:9:"adminsort";i:1;s:17:"archive_drag_drop";i:1;s:10:"capability";s:4:"read";s:21:"navigation_sort_apply";i:1;}', 'yes'),
(233, 'CPT_configured', 'TRUE', 'yes'),
(246, 'metronet-reorder-posts', 'a:2:{s:10:"post_types";a:7:{s:4:"post";s:2:"on";s:4:"page";s:2:"on";s:3:"acf";s:3:"off";s:11:"tanfolyamok";s:2:"on";s:7:"tesztek";s:2:"on";s:11:"referenciak";s:2:"on";s:16:"tanfolyam-kiiras";s:2:"on";}s:10:"menu_order";a:7:{s:4:"post";a:2:{s:7:"orderby";s:4:"none";s:5:"order";s:4:"DESC";}s:4:"page";a:2:{s:7:"orderby";s:4:"none";s:5:"order";s:4:"DESC";}s:3:"acf";a:2:{s:7:"orderby";s:4:"none";s:5:"order";s:4:"DESC";}s:11:"tanfolyamok";a:2:{s:7:"orderby";s:10:"menu_order";s:5:"order";s:4:"DESC";}s:7:"tesztek";a:2:{s:7:"orderby";s:4:"none";s:5:"order";s:4:"DESC";}s:11:"referenciak";a:2:{s:7:"orderby";s:4:"none";s:5:"order";s:4:"DESC";}s:16:"tanfolyam-kiiras";a:2:{s:7:"orderby";s:4:"none";s:5:"order";s:4:"DESC";}}}', 'yes'),
(283, 'queue_flush_rules', '0', 'yes'),
(285, 'tanfolyamok_structure', '/%category%/%postname%/', 'yes'),
(286, 'tesztek_structure', '/%postname%/', 'yes'),
(287, 'referenciak_structure', '/%postname%/', 'yes'),
(337, 'category_children', 'a:0:{}', 'yes'),
(422, 'wp_php_console', 'a:6:{s:2:"ip";s:0:"";s:8:"password";s:10:"Jelszo3372";s:8:"register";b:0;s:5:"short";b:0;s:3:"ssl";b:0;s:5:"stack";b:0;}', 'yes'),
(432, 'mark_posts_settings', 'a:2:{s:20:"mark_posts_posttypes";a:3:{i:0;s:4:"post";i:1;s:4:"page";i:2;s:11:"tanfolyamok";}s:20:"mark_posts_dashboard";a:1:{i:0;s:9:"dashboard";}}', 'yes'),
(434, 'marker_children', 'a:0:{}', 'yes'),
(501, 'tanfolyam-kiiras_structure', '/%postname%/', 'yes'),
(502, 'tanarok_structure', '/%postname%/', 'yes'),
(503, 'helyszin_structure', '/%postname%/', 'yes'),
(504, 'ajanlas_structure', '/%postname%/', 'yes'),
(697, 'new_post_honnan_ertesult_a_kepzesrol', 'Facebook reklám', 'no'),
(698, '_new_post_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4', 'no'),
(699, 'new_post_mennyire_elegedett_0_értekeles', '3', 'no'),
(700, '_new_post_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30', 'no'),
(701, 'new_post_mennyire_elegedett_0_megjegyzes', 'jjj', 'no'),
(702, '_new_post_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31', 'no'),
(703, 'new_post_mennyire_elegedett', '1', 'no'),
(704, '_new_post_mennyire_elegedett', 'field_57aaff9881b2f', 'no'),
(705, 'new_post_megfelelt_e_az_elvarasainak_0_értekeles', '', 'no'),
(706, '_new_post_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e', 'no'),
(707, 'new_post_megfelelt_e_az_elvarasainak_0_megjegyzes', '', 'no'),
(708, '_new_post_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f', 'no'),
(709, 'new_post_megfelelt_e_az_elvarasainak', '1', 'no'),
(710, '_new_post_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d', 'no'),
(711, 'new_post_tananyag_felepitese_0_értekeles', '', 'no'),
(712, '_new_post_tananyag_felepitese_0_értekeles', 'field_57ab342ef4c11', 'no'),
(713, 'new_post_tananyag_felepitese_0_megjegyzes', '', 'no'),
(714, '_new_post_tananyag_felepitese_0_megjegyzes', 'field_57ab342ef4c12', 'no'),
(715, 'new_post_tananyag_felepitese', '1', 'no'),
(716, '_new_post_tananyag_felepitese', 'field_57ab342ef4c10', 'no'),
(717, 'new_post_gyakorlati_feladatok_eletszerûsege_0_értekeles', '', 'no'),
(718, '_new_post_gyakorlati_feladatok_eletszerûsege_0_értekeles', 'field_57ab3442f4c14', 'no'),
(719, 'new_post_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', '', 'no'),
(720, '_new_post_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'field_57ab3442f4c15', 'no'),
(721, 'new_post_gyakorlati_feladatok_eletszerûsege', '1', 'no'),
(722, '_new_post_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13', 'no'),
(723, 'new_post_segedanyagok_hasznalhatosaga_0_értekeles', '', 'no'),
(724, '_new_post_segedanyagok_hasznalhatosaga_0_értekeles', 'field_57ab3458f4c17', 'no'),
(725, 'new_post_segedanyagok_hasznalhatosaga_0_megjegyzes', '', 'no'),
(726, '_new_post_segedanyagok_hasznalhatosaga_0_megjegyzes', 'field_57ab3458f4c18', 'no'),
(727, 'new_post_segedanyagok_hasznalhatosaga', '1', 'no'),
(728, '_new_post_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16', 'no'),
(729, 'new_post_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', '', 'no'),
(730, '_new_post_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', 'field_57ab3468f4c1a', 'no'),
(731, 'new_post_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', '', 'no'),
(732, '_new_post_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'field_57ab3468f4c1b', 'no'),
(733, 'new_post_milyen_aranyban_szerzett_uj_ismereteket', '1', 'no'),
(734, '_new_post_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19', 'no'),
(735, 'new_post_új_ismeretek_0_értekeles', '', 'no'),
(736, '_new_post_új_ismeretek_0_értekeles', 'field_57ab3487f4c1e', 'no'),
(737, 'new_post_új_ismeretek_0_megjegyzes', '', 'no'),
(738, '_new_post_új_ismeretek_0_megjegyzes', 'field_57ab3487f4c1f', 'no'),
(739, 'new_post_új_ismeretek', '1', 'no'),
(740, '_new_post_új_ismeretek', 'field_57ab3487f4c1d', 'no'),
(741, 'new_post_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', '', 'no'),
(742, '_new_post_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', 'field_57ab34a7f4c21', 'no'),
(743, 'new_post_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', '', 'no'),
(744, '_new_post_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'field_57ab34a7f4c22', 'no'),
(745, 'new_post_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '1', 'no'),
(746, '_new_post_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20', 'no'),
(747, 'new_post_melyik_resz_tetszett_a_legjobban', '', 'no'),
(748, '_new_post_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23', 'no'),
(749, 'new_post_szakmai_felkeszultsege_0_értekeles', '', 'no'),
(750, '_new_post_szakmai_felkeszultsege_0_értekeles', 'field_57ab34e7f4c26', 'no'),
(751, 'new_post_szakmai_felkeszultsege_0_megjegyzes', '', 'no'),
(752, '_new_post_szakmai_felkeszultsege_0_megjegyzes', 'field_57ab34e7f4c27', 'no'),
(753, 'new_post_szakmai_felkeszultsege', '1', 'no'),
(754, '_new_post_szakmai_felkeszultsege', 'field_57ab34e7f4c25', 'no'),
(755, 'new_post_elõadoi_keszseg_0_értekeles', '', 'no'),
(756, '_new_post_elõadoi_keszseg_0_értekeles', 'field_57ab34f8f4c29', 'no'),
(757, 'new_post_elõadoi_keszseg_0_megjegyzes', '', 'no'),
(758, '_new_post_elõadoi_keszseg_0_megjegyzes', 'field_57ab34f8f4c2a', 'no'),
(759, 'new_post_elõadoi_keszseg', '1', 'no'),
(760, '_new_post_elõadoi_keszseg', 'field_57ab34f8f4c28', 'no'),
(761, 'new_post_segitõ_keszseg_0_értekeles', '', 'no'),
(762, '_new_post_segitõ_keszseg_0_értekeles', 'field_57ab3519f4c2d', 'no'),
(763, 'new_post_segitõ_keszseg_0_megjegyzes', '', 'no') ;
INSERT INTO `pe_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(764, '_new_post_segitõ_keszseg_0_megjegyzes', 'field_57ab3519f4c2e', 'no'),
(765, 'new_post_segitõ_keszseg', '1', 'no'),
(766, '_new_post_segitõ_keszseg', 'field_57ab3519f4c2c', 'no'),
(767, 'new_post_csoporthoz_valo_viszony_0_értekeles', '', 'no'),
(768, '_new_post_csoporthoz_valo_viszony_0_értekeles', 'field_57ab352ef4c30', 'no'),
(769, 'new_post_csoporthoz_valo_viszony_0_megjegyzes', '', 'no'),
(770, '_new_post_csoporthoz_valo_viszony_0_megjegyzes', 'field_57ab352ef4c31', 'no'),
(771, 'new_post_csoporthoz_valo_viszony', '1', 'no'),
(772, '_new_post_csoporthoz_valo_viszony', 'field_57ab352ef4c2f', 'no'),
(773, 'new_post_infrastrukturalis_kornyezet_0_értekeles', '', 'no'),
(774, '_new_post_infrastrukturalis_kornyezet_0_értekeles', 'field_57ab354ff4c34', 'no'),
(775, 'new_post_infrastrukturalis_kornyezet_0_megjegyzes', '', 'no'),
(776, '_new_post_infrastrukturalis_kornyezet_0_megjegyzes', 'field_57ab354ff4c35', 'no'),
(777, 'new_post_infrastrukturalis_kornyezet', '1', 'no'),
(778, '_new_post_infrastrukturalis_kornyezet', 'field_57ab354ff4c33', 'no'),
(779, 'new_post_összessegeben_hogy_ertekeli', '', 'no'),
(780, '_new_post_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a', 'no'),
(781, 'new_post_ertekeles', '', 'no'),
(782, '_new_post_ertekeles', 'field_57c1556a9e801', 'no'),
(828, 'backwpup_cfg_hash', 'ad7e24', 'yes'),
(829, 'backwpup_jobs', 'a:1:{i:1;a:14:{s:5:"jobid";i:1;s:10:"backuptype";s:7:"archive";s:4:"type";a:3:{i:0;s:6:"DBDUMP";i:1;s:4:"FILE";i:2;s:8:"WPPLUGIN";}s:12:"destinations";a:1:{i:0;s:6:"FOLDER";}s:4:"name";s:13:"Job with ID 1";s:14:"mailaddresslog";s:18:"holevi96@gmail.com";s:20:"mailaddresssenderlog";s:41:"BackWPup Pentaschool <holevi96@gmail.com>";s:13:"mailerroronly";b:1;s:13:"archiveformat";s:4:".zip";s:11:"archivename";s:33:"backwpup_ad7e24_%Y-%m-%d_%H-%i-%s";s:7:"lastrun";i:1509444549;s:7:"logfile";s:129:"/data/domains/pentaschool.hu/web/webroot/dev/wp-content/uploads/backwpup-ad7e24-logs/backwpup_log_ad7e24_2017-10-31_10-09-09.html";s:21:"lastbackupdownloadurl";s:147:"http://localhost/pentaschool/wp-admin/admin.php?page=backwpupbackups&action=downloadfolder&file=backwpup_32WX4JDD01_2017-10-31_10-09-09.zip&jobid=1";s:11:"lastruntime";i:169;}}', 'no'),
(830, 'backwpup_version', '3.4.4', 'yes'),
(831, 'backwpup_cfg_showadminbar', '', 'yes'),
(832, 'backwpup_cfg_showfoldersize', '', 'yes'),
(833, 'backwpup_cfg_protectfolders', '1', 'yes'),
(834, 'backwpup_cfg_jobmaxexecutiontime', '30', 'yes'),
(835, 'backwpup_cfg_jobstepretry', '3', 'yes'),
(836, 'backwpup_cfg_jobrunauthkey', '67c01123', 'yes'),
(837, 'backwpup_cfg_loglevel', 'normal_translated', 'yes'),
(838, 'backwpup_cfg_jobwaittimems', '0', 'yes'),
(839, 'backwpup_cfg_jobdooutput', '0', 'yes'),
(840, 'backwpup_cfg_maxlogs', '30', 'yes'),
(841, 'backwpup_cfg_gzlogs', '0', 'yes'),
(842, 'backwpup_cfg_logfolder', 'uploads/backwpup-ad7e24-logs/', 'yes'),
(843, 'backwpup_cfg_httpauthuser', '', 'yes'),
(844, 'backwpup_cfg_httpauthpassword', '', 'yes'),
(845, 'backwpup_messages', 'a:0:{}', 'yes'),
(885, 'custom-bulkquick-edit-settings', 'a:8:{s:7:"general";s:0:"";s:6:"export";s:40:"a:1:{s:14:"donate_version";s:5:"1.6.2";}";s:6:"import";s:0:"";s:11:"delete_data";s:0:"";s:14:"reset_defaults";s:0:"";s:14:"donate_version";s:5:"1.6.2";s:13:"admin_notices";N;s:7:"version";s:5:"1.6.2";}', 'yes'),
(925, 'cptui_taxonomies', 'a:1:{s:11:"ajanlas_cat";a:19:{s:4:"name";s:11:"ajanlas_cat";s:5:"label";s:20:"Ajánlás tanfolyama";s:14:"singular_label";s:9:"Tanfolyam";s:11:"description";s:0:"";s:6:"public";s:4:"true";s:12:"hierarchical";s:4:"true";s:7:"show_ui";s:4:"true";s:9:"query_var";s:4:"true";s:14:"query_var_slug";s:0:"";s:7:"rewrite";s:4:"true";s:12:"rewrite_slug";s:0:"";s:17:"rewrite_withfront";s:1:"1";s:20:"rewrite_hierarchical";s:1:"0";s:17:"show_admin_column";s:5:"false";s:12:"show_in_rest";s:5:"false";s:18:"show_in_quick_edit";s:0:"";s:9:"rest_base";s:0:"";s:6:"labels";a:18:{s:9:"menu_name";s:0:"";s:9:"all_items";s:0:"";s:9:"edit_item";s:0:"";s:9:"view_item";s:0:"";s:11:"update_item";s:0:"";s:12:"add_new_item";s:0:"";s:13:"new_item_name";s:0:"";s:11:"parent_item";s:0:"";s:17:"parent_item_colon";s:0:"";s:12:"search_items";s:0:"";s:13:"popular_items";s:0:"";s:26:"separate_items_with_commas";s:0:"";s:19:"add_or_remove_items";s:0:"";s:21:"choose_from_most_used";s:0:"";s:9:"not_found";s:0:"";s:8:"no_terms";s:0:"";s:21:"items_list_navigation";s:0:"";s:10:"items_list";s:0:"";}s:12:"object_types";a:1:{i:0;s:7:"ajanlas";}}}', 'yes'),
(930, 'ajanlas_cat_children', 'a:0:{}', 'yes'),
(1003, 'ertekelesek_structure', '/%postname%/', 'yes'),
(1004, 'valaszok_structure', '/%postname%/', 'yes'),
(1016, 'current_theme', 'Sage Starter Theme', 'yes'),
(1017, 'theme_mods_pentatheme', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1484912463;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(1018, 'theme_switched', '', 'yes'),
(1039, 'auto_core_update_notified', 'a:4:{s:4:"type";s:7:"success";s:5:"email";s:18:"holevi96@gmail.com";s:7:"version";s:5:"4.9.4";s:9:"timestamp";i:1518148198;}', 'no'),
(1068, 'vc_version', '4.12.1', 'yes'),
(1069, 'wpb_js_composer_license_activation_notified', 'yes', 'yes'),
(1251, 'widget_gform_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(1256, 'gravityformsaddon_gravityformswebapi_version', '1.0', 'yes'),
(1258, 'gform_enable_background_updates', '', 'yes'),
(1259, 'rg_form_version', '2.0.2.3', 'yes'),
(1260, 'gravityformsaddon_gravityformssurvey_version', '3.0.5', 'yes'),
(1319, 'rg_gforms_enable_akismet', '1', 'yes'),
(1320, 'rg_gforms_currency', '', 'yes'),
(1321, 'gform_enable_toolbar_menu', '1', 'yes'),
(1734, 'gform_upload_page_slug', 'da48169b9e3bd6d', 'yes'),
(2323, 'gform_email_count', '32', 'yes'),
(5205, 'no_taxonomy_structure', '1', 'yes'),
(5675, 'ajanlasok_structure', '/%postname%/', 'yes'),
(9890, 'gravityformsaddon_gravityformsquiz_version', '3.0.1', 'yes'),
(10754, 'theme_mods_mobius-child', 'a:2:{i:0;b:0;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1491999465;s:4:"data";a:7:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}s:9:"sidebar-2";N;s:9:"sidebar-3";N;s:9:"sidebar-4";N;s:9:"sidebar-5";N;s:9:"sidebar-6";N;}}}', 'yes'),
(10755, 'widget_themeone_most_liked_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(10756, 'widget_themeone_recent_portfolio_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(10757, 'widget_themeone_related_posts_widget', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(10762, 'redux-framework-tracking', 'a:2:{s:8:"dev_mode";b:1;s:4:"hash";s:32:"90525ec29fde009f169d965929877c5e";}', 'yes'),
(10763, 'redux_blast', '1491770230', 'yes'),
(10764, 'shop_catalog_image_size', 'a:3:{s:5:"width";s:3:"285";s:6:"height";s:3:"364";s:4:"crop";i:1;}', 'yes'),
(10765, 'shop_single_image_size', 'a:3:{s:5:"width";s:3:"500";s:6:"height";s:3:"640";s:4:"crop";i:1;}', 'yes'),
(10766, 'shop_thumbnail_image_size', 'a:3:{s:5:"width";s:3:"100";s:6:"height";s:3:"100";s:4:"crop";i:1;}', 'yes'),
(10767, 'mobius', 'a:202:{s:8:"last_tab";s:0:"";s:7:"favicon";a:5:{s:3:"url";s:65:"http://pentaschool.hu/wp-content/themes/mobius/images/favicon.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:16:"apple-touch-icon";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:9:"preloader";s:1:"1";s:13:"smooth-scroll";s:1:"1";s:13:"scroll-to-top";s:1:"1";s:13:"right-sidebar";s:1:"1";s:13:"search-button";s:1:"1";s:8:"ajax-nav";s:1:"1";s:11:"ajax-search";s:1:"1";s:12:"ajax-comment";s:1:"1";s:12:"grid-gallery";s:1:"1";s:16:"google-analytics";s:0:"";s:10:"custom-css";s:36:"                                    ";s:9:"custom-js";s:36:"                                    ";s:9:"body-font";a:8:{s:11:"font-family";s:9:"Open Sans";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"14px";}s:9:"menu-font";a:8:{s:11:"font-family";s:9:"Open Sans";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"700";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"12px";}s:7:"h1-font";a:9:{s:11:"font-family";s:15:"Source Sans Pro";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"45px";s:11:"line-height";s:4:"45px";}s:7:"h2-font";a:9:{s:11:"font-family";s:7:"Raleway";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"40px";s:11:"line-height";s:4:"46px";}s:7:"h3-font";a:9:{s:11:"font-family";s:7:"Raleway";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"500";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"20px";s:11:"line-height";s:4:"28px";}s:7:"h4-font";a:9:{s:11:"font-family";s:7:"Raleway";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"18px";s:11:"line-height";s:4:"26px";}s:7:"h5-font";a:9:{s:11:"font-family";s:7:"Raleway";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"500";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"16px";s:11:"line-height";s:4:"22px";}s:7:"h6-font";a:9:{s:11:"font-family";s:7:"Raleway";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"600";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"14px";s:11:"line-height";s:4:"20px";}s:12:"heading-font";a:9:{s:11:"font-family";s:15:"Source Sans Pro";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"700";s:7:"subsets";s:0:"";s:9:"font-size";s:4:"60px";s:11:"line-height";s:4:"60px";}s:17:"heading-grid-font";a:7:{s:11:"font-family";s:7:"Raleway";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"600";s:7:"subsets";s:0:"";}s:11:"number-font";a:7:{s:11:"font-family";s:15:"Source Sans Pro";s:12:"font-options";s:0:"";s:6:"google";s:1:"1";s:11:"font-backup";s:0:"";s:11:"font-weight";s:0:"";s:10:"font-style";s:3:"400";s:7:"subsets";s:0:"";}s:13:"accent-color1";s:7:"#ff6863";s:17:"accent-color1-txt";s:7:"#ffffff";s:13:"accent-color2";s:7:"#8976eb";s:13:"accent-color3";s:7:"#36D7B7";s:15:"body-text-light";s:7:"#e8e8e8";s:18:"heading-text-light";s:7:"#ffffff";s:14:"body-text-dark";s:7:"#999999";s:17:"heading-text-dark";s:7:"#59585b";s:10:"link-color";s:7:"#ff6863";s:12:"body-bgcolor";s:7:"#ffffff";s:10:"body-color";s:4:"dark";s:14:"second-bgcolor";s:7:"#F5F6FA";s:14:"header-bgcolor";s:7:"#ffffff";s:12:"header-color";s:7:"#646464";s:19:"header-menu-bgcolor";s:7:"#ffffff";s:17:"header-menu-color";s:7:"#999999";s:23:"header-menu-color-hover";s:7:"#59585b";s:14:"footer-bgcolor";s:7:"#565656";s:12:"footer-color";s:5:"light";s:21:"footer-bottom-bgcolor";s:7:"#3D3D3D";s:19:"footer-bottom-color";s:7:"#EBEBEB";s:15:"sidebar-bgcolor";s:7:"#ffffff";s:13:"sidebar-color";s:4:"dark";s:17:"menu-bgcolor-over";s:0:"";s:25:"menu-bgcolor-over-opacity";s:4:"0.00";s:12:"menu-bgcolor";s:7:"#ffffff";s:16:"nav-menu-bgcolor";s:7:"#F5F6FA";s:10:"menu-color";s:4:"dark";s:11:"header-logo";a:5:{s:3:"url";s:67:"http://pentaschool.hu/wp-content/themes/mobius/images/logo-dark.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:17:"header-logo-light";a:5:{s:3:"url";s:68:"http://pentaschool.hu/wp-content/themes/mobius/images/logo-light.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:18:"header-logo-height";s:2:"32";s:13:"left-nav-logo";a:5:{s:3:"url";s:67:"http://pentaschool.hu/wp-content/themes/mobius/images/logo-dark.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:14:"left-nav-image";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:12:"header-style";s:11:"header-menu";s:12:"header-fixed";s:1:"1";s:13:"header-resize";s:1:"1";s:11:"header-link";s:1:"0";s:13:"header-height";s:2:"70";s:17:"header-max-height";s:3:"100";s:14:"header-opacity";s:4:"0.90";s:21:"header-slider-opacity";s:4:"0.10";s:17:"footer-background";s:1:"0";s:10:"footer-img";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:16:"footerBg-top-txt";s:5:"light";s:16:"footerBg-bot-txt";s:7:"#EBEBEB";s:18:"footerBg-top-color";s:7:"#000000";s:18:"footerBg-bot-color";s:7:"#000000";s:20:"footerBg-top-opacity";s:4:"0.66";s:20:"footerBg-bot-opacity";s:4:"0.76";s:13:"footer-widget";s:1:"1";s:14:"footer-columns";s:1:"3";s:13:"footer-bottom";s:1:"1";s:16:"footer-copyright";s:51:"© Copyright 2014. All Rights Reserved, Mobius Inc.";s:13:"footer-social";s:1:"0";s:18:"footer-social-icon";a:2:{s:15:"Available icons";a:16:{s:7:"placebo";s:7:"placebo";s:5:"email";s:5:"Email";s:8:"facebook";s:8:"Facebook";s:7:"twitter";s:7:"Twitter";s:11:"google-plus";s:7:"Google+";s:8:"linkedin";s:8:"Linkedin";s:6:"tumblr";s:6:"Tumblr";s:8:"dribbble";s:8:"Dribbble";s:9:"pinterest";s:9:"Pinterest";s:9:"instagram";s:9:"Instagram";s:7:"youtube";s:7:"Youtube";s:12:"vimeo-square";s:5:"Vimeo";s:6:"flickr";s:6:"Flickr";s:6:"github";s:6:"Github";s:14:"stack-overflow";s:13:"Stackoverflow";s:14:"stack-exchange";s:14:"Stack-exchange";}s:12:"Footer icons";a:1:{s:7:"placebo";s:7:"placebo";}}s:9:"url-email";s:0:"";s:12:"url-facebook";s:0:"";s:11:"url-twitter";s:0:"";s:15:"url-google-plus";s:0:"";s:12:"url-linkedin";s:0:"";s:10:"url-tumblr";s:0:"";s:12:"url-dribbble";s:0:"";s:13:"url-pinterest";s:0:"";s:13:"url-instagram";s:0:"";s:11:"url-youtube";s:0:"";s:16:"url-vimeo-square";s:0:"";s:10:"url-flickr";s:0:"";s:10:"url-github";s:0:"";s:18:"url-stack-overflow";s:0:"";s:18:"url-stack-exchange";s:0:"";s:10:"map-height";s:3:"370";s:8:"map-type";s:7:"ROADMAP";s:9:"map-color";s:8:"standard";s:13:"map-draggable";s:1:"1";s:10:"zoom-level";s:2:"14";s:11:"enable-zoom";s:1:"1";s:16:"enable-animation";s:1:"1";s:12:"enable-hover";s:1:"0";s:8:"marker-1";a:5:{s:3:"url";s:73:"http://pentaschool.hu/wp-content/themes/mobius/images/mobius-marker-2.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-1";s:9:"45.169342";s:11:"longitude-1";s:8:"5.732365";s:10:"map-info-1";s:32:"Headquarter Office<br>Mobius Inc";s:8:"marker-2";a:5:{s:3:"url";s:73:"http://pentaschool.hu/wp-content/themes/mobius/images/mobius-marker-1.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-2";s:10:"45.1808330";s:11:"longitude-2";s:9:"5.7502983";s:10:"map-info-2";s:20:"Office<br>Mobius Inc";s:8:"marker-3";a:5:{s:3:"url";s:73:"http://pentaschool.hu/wp-content/themes/mobius/images/mobius-marker-1.png";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-3";s:10:"45.1735991";s:11:"longitude-3";s:9:"5.7523286";s:10:"map-info-3";s:20:"Office<br>Mobius Inc";s:8:"marker-4";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-4";s:0:"";s:11:"longitude-4";s:0:"";s:10:"map-info-4";s:0:"";s:8:"marker-5";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-5";s:0:"";s:11:"longitude-5";s:0:"";s:10:"map-info-5";s:0:"";s:8:"marker-6";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-6";s:0:"";s:11:"longitude-6";s:0:"";s:10:"map-info-6";s:0:"";s:8:"marker-7";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-7";s:0:"";s:11:"longitude-7";s:0:"";s:10:"map-info-7";s:0:"";s:8:"marker-8";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-8";s:0:"";s:11:"longitude-8";s:0:"";s:10:"map-info-8";s:0:"";s:8:"marker-9";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:10:"latitude-9";s:0:"";s:11:"longitude-9";s:0:"";s:10:"map-info-9";s:0:"";s:9:"marker-10";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:11:"latitude-10";s:0:"";s:12:"longitude-10";s:0:"";s:11:"map-info-10";s:0:"";s:20:"add-remove-locations";s:0:"";s:11:"callTo-text";s:35:"Ready to take it to the next level?";s:17:"callTo-button-url";s:21:"http://pentaschool.hu";s:9:"callTo-bg";s:7:"#f3f5f8";s:12:"callTo-color";s:7:"#59585b";s:12:"sidebar-post";s:0:"";s:21:"sidebar-post-position";s:5:"right";s:18:"Blog-layout-preset";s:1:"2";s:11:"blog-layout";s:20:"grid 5cols fullwidth";s:18:"blog-standard-wide";s:1:"0";s:9:"blog-size";s:0:"";s:11:"blog-gutter";s:1:"0";s:12:"blog-filters";s:0:"";s:15:"blog-pagination";s:4:"ajax";s:12:"blog-item-nb";s:2:"12";s:17:"blog-author-photo";s:1:"1";s:18:"blog-feature-image";s:1:"1";s:8:"blog-tag";s:1:"0";s:15:"blog-breadcrumb";s:1:"1";s:19:"blog-next-prev-post";s:1:"1";s:17:"blog-related-post";s:0:"";s:11:"blog-social";s:1:"1";s:11:"blog-author";s:1:"1";s:18:"blog-header-active";s:0:"";s:19:"blog-header-bgcolor";s:0:"";s:17:"blog-header-image";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:18:"blog-header-repeat";s:0:"";s:20:"blog-header-parallax";s:0:"";s:23:"blog-header-transparent";s:0:"";s:23:"portfolio-layout-preset";s:1:"1";s:26:"portfolio-advance-settings";s:1:"0";s:16:"portfolio-layout";s:20:"grid 5cols fullwidth";s:14:"portfolio-size";s:0:"";s:16:"portfolio-gutter";s:1:"0";s:15:"portfolio-style";s:6:"style1";s:15:"portfolio-order";s:4:"date";s:17:"portfolio-filters";s:1:"1";s:20:"portfolio-pagination";s:4:"page";s:17:"portfolio-item-nb";s:2:"16";s:23:"portfolio-feature-image";s:1:"1";s:20:"portfolio-breadcrumb";s:1:"1";s:24:"portfolio-next-prev-post";s:1:"1";s:16:"portfolio-social";s:1:"1";s:16:"portfolio-author";s:1:"1";s:17:"portfolio-comment";s:1:"1";s:17:"portfolio-sidebar";s:1:"1";s:23:"portfolio-header-active";s:0:"";s:24:"portfolio-header-bgcolor";s:0:"";s:22:"portfolio-header-image";a:5:{s:3:"url";s:0:"";s:2:"id";s:0:"";s:6:"height";s:0:"";s:5:"width";s:0:"";s:9:"thumbnail";s:0:"";}s:23:"portfolio-header-repeat";s:0:"";s:25:"portfolio-header-parallax";s:0:"";s:28:"portfolio-header-transparent";s:0:"";s:12:"callTo-pages";s:0:"";s:17:"unlimited_sidebar";s:0:"";s:17:"blog-header-color";s:0:"";s:27:"blog-header-image-alignment";s:0:"";s:22:"portfolio-header-color";s:0:"";s:32:"portfolio-header-image-alignment";s:0:"";}', 'yes'),
(10768, 'mobius-transients', 'a:4:{s:14:"changed_values";a:3:{s:13:"redux-section";s:1:"9";s:8:"last_tab";s:1:"3";s:12:"grid-gallery";s:0:"";}s:9:"last_save";i:1491996542;s:13:"last_compiler";i:1491996441;s:11:"last_import";i:1491996441;}', 'yes'),
(12318, 'backwpup_cfg_windows', '0', 'yes'),
(12320, 'backwpup_message_id_en', 'JVQWWZJAKVZSASDBOBYHSIDBNZSCAR3JOZSSAWLPOVZCAUTBORUW4Z34NB2HI4DTHIXS653POJSHA4TFONZS433SM4XXG5LQOBXXE5BPOBWHKZ3JNYXWEYLDNN3XA5LQF5ZGK5TJMV3XGL34', 'yes'),
(12321, 'backwpup_message_content_en', 'Are you happy with BackWPup? If you are satisfied with our free plugin and support, then please make us even happier and just take 30 seconds to leave a positive rating. :) We would really appreciate that and it will motivate our team to develop even more cool features for BackWPup!', 'yes'),
(12322, 'backwpup_message_button_text_en', 'Make Us Happy and Give Your Rating', 'yes'),
(12323, 'backwpup_message_url_en', 'https://wordpress.org/support/plugin/backwpup/reviews/', 'yes'),
(12324, 'backwpup_message_id_es', 'YKQUQYL2NZXXGIDGMVWGSY3FOMQHSIDEMFXG64ZAOR2SA5TBNRXXEYLDNHB3G3RBPRUHI5DQOM5C6L3XN5ZGI4DSMVZXGLTPOJTS643VOBYG64TUF5YGY5LHNFXC6YTBMNVXO4DVOAXXEZLWNFSXO4ZP', 'yes'),
(12325, 'backwpup_message_content_es', '¿Estás contento con BackWPup? Si estás satisfecho con nuestro plugin y con el soporte gratuito, por favor, haznos aún más felices e invierte sólo 30 segundos en dejar una calificación positiva. :) ¡Estaremos muy agradecidos y eso motivará a nuestro equipo a desarrollar características aún más interesantes para BackWPup!', 'yes'),
(12326, 'backwpup_message_button_text_es', '¡Haznos felices y danos tu valoración!', 'yes'),
(12327, 'backwpup_message_url_es', 'https://wordpress.org/support/plugin/backwpup/reviews/', 'yes'),
(12328, 'backwpup_message_id_fr', 'IRXW43TFFVXG65LTEB2W4ZJANZXXIZJAOBXXG2LUNF3GK7DIOR2HA4Z2F4XXO33SMRYHEZLTOMXG64THF5ZXK4DQN5ZHIL3QNR2WO2LOF5RGCY3LO5YHK4BPOJSXM2LFO5ZS67D4', 'yes'),
(12329, 'backwpup_message_content_fr', 'Êtes-vous satisfait de BackWPup ? Si vous êtes satisfait de notre extension gratuite et du support, alors veuillez nous faire plaisir et prendre seulement 30 secondes pour laisser une note positive. :) Nous apprécions vraiment cela et ceci motivera notre équipe à développer des fonctionnalités en plus cool pour BackWPup!', 'yes'),
(12330, 'backwpup_message_button_text_fr', 'Donne-nous une note positive', 'yes'),
(12331, 'backwpup_message_url_fr', 'https://wordpress.org/support/plugin/backwpup/reviews/', 'yes'),
(12332, 'backwpup_message_id_de', 'JVQWG2BAOVXHGIDHNTB3YY3LNRUWG2BAOVXGIIDHNFRCA5LOOMQGIZLJNZSSAQTFO5SXE5DVNZTXY2DUORYHGORPF53W64TEOBZGK43TFZXXEZZPON2XA4DPOJ2C64DMOVTWS3RPMJQWG23XOB2XAL3SMV3GSZLXOMXXY7D4', 'yes'),
(12333, 'backwpup_message_content_de', 'Bist du glücklich mit BackWPup? Wenn du mit unserem freien Plugin und unserem Support zufrieden bist, dann mach auch uns glücklich und gib uns 30 Sekunden deiner Zeit, um uns eine gute Bewertung zu hinterlassen. :) Wir würden uns wirklich sehr darüber freuen, es würde uns motivieren, noch coolere Features für BackWPup zu entwickeln!', 'yes'),
(12334, 'backwpup_message_button_text_de', 'Mach uns glücklich und gib uns deine Bewertung', 'yes'),
(12335, 'backwpup_message_url_de', 'https://wordpress.org/support/plugin/backwpup/reviews/', 'yes'),
(13094, 'widget_media_audio', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(13095, 'widget_media_image', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(13096, 'widget_media_video', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(13097, 'widget_custom_html', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes'),
(13098, 'db_upgraded', '', 'yes'),
(13107, 'can_compress_scripts', '0', 'no'),
(13128, 'itsec_temp_whitelist_ip', 'a:1:{s:13:"81.183.153.51";i:1519295910;}', 'no'),
(13182, 'theme_mods_twentysixteen', 'a:2:{s:18:"custom_css_post_id";i:-1;s:16:"sidebars_widgets";a:2:{s:4:"time";i:1513178380;s:4:"data";a:2:{s:19:"wp_inactive_widgets";a:0:{}s:9:"sidebar-1";a:6:{i:0;s:8:"search-2";i:1;s:14:"recent-posts-2";i:2;s:17:"recent-comments-2";i:3;s:10:"archives-2";i:4;s:12:"categories-2";i:5;s:6:"meta-2";}}}}', 'yes'),
(13730, 'theme_mods_penta', 'a:2:{i:0;b:0;s:18:"custom_css_post_id";i:-1;}', 'yes'),
(13979, 'wp-all-import-pro_85b8495febade7a221f67b0bca7d59d9', 'O:8:"stdClass":15:{s:11:"new_version";s:5:"4.4.8";s:14:"stable_version";s:5:"4.4.8";s:4:"name";s:13:"WP All Import";s:4:"slug";s:17:"wp-all-import-pro";s:3:"url";s:67:"http://www.wpallimport.com/downloads/wp-all-import-pro/?changelog=1";s:12:"last_updated";s:19:"2017-11-16 18:37:00";s:8:"homepage";s:55:"http://www.wpallimport.com/downloads/wp-all-import-pro/";s:7:"package";s:179:"http://www.wpallimport.com/edd-sl/package_download/MTU0NzkxNDY2NTo6MTc0ODo0MzJkYTA2M2QzNmQ4MDhmYWZmOWU1MDhlNGQyNTY3ODpodHRwQC8vZGV2LnBlbnRhc2Nob29sLmh1OjA=?version=4.2.8&signature";s:13:"download_link";s:179:"http://www.wpallimport.com/edd-sl/package_download/MTU0NzkxNDY2NTo6MTc0ODo0MzJkYTA2M2QzNmQ4MDhmYWZmOWU1MDhlNGQyNTY3ODpodHRwQC8vZGV2LnBlbnRhc2Nob29sLmh1OjA=?version=4.2.8&signature";s:8:"sections";a:2:{s:11:"description";s:129:"<p>Learn more about WP All Import at <a href="https://www.wpallimport.com/" target="_blank">https://www.wpallimport.com/</a></p>\n";s:9:"changelog";s:16960:"<p>4.5.0</p>\n<ul>\n<li>improvement: Make the WooCo Short Description expandable</li>\n<li>improvement: show notice when function editor is not saved</li>\n<li>improvement: added timestamp to import log lines</li>\n<li>improvement: added support for bmp images</li>\n<li>improvement: added new action pmxi_before_post_import_{$addon}</li>\n<li>security fix: patch XSS exploit</li>\n<li>bug fix: import pages hierarchy</li>\n<li>bug fix: error in pclzip.lib.php with php 7.1</li>\n<li>bug fix: import taxonomies hierarchy</li>\n<li>bug fix: json to xml convertation</li>\n<li>bug fix: import password protected feeds with port defined</li>\n</ul>\n<p>4.4.9</p>\n<ul>\n<li>improvement: custom fields detection</li>\n<li>improvement: new action wp_all_import_post_skipped</li>\n<li>improvement: updated history page title</li>\n<li>improvement: optimize large imports deletion</li>\n<li>improvement: added import friendly name to confirm screen</li>\n<li>improvement: sql query optimization on manage imports screen</li>\n<li>improvement: added wp_all_import_shard_delay filter</li>\n<li>improvement: added wp_all_import_images_uploads_dir filter</li>\n<li>bug fix: compatibility with WPML</li>\n<li>bug fix: generation image filename</li>\n<li>bug fix: wp_all_import_specified_records filter</li>\n</ul>\n<p>4.4.8</p>\n<ul>\n<li>improvement: added hungarian translation</li>\n<li>bug fix: csv headers generation</li>\n<li>bug fix: import template from Import Settings works again</li>\n<li>bug fix: users no longer logged out when user is update via import</li>\n<li>bug fix: images with encoded quotes</li>\n</ul>\n<p>4.4.7</p>\n<ul>\n<li>bug fix: cron job completed early for imports with xpath</li>\n<li>bug fix: csv headers with non latin characters</li>\n</ul>\n<p>4.4.6</p>\n<ul>\n<li>bug fix: cron job un-triggered on timeout error</li>\n</ul>\n<p>4.4.5</p>\n<ul>\n<li>bug fix: import xls from dropbox</li>\n<li>bug fix: template preview</li>\n</ul>\n<p>4.4.4</p>\n<ul>\n<li>improvement: new filter \'wp_all_import_phpexcel_delimiter\'</li>\n<li>improvement: new filter \'wp_all_import_is_trim_parsed_data\'</li>\n<li>improvement: added new \'filter wp_all_import_skip_x_csv_rows\'</li>\n<li>improvement: added csv delimiter setting to import options screen</li>\n<li>bug fix: taxonomies dropdown list</li>\n<li>bug fix: cron job was never untriggered when calling to undefined function</li>\n<li>bug fix: taxonomies preview</li>\n<li>bug fix: import duplicate tags</li>\n<li>bug fix: importing taxonomy terms that already exist in a different taxonomies</li>\n</ul>\n<p>4.4.3</p>\n<ul>\n<li>bug fix: parsing images for newly added records</li>\n<li>bug fix: the event calendar conflict</li>\n</ul>\n<p>4.4.2</p>\n<ul>\n<li>improvement: added new filter wp_all_import_phpexcel_object to modify excel data before import</li>\n<li>bug fix: search for images ending with underscores in media</li>\n<li>bug fix: import hierarchical posts and pages</li>\n<li>bug fix: import custom post type page templates</li>\n<li>bug fix: matching taxonomies by name</li>\n<li>bug fix: custom fields validation</li>\n</ul>\n<p>4.4.1</p>\n<ul>\n<li>improvement: compatibility with PHP 7.x</li>\n<li>improvement: search for existing attachments option</li>\n<li>improvement: new filter for file path of functions.php file</li>\n<li>bug fix: images preview</li>\n<li>bug fix: improved matching for images similar to image.com.png</li>\n</ul>\n<p>4.4.0</p>\n<ul>\n<li>new feature: added import taxonomies feature</li>\n<li>bug fix: hierarchy taxonomies preview</li>\n<li>bug fix: empty logs folder generation</li>\n<li>bug fix: \'Keep images currently in Media Library\' option for add-ons</li>\n<li>bug fix: import bundles with gz files</li>\n<li>bug fix: custom functions for attachments</li>\n</ul>\n<p>4.3.2</p>\n<ul>\n<li>improvement: \'Force Stream Reader\' setting</li>\n<li>improvement: tar + gz compression support for remote feeds</li>\n<li>improvement: new filter \'wp_all_import_auto_create_csv_headers\'</li>\n<li>improvement: new filter \'wp_all_import_is_base64_images_allowed\'</li>\n<li>improvement: new filter \'wp_all_import_set_post_terms\' to leave a specific category alone when a post is being updated</li>\n<li>bug fix: cron import timeout when set missing outofstock option is enabled</li>\n<li>bug fix: nodes navigation for xpath like /news/item</li>\n<li>bug fix: frozen import template screen for cyrillic XML feeds</li>\n<li>bug fix: conflict between taxonomies & user import</li>\n<li>bug fix: creating users with the same email</li>\n<li>bug fix: enable keep line breaks option by default</li>\n<li>bug fix: composer namespace conflict</li>\n<li>bug fix: images preview when wp is in subdirectory</li>\n<li>bug fix: \'Instead of deletion, set Custom Field\' option for users import</li>\n</ul>\n<p>4.3.1</p>\n<ul>\n<li>fixed issue with libxml 2.9.3</li>\n<li>execute \'pmxi_article_data\' filter for all posts ( new & existing )</li>\n</ul>\n<p>4.3.0</p>\n<ul>\n<li>added de_CH translation</li>\n<li>added support for .svg images</li>\n<li>added possibility for import excerpts for pages</li>\n<li>added new filter \'wp_all_import_specified_records\'</li>\n<li>added new filter \'wp_all_import_is_post_to_delete\'</li>\n<li>fixed saving function editor</li>\n<li>fixed custom fields mapping rules with \'0\' value</li>\n<li>fixed termination of the import if the "Delete source XML file after importing" is checked</li>\n<li>disable XMLReader stream filter for HHVM</li>\n<li>improve search for existing images in media gallery</li>\n</ul>\n<p>4.2.9</p>\n<ul>\n<li>fixed error messages on step 4</li>\n<li>fixed renaming image files</li>\n<li>fixed delete missing records option</li>\n<li>fixed csv to xml convertation in case when there are some equal titles in csv file</li>\n<li>stop using $HTTP_RAW_POST_DATA for PHP 7.x compatibility</li>\n<li>added new action \'pmxi_missing_post\'</li>\n</ul>\n<p>4.2.8</p>\n<ul>\n<li>update required database tables</li>\n</ul>\n<p>4.2.7</p>\n<ul>\n<li>fixed detecting root nodes with colons in names</li>\n<li>fixed php notice "Undefined variable: existing_meta_keys"</li>\n<li>fixed rendering special chars in function editor</li>\n<li>fixed css for WordPress 4.4</li>\n<li>added feature to delete only posts not import</li>\n<li>added feature to download template/bundle from import settings</li>\n<li>added new option for importing images "Use images currently in Media Library"</li>\n<li>remove periods to hyphens convertation in image name</li>\n<li>auto detect dropbox URLs and change to dl=1</li>\n<li>changed comma delimiting behavior/UI in image meta</li>\n</ul>\n<p>4.2.6</p>\n<ul>\n<li>fixed preview prices</li>\n<li>fixed counting XML nodes</li>\n</ul>\n<p>4.2.5</p>\n<ul>\n<li>fixed \'Delete source XML file after importing\' option</li>\n<li>fixed ‘Instead of deletion, change post status to Draft’ option</li>\n<li>fixed reading XML files with NS in element names</li>\n<li>added ‘WooCommerce Order’ to post type list on step 1</li>\n</ul>\n<p>4.2.4</p>\n<ul>\n<li>fixed duplicate matching by custom field</li>\n<li>fixed error messages on step1 in case when server throws fatal error e.q. time limit exception</li>\n<li>fixed option "Delete posts that are no longer present in your file", now it works with empty CSV files which has only one header row</li>\n<li>fixed importing custom fields with the same name</li>\n<li>fixed custom functions in images preview</li>\n<li>added es_ES translation</li>\n<li>added de_DE translation</li>\n<li>added iterative ajax delete process ( deleting associated posts )</li>\n</ul>\n<p>4.2.3</p>\n<ul>\n<li>Fixed removing uploaded XML source file on re-run process</li>\n</ul>\n<p>4.2.2</p>\n<ul>\n<li>Fixed saving function editor</li>\n</ul>\n<p>4.2.1</p>\n<ul>\n<li>fixed duplicate matching by custom field ( cron )</li>\n<li>fixed converting image filenames to lowercase</li>\n<li>fixed import html to image description</li>\n<li>fixed import _wp_old_slug</li>\n<li>added Post ID to manual record matching</li>\n<li>added \'Comment status\' to \'Choose data to update\' section</li>\n<li>added \'cancel\' to cron API /wp-cron.php?import_key=Kt&amp;import_id=407&amp;action=cancel</li>\n<li>added function editor</li>\n</ul>\n<p>4.2.0</p>\n<ul>\n<li>fixed parsing CSV with empty lines</li>\n<li>fixed parsing multiple IF statements</li>\n<li>fixed preview in case when ‘Disable the visual editor when writing’ is enabled</li>\n<li>fixed conflict with WooCommerce - Store Exporter Deluxe</li>\n<li>added possibility to start synchronized cron requests &amp;sync=1</li>\n<li>added notifications for required addons</li>\n<li>added support for wp all export bundle</li>\n<li>added support for manual import bundle</li>\n<li>added feature \'click to download import file\'</li>\n<li>added validation for excerpt and images sections</li>\n<li>added auto-detect a broken Unique ID notification</li>\n<li>added import template notifications</li>\n<li>removed support for importing WooCommerce Orders</li>\n<li>changed absolute paths to relative in db</li>\n<li>updated cron response messages</li>\n<li>moved uploaded files to \'Use existing\' dropdown</li>\n</ul>\n<p>4.1.7</p>\n<ul>\n<li>added support for Excel files ( .xls, .xlsx )</li>\n<li>added new option \'Do not remove images from media gallery\' on import<br />\nsettings screen</li>\n<li>added new options to taxonomies import \'Try to match terms to<br />\nexisting child Product Categories\' &amp; \'Only assign Products to the<br />\nimported Product Category, not the entire hierarchy\'</li>\n<li>fixed excessive update requests</li>\n<li>added options to \'Delete associated posts</li>\n</ul>\n<p>4.1.6</p>\n<ul>\n<li>load ini_set only on plugins pages</li>\n<li>fixed saving import template</li>\n<li>added import post format via XPath</li>\n</ul>\n<p>4.1.5</p>\n<ul>\n<li>fixed import page template</li>\n<li>added a second argument to pmxi_saved_post action ( SimpleXML object ) of current record</li>\n</ul>\n<p>4.1.4</p>\n<ul>\n<li>fixed Apply mapping rules before splitting via separator symbol for manual hierarchy</li>\n<li>fixed path equal or less than</li>\n<li>fixed changing unique key when moving back from confirm screen</li>\n<li>fixed override page template</li>\n<li>fixed unlink images on deleting missing posts</li>\n<li>updated wp_all_import_is_post_to_update filter with second argument XML node as array</li>\n<li>updated compatibility with WP All Export</li>\n<li>added filter wp_all_import_feed_type</li>\n<li>added possibility to use php to calculate URL on first step [add_to_url("https://google.com/")]</li>\n</ul>\n<p>4.1.3</p>\n<ul>\n<li>fixed un triggering issue on cron jobs for empty files</li>\n<li>changed updater priority from 10 to 20</li>\n<li>added post parent option for all hierarchical CPT</li>\n</ul>\n<p>4.1.2</p>\n<ul>\n<li>Important security fixes - additional hardening, prevention of blind SQL injection and reflected XSS attacks</li>\n</ul>\n<p>4.1.1</p>\n<ul>\n<li>critical security fix - stopping non-logged in users from accessing adminInit https://www.wpallimport.com/2015/02/wp-import-4-1-1-mandatory-security-update/</li>\n<li>added new filter wp_all_import_is_post_to_update to skip needed posts add_filter(\'wp_all_import_is_post_to_update\', \'is_post_to_update\', 10, 1);</li>\n<li>added new option Search for existing attachments to prevent duplicates in media library</li>\n<li>fixed imports pagination</li>\n<li>fixed preview taxonomies</li>\n<li>fixed upload folder creation when \'upload_dir\' filter defined</li>\n<li>fixed db schema for wpmu when new site added</li>\n</ul>\n<p>4.1.0</p>\n<ul>\n<li>fixed cron execution when titles are not defined</li>\n<li>added an option to separate hierarchy groups via symbol</li>\n<li>added separator symbol for manually nested taxonomies</li>\n</ul>\n<p>4.0.9</p>\n<ul>\n<li>added license key setting for automatic update</li>\n<li>added option search images through attachments</li>\n<li>added option assign term to the bottom level term in the hierarchy</li>\n</ul>\n<p>4.0.8</p>\n<ul>\n<li>fixed taxonomies preview</li>\n<li>fixed import meta description for images</li>\n<li>added feature to assign posts to needed terms</li>\n<li>added new option for taxonomies Apply mapping rules before splitting via separator symbol</li>\n<li>added set with XPath option for comment status, ping status, page parent, page template</li>\n</ul>\n<p>4.0.7</p>\n<ul>\n<li>fixed feed detection for rss chanels</li>\n<li>fixed parsing json data</li>\n<li>fixed add only new images option</li>\n<li>fixed delete missing records option</li>\n<li>added ability to import custom fields with the same name</li>\n<li>added port setting</li>\n</ul>\n<p>4.0.6</p>\n<ul>\n<li>fixed encoding for taxonomies mapping</li>\n<li>optimization for delete missing records option</li>\n<li>fixed feed type auto-detection</li>\n<li>fixed changes that related to _wp_page_template meta data</li>\n</ul>\n<p>4.0.5</p>\n<ul>\n<li>fixed template parsing when php function arguments contains an array()</li>\n<li>fixed error msg when feed is html page e.g. page 404</li>\n<li>fixed xpath building</li>\n<li>update hierarchy taxonomies options</li>\n</ul>\n<p>4.0.4</p>\n<ul>\n<li>changed main file name to wp-all-import-pro.php</li>\n<li>fixed feed type auto-detection</li>\n<li>fixed bug with empty unique keys</li>\n</ul>\n<p>4.0.3</p>\n<ul>\n<li>fixed re-count record when a file has been changed at an import setting screen</li>\n<li>fixed database schema auto-update</li>\n<li>fixed uploading large files</li>\n<li>fixed auto-detecting root element</li>\n<li>fixed log storage in database</li>\n<li>fixed cron execution when "do not create new records" option is enabled</li>\n<li>fixed feed type detection</li>\n<li>fixed unlink attachment source when posts updated/deleted</li>\n<li>fixed specialchars in taxnomies/categories mapping</li>\n<li>updated taxonomies hierarchy settings</li>\n<li>added a limit 10 to the existing meta values</li>\n</ul>\n<p>4.0.2</p>\n<ul>\n<li>speed up the import of taxonomies/categories</li>\n<li>added taxonomies/categories mapping feature</li>\n<li>added custom fields auto-detection feature</li>\n<li>added custom fields mapping feature</li>\n<li>added images/taxonomies preview feature</li>\n<li>added unofficial support for more file formats - json &amp; sql</li>\n<li>added new setting (secure mode) to protect your files</li>\n<li>better import logs</li>\n<li>updated design</li>\n</ul>\n<p>3.4.2</p>\n<ul>\n<li>fixed navigation bug</li>\n<li>fixed search duplicates</li>\n<li>fixed duplicate categories</li>\n<li>fixed path builder for element attributes</li>\n<li>fixed cron processing for already uploaded files (XML)</li>\n<li>added taxonomies for pages</li>\n</ul>\n<p>3.4.1</p>\n<ul>\n<li>fixed pmxi_delete_post action: this action was executed after posts were deleted</li>\n<li>fixed import menu order &amp; post parent for pages</li>\n<li>fixed import log for continue import feature</li>\n<li>added is update author option</li>\n<li>fixed post formats</li>\n<li>fixed cron processing: WP_Error object was not initialized</li>\n<li>fixed cron processing for import where XPath filtering is defined</li>\n<li>fixed UTC dates on manage imports page</li>\n</ul>\n<p>3.4.0</p>\n<ul>\n<li>fixed: import empty content</li>\n<li>fixed: log files</li>\n<li>fixed: detect image extension</li>\n<li>fixed: terms hierarchy on cron job execution</li>\n</ul>\n<p>3.3.9</p>\n<ul>\n<li>added: feature to do not escape shortcodes</li>\n<li>fixed: pre-processing logic</li>\n<li>fixed: downloading images with unicode url</li>\n<li>fixed: clear non ASCII/invalid symbols in CSV files</li>\n<li>fixed: import option \'Instead of using original image file name, set file name(s)\'</li>\n</ul>\n<p>3.3.8</p>\n<ul>\n<li>fixed: admin notices</li>\n<li>fixed: creation duplicates draft post via cron</li>\n<li>fixed: images with encoded symbols</li>\n<li>fixed: upload file via URL</li>\n<li>fixed: php notices</li>\n<li>added: compatibility with WP 3.9</li>\n</ul>\n<p>3.3.7</p>\n<ul>\n<li>updated convertation CSV to XML with XMLWriter</li>\n<li>fixed import *.zip files</li>\n<li>fixed xpath helper on step 2</li>\n<li>fixed showing zeros in XML tree</li>\n<li>allow post content to be empty on step 3</li>\n<li>added autodetect session mode</li>\n<li>delete deprecated settings my csv contain html code and case sensitivity</li>\n<li>fixed deleting history files</li>\n<li>fixed autodetect image extensions</li>\n<li>fixed increasing SQL query length</li>\n<li>added error messages</li>\n<li>fixed "High Speed Small File Processing" option</li>\n</ul>\n<p>3.3.6</p>\n<ul>\n<li>fixed: multiple cron execution</li>\n<li>fixed: load options template</li>\n<li>fixed: session initialization</li>\n<li>fixed: import search</li>\n<li>fixed: attachment author on cron execution</li>\n<li>fixed: download images option</li>\n<li>added: errors messages to the log</li>\n<li>added: "not contains" filter to step 2</li>\n<li>added: compatibility with categories mapping addon</li>\n<li>updated: cpt navigation on step 4</li>\n</ul>\n<p>3.3.5</p>\n<ul>\n<li>fixed bug with cron processing</li>\n<li>fixed bug with saving wrong image name</li>\n<li>added serialized custom fields feature</li>\n<li>added compatibility with user import add-on</li>\n<li>added compatibility with 3rd party developers</li>\n<li>added new setting \'Cron processing time limit\'</li>\n</ul>\n";}s:7:"banners";a:2:{s:4:"high";s:55:"http://ps.w.org/wp-all-import/assets/banner-772x250.png";s:3:"low";s:0:"";}s:8:"requires";s:5:"3.6.1";s:6:"tested";s:5:"4.9.1";s:6:"author";s:6:"Soflyy";s:12:"contributors";O:8:"stdClass":2:{s:6:"soflyy";s:38:"https://profiles.wordpress.org/soflyy/";s:11:"wpallimport";s:43:"https://profiles.wordpress.org/wpallimport/";}}', 'yes'),
(13980, 'wp-all-import-pro_timeout_85b8495febade7a221f67b0bca7d59d9', '1516382265', 'yes') ;
INSERT INTO `pe_options` ( `option_id`, `option_name`, `option_value`, `autoload`) VALUES
(13982, 'widget_media_gallery', 'a:1:{s:12:"_multiwidget";i:1;}', 'yes') ;

#
# End of data contents of table `pe_options`
# --------------------------------------------------------



#
# Delete any existing table `pe_pmxi_files`
#

DROP TABLE IF EXISTS `pe_pmxi_files`;


#
# Table structure of table `pe_pmxi_files`
#

CREATE TABLE `pe_pmxi_files` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8_unicode_ci,
  `registered_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_pmxi_files`
#
INSERT INTO `pe_pmxi_files` ( `id`, `import_id`, `name`, `path`, `registered_on`) VALUES
(1, 1, 'tanfolyam_adatok.xlsx', '\\wpallimport\\uploads\\29071ec32bab633a728173d45fb13865\\/tanfolyam_adatok.xml', '2016-07-07 12:10:51'),
(2, 2, 'tanfolyam_adatok_2.xlsx', '\\wpallimport\\uploads\\ba159c57787bafbb10d13584eb0c21c5\\/tanfolyam_adatok_2.xml', '2016-07-07 14:43:58') ;

#
# End of data contents of table `pe_pmxi_files`
# --------------------------------------------------------



#
# Delete any existing table `pe_pmxi_history`
#

DROP TABLE IF EXISTS `pe_pmxi_history`;


#
# Table structure of table `pe_pmxi_history`
#

CREATE TABLE `pe_pmxi_history` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `import_id` bigint(20) unsigned NOT NULL,
  `type` enum('manual','processing','trigger','continue','') COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `time_run` text COLLATE utf8_unicode_ci,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `summary` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_pmxi_history`
#
INSERT INTO `pe_pmxi_history` ( `id`, `import_id`, `type`, `time_run`, `date`, `summary`) VALUES
(1, 1, 'manual', '9', '2016-07-07 12:10:51', '59 Tanfolyams created 0 updated 0 deleted 0 skipped'),
(2, 2, 'manual', '12', '2016-07-07 14:43:58', '59 Tanfolyams created 0 updated 0 deleted 0 skipped') ;

#
# End of data contents of table `pe_pmxi_history`
# --------------------------------------------------------



#
# Delete any existing table `pe_pmxi_imports`
#

DROP TABLE IF EXISTS `pe_pmxi_imports`;


#
# Table structure of table `pe_pmxi_imports`
#

CREATE TABLE `pe_pmxi_imports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_import_id` bigint(20) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `friendly_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `feed_type` enum('xml','csv','zip','gz','') COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` text COLLATE utf8_unicode_ci,
  `xpath` text COLLATE utf8_unicode_ci,
  `options` longtext COLLATE utf8_unicode_ci,
  `registered_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `root_element` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `processing` tinyint(1) NOT NULL DEFAULT '0',
  `executing` tinyint(1) NOT NULL DEFAULT '0',
  `triggered` tinyint(1) NOT NULL DEFAULT '0',
  `queue_chunk_number` bigint(20) NOT NULL DEFAULT '0',
  `first_import` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `count` bigint(20) NOT NULL DEFAULT '0',
  `imported` bigint(20) NOT NULL DEFAULT '0',
  `created` bigint(20) NOT NULL DEFAULT '0',
  `updated` bigint(20) NOT NULL DEFAULT '0',
  `skipped` bigint(20) NOT NULL DEFAULT '0',
  `deleted` bigint(20) NOT NULL DEFAULT '0',
  `canceled` tinyint(1) NOT NULL DEFAULT '0',
  `canceled_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `failed` tinyint(1) NOT NULL DEFAULT '0',
  `failed_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `settings_update_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_activity` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `iteration` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_pmxi_imports`
#
INSERT INTO `pe_pmxi_imports` ( `id`, `parent_import_id`, `name`, `friendly_name`, `type`, `feed_type`, `path`, `xpath`, `options`, `registered_on`, `root_element`, `processing`, `executing`, `triggered`, `queue_chunk_number`, `first_import`, `count`, `imported`, `created`, `updated`, `skipped`, `deleted`, `canceled`, `canceled_on`, `failed`, `failed_on`, `settings_update_on`, `last_activity`, `iteration`) VALUES
(1, 0, 'tanfolyam_adatok.xlsx', '', 'upload', '', '\\wpallimport\\uploads\\29071ec32bab633a728173d45fb13865\\tanfolyam_adatok.xlsx', '/node', 'a:155:{s:4:"type";s:4:"post";s:21:"is_override_post_type";i:0;s:15:"post_type_xpath";s:0:"";s:8:"deligate";s:0:"";s:11:"wizard_type";s:3:"new";s:11:"custom_type";s:11:"tanfolyamok";s:14:"featured_delim";s:1:",";s:10:"atch_delim";s:1:",";s:25:"is_search_existing_attach";s:1:"0";s:15:"post_taxonomies";a:1:{s:8:"category";s:154:"[{"item_id":"1","left":2,"right":5,"parent_id":null,"xpath":"","assign":true},{"item_id":"2","left":3,"right":4,"parent_id":"1","xpath":"","assign":true}]";}s:6:"parent";s:1:"0";s:23:"is_multiple_page_parent";s:3:"yes";s:18:"single_page_parent";s:0:"";s:5:"order";s:1:"0";s:6:"status";s:7:"publish";s:13:"page_template";s:7:"default";s:25:"is_multiple_page_template";s:3:"yes";s:20:"single_page_template";s:0:"";s:15:"page_taxonomies";a:0:{}s:9:"date_type";s:8:"specific";s:4:"date";s:3:"now";s:10:"date_start";s:3:"now";s:8:"date_end";s:3:"now";s:11:"custom_name";a:0:{}s:12:"custom_value";a:0:{}s:13:"custom_format";a:2:{i:0;s:1:"0";i:1;s:1:"0";}s:14:"custom_mapping";a:0:{}s:17:"serialized_values";a:2:{i:0;s:7:"["",""]";i:1;s:7:"["",""]";}s:20:"custom_mapping_rules";a:2:{i:0;s:2:"[]";i:1;s:2:"[]";}s:14:"comment_status";s:4:"open";s:20:"comment_status_xpath";s:0:"";s:11:"ping_status";s:4:"open";s:17:"ping_status_xpath";s:0:"";s:12:"create_draft";s:2:"no";s:6:"author";s:0:"";s:12:"post_excerpt";s:0:"";s:9:"post_slug";s:8:"{url[1]}";s:11:"attachments";s:0:"";s:19:"is_import_specified";s:1:"0";s:16:"import_specified";s:0:"";s:16:"is_delete_source";i:0;s:8:"is_cloak";i:0;s:10:"unique_key";s:31:"{tanfolyamnv[1]} - {tanf_id[1]}";s:14:"tmp_unique_key";s:42:"{tanfolyamnv[1]} - {tanf_id[1]} - {url[1]}";s:9:"feed_type";s:4:"auto";s:22:"search_existing_images";s:1:"1";s:18:"create_new_records";s:1:"1";s:17:"is_delete_missing";s:1:"0";s:20:"set_missing_to_draft";s:1:"0";s:20:"is_update_missing_cf";s:1:"0";s:22:"update_missing_cf_name";s:0:"";s:23:"update_missing_cf_value";s:0:"";s:20:"is_keep_former_posts";s:2:"no";s:16:"is_update_status";s:1:"1";s:17:"is_update_content";s:1:"1";s:15:"is_update_title";s:1:"1";s:14:"is_update_slug";s:1:"1";s:17:"is_update_excerpt";s:1:"1";s:20:"is_update_categories";s:1:"1";s:16:"is_update_author";s:1:"1";s:24:"is_update_comment_status";s:1:"1";s:23:"update_categories_logic";s:11:"full_update";s:15:"taxonomies_list";s:1:"0";s:20:"taxonomies_only_list";s:0:"";s:22:"taxonomies_except_list";s:0:"";s:21:"is_update_attachments";s:1:"1";s:16:"is_update_images";s:1:"1";s:19:"update_images_logic";s:11:"full_update";s:15:"is_update_dates";s:1:"1";s:20:"is_update_menu_order";s:1:"1";s:16:"is_update_parent";s:1:"1";s:19:"is_keep_attachments";s:1:"0";s:12:"is_keep_imgs";s:1:"0";s:20:"do_not_remove_images";s:1:"1";s:23:"is_update_custom_fields";s:1:"1";s:26:"update_custom_fields_logic";s:11:"full_update";s:18:"custom_fields_list";s:1:"0";s:23:"custom_fields_only_list";s:0:"";s:25:"custom_fields_except_list";s:0:"";s:18:"duplicate_matching";s:4:"auto";s:19:"duplicate_indicator";s:5:"title";s:21:"custom_duplicate_name";s:0:"";s:22:"custom_duplicate_value";s:0:"";s:18:"is_update_previous";i:0;s:12:"is_scheduled";s:0:"";s:16:"scheduled_period";s:0:"";s:13:"friendly_name";s:0:"";s:19:"records_per_request";s:2:"20";s:18:"auto_rename_images";s:1:"0";s:25:"auto_rename_images_suffix";s:0:"";s:11:"images_name";s:8:"filename";s:11:"post_format";s:8:"standard";s:17:"post_format_xpath";s:0:"";s:8:"encoding";s:5:"UTF-8";s:9:"delimiter";s:0:"";s:16:"image_meta_title";s:0:"";s:22:"image_meta_title_delim";s:1:",";s:18:"image_meta_caption";s:0:"";s:24:"image_meta_caption_delim";s:1:",";s:14:"image_meta_alt";s:0:"";s:20:"image_meta_alt_delim";s:1:",";s:22:"image_meta_description";s:0:"";s:28:"image_meta_description_delim";s:1:",";s:34:"image_meta_description_delim_logic";s:8:"separate";s:12:"status_xpath";s:0:"";s:15:"download_images";s:3:"yes";s:17:"converted_options";s:1:"1";s:15:"update_all_data";s:3:"yes";s:12:"is_fast_mode";s:1:"0";s:9:"chuncking";s:1:"1";s:17:"import_processing";s:4:"ajax";s:16:"save_template_as";s:1:"0";s:5:"title";s:16:"{tanfolyamnv[1]}";s:7:"content";s:14:"{modullers[1]}";s:4:"name";s:0:"";s:18:"is_keep_linebreaks";s:1:"0";s:13:"is_leave_html";s:1:"0";s:14:"fix_characters";i:0;s:9:"pid_xpath";s:0:"";s:14:"featured_image";s:0:"";s:23:"download_featured_image";s:0:"";s:23:"download_featured_delim";s:1:",";s:22:"gallery_featured_image";s:0:"";s:22:"gallery_featured_delim";s:1:",";s:11:"is_featured";s:1:"1";s:20:"set_image_meta_title";s:1:"0";s:22:"set_image_meta_caption";s:1:"0";s:18:"set_image_meta_alt";s:1:"0";s:26:"set_image_meta_description";s:1:"0";s:18:"auto_set_extension";s:1:"0";s:13:"new_extension";s:0:"";s:9:"tax_logic";a:1:{s:8:"category";s:6:"single";}s:10:"tax_assing";a:1:{s:8:"category";s:1:"1";}s:11:"term_assing";a:1:{s:8:"category";s:1:"1";}s:20:"multiple_term_assing";a:1:{s:8:"category";s:1:"1";}s:23:"tax_hierarchical_assing";a:1:{s:8:"category";a:2:{i:0;s:1:"1";s:6:"NUMBER";s:1:"1";}}s:34:"tax_hierarchical_last_level_assign";a:1:{s:8:"category";s:1:"0";}s:16:"tax_single_xpath";a:1:{s:8:"category";s:13:"{kategria[1]}";}s:18:"tax_multiple_xpath";a:1:{s:8:"category";s:0:"";}s:22:"tax_hierarchical_xpath";a:1:{s:8:"category";a:2:{i:0;s:0:"";i:1;s:0:"";}}s:18:"tax_multiple_delim";a:1:{s:8:"category";s:1:",";}s:22:"tax_hierarchical_delim";a:1:{s:8:"category";s:1:">";}s:25:"tax_manualhierarchy_delim";a:1:{s:8:"category";s:1:",";}s:29:"tax_hierarchical_logic_entire";a:1:{s:8:"category";s:1:"0";}s:29:"tax_hierarchical_logic_manual";a:1:{s:8:"category";s:1:"0";}s:18:"tax_enable_mapping";a:1:{s:8:"category";s:1:"0";}s:25:"tax_is_full_search_single";a:1:{s:8:"category";s:1:"0";}s:27:"tax_is_full_search_multiple";a:1:{s:8:"category";s:1:"0";}s:29:"tax_assign_to_one_term_single";a:1:{s:8:"category";s:1:"0";}s:31:"tax_assign_to_one_term_multiple";a:1:{s:8:"category";s:1:"0";}s:11:"tax_mapping";a:1:{s:8:"category";s:2:"[]";}s:17:"tax_logic_mapping";a:1:{s:8:"category";s:1:"0";}s:31:"is_tax_hierarchical_group_delim";a:1:{s:8:"category";s:1:"0";}s:28:"tax_hierarchical_group_delim";a:1:{s:8:"category";s:1:"|";}s:12:"nested_files";a:0:{}}', '2016-07-07 12:11:00', 'node', 0, 0, 0, 0, '2016-07-07 12:06:33', 59, 59, 59, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-07-07 12:10:59', 1),
(2, 0, 'tanfolyam_adatok_2.xlsx', '', 'upload', '', '\\wpallimport\\uploads\\ba159c57787bafbb10d13584eb0c21c5\\tanfolyam_adatok_2.xlsx', '/node', 'a:155:{s:4:"type";s:4:"post";s:21:"is_override_post_type";i:0;s:15:"post_type_xpath";s:0:"";s:8:"deligate";s:0:"";s:11:"wizard_type";s:3:"new";s:11:"custom_type";s:11:"tanfolyamok";s:14:"featured_delim";s:1:",";s:10:"atch_delim";s:1:",";s:25:"is_search_existing_attach";s:1:"0";s:15:"post_taxonomies";a:1:{s:8:"category";s:154:"[{"item_id":"1","left":2,"right":5,"parent_id":null,"xpath":"","assign":true},{"item_id":"2","left":3,"right":4,"parent_id":"1","xpath":"","assign":true}]";}s:6:"parent";s:1:"0";s:23:"is_multiple_page_parent";s:3:"yes";s:18:"single_page_parent";s:0:"";s:5:"order";s:1:"0";s:6:"status";s:7:"publish";s:13:"page_template";s:7:"default";s:25:"is_multiple_page_template";s:3:"yes";s:20:"single_page_template";s:0:"";s:15:"page_taxonomies";a:0:{}s:9:"date_type";s:8:"specific";s:4:"date";s:3:"now";s:10:"date_start";s:3:"now";s:8:"date_end";s:3:"now";s:11:"custom_name";a:0:{}s:12:"custom_value";a:0:{}s:13:"custom_format";a:2:{i:0;s:1:"0";i:1;s:1:"0";}s:14:"custom_mapping";a:0:{}s:17:"serialized_values";a:2:{i:0;s:7:"["",""]";i:1;s:7:"["",""]";}s:20:"custom_mapping_rules";a:2:{i:0;s:2:"[]";i:1;s:2:"[]";}s:14:"comment_status";s:4:"open";s:20:"comment_status_xpath";s:0:"";s:11:"ping_status";s:4:"open";s:17:"ping_status_xpath";s:0:"";s:12:"create_draft";s:2:"no";s:6:"author";s:0:"";s:12:"post_excerpt";s:0:"";s:9:"post_slug";s:8:"{url[1]}";s:11:"attachments";s:0:"";s:19:"is_import_specified";s:1:"0";s:16:"import_specified";s:0:"";s:16:"is_delete_source";i:0;s:8:"is_cloak";i:0;s:10:"unique_key";s:42:"{tanfolyamnv[1]} - {tanf_id[1]} - {url[1]}";s:14:"tmp_unique_key";s:42:"{tanfolyamnv[1]} - {tanf_id[1]} - {url[1]}";s:9:"feed_type";s:4:"auto";s:22:"search_existing_images";s:1:"1";s:18:"create_new_records";s:1:"1";s:17:"is_delete_missing";s:1:"0";s:20:"set_missing_to_draft";s:1:"0";s:20:"is_update_missing_cf";s:1:"0";s:22:"update_missing_cf_name";s:0:"";s:23:"update_missing_cf_value";s:0:"";s:20:"is_keep_former_posts";s:2:"no";s:16:"is_update_status";s:1:"1";s:17:"is_update_content";s:1:"1";s:15:"is_update_title";s:1:"1";s:14:"is_update_slug";s:1:"1";s:17:"is_update_excerpt";s:1:"1";s:20:"is_update_categories";s:1:"1";s:16:"is_update_author";s:1:"1";s:24:"is_update_comment_status";s:1:"1";s:23:"update_categories_logic";s:11:"full_update";s:15:"taxonomies_list";s:1:"0";s:20:"taxonomies_only_list";s:0:"";s:22:"taxonomies_except_list";s:0:"";s:21:"is_update_attachments";s:1:"1";s:16:"is_update_images";s:1:"1";s:19:"update_images_logic";s:11:"full_update";s:15:"is_update_dates";s:1:"1";s:20:"is_update_menu_order";s:1:"1";s:16:"is_update_parent";s:1:"1";s:19:"is_keep_attachments";s:1:"0";s:12:"is_keep_imgs";s:1:"0";s:20:"do_not_remove_images";s:1:"1";s:23:"is_update_custom_fields";s:1:"1";s:26:"update_custom_fields_logic";s:11:"full_update";s:18:"custom_fields_list";s:1:"0";s:23:"custom_fields_only_list";s:0:"";s:25:"custom_fields_except_list";s:0:"";s:18:"duplicate_matching";s:4:"auto";s:19:"duplicate_indicator";s:5:"title";s:21:"custom_duplicate_name";s:0:"";s:22:"custom_duplicate_value";s:0:"";s:18:"is_update_previous";i:0;s:12:"is_scheduled";s:0:"";s:16:"scheduled_period";s:0:"";s:13:"friendly_name";s:0:"";s:19:"records_per_request";s:2:"20";s:18:"auto_rename_images";s:1:"0";s:25:"auto_rename_images_suffix";s:0:"";s:11:"images_name";s:8:"filename";s:11:"post_format";s:8:"standard";s:17:"post_format_xpath";s:0:"";s:8:"encoding";s:5:"UTF-8";s:9:"delimiter";s:0:"";s:16:"image_meta_title";s:0:"";s:22:"image_meta_title_delim";s:1:",";s:18:"image_meta_caption";s:0:"";s:24:"image_meta_caption_delim";s:1:",";s:14:"image_meta_alt";s:0:"";s:20:"image_meta_alt_delim";s:1:",";s:22:"image_meta_description";s:0:"";s:28:"image_meta_description_delim";s:1:",";s:34:"image_meta_description_delim_logic";s:8:"separate";s:12:"status_xpath";s:0:"";s:15:"download_images";s:3:"yes";s:17:"converted_options";s:1:"1";s:15:"update_all_data";s:3:"yes";s:12:"is_fast_mode";s:1:"0";s:9:"chuncking";s:1:"1";s:17:"import_processing";s:4:"ajax";s:16:"save_template_as";s:1:"0";s:5:"title";s:16:"{tanfolyamnv[1]}";s:7:"content";s:14:"{modullers[1]}";s:4:"name";s:0:"";s:18:"is_keep_linebreaks";s:1:"0";s:13:"is_leave_html";s:1:"0";s:14:"fix_characters";i:0;s:9:"pid_xpath";s:0:"";s:14:"featured_image";s:0:"";s:23:"download_featured_image";s:0:"";s:23:"download_featured_delim";s:1:",";s:22:"gallery_featured_image";s:0:"";s:22:"gallery_featured_delim";s:1:",";s:11:"is_featured";s:1:"1";s:20:"set_image_meta_title";s:1:"0";s:22:"set_image_meta_caption";s:1:"0";s:18:"set_image_meta_alt";s:1:"0";s:26:"set_image_meta_description";s:1:"0";s:18:"auto_set_extension";s:1:"0";s:13:"new_extension";s:0:"";s:9:"tax_logic";a:1:{s:8:"category";s:6:"single";}s:10:"tax_assing";a:1:{s:8:"category";s:1:"1";}s:11:"term_assing";a:1:{s:8:"category";s:1:"1";}s:20:"multiple_term_assing";a:1:{s:8:"category";s:1:"1";}s:23:"tax_hierarchical_assing";a:1:{s:8:"category";a:2:{i:0;s:1:"1";s:6:"NUMBER";s:1:"1";}}s:34:"tax_hierarchical_last_level_assign";a:1:{s:8:"category";s:1:"0";}s:16:"tax_single_xpath";a:1:{s:8:"category";s:13:"{kategria[1]}";}s:18:"tax_multiple_xpath";a:1:{s:8:"category";s:0:"";}s:22:"tax_hierarchical_xpath";a:1:{s:8:"category";a:2:{i:0;s:0:"";i:1;s:0:"";}}s:18:"tax_multiple_delim";a:1:{s:8:"category";s:1:",";}s:22:"tax_hierarchical_delim";a:1:{s:8:"category";s:1:">";}s:25:"tax_manualhierarchy_delim";a:1:{s:8:"category";s:1:",";}s:29:"tax_hierarchical_logic_entire";a:1:{s:8:"category";s:1:"0";}s:29:"tax_hierarchical_logic_manual";a:1:{s:8:"category";s:1:"0";}s:18:"tax_enable_mapping";a:1:{s:8:"category";s:1:"0";}s:25:"tax_is_full_search_single";a:1:{s:8:"category";s:1:"0";}s:27:"tax_is_full_search_multiple";a:1:{s:8:"category";s:1:"0";}s:29:"tax_assign_to_one_term_single";a:1:{s:8:"category";s:1:"0";}s:31:"tax_assign_to_one_term_multiple";a:1:{s:8:"category";s:1:"0";}s:11:"tax_mapping";a:1:{s:8:"category";s:2:"[]";}s:17:"tax_logic_mapping";a:1:{s:8:"category";s:1:"0";}s:31:"is_tax_hierarchical_group_delim";a:1:{s:8:"category";s:1:"0";}s:28:"tax_hierarchical_group_delim";a:1:{s:8:"category";s:1:"|";}s:12:"nested_files";a:0:{}}', '2016-07-07 14:44:10', 'node', 0, 0, 0, 0, '2016-07-07 14:42:24', 59, 59, 59, 0, 0, 0, 0, '0000-00-00 00:00:00', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '2016-07-07 14:44:08', 1) ;

#
# End of data contents of table `pe_pmxi_imports`
# --------------------------------------------------------



#
# Delete any existing table `pe_pmxi_posts`
#

DROP TABLE IF EXISTS `pe_pmxi_posts`;


#
# Table structure of table `pe_pmxi_posts`
#

CREATE TABLE `pe_pmxi_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL,
  `import_id` bigint(20) unsigned NOT NULL,
  `unique_key` text COLLATE utf8_unicode_ci,
  `product_key` text COLLATE utf8_unicode_ci,
  `iteration` bigint(20) NOT NULL DEFAULT '0',
  `specified` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_pmxi_posts`
#
INSERT INTO `pe_pmxi_posts` ( `id`, `post_id`, `import_id`, `unique_key`, `product_key`, `iteration`, `specified`) VALUES
(60, 83, 2, 'XML alapismeretek - 9 - xml-tanfolyam', '', 0, 0),
(61, 84, 2, 'Linux haladó rendszergazda - 11 - linux-rendszergazda-halado-tanfolyam', '', 0, 0),
(62, 85, 2, 'Linux rendszergazdai alapismeretek - 13 - linux-rendszergazda-kezdo-tanfolyam', '', 0, 0),
(63, 86, 2, 'Windows Server 2012 R2 - 15 - windows-szerver-tanfolyam', '', 0, 0),
(64, 87, 2, 'Adatbázis-kezelés haladóknak - Access - 29 - adatbazis-access-halado-tanfolyam', '', 0, 0),
(65, 88, 2, 'Adatbázis-kezelési alapismeretek - Access - 30 - adatbazis-access-tanfolyam', '', 0, 0),
(66, 89, 2, 'Csoportmunka számítógépes támogatása - Outlook - 32 - oulook-csoportmunka-tanfolyam', '', 0, 0),
(67, 90, 2, 'Gépkezelési alapismeretek - 33 - gepkezelo', '', 0, 0),
(68, 91, 2, 'Internetfelhasználói ismeretek - 34 - internet_alap', '', 0, 0),
(69, 92, 2, 'Prezentáció készítés - PowerPoint - 35 - powerpoint-prezentacio-tanfolyam', '', 0, 0),
(70, 93, 2, 'Szövegszerkesztés haladóknak - Word - 36 - szovegszerkesztes-word-halado-tanfolyam', '', 0, 0),
(71, 94, 2, 'Szövegszerkesztési alapismeretek - Word - 37 - szovegszerkesztes-word-tanfolyam', '', 0, 0),
(72, 95, 2, 'Táblázatkezelés haladóknak - Excel - 38 - tablazatkezeles-excel-halado-tanfolyam', '', 0, 0),
(73, 96, 2, 'Táblázatkezelési alapismeretek - Excel - 39 - tablazatkezeles-excel-tanfolyam', '', 0, 0),
(74, 97, 2, 'SQL adatbázis-kezelés - 58 - sql', '', 0, 0),
(75, 98, 2, 'Linux címtárszolgáltatás - 60 - linux-cimtar-ldap-tanfolyam', '', 0, 0),
(76, 99, 2, 'Exchange Server 2010 - 62 - exchange-szerver-tanfolyam', '', 0, 0),
(77, 100, 2, 'Visual C# - 63 - visualc-csharp-tanfolyam', '', 0, 0),
(78, 101, 2, 'ASP .NET - 64 - asp-tanfolyam', '', 0, 0),
(79, 102, 2, 'SQL adatbázis programozás - 65 - sqlprog', '', 0, 0),
(80, 103, 2, 'Joomla Webmester - 71 - Joomla-tanfolyam', '', 0, 0),
(81, 104, 2, 'HTML5-CSS3 a gyakorlatban - 72 - HTML5-CSS3-tanfolyam', '', 0, 0),
(82, 105, 2, 'TCP/IP hálózatok, hálózati eszközök konfigurálása - 73 - TCP-IP-switch-router-tanfolyam', '', 0, 0),
(83, 106, 2, 'Microsoft virtualizációs megoldások alapjai - Hyper-V - 75 - Hyper-V-tanfolyam', '', 0, 0),
(84, 107, 2, 'PHP programozás - 77 - php-programozas-tanfolyam', '', 0, 0),
(85, 108, 2, 'Vállalati levelezés Linux környezetben - 82 - linux-levelezes-postfix-tanfolyam', '', 0, 0),
(86, 109, 2, 'Samba-LDAP a gyakorlatban - 88 - samba-ldap', '', 0, 0),
(87, 110, 2, 'Indesign alapismeretek - 95 - kiadvanyszerkesztes-dtp-indesign-tanfolyam', '', 0, 0),
(88, 111, 2, 'Modern és keresõbarát weboldalak tervezése - 101 - keresobarat-webszabvany-seo-tanfolyam', '', 0, 0),
(89, 112, 2, 'Excel makróprogramozás - VBA - 103 - excel-makro-vba-tanfolyam', '', 0, 0),
(90, 113, 2, 'Projectmanagement - 110 - project-tanfolyam', '', 0, 0),
(91, 114, 2, 'Adobe Acrobat ismeretek - 111 - acrobat-tanfolyam', '', 0, 0),
(92, 115, 2, 'JavaScript programozás alapjai - 113 - Javascript-tanfolyam', '', 0, 0),
(93, 116, 2, 'Joomla sminkmester (Templates) - 115 - Joomla-sablon-template-tanfolyam', '', 0, 0),
(94, 117, 2, 'A Java programozás alapjai - 116 - java-programozas-tanfolyam', '', 0, 0),
(95, 118, 2, 'jQuery alapismeretek - 117 - jquery-tanfolyam', '', 0, 0),
(96, 119, 2, 'Wordpress webmester - 118 - wordpress-webmester-tanfolyam', '', 0, 0),
(97, 120, 2, 'Drupal webmester - 119 - drupal-webmester-tanfolyam', '', 0, 0),
(98, 121, 2, 'Drupal sminkmester - 120 - drupal-smink-tanfolyam', '', 0, 0),
(99, 122, 2, 'Drupal programozó tanfolyam - 121 - drupal-modulfejlesztes-programozas', '', 0, 0),
(100, 123, 2, 'Webdesign-Photoshop - 122 - webtervezes-webdesign-photoshop-tanfolyam', '', 0, 0),
(101, 124, 2, 'Rugalmas webtervezés mobil eszközökre - 125 - mobil-webtervezes-responsive-webdesign', '', 0, 0),
(102, 125, 2, 'JavaScript és JQuery - a biztos alapok - 126 - javascript-jquery-programozas-tanfolyam', '', 0, 0),
(103, 126, 2, 'TCP/IP hálózatok és eszközök haladóknak - 128 - tcp-ip-halozatok-cisco-eszkozok-halado-tanfolyam', '', 0, 0),
(104, 127, 2, 'WordPress Sminkmester - 129 - Wordpress-sablon-template-theme-tanfolyam', '', 0, 0),
(105, 128, 2, 'Linux otthon és a kisirodában - SOHO - 130 - linux-otthoni-irodai-hasznalat-tanfolyam', '', 0, 0),
(106, 129, 2, 'Linux Shell-programozás - 131 - linux-shell-script-programozas', '', 0, 0),
(107, 130, 2, 'Android programozás alapok - 132 - android-programozas-tanfolyam', '', 0, 0),
(108, 131, 2, 'Webfejlesztés Google Web Toolkit (GWT) technológiával - 133 - java-gwt-tanfolyam', '', 0, 0),
(109, 132, 2, 'Java programoz&#225;s haladóknak - 134 - java-halado-tanfolyam', '', 0, 0),
(110, 133, 2, 'Java fejlesztés Spring keretrendszerrel - 135 - java-spring-tanfolyam', '', 0, 0),
(111, 134, 2, 'Szoftverfejlesztés Java Enterprise Edition környezetben - JEE - 136 - Java-Enterprise-JEE-tanfolyam', '', 0, 0),
(112, 135, 2, 'Tesztelés JAVA platformon - 137 - Java-teszteles-tanfolyam', '', 0, 0),
(113, 136, 2, 'Tervezési minták és refaktoring Java környezetben - 138 - Java-tervezesi-mintak-UML-refactoring', '', 0, 0),
(114, 137, 2, 'Keresztplatformos Mobilalkalmazás-fejlesztés - PhoneGap - 139 - webapp-mobil-alkalmazas-phonegap-cordova-tanfolyam', '', 0, 0),
(115, 138, 2, 'Visual Studio 2015 és C# 6.0 újdonságok - 140 - visual-studio-2015-c-sharp-tanfolyam', '', 0, 0),
(116, 139, 2, 'Excel automatizálás - 141 - excel-automatizalas-makro-vba-tanfolyam', '', 0, 0),
(117, 140, 2, 'Bevezetés az Angular JS keretrendszerbe - 142 - angular-js-tanfolyam', '', 0, 0),
(118, 141, 2, 'Excel PIVOT tábla mesterkurzus - 143 - excel-kimutatas-pivot-tabla-tanfolyam', '', 0, 0) ;

#
# End of data contents of table `pe_pmxi_posts`
# --------------------------------------------------------



#
# Delete any existing table `pe_pmxi_templates`
#

DROP TABLE IF EXISTS `pe_pmxi_templates`;


#
# Table structure of table `pe_pmxi_templates`
#

CREATE TABLE `pe_pmxi_templates` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `options` longtext COLLATE utf8_unicode_ci,
  `scheduled` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `is_keep_linebreaks` tinyint(1) NOT NULL DEFAULT '0',
  `is_leave_html` tinyint(1) NOT NULL DEFAULT '0',
  `fix_characters` tinyint(1) NOT NULL DEFAULT '0',
  `meta` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_pmxi_templates`
#

#
# End of data contents of table `pe_pmxi_templates`
# --------------------------------------------------------



#
# Delete any existing table `pe_postmeta`
#

DROP TABLE IF EXISTS `pe_postmeta`;


#
# Table structure of table `pe_postmeta`
#

CREATE TABLE `pe_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2200 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_postmeta`
#
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(10, 7, '_edit_last', '1'),
(11, 7, 'field_577e3d8d78415', 'a:14:{s:3:"key";s:19:"field_577e3d8d78415";s:5:"label";s:15:"Célközönség";s:4:"name";s:11:"celkozonseg";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(12, 7, 'field_577e3ea478416', 'a:13:{s:3:"key";s:19:"field_577e3ea478416";s:5:"label";s:19:"Belepesi feltetelek";s:4:"name";s:19:"belepesi_feltetelek";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(14, 7, 'position', 'normal'),
(15, 7, 'layout', 'no_box'),
(16, 7, 'hide_on_screen', ''),
(17, 7, '_edit_lock', '1469894612:1'),
(19, 7, 'field_577e43f7dfc0a', 'a:14:{s:3:"key";s:19:"field_577e43f7dfc0a";s:5:"label";s:9:"Igazolás";s:4:"name";s:8:"igazolas";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:3;}'),
(20, 7, 'field_577e4404dfc0b', 'a:14:{s:3:"key";s:19:"field_577e4404dfc0b";s:5:"label";s:8:"Listaár";s:4:"name";s:7:"listaar";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:4;}'),
(21, 7, 'field_577e4409dfc0c', 'a:14:{s:3:"key";s:19:"field_577e4409dfc0c";s:5:"label";s:11:"Akciós ár";s:4:"name";s:9:"akcios_ar";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:5;}'),
(22, 7, 'field_577e4411dfc0d', 'a:14:{s:3:"key";s:19:"field_577e4411dfc0d";s:5:"label";s:16:"Részletfizetés";s:4:"name";s:14:"reszletfizetes";s:4:"type";s:4:"text";s:12:"instructions";s:34:"Hány részletben lehet kifizetni.";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:6;}'),
(23, 7, 'field_577e4430dfc0e', 'a:13:{s:3:"key";s:19:"field_577e4430dfc0e";s:5:"label";s:8:"Tematika";s:4:"name";s:8:"tematika";s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:15:{s:3:"key";s:19:"field_577e443bdfc0f";s:5:"label";s:3:"cim";s:4:"name";s:3:"cim";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_577e4442dfc10";s:5:"label";s:6:"leiras";s:4:"name";s:6:"leiras";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:0:"";s:9:"row_limit";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:7;}'),
(24, 7, 'field_577e4451dfc11', 'a:13:{s:3:"key";s:19:"field_577e4451dfc11";s:5:"label";s:12:"Demóvideók";s:4:"name";s:10:"demovideok";s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:10:"sub_fields";a:1:{i:0;a:15:{s:3:"key";s:19:"field_577e4471dfc12";s:5:"label";s:4:"link";s:4:"name";s:4:"link";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}}s:7:"row_min";s:0:"";s:9:"row_limit";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:8;}'),
(27, 9, '_edit_last', '1'),
(28, 9, 'field_577e44cf7a644', 'a:14:{s:3:"key";s:19:"field_577e44cf7a644";s:5:"label";s:3:"év";s:4:"name";s:2:"ev";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(29, 9, 'field_577e44ff7a645', 'a:14:{s:3:"key";s:19:"field_577e44ff7a645";s:5:"label";s:9:"létszám";s:4:"name";s:7:"letszam";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(30, 9, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:11:"referenciak";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(31, 9, 'position', 'normal'),
(32, 9, 'layout', 'no_box'),
(33, 9, 'hide_on_screen', ''),
(34, 9, '_edit_lock', '1470569676:1'),
(35, 7, 'field_577e45414ba21', 'a:14:{s:3:"key";s:19:"field_577e45414ba21";s:5:"label";s:7:"Tesztek";s:4:"name";s:7:"tesztek";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:7:"tesztek";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(36, 7, 'field_577e45174ba20', 'a:14:{s:3:"key";s:19:"field_577e45174ba20";s:5:"label";s:11:"Referenciak";s:4:"name";s:11:"referenciak";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:11:"referenciak";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:9;}'),
(37, 7, 'field_577e456f4ba22', 'a:10:{s:3:"key";s:19:"field_577e456f4ba22";s:5:"label";s:15:"Új tanfolyam-e";s:4:"name";s:4:"uj_e";s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:7:"message";s:0:"";s:13:"default_value";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:10;}'),
(38, 7, 'field_577e45954ba23', 'a:10:{s:3:"key";s:19:"field_577e45954ba23";s:5:"label";s:17:"Aktiv tanfolyam-e";s:4:"name";s:7:"aktiv_e";s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:7:"message";s:0:"";s:13:"default_value";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_577e456f4ba22";s:8:"operator";s:2:"==";s:5:"value";s:1:"1";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:11;}'),
(192, 71, '_edit_last', '1'),
(194, 71, '_edit_lock', '1467897675:1'),
(198, 73, '_edit_last', '1'),
(200, 73, '_edit_lock', '1510559750:2'),
(201, 2, '_edit_lock', '1467898362:1'),
(202, 74, '_edit_last', '1'),
(203, 74, '_edit_lock', '1467898395:1'),
(211, 79, '_edit_last', '1'),
(213, 79, '_edit_lock', '1467899593:1'),
(328, 83, '_reorder_term_category_webmester', '0'),
(329, 84, '_reorder_term_category_linux', '0'),
(330, 85, '_reorder_term_category_linux', '1'),
(331, 86, '_reorder_term_category_windows-server', '0'),
(332, 87, '_reorder_term_category_office', '0'),
(333, 88, '_reorder_term_category_office', '1'),
(334, 89, '_reorder_term_category_office', '2'),
(335, 90, '_reorder_term_category_office', '3'),
(336, 91, '_reorder_term_category_office', '4'),
(337, 92, '_reorder_term_category_office', '5'),
(338, 93, '_reorder_term_category_office', '6'),
(339, 94, '_reorder_term_category_office', '7'),
(340, 95, '_reorder_term_category_office', '8'),
(341, 96, '_reorder_term_category_office', '9'),
(342, 97, '_reorder_term_category_adatbazis', '1'),
(343, 98, '_reorder_term_category_linux', '2'),
(344, 99, '_reorder_term_category_windows-server', '1'),
(345, 100, '_reorder_term_category_dotnet', '0'),
(346, 101, '_reorder_term_category_dotnet', '1'),
(347, 102, '_reorder_term_category_adatbazis', '0'),
(348, 103, '_reorder_term_category_webmester', '1'),
(349, 104, '_reorder_term_category_webmester', '2'),
(350, 105, '_reorder_term_category_halozat', '0'),
(351, 106, '_reorder_term_category_windows-server', '2'),
(352, 107, '_reorder_term_category_webmester', '3'),
(353, 108, '_reorder_term_category_linux', '3'),
(354, 109, '_reorder_term_category_linux', '4'),
(355, 110, '_reorder_term_category_grafika', '0'),
(356, 111, '_reorder_term_category_webmester', '4'),
(357, 112, '_reorder_term_category_office', '10'),
(358, 113, '_reorder_term_category_office', '11'),
(359, 114, '_reorder_term_category_grafika', '1'),
(360, 115, '_reorder_term_category_webmester', '5'),
(361, 116, '_reorder_term_category_webmester', '6'),
(362, 117, '_reorder_term_category_java', '0'),
(363, 118, '_reorder_term_category_webmester', '7'),
(364, 119, '_reorder_term_category_webmester', '8'),
(365, 120, '_reorder_term_category_drupal', '0'),
(366, 121, '_reorder_term_category_drupal', '1'),
(367, 122, '_reorder_term_category_drupal', '2'),
(368, 123, '_reorder_term_category_webmester', '9'),
(369, 124, '_reorder_term_category_webmester', '10'),
(370, 125, '_reorder_term_category_webmester', '11'),
(371, 126, '_reorder_term_category_halozat', '1'),
(372, 127, '_reorder_term_category_wordpress', '0'),
(373, 128, '_reorder_term_category_linux', '5'),
(374, 129, '_reorder_term_category_linux', '6'),
(375, 130, '_reorder_term_category_programozas', '0'),
(376, 131, '_reorder_term_category_java', '1'),
(377, 132, '_reorder_term_category_java', '2'),
(378, 133, '_reorder_term_category_java', '3'),
(379, 134, '_reorder_term_category_java', '4'),
(380, 135, '_reorder_term_category_java', '5'),
(381, 136, '_reorder_term_category_java', '6'),
(382, 137, '_reorder_term_category_webmester', '12'),
(383, 138, '_reorder_term_category_dotnet', '2'),
(384, 139, '_reorder_term_category_excel', '0'),
(385, 140, '_reorder_term_category_webmester', '13'),
(386, 141, '_reorder_term_category_excel', '1'),
(387, 117, '_edit_lock', '1509451474:1'),
(388, 144, '_edit_last', '1'),
(391, 144, 'position', 'normal'),
(392, 144, 'layout', 'no_box'),
(393, 144, 'hide_on_screen', ''),
(394, 144, '_edit_lock', '1469896547:1') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(395, 145, '_edit_last', '1'),
(397, 145, 'position', 'normal'),
(398, 145, 'layout', 'no_box'),
(399, 145, 'hide_on_screen', ''),
(400, 145, '_edit_lock', '1469700218:1'),
(401, 145, 'field_5799caaae11cc', 'a:13:{s:3:"key";s:19:"field_5799caaae11cc";s:5:"label";s:7:"Témák";s:4:"name";s:5:"temak";s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:10:"sub_fields";a:1:{i:0;a:15:{s:3:"key";s:19:"field_5799cabde11cd";s:5:"label";s:5:"Téma";s:4:"name";s:4:"tema";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}}s:7:"row_min";s:0:"";s:9:"row_limit";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(403, 144, 'field_5799caed41a4a', 'a:14:{s:3:"key";s:19:"field_5799caed41a4a";s:5:"label";s:5:"tanar";s:4:"name";s:5:"tanar";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:7:"tanarok";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(405, 145, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"tanarok";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(406, 146, '_edit_last', '1'),
(407, 146, 'field_5799cbae5b7f4', 'a:14:{s:3:"key";s:19:"field_5799cbae5b7f4";s:5:"label";s:10:"Pontos_cim";s:4:"name";s:10:"pontos_cim";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(408, 146, 'field_5799cb825b7f3', 'a:13:{s:3:"key";s:19:"field_5799cb825b7f3";s:5:"label";s:13:"terkep_iframe";s:4:"name";s:13:"terkep_iframe";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(409, 146, 'field_5799cbf95b7f5', 'a:10:{s:3:"key";s:19:"field_5799cbf95b7f5";s:5:"label";s:6:"Képek";s:4:"name";s:5:"kepek";s:4:"type";s:7:"gallery";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(410, 146, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:8:"helyszin";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(411, 146, 'position', 'normal'),
(412, 146, 'layout', 'no_box'),
(413, 146, 'hide_on_screen', ''),
(414, 146, '_edit_lock', '1469696910:1'),
(415, 144, 'field_5799cc0e5a5af', 'a:14:{s:3:"key";s:19:"field_5799cc0e5a5af";s:5:"label";s:9:"Helyszín";s:4:"name";s:8:"helyszin";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:6:"object";s:9:"post_type";a:1:{i:0;s:8:"helyszin";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(417, 7, 'field_5799cdc6d9cb2', 'a:14:{s:3:"key";s:19:"field_5799cdc6d9cb2";s:5:"label";s:11:"Access kód";s:4:"name";s:10:"access_kod";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_577e456f4ba22";s:8:"operator";s:2:"==";s:5:"value";s:1:"1";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:12;}'),
(418, 7, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:11:"tanfolyamok";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(419, 144, 'field_5799cd459eeba', 'a:11:{s:3:"key";s:19:"field_5799cd459eeba";s:5:"label";s:7:"Kezdés";s:4:"name";s:6:"kezdes";s:4:"type";s:11:"date_picker";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:11:"date_format";s:8:"yy.mm.dd";s:14:"display_format";s:8:"dd/mm/yy";s:9:"first_day";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:3;}'),
(420, 144, 'field_5799cd619eebb', 'a:11:{s:3:"key";s:19:"field_5799cd619eebb";s:5:"label";s:5:"Vége";s:4:"name";s:4:"vege";s:4:"type";s:11:"date_picker";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:11:"date_format";s:8:"yy.mm.dd";s:14:"display_format";s:8:"dd/mm/yy";s:9:"first_day";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:4;}'),
(421, 144, 'field_5799cd6b9eebc', 'a:14:{s:3:"key";s:19:"field_5799cd6b9eebc";s:5:"label";s:7:"Napszak";s:4:"name";s:7:"napszak";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:5;}'),
(422, 144, 'field_5799cd709eebd', 'a:14:{s:3:"key";s:19:"field_5799cd709eebd";s:5:"label";s:9:"Beosztás";s:4:"name";s:8:"beosztas";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:6;}'),
(423, 144, 'field_5799ce4a9eebe', 'a:15:{s:3:"key";s:19:"field_5799ce4a9eebe";s:5:"label";s:16:"Minimum letszám";s:4:"name";s:15:"minimum_letszam";s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:7;}'),
(424, 144, 'field_5799ce5b9eebf', 'a:15:{s:3:"key";s:19:"field_5799ce5b9eebf";s:5:"label";s:17:"Maximum létszám";s:4:"name";s:15:"maximum_letszam";s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:8;}'),
(425, 144, 'field_5799cf379eec0', 'a:15:{s:3:"key";s:19:"field_5799cf379eec0";s:5:"label";s:11:"Beiratkozva";s:4:"name";s:11:"beiratkozva";s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:9;}'),
(427, 149, '_edit_last', '1'),
(428, 149, '_edit_lock', '1469697863:1'),
(431, 154, '_edit_last', '1'),
(432, 154, 'field_5799d0da1c22c', 'a:14:{s:3:"key";s:19:"field_5799d0da1c22c";s:5:"label";s:9:"Tanfolyam";s:4:"name";s:9:"tanfolyam";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:11:"tanfolyamok";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:2:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(433, 154, 'field_5799d0f11c22d', 'a:14:{s:3:"key";s:19:"field_5799d0f11c22d";s:5:"label";s:10:"keresztnev";s:4:"name";s:10:"keresztnev";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(434, 154, 'field_5799d0f91c22e', 'a:14:{s:3:"key";s:19:"field_5799d0f91c22e";s:5:"label";s:8:"cégnév";s:4:"name";s:6:"cegnev";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(436, 154, 'position', 'normal'),
(437, 154, 'layout', 'no_box'),
(438, 154, 'hide_on_screen', ''),
(439, 154, '_edit_lock', '1469705759:1'),
(440, 156, 'keresztnev', 'fdf'),
(441, 156, '_keresztnev', 'field_keresztnev'),
(442, 156, 'cegnev', 'sdf'),
(443, 156, '_cegnev', 'field_cegnev'),
(444, 156, 'tanfolyamname', 'a:1:{i:0;N;}'),
(445, 156, '_tanfolyamname', 'field_tanfolyamname'),
(446, 157, 'keresztnev', 'sdf'),
(447, 157, '_keresztnev', 'field_keresztnev'),
(448, 157, 'cegnev', 'df'),
(449, 157, '_cegnev', 'field_cegnev'),
(450, 157, 'tanfolyamname', 'a:1:{i:0;s:2:"89";}'),
(451, 157, '_tanfolyamname', 'field_tanfolyamname'),
(452, 157, '_edit_lock', '1469701981:1'),
(453, 158, 'keresztnev', 'df'),
(454, 158, '_keresztnev', 'field_keresztnev'),
(455, 158, 'cegnev', 'df'),
(456, 158, '_cegnev', 'field_cegnev'),
(457, 158, 'tanfolyamname', 'a:1:{i:0;s:2:"85";}'),
(458, 158, '_tanfolyamname', 'field_tanfolyamname'),
(459, 158, '_edit_lock', '1469702166:1'),
(460, 159, 'keresztnev', 'fdg'),
(461, 159, '_keresztnev', 'field_keresztnev'),
(462, 159, 'cegnev', 'sdf'),
(463, 159, '_cegnev', 'field_cegnev'),
(464, 159, 'tanfolyam', 'a:1:{i:0;s:2:"89";}'),
(465, 159, '_tanfolyam', 'field_tanfolyam'),
(466, 159, '_edit_lock', '1469702201:1'),
(467, 160, 'keresztnev', 'sdf'),
(468, 160, '_keresztnev', 'field_keresztnev'),
(469, 160, 'cegnev', 'fsd'),
(470, 160, '_cegnev', 'field_cegnev'),
(471, 160, 'tanfolyam', 'a:1:{i:0;s:2:"84";}'),
(472, 160, '_tanfolyam', 'field_tanfolyam'),
(473, 160, '_edit_lock', '1469702237:1'),
(474, 117, '_edit_last', '1'),
(475, 117, 'mark_posts_term_id', '30'),
(476, 161, 'keresztnev', 'sfd'),
(477, 161, '_keresztnev', 'field_keresztnev'),
(478, 161, 'cegnev', 'sdff'),
(479, 161, '_cegnev', 'field_cegnev'),
(480, 161, 'tanfolyam', 'a:1:{i:0;s:2:"90";}'),
(481, 161, '_tanfolyam', 'field_tanfolyam'),
(482, 161, '_edit_lock', '1469705757:1'),
(483, 154, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"ajanlas";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(484, 117, 'celkozonseg', ''),
(485, 117, '_celkozonseg', 'field_577e3d8d78415'),
(486, 117, 'belepesi_feltetelek', ''),
(487, 117, '_belepesi_feltetelek', 'field_577e3ea478416'),
(488, 117, 'tesztek', ''),
(489, 117, '_tesztek', 'field_577e45414ba21'),
(490, 117, 'igazolas', ''),
(491, 117, '_igazolas', 'field_577e43f7dfc0a'),
(492, 117, 'listaar', '30000'),
(493, 117, '_listaar', 'field_577e4404dfc0b'),
(494, 117, 'akcios_ar', ''),
(495, 117, '_akcios_ar', 'field_577e4409dfc0c'),
(496, 117, 'reszletfizetes', ''),
(497, 117, '_reszletfizetes', 'field_577e4411dfc0d'),
(498, 117, 'tematika', '0'),
(499, 117, '_tematika', 'field_577e4430dfc0e'),
(500, 117, 'demovideok', '0'),
(501, 117, '_demovideok', 'field_577e4451dfc11'),
(502, 117, 'referenciak', '') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(503, 117, '_referenciak', 'field_577e45174ba20'),
(504, 117, 'uj_e', '0'),
(505, 117, '_uj_e', 'field_577e456f4ba22'),
(506, 117, 'aktiv_e', '0'),
(507, 117, '_aktiv_e', 'field_577e45954ba23'),
(508, 117, 'access_kod', ''),
(509, 117, '_access_kod', 'field_5799cdc6d9cb2'),
(510, 87, '_edit_last', '1'),
(511, 87, 'mark_posts_term_id', '29'),
(512, 87, '_edit_lock', '1511349273:2'),
(513, 164, '_edit_last', '2'),
(514, 164, '_edit_lock', '1519210303:2'),
(515, 164, 'tanar', 'a:1:{i:0;s:3:"166";}'),
(516, 164, '_tanar', 'field_5799caed41a4a'),
(517, 164, 'helyszin', 'a:1:{i:0;s:3:"165";}'),
(518, 164, '_helyszin', 'field_5799cc0e5a5af'),
(519, 164, 'kezdes', '20170814'),
(520, 164, '_kezdes', 'field_5799cd459eeba'),
(521, 164, 'vege', '20170820'),
(522, 164, '_vege', 'field_5799cd619eebb'),
(523, 164, 'napszak', 'esti'),
(524, 164, '_napszak', 'field_5799cd6b9eebc'),
(525, 164, 'beosztas', '14-19'),
(526, 164, '_beosztas', 'field_5799cd709eebd'),
(527, 164, 'minimum_letszam', '5'),
(528, 164, '_minimum_letszam', 'field_5799ce4a9eebe'),
(529, 164, 'maximum_letszam', '15'),
(530, 164, '_maximum_letszam', 'field_5799ce5b9eebf'),
(531, 164, 'beiratkozva', '2'),
(532, 164, '_beiratkozva', 'field_5799cf379eec0'),
(533, 165, '_edit_last', '1'),
(534, 165, '_edit_lock', '1469896548:1'),
(535, 166, '_edit_last', '1'),
(536, 166, '_edit_lock', '1469893476:1'),
(537, 167, '_wp_attached_file', '2016/07/Imi-Pentaschool-profil.jpg'),
(538, 167, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:70;s:6:"height";i:91;s:4:"file";s:34:"2016/07/Imi-Pentaschool-profil.jpg";s:5:"sizes";a:0:{}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"1.8";s:6:"credit";s:0:"";s:6:"camera";s:14:"Canon EOS 600D";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1459612569";s:9:"copyright";s:0:"";s:12:"focal_length";s:2:"50";s:3:"iso";s:3:"250";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";s:11:"orientation";s:1:"0";s:8:"keywords";a:0:{}}}'),
(539, 166, '_thumbnail_id', '167'),
(540, 166, 'temak_0_tema', 'Office csomag a 2016-as verzióig'),
(541, 166, '_temak_0_tema', 'field_5799cabde11cd'),
(542, 166, 'temak_1_tema', 'PowerPoint hatékonyan'),
(543, 166, '_temak_1_tema', 'field_5799cabde11cd'),
(544, 166, 'temak_2_tema', 'Excel haladó ismeretek'),
(545, 166, '_temak_2_tema', 'field_5799cabde11cd'),
(546, 166, 'temak_3_tema', 'Excel makróprogramozás'),
(547, 166, '_temak_3_tema', 'field_5799cabde11cd'),
(548, 166, 'temak', '4'),
(549, 166, '_temak', 'field_5799caaae11cc'),
(550, 168, '_wp_attached_file', '2016/07/sas_terem2.jpg'),
(551, 168, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:450;s:4:"file";s:22:"2016/07/sas_terem2.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"sas_terem2-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"sas_terem2-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"2.7";s:6:"credit";s:0:"";s:6:"camera";s:21:"Canon PowerShot S3 IS";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1226407731";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"6";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(552, 169, '_wp_attached_file', '2016/07/sas_terem1.jpg'),
(553, 169, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:450;s:4:"file";s:22:"2016/07/sas_terem1.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:22:"sas_terem1-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:22:"sas_terem1-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"2.7";s:6:"credit";s:0:"";s:6:"camera";s:21:"Canon PowerShot S3 IS";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1226402859";s:9:"copyright";s:0:"";s:12:"focal_length";s:1:"6";s:3:"iso";s:1:"0";s:13:"shutter_speed";s:17:"0.016666666666667";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(554, 170, '_wp_attached_file', '2016/07/sas-bejarat.jpg'),
(555, 170, '_wp_attachment_metadata', 'a:5:{s:5:"width";i:600;s:6:"height";i:450;s:4:"file";s:23:"2016/07/sas-bejarat.jpg";s:5:"sizes";a:2:{s:9:"thumbnail";a:4:{s:4:"file";s:23:"sas-bejarat-150x150.jpg";s:5:"width";i:150;s:6:"height";i:150;s:9:"mime-type";s:10:"image/jpeg";}s:6:"medium";a:4:{s:4:"file";s:23:"sas-bejarat-300x225.jpg";s:5:"width";i:300;s:6:"height";i:225;s:9:"mime-type";s:10:"image/jpeg";}}s:10:"image_meta";a:12:{s:8:"aperture";s:3:"2.8";s:6:"credit";s:0:"";s:6:"camera";s:23:"Canon PowerShot A720 IS";s:7:"caption";s:0:"";s:17:"created_timestamp";s:10:"1233596042";s:9:"copyright";s:0:"";s:12:"focal_length";s:3:"5.8";s:3:"iso";s:3:"200";s:13:"shutter_speed";s:4:"0.02";s:5:"title";s:0:"";s:11:"orientation";s:1:"1";s:8:"keywords";a:0:{}}}'),
(556, 165, 'pontos_cim', 'V. kerület, Sas utca 25, 6. emelet'),
(557, 165, '_pontos_cim', 'field_5799cbae5b7f4'),
(558, 165, 'terkep_iframe', '<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d21562.98551469398!2d19.05182!3d47.502123000000005!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4741dc14dce71f7b%3A0xe668266ab4b6c2c3!2sBudapest%2C+Sas+u.+25%2C+1051+Magyarorsz%C3%A1g!5e0!3m2!1shu!2sus!4v1469892723354" width="400" height="300" frameborder="0" style="border:0" allowfullscreen></iframe>'),
(559, 165, '_terkep_iframe', 'field_5799cb825b7f3'),
(560, 165, 'kepek', 'a:3:{i:0;s:3:"168";i:1;s:3:"169";i:2;s:3:"170";}'),
(561, 165, '_kepek', 'field_5799cbf95b7f5'),
(562, 144, 'field_579cc9119e382', 'a:14:{s:3:"key";s:19:"field_579cc9119e382";s:5:"label";s:22:"Kapcsolódó tanfolyam";s:4:"name";s:20:"kapcsolodo_tanfolyam";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:11:"tanfolyamok";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(564, 164, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"112";}'),
(565, 164, '_kapcsolodo_tanfolyam', 'field_579cc9119e382'),
(567, 112, '_edit_lock', '1519209398:2'),
(568, 112, '_edit_last', '1'),
(569, 112, 'celkozonseg', 'Fiatalok számára.'),
(570, 112, '_celkozonseg', 'field_577e3d8d78415'),
(571, 112, 'belepesi_feltetelek', 'Nincs semmilyen belépési feltétel. '),
(572, 112, '_belepesi_feltetelek', 'field_577e3ea478416'),
(573, 112, 'tesztek', ''),
(574, 112, '_tesztek', 'field_577e45414ba21'),
(575, 112, 'igazolas', 'oklevél'),
(576, 112, '_igazolas', 'field_577e43f7dfc0a'),
(577, 112, 'listaar', '50000'),
(578, 112, '_listaar', 'field_577e4404dfc0b'),
(579, 112, 'akcios_ar', '45000'),
(580, 112, '_akcios_ar', 'field_577e4409dfc0c'),
(581, 112, 'reszletfizetes', '1'),
(582, 112, '_reszletfizetes', 'field_577e4411dfc0d'),
(583, 112, 'tematika_0_cim', 'Ismerkedés'),
(584, 112, '_tematika_0_cim', 'field_577e443bdfc0f'),
(585, 112, 'tematika_0_leiras', 'Bemutatkozunk egymásnak, majd kezdjük a tanfolyamot.'),
(586, 112, '_tematika_0_leiras', 'field_577e4442dfc10'),
(587, 112, 'tematika_1_cim', 'Tanítás'),
(588, 112, '_tematika_1_cim', 'field_577e443bdfc0f'),
(589, 112, 'tematika_1_leiras', 'Fejest ugrunk a mélyvízbe, és megismerjük a VBA makróprogramozás kezdeti rejtelmeit.'),
(590, 112, '_tematika_1_leiras', 'field_577e4442dfc10'),
(591, 112, 'tematika', '2'),
(592, 112, '_tematika', 'field_577e4430dfc0e'),
(593, 112, 'demovideok_0_link', '<iframe width="420" height="315" src="https://www.youtube.com/embed/a3PmCexDvNU" frameborder="0" allowfullscreen></iframe>'),
(594, 112, '_demovideok_0_link', 'field_577e4471dfc12'),
(595, 112, 'demovideok_1_link', '<iframe width="420" height="315" src="https://www.youtube.com/embed/a3PmCexDvNU" frameborder="0" allowfullscreen></iframe>'),
(596, 112, '_demovideok_1_link', 'field_577e4471dfc12'),
(597, 112, 'demovideok', '2'),
(598, 112, '_demovideok', 'field_577e4451dfc11'),
(599, 112, 'referenciak', 'a:1:{i:0;s:2:"73";}'),
(600, 112, '_referenciak', 'field_577e45174ba20'),
(601, 112, 'uj_e', '1'),
(602, 112, '_uj_e', 'field_577e456f4ba22'),
(603, 112, 'aktiv_e', '1'),
(604, 112, '_aktiv_e', 'field_577e45954ba23') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(605, 112, 'access_kod', ''),
(606, 112, '_access_kod', 'field_5799cdc6d9cb2'),
(607, 112, 'mark_posts_term_id', ''),
(610, 144, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:16:"tanfolyam-kiiras";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(611, 171, '_edit_last', '2'),
(612, 171, '_edit_lock', '1519210646:2'),
(613, 171, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"112";}'),
(614, 171, '_kapcsolodo_tanfolyam', 'field_579cc9119e382'),
(615, 171, 'tanar', 'a:1:{i:0;s:3:"166";}'),
(616, 171, '_tanar', 'field_5799caed41a4a'),
(617, 171, 'helyszin', 'a:1:{i:0;s:3:"165";}'),
(618, 171, '_helyszin', 'field_5799cc0e5a5af'),
(619, 171, 'kezdes', '20170112'),
(620, 171, '_kezdes', 'field_5799cd459eeba'),
(621, 171, 'vege', '20170317'),
(622, 171, '_vege', 'field_5799cd619eebb'),
(623, 171, 'napszak', 'esti'),
(624, 171, '_napszak', 'field_5799cd6b9eebc'),
(625, 171, 'beosztas', '10-14'),
(626, 171, '_beosztas', 'field_5799cd709eebd'),
(627, 171, 'minimum_letszam', '5'),
(628, 171, '_minimum_letszam', 'field_5799ce4a9eebe'),
(629, 171, 'maximum_letszam', '20'),
(630, 171, '_maximum_letszam', 'field_5799ce5b9eebf'),
(631, 171, 'beiratkozva', '3'),
(632, 171, '_beiratkozva', 'field_5799cf379eec0'),
(633, 175, '_edit_last', '1'),
(635, 175, 'position', 'normal'),
(636, 175, 'layout', 'default'),
(637, 175, 'hide_on_screen', ''),
(638, 175, '_edit_lock', '1472318530:1'),
(643, 175, 'field_57aafb990e4e4', 'a:12:{s:3:"key";s:19:"field_57aafb990e4e4";s:5:"label";s:32:"Honnan értesult a képzésről?";s:4:"name";s:27:"honnan_ertesult_a_kepzesrol";s:4:"type";s:6:"select";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:7:"choices";a:3:{s:14:"Google reklám";s:14:"Google reklám";s:16:"Facebook reklám";s:16:"Facebook reklám";s:20:"Személyes ajánlás";s:20:"Személyes ajánlás";}s:13:"default_value";s:9:"Válassz!";s:10:"allow_null";s:1:"0";s:8:"multiple";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(648, 175, 'field_57aafeb781b2d', 'a:8:{s:3:"key";s:19:"field_57aafeb781b2d";s:5:"label";s:10:"Személyes";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(649, 175, 'field_57aaff6381b2e', 'a:8:{s:3:"key";s:19:"field_57aaff6381b2e";s:5:"label";s:26:"Tanfolyam szakmai tartalma";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(650, 175, 'field_57aaff9881b2f', 'a:13:{s:3:"key";s:19:"field_57aaff9881b2f";s:5:"label";s:20:"Mennyire elégedett?";s:4:"name";s:18:"mennyire_elegedett";s:4:"type";s:8:"repeater";s:12:"instructions";s:88:"Elõzetes tájékoztatás, weboldal és személyes információkkal mennyire elégedett?";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57aaffd181b30";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57aaffe981b31";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:3;}'),
(652, 175, 'field_57ab33d3f4c0d', 'a:13:{s:3:"key";s:19:"field_57ab33d3f4c0d";s:5:"label";s:28:"Megfelelt e az elvarasainak?";s:4:"name";s:27:"megfelelt_e_az_elvarasainak";s:4:"type";s:8:"repeater";s:12:"instructions";s:30:"Megfelelt-e az elvárásainak?";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab33d3f4c0e";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab33d3f4c0f";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:4;}'),
(653, 175, 'field_57ab342ef4c10', 'a:13:{s:3:"key";s:19:"field_57ab342ef4c10";s:5:"label";s:22:"Tananyag felépítése";s:4:"name";s:19:"tananyag_felepitese";s:4:"type";s:8:"repeater";s:12:"instructions";s:22:"Tananyag felépítése";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab342ef4c11";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab342ef4c12";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:5;}'),
(654, 175, 'field_57ab3442f4c13', 'a:13:{s:3:"key";s:19:"field_57ab3442f4c13";s:5:"label";s:37:"Gyakorlati feladatok életszerûsége";s:4:"name";s:35:"gyakorlati_feladatok_eletszerûsege";s:4:"type";s:8:"repeater";s:12:"instructions";s:37:"Gyakorlati feladatok életszerûsége";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab3442f4c14";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab3442f4c15";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:6;}'),
(655, 175, 'field_57ab3458f4c16', 'a:13:{s:3:"key";s:19:"field_57ab3458f4c16";s:5:"label";s:32:"Segédanyagok használhatósága";s:4:"name";s:28:"segedanyagok_hasznalhatosaga";s:4:"type";s:8:"repeater";s:12:"instructions";s:32:"Segédanyagok használhatósága";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab3458f4c17";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab3458f4c18";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:7;}'),
(656, 175, 'field_57ab3468f4c19', 'a:13:{s:3:"key";s:19:"field_57ab3468f4c19";s:5:"label";s:42:"Milyen arányban szerzett új ismereteket?";s:4:"name";s:39:"milyen_aranyban_szerzett_uj_ismereteket";s:4:"type";s:8:"repeater";s:12:"instructions";s:42:"Milyen arányban szerzett új ismereteket?";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab3468f4c1a";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab3468f4c1b";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:8;}'),
(658, 175, 'field_57ab34a7f4c20', 'a:13:{s:3:"key";s:19:"field_57ab34a7f4c20";s:5:"label";s:53:"Milyen arányban fogja használni az új ismereteket?";s:4:"name";s:49:"milyen_aranyban_fogja_hasznalni_az_uj_ismereteket";s:4:"type";s:8:"repeater";s:12:"instructions";s:53:"Milyen arányban fogja használni az új ismereteket?";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab34a7f4c21";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab34a7f4c22";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:9;}'),
(659, 175, 'field_57ab34cdf4c23', 'a:13:{s:3:"key";s:19:"field_57ab34cdf4c23";s:5:"label";s:34:"Melyik rész tetszett a legjobban?";s:4:"name";s:32:"melyik_resz_tetszett_a_legjobban";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:10;}'),
(660, 175, 'field_57ab34d5f4c24', 'a:8:{s:3:"key";s:19:"field_57ab34d5f4c24";s:5:"label";s:7:"Tréner";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:11;}'),
(661, 175, 'field_57ab34e7f4c25', 'a:13:{s:3:"key";s:19:"field_57ab34e7f4c25";s:5:"label";s:25:"Szakmai felkészültsége";s:4:"name";s:22:"szakmai_felkeszultsege";s:4:"type";s:8:"repeater";s:12:"instructions";s:25:"Szakmai felkészültsége";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab34e7f4c26";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab34e7f4c27";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:12;}'),
(662, 175, 'field_57ab34f8f4c28', 'a:13:{s:3:"key";s:19:"field_57ab34f8f4c28";s:5:"label";s:19:"Elõadói készség";s:4:"name";s:15:"eloadoi_keszseg";s:4:"type";s:8:"repeater";s:12:"instructions";s:19:"Elõadói készség";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab34f8f4c29";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab34f8f4c2a";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:13;}'),
(663, 175, 'field_57ab3519f4c2c', 'a:13:{s:3:"key";s:19:"field_57ab3519f4c2c";s:5:"label";s:18:"Segítõ készség";s:4:"name";s:14:"segito_keszseg";s:4:"type";s:8:"repeater";s:12:"instructions";s:18:"Segítõ készség";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab3519f4c2d";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab3519f4c2e";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:14;}'),
(664, 175, 'field_57ab352ef4c2f', 'a:13:{s:3:"key";s:19:"field_57ab352ef4c2f";s:5:"label";s:24:"Csoporthoz való viszony";s:4:"name";s:23:"csoporthoz_valo_viszony";s:4:"type";s:8:"repeater";s:12:"instructions";s:35:"Csoporthoz való viszony, igazodás";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab352ef4c30";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab352ef4c31";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:15;}'),
(665, 175, 'field_57ab3541f4c32', 'a:8:{s:3:"key";s:19:"field_57ab3541f4c32";s:5:"label";s:10:"Környezet";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:16;}'),
(666, 175, 'field_57ab354ff4c33', 'a:13:{s:3:"key";s:19:"field_57ab354ff4c33";s:5:"label";s:30:"Infrastruktúrális környezet";s:4:"name";s:27:"infrastrukturalis_kornyezet";s:4:"type";s:8:"repeater";s:12:"instructions";s:30:"Infrastruktúrális környezet";s:8:"required";s:1:"0";s:10:"sub_fields";a:2:{i:0;a:16:{s:3:"key";s:19:"field_57ab354ff4c34";s:5:"label";s:12:"Értékelés";s:4:"name";s:10:"értekeles";s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:1:"1";s:3:"max";s:1:"5";s:4:"step";s:1:"1";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}i:1;a:14:{s:3:"key";s:19:"field_57ab354ff4c35";s:5:"label";s:11:"Megjegyzés";s:4:"name";s:10:"megjegyzes";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:12:"column_width";s:0:"";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}}s:7:"row_min";s:1:"1";s:9:"row_limit";s:1:"1";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:17;}'),
(667, 175, 'field_57ab3575f4c36', 'a:8:{s:3:"key";s:19:"field_57ab3575f4c36";s:5:"label";s:13:"Összesítés";s:4:"name";s:0:"";s:4:"type";s:3:"tab";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:18;}'),
(668, 175, 'field_57ab358df4c3a', 'a:13:{s:3:"key";s:19:"field_57ab358df4c3a";s:5:"label";s:32:"Összességében hogy értékeli";s:4:"name";s:28:"összessegeben_hogy_ertekeli";s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:10:"formatting";s:2:"br";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:19;}'),
(673, 183, '_edit_last', '1'),
(674, 183, 'field_57ab3b83a01b2', 'a:14:{s:3:"key";s:19:"field_57ab3b83a01b2";s:5:"label";s:21:"Kapcsolodó tanfolyam";s:4:"name";s:20:"kapcsolodo_tanfolyam";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:6:"object";s:9:"post_type";a:1:{i:0;s:11:"tanfolyamok";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:0;}'),
(675, 183, 'field_57ab3b8da01b3', 'a:14:{s:3:"key";s:19:"field_57ab3b8da01b3";s:5:"label";s:5:"datum";s:4:"name";s:5:"datum";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:1;}'),
(676, 183, 'field_57ab3b9aa01b4', 'a:14:{s:3:"key";s:19:"field_57ab3b9aa01b4";s:5:"label";s:6:"Oktato";s:4:"name";s:6:"oktato";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:2;}'),
(677, 183, 'field_57ab3ba0a01b5', 'a:14:{s:3:"key";s:19:"field_57ab3ba0a01b5";s:5:"label";s:6:"Cegnev";s:4:"name";s:6:"cegnev";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:3;}'),
(678, 183, 'field_57ab3ba5a01b6', 'a:14:{s:3:"key";s:19:"field_57ab3ba5a01b6";s:5:"label";s:8:"Helyszin";s:4:"name";s:8:"helyszin";s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:4:"null";s:8:"operator";s:2:"==";s:5:"value";s:0:"";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:4;}'),
(680, 183, 'position', 'normal'),
(681, 183, 'layout', 'default'),
(682, 183, 'hide_on_screen', ''),
(683, 183, '_edit_lock', '1470844127:1'),
(686, 185, '_edit_last', '1'),
(687, 185, '_edit_lock', '1470844122:1'),
(688, 185, 'tanfolyam', ''),
(689, 185, '_tanfolyam', 'field_57ab3b83a01b2'),
(690, 185, 'datum', 'asd'),
(691, 185, '_datum', 'field_57ab3b8da01b3'),
(692, 185, 'oktato', ''),
(693, 185, '_oktato', 'field_57ab3b9aa01b4'),
(694, 185, 'cegnev', ''),
(695, 185, '_cegnev', 'field_57ab3ba0a01b5'),
(696, 185, 'helyszin', ''),
(697, 185, '_helyszin', 'field_57ab3ba5a01b6'),
(698, 185, 'honnan_ertesult_a_kepzesrol', 'Személyes ajánlás'),
(699, 185, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(700, 185, 'mennyire_elegedett_0_értekeles', ''),
(701, 185, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(702, 185, 'mennyire_elegedett_0_megjegyzes', ''),
(703, 185, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(704, 185, 'mennyire_elegedett', '1'),
(705, 185, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(706, 185, 'megfelelt_e_az_elvarasainak_0_értekeles', ''),
(707, 185, '_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e'),
(708, 185, 'megfelelt_e_az_elvarasainak_0_megjegyzes', ''),
(709, 185, '_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f'),
(710, 185, 'megfelelt_e_az_elvarasainak', '1'),
(711, 185, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(712, 185, 'tananyag_felepitese_0_értekeles', ''),
(713, 185, '_tananyag_felepitese_0_értekeles', 'field_57ab342ef4c11'),
(714, 185, 'tananyag_felepitese_0_megjegyzes', ''),
(715, 185, '_tananyag_felepitese_0_megjegyzes', 'field_57ab342ef4c12'),
(716, 185, 'tananyag_felepitese', '1'),
(717, 185, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(718, 185, 'gyakorlati_feladatok_eletszerûsege_0_értekeles', ''),
(719, 185, '_gyakorlati_feladatok_eletszerûsege_0_értekeles', 'field_57ab3442f4c14'),
(720, 185, 'gyakorlati_feladatok_eletszerûsege_0_megjegyzes', ''),
(721, 185, '_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'field_57ab3442f4c15'),
(722, 185, 'gyakorlati_feladatok_eletszerûsege', '1'),
(723, 185, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(724, 185, 'segedanyagok_hasznalhatosaga_0_értekeles', '') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(725, 185, '_segedanyagok_hasznalhatosaga_0_értekeles', 'field_57ab3458f4c17'),
(726, 185, 'segedanyagok_hasznalhatosaga_0_megjegyzes', ''),
(727, 185, '_segedanyagok_hasznalhatosaga_0_megjegyzes', 'field_57ab3458f4c18'),
(728, 185, 'segedanyagok_hasznalhatosaga', '1'),
(729, 185, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(730, 185, 'milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', ''),
(731, 185, '_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', 'field_57ab3468f4c1a'),
(732, 185, 'milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', ''),
(733, 185, '_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'field_57ab3468f4c1b'),
(734, 185, 'milyen_aranyban_szerzett_uj_ismereteket', '1'),
(735, 185, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(736, 185, 'új_ismeretek_0_értekeles', ''),
(737, 185, '_új_ismeretek_0_értekeles', 'field_57ab3487f4c1e'),
(738, 185, 'új_ismeretek_0_megjegyzes', ''),
(739, 185, '_új_ismeretek_0_megjegyzes', 'field_57ab3487f4c1f'),
(740, 185, 'új_ismeretek', '1'),
(741, 185, '_új_ismeretek', 'field_57ab3487f4c1d'),
(742, 185, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', ''),
(743, 185, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', 'field_57ab34a7f4c21'),
(744, 185, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', ''),
(745, 185, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'field_57ab34a7f4c22'),
(746, 185, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '1'),
(747, 185, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(748, 185, 'melyik_resz_tetszett_a_legjobban', ''),
(749, 185, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(750, 185, 'szakmai_felkeszultsege_0_értekeles', ''),
(751, 185, '_szakmai_felkeszultsege_0_értekeles', 'field_57ab34e7f4c26'),
(752, 185, 'szakmai_felkeszultsege_0_megjegyzes', ''),
(753, 185, '_szakmai_felkeszultsege_0_megjegyzes', 'field_57ab34e7f4c27'),
(754, 185, 'szakmai_felkeszultsege', '1'),
(755, 185, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(756, 185, 'elõadoi_keszseg_0_értekeles', ''),
(757, 185, '_elõadoi_keszseg_0_értekeles', 'field_57ab34f8f4c29'),
(758, 185, 'elõadoi_keszseg_0_megjegyzes', ''),
(759, 185, '_elõadoi_keszseg_0_megjegyzes', 'field_57ab34f8f4c2a'),
(760, 185, 'elõadoi_keszseg', '1'),
(761, 185, '_elõadoi_keszseg', 'field_57ab34f8f4c28'),
(762, 185, 'segitõ_keszseg_0_értekeles', ''),
(763, 185, '_segitõ_keszseg_0_értekeles', 'field_57ab3519f4c2d'),
(764, 185, 'segitõ_keszseg_0_megjegyzes', ''),
(765, 185, '_segitõ_keszseg_0_megjegyzes', 'field_57ab3519f4c2e'),
(766, 185, 'segitõ_keszseg', '1'),
(767, 185, '_segitõ_keszseg', 'field_57ab3519f4c2c'),
(768, 185, 'csoporthoz_valo_viszony_0_értekeles', ''),
(769, 185, '_csoporthoz_valo_viszony_0_értekeles', 'field_57ab352ef4c30'),
(770, 185, 'csoporthoz_valo_viszony_0_megjegyzes', ''),
(771, 185, '_csoporthoz_valo_viszony_0_megjegyzes', 'field_57ab352ef4c31'),
(772, 185, 'csoporthoz_valo_viszony', '1'),
(773, 185, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(774, 185, 'infrastrukturalis_kornyezet_0_értekeles', ''),
(775, 185, '_infrastrukturalis_kornyezet_0_értekeles', 'field_57ab354ff4c34'),
(776, 185, 'infrastrukturalis_kornyezet_0_megjegyzes', ''),
(777, 185, '_infrastrukturalis_kornyezet_0_megjegyzes', 'field_57ab354ff4c35'),
(778, 185, 'infrastrukturalis_kornyezet', '1'),
(779, 185, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(780, 185, 'összessegeben_hogy_ertekeli', ''),
(781, 185, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(786, 183, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:11:"ertekelesek";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(787, 185, 'kapcsolodo_tanfolyam', ''),
(788, 185, '_kapcsolodo_tanfolyam', 'field_57ab3b83a01b2'),
(789, 186, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"117";}'),
(790, 186, '_kapcsolodo_tanfolyam', 'field_kapcsolodo_tanfolyam'),
(791, 187, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"117";}'),
(792, 187, '_kapcsolodo_tanfolyam', 'field_57ab3b83a01b2'),
(793, 187, '_edit_lock', '1472309649:1'),
(794, 188, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"117";}'),
(795, 188, '_kapcsolodo_tanfolyam', 'field_57ab3b83a01b2'),
(796, 188, '_edit_lock', '1472310459:1'),
(797, 189, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"117";}'),
(798, 189, '_kapcsolodo_tanfolyam', 'field_57ab3b83a01b2'),
(799, 189, '_edit_lock', '1472311233:1'),
(800, 175, 'field_57c1556a9e801', 'a:14:{s:3:"key";s:19:"field_57c1556a9e801";s:5:"label";s:22:"Kapcsolodo ertekelesek";s:4:"name";s:22:"kapcsolodo_ertekelesek";s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";s:1:"0";s:13:"return_format";s:6:"object";s:9:"post_type";a:1:{i:0;s:11:"ertekelesek";}s:8:"taxonomy";a:1:{i:0;s:3:"all";}s:7:"filters";a:1:{i:0;s:6:"search";}s:15:"result_elements";a:1:{i:0;s:9:"post_type";}s:3:"max";s:0:"";s:17:"conditional_logic";a:3:{s:6:"status";s:1:"0";s:5:"rules";a:1:{i:0;a:3:{s:5:"field";s:19:"field_57aafb990e4e4";s:8:"operator";s:2:"==";s:5:"value";s:14:"Google reklám";}}s:8:"allorany";s:3:"all";}s:8:"order_no";i:20;}'),
(1163, 195, 'honnan_ertesult_a_kepzesrol', 'Facebook reklám'),
(1164, 195, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1165, 195, 'mennyire_elegedett_0_értekeles', '3'),
(1166, 195, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1167, 195, 'mennyire_elegedett_0_megjegyzes', 'jooo'),
(1168, 195, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1169, 195, 'mennyire_elegedett', '1'),
(1170, 195, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1171, 195, 'megfelelt_e_az_elvarasainak_0_értekeles', '4'),
(1172, 195, '_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e'),
(1173, 195, 'megfelelt_e_az_elvarasainak_0_megjegyzes', 'nagyon'),
(1174, 195, '_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f'),
(1175, 195, 'megfelelt_e_az_elvarasainak', '1'),
(1176, 195, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1177, 195, 'tananyag_felepitese_0_értekeles', '5'),
(1178, 195, '_tananyag_felepitese_0_értekeles', 'field_57ab342ef4c11'),
(1179, 195, 'tananyag_felepitese_0_megjegyzes', 'yess'),
(1180, 195, '_tananyag_felepitese_0_megjegyzes', 'field_57ab342ef4c12'),
(1181, 195, 'tananyag_felepitese', '1'),
(1182, 195, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1183, 195, 'gyakorlati_feladatok_eletszerûsege_0_értekeles', '5'),
(1184, 195, '_gyakorlati_feladatok_eletszerûsege_0_értekeles', 'field_57ab3442f4c14'),
(1185, 195, 'gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'jo...'),
(1186, 195, '_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'field_57ab3442f4c15'),
(1187, 195, 'gyakorlati_feladatok_eletszerûsege', '1'),
(1188, 195, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1189, 195, 'segedanyagok_hasznalhatosaga_0_értekeles', '1'),
(1190, 195, '_segedanyagok_hasznalhatosaga_0_értekeles', 'field_57ab3458f4c17') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1191, 195, 'segedanyagok_hasznalhatosaga_0_megjegyzes', 'hát ez szar volt..'),
(1192, 195, '_segedanyagok_hasznalhatosaga_0_megjegyzes', 'field_57ab3458f4c18'),
(1193, 195, 'segedanyagok_hasznalhatosaga', '1'),
(1194, 195, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1195, 195, 'milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', '4'),
(1196, 195, '_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', 'field_57ab3468f4c1a'),
(1197, 195, 'milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'jooo'),
(1198, 195, '_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'field_57ab3468f4c1b'),
(1199, 195, 'milyen_aranyban_szerzett_uj_ismereteket', '1'),
(1200, 195, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1201, 195, 'új_ismeretek_0_értekeles', '3'),
(1202, 195, '_új_ismeretek_0_értekeles', 'field_57ab3487f4c1e'),
(1203, 195, 'új_ismeretek_0_megjegyzes', 'béna'),
(1204, 195, '_új_ismeretek_0_megjegyzes', 'field_57ab3487f4c1f'),
(1205, 195, 'új_ismeretek', '1'),
(1206, 195, '_új_ismeretek', 'field_57ab3487f4c1d'),
(1207, 195, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', '4'),
(1208, 195, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', 'field_57ab34a7f4c21'),
(1209, 195, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'eléggé'),
(1210, 195, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'field_57ab34a7f4c22'),
(1211, 195, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '1'),
(1212, 195, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1213, 195, 'melyik_resz_tetszett_a_legjobban', 'mindegyik.'),
(1214, 195, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1215, 195, 'szakmai_felkeszultsege_0_értekeles', '5'),
(1216, 195, '_szakmai_felkeszultsege_0_értekeles', 'field_57ab34e7f4c26'),
(1217, 195, 'szakmai_felkeszultsege_0_megjegyzes', 'kiraly'),
(1218, 195, '_szakmai_felkeszultsege_0_megjegyzes', 'field_57ab34e7f4c27'),
(1219, 195, 'szakmai_felkeszultsege', '1'),
(1220, 195, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1221, 195, 'elõadoi_keszseg_0_értekeles', '4'),
(1222, 195, '_elõadoi_keszseg_0_értekeles', 'field_57ab34f8f4c29'),
(1223, 195, 'elõadoi_keszseg_0_megjegyzes', 'jo'),
(1224, 195, '_elõadoi_keszseg_0_megjegyzes', 'field_57ab34f8f4c2a'),
(1225, 195, 'elõadoi_keszseg', '1'),
(1226, 195, '_elõadoi_keszseg', 'field_57ab34f8f4c28'),
(1227, 195, 'segitõ_keszseg_0_értekeles', '4'),
(1228, 195, '_segitõ_keszseg_0_értekeles', 'field_57ab3519f4c2d'),
(1229, 195, 'segitõ_keszseg_0_megjegyzes', 'klll'),
(1230, 195, '_segitõ_keszseg_0_megjegyzes', 'field_57ab3519f4c2e'),
(1231, 195, 'segitõ_keszseg', '1'),
(1232, 195, '_segitõ_keszseg', 'field_57ab3519f4c2c'),
(1233, 195, 'csoporthoz_valo_viszony_0_értekeles', '4'),
(1234, 195, '_csoporthoz_valo_viszony_0_értekeles', 'field_57ab352ef4c30'),
(1235, 195, 'csoporthoz_valo_viszony_0_megjegyzes', 'ko'),
(1236, 195, '_csoporthoz_valo_viszony_0_megjegyzes', 'field_57ab352ef4c31'),
(1237, 195, 'csoporthoz_valo_viszony', '1'),
(1238, 195, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1239, 195, 'infrastrukturalis_kornyezet_0_értekeles', '5'),
(1240, 195, '_infrastrukturalis_kornyezet_0_értekeles', 'field_57ab354ff4c34'),
(1241, 195, 'infrastrukturalis_kornyezet_0_megjegyzes', 'tiszta'),
(1242, 195, '_infrastrukturalis_kornyezet_0_megjegyzes', 'field_57ab354ff4c35'),
(1243, 195, 'infrastrukturalis_kornyezet', '1'),
(1244, 195, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1245, 195, 'összessegeben_hogy_ertekeli', 'yess'),
(1246, 195, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1247, 195, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"188";}'),
(1248, 195, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1249, 195, '_edit_lock', '1472304957:1'),
(1250, 196, 'honnan_ertesult_a_kepzesrol', 'Google reklám'),
(1251, 196, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1252, 196, 'mennyire_elegedett_0_értekeles', '5'),
(1253, 196, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1254, 196, 'mennyire_elegedett_0_megjegyzes', 'jjj'),
(1255, 196, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1256, 196, 'mennyire_elegedett', '1'),
(1257, 196, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1258, 196, 'megfelelt_e_az_elvarasainak_0_értekeles', '3'),
(1259, 196, '_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e'),
(1260, 196, 'megfelelt_e_az_elvarasainak_0_megjegyzes', 'sda'),
(1261, 196, '_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f'),
(1262, 196, 'megfelelt_e_az_elvarasainak', '1'),
(1263, 196, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1264, 196, 'tananyag_felepitese_0_értekeles', '4'),
(1265, 196, '_tananyag_felepitese_0_értekeles', 'field_57ab342ef4c11'),
(1266, 196, 'tananyag_felepitese_0_megjegyzes', 'sd'),
(1267, 196, '_tananyag_felepitese_0_megjegyzes', 'field_57ab342ef4c12'),
(1268, 196, 'tananyag_felepitese', '1'),
(1269, 196, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1270, 196, 'gyakorlati_feladatok_eletszerûsege_0_értekeles', '1'),
(1271, 196, '_gyakorlati_feladatok_eletszerûsege_0_értekeles', 'field_57ab3442f4c14'),
(1272, 196, 'gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'sdd'),
(1273, 196, '_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'field_57ab3442f4c15'),
(1274, 196, 'gyakorlati_feladatok_eletszerûsege', '1'),
(1275, 196, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1276, 196, 'segedanyagok_hasznalhatosaga_0_értekeles', '4'),
(1277, 196, '_segedanyagok_hasznalhatosaga_0_értekeles', 'field_57ab3458f4c17'),
(1278, 196, 'segedanyagok_hasznalhatosaga_0_megjegyzes', 'ds'),
(1279, 196, '_segedanyagok_hasznalhatosaga_0_megjegyzes', 'field_57ab3458f4c18'),
(1280, 196, 'segedanyagok_hasznalhatosaga', '1'),
(1281, 196, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1282, 196, 'milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', '4'),
(1283, 196, '_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', 'field_57ab3468f4c1a'),
(1284, 196, 'milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'dassa'),
(1285, 196, '_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'field_57ab3468f4c1b'),
(1286, 196, 'milyen_aranyban_szerzett_uj_ismereteket', '1'),
(1287, 196, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1288, 196, 'új_ismeretek_0_értekeles', '3'),
(1289, 196, '_új_ismeretek_0_értekeles', 'field_57ab3487f4c1e'),
(1290, 196, 'új_ismeretek_0_megjegyzes', 'dasd') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1291, 196, '_új_ismeretek_0_megjegyzes', 'field_57ab3487f4c1f'),
(1292, 196, 'új_ismeretek', '1'),
(1293, 196, '_új_ismeretek', 'field_57ab3487f4c1d'),
(1294, 196, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', '4'),
(1295, 196, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', 'field_57ab34a7f4c21'),
(1296, 196, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'sdsd'),
(1297, 196, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'field_57ab34a7f4c22'),
(1298, 196, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '1'),
(1299, 196, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1300, 196, 'melyik_resz_tetszett_a_legjobban', 'dasdsad'),
(1301, 196, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1302, 196, 'szakmai_felkeszultsege_0_értekeles', '3'),
(1303, 196, '_szakmai_felkeszultsege_0_értekeles', 'field_57ab34e7f4c26'),
(1304, 196, 'szakmai_felkeszultsege_0_megjegyzes', 'll'),
(1305, 196, '_szakmai_felkeszultsege_0_megjegyzes', 'field_57ab34e7f4c27'),
(1306, 196, 'szakmai_felkeszultsege', '1'),
(1307, 196, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1308, 196, 'elõadoi_keszseg_0_értekeles', '5'),
(1309, 196, '_elõadoi_keszseg_0_értekeles', 'field_57ab34f8f4c29'),
(1310, 196, 'elõadoi_keszseg_0_megjegyzes', 'njinjk'),
(1311, 196, '_elõadoi_keszseg_0_megjegyzes', 'field_57ab34f8f4c2a'),
(1312, 196, 'elõadoi_keszseg', '1'),
(1313, 196, '_elõadoi_keszseg', 'field_57ab34f8f4c28'),
(1314, 196, 'segitõ_keszseg_0_értekeles', '5'),
(1315, 196, '_segitõ_keszseg_0_értekeles', 'field_57ab3519f4c2d'),
(1316, 196, 'segitõ_keszseg_0_megjegyzes', 'l'),
(1317, 196, '_segitõ_keszseg_0_megjegyzes', 'field_57ab3519f4c2e'),
(1318, 196, 'segitõ_keszseg', '1'),
(1319, 196, '_segitõ_keszseg', 'field_57ab3519f4c2c'),
(1320, 196, 'csoporthoz_valo_viszony_0_értekeles', '5'),
(1321, 196, '_csoporthoz_valo_viszony_0_értekeles', 'field_57ab352ef4c30'),
(1322, 196, 'csoporthoz_valo_viszony_0_megjegyzes', 'hjhj'),
(1323, 196, '_csoporthoz_valo_viszony_0_megjegyzes', 'field_57ab352ef4c31'),
(1324, 196, 'csoporthoz_valo_viszony', '1'),
(1325, 196, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1326, 196, 'infrastrukturalis_kornyezet_0_értekeles', '4'),
(1327, 196, '_infrastrukturalis_kornyezet_0_értekeles', 'field_57ab354ff4c34'),
(1328, 196, 'infrastrukturalis_kornyezet_0_megjegyzes', 'huhj'),
(1329, 196, '_infrastrukturalis_kornyezet_0_megjegyzes', 'field_57ab354ff4c35'),
(1330, 196, 'infrastrukturalis_kornyezet', '1'),
(1331, 196, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1332, 196, 'összessegeben_hogy_ertekeli', 'buhbhjk'),
(1333, 196, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1334, 196, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"188";}'),
(1335, 196, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1336, 197, 'honnan_ertesult_a_kepzesrol', 'Személyes ajánlás'),
(1337, 197, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1338, 197, 'mennyire_elegedett_0_értekeles', '4'),
(1339, 197, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1340, 197, 'mennyire_elegedett_0_megjegyzes', 'jjj'),
(1341, 197, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1342, 197, 'mennyire_elegedett', '1'),
(1343, 197, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1344, 197, 'megfelelt_e_az_elvarasainak_0_értekeles', '4'),
(1345, 197, '_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e'),
(1346, 197, 'megfelelt_e_az_elvarasainak_0_megjegyzes', 'SDAASD'),
(1347, 197, '_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f'),
(1348, 197, 'megfelelt_e_az_elvarasainak', '1'),
(1349, 197, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1350, 197, 'tananyag_felepitese_0_értekeles', '3'),
(1351, 197, '_tananyag_felepitese_0_értekeles', 'field_57ab342ef4c11'),
(1352, 197, 'tananyag_felepitese_0_megjegyzes', 'sdad'),
(1353, 197, '_tananyag_felepitese_0_megjegyzes', 'field_57ab342ef4c12'),
(1354, 197, 'tananyag_felepitese', '1'),
(1355, 197, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1356, 197, 'gyakorlati_feladatok_eletszerûsege_0_értekeles', '3'),
(1357, 197, '_gyakorlati_feladatok_eletszerûsege_0_értekeles', 'field_57ab3442f4c14'),
(1358, 197, 'gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'sdaddsa'),
(1359, 197, '_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'field_57ab3442f4c15'),
(1360, 197, 'gyakorlati_feladatok_eletszerûsege', '1'),
(1361, 197, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1362, 197, 'segedanyagok_hasznalhatosaga_0_értekeles', '4'),
(1363, 197, '_segedanyagok_hasznalhatosaga_0_értekeles', 'field_57ab3458f4c17'),
(1364, 197, 'segedanyagok_hasznalhatosaga_0_megjegyzes', 'ss'),
(1365, 197, '_segedanyagok_hasznalhatosaga_0_megjegyzes', 'field_57ab3458f4c18'),
(1366, 197, 'segedanyagok_hasznalhatosaga', '1'),
(1367, 197, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1368, 197, 'milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', '4'),
(1369, 197, '_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', 'field_57ab3468f4c1a'),
(1370, 197, 'milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'ssss'),
(1371, 197, '_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'field_57ab3468f4c1b'),
(1372, 197, 'milyen_aranyban_szerzett_uj_ismereteket', '1'),
(1373, 197, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1374, 197, 'új_ismeretek_0_értekeles', '3'),
(1375, 197, '_új_ismeretek_0_értekeles', 'field_57ab3487f4c1e'),
(1376, 197, 'új_ismeretek_0_megjegyzes', 'aaa'),
(1377, 197, '_új_ismeretek_0_megjegyzes', 'field_57ab3487f4c1f'),
(1378, 197, 'új_ismeretek', '1'),
(1379, 197, '_új_ismeretek', 'field_57ab3487f4c1d'),
(1380, 197, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', '5'),
(1381, 197, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', 'field_57ab34a7f4c21'),
(1382, 197, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'dddd'),
(1383, 197, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'field_57ab34a7f4c22'),
(1384, 197, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '1'),
(1385, 197, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1386, 197, 'melyik_resz_tetszett_a_legjobban', 'sqdsadasd'),
(1387, 197, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1388, 197, 'szakmai_felkeszultsege_0_értekeles', '5'),
(1389, 197, '_szakmai_felkeszultsege_0_értekeles', 'field_57ab34e7f4c26'),
(1390, 197, 'szakmai_felkeszultsege_0_megjegyzes', 'sdsdsd') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1391, 197, '_szakmai_felkeszultsege_0_megjegyzes', 'field_57ab34e7f4c27'),
(1392, 197, 'szakmai_felkeszultsege', '1'),
(1393, 197, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1394, 197, 'elõadoi_keszseg_0_értekeles', '4'),
(1395, 197, '_elõadoi_keszseg_0_értekeles', 'field_57ab34f8f4c29'),
(1396, 197, 'elõadoi_keszseg_0_megjegyzes', 'asd'),
(1397, 197, '_elõadoi_keszseg_0_megjegyzes', 'field_57ab34f8f4c2a'),
(1398, 197, 'elõadoi_keszseg', '1'),
(1399, 197, '_elõadoi_keszseg', 'field_57ab34f8f4c28'),
(1400, 197, 'segitõ_keszseg_0_értekeles', '1'),
(1401, 197, '_segitõ_keszseg_0_értekeles', 'field_57ab3519f4c2d'),
(1402, 197, 'segitõ_keszseg_0_megjegyzes', 'asd'),
(1403, 197, '_segitõ_keszseg_0_megjegyzes', 'field_57ab3519f4c2e'),
(1404, 197, 'segitõ_keszseg', '1'),
(1405, 197, '_segitõ_keszseg', 'field_57ab3519f4c2c'),
(1406, 197, 'csoporthoz_valo_viszony_0_értekeles', '1'),
(1407, 197, '_csoporthoz_valo_viszony_0_értekeles', 'field_57ab352ef4c30'),
(1408, 197, 'csoporthoz_valo_viszony_0_megjegyzes', 'sadasd'),
(1409, 197, '_csoporthoz_valo_viszony_0_megjegyzes', 'field_57ab352ef4c31'),
(1410, 197, 'csoporthoz_valo_viszony', '1'),
(1411, 197, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1412, 197, 'infrastrukturalis_kornyezet_0_értekeles', '4'),
(1413, 197, '_infrastrukturalis_kornyezet_0_értekeles', 'field_57ab354ff4c34'),
(1414, 197, 'infrastrukturalis_kornyezet_0_megjegyzes', 'sadsad'),
(1415, 197, '_infrastrukturalis_kornyezet_0_megjegyzes', 'field_57ab354ff4c35'),
(1416, 197, 'infrastrukturalis_kornyezet', '1'),
(1417, 197, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1418, 197, 'összessegeben_hogy_ertekeli', 'asdasdasd'),
(1419, 197, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1420, 197, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"189";}'),
(1421, 197, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1422, 198, 'honnan_ertesult_a_kepzesrol', 'Facebook reklám'),
(1423, 198, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1424, 198, 'mennyire_elegedett_0_értekeles', '3'),
(1425, 198, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1426, 198, 'mennyire_elegedett_0_megjegyzes', 'jjj'),
(1427, 198, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1428, 198, 'mennyire_elegedett', '1'),
(1429, 198, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1430, 198, 'megfelelt_e_az_elvarasainak_0_értekeles', '5'),
(1431, 198, '_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e'),
(1432, 198, 'megfelelt_e_az_elvarasainak_0_megjegyzes', 'gdfggf'),
(1433, 198, '_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f'),
(1434, 198, 'megfelelt_e_az_elvarasainak', '1'),
(1435, 198, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1436, 198, 'tananyag_felepitese_0_értekeles', '4'),
(1437, 198, '_tananyag_felepitese_0_értekeles', 'field_57ab342ef4c11'),
(1438, 198, 'tananyag_felepitese_0_megjegyzes', 'fgdfg'),
(1439, 198, '_tananyag_felepitese_0_megjegyzes', 'field_57ab342ef4c12'),
(1440, 198, 'tananyag_felepitese', '1'),
(1441, 198, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1442, 198, 'gyakorlati_feladatok_eletszerûsege_0_értekeles', '1'),
(1443, 198, '_gyakorlati_feladatok_eletszerûsege_0_értekeles', 'field_57ab3442f4c14'),
(1444, 198, 'gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'dfgf'),
(1445, 198, '_gyakorlati_feladatok_eletszerûsege_0_megjegyzes', 'field_57ab3442f4c15'),
(1446, 198, 'gyakorlati_feladatok_eletszerûsege', '1'),
(1447, 198, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1448, 198, 'segedanyagok_hasznalhatosaga_0_értekeles', '4'),
(1449, 198, '_segedanyagok_hasznalhatosaga_0_értekeles', 'field_57ab3458f4c17'),
(1450, 198, 'segedanyagok_hasznalhatosaga_0_megjegyzes', 'dfgdfg'),
(1451, 198, '_segedanyagok_hasznalhatosaga_0_megjegyzes', 'field_57ab3458f4c18'),
(1452, 198, 'segedanyagok_hasznalhatosaga', '1'),
(1453, 198, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1454, 198, 'milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', '5'),
(1455, 198, '_milyen_aranyban_szerzett_uj_ismereteket_0_értekeles', 'field_57ab3468f4c1a'),
(1456, 198, 'milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'dfgdfg'),
(1457, 198, '_milyen_aranyban_szerzett_uj_ismereteket_0_megjegyzes', 'field_57ab3468f4c1b'),
(1458, 198, 'milyen_aranyban_szerzett_uj_ismereteket', '1'),
(1459, 198, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1460, 198, 'új_ismeretek_0_értekeles', '3'),
(1461, 198, '_új_ismeretek_0_értekeles', 'field_57ab3487f4c1e'),
(1462, 198, 'új_ismeretek_0_megjegyzes', 'dfgdfg'),
(1463, 198, '_új_ismeretek_0_megjegyzes', 'field_57ab3487f4c1f'),
(1464, 198, 'új_ismeretek', '1'),
(1465, 198, '_új_ismeretek', 'field_57ab3487f4c1d'),
(1466, 198, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', '1'),
(1467, 198, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_értekeles', 'field_57ab34a7f4c21'),
(1468, 198, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'dfg'),
(1469, 198, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket_0_megjegyzes', 'field_57ab34a7f4c22'),
(1470, 198, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '1'),
(1471, 198, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1472, 198, 'melyik_resz_tetszett_a_legjobban', 'dfgdfg'),
(1473, 198, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1474, 198, 'szakmai_felkeszultsege_0_értekeles', '4'),
(1475, 198, '_szakmai_felkeszultsege_0_értekeles', 'field_57ab34e7f4c26'),
(1476, 198, 'szakmai_felkeszultsege_0_megjegyzes', 'fdgf'),
(1477, 198, '_szakmai_felkeszultsege_0_megjegyzes', 'field_57ab34e7f4c27'),
(1478, 198, 'szakmai_felkeszultsege', '1'),
(1479, 198, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1480, 198, 'elõadoi_keszseg_0_értekeles', '4'),
(1481, 198, '_elõadoi_keszseg_0_értekeles', 'field_57ab34f8f4c29'),
(1482, 198, 'elõadoi_keszseg_0_megjegyzes', 'dfgdfg'),
(1483, 198, '_elõadoi_keszseg_0_megjegyzes', 'field_57ab34f8f4c2a'),
(1484, 198, 'elõadoi_keszseg', '1'),
(1485, 198, '_elõadoi_keszseg', 'field_57ab34f8f4c28'),
(1486, 198, 'segitõ_keszseg_0_értekeles', '4'),
(1487, 198, '_segitõ_keszseg_0_értekeles', 'field_57ab3519f4c2d'),
(1488, 198, 'segitõ_keszseg_0_megjegyzes', 'fdgdfg'),
(1489, 198, '_segitõ_keszseg_0_megjegyzes', 'field_57ab3519f4c2e'),
(1490, 198, 'segitõ_keszseg', '1') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1491, 198, '_segitõ_keszseg', 'field_57ab3519f4c2c'),
(1492, 198, 'csoporthoz_valo_viszony_0_értekeles', '4'),
(1493, 198, '_csoporthoz_valo_viszony_0_értekeles', 'field_57ab352ef4c30'),
(1494, 198, 'csoporthoz_valo_viszony_0_megjegyzes', 'fdgf'),
(1495, 198, '_csoporthoz_valo_viszony_0_megjegyzes', 'field_57ab352ef4c31'),
(1496, 198, 'csoporthoz_valo_viszony', '1'),
(1497, 198, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1498, 198, 'infrastrukturalis_kornyezet_0_értekeles', '5'),
(1499, 198, '_infrastrukturalis_kornyezet_0_értekeles', 'field_57ab354ff4c34'),
(1500, 198, 'infrastrukturalis_kornyezet_0_megjegyzes', 'dfgg'),
(1501, 198, '_infrastrukturalis_kornyezet_0_megjegyzes', 'field_57ab354ff4c35'),
(1502, 198, 'infrastrukturalis_kornyezet', '1'),
(1503, 198, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1504, 198, 'összessegeben_hogy_ertekeli', 'dfgdfg'),
(1505, 198, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1506, 198, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"187";}'),
(1507, 198, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1508, 199, '_edit_last', '1'),
(1509, 199, '_edit_lock', '1472297954:1'),
(1510, 199, 'mark_posts_term_id', ''),
(1511, 201, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1512, 201, '_kapcsolodo_tanfolyam', 'field_kapcsolodo_tanfolyam'),
(1513, 201, 'datum', '2016.08.27'),
(1514, 201, '_datum', 'field_datum'),
(1515, 201, 'oktato', 'Horváth Imre'),
(1516, 201, '_oktato', 'field_oktato'),
(1517, 201, 'cegnev', 'Pentaschool'),
(1518, 201, '_cegnev', 'field_cegnev'),
(1519, 201, 'helyszin', 'Budapest'),
(1520, 201, '_helyszin', 'field_helyszin'),
(1521, 201, '_edit_lock', '1484911353:1'),
(1522, 189, '_edit_last', '1'),
(1523, 189, 'datum', '2016.08.26'),
(1524, 189, '_datum', 'field_57ab3b8da01b3'),
(1525, 189, 'oktato', 'Horváth Imre'),
(1526, 189, '_oktato', 'field_57ab3b9aa01b4'),
(1527, 189, 'cegnev', 'Pentaschool'),
(1528, 189, '_cegnev', 'field_57ab3ba0a01b5'),
(1529, 189, 'helyszin', 'Budapest'),
(1530, 189, '_helyszin', 'field_57ab3ba5a01b6'),
(1531, 188, '_edit_last', '1'),
(1532, 188, 'datum', '2016.08.24'),
(1533, 188, '_datum', 'field_57ab3b8da01b3'),
(1534, 188, 'oktato', 'Horváth Levente'),
(1535, 188, '_oktato', 'field_57ab3b9aa01b4'),
(1536, 188, 'cegnev', 'Pentaschool'),
(1537, 188, '_cegnev', 'field_57ab3ba0a01b5'),
(1538, 188, 'helyszin', 'Pilisborosjenő'),
(1539, 188, '_helyszin', 'field_57ab3ba5a01b6'),
(1540, 187, '_edit_last', '1'),
(1541, 187, 'datum', '2016.08.20'),
(1542, 187, '_datum', 'field_57ab3b8da01b3'),
(1543, 187, 'oktato', 'Horváth Imre'),
(1544, 187, '_oktato', 'field_57ab3b9aa01b4'),
(1545, 187, 'cegnev', 'Pentaschool'),
(1546, 187, '_cegnev', 'field_57ab3ba0a01b5'),
(1547, 187, 'helyszin', 'Budapest'),
(1548, 187, '_helyszin', 'field_57ab3ba5a01b6'),
(1549, 197, '_edit_lock', '1472304940:1'),
(1550, 198, '_edit_last', '1'),
(1551, 198, '_edit_lock', '1472304932:1'),
(1552, 197, '_edit_last', '1'),
(1553, 196, '_edit_last', '1'),
(1554, 196, '_edit_lock', '1472309516:1'),
(1555, 195, '_edit_last', '1'),
(1556, 175, 'rule', 'a:5:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:8:"valaszok";s:8:"order_no";i:0;s:8:"group_no";i:0;}'),
(1557, 186, '_edit_lock', '1472309691:1'),
(1602, 299, 'honnan_ertesult_a_kepzesrol', 'Facebook reklám'),
(1603, 299, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1604, 299, 'mennyire_elegedett_0_értekeles', '1'),
(1605, 299, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1606, 299, 'mennyire_elegedett_0_megjegyzes', ''),
(1607, 299, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1608, 299, 'mennyire_elegedett', '1'),
(1609, 299, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1610, 299, 'megfelelt_e_az_elvarasainak_0_értekeles', '5'),
(1611, 299, '_megfelelt_e_az_elvarasainak_0_értekeles', 'field_57ab33d3f4c0e'),
(1612, 299, 'megfelelt_e_az_elvarasainak_0_megjegyzes', ''),
(1613, 299, '_megfelelt_e_az_elvarasainak_0_megjegyzes', 'field_57ab33d3f4c0f'),
(1614, 299, 'megfelelt_e_az_elvarasainak', '1'),
(1615, 299, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1616, 299, 'tananyag_felepitese', '0'),
(1617, 299, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1618, 299, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1619, 299, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1620, 299, 'segedanyagok_hasznalhatosaga', '0'),
(1621, 299, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1622, 299, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1623, 299, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1624, 299, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1625, 299, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1626, 299, 'melyik_resz_tetszett_a_legjobban', ''),
(1627, 299, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1628, 299, 'szakmai_felkeszultsege', '0'),
(1629, 299, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1630, 299, 'eloadoi_keszseg', '0'),
(1631, 299, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1632, 299, 'segito_keszseg', '0'),
(1633, 299, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1634, 299, 'csoporthoz_valo_viszony', '0') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1635, 299, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1636, 299, 'infrastrukturalis_kornyezet', '0'),
(1637, 299, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1638, 299, 'összessegeben_hogy_ertekeli', ''),
(1639, 299, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1640, 299, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1641, 299, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1642, 299, '_edit_lock', '1472403173:1'),
(1643, 204, '_edit_lock', '1509449318:1'),
(1644, 204, '_edit_last', '1'),
(1645, 303, 'keresztnev', 'asdasdad'),
(1646, 303, '_keresztnev', 'field_5799d0f11c22d'),
(1647, 303, 'cegnev', 'ffsdfsdf'),
(1648, 303, '_cegnev', 'field_5799d0f91c22e'),
(1649, 303, 'tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1650, 303, '_tanfolyam', 'field_5799d0da1c22c'),
(1651, 302, 'honnan_ertesult_a_kepzesrol', 'Facebook reklám'),
(1652, 302, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1653, 302, 'mennyire_elegedett_0_értekeles', '5'),
(1654, 302, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1655, 302, 'mennyire_elegedett_0_megjegyzes', 'asd'),
(1656, 302, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1657, 302, 'mennyire_elegedett', '1'),
(1658, 302, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1659, 302, 'megfelelt_e_az_elvarasainak', '0'),
(1660, 302, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1661, 302, 'tananyag_felepitese', '0'),
(1662, 302, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1663, 302, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1664, 302, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1665, 302, 'segedanyagok_hasznalhatosaga', '0'),
(1666, 302, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1667, 302, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1668, 302, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1669, 302, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1670, 302, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1671, 302, 'melyik_resz_tetszett_a_legjobban', ''),
(1672, 302, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1673, 302, 'szakmai_felkeszultsege', '0'),
(1674, 302, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1675, 302, 'eloadoi_keszseg', '0'),
(1676, 302, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1677, 302, 'segito_keszseg', '0'),
(1678, 302, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1679, 302, 'csoporthoz_valo_viszony', '0'),
(1680, 302, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1681, 302, 'infrastrukturalis_kornyezet', '0'),
(1682, 302, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1683, 302, 'összessegeben_hogy_ertekeli', ''),
(1684, 302, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1685, 302, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1686, 302, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1687, 303, '_edit_lock', '1472330115:1'),
(1688, 302, '_edit_lock', '1472403171:1'),
(1689, 304, '_edit_last', '1'),
(1690, 304, '_edit_lock', '1509449306:1'),
(1691, 235, '_edit_lock', '1509441053:1'),
(1692, 224, '_edit_lock', '1509441768:1'),
(1693, 235, '_edit_last', '1'),
(1694, 171, 'keresztnev', NULL),
(1695, 171, '_keresztnev', 'field_5799d0f11c22d'),
(1696, 171, 'cegnev', NULL),
(1697, 171, '_cegnev', 'field_5799d0f91c22e'),
(1698, 171, 'tanfolyam', 'a:1:{i:0;s:0:"";}'),
(1699, 171, '_tanfolyam', 'field_5799d0da1c22c'),
(1700, 171, 'akcios_ar', '19000'),
(1701, 171, '_akcios_ar', 'field_577e4409dfc0c'),
(1704, 309, 'keresztnev', 'Levi'),
(1705, 309, '_keresztnev', 'field_5799d0f11c22d'),
(1706, 309, 'cegnev', ''),
(1707, 309, '_cegnev', 'field_5799d0f91c22e'),
(1708, 309, 'tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1709, 309, '_tanfolyam', 'field_5799d0da1c22c'),
(1710, 308, 'honnan_ertesult_a_kepzesrol', 'Facebook reklám'),
(1711, 308, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1712, 308, 'mennyire_elegedett_0_értekeles', ''),
(1713, 308, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1714, 308, 'mennyire_elegedett_0_megjegyzes', ''),
(1715, 308, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1716, 308, 'mennyire_elegedett', '1'),
(1717, 308, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1718, 308, 'megfelelt_e_az_elvarasainak', '0'),
(1719, 308, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1720, 308, 'tananyag_felepitese', '0'),
(1721, 308, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1722, 308, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1723, 308, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1724, 308, 'segedanyagok_hasznalhatosaga', '0'),
(1725, 308, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1726, 308, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1727, 308, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1728, 308, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1729, 308, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1730, 308, 'melyik_resz_tetszett_a_legjobban', ''),
(1731, 308, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1732, 308, 'szakmai_felkeszultsege', '0'),
(1733, 308, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1734, 308, 'eloadoi_keszseg', '0'),
(1735, 308, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1736, 308, 'segito_keszseg', '0') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1737, 308, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1738, 308, 'csoporthoz_valo_viszony', '0'),
(1739, 308, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1740, 308, 'infrastrukturalis_kornyezet', '0'),
(1741, 308, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1742, 308, 'összessegeben_hogy_ertekeli', ''),
(1743, 308, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1744, 308, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1745, 308, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1746, 309, '_edit_lock', '1472406504:1'),
(1747, 311, 'keresztnev', 'leviiiiii'),
(1748, 311, '_keresztnev', 'field_5799d0f11c22d'),
(1749, 311, 'cegnev', ''),
(1750, 311, '_cegnev', 'field_5799d0f91c22e'),
(1751, 311, 'tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1752, 311, '_tanfolyam', 'field_5799d0da1c22c'),
(1753, 310, 'honnan_ertesult_a_kepzesrol', 'Személyes ajánlás'),
(1754, 310, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1755, 310, 'mennyire_elegedett_0_értekeles', ''),
(1756, 310, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1757, 310, 'mennyire_elegedett_0_megjegyzes', ''),
(1758, 310, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1759, 310, 'mennyire_elegedett', '1'),
(1760, 310, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1761, 310, 'megfelelt_e_az_elvarasainak', '0'),
(1762, 310, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1763, 310, 'tananyag_felepitese', '0'),
(1764, 310, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1765, 310, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1766, 310, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1767, 310, 'segedanyagok_hasznalhatosaga', '0'),
(1768, 310, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1769, 310, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1770, 310, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1771, 310, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1772, 310, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1773, 310, 'melyik_resz_tetszett_a_legjobban', ''),
(1774, 310, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1775, 310, 'szakmai_felkeszultsege', '0'),
(1776, 310, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1777, 310, 'eloadoi_keszseg', '0'),
(1778, 310, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1779, 310, 'segito_keszseg', '0'),
(1780, 310, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1781, 310, 'csoporthoz_valo_viszony', '0'),
(1782, 310, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1783, 310, 'infrastrukturalis_kornyezet', '0'),
(1784, 310, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1785, 310, 'összessegeben_hogy_ertekeli', ''),
(1786, 310, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1787, 310, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1788, 310, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1789, 313, 'keresztnev', 'jooo'),
(1790, 313, '_keresztnev', 'field_5799d0f11c22d'),
(1791, 313, 'cegnev', ''),
(1792, 313, '_cegnev', 'field_5799d0f91c22e'),
(1793, 313, 'tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1794, 313, '_tanfolyam', 'field_5799d0da1c22c'),
(1795, 312, 'kapcsolodo_ajanlas', 'a:1:{i:0;s:3:"313";}'),
(1796, 312, '_kapcsolodo_ajanlas', 'field_57c31c05014fe'),
(1797, 312, 'honnan_ertesult_a_kepzesrol', 'Google reklám'),
(1798, 312, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1799, 312, 'mennyire_elegedett_0_értekeles', '4'),
(1800, 312, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1801, 312, 'mennyire_elegedett_0_megjegyzes', ''),
(1802, 312, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1803, 312, 'mennyire_elegedett', '1'),
(1804, 312, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1805, 312, 'megfelelt_e_az_elvarasainak', '0'),
(1806, 312, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1807, 312, 'tananyag_felepitese', '0'),
(1808, 312, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1809, 312, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1810, 312, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1811, 312, 'segedanyagok_hasznalhatosaga', '0'),
(1812, 312, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1813, 312, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1814, 312, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1815, 312, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1816, 312, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1817, 312, 'melyik_resz_tetszett_a_legjobban', ''),
(1818, 312, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1819, 312, 'szakmai_felkeszultsege', '0'),
(1820, 312, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1821, 312, 'eloadoi_keszseg', '0'),
(1822, 312, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1823, 312, 'segito_keszseg', '0'),
(1824, 312, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1825, 312, 'csoporthoz_valo_viszony', '0'),
(1826, 312, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1827, 312, 'infrastrukturalis_kornyezet', '0'),
(1828, 312, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1829, 312, 'összessegeben_hogy_ertekeli', ''),
(1830, 312, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1831, 312, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1832, 312, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1833, 312, '_edit_lock', '1472408146:1'),
(1834, 313, '_edit_lock', '1472409639:1'),
(1835, 315, 'keresztnev', 'fgdf'),
(1836, 315, '_keresztnev', 'field_5799d0f11c22d') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1837, 315, 'cegnev', 'fg'),
(1838, 315, '_cegnev', 'field_5799d0f91c22e'),
(1839, 315, 'tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1840, 315, '_tanfolyam', 'field_5799d0da1c22c'),
(1841, 314, 'kapcsolodo_ajanlas', 'a:1:{i:0;s:3:"315";}'),
(1842, 314, '_kapcsolodo_ajanlas', 'field_57c31c05014fe'),
(1843, 314, 'honnan_ertesult_a_kepzesrol', 'Google reklám'),
(1844, 314, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1845, 314, 'mennyire_elegedett_0_értekeles', '5'),
(1846, 314, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1847, 314, 'mennyire_elegedett_0_megjegyzes', ''),
(1848, 314, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1849, 314, 'mennyire_elegedett', '1'),
(1850, 314, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1851, 314, 'megfelelt_e_az_elvarasainak', '0'),
(1852, 314, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1853, 314, 'tananyag_felepitese', '0'),
(1854, 314, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1855, 314, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1856, 314, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1857, 314, 'segedanyagok_hasznalhatosaga', '0'),
(1858, 314, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1859, 314, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1860, 314, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1861, 314, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1862, 314, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1863, 314, 'melyik_resz_tetszett_a_legjobban', ''),
(1864, 314, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1865, 314, 'szakmai_felkeszultsege', '0'),
(1866, 314, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1867, 314, 'eloadoi_keszseg', '0'),
(1868, 314, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1869, 314, 'segito_keszseg', '0'),
(1870, 314, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1871, 314, 'csoporthoz_valo_viszony', '0'),
(1872, 314, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1873, 314, 'infrastrukturalis_kornyezet', '0'),
(1874, 314, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1875, 314, 'összessegeben_hogy_ertekeli', ''),
(1876, 314, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1877, 314, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1878, 314, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1879, 317, 'keresztnev', ''),
(1880, 317, '_keresztnev', 'field_5799d0f11c22d'),
(1881, 317, 'cegnev', ''),
(1882, 317, '_cegnev', 'field_5799d0f91c22e'),
(1883, 317, 'tanfolyam', 'a:1:{i:0;s:2:"87";}'),
(1884, 317, '_tanfolyam', 'field_5799d0da1c22c'),
(1885, 316, 'kapcsolodo_ajanlas', 'a:1:{i:0;s:3:"317";}'),
(1886, 316, '_kapcsolodo_ajanlas', 'field_57c31c05014fe'),
(1887, 316, 'honnan_ertesult_a_kepzesrol', 'Google reklám'),
(1888, 316, '_honnan_ertesult_a_kepzesrol', 'field_57aafb990e4e4'),
(1889, 316, 'mennyire_elegedett_0_értekeles', '1'),
(1890, 316, '_mennyire_elegedett_0_értekeles', 'field_57aaffd181b30'),
(1891, 316, 'mennyire_elegedett_0_megjegyzes', ''),
(1892, 316, '_mennyire_elegedett_0_megjegyzes', 'field_57aaffe981b31'),
(1893, 316, 'mennyire_elegedett', '1'),
(1894, 316, '_mennyire_elegedett', 'field_57aaff9881b2f'),
(1895, 316, 'megfelelt_e_az_elvarasainak', '0'),
(1896, 316, '_megfelelt_e_az_elvarasainak', 'field_57ab33d3f4c0d'),
(1897, 316, 'tananyag_felepitese', '0'),
(1898, 316, '_tananyag_felepitese', 'field_57ab342ef4c10'),
(1899, 316, 'gyakorlati_feladatok_eletszerûsege', '0'),
(1900, 316, '_gyakorlati_feladatok_eletszerûsege', 'field_57ab3442f4c13'),
(1901, 316, 'segedanyagok_hasznalhatosaga', '0'),
(1902, 316, '_segedanyagok_hasznalhatosaga', 'field_57ab3458f4c16'),
(1903, 316, 'milyen_aranyban_szerzett_uj_ismereteket', '0'),
(1904, 316, '_milyen_aranyban_szerzett_uj_ismereteket', 'field_57ab3468f4c19'),
(1905, 316, 'milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', '0'),
(1906, 316, '_milyen_aranyban_fogja_hasznalni_az_uj_ismereteket', 'field_57ab34a7f4c20'),
(1907, 316, 'melyik_resz_tetszett_a_legjobban', ''),
(1908, 316, '_melyik_resz_tetszett_a_legjobban', 'field_57ab34cdf4c23'),
(1909, 316, 'szakmai_felkeszultsege', '0'),
(1910, 316, '_szakmai_felkeszultsege', 'field_57ab34e7f4c25'),
(1911, 316, 'eloadoi_keszseg', '0'),
(1912, 316, '_eloadoi_keszseg', 'field_57ab34f8f4c28'),
(1913, 316, 'segito_keszseg', '0'),
(1914, 316, '_segito_keszseg', 'field_57ab3519f4c2c'),
(1915, 316, 'csoporthoz_valo_viszony', '0'),
(1916, 316, '_csoporthoz_valo_viszony', 'field_57ab352ef4c2f'),
(1917, 316, 'infrastrukturalis_kornyezet', '0'),
(1918, 316, '_infrastrukturalis_kornyezet', 'field_57ab354ff4c33'),
(1919, 316, 'összessegeben_hogy_ertekeli', ''),
(1920, 316, '_összessegeben_hogy_ertekeli', 'field_57ab358df4c3a'),
(1921, 316, 'kapcsolodo_ertekelesek', 'a:1:{i:0;s:3:"201";}'),
(1922, 316, '_kapcsolodo_ertekelesek', 'field_57c1556a9e801'),
(1923, 317, '_edit_lock', '1472410012:1'),
(1924, 319, '_edit_last', '1'),
(1925, 319, '_edit_lock', '1473514607:1'),
(1926, 323, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1927, 323, '_edit_last', '1'),
(1928, 323, '_edit_lock', '1473516894:1'),
(1929, 323, '_wpb_vc_js_status', 'true'),
(1930, 319, 'mark_posts_term_id', ''),
(1931, 319, '_wpb_vc_js_status', 'true'),
(1932, 319, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:1:{s:10:"shortcodes";a:2:{s:29:"1473514314711-6b46f2cc-03f6-8";a:3:{s:3:"tag";s:13:"vc_basic_grid";s:4:"atts";a:9:{s:9:"post_type";s:11:"tanfolyamok";s:9:"max_items";s:2:"-1";s:11:"show_filter";s:3:"yes";s:12:"filter_style";s:8:"bordered";s:12:"filter_align";s:4:"left";s:11:"filter_size";s:2:"lg";s:4:"item";s:3:"323";s:7:"grid_id";s:36:"vc_gid:1473514314711-6b46f2cc-03f6-8";s:13:"filter_source";s:8:"category";}s:7:"content";s:0:"";}s:29:"1473514449395-552a0230-d793-7";a:3:{s:3:"tag";s:15:"vc_masonry_grid";s:4:"atts";a:7:{s:9:"post_type";s:11:"tanfolyamok";s:9:"max_items";s:2:"10";s:11:"show_filter";s:3:"yes";s:13:"element_width";s:1:"3";s:25:"initial_loading_animation";s:6:"fadeIn";s:7:"grid_id";s:36:"vc_gid:1473514449395-552a0230-d793-7";s:13:"filter_source";s:8:"category";}s:7:"content";s:0:"";}}}}'),
(1933, 117, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1934, 323, '_wpb_shortcodes_custom_css', '.vc_custom_1473425995984{background-color: #57a2f0 !important;}'),
(1935, 316, '_edit_lock', '1484911672:1'),
(1937, 224, '_edit_last', '1') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1938, 240, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1939, 230, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1940, 231, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1941, 232, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1942, 233, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1943, 337, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1944, 338, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1945, 224, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1946, 171, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1947, 171, 'aktiv', '1'),
(1948, 171, '_aktiv', 'field_5883629bd24d1'),
(1949, 171, 'ertekeltek_e_mar', '1'),
(1950, 171, '_ertekeltek_e_mar', 'field_588362a9d24d2'),
(1951, 87, '_reorder_term_category_adatbazis', '2'),
(1952, 87, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1960, 204, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1964, 205, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1968, 206, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1972, 207, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1997, 341, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(1998, 341, '_edit_last', '1'),
(1999, 341, '_edit_lock', '1486488405:1'),
(2000, 341, 'mark_posts_term_id', ''),
(2001, 341, '_wpb_vc_js_status', 'false'),
(2103, 344, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2104, 227, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2105, 345, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2106, 346, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2107, 228, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2108, 229, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2109, 225, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2110, 347, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2111, 347, '_edit_last', '1'),
(2112, 347, '_edit_lock', '1511349347:2'),
(2113, 348, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2114, 171, 'alkalmak_megadasa', 'Napok megadása'),
(2115, 171, '_alkalmak_megadasa', 'field_5893433a355c4'),
(2116, 171, 'idobeosztas', '10-14h'),
(2117, 171, '_idobeosztas', 'field_5799cd709eebd'),
(2118, 171, 'napi_beosztas', 'minden hétfőn és csütörtökön'),
(2119, 171, '_napi_beosztas', 'field_5893a135e809f'),
(2120, 218, '_edit_lock', '1509449298:1'),
(2121, 218, '_edit_last', '1'),
(2122, 349, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2123, 218, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2124, 350, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2125, 350, '_edit_last', '1'),
(2126, 350, '_edit_lock', '1491771528:1'),
(2127, 350, 'mark_posts_term_id', ''),
(2128, 350, '_wpb_vc_js_status', 'false'),
(2130, 235, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2131, 251, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2132, 352, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2133, 112, 'aktiv_tanfolyam_e', '1'),
(2134, 112, '_aktiv_tanfolyam_e', 'field_589d913ff2c33'),
(2135, 112, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2136, 353, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2137, 354, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2140, 139, '_edit_lock', '1492012671:1'),
(2141, 164, 'akcios_ar', '50000'),
(2142, 164, '_akcios_ar', 'field_577e4409dfc0c'),
(2143, 164, 'aktiv', '0'),
(2144, 164, '_aktiv', 'field_5883629bd24d1'),
(2145, 164, 'ertekeltek_e_mar', '0'),
(2146, 164, '_ertekeltek_e_mar', 'field_588362a9d24d2'),
(2147, 164, 'alkalmak_megadasa', 'Kezdés és vége megadása'),
(2148, 164, '_alkalmak_megadasa', 'field_5893433a355c4'),
(2149, 164, 'idobeosztas', '9-11h'),
(2150, 164, '_idobeosztas', 'field_5799cd709eebd'),
(2151, 164, 'napi_beosztas', 'hétfő és kedd'),
(2152, 164, '_napi_beosztas', 'field_5893a135e809f'),
(2153, 164, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2154, 357, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2155, 357, '_edit_last', '1'),
(2156, 357, '_edit_lock', '1516380995:2'),
(2157, 357, 'kapcsolodo_tanfolyam', 'a:1:{i:0;s:3:"129";}'),
(2158, 357, '_kapcsolodo_tanfolyam', 'field_579cc9119e382'),
(2159, 357, 'tanar', 'a:1:{i:0;s:3:"166";}'),
(2160, 357, '_tanar', 'field_5799caed41a4a'),
(2161, 357, 'helyszin', 'a:1:{i:0;s:3:"165";}'),
(2162, 357, '_helyszin', 'field_5799cc0e5a5af'),
(2163, 357, 'napszak', 'esti'),
(2164, 357, '_napszak', 'field_5799cd6b9eebc'),
(2165, 357, 'akcios_ar', '10000'),
(2166, 357, '_akcios_ar', 'field_577e4409dfc0c'),
(2167, 357, 'minimum_letszam', '3'),
(2168, 357, '_minimum_letszam', 'field_5799ce4a9eebe'),
(2169, 357, 'maximum_letszam', '13'),
(2170, 357, '_maximum_letszam', 'field_5799ce5b9eebf'),
(2171, 357, 'beiratkozva', '4'),
(2172, 357, '_beiratkozva', 'field_5799cf379eec0'),
(2173, 357, 'aktiv', '1'),
(2174, 357, '_aktiv', 'field_5883629bd24d1'),
(2175, 357, 'ertekeltek_e_mar', '0'),
(2176, 357, '_ertekeltek_e_mar', 'field_588362a9d24d2'),
(2177, 357, 'alkalmak_megadasa', 'Napok megadása'),
(2178, 357, '_alkalmak_megadasa', 'field_5893433a355c4'),
(2179, 357, 'kezdes', '20170420'),
(2180, 357, '_kezdes', 'field_5799cd459eeba'),
(2181, 357, 'tovabbi_napok_0_tovabbi_nap', '20170421') ;
INSERT INTO `pe_postmeta` ( `meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(2182, 357, '_tovabbi_napok_0_tovabbi_nap', 'field_589343c0355c6'),
(2183, 357, 'tovabbi_napok_1_tovabbi_nap', '20170422'),
(2184, 357, '_tovabbi_napok_1_tovabbi_nap', 'field_589343c0355c6'),
(2185, 357, 'tovabbi_napok', '2'),
(2186, 357, '_tovabbi_napok', 'field_5893439f355c5'),
(2187, 357, 'vege', '20170423'),
(2188, 357, '_vege', 'field_5799cd619eebb'),
(2189, 357, 'idobeosztas', '9-14'),
(2190, 357, '_idobeosztas', 'field_5799cd709eebd'),
(2192, 112, '_reorder_term_category_excel', '2'),
(2193, 358, '_vc_post_settings', 'a:1:{s:10:"vc_grid_id";a:0:{}}'),
(2194, 171, 'tovabbi_napok_0_tovabbi_nap', '20170114'),
(2195, 171, '_tovabbi_napok_0_tovabbi_nap', 'field_589343c0355c6'),
(2196, 171, 'tovabbi_napok_1_tovabbi_nap', '20170128'),
(2197, 171, '_tovabbi_napok_1_tovabbi_nap', 'field_589343c0355c6'),
(2198, 171, 'tovabbi_napok', '2'),
(2199, 171, '_tovabbi_napok', 'field_5893439f355c5') ;

#
# End of data contents of table `pe_postmeta`
# --------------------------------------------------------



#
# Delete any existing table `pe_posts`
#

DROP TABLE IF EXISTS `pe_posts`;


#
# Table structure of table `pe_posts`
#

CREATE TABLE `pe_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=359 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_posts`
#
INSERT INTO `pe_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 2, '2016-07-07 09:38:06', '2016-07-07 09:38:06', 'Üdvözlet! Ez az első saját WordPress-bejegyzés. Módosítható, vagy törölhető, aztán megkezdhető a honlap tartalommal történő feltöltése!', 'Helló Világ!', '', 'publish', 'open', 'open', '', 'hello-vilag', '', '', '2016-07-07 09:38:06', '2016-07-07 09:38:06', '', 0, 'http://pentaschool.hu/?p=1', 0, 'post', '', 1),
(2, 2, '2016-07-07 09:38:06', '2016-07-07 09:38:06', 'Ez egy mintaoldal, egy WordPress-alapú honlap egy oldalának létrehozásához. Az oldal különbözik a bejegyzéstől, mert az oldal állandóan látszik a honlap menüjében, a navigáció során (a legtöbb sablonban). Az emberek többsége használja a Névjegy oldalt, amely arra szolgál, hogy a lehetséges látogatói számára elmondjanak magukról, vállalkozásukról, a honlapról néhány jellemző mondatot. Egyik lehetséges megoldás erre pl.:\n\n<blockquote>Helló Emberek!Ezt a fordítást a WordPress Magyarország Fordítói csapata végezte. Sok száz munkaórát fektettünk abba, hogy ezt a remek tartalomkezelő rendszert anyanyelvünkön, magyarul használhassa mindenki.</blockquote>\n\n.... vagy egy másik példa:\n<blockquote>A<strong> WordPress Magyarország</strong> tulajdonképpen a kezdetektől létezik anélkül, hogy kihirdette volna létét. <strong>A WordPress Magyarország egy Közösség!</strong> - a nyílt forráskódú, zseniális WordPress tartalomkezelő rendszer alkalmazására, megismerésére, tanulására szövetkeztünk.</blockquote>\n\nÚj WordPress-felhasználóként a <a href="http://pentaschool.hu/wp-admin/">Vezérlőpult</a>ba lépve ez az oldal törölhető, módosítható, és új oldalak hozhatóak létre saját tartalommal. Jó szórakozást kíván a WordPress Nemzeközi Közössége!', 'Ez egy minta oldal', '', 'publish', 'closed', 'open', '', 'ez-egy-minta-oldal', '', '', '2016-07-07 09:38:06', '2016-07-07 09:38:06', '', 0, 'http://pentaschool.hu/?page_id=2', 0, 'page', '', 0),
(7, 2, '2016-07-07 11:56:27', '2016-07-07 11:56:27', '', 'Tanfolyamok', '', 'publish', 'closed', 'closed', '', 'acf_tanfolyamok', '', '', '2016-07-28 09:18:06', '2016-07-28 09:18:06', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=7', 0, 'acf', '', 0),
(9, 2, '2016-07-07 12:03:25', '2016-07-07 12:03:25', '', 'Referenciák', '', 'publish', 'closed', 'closed', '', 'acf_referenciak', '', '', '2016-07-07 12:03:25', '2016-07-07 12:03:25', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=9', 0, 'acf', '', 0),
(71, 2, '2016-07-07 13:21:15', '0000-00-00 00:00:00', '', 'asdasd', '', 'draft', 'open', 'open', '', '', '', '', '2016-07-07 13:21:15', '2016-07-07 13:21:15', '', 0, 'http://pentaschool.hu/?p=71', 0, 'post', '', 0),
(73, 2, '2016-07-07 13:22:19', '0000-00-00 00:00:00', '', 'ggg', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-07-07 13:22:19', '2016-07-07 13:22:19', '', 0, 'http://pentaschool.hu/?post_type=referenciak&#038;p=73', 0, 'referenciak', '', 0),
(74, 2, '2016-07-07 13:35:31', '2016-07-07 13:35:31', 'sdvsdf', 'gffg', '', 'publish', 'closed', 'closed', '', 'gffg', '', '', '2016-07-07 13:35:31', '2016-07-07 13:35:31', '', 0, 'http://pentaschool.hu/?page_id=74', 0, 'page', '', 0),
(75, 2, '2016-07-07 13:35:31', '2016-07-07 13:35:31', 'sdvsdf', 'gffg', '', 'inherit', 'closed', 'closed', '', '74-revision-v1', '', '', '2016-07-07 13:35:31', '2016-07-07 13:35:31', '', 74, 'http://pentaschool.hu/egyeb/74-revision-v1/', 0, 'revision', '', 0),
(79, 2, '2016-07-07 13:52:23', '2016-07-07 13:52:23', 'asdasd', 'asdsd', '', 'publish', 'open', 'open', '', 'asdsd', '', '', '2016-07-07 13:52:23', '2016-07-07 13:52:23', '', 0, 'http://pentaschool.hu/?p=79', 0, 'post', '', 0),
(80, 2, '2016-07-07 13:52:23', '2016-07-07 13:52:23', 'asdasd', 'asdsd', '', 'inherit', 'closed', 'closed', '', '79-revision-v1', '', '', '2016-07-07 13:52:23', '2016-07-07 13:52:23', '', 79, 'http://pentaschool.hu/egyeb/79-revision-v1/', 0, 'revision', '', 0),
(83, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>Sokat hallott rövidítés: <strong>XML</strong>. Szinte valamennyi webmester találkozott már XML dokumentummal. De vajon sikerült kiaknáznia a benne rejlõ lehetõségeket? Napi használatú eszközévé tennie, amivel a szokásos munkáját érdemben megkönnyítené? Tanfolyamunk célja, hogy ezt bebizonyítva felfegyverezze a hallgatóságot az XML gazdag eszköztárával.</p> <p>A tanfolyam során a hallgatók sokféle technika (<strong>XHTML, XSLT, XPath, SVG,  CSS</strong>, stb.) együttes használatával élõ példákon tanulják meg, hogy miként építhetõ be az XML a honlap készítés, Web publikálás napi folyamatába.</p>', 'XML alapismeretek', '', 'publish', 'open', 'open', '', 'xml-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/xml-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(84, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során elsajátíthatja egy <strong>Linux</strong> rendszergazda mindennapi munkavégzéséhez elengedhetetlen rendszer-konfigurálási ismereteket, a leggyakoribb hibák elhárítását. A tanfolyam ismeretanyagát <strong>Debian</strong> disztribúció használata közben sajátítják el a résztvevõk, de külön vállalati igények szerint egyéb disztribúció is szóba jöhet, mint pl. <strong>RedHat Enterprise vagy CentOS</strong>. <br> A konfigurálás alapvetõen karakteres felületen történik (editor használatával), de ismertetésre kerülnek a webes felületen keresztül történõ konfigurálás lehetõségei is (Webmin). A tanfolyam elvégzése után a résztvevõk képesek lesznek egy irodai hálózat kiszolgálására, Internetre csatlakoztatására és védelmére.</p>', 'Linux haladó rendszergazda', '', 'publish', 'open', 'open', '', 'linux-rendszergazda-halado-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/linux-rendszergazda-halado-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(85, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során megismerkedhet egy <strong>Linux</strong> disztribúció telepítésével, grafikus és karakteres felületen a rendszer konfigurálásával. A tanfolyam elvégzése után a résztvevõ képes lesz a Linux-ot önállóan telepíteni, hálózatba konfigurálni, és azon a legalapvetõbb szerver szolgáltatásokat (fájl és nyomtató, DNS, Web, Levelezõ) alap szinten üzemeltetni.<br><br> A tanfolyam során használt disztribúció <strong>DEBIAN</strong>,&nbsp; <strong>RedHat Enterprise vagy CentOS</strong>, de külön kérésre egyéb terjesztés is szóba jöhet.</p>', 'Linux rendszergazdai alapismeretek', '', 'publish', 'open', 'open', '', 'linux-rendszergazda-kezdo-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/linux-rendszergazda-kezdo-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(86, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam alatt végignézzük az összes feladatot, ami egy gyakorló <strong>Windows szerver</strong> rendszergazdának napi munkáját kiteszi. A következõ tanfolyamot <strong>Windows Srever 2012 R2</strong> környezetben tartjuk.</p>', 'Windows Server 2012 R2', '', 'publish', 'open', 'open', '', 'windows-szerver-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/windows-szerver-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(87, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során az alapfokú tanfolyam tananyagára építve a hallgatók megismerkednek a <strong>Microsoft Access</strong> által nyújtott alkalmazásfejlesztést támogató segédeszközök használatával és mûködésével. A kurzus elvégzése után képesek lesznek többtáblás adatbázisokra épülõ felhasználói felület alapszintû felépítésére. Összetettebb, akár több lépcsõs lekérdezéseket készítenek, melyeket akár futás közbeni is tudnak paraméterezni egy erre szolgáló ûrlapon. Megtanulják hogyan lehet és mikor érdemes az adatbázist és a felhasználói felületet szétválasztani, hogy az adatbázist központilag tudják kezelni, és az is kiderül, hogyan lehet Excel adatokat csatolni vagy importálni az Acces-be, majd a lekérdezések eredményeit visszatölteni Excel-be.</p>', 'Adatbázis-kezelés haladóknak - Access', '', 'publish', 'closed', 'closed', '', 'adatbazis-access-halado-tanfolyam', '', '', '2017-01-31 20:43:58', '2017-01-31 20:43:58', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/adatbazis-access-halado-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(88, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során a hallgatók megismerkednek a <strong>relációs adatbázis-kezelés</strong> elméleti alapjaival. Megtanulják, mi a különbség a táblázatkezelõk és az adatbázis-kezelõk között, mikor melyiket kell alkalmazni. A kurzus elvégzése után képesek lesznek többtáblás adatbázisok létrehozására, és azokon alapvetõ adatfeldolgozási mûveletek elvégzésére. A gyakorlati feladatokat a <strong>Microsoft Access</strong> segítségével oldják meg.</p>', 'Adatbázis-kezelési alapismeretek - Access', '', 'publish', 'open', 'open', '', 'adatbazis-access-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/adatbazis-access-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(89, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók megismerik a csoportos dokumentumkezelés, üzenetváltás, és erõforrás-kezelés lehetõségeit. A háttérben a <strong>Microsoft Exchange Szerver</strong>, az elõtérben a Microsoft Word, Excel, Access, és legfõképpen az <strong>Outlook</strong> programok csoportmunka-támogatását vizsgálják meg alaposabban.', 'Csoportmunka számítógépes támogatása - Outlook', '', 'publish', 'open', 'open', '', 'oulook-csoportmunka-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/oulook-csoportmunka-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(90, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók megismerik a napjainkban legelterjedtebben használatos személyi számítógépek (PC-k) fõbb felépítési és mûködési paramétereit, majd gyakorlatokon keresztül megtanulják az alapvetõ felhasználói, kezelõi feladatok végrehajtását Windows környezetben.', 'Gépkezelési alapismeretek', '', 'publish', 'open', 'open', '', 'gepkezelo', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/gepkezelo.php', 0, 'tanfolyamok', '', 0),
(91, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók megismerkednek az Internet történetével, felépítésével, az ott elérhetõ szolgáltatások használatával.  A tanfolyam elvégzése után képesek lesznek internetkapcsolatot létesíteni és kihasználni a világháló nyújtotta lehetõségeket.', 'Internetfelhasználói ismeretek', '', 'publish', 'open', 'open', '', 'internet_alap', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/internet_alap.php', 0, 'tanfolyamok', '', 0),
(92, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók megismerik a prezentációk lényegét, készítésük és bemutatásuk módját. Eszközként a Microsoft Office komponensét, a <strong>Microsoft Power Point</strong> programot használjuk. A kurzus elvégzése után képesek lesznek hatékonyan és gyorsan igényes kivitelû bemutatók készítésére, azokba külsõ adatforrásból (Word, Excel, stb.) származó adatok, grafikonok beillesztésére, a diákon professzionális animációk alkalmazására.', 'Prezentáció készítés - PowerPoint', '', 'publish', 'open', 'open', '', 'powerpoint-prezentacio-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/powerpoint-prezentacio-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(93, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók alapszintû ismereteiket bõvítik ki. Megismerkednek a <strong>Microsoft Word</strong> fejlettebb, a mindennapi munkát könnyebbé tevõ lehetõségeivel, és egyben az általános kezelési ismereteik is fejlõdnek.', 'Szövegszerkesztés haladóknak - Word', '', 'publish', 'open', 'open', '', 'szovegszerkesztes-word-halado-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/szovegszerkesztes-word-halado-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(94, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók alapszinten megismerik a napjainkban legelterjedtebben használatos Microsoft Office programcsomag <strong>Microsoft Word</strong> komponensét. A kurzus elvégzése után képesek lesznek a mindennapi munka folyamán felmerülõ egyszerûbb szerkesztési feladatok önálló megoldására.', 'Szövegszerkesztési alapismeretek - Word', '', 'publish', 'open', 'open', '', 'szovegszerkesztes-word-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/szovegszerkesztes-word-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(95, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során a hallgatók megismerkednek az <strong>Excel 2003, Excel 2007, Excel 2010 vagy Excel 2013</strong>&nbsp;haladóbb használatával, a hatékonyabb munkát segítõ tippekkel-trükkökkel, billentyûkombinációkkal. Segítséget kapnak az adatbevitellel, formázással, kijelölésekkel, navigációval, nézeti beállításokkal kapcsolatos olyan lehetõségekbe, amelyekrõl eddig nem is hallottak. Részletesen bemutatjuk az Excel haladóbb függvényeit és kitûnõ adatfeldolgozást segítõ eszközeit. A kurzus elvégzése után képesek lesznek összetettebb táblázatrendszerek kezelésére, azok gyors rendszerezésére, szûrésére, illetve kimutatások (PIVOT) készítésére.</p>', 'Táblázatkezelés haladóknak - Excel', '', 'publish', 'open', 'open', '', 'tablazatkezeles-excel-halado-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/tablazatkezeles-excel-halado-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(96, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során a hallgatók megismerkednek a táblázatkezelés lényegével, felhasználási lehetõségeivel. Gyakorlatban megismerik a Microsoft Office programcsomag <strong>Microsoft Excel</strong> komponensét. A kurzus elvégzése után képesek lesznek egyszerû táblázatok összeállítására, a szükséges képletek, függvények alkalmazására, a lényeges információk grafikus ábrázolására.</p><p>Az oktatás során az Excel több verzióját is lehet használni, legyen az<strong> Excel 2003, Excel 2007, Excel 2010 vagy Excel 2013</strong>.</p>', 'Táblázatkezelési alapismeretek - Excel', '', 'publish', 'open', 'open', '', 'tablazatkezeles-excel-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/tablazatkezeles-excel-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(97, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<ul><li>Adatelemzéssel, feldolgozással foglalkozik?</li><li>Rendszeres vagy ad-hoc riportokat kell készítenie?</li><li>Esetleg programozónak készül?</li><li>Érdekli az adattárolás-feldolgozás módszertana?</li></ul><p>Az SQL (Strucured Query Language) professzionális eszköz annak a kezében, aki tisztában van a relációs adatbázis-kezelés alapfogalmaival és gyakorlatával. A tanfolyamon pontosan ezt &nbsp;akét dolgot kapcsoljuk egybe.</p><p>Az <strong>SQL &nbsp;tanfolyam</strong> során a résztvevõk megismerkednek az adatbázis-kezelés elméleti alapjaival, majd gyakorlati példákon keresztül tanulják meg az adatbázis-tervezés lépéseit és az <strong>SQL</strong> lekérdezõ nyelvet, amit <strong>MySQL</strong> és <strong>Microsoft SQL</strong> környezetben is kipróbálnak.</p><p>Minden adatbázison alapuló alkalmazás sikerének kulcsa a helyes adatbázis terv, ezért erre nagyobb hangsúlyt fektetünk, hogy a részvevõk önállóan is képesek legyenek egy feladathoz akár több táblából álló adatmodellt tervezni. A terv kivitelezéséhez speciális, vizuális eszközöket használunk, melyek segítségével megtervezhetjük az adatbázist, szerkeszthetjük, futtathatjuk, illetve tárolhatjuk az SQL lekérdezéseket, sõt, a lekérdezések összeállításában is adnak vizuális segítséget.</p><p>Az SQL nyelvet leggyakrabban valamilyen programnyelvbe beágyazottan használjuk, emiatt a tanfolyam végén arra is mutatunk példát, hogy&nbsp;<strong>C# .NET </strong>környezetben hogyan kell csatlakozni egy adatbázishoz, abból adatokat lekérni, és megjeleníteni, vagy akár új adatokat felvinni.&nbsp;</p><p>A kurzus elvégzése után a résztvevõk képesek lesznek többtáblás adatbázis megtervezésére, megvalósítására és SQL szintû kezelésére.</p>', 'SQL adatbázis-kezelés', '', 'publish', 'open', 'open', '', 'sql', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/sql.php', 0, 'tanfolyamok', '', 0),
(98, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során az <strong>OpenLDAP</strong> programcsomagon keresztül kerül bemutatásra az LDAP címtárszolgáltatás és annak gyakorlati alkalmazása LINUX operációs rendszerben. A hallgatók példák segítségével megismerkednek a gyakran használt szerver alkalmazások LDAP támogatásával. Az LDAP ismertetéséhez kapcsolódóan a <strong>Linux-PAM</strong> lehetõségei is tárgyalásra kerülnek. A tanfolyamon használt disztribúció a <b>CentOS 5</b> (a Red Hat Linux Enterprise kiadással binárisan kompatibilis)', 'Linux címtárszolgáltatás', '', 'publish', 'open', 'open', '', 'linux-cimtar-ldap-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/linux-cimtar-ldap-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(99, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>Az <strong>Exchange Server</strong> tanfolyamon a hallgatók megismerkedhetnek az elektronikus levelezés alapjaival, és gyakorlati tapasztalatot szerezhetnek a Microsoft alapú e-mail kliens/szerver rendszer mûködésérõl. A tanfolyam elvégzése után képesek lesznek Exchange szervert telepíteni, klienseket beállítani, kis és közepes méretû mukahelyek levelezési igényeit megoldani, <strong>Exchange szerver 2007</strong> és <strong>Exchange szerver 2010</strong> környezetben egyaránt.</p>', 'Exchange Server 2010', '', 'publish', 'open', 'open', '', 'exchange-szerver-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/exchange-szerver-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(100, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', '<p>A tanfolyam során a <strong>C# nyelv</strong> lehetõségein keresztül bemutatjuk a <strong>.NET Framework</strong> alapú alkalmazások létrehozását.. Sok egyszerû példán keresztül megismerhetik a C# nyelv elemeit, a Framework osztályait és a programozási technikákat.<br> <br> A tanfolyam egy sorozat elsõ, bevezetõ eleme, új ismeretet adhat azoknak, akik ismerkedni szeretnének a .NET Framework világával.</p>', 'Visual C#', '', 'publish', 'open', 'open', '', 'visualc-csharp-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/visualc-csharp-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(101, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'A tanfolyam során a hallgatók a <strong>Visual Studio .NET </strong> fejlesztõ környezetet használva megismerkedhetnek az <strong>ASP .NET</strong>-ben rejlõ lehetõségekkel. Számos példán és alkalmazáson keresztül mutatjuk be az ASP .NET programozás rejtelmeit, a kiszolgáló oldali vezérlõk világát.', 'ASP .NET', '', 'publish', 'open', 'open', '', 'asp-tanfolyam', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/asp-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(102, 2, '2016-07-07 14:44:00', '2016-07-07 14:44:00', 'Ezt a tanfolyamunkat azoknak a hallgatóknak ajánljuk, akik szeretnék megismerni a vállalati körben talán legjobban elterjedt <strong>Microsoft SQL Server </strong> alapú adatbázisok programozási lehetõségeit. A tanfolyam során a résztvevõk elsajátithatják a szerver oldali adatbázisprogramozás, alkalmazásfejlesztés lépéseit.', 'SQL adatbázis programozás', '', 'publish', 'open', 'open', '', 'sqlprog', '', '', '2016-07-07 14:44:00', '2016-07-07 14:44:00', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/sqlprog.php', 0, 'tanfolyamok', '', 0),
(103, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A <strong>Joomla! </strong>az egyik legelterjedtebb, ingyenes tartalomkezelõ rendszer. Néhány perc alatt telepíthetõ egy webtárhelyre, és a megfelelõ felhasználói ismeretek birtokában néhány órányi munka után már indulhat is az új webhely. A Joomla alapú weboldal tartalmát saját magad alakíthatod és módosíthatod, frissítheted, menüpontokat hozhatsz létre, és a kinézetét is módosíthatod a sablonok segítségével. Végül, akár webáruházat is építhetsz. Tanfolyamunkat az utolsó kiadott stabil verzió bemutatásával tartjuk.</p>', 'Joomla Webmester', '', 'publish', 'open', 'open', '', 'joomla-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/joomla-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(104, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>Manapság egyre több szó esik a <strong>HTML5 és a CSS3</strong> szabványról. Ennek kapcsán a fejlesztõk általában azt a kérdést teszik fel, hogy mikor tudják használni élesben, mondjuk egy sima céges weboldalnál? Nos, a válasz az, hogy már most. Tanfolyamunk elsõsorban a HTML5/CSS3 azon újdonságaira koncentrál, amelyek a hétköznapi, klasszikus weboldalak fejlesztéséhez használhatók.<br> Természetesen nem maradhat ki az a téma sem, hogy a HTML5/CSS3 szabványokat nem, vagy csak részben támogató böngészõprogramok esetén milyen trükkökhöz, segédkönyvtárakhoz folyamodhatunk. Mivel a tanfolyam nem a webalkalmazás-fejlesztésrõl szól, ezért a HTML5 új API-jait (geolocation, web storage, stb.) csak nagyon érintõlegesen tárgyaljuk. <br> A tanfolyam elvégzése után a résztvevõ képes lesz az új szabványok figyelembe vételével megtervezni egy új weboldalt, átalakítani egy korábbit, és alkalmazni tudja a gyakorlatban jelenleg is használható újdonságokat.</p>', 'HTML5-CSS3 a gyakorlatban', '', 'publish', 'open', 'open', '', 'html5-css3-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/html5-css3-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(105, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A tanfolyamon résztvevõ megismeri a számítógépes hálózatok elméleti alapjait, az alkalmazható technológiákat,tudja használni a helyi hálózatokban alkalmazott eszközöket és szolgáltatásokat, képes lesz megtervezni egy kisebb méretû TCP/IP alapú helyi hálózatot, alapszinten képes lesz hálózati hibák keresésére és lokalizálására. A képzés során egy hálózati szimulációs program segítségével a résztvevõk alapszinten megtanulják a menedzselhetõ <strong>(pl.CISCO)</strong> hálózati eszközök konfigurálását is, olyan ismereteket szereznek, amiket <strong>CCNA vagy Network </strong> tanfolyamokon szoktak tanítani.</p>', 'TCP/IP hálózatok, hálózati eszközök konfigurálása', '', 'publish', 'open', 'open', '', 'tcp-ip-switch-router-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/tcp-ip-switch-router-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(106, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', 'A tanfolyamon a hallgatók megismerhetik a Microsoft Windows Server <strong>Hyper-V</strong> virtualizációs technológiáját. Képesek lesznek a virtualizációra használandó hardver kiválasztására, a 2008 R2 szerver Hyper-V szerepkörének beállítására, virtuális gépek és virtuális lemezek létrehozására és a rendszerek lokális vagy távoli felügyeletére. Megismerhetik a különálló és ingyenes Hyper-V szerver kiadást, és annak felügyeletét, rövid betekintést kapnak a System Center Virtual Machine Manager (SCVMM) mûködésébe is.', 'Microsoft virtualizációs megoldások alapjai - Hyper-V', '', 'publish', 'open', 'open', '', 'hyper-v-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/hyper-v-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(107, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>Az alapvetõ tartalom alapú webszerkesztés szabályait figyelembe véve, statikus oldalainkat életre keltjük a <strong>PHP programozási nyelv</strong> segítségével. A tanfolyamon a hallgatók megismerkednek a web-programozás kiszolgáló oldali lehetõségeivel, részletesen pedig a PHP nyelv használatát sajátítják el, melyhez számos elõre kidolgozott példa nyújt segítséget. Ezután megismerik az adatbázisok kezelésének alapjait, az SQL nyelvet, és speciálisan a MySQL adatbázis-kezelõ rendszert, illetve a PHP adatbázis-függvényeit.</p>', 'PHP programozás', '', 'publish', 'open', 'open', '', 'php-programozas-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/php-programozas-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(108, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A tanfolyam során a hallgatók LINUX környezetben, gyakorlatokon keresztül megismerik az elektronikus levelezés mûködését, a levelezéssel kapcsolatos szolgáltatásokat. A képzés végén képesek lesznek levelezõ szervert telepíteni, beállítani, üzemeltetni, és különbözõ típusú kliensek számára további szolgáltatásokat nyújtani, mint webes felületû levelezés, vagy spam és vírus szûrés.<br> Disztribúció: <strong>Debian GNU/Linux</strong></p>', 'Vállalati levelezés Linux környezetben', '', 'publish', 'open', 'open', '', 'linux-levelezes-postfix-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/linux-levelezes-postfix-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(109, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', 'A tanfolyam során hallgatóink a gyakorlatban is megismerhetik, hogy Windows kliensek számára hogyan készítünk <strong>PDC-t</strong>(Primary Domain Controller) és <strong>Samba szervert</strong> egy <strong>Debian Linux</strong>-ot futtató kiszolgálóból. A központi adminisztrációt <strong>OpenLDAP</strong>-al valósítjuk meg. Mevalósítjuk a <strong>csoportházirendet, és a központi profilt</strong> is. Végeredményül egy központilag karbantartott és felügyelt fájlszervert kapunk.', 'Samba-LDAP a gyakorlatban', '', 'publish', 'open', 'open', '', 'samba-ldap', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/samba-ldap.php', 0, 'tanfolyamok', '', 0),
(110, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A modul során a témához tartozó nyomdai ismeretek átismétlése után, az <strong>Adobe InDesign</strong> kiadványszerkesztõ-tördelõ szoftvert ismerhetik meg a hallgatók. A program egyes fõ funkcióinak gyakorlati áttekintésével eljutunk az önálló kiadványszerkesztõi, illetve DTP-s munka elvégzéséig. <br> <br> A modul elvégzésével a résztvevõk képesek lesznek összetettebb kiadványok megtervezésére, és kivitelezésére, amennyiben a felhasznált nyersanyagok rendelkezésre állnak, vagy a tanfolyamhoz tartozó modulok anyagainak elsajátításával, Õk maguk készítik elõ azokat.</p>', 'Indesign alapismeretek', '', 'publish', 'open', 'open', '', 'kiadvanyszerkesztes-dtp-indesign-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/kiadvanyszerkesztes-dtp-indesign-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(111, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>Sokan úgy gondolják, hogy egy weboldal elkészítése kizárólag a weboldal megjelenésének grafikai megtervezésébõl, majd a látványterv HTML és CSS segítségével történõ "megrajzolásából" áll.</p><p>&nbsp;<strong>De vajon a HTML és a web tényleg csak és kizárólag a vizuális látványról szól?</strong></p><p>Hiába kreatív és attraktív a weboldal, ha a célközönség nem találja meg, akkor a befektetett munka mit sem ér. Manapság egyre nagyobb hangsúlyt kap a weboldal azon része is, ami közvetlenül nem látható. A gondosan megtervezett, webszabványokon alapuló, minõségi weboldal-kód az alapja többek között a weboldal megtalálhatóságának, a <strong>keresõoptimalizálásnak</strong> (SEO), az akadálymentes honlapfejlesztésnek, végsõ soron a felhasználók megelégedettségének.</p><p>Hallgatóink egészen az alapoktól megtanulják, hogy miképpen lehet olyan keresõbarát és szabványos HTML kódot írni, ami tisztán a weboldal szemantikai tartalomleírására szolgál. Mindezt a nyelv legmodernebb, <strong>HTML5</strong> verzióján keresztül. Gyakorlati példák segítségével részletesen foglalkozunk a tartalom és megjelenés szétválasztásával, a szemantikailag korrekt <strong>HTML</strong> kódolás alapjaival, a keresõoptimalizálás (<strong>SEO</strong>) és az akadálymentes webfejlesztés megoldásaival.</p><p>Természetesen a jó tartalomhoz felhasználóbarát és attraktív megjelenésnek is társulnia kell. Ennek fényében a tanfolyamon terítékre kerül a weboldalak megjelenését meghatározó, legmodernebb <strong>CSS3</strong> nyelv is, a webes kép- és videóformátumokkal, valamint a webes tipográfiával együtt.</p><p>A munkaerõpiacon ezt a feladatkört <strong>SiteBuilding</strong>-nek nevezik, amikor a grafikai tervbõl a <strong>Site Bulider</strong> felépíti a HTML-CSS változatot.</p><p>A megszerzett ismereteket nagyon hatékonyan lehet használni a különbözõ tartalomkezelõ rendszerek, mint a <strong>Joomla, Drupal, Wordpress</strong>, stb. <strong>sablonjainak</strong> elkészítésekor vagy módosításakor.</p><p>&nbsp;</p>', 'Modern és keresõbarát weboldalak tervezése', '', 'publish', 'open', 'open', '', 'keresobarat-webszabvany-seo-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/keresobarat-webszabvany-seo-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(112, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', 'Az Excel használata során elõbb-utóbb találkozunk azzal a problémával, hogy gyakran ugyanazt a több, esetleg sok lépésbõl álló mûveletsort kell végrehajtani. Az ilyen feladatokat célszerû automatizálni, így gyorsabban, hatékonyabban dolgozhatunk. Az automatizálást az Excel programozásával érhetjük el, melynek nyelve a <strong>Visual Basic for Application, rövidítve VBA.</strong> Érdemes vele megismerkedni, mert a többi Office alkalmazás is programozható ezen a nyelven.\r\n\r\nA tanfolyam célja, hogy megismertessük a gyakorlott Microsoft Excel felhasználókkal azokat a lehetõségeket, melyek túlmutatnak a beépített menük és parancsok használatán, és amelyekkell feladatokat automatizálhatunk, vagy új funkciókat illeszthetünk be az alkalmazásba.', 'Excel makróprogramozás - VBA', '', 'publish', 'closed', 'closed', '', 'excel-makro-vba-tanfolyam', '', '', '2017-10-31 12:26:11', '2017-10-31 12:26:11', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/excel-makro-vba-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(113, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', 'A tanfolyam elvégzése után a hallgatóság rendelkezni fog azokkal az ismeretekkel, amelyek segítségével hatékonyan alkalmazhatják a Microsoft Office Project program eszközeit, a szervezetünknél felmerülõ projektek megtervezésében, végrehajtásában és követésében. A lehetséges egyedi beállítások alkalmazásával a létre tudják majd hozni azokat a megjelenítéseket, adat-összeállításokat, amire a saját projekt gyakorlatukban szükség lehet. A szükséges, adatszolgáltatási igényeknek gyorsan és hatékonyan fognak eleget tenni.', 'Projectmanagement', '', 'publish', 'open', 'open', '', 'project-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/project-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(114, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', 'Az Adobe Acrobat folyamatosan fejlõdik, az újabb és újabb verziók egyre több lehetõséget kínálnak a felhasználóknak, mint pl. Video-k beágyazása vagy digitális aláírás használata. <br />A képzésben résztvevõk megismerik a PDF állományokban rejlõ lehetõségeket, használatuk elõnyeit, létrehozásuk és szerkesztésük módjait. A tanfolyam elvégzése után képesek lesznek különbözõ alkalmazásokból, vagy akár teljesen üres állapotból PDF állományok létrehozására, szerkesztésére. Megtanulják, hogy az Acrobat alkalmazás segítségével hogyan, és milyen tartalmakat helyezhetnek el a PDF állományban, és a létrejövõ fájlokat milyen módon tudják közösen használni, digitálisan hitelesíteni', 'Adobe Acrobat ismeretek', '', 'publish', 'open', 'open', '', 'acrobat-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/acrobat-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(115, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>Elõbb vagy utóbb minden webfejlesztõ szembesül azzal, hogy a meglévõ HTML és CSS ismeretei már nem elégségesek igazán interaktív és dinamikus viselkedést biztosító weboldalak elkészítéséhez. Napjainkban a <strong>HTML5</strong> technológiák és a webalkalmazások színre lépésével ez különösen igaz. Tanfolyamunk elsõsorban azoknak szól, akik ezen megfontolásból elhatározták, hogy továbblépnek a <strong>JavaScript</strong> felé, de az elsõ lépések megtételéhez támogatást és világos iránymutatást szeretnének.</p>  <p>A tanfolyam a JavaScript (ECMAScript) nyelven és a <strong>Document Object Model (DOM)</strong> szabványon keresztül megismerteti a hallgatókat a kliens oldali programozás alapelveivel. Bemutatjuk a JavaScript történetét és szerepét a weboldalakon. Tisztázzuk a JavaScript-hez kapcsolódó, kicsit összekeveredett fogalmakat. Megnézzük, hogy napjainkban milyen webszabványok segítik szabályozott mederbe terelni a kliens oldali programozást, illetve azt, hogy ezeket a különbözõ böngészõprogramok hogyan és milyen mértékben támogatják.</p>  <p>Az elméleti alapok lefektetése után gyakorlati példákon keresztül megismerkedünk a modern DOM szkriptelés lehetõségeivel, az egyes elemek elérésével és manipulálásával. Megtanuljuk, hogy a felhasználói interakció és egyéb események hatására, hogyan változtathatja viselkedését a weboldal. Végezetül áttekintjük, hogy ugyanezen feladatok elvégzését hogyan egyszerûsítik az elterjedt JavaScript keretrendszerek, esetünkben a <strong>jQuery</strong>.</p>', 'JavaScript programozás alapjai', '', 'publish', 'open', 'open', '', 'javascript-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/javascript-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(116, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>Megismerted a Joomla alaprendszert? Megtaláltad a szükséges és legfontosabb kiegészítéseket? De nem találsz olyan sablont, ami megfelel ügyfeleid igényeinek? Gyere el, és tanuld meg az egyedi Joomla sablonok kialakítását!<br><br>A haladó Joomla tanfolyam célja, hogy megismertesse önt a Joomla sablonok anatómiájával. Körbejárjuk a Jooma sablon kezelõfelületét, a multi stíluslap funkciót, valamint a Joomla belsõ kódszerkesztõjét, a sablonkezelõ felületet. A tréning <strong>1.6 -1.8 Joomla template</strong> keretrendszerre épül, <strong>HTML5-CSS3</strong> alapokon és a <strong>W3C</strong> ajánlásait követi. <br><br>A Joomla sablon keretrendszerét egy üres sablonon fogjuk megismerni, ami <strong>Blank Joomla Templates</strong> névre hallgat. A sablon több elrendezést is támogatni fog (<strong>muti layout</strong>), tehát egy, két és három hasábos funkcióra is képes lesz. Ezt követõen egy elõre elkészített grafikus képernyõtervet feldarabolunk és az elõkészített sablonra szabjuk.<br><br>A tanfolyam második részében egy ingyenesen letölthetõ HTML-CSS, sablont (http://www.free-css.com )alakítunk át Joomla Template-re.</p>', 'Joomla sminkmester (Templates)', '', 'publish', 'open', 'open', '', 'joomla-sablon-template-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/joomla-sablon-template-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(117, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', 'A tanfolyam célja, hogy a programozásban nem járatos, ám a programozás iránt kedvet és elhivatottságot érzõ, a számítógép kezelésében képzett felhasználók számára olyan ismereteket nyújtson, amelyek segítségével maguk is képesek <strong>asztali, grafikus felületû Java-alkalmazásokat készíteni.</strong>\r\n\r\nA tanfolyam nagy hangsúlyt fektet a strukturált és <strong>objektum-orientált programozási módszerek</strong> és gondolkodásmód elsajátítására, a <strong>Java nyelvi konstrukcióira</strong>, valamint a <strong>Swing keretrendszer</strong> bemutatására.\r\n\r\nA tanfolyam során számos kisebb és egy nagyméretû, objektum-orientált szoftverfejlesztést követõ példát vesznek végig a hallgatók a népszerû <strong>NetBeans vagy Eclipse fejlesztõkörnyezet</strong> segítségével.', 'A Java programozás alapjai', '', 'publish', 'closed', 'closed', '', 'java-programozas-tanfolyam', '', '', '2016-09-09 11:49:31', '2016-09-09 11:49:31', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-programozas-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(118, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A jQuery napjaink legnépszerûbb, ingyenes, böngészõfüggetlen JavaScript függvénykönyvtára, amely jelentõsen leegyszerûsíti szinte az összes kliens oldali programozási feladatot. A tanfolyamon résztvevõk az alap jQuery és a ráépülõ jQuery UI segítségével képesek lesznek elegáns, interaktivitásban gazdag, megnövelt felhasználói élményt biztosító webes felületek létrehozására.<br><br>A tanfolyam elején tisztázzuk, hogy a jQuery-nek milyen szerepe lehet a weboldalon, és hogyan kapcsolódik a weboldal HTML/CSS/JavaScript rétegeihez. Megtanuljuk hogyan lehet jQuery kiválasztókat írni a DOM elemek összegyûjtéséhez, majd hogyan lehet az így összegyûjtött elemeket többszörösen manipulálni. Ezt követõen megismerkedünk a jQuery eseménykezelõ modelljével és animációs effektusaival. Röviden betekintünk az AJAX technológia kliens oldali használatába a jQuery-n keresztül. Végezetül a jQuery UI gyûjtemény felületi komponenseinek használatával, egyedi megjelenést biztosító konfigurálásával foglalkozunk.<br><br>A tanfolyam egyes témáit a nélkülözhetetlen elméleti alapok lefektetése után olyan példákon gyakoroljuk, amelyek a hétköznapi feladatokban is gyakran elõkerülhetnek.</p>', 'jQuery alapismeretek', '', 'publish', 'open', 'open', '', 'jquery-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/jquery-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(119, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>Szeretne Ön gyorsan és egyszerûen professzionális web helyeket készíteni? Akkor érdemes megismerkednie egy korszerû tartalomkezelõvel! Igen, ilyenbõl több is elérhetõ (Drupal, Joomla, Wordpress, stb.), mégis, melyiket érdemes választani? Nos, erre a kérdésre mi sem tudunk egyértelmû választ adni ( megvannak a megfelelõ források, ahol különbözõ összehasonlításokat olvashatunk ), emiatt vettük fel a képzési palettánkra a három legelterjedtebb ingyenes, nyílt forráskódú CMS-t.</p><p>&nbsp;<strong>A Wordpress tanfolyamon</strong> megismerheti, hogy hogyan lehet ezt a tartalomkezelõt telepíteni, beállítani, alapszinten testre szabni. Megmutatjuk, hogy a rendszer <strong>mit tud alapból</strong>, és milyen sok mindenre vehetõ rá a <strong>rengeteg ingyenes bõvítmény</strong> segítségével. Hangsúlyt fektetünk a keresõmotor optimalizálásra, és csattanóként bemutatunk egy ingyenes <strong>webshop</strong> modult is. Megtanulhatja, hogy alapszinten hogyan tudja a WordPress megjelenését a saját igényeire formálni, és hogy milyen biztonsági óvintézkedéseket kell tennie, hogy megvédje honlapját a hekkertámadásoktól.</p><p>A tanfolyam során használható saját notebook is, és rendelkezésre bocsájtunk egy olyan webtárhelyet is, ahol kipróbálhatja magát igaziból.</p>', 'Wordpress webmester', '', 'publish', 'open', 'open', '', 'wordpress-webmester-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/wordpress-webmester-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(120, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A képzés során a hallgatók elsajátítják a Drupal 7 rendszer telepítését, biztonságos üzemeltetését és testre szabását, valamint képesek lesznek a meglévõ szolgáltatások használata mellett az igények szerinti bõvítésre és a honlap megjelenésének megváltoztatására modulok, illetve sminkek segítségével.</p><p>A modul elvégzése után a hallgató képes lesz a Drupal tartalomkezelelõ rendszer segítségével korszerû, rugalmasan bõvíthetõ céges/szervezeti honlapok megtervezésére és megvalósítására, vagy a megvalósítás koordinálására a Drupal tartalomkezelõ segítségével. Képes lesz a fejlesztési lehetõségek/területek meghatározására, egyéni fejlesztést igénylõ feladatok irányítására, külsõ fejlesztõ bevonásával.</p>', 'Drupal webmester', '', 'publish', 'open', 'open', '', 'drupal-webmester-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/drupal-webmester-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(121, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A képzés célja, hogy a hallgató <strong>Drupal 7</strong> rendszerekhez önállóan képes legyen arculatokat feldolgozni, kialakítani. Az oktatásban fókuszában a Drupal sminkek és azzal kapcsolatos ismeretek elsajátítása áll, de a képzés érint alapvetõ arculatfeldolgozással (sitebuilderi teendõkkel) kapcsolatos témaköröket is. A képzésnek nem célja, hogy mély programozói ismereteket adjon, de érinti a Drupalon kívül a HTML, CSS, PHP és JavaScript ismeretkörét is.</p>', 'Drupal sminkmester', '', 'publish', 'open', 'open', '', 'drupal-smink-tanfolyam', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/drupal-smink-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(122, 2, '2016-07-07 14:44:03', '2016-07-07 14:44:03', '<p>A modul elvégzése során a hallgatók megismerik a <strong>Drupal 7</strong> rendszer felépítését, mûködését fejlesztõi/programozói szempontból. Ezáltal képesek lesznek a Drupal portálmotort, mint alkalmazás-fejlesztõ keretrendszert használni.</p><p>Megtanulják, hogy hogyan készíthetnek saját kiterjesztéseket a rendszerhez, vagy hogyan tudnak a Drupal alaprendszeréhez (felhasználó, tartalom, form stb. kezelés) kapcsolódva, azon módosításokat eszközölni.</p>', 'Drupal programozó tanfolyam', '', 'publish', 'open', 'open', '', 'drupal-modulfejlesztes-programozas', '', '', '2016-07-07 14:44:03', '2016-07-07 14:44:03', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/drupal-modulfejlesztes-programozas.php', 0, 'tanfolyamok', '', 0),
(123, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>Ebben a modulban a hallgatók megismerik a <strong>weboldalak tervezéséhez</strong> nélkülözhetetlen elméleti és gyakorlati tudnivalókat. Áttekintik a tervezés szempontjait, alapszabályait, majd a <strong>Photoshop</strong> aktuális verziójából megismerik azon eszközök használatát, melyek nélkülözhetetlenek a weboldalak egyes grafikai elemeinek tervezéséhez. A feladatokat konkrét, létezõ tervek alapján végzik. A modul végére képesek lesznek önálló látványtervek készítésére, amely alapja lehet a megrendelõvel történõ egyeztetéseknek, és a végleges, HTML változat elkészítésének.</p>', 'Webdesign-Photoshop', '', 'publish', 'open', 'open', '', 'webtervezes-webdesign-photoshop-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/webtervezes-webdesign-photoshop-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(124, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>Napjainkban egyre nagyobb az igény, hogy egy weboldal ne csak a hagyományos számítógépek kijelzõjén jelenjen meg esztétikusan, hanem a mobileszközök (mobiltelefonok, táblagépek) kijelzõjén is. Az okostelefonok és a táblagépek ugyan elvileg gond nélkül megjelenítik a hagyományos felépítésû oldalakat, de ezeken a készülékeken igazi felhasználói élményt mégiscsak a mobilra optimalizált megjelenítés biztosít.</p><p>&nbsp;Amikor a webfejlesztõ azzal szembesül, hogy az általa fejlesztett weboldalból mobil megjelenést is csinálnia kell, több lehetõség közül választhat. Egyik lehetõség, hogy elkészíti ugyanannak a weboldalnak egy teljesen önálló, kifejezetten mobilra optimalizált mutánsát. A másik lehetõség, hogy az eredeti weboldal megjelenését úgy alakítja ki, hogy az rugalmasan alkalmazkodjon a kijelzõk eltérõ méretéhez.</p><p>&nbsp;Tanfolyamunk középpontjában ez utóbbi technika, az úgynevezett <strong>Responsive Web Design (RWD)</strong> áll. Bár viták folynak arról, hogy a fent említett két lehetõség közül melyiknek mi az elõnye és a hátránya, abban egyetértés van, hogy a Responsive Web Design alkalmazása kis és közepes honlapok esetén gyorsabb, egyszerûbb és költséghatékonyabb lehet.</p><p>&nbsp;A <strong>Responsive Web Design</strong> alkalmazásához alapvetõen azt kell jól elsajátítani, hogy a weboldal vázszerkezete, a rajta megjelenõ elemek (betûk, képek, stb.) méretezése hogyan lehet teljesen rugalmas. Ehhez egy szemléletváltásra is szükség van, hiszen a fejlesztõk többsége hagyományosan mindent méretet pixelben definiál.</p><p>&nbsp;A tanfolyamon a nélkülözhetetlen elméleti alapok lefektetésével párhuzamosan közösen átalakítunk egy hagyományos, pixel alapú méretezéssel készült weboldalt, rugalmas, mobileszközökön is optimális megjelenéssel rendelkezõ weboldallá.</p><p>&nbsp;A tanfolyam elvégzésével a hallgatók képesek lesznek már méglévõ weboldalakat, CMS sablonokat rugalmas megjelenésûvé átalakítani, illetve új weboldalakat már eleve ezen elv mentén elkészíteni.</p>', 'Rugalmas webtervezés mobil eszközökre', '', 'publish', 'open', 'open', '', 'mobil-webtervezes-responsive-webdesign', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/mobil-webtervezes-responsive-webdesign.php', 0, 'tanfolyamok', '', 0) ;
INSERT INTO `pe_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(125, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A tanfolyam a JavaScript (ECMAScript) nyelven és a <strong>Document Object Model (DOM)</strong> szabványon keresztül megismerteti a hallgatókat a kliens oldali programozás alapelveivel. Bemutatjuk a JavaScript történetét és szerepét a weboldalakon. Tisztázzuk a JavaScript-hez kapcsolódó, kicsit összekeveredett fogalmakat. Megnézzük, hogy napjainkban milyen webszabványok segítik szabályozott mederbe terelni a kliens oldali programozást, illetve azt, hogy ezeket a különbözõ böngészõprogramok hogyan és milyen mértékben támogatják.</p><p>Az elméleti alapok lefektetése után gyakorlati példákon keresztül megismerkedünk a modern DOM szkriptelés lehetõségeivel, az egyes elemek elérésével és manipulálásával.</p><p>A tanfolyam második részében tisztázzuk, hogy a jQuery-nek milyen szerepe lehet a weboldalon, és hogyan kapcsolódik a weboldal HTML/CSS/JavaScript rétegeihez. Megtanuljuk hogyan lehet jQuery kiválasztókat írni a DOM elemek összegyûjtéséhez, majd hogyan lehet az így összegyûjtött elemeket többszörösen manipulálni. Ezt követõen megismerkedünk a jQuery eseménykezelõ modelljével és animációs effektusaival. Röviden betekintünk az AJAX technológia kliens oldali használatába a jQuery-n keresztül.</p>', 'JavaScript és JQuery - a biztos alapok', '', 'publish', 'open', 'open', '', 'javascript-jquery-programozas-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/javascript-jquery-programozas-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(126, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>Ezen a tanfolyamon a<a href="../halozat/TCP-IP-switch-router-tanfolyam.php" target="_blank" data-mce-href="../halozat/TCP-IP-switch-router-tanfolyam.php"> TCP/IP hálózatok, hálózati eszközök konfigurálása</a> alaptanfolyamra építve további betekintést nyújtunk a menedzselhetõ, programozható Cisco eszközök használatába, konfigurálásába. A résztvevõk a gyakorlatban megismerhetik a VLAN-ok létrehozását, a különbözõ routuóing protokollokat, forgalom és port szûrési módokat, és felkészülhetnek az IPv6 áttérésre is.</p>', 'TCP/IP hálózatok és eszközök haladóknak', '', 'publish', 'open', 'open', '', 'tcp-ip-halozatok-cisco-eszkozok-halado-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/tcp-ip-halozatok-cisco-eszkozok-halado-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(127, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A WordPress tartalomkezelõ rendszer számos gyárilag beépített sablonnal rendelkezik, és ha ez valakinek nem lenne elég, akkor az internetrõl további ingyenes vagy fizetõs sablonokat is le tud hozzá tölteni. Vannak azonban olyan webfejlesztési projektek, amikor ezek a sablonok valamilyen oknál fogva mégsem alkalmasak teljesen a készülõ honlaphoz. Például az egyik ilyen eset lehet, ha egy már meglévõ, statikus (azaz nem tartalomkezelõ rendszerre épülõ) honlapot szeretnénk WordPress-re átültetni úgy, hogy az arculat alapjaiban ne változzon meg. Ilyenkor jöhet szóba egy saját fejlesztésû, egyedi WordPress sablon elkészítése.</p><p>Tanfolyamunk célja, hogy a hallgató képes legyen önállóan WordPress sablonokat kialakítani. Akár egy meglévõ webarculat alapján, akár teljesen nulláról kiindulva. A tanfolyam fókuszában a WordPress sablonokkal kapcsolatos alapszintû ismeretek elsajátítása áll, de érinti az arculatfeldolgozással (sitebuilderi teendõkkel) kapcsolatos ismereteket is. A képzésnek nem célja, hogy professzionális sablonok elkészítéséhez szükséges mély webprogramozói ismereteket adjon, de azért a szükséges mértékben a HTML, a CSS és a PHP nyelvekkel kapcsolatos alapvetõ ismeretkört is bõvítheti.</p>', 'WordPress Sminkmester', '', 'publish', 'open', 'open', '', 'wordpress-sablon-template-theme-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/wordpress-sablon-template-theme-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(128, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A résztvevõk a kifejezetten gyakorlat orientált tanfolyam elvégzésével megismerhetik a Linux mûködését, grafikus felületét és azokat a programokat amelyekkel kiválthatják a fizetõs alkalmazásokat.</p>', 'Linux otthon és a kisirodában - SOHO', '', 'publish', 'open', 'open', '', 'linux-otthoni-irodai-hasznalat-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/linux-otthoni-irodai-hasznalat-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(129, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A tanfolyami résztvevõk egy elõre telepített Linux rendszeren, a gyakorlatban ismerkednek meg a LINUX parancssori (bash, shell) felülettel. Megtanulják használni Linux karakteres felületét (konzol), a gyakori linuxos parancsokat, megértik a jogosultságokat, a bash mûködését. Képesek lesznek önállóan vagy idõzített módon futtatható kisebb célprogramokat készíteni, amelyek nagy segítségére lehetnek egy Linux felhasználónak, a rendszergazdáknak pedig egyenesen nélkülözhetetlen.</p>', 'Linux Shell-programozás', '', 'publish', 'open', 'open', '', 'linux-shell-script-programozas', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/linux-shell-script-programozas.php', 0, 'tanfolyamok', '', 0),
(130, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p><span>A tanfolyam során a&nbsp;<strong>Java</strong>&nbsp;nyelv használatával mutatjuk meg&nbsp;az&nbsp;</span><strong>Android</strong><span>&nbsp;platform lehetõségeit</span><span>.&nbsp;</span><span>A mobil programozás napjaink húzó ágazata, ezért érdemes megismerni. A tanfolyam során &nbsp;a résztvevõk megismerkednek a Java nyelv legszükségesebb alapelemeivel, majd kifejezetten Android rendszeren futó alkalmazás&nbsp;</span><span>készítésének fázisaival.</span></p><p><span>A képzés végén képesek lesznek Android fejlesztéshez szükséges fejlesztõrendszer telepítésére, használatára, megismerik az Android rendszert, és meg tudnak tervezni, majd megvalósítani egyszerûbb Android alkalmazásokat, amelyeket publikálni tudnak az erre szolgáló piactéren.</span></p><p><span>A tudást mi adjuk, az ötleteket a hallgatók hozzák. E kettõ nyerõ páros lesz.</span></p>', 'Android programozás alapok', '', 'publish', 'open', 'open', '', 'android-programozas-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/android-programozas-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(131, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A Google Web Toolkit a Google által fejlesztett AJAX fejlesztõi eszköztár (toolkit), amit felhasználtak szinte az összes termékükben, mint például a Google Mail, Google Drive vagy Google Maps. A fõ újdonság a Java-JavaScript fordítóban van: a fejlesztõ elvégezheti a kódolást és a felhasználói felület hibakeresését Java nyelvet használva, majd legenerálja a végleges HTML/JavaScript kódot és használhatja. Az elkészült webes AJAX-os alkalmazás az összes modern böngészõt támogatja. A keretrendszer legfõbb elõnye, hogy komplex kliens oldali funkcionalitást lehet megvalósítani Objektumorientált környezetben.</p><p>A tanfolyam elvégzésével a résztvevõk képessé válnak olyan dinamikus webalkalmazások elkészítésére, amely funkcionalitásban felveheti a versenyt a natív asztali alkalmazásokkal.</p>', 'Webfejlesztés Google Web Toolkit (GWT) technológiával', '', 'publish', 'open', 'open', '', 'java-gwt-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-gwt-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(132, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A tanfolyam nagy hangsúlyt fektet a strukturált és objektum-orientált programozási módszerek és gondolkodásmód elsajátítására, a Java nyelvi konstrukcióira, valamint a különbözõ webes keretrendszerek bemutatására.</p><p>A tanfolyam során számos kisebb és egy nagyméretû, objektum-orientált szoftverfejlesztést követõ példát vesznek végig a hallgatók a népszerû Eclipse fejlesztõkörnyezet, Apache Tomcat webszerver és MySQL adatbázis segítségével. A tanfolyam elvégzésével a résztvevõk képesek lesznek összetett asztali, illetve webes Java-alkalmazásokat készíteni.</p>', 'Java programoz&#225;s haladóknak', '', 'publish', 'open', 'open', '', 'java-halado-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-halado-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(133, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A Spring az egyik legnépszerûbb nyíltforrású Java alkalmazás keretrendszer. Gyakran emlegetik a Java eszközök svájci bicskájaként is, erõs integrációs szerepe miatt. A tanfolyam célja bemutatni a keretrendszert magát, alapfogalmait, architektúráját, a különbözõ modulok szerepét és azok használatát komplex példákon keresztül. Az oktatás során számos területrõl kap betekintést a hallgató, amelyek ugyan nem Spring specifikus ismeretek, de feltétlenül szükségesek a tanfolyami anyag megértéséhez. Ilyen téma többek közt számos tervezési minta megismerése, adatbázis elméleti fogalmak, architektúrális megfontolások. &nbsp;A tanfolyam végére a hallgató képes lesz összeállítani egy minden réteget lefedõ, Spring alapú nagyvállalati alkalmazást.&nbsp;</p>', 'Java fejlesztés Spring keretrendszerrel', '', 'publish', 'open', 'open', '', 'java-spring-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-spring-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(134, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A Java Enterprise Edition (JavaEE) egy széles körben elterjedt vállalati Java programozási platform. A platform szabványai lehetõvé teszik a vállalati környezet igényeinek magas szintû kiszolgálását többrétegû, megbízható, biztonságos és skálázható alkalmazások segítségével.</p><p>A tanfolyam gyakorlatai Eclipse és Netbeans fejlesztõkörnyezetek segítségével kerülnek bemutatásra, Apache Tomcat, GlassFish és JBoss alkalmazásszervereken MySql adatbázissal.</p><p>A tanfolyam elvégzésével a résztvevõk gyakorlati példákon keresztül elsajátítják a JavaEE komponensek használatát és képessé válnak vállalati szintû alkalmazások tervezésére, fejlesztésére és összeállítására.</p>', 'Szoftverfejlesztés Java Enterprise Edition környezetben - JEE', '', 'publish', 'open', 'open', '', 'java-enterprise-jee-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-enterprise-jee-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(135, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>Fejlett tesztelési folyamatokkal és technikákkal nagyban növelhetõ a fejlesztés hatékonysága és ez által az átadott termék minõsége. Napjainkban sok eszköz áll rendelkezésre a teszteléshez, de ezek önmagunkban keveset érnek egy átgondolt tesztelési stratégia nélkül. A tanfolyam célja, hogy átfogó képet adjon a Java fejlesztési környezetben (Java Standard Edition és Java Enterprise Edition) jól alkalmazható tesztelési típusokról konkrét gyakorlati példákon keresztül.</p><p>A tanfolyam elvégzésével a résztvevõk életszerû példákon keresztül elsajátítják a tesztelés lényegi elemeit és képessé válnak a különbözõ teszt típusok alkalmazására.</p>', 'Tesztelés JAVA platformon', '', 'publish', 'open', 'open', '', 'java-teszteles-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-teszteles-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(136, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A tanfolyam célja gyakorlati példákon keresztül megismertetni a fejlesztõket a legelterjedtebb <strong>tervezési mintákkal</strong> (design patterns), és <strong>refaktoring módszerekkel</strong> (a már mûködõ kód átírása, mely során annak funkcionalitása nem változik, de a kód maga átláthatóbbá, könnyebben továbbfejleszthetõvé válik).</p><p>A gyakorlati példákban nagy hangsúlyt fektetünk a <strong>tiszta, átlátható kód</strong> készítésére, valamint az általánosan elterjedt konvenciók bemutatására és alkalmazására. Ebben nagy segítséget nyújtanak a különbözõ fejlesztõkörnyezetek erre a célra kifejlesztett funkciói is.</p><p>A tanfolyam elvégzésével a résztvevõk elsajátítják a Java nyelv objektumorientált képességeinek megfelelõ alkalmazását és képessé válnak mások számára is könnyen továbbfejleszthetõ kód készítésére, ezáltal növelve a fejlesztés hatékonyságát és a termék karbantarthatóságát.</p>', 'Tervezési minták és refaktoring Java környezetben', '', 'publish', 'open', 'open', '', 'java-tervezesi-mintak-uml-refactoring', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/java-tervezesi-mintak-uml-refactoring.php', 0, 'tanfolyamok', '', 0),
(137, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<div class="info"><p>A HTML5 és a mobilplatformok fejlõdése immár lehetõséget ad valóban használható keresztplatformos mobilalkalmazások fejlesztésére, melyeket helyes implementáció esetén a felhasználó nem tud megkülönböztetni a natív alkalmazásoktól, ugyanakkor kódjuk 90-100%-ban megegyezik az összes platformon.</p><p>A <strong>PhoneGap</strong> a legelterjedtebb keresztplatformos fejlesztõkörnyezet, mely immár nyílt foráskódú (<strong>Apache Cordova</strong> néven), ugyanakkor az Adobe ad mögé hátteret és támogatást.</p><p>A tanfolyam során megismerjük a mobilfejlesztés alapjait, az alkalmazás publikálásának követelményeit, és hogy ezeket hogyan valósíthatjuk meg PhoneGap használatával. Elkészítünk egy mûködõ alkalmazást Android, iOS és Windows Phone platformokra, majd megtanuljuk optimalizálni és hatékonyan tesztelni az alkalmazásainkat.</p><p>A képzés végén a hallgatók képesek lesznek keresztplatformos mobilalkalmazások fejlesztésére és publikálására, ismerni fogják a PhoneGap lehetõségeit és korlátait, az alkalmazások lokális fordításának folyamatát, valamint a PhoneGap Build szolgáltatás használatát. &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p></div>', 'Keresztplatformos Mobilalkalmazás-fejlesztés - PhoneGap', '', 'publish', 'open', 'open', '', 'webapp-mobil-alkalmazas-phonegap-cordova-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/webapp-mobil-alkalmazas-phonegap-cordova-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(138, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p>A tanfolyam során a hamarosan megjelenõ <strong> Visual Studio 2015 </strong> fejlesztõkörnyezet, a <strong> C# 6.0 </strong> programozási nyelv és a <strong> .NET 4.6 </strong> keretrendszer új eszközeit és szolgáltatásait ismertetjük meg. Egyszerû példákon keresztül demonstráljuk, hogyan segítik az új lehetõségek az ipari alkalmazásfejlesztést és hogyan illeszkednek a jelenlegi eszköztárba. Kitérünk a <strong> .NET Compiler Platformra </strong> is, ami az ismertetett újdonságok nagy részének bevezetését lehetõvé tette a nyelvbe és a fejlesztõeszközbe.</p>', 'Visual Studio 2015 és C# 6.0 újdonságok', '', 'publish', 'open', 'open', '', 'visual-studio-2015-c-sharp-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/visual-studio-2015-c-sharp-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(139, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<h3><strong>Microsoft Excel-lel dolgozik? Rendszeresen ismétlõdõ, idõrabló feladatai vannak?</strong></h3><p>Tanítsa meg az Excel-t a feladatsor elvégzésére! Ha egyszer helyesen megtanítja, Õ&nbsp;<strong>százszor vagy akár ezerszer gyorsabban&nbsp;</strong>végrehajtja az automatizált folyamatot, mint Ön csinálta kézzel, hajdanán!</p><p>Az Excel képes arra, hogy a saját nyelvén rögzíti az Ön által elvégzett lépéseket. Ezt nevezzük makró rögzítésnek. A rögzített makrót bármikor, bármennyiszer, óriási sebességgel le tudja játszani, azaz megismétli a â€œmegtanultâ€ mûveletsort. A rögzített makró azonban csak azokkal az adatokkal fog helyesen dolgozni, amelyekkel a rögzítés során találkozott. Az ismétlõdõ feladatainkat legtöbbször más-más adatokon végezzük, de ugyanazokkal a lépésekkel haladunk.</p><p>A mi dolgunk a tanfolyam során az, hogy egy kicsit megismerjük az Excel saját nyelvét. Ez azért fontos, hogy a rögzített makróban meg tudjuk különböztetni a lényeges pontokat, meg tudjuk változtatni a makrót úgy, hogy tetszõleges adatokkal is mindig helyesen mûködjön.</p><p>Az Excel automatizálás tanfolyamon&nbsp;<strong>nem tanulunk programozni, és nem is várjuk el senkitõl, hogy tudjon&nbsp;</strong>. Ez a nagyon hatékony&nbsp;<strong>egy nap&nbsp;</strong>arra lesz jó, hogy az Ön által végzett munkát jelentõsen fel tudja gyorsítani, ezáltal sokkal hatékonyabban dolgozhat. Olyan típusú feladatok automatizásására mutatunk példákat, amelyek munkafolyamata jól definiálható, nem, vagy csak nagyon ritkán változnak a végrehajtandó lépések.</p><p><br></p><p><strong>A tanfolyam elvégzése után a résztvevõ képes lesz</strong></p><ul><li>Egyszerû makrók rögzítésére,</li><li>A felvett makró kód értelmezésére és módosítására</li><li>Képletek, számított oszlopok automatikus beillesztésére</li><li>Szûrések makrózására</li><li>PIVOT táblák automatizált létrehozására</li><li>Egy feladat megoldási lépéseinek struktúrálására</li></ul>', 'Excel automatizálás', '', 'publish', 'open', 'open', '', 'excel-automatizalas-makro-vba-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/excel-automatizalas-makro-vba-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(140, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<p dir="ltr"><span>A tanfolyam során a </span><span>JavaScript </span><span>nyelvre épülõ </span><strong>AngularJS </strong><span>keretrendszer lehetõségeit mutatjuk be. Az AngularJS napjainkban a webes világ igen népszerû kliens oldali megoldása, ezért érdemes megismerni. A Google mûhelyébõl induilt útjára, egyre több helyen lehet vele találkozni. </span></p><p dir="ltr"><span>Az AngularJS kiterjeszti a HTML-t új elemkkel és attribútumokkal, így jelentõs mértékben megkönnyíti az <strong>Ajax</strong> alapú webalkalmazások készítését, legyen szó akár <strong>SPA</strong> (Single Page Aplication) fejlesztésrõl.</span></p><p>A képzés végén a résztvevõk képesek lesznek az AngularJS használatával olyan webalkalmazások kliens oldali kódjának elkészítésére, hogy a felhasználó szinte észre se vegye, hogy nem egy asztali alkalmazást használ.</p>', 'Bevezetés az Angular JS keretrendszerbe', '', 'publish', 'open', 'open', '', 'angular-js-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/angular-js-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(141, 2, '2016-07-07 14:44:06', '2016-07-07 14:44:06', '<ul class="list-9"><li>Gyakran dolgozol Excel-lel?</li><li>Adatok összesítésével, szûrésével, elemzésével foglalkozol?</li><li>Használsz már PIVOT táblákat, de megismernéd mélyebben?</li><li>Le akarod nyûgözni munkatársaidat vagy a fõnöködet?</li><li>Egyszerûen csak növelnéd munkaerõ értékedet?</li></ul><p>Ha bármelyik kérdésre IGEN a válaszod, szánj rá egy napot, és ismerd meg, fedezd fel a Microsoft Excel egyik legerõteljesebb eszközét!&nbsp;A kimutatások (PIVOT táblák) a megfelelõen elõkészített forrásadatok összesítésére, és az eredmények prezentálására szolgálnak.&nbsp;Egy táblázatos adathalmaz több szempont szerinti csoportosított részösszegzésére nem találhatsz jobb szerszámot.</p><p>Ha nem készítettél még ilyesmit, vagy nem vagy biztos benne, hogy tudod mi ez, akkor&nbsp;<strong>nézd meg az oldal alján a bemutató videót!</strong></p><h3>Mit fogunk tanulni?</h3><p>Az egy napos workshop során az alapok rövid bemutatása után megismertetjük a PIVOT táblákban rejlõ haladóbb lehetõségeket, és a nap végén rövid ízelítõt mutatunk az ingyenes POWER PIVOT beépülõ modulból, amellyel végre áthágható az Excel fizikai korlátja, és segítségével akár több millió sorból álló forrásadatból is tudunk kimutatást készíteni.</p><ul class="list-4"><li>A nap végére a résztvevõk megértik, hogy hogyan kell elõkészíteni egy adatforrást úgy, hogy PIVOT riportot tudjunk belõle csinálni, és képesek lesznek egyszerûbb és összetettebb kimutatások elkészítésére, formázására és menedzselésére.</li><li>Megértik, milyen kapcsolatban van az eredeti adatforrás a PIVOT táblával, és hogyan tudják a dinamikusan változó adatokkal együtt naprakészen tartani a kimutatást.</li><li>Megtanulják, hogyan kell ugyanazon adatforrásból több, különbözõ PIVOT táblát készíteni, azokat látványos szûröfelülettel ellátni, és kimutatás diagramokkal fûszerezve, nagyon hatásos, és használható, interaktív Dashboard-okat készíteni.</li><li>Végül megtapasztalhatják, hogy miért is gondolják az Excel inygenes POWERPIVOT bõvítményét forradalminak, és megértik annak mûködését, alapszintû szolgáltatásait.</li></ul><p>A nap workshop jellegû, gyakorlati feladatok megoldása történik. Természetesen mindenki külön számítógépen dolgozik, de lehet hozni saját Laptop-ot is.</p><p>Az Excel verzió 2010 vagy 2013.</p>', 'Excel PIVOT tábla mesterkurzus', '', 'publish', 'open', 'open', '', 'excel-kimutatas-pivot-tabla-tanfolyam', '', '', '2016-07-07 14:44:06', '2016-07-07 14:44:06', '', 0, 'http://pentaschool.hu/tanfolyamok/egyeb/excel-kimutatas-pivot-tabla-tanfolyam.php', 0, 'tanfolyamok', '', 0),
(144, 2, '2016-07-28 09:03:36', '2016-07-28 09:03:36', '', 'Tanfolyam kiírás', '', 'publish', 'closed', 'closed', '', 'acf_tanfolyam-kiiras', '', '', '2016-07-30 16:17:43', '2016-07-30 16:17:43', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=144', 0, 'acf', '', 0),
(145, 2, '2016-07-28 09:04:37', '2016-07-28 09:04:37', '', 'Tanárok', '', 'publish', 'closed', 'closed', '', 'acf_tanarok', '', '', '2016-07-28 09:09:44', '2016-07-28 09:09:44', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=145', 0, 'acf', '', 0),
(146, 2, '2016-07-28 09:10:29', '2016-07-28 09:10:29', '', 'Helyszin', '', 'publish', 'closed', 'closed', '', 'acf_helyszin', '', '', '2016-07-28 09:10:29', '2016-07-28 09:10:29', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=146', 0, 'acf', '', 0),
(149, 2, '2016-07-28 09:26:13', '2016-07-28 09:26:13', '', 'Szolgáltatások', '', 'publish', 'closed', 'closed', '', 'szolgaltatasok', '', '', '2016-07-28 09:26:13', '2016-07-28 09:26:13', '', 0, 'http://pentaschool.hu/?page_id=149', 0, 'page', '', 0),
(150, 2, '2016-07-28 09:26:13', '2016-07-28 09:26:13', '', 'Szolgáltatások', '', 'inherit', 'closed', 'closed', '', '149-revision-v1', '', '', '2016-07-28 09:26:13', '2016-07-28 09:26:13', '', 149, 'http://pentaschool.hu/149-revision-v1.php', 0, 'revision', '', 0),
(154, 2, '2016-07-28 09:31:51', '2016-07-28 09:31:51', '', 'Ajánlások', '', 'publish', 'closed', 'closed', '', 'acf_ajanlasok', '', '', '2016-07-28 11:15:14', '2016-07-28 11:15:14', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=154', 0, 'acf', '', 0),
(156, 2, '2016-07-28 10:33:04', '2016-07-28 10:33:04', 'sdf', '2016-07-28', '', 'publish', 'closed', 'closed', '', '2016-07-28', '', '', '2016-07-28 10:33:04', '2016-07-28 10:33:04', '', 0, 'http://pentaschool.hu/ajanlas/2016-07-28/', 0, 'ajanlas', '', 0),
(157, 2, '2016-07-28 10:33:51', '2016-07-28 10:33:51', 'asd', '2016-07-28', '', 'publish', 'closed', 'closed', '', '2016-07-28-2', '', '', '2016-07-28 10:33:51', '2016-07-28 10:33:51', '', 0, 'http://pentaschool.hu/ajanlas/2016-07-28-2/', 0, 'ajanlas', '', 0),
(158, 2, '2016-07-28 10:35:12', '2016-07-28 10:35:12', 'sd', '2016-07-28', '', 'publish', 'closed', 'closed', '', '2016-07-28-3', '', '', '2016-07-28 10:35:12', '2016-07-28 10:35:12', '', 0, 'http://pentaschool.hu/ajanlas/2016-07-28-3/', 0, 'ajanlas', '', 0),
(159, 2, '2016-07-28 10:38:21', '2016-07-28 10:38:21', 'fdg', '2016-07-28', '', 'publish', 'closed', 'closed', '', '2016-07-28-4', '', '', '2016-07-28 10:38:21', '2016-07-28 10:38:21', '', 0, 'http://pentaschool.hu/ajanlas/2016-07-28-4/', 0, 'ajanlas', '', 0),
(160, 2, '2016-07-28 10:39:00', '2016-07-28 10:39:00', 'xc', '2016-07-28', '', 'publish', 'closed', 'closed', '', '2016-07-28-5', '', '', '2016-07-28 10:39:00', '2016-07-28 10:39:00', '', 0, 'http://pentaschool.hu/ajanlas/2016-07-28-5/', 0, 'ajanlas', '', 0),
(161, 2, '2016-07-28 11:13:35', '2016-07-28 11:13:35', 'sadfsdfsdf', '2016-07-28', '', 'publish', 'closed', 'closed', '', '2016-07-28-6', '', '', '2016-07-28 11:13:35', '2016-07-28 11:13:35', '', 0, 'http://pentaschool.hu/ajanlas/2016-07-28-6/', 0, 'ajanlas', '', 0),
(164, 2, '2016-07-30 15:29:47', '2016-07-30 15:29:47', 'Kirás leírás', 'Excel Június', '', 'publish', 'closed', 'closed', '', 'excel-junius', '', '', '2018-02-21 10:39:13', '2018-02-21 10:39:13', '', 0, 'http://pentaschool.hu/?post_type=tanfolyam-kiiras&#038;p=164', 0, 'tanfolyam-kiiras', '', 0),
(165, 2, '2016-07-30 15:32:54', '2016-07-30 15:32:54', '<h3>Megközelítés</h3>\r\n<strong>Gépjárművel</strong>\r\nA gépjárművel történő megközelítést csak akkor javasolnánk, ha nincs más választás, vagy a látogatás időpontja csúcsidőszakon kívül, például hétvégére esik. A felszínen nagyon nehéz parklóhelyet találni, ami természetesen fizetős. A közelben működik két korszerű mélygarázs is. Egyik a Bazilika tér alatt, a másik a Széchenyi tér alatt.\r\n\r\n<strong>Tömegközlekedéssel</strong> <em>(kék pontvonal)</em>\r\nEgyik lehetőség a 3-as (kék) metrovonal Arany János utcai megállójától gyalog a duna felé indulva az Arany János utcán, kb. 2 perc séta után, balra a második utca lesz a Sas utca.\r\n\r\nMásik lehetőség a Deák téri csomópont felől, ahol a 3-as, és a a 2-es Metro, illetve a Földalatti is találkozik, de ide érkeznek a 47-49-es villamosok is a Szabadság híd-Kiskörút útvonalon.\r\n\r\nIrodánk a Sas utca és az Arany János utca sarkán, a 6. emeleten található, az épületben két lift is működik.\r\n\r\n<strong>A tantermek</strong>\r\nTantermeink 15, illetve 12 fő befogadására alkalmasak, Internetkapcsolattal. Az oktatás során mindenknek saját számítógépe van, és kivetítőn követhetik az oktatói gépen történteket.', 'Budapest', '', 'publish', 'closed', 'closed', '', 'budapest', '', '', '2016-07-30 15:32:54', '2016-07-30 15:32:54', '', 0, 'http://pentaschool.hu/?post_type=helyszin&#038;p=165', 0, 'helyszin', '', 0),
(166, 2, '2016-07-30 15:31:36', '2016-07-30 15:31:36', 'A Pentaschool Oktatási Központ tulajdonosa, ügyvezetője. 1967-ben született, villamos üzemmérnök, műszaki tanár. 8 év közoktatásban szerzett gyermek és felnőttoktatás, illetve rendszergazdai tapasztalat után alapított saját iskolát 1999-ben.', 'Horváth Imre', '', 'publish', 'closed', 'closed', '', 'horvath-imre', '', '', '2016-07-30 15:31:36', '2016-07-30 15:31:36', '', 0, 'http://pentaschool.hu/?post_type=tanarok&#038;p=166', 0, 'tanarok', '', 0),
(167, 2, '2016-07-30 15:31:13', '2016-07-30 15:31:13', '', 'Imi-Pentaschool-profil', '', 'inherit', 'open', 'closed', '', 'imi-pentaschool-profil', '', '', '2016-07-30 15:31:13', '2016-07-30 15:31:13', '', 166, 'http://pentaschool.hu/wp-content/uploads/2016/07/Imi-Pentaschool-profil.jpg', 0, 'attachment', 'image/jpeg', 0),
(168, 2, '2016-07-30 15:32:44', '2016-07-30 15:32:44', '', 'sas_terem2', '', 'inherit', 'open', 'closed', '', 'sas_terem2', '', '', '2016-07-30 15:32:44', '2016-07-30 15:32:44', '', 165, 'http://pentaschool.hu/wp-content/uploads/2016/07/sas_terem2.jpg', 0, 'attachment', 'image/jpeg', 0),
(169, 2, '2016-07-30 15:32:46', '2016-07-30 15:32:46', '', 'sas_terem1', '', 'inherit', 'open', 'closed', '', 'sas_terem1', '', '', '2016-07-30 15:32:46', '2016-07-30 15:32:46', '', 165, 'http://pentaschool.hu/wp-content/uploads/2016/07/sas_terem1.jpg', 0, 'attachment', 'image/jpeg', 0),
(170, 2, '2016-07-30 15:32:48', '2016-07-30 15:32:48', '', 'sas-bejarat', '', 'inherit', 'open', 'closed', '', 'sas-bejarat', '', '', '2016-07-30 15:32:48', '2016-07-30 15:32:48', '', 165, 'http://pentaschool.hu/wp-content/uploads/2016/07/sas-bejarat.jpg', 0, 'attachment', 'image/jpeg', 0),
(171, 2, '2016-07-30 16:37:10', '2016-07-30 16:37:10', '[gravityform id="1" title="true" description="true" ajax="false"]', 'Excel augusztus', '', 'publish', 'closed', 'closed', '', 'excel-augusztus', '', '', '2018-02-21 10:54:44', '2018-02-21 10:54:44', '', 0, 'http://pentaschool.hu/?post_type=tanfolyam-kiiras&#038;p=171', 0, 'tanfolyam-kiiras', '', 0),
(172, 2, '2016-07-30 16:36:54', '2016-07-30 16:36:54', 'Kirás  leírás', 'Excel Június', '', 'inherit', 'closed', 'closed', '', '164-autosave-v1', '', '', '2016-07-30 16:36:54', '2016-07-30 16:36:54', '', 164, 'http://pentaschool.hu/164-autosave-v1.php', 0, 'revision', '', 0),
(175, 2, '2016-08-07 11:38:28', '2016-08-07 11:38:28', '', 'Értékelések', '', 'publish', 'closed', 'closed', '', 'acf_ertekelesek', '', '', '2016-08-27 14:35:36', '2016-08-27 14:35:36', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=175', 1, 'acf', '', 0),
(183, 2, '2016-08-10 14:35:58', '2016-08-10 14:35:58', '', 'Értékelés előre kitöltött rész', '', 'publish', 'closed', 'closed', '', 'acf_ertekeles-elore-kitoltott-resz', '', '', '2016-08-10 14:53:30', '2016-08-10 14:53:30', '', 0, 'http://pentaschool.hu/?post_type=acf&#038;p=183', 0, 'acf', '', 0),
(185, 2, '2016-08-10 14:39:41', '2016-08-10 14:39:41', '', 'Test', '', 'publish', 'closed', 'closed', '', 'test', '', '', '2016-08-10 14:39:41', '2016-08-10 14:39:41', '', 0, 'http://pentaschool.hu/?post_type=ertekelesek&#038;p=185', 0, 'ertekelesek', '', 0),
(186, 2, '2016-08-10 15:39:33', '2016-08-10 15:39:33', '', 'A Java programozás alapjai-20160810-Horváth Imre-Budapest', '', 'publish', 'closed', 'closed', '', 'java-programozas-tanfolyam-20160810', '', '', '2016-08-10 15:39:33', '2016-08-10 15:39:33', '', 0, 'http://pentaschool.hu/ajanlas/java-programozas-tanfolyam-20160810', 0, 'ajanlas', '', 0),
(187, 2, '2016-08-10 15:40:35', '2016-08-10 15:40:35', '', 'A Java programozás alapjai-20150810-Horváth Imre-Budapest', '', 'publish', 'closed', 'closed', '', 'java-programozas-tanfolyam-20150810', '', '', '2016-08-27 11:56:24', '2016-08-27 11:56:24', '', 0, 'http://pentaschool.hu/ertekelesek/java-programozas-tanfolyam-20150810/', 0, 'ertekelesek', '', 0),
(188, 2, '2016-08-10 15:41:28', '2016-08-10 15:41:28', '', 'A Java programozás alapjai-2016.08.01-Levi-Bp', '', 'publish', 'closed', 'closed', '', 'java-programozas-tanfolyam-2016-08-01', '', '', '2016-08-27 11:55:49', '2016-08-27 11:55:49', '', 0, 'http://pentaschool.hu/ertekelesek/java-programozas-tanfolyam-2016-08-01/', 0, 'ertekelesek', '', 0),
(189, 2, '2016-08-10 15:46:47', '2016-08-10 15:46:47', '', 'A Java programozás alapjai-2016.8.10-Imre-BP', '', 'publish', 'closed', 'closed', '', 'java-programozas-tanfolyam-2016-8-10', '', '', '2016-08-27 11:50:43', '2016-08-27 11:50:43', '', 0, 'http://pentaschool.hu/ertekelesek/java-programozas-tanfolyam-2016-8-10/', 0, 'ertekelesek', '', 0),
(195, 2, '2016-08-27 10:20:04', '2016-08-27 10:20:04', '', 'Valasz161608082727', '', 'publish', 'closed', 'closed', '', 'valasz161608082727-4', '', '', '2016-08-27 13:35:57', '2016-08-27 13:35:57', '', 0, 'http://pentaschool.hu/?post_type=valaszok&#038;p=195', 0, 'valaszok', '', 0),
(196, 2, '2016-08-27 10:32:55', '2016-08-27 10:32:55', '', 'Valasz161608082727', '', 'publish', 'closed', 'closed', '', 'valasz161608082727-3', '', '', '2016-08-27 13:35:48', '2016-08-27 13:35:48', '', 0, 'http://pentaschool.hu/?post_type=valaszok&#038;p=196', 0, 'valaszok', '', 0),
(197, 2, '2016-08-27 10:34:44', '2016-08-27 10:34:44', '', 'Valasz161608082727', '', 'publish', 'closed', 'closed', '', 'valasz161608082727-2', '', '', '2016-08-27 13:35:40', '2016-08-27 13:35:40', '', 0, 'http://pentaschool.hu/?post_type=valaszok&#038;p=197', 0, 'valaszok', '', 0) ;
INSERT INTO `pe_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(198, 2, '2016-08-27 10:35:43', '2016-08-27 10:35:43', '', 'Valasz161608082727', '', 'publish', 'closed', 'closed', '', 'valasz161608082727', '', '', '2016-08-27 13:35:32', '2016-08-27 13:35:32', '', 0, 'http://pentaschool.hu/?post_type=valaszok&#038;p=198', 0, 'valaszok', '', 0),
(199, 2, '2016-08-27 11:10:10', '2016-08-27 11:10:10', '', 'Ratings summary', '', 'publish', 'closed', 'closed', '', 'ratings-summary', '', '', '2016-08-27 11:10:10', '2016-08-27 11:10:10', '', 0, 'http://pentaschool.hu/?page_id=199', 0, 'page', '', 0),
(200, 2, '2016-08-27 11:10:10', '2016-08-27 11:10:10', '', 'Ratings summary', '', 'inherit', 'closed', 'closed', '', '199-revision-v1', '', '', '2016-08-27 11:10:10', '2016-08-27 11:10:10', '', 199, 'http://pentaschool.hu/199-revision-v1.php', 0, 'revision', '', 0),
(201, 2, '2016-08-27 11:46:13', '2016-08-27 11:46:13', '', 'Adatbázis-kezelés haladóknak - Access-2016.08.27-Horváth Imre-Budapest', '', 'publish', 'closed', 'closed', '', 'adatbazis-access-halado-tanfolyam-2016-08-27', '', '', '2016-08-27 11:46:13', '2016-08-27 11:46:13', '', 0, 'http://pentaschool.hu/ertekelesek/adatbazis-access-halado-tanfolyam-2016-08-27/', 0, 'ertekelesek', '', 0),
(202, 2, '2016-08-27 11:55:14', '2016-08-27 11:55:14', '', 'A Java programozás alapjai-2016.08.01-Levi-Bp', '', 'inherit', 'closed', 'closed', '', '188-autosave-v1', '', '', '2016-08-27 11:55:14', '2016-08-27 11:55:14', '', 188, 'http://pentaschool.hu/188-autosave-v1.php', 0, 'revision', '', 0),
(204, 2, '2016-08-27 17:23:55', '2016-08-27 17:23:55', 'a:6:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:9:"ajanlasok";}}}s:8:"position";s:6:"normal";s:5:"style";s:8:"seamless";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";}', 'Ajánlások', 'ajanlasok', 'publish', 'closed', 'closed', '', 'group_57c1ccab94e26', '', '', '2017-02-01 21:07:36', '2017-02-01 21:07:36', '', 0, 'http://pentaschool.hu', 0, 'acf-field-group', '', 0),
(205, 2, '2016-08-27 17:23:55', '2016-08-27 17:23:55', 'a:12:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:11:"tanfolyamok";}s:8:"taxonomy";a:0:{}s:7:"filters";a:1:{i:0;s:6:"search";}s:3:"max";s:0:"";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:8:"elements";a:1:{i:0;s:9:"post_type";}}', 'Tanfolyam', 'tanfolyam', 'publish', 'closed', 'closed', '', 'field_5799d0da1c22c', '', '', '2017-02-01 21:06:59', '2017-02-01 21:06:59', '', 204, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(206, 2, '2016-08-27 17:23:55', '2016-08-27 17:23:55', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'keresztnev', 'keresztnev', 'publish', 'closed', 'closed', '', 'field_5799d0f11c22d', '', '', '2017-02-01 21:06:59', '2017-02-01 21:06:59', '', 204, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(207, 2, '2016-08-27 17:23:55', '2016-08-27 17:23:55', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'cégnév', 'cegnev', 'publish', 'closed', 'closed', '', 'field_5799d0f91c22e', '', '', '2017-02-01 21:06:59', '2017-02-01 21:06:59', '', 204, 'http://pentaschool.hu', 2, 'acf-field', '', 0),
(214, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:8:"helyszin";}}}s:8:"position";s:6:"normal";s:5:"style";s:8:"seamless";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";a:0:{}s:6:"old_ID";i:146;}', 'Helyszin', 'helyszin', 'publish', 'closed', 'closed', '', 'group_57c1ccac8b38d', '', '', '2016-08-27 17:23:56', '2016-08-27 17:23:56', '', 0, 'http://pentaschool.hu', 0, 'acf-field-group', '', 0),
(215, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Pontos_cim', 'pontos_cim', 'publish', 'closed', 'closed', '', 'field_5799cbae5b7f4', '', '', '2016-08-27 17:23:56', '2016-08-27 17:23:56', '', 214, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(216, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'terkep_iframe', 'terkep_iframe', 'publish', 'closed', 'closed', '', 'field_5799cb825b7f3', '', '', '2016-08-27 17:23:56', '2016-08-27 17:23:56', '', 214, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(217, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:16:{s:4:"type";s:7:"gallery";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:12:"preview_size";s:9:"thumbnail";s:7:"library";s:3:"all";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:3:"max";i:0;s:9:"min_width";i:0;s:10:"min_height";i:0;s:8:"min_size";i:0;s:9:"max_width";i:0;s:10:"max_height";i:0;s:8:"max_size";i:0;s:10:"mime_types";s:0:"";}', 'Képek', 'kepek', 'publish', 'closed', 'closed', '', 'field_5799cbf95b7f5', '', '', '2016-08-27 17:23:56', '2016-08-27 17:23:56', '', 214, 'http://pentaschool.hu', 2, 'acf-field', '', 0),
(218, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:6:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:11:"referenciak";}}}s:8:"position";s:6:"normal";s:5:"style";s:8:"seamless";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";}', 'Referenciák', 'referenciak', 'publish', 'closed', 'closed', '', 'group_57c1ccaccbdf8', '', '', '2017-02-11 11:14:45', '2017-02-11 11:14:45', '', 0, 'http://pentaschool.hu', 0, 'acf-field-group', '', 0),
(219, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'év', 'ev', 'publish', 'closed', 'closed', '', 'field_577e44cf7a644', '', '', '2016-08-27 17:23:56', '2016-08-27 17:23:56', '', 218, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(220, 2, '2016-08-27 17:23:56', '2016-08-27 17:23:56', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'létszám', 'letszam', 'publish', 'closed', 'closed', '', 'field_577e44ff7a645', '', '', '2016-08-27 17:23:56', '2016-08-27 17:23:56', '', 218, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(221, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:7:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:7:"tanarok";}}}s:8:"position";s:6:"normal";s:5:"style";s:8:"seamless";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";a:0:{}s:6:"old_ID";i:145;}', 'Tanárok', 'tanarok', 'publish', 'closed', 'closed', '', 'group_57c1ccad09b18', '', '', '2016-08-27 17:23:57', '2016-08-27 17:23:57', '', 0, 'http://pentaschool.hu', 0, 'acf-field-group', '', 0),
(222, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:11:{s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"row_min";s:0:"";s:9:"row_limit";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:3:"max";i:0;}', 'Témák', 'temak', 'publish', 'closed', 'closed', '', 'field_5799caaae11cc', '', '', '2016-08-27 17:23:57', '2016-08-27 17:23:57', '', 221, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(223, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Téma', 'tema', 'publish', 'closed', 'closed', '', 'field_5799cabde11cd', '', '', '2016-08-27 17:23:57', '2016-08-27 17:23:57', '', 222, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(224, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:6:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:16:"tanfolyam-kiiras";}}}s:8:"position";s:6:"normal";s:5:"style";s:8:"seamless";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";}', 'Tanfolyam kiírás', 'tanfolyam-kiiras', 'publish', 'closed', 'closed', '', 'group_57c1ccad3ca65', '', '', '2017-04-12 14:55:02', '2017-04-12 14:55:02', '', 0, 'http://pentaschool.hu', 0, 'acf-field-group', '', 0),
(225, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:14:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:9:"post_type";a:1:{i:0;s:7:"tanarok";}s:8:"taxonomy";a:0:{}s:7:"filters";a:1:{i:0;s:6:"search";}s:8:"elements";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:13:"return_format";s:2:"id";s:11:"show_column";i:0;s:18:"show_column_weight";s:0:"";}', 'Tanar', 'tanar', 'publish', 'closed', 'closed', '', 'field_5799caed41a4a', '', '', '2017-02-02 14:39:55', '2017-02-02 14:39:55', '', 224, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(226, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:12:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:6:"object";s:9:"post_type";a:1:{i:0;s:8:"helyszin";}s:8:"taxonomy";a:0:{}s:7:"filters";a:1:{i:0;s:6:"search";}s:3:"max";s:0:"";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:8:"elements";a:1:{i:0;s:9:"post_type";}}', 'Helyszín', 'helyszin', 'publish', 'closed', 'closed', '', 'field_5799cc0e5a5af', '', '', '2016-08-27 17:23:57', '2016-08-27 17:23:57', '', 224, 'http://pentaschool.hu', 2, 'acf-field', '', 0),
(227, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:12:{s:4:"type";s:11:"date_picker";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:14:"display_format";s:5:"d/m/Y";s:13:"return_format";s:5:"Y.m.d";s:9:"first_day";i:1;s:11:"show_column";i:0;s:18:"show_column_weight";s:0:"";s:15:"allow_quickedit";i:0;s:14:"allow_bulkedit";i:0;s:17:"conditional_logic";a:2:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:15:"Napok megadása";}}i:1;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:27:"Kezdés és vége megadása";}}}}', 'Kezdés', 'kezdes', 'publish', 'closed', 'closed', '', 'field_5799cd459eeba', '', '', '2017-02-02 21:15:27', '2017-02-02 21:15:27', '', 347, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(228, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:12:{s:4:"type";s:11:"date_picker";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:14:"display_format";s:5:"d/m/Y";s:13:"return_format";s:5:"Y.m.d";s:9:"first_day";i:1;s:11:"show_column";i:0;s:18:"show_column_weight";s:0:"";s:15:"allow_quickedit";i:0;s:14:"allow_bulkedit";i:0;s:17:"conditional_logic";a:2:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:27:"Kezdés és vége megadása";}}i:1;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:15:"Napok megadása";}}}}', 'Vége', 'vege', 'publish', 'closed', 'closed', '', 'field_5799cd619eebb', '', '', '2017-02-02 21:15:27', '2017-02-02 21:15:27', '', 347, 'http://pentaschool.hu', 3, 'acf-field', '', 0),
(229, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:14:{s:4:"type";s:6:"select";s:12:"instructions";s:17:"Esti vagy nappali";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"choices";a:2:{s:4:"esti";s:4:"Esti";s:7:"nappali";s:7:"Nappali";}s:13:"default_value";a:1:{s:0:"";s:0:"";}s:10:"allow_null";i:0;s:8:"multiple";i:0;s:2:"ui";i:0;s:4:"ajax";i:0;s:11:"placeholder";s:0:"";s:8:"disabled";i:0;s:8:"readonly";i:0;}', 'Napszak', 'napszak', 'publish', 'closed', 'closed', '', 'field_5799cd6b9eebc', '', '', '2017-04-12 14:55:02', '2017-04-12 14:55:02', '', 224, 'http://pentaschool.hu', 3, 'acf-field', '', 0),
(230, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:16:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:11:"show_column";i:0;s:18:"show_column_weight";s:0:"";s:15:"allow_quickedit";i:0;s:14:"allow_bulkedit";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;s:17:"conditional_logic";a:2:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:27:"Kezdés és vége megadása";}}i:1;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:15:"Napok megadása";}}}}', 'Időbeosztás', 'idobeosztas', 'publish', 'closed', 'closed', '', 'field_5799cd709eebd', '', '', '2017-02-02 21:15:27', '2017-02-02 21:15:27', '', 347, 'http://pentaschool.hu', 4, 'acf-field', '', 0),
(231, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Minimum letszám', 'minimum_letszam', 'publish', 'closed', 'closed', '', 'field_5799ce4a9eebe', '', '', '2017-02-02 20:31:00', '2017-02-02 20:31:00', '', 224, 'http://pentaschool.hu', 5, 'acf-field', '', 0),
(232, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Maximum létszám', 'maximum_letszam', 'publish', 'closed', 'closed', '', 'field_5799ce5b9eebf', '', '', '2017-02-02 20:31:00', '2017-02-02 20:31:00', '', 224, 'http://pentaschool.hu', 6, 'acf-field', '', 0),
(233, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:4:"step";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Beiratkozva', 'beiratkozva', 'publish', 'closed', 'closed', '', 'field_5799cf379eec0', '', '', '2017-02-02 20:31:00', '2017-02-02 20:31:00', '', 224, 'http://pentaschool.hu', 7, 'acf-field', '', 0),
(234, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:12:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:11:"tanfolyamok";}s:8:"taxonomy";a:0:{}s:7:"filters";a:1:{i:0;s:6:"search";}s:3:"max";i:1;s:17:"conditional_logic";i:0;s:3:"min";i:0;s:8:"elements";a:1:{i:0;s:9:"post_type";}}', 'Kapcsolódó tanfolyam', 'kapcsolodo_tanfolyam', 'publish', 'closed', 'closed', '', 'field_579cc9119e382', '', '', '2016-08-27 17:23:57', '2016-08-27 17:23:57', '', 224, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(235, 2, '2016-08-27 17:23:57', '2016-08-27 17:23:57', 'a:6:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:11:"tanfolyamok";}}}s:8:"position";s:6:"normal";s:5:"style";s:8:"seamless";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";}', 'Tanfolyamok', 'tanfolyamok', 'publish', 'closed', 'closed', '', 'group_57c1ccadee5cf', '', '', '2017-02-10 10:10:14', '2017-02-10 10:10:14', '', 0, 'http://pentaschool.hu', 0, 'acf-field-group', '', 0),
(236, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Célközönség', 'celkozonseg', 'publish', 'closed', 'closed', '', 'field_577e3d8d78415', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 235, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(237, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Belepesi feltetelek', 'belepesi_feltetelek', 'publish', 'closed', 'closed', '', 'field_577e3ea478416', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 235, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(238, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Igazolás', 'igazolas', 'publish', 'closed', 'closed', '', 'field_577e43f7dfc0a', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 235, 'http://pentaschool.hu', 3, 'acf-field', '', 0),
(239, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Listaár', 'listaar', 'publish', 'closed', 'closed', '', 'field_577e4404dfc0b', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 235, 'http://pentaschool.hu', 4, 'acf-field', '', 0),
(240, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Akciós ár', 'akcios_ar', 'publish', 'closed', 'closed', '', 'field_577e4409dfc0c', '', '', '2017-02-02 20:31:00', '2017-02-02 20:31:00', '', 224, 'http://pentaschool.hu', 4, 'acf-field', '', 0),
(241, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:34:"Hány részletben lehet kifizetni.";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Részletfizetés', 'reszletfizetes', 'publish', 'closed', 'closed', '', 'field_577e4411dfc0d', '', '', '2016-08-28 15:02:54', '2016-08-28 15:02:54', '', 235, 'http://pentaschool.hu', 5, 'acf-field', '', 0),
(242, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:11:{s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"row_min";s:0:"";s:9:"row_limit";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:3:"max";i:0;}', 'Tematika', 'tematika', 'publish', 'closed', 'closed', '', 'field_577e4430dfc0e', '', '', '2016-08-28 15:02:54', '2016-08-28 15:02:54', '', 235, 'http://pentaschool.hu', 6, 'acf-field', '', 0),
(243, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'cim', 'cim', 'publish', 'closed', 'closed', '', 'field_577e443bdfc0f', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 242, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(244, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'leiras', 'leiras', 'publish', 'closed', 'closed', '', 'field_577e4442dfc10', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 242, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(245, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:11:{s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"row_min";s:0:"";s:9:"row_limit";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:7:"Add Row";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:3:"max";i:0;}', 'Demóvideók', 'demovideok', 'publish', 'closed', 'closed', '', 'field_577e4451dfc11', '', '', '2016-08-28 15:02:54', '2016-08-28 15:02:54', '', 235, 'http://pentaschool.hu', 7, 'acf-field', '', 0),
(246, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'link', 'link', 'publish', 'closed', 'closed', '', 'field_577e4471dfc12', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 245, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(247, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:12:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:7:"tesztek";}s:8:"taxonomy";a:0:{}s:7:"filters";a:1:{i:0;s:6:"search";}s:3:"max";s:0:"";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:8:"elements";a:1:{i:0;s:9:"post_type";}}', 'Tesztek', 'tesztek', 'publish', 'closed', 'closed', '', 'field_577e45414ba21', '', '', '2016-08-27 17:23:58', '2016-08-27 17:23:58', '', 235, 'http://pentaschool.hu', 2, 'acf-field', '', 0),
(248, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:12:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"return_format";s:2:"id";s:9:"post_type";a:1:{i:0;s:11:"referenciak";}s:8:"taxonomy";a:0:{}s:7:"filters";a:1:{i:0;s:6:"search";}s:3:"max";s:0:"";s:17:"conditional_logic";i:0;s:3:"min";i:0;s:8:"elements";a:1:{i:0;s:9:"post_type";}}', 'Referenciak', 'referenciak', 'publish', 'closed', 'closed', '', 'field_577e45174ba20', '', '', '2016-08-28 15:02:54', '2016-08-28 15:02:54', '', 235, 'http://pentaschool.hu', 8, 'acf-field', '', 0),
(249, 2, '2016-08-27 17:23:58', '2016-08-27 17:23:58', 'a:7:{s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"message";s:0:"";s:13:"default_value";i:0;s:17:"conditional_logic";i:0;}', 'Új tanfolyam-e', 'uj_e', 'publish', 'closed', 'closed', '', 'field_577e456f4ba22', '', '', '2016-08-28 15:02:54', '2016-08-28 15:02:54', '', 235, 'http://pentaschool.hu', 9, 'acf-field', '', 0),
(251, 2, '2016-08-27 17:23:59', '2016-08-27 17:23:59', 'a:13:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:10:"formatting";s:4:"html";s:9:"maxlength";s:0:"";s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Access kód', 'access_kod', 'publish', 'closed', 'closed', '', 'field_5799cdc6d9cb2', '', '', '2017-02-10 10:09:45', '2017-02-10 10:09:45', '', 235, 'http://pentaschool.hu', 11, 'acf-field', '', 0),
(257, 2, '2016-08-27 17:23:59', '2016-08-27 17:23:59', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57aaffd181b30', '', '', '2016-08-27 17:23:59', '2016-08-27 17:23:59', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(258, 2, '2016-08-27 17:23:59', '2016-08-27 17:23:59', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57aaffe981b31', '', '', '2016-08-27 17:23:59', '2016-08-27 17:23:59', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(260, 2, '2016-08-27 17:23:59', '2016-08-27 17:23:59', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab33d3f4c0e', '', '', '2016-08-27 17:23:59', '2016-08-27 17:23:59', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(261, 2, '2016-08-27 17:23:59', '2016-08-27 17:23:59', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab33d3f4c0f', '', '', '2016-08-27 17:23:59', '2016-08-27 17:23:59', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(263, 2, '2016-08-27 17:23:59', '2016-08-27 17:23:59', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab342ef4c11', '', '', '2016-08-27 17:23:59', '2016-08-27 17:23:59', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(264, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab342ef4c12', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(266, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab3442f4c14', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(267, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab3442f4c15', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(269, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab3458f4c17', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(270, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab3458f4c18', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(272, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab3468f4c1a', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(273, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab3468f4c1b', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(275, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab34a7f4c21', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(276, 2, '2016-08-27 17:24:00', '2016-08-27 17:24:00', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab34a7f4c22', '', '', '2016-08-27 17:24:00', '2016-08-27 17:24:00', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(280, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab34e7f4c26', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(281, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab34e7f4c27', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(283, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab34f8f4c29', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(284, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab34f8f4c2a', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(286, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab3519f4c2d', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(287, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab3519f4c2e', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(289, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab352ef4c30', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(290, 2, '2016-08-27 17:24:01', '2016-08-27 17:24:01', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab352ef4c31', '', '', '2016-08-27 17:24:01', '2016-08-27 17:24:01', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(293, 2, '2016-08-27 17:24:02', '2016-08-27 17:24:02', 'a:14:{s:4:"type";s:6:"number";s:12:"instructions";s:40:"1 és 5 közötti számmal értékeljen!";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:3:"min";i:1;s:3:"max";i:5;s:4:"step";i:1;s:17:"conditional_logic";i:0;s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Értékelés', 'értekeles', 'publish', 'closed', 'closed', '', 'field_57ab354ff4c34', '', '', '2016-08-27 17:24:02', '2016-08-27 17:24:02', '', 252, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(294, 2, '2016-08-27 17:24:02', '2016-08-27 17:24:02', 'a:12:{s:4:"type";s:8:"textarea";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:9:"maxlength";s:0:"";s:4:"rows";s:0:"";s:17:"conditional_logic";i:0;s:9:"new_lines";s:2:"br";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megjegyzés', 'megjegyzes', 'publish', 'closed', 'closed', '', 'field_57ab354ff4c35', '', '', '2016-08-27 17:24:02', '2016-08-27 17:24:02', '', 252, 'http://pentaschool.hu', 1, 'acf-field', '', 0),
(299, 2, '2016-08-27 18:27:00', '2016-08-27 18:27:00', '', 'Valasz161608082727', '', 'publish', 'closed', 'closed', '', 'valasz161608082727-5', '', '', '2016-08-27 18:27:00', '2016-08-27 18:27:00', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082727-5/', 0, 'valaszok', '', 0),
(302, 2, '2016-08-27 20:35:02', '2016-08-27 20:35:02', '', 'Valasz161608082727', '', 'publish', 'closed', 'closed', '', 'valasz161608082727-6', '', '', '2016-08-27 20:35:02', '2016-08-27 20:35:02', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082727-6/', 0, 'valaszok', '', 0),
(303, 2, '2016-08-27 20:35:02', '2016-08-27 20:35:02', 'TEszt ajanlas', '2016-08-27', '', 'publish', 'closed', 'closed', '', '2016-08-27', '', '', '2016-08-27 20:35:02', '2016-08-27 20:35:02', '', 0, 'http://pentaschool.hu/ajanlas/2016-08-27', 0, 'ajanlas', '', 0),
(304, 2, '2016-08-27 20:42:36', '2016-08-27 20:42:36', 'a:6:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:4:"post";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";}', 'Post', 'post', 'publish', 'closed', 'closed', '', 'group_57c1fb2b04b16', '', '', '2016-08-27 20:42:36', '2016-08-27 20:42:36', '', 0, 'http://pentaschool.hu/?post_type=acf-field-group&#038;p=304', 0, 'acf-field-group', '', 0),
(305, 2, '2016-08-27 20:42:36', '2016-08-27 20:42:36', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'textfe', 'textfe', 'publish', 'closed', 'closed', '', 'field_57c1fb3271690', '', '', '2016-08-27 20:42:36', '2016-08-27 20:42:36', '', 304, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(308, 2, '2016-08-28 17:42:17', '2016-08-28 17:42:17', '', 'Valasz161608082828', '', 'publish', 'closed', 'closed', '', 'valasz161608082828', '', '', '2016-08-28 17:42:17', '2016-08-28 17:42:17', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082828/', 0, 'valaszok', '', 0),
(309, 2, '2016-08-28 17:42:17', '0000-00-00 00:00:00', 'aasdasdsad', '2016-08-28', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-28 17:42:17', '0000-00-00 00:00:00', '', 0, 'http://pentaschool.hu/?post_type=ajanlas&p=309', 0, 'ajanlas', '', 0),
(310, 2, '2016-08-28 17:44:49', '2016-08-28 17:44:49', '', 'Valasz161608082828', '', 'publish', 'closed', 'closed', '', 'valasz161608082828-2', '', '', '2016-08-28 17:44:49', '2016-08-28 17:44:49', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082828-2/', 0, 'valaszok', '', 0),
(311, 2, '2016-08-28 17:44:49', '0000-00-00 00:00:00', 'asdfff', '2016-08-28', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-28 17:44:49', '0000-00-00 00:00:00', '', 0, 'http://pentaschool.hu/?post_type=ajanlas&p=311', 0, 'ajanlas', '', 0),
(312, 2, '2016-08-28 17:47:47', '2016-08-28 17:47:47', '', 'Valasz161608082828', '', 'publish', 'closed', 'closed', '', 'valasz161608082828-3', '', '', '2016-08-28 17:47:47', '2016-08-28 17:47:47', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082828-3/', 0, 'valaszok', '', 0),
(313, 2, '2016-08-28 17:47:47', '0000-00-00 00:00:00', 'goooo', '2016-08-28', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-28 17:47:47', '0000-00-00 00:00:00', '', 0, 'http://pentaschool.hu/?post_type=ajanlas&p=313', 0, 'ajanlas', '', 0),
(314, 2, '2016-08-28 18:42:18', '2016-08-28 18:42:18', '', 'Valasz161608082828', '', 'publish', 'closed', 'closed', '', 'valasz161608082828-4', '', '', '2016-08-28 18:42:18', '2016-08-28 18:42:18', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082828-4/', 0, 'valaszok', '', 0),
(315, 2, '2016-08-28 18:42:18', '0000-00-00 00:00:00', 'gdfgdfg', '2016-08-28', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-28 18:42:18', '0000-00-00 00:00:00', '', 0, 'http://pentaschool.hu/?post_type=ajanlas&p=315', 0, 'ajanlas', '', 0),
(316, 2, '2016-08-28 18:47:25', '2016-08-28 18:47:25', '', 'Valasz161608082828', '', 'publish', 'closed', 'closed', '', 'valasz161608082828-5', '', '', '2016-08-28 18:47:25', '2016-08-28 18:47:25', '', 0, 'http://pentaschool.hu/valaszok/valasz161608082828-5/', 0, 'valaszok', '', 0),
(317, 2, '2016-08-28 18:47:25', '0000-00-00 00:00:00', 'vvv', '2016-08-28', '', 'draft', 'closed', 'closed', '', '', '', '', '2016-08-28 18:47:25', '0000-00-00 00:00:00', '', 0, 'http://pentaschool.hu/?post_type=ajanlas&p=317', 0, 'ajanlas', '', 0),
(319, 2, '2016-09-09 11:47:37', '2016-09-09 11:47:37', '[vc_row][vc_column][vc_tta_tabs][vc_tta_section title="Tanfolyam böngésző" tab_id="1473514387297-c24bb719-5c6f"][vc_row_inner][vc_column_inner width="1/4"][/vc_column_inner][vc_column_inner width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" filter_style="bordered" filter_align="left" filter_size="lg" item="323" grid_id="vc_gid:1473514314711-6b46f2cc-03f6-8" filter_source="category"][/vc_column_inner][/vc_row_inner][/vc_tta_section][vc_tta_section title="Tab 2" tab_id="1473514387463-9bbdf05d-c695"][vc_masonry_grid post_type="tanfolyamok" max_items="10" show_filter="yes" element_width="3" initial_loading_animation="fadeIn" grid_id="vc_gid:1473514449395-552a0230-d793-7" filter_source="category"][/vc_tta_section][/vc_tta_tabs][/vc_column][/vc_row]', 'Visual composer', '', 'publish', 'closed', 'closed', '', 'visual-composer', '', '', '2016-09-10 13:36:43', '2016-09-10 13:36:43', '', 0, 'http://pentaschool.hu/?page_id=319', 0, 'page', '', 0),
(323, 2, '2016-09-09 11:35:31', '2016-09-09 11:35:31', '[vc_gitem c_zone_position=""][vc_gitem_animated_block animation="flipHorizontalFadeIn"][vc_gitem_zone_a height_mode="original" featured_image="yes"][vc_gitem_row position="top"][vc_gitem_col][vc_gitem_post_title link="post_link" font_container="tag:h4|text_align:left"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="middle"][vc_gitem_col][vc_gitem_acf field_group="235" field_from_235="field_577e4404dfc0b" show_label="yes"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="bottom"][vc_gitem_col][vc_btn link="post_link" title="Tovább" style="classic" shape="square" color="turquoise"][/vc_gitem_col][/vc_gitem_row][/vc_gitem_zone_a][vc_gitem_zone_b css=".vc_custom_1473425995984{background-color: #57a2f0 !important;}"][vc_gitem_row position="top"][vc_gitem_col][vc_gitem_post_excerpt font_container="tag:p|text_align:left"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="middle"][vc_gitem_col width="1/2"][/vc_gitem_col][vc_gitem_col width="1/2"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="bottom"][vc_gitem_col][/vc_gitem_col][/vc_gitem_row][/vc_gitem_zone_b][/vc_gitem_animated_block][/vc_gitem]', 'Tanfolyam', '', 'publish', 'closed', 'closed', '', '323', '', '', '2016-09-09 13:03:07', '2016-09-09 13:03:07', '', 0, 'http://pentaschool.hu/?post_type=vc_grid_item&#038;p=323', 0, 'vc_grid_item', '', 0) ;
INSERT INTO `pe_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(324, 2, '2016-09-09 13:05:26', '2016-09-09 13:05:26', '[vc_gitem c_zone_position=""][vc_gitem_animated_block animation="flipHorizontalFadeIn"][vc_gitem_zone_a height_mode="original" featured_image="yes"][vc_gitem_row position="top"][vc_gitem_col][vc_gitem_post_title link="post_link" font_container="tag:h4|text_align:left"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="middle"][vc_gitem_col][vc_gitem_acf field_group="235" field_from_235="field_577e4404dfc0b" show_label="yes"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="bottom"][vc_gitem_col][vc_btn link="post_link" title="Tovább" style="classic" shape="square" color="turquoise"][/vc_gitem_col][/vc_gitem_row][/vc_gitem_zone_a][vc_gitem_zone_b css=".vc_custom_1473425995984{background-color: #57a2f0 !important;}"][vc_gitem_row position="top"][vc_gitem_col][vc_gitem_acf field_group="204"][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="middle"][vc_gitem_col][/vc_gitem_col][/vc_gitem_row][vc_gitem_row position="bottom"][vc_gitem_col][/vc_gitem_col][/vc_gitem_row][/vc_gitem_zone_b][/vc_gitem_animated_block][/vc_gitem]', 'Tanfolyam', '', 'inherit', 'closed', 'closed', '', '323-autosave-v1', '', '', '2016-09-09 13:05:26', '2016-09-09 13:05:26', '', 323, 'http://pentaschool.hu/%posttype%/323-autosave-v1/', 0, 'revision', '', 0),
(325, 2, '2016-09-09 11:47:37', '2016-09-09 11:47:37', '[vc_row][vc_column width="1/4"][/vc_column][vc_column width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="10" item="323" initial_loading_animation="bounceInDown" grid_id="vc_gid:1473421210578-5ef50121-45e4-4"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 11:47:37', '2016-09-09 11:47:37', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(326, 2, '2016-09-09 11:52:40', '2016-09-09 11:52:40', '[vc_row][vc_column][vc_basic_grid post_type="tanfolyamok" max_items="10" item="323" initial_loading_animation="bounceInDown" grid_id="vc_gid:1473421672734-d3bf49ab-42d0-7"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 11:52:40', '2016-09-09 11:52:40', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(327, 2, '2016-09-09 11:54:52', '2016-09-09 11:54:52', '[vc_row][vc_column][vc_basic_grid post_type="tanfolyamok" max_items="-1" item="323" initial_loading_animation="bounceInDown" grid_id="vc_gid:1473421977350-6a401d4e-852f-7"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 11:54:52', '2016-09-09 11:54:52', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(328, 2, '2016-09-10 13:35:55', '2016-09-10 13:35:55', '[vc_row][vc_column][vc_tta_tabs][vc_tta_section title="Tab 1" tab_id="1473514387297-c24bb719-5c6f"][vc_row_inner][vc_column_inner width="1/4"][/vc_column_inner][vc_column_inner width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" filter_style="bordered" filter_align="left" filter_size="lg" item="323" grid_id="vc_gid:1473514314711-6b46f2cc-03f6-8" filter_source="category"][/vc_column_inner][/vc_row_inner][/vc_tta_section][vc_tta_section title="Tab 2" tab_id="1473514387463-9bbdf05d-c695"][vc_masonry_grid post_type="tanfolyamok" max_items="10" show_filter="yes" element_width="3" initial_loading_animation="fadeIn" grid_id="vc_gid:1473514449395-552a0230-d793-7" filter_source="category"][/vc_tta_section][/vc_tta_tabs][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-autosave-v1', '', '', '2016-09-10 13:35:55', '2016-09-10 13:35:55', '', 319, 'http://pentaschool.hu/%posttype%/319-autosave-v1/', 0, 'revision', '', 0),
(329, 2, '2016-09-09 11:57:18', '2016-09-09 11:57:18', '[vc_row][vc_column][vc_basic_grid post_type="tanfolyamok" max_items="-1" element_width="3" item="323" initial_loading_animation="bounceInDown" grid_id="vc_gid:1473422108383-90428bfc-6769-6"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 11:57:18', '2016-09-09 11:57:18', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(330, 2, '2016-09-09 11:58:17', '2016-09-09 11:58:17', '[vc_row][vc_column width="1/4"][/vc_column][vc_column width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" element_width="3" item="323" initial_loading_animation="bounceInDown" grid_id="vc_gid:1473422255699-b454a979-4a41-9"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 11:58:17', '2016-09-09 11:58:17', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(331, 2, '2016-09-09 12:00:21', '2016-09-09 12:00:21', '[vc_row][vc_column width="1/4"][/vc_column][vc_column width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" element_width="3" filter_style="bordered" item="323" initial_loading_animation="bounceInDown" grid_id="vc_gid:1473422313419-f811799b-369a-5" filter_source="category"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 12:00:21', '2016-09-09 12:00:21', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(332, 2, '2016-09-09 12:36:28', '2016-09-09 12:36:28', '[vc_row][vc_column width="1/4"][/vc_column][vc_column width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" element_width="3" filter_style="bordered" item="323" grid_id="vc_gid:1473422437594-2cf9f207-844e-2" filter_source="category"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 12:36:28', '2016-09-09 12:36:28', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(333, 2, '2016-09-09 12:37:28', '2016-09-09 12:37:28', '[vc_row][vc_column width="1/4"][/vc_column][vc_column width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" element_width="3" filter_style="bordered" filter_align="left" filter_size="lg" item="323" grid_id="vc_gid:1473424604231-5abe4139-ca7e-6" filter_source="category"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 12:37:28', '2016-09-09 12:37:28', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(334, 2, '2016-09-09 13:08:01', '2016-09-09 13:08:01', '[vc_row][vc_column width="1/4"][/vc_column][vc_column width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" filter_style="bordered" filter_align="left" filter_size="lg" item="323" grid_id="vc_gid:1473424668926-f88cbda0-65d1-9" filter_source="category"][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-09 13:08:01', '2016-09-09 13:08:01', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(335, 2, '2016-09-10 13:36:43', '2016-09-10 13:36:43', '[vc_row][vc_column][vc_tta_tabs][vc_tta_section title="Tanfolyam böngésző" tab_id="1473514387297-c24bb719-5c6f"][vc_row_inner][vc_column_inner width="1/4"][/vc_column_inner][vc_column_inner width="3/4"][vc_basic_grid post_type="tanfolyamok" max_items="-1" show_filter="yes" filter_style="bordered" filter_align="left" filter_size="lg" item="323" grid_id="vc_gid:1473514314711-6b46f2cc-03f6-8" filter_source="category"][/vc_column_inner][/vc_row_inner][/vc_tta_section][vc_tta_section title="Tab 2" tab_id="1473514387463-9bbdf05d-c695"][vc_masonry_grid post_type="tanfolyamok" max_items="10" show_filter="yes" element_width="3" initial_loading_animation="fadeIn" grid_id="vc_gid:1473514449395-552a0230-d793-7" filter_source="category"][/vc_tta_section][/vc_tta_tabs][/vc_column][/vc_row]', 'Visual composer', '', 'inherit', 'closed', 'closed', '', '319-revision-v1', '', '', '2016-09-10 13:36:43', '2016-09-10 13:36:43', '', 319, 'http://pentaschool.hu/%posttype%/319-revision-v1/', 0, 'revision', '', 0),
(337, 2, '2017-01-21 13:32:07', '2017-01-21 13:32:07', 'a:7:{s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"message";s:0:"";s:13:"default_value";i:0;}', 'Aktiv', 'aktiv', 'publish', 'closed', 'closed', '', 'field_5883629bd24d1', '', '', '2017-02-02 20:31:00', '2017-02-02 20:31:00', '', 224, 'http://pentaschool.hu', 8, 'acf-field', '', 0) ;
INSERT INTO `pe_posts` ( `ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(338, 2, '2017-01-21 13:32:07', '2017-01-21 13:32:07', 'a:11:{s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"message";s:0:"";s:13:"default_value";i:0;s:11:"show_column";i:0;s:18:"show_column_weight";s:0:"";s:15:"allow_quickedit";i:0;s:14:"allow_bulkedit";i:0;}', 'Értékelték e már?', 'ertekeltek_e_mar', 'publish', 'closed', 'closed', '', 'field_588362a9d24d2', '', '', '2017-02-02 20:31:00', '2017-02-02 20:31:00', '', 224, 'http://pentaschool.hu', 9, 'acf-field', '', 0),
(340, 2, '2017-04-12 15:06:29', '2017-04-12 15:06:29', '', 'Excel augusztus', '', 'inherit', 'closed', 'closed', '', '171-autosave-v1', '', '', '2017-04-12 15:06:29', '2017-04-12 15:06:29', '', 171, 'http://pentaschool.hu/%posttype%/171-autosave-v1/', 0, 'revision', '', 0),
(341, 2, '2017-02-01 22:13:03', '2017-02-01 22:13:03', '[gravityform id="2" title="true" description="true"]', 'Értékelés', '', 'publish', 'closed', 'closed', '', 'ertekeles', '', '', '2017-02-01 22:13:03', '2017-02-01 22:13:03', '', 0, 'http://pentaschool.hu/?page_id=341', 0, 'page', '', 0),
(342, 2, '2017-02-01 22:13:03', '2017-02-01 22:13:03', '[gravityform id="2" title="true" description="true"]', 'Értékelés', '', 'inherit', 'closed', 'closed', '', '341-revision-v1', '', '', '2017-02-01 22:13:03', '2017-02-01 22:13:03', '', 341, 'http://pentaschool.hu/%posttype%/341-revision-v1', 0, 'revision', '', 0),
(344, 2, '2017-02-02 14:36:41', '2017-02-02 14:36:41', 'a:14:{s:4:"type";s:6:"select";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"choices";a:3:{s:9:"Válassz!";s:9:"Válassz!";s:15:"Napok megadása";s:15:"Napok megadása";s:27:"Kezdés és vége megadása";s:27:"Kezdés és vége megadása";}s:13:"default_value";a:1:{s:0:"";s:0:"";}s:10:"allow_null";i:0;s:8:"multiple";i:0;s:2:"ui";i:0;s:4:"ajax";i:0;s:11:"placeholder";s:0:"";s:8:"disabled";i:0;s:8:"readonly";i:0;}', 'Alkalmak megadása', 'alkalmak_megadasa', 'publish', 'closed', 'closed', '', 'field_5893433a355c4', '', '', '2017-02-02 21:15:27', '2017-02-02 21:15:27', '', 347, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(345, 2, '2017-02-02 14:36:41', '2017-02-02 14:36:41', 'a:9:{s:4:"type";s:8:"repeater";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:3:"min";s:0:"";s:3:"max";s:0:"";s:6:"layout";s:5:"table";s:12:"button_label";s:16:"Sor hozzáadása";s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:15:"Napok megadása";}}}}', 'További napok', 'tovabbi_napok', 'publish', 'closed', 'closed', '', 'field_5893439f355c5', '', '', '2017-02-02 21:18:20', '2017-02-02 21:18:20', '', 347, 'http://pentaschool.hu', 2, 'acf-field', '', 0),
(346, 2, '2017-02-02 14:36:41', '2017-02-02 14:36:41', 'a:8:{s:4:"type";s:11:"date_picker";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:14:"display_format";s:5:"d/m/Y";s:13:"return_format";s:5:"d/m/Y";s:9:"first_day";i:1;}', 'tovabbi_nap', 'tovabbi_nap', 'publish', 'closed', 'closed', '', 'field_589343c0355c6', '', '', '2017-02-02 14:36:41', '2017-02-02 14:36:41', '', 345, 'http://pentaschool.hu', 0, 'acf-field', '', 0),
(347, 2, '2017-02-02 19:39:16', '2017-02-02 19:39:16', 'a:6:{s:8:"location";a:1:{i:0;a:1:{i:0;a:3:{s:5:"param";s:9:"post_type";s:8:"operator";s:2:"==";s:5:"value";s:16:"tanfolyam-kiiras";}}}s:8:"position";s:6:"normal";s:5:"style";s:7:"default";s:15:"label_placement";s:3:"top";s:21:"instruction_placement";s:5:"label";s:14:"hide_on_screen";s:0:"";}', 'Tanfolyam kiírás - időpontok kezelése', 'tanfolyam-kiiras-idopontok-kezelese', 'publish', 'closed', 'closed', '', 'group_589389aceec74', '', '', '2017-02-02 21:18:20', '2017-02-02 21:18:20', '', 0, 'http://pentaschool.hu/?post_type=acf-field-group&#038;p=347', 0, 'acf-field-group', '', 0),
(348, 2, '2017-02-02 21:15:27', '2017-02-02 21:15:27', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;s:17:"conditional_logic";a:1:{i:0;a:1:{i:0;a:3:{s:5:"field";s:19:"field_5893433a355c4";s:8:"operator";s:2:"==";s:5:"value";s:27:"Kezdés és vége megadása";}}}}', 'Napi beosztás', 'napi_beosztas', 'publish', 'closed', 'closed', '', 'field_5893a135e809f', '', '', '2017-02-02 21:15:27', '2017-02-02 21:15:27', '', 347, 'http://pentaschool.hu', 5, 'acf-field', '', 0),
(349, 2, '2017-02-03 16:45:01', '2017-02-03 16:45:01', 'a:12:{s:4:"type";s:12:"relationship";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:9:"post_type";a:1:{i:0;s:11:"tanfolyamok";}s:8:"taxonomy";a:0:{}s:7:"filters";a:3:{i:0;s:6:"search";i:1;s:9:"post_type";i:2;s:8:"taxonomy";}s:8:"elements";s:0:"";s:3:"min";s:0:"";s:3:"max";s:0:"";s:13:"return_format";s:6:"object";}', 'tanfolyam', 'tanfolyam', 'publish', 'closed', 'closed', '', 'field_5894b37110a92', '', '', '2017-02-03 16:45:01', '2017-02-03 16:45:01', '', 218, 'http://pentaschool.hu', 2, 'acf-field', '', 0),
(350, 2, '2017-02-10 10:01:37', '2017-02-10 10:01:37', '', 'Aktuális tanfolyamok', '', 'publish', 'closed', 'closed', '', 'aktualis', '', '', '2017-02-10 10:01:37', '2017-02-10 10:01:37', '', 0, 'http://pentaschool.hu/?page_id=350', 0, 'page', '', 0),
(351, 2, '2017-02-10 10:01:37', '2017-02-10 10:01:37', '', 'Aktuális tanfolyamok', '', 'inherit', 'closed', 'closed', '', '350-revision-v1', '', '', '2017-02-10 10:01:37', '2017-02-10 10:01:37', '', 350, 'http://pentaschool.hu/%posttype%/350-revision-v1', 0, 'revision', '', 0),
(352, 2, '2017-02-10 10:09:45', '2017-02-10 10:09:45', 'a:11:{s:4:"type";s:10:"true_false";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:7:"message";s:0:"";s:13:"default_value";i:1;s:11:"show_column";i:0;s:18:"show_column_weight";s:0:"";s:15:"allow_quickedit";i:1;s:14:"allow_bulkedit";i:1;}', 'Aktív tanfolyam e?', 'aktiv_tanfolyam_e', 'publish', 'closed', 'closed', '', 'field_589d913ff2c33', '', '', '2017-02-10 10:10:14', '2017-02-10 10:10:14', '', 235, 'http://pentaschool.hu', 10, 'acf-field', '', 0),
(353, 2, '2017-02-11 11:14:45', '2017-02-11 11:14:45', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'tema', 'tema', 'publish', 'closed', 'closed', '', 'field_589ef1ed5cd66', '', '', '2017-02-11 11:14:45', '2017-02-11 11:14:45', '', 218, 'http://pentaschool.hu', 3, 'acf-field', '', 0),
(354, 2, '2017-02-11 11:14:45', '2017-02-11 11:14:45', 'a:12:{s:4:"type";s:4:"text";s:12:"instructions";s:0:"";s:8:"required";i:0;s:17:"conditional_logic";i:0;s:7:"wrapper";a:3:{s:5:"width";s:0:"";s:5:"class";s:0:"";s:2:"id";s:0:"";}s:13:"default_value";s:0:"";s:11:"placeholder";s:0:"";s:7:"prepend";s:0:"";s:6:"append";s:0:"";s:9:"maxlength";s:0:"";s:8:"readonly";i:0;s:8:"disabled";i:0;}', 'Megrendelő', 'megrendelo', 'publish', 'closed', 'closed', '', 'field_589ef2035cd67', '', '', '2017-02-11 11:14:45', '2017-02-11 11:14:45', '', 218, 'http://pentaschool.hu', 4, 'acf-field', '', 0),
(357, 2, '2017-04-12 14:34:47', '2017-04-12 14:34:47', 'Linux tanfolyam leírása...', 'Linux tanfolyam', '', 'publish', 'closed', 'closed', '', 'linux-tanfolyam', '', '', '2017-10-31 11:26:18', '2017-10-31 11:26:18', '', 0, 'http://pentaschool.hu/?post_type=tanfolyam-kiiras&#038;p=357', 0, 'tanfolyam-kiiras', '', 0),
(358, 2, '2018-02-21 10:38:32', '0000-00-00 00:00:00', '', 'Automatikus vázlat', '', 'auto-draft', 'open', 'open', '', '', '', '', '2018-02-21 10:38:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/pentaschool/?p=358', 0, 'post', '', 0) ;

#
# End of data contents of table `pe_posts`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_form`
#

DROP TABLE IF EXISTS `pe_rg_form`;


#
# Table structure of table `pe_rg_form`
#

CREATE TABLE `pe_rg_form` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_trash` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_form`
#
INSERT INTO `pe_rg_form` ( `id`, `title`, `date_created`, `is_active`, `is_trash`) VALUES
(1, 'Tanfolyam jelentkezés', '2017-01-22 22:30:38', 1, 0),
(2, 'Értékelés', '2017-01-25 23:06:26', 1, 0),
(3, 'Várólistások', '2017-02-01 07:34:32', 1, 1),
(4, 'Kérdése van', '2017-02-01 09:38:34', 1, 0),
(5, 'Érdekel a tanfolyam egy későbbi időpontban', '2017-02-01 09:40:46', 1, 0),
(6, 'Céges ajánlatkérés', '2017-02-01 09:53:03', 1, 0),
(7, 'Várólistások', '2017-02-03 11:06:12', 1, 0),
(8, 'Quiz', '2017-02-11 14:55:46', 1, 0) ;

#
# End of data contents of table `pe_rg_form`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_form_meta`
#

DROP TABLE IF EXISTS `pe_rg_form_meta`;


#
# Table structure of table `pe_rg_form_meta`
#

CREATE TABLE `pe_rg_form_meta` (
  `form_id` mediumint(8) unsigned NOT NULL,
  `display_meta` longtext COLLATE utf8_unicode_ci,
  `entries_grid_meta` longtext COLLATE utf8_unicode_ci,
  `confirmations` longtext COLLATE utf8_unicode_ci,
  `notifications` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_form_meta`
#
INSERT INTO `pe_rg_form_meta` ( `form_id`, `display_meta`, `entries_grid_meta`, `confirmations`, `notifications`) VALUES
(1, '{"title":"Tanfolyam jelentkez\\u00e9s","description":"A tanfolyamra beirathat egy vagy t\\u00f6bb mag\\u00e1nszem\\u00e1lyt, \\u00e9s beirathat c\\u00e9ges munkat\\u00e1rsakat is!","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"hidden","id":1,"label":"Melyik tanfolyam?","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"tanfolyam","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":32,"label":"Kezd\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"kezdes","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":33,"label":"\\u00c1r","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"ar","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":34,"label":"PDF","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"html","id":8,"label":"HTML","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"email","id":5,"label":"Kapcsolattart\\u00f3 email","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","emailConfirmEnabled":"","pageNumber":1,"displayOnly":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false},{"type":"name","id":6,"label":"Kapcsolattart\\u00f3 n\\u00e9v","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","nameFormat":"advanced","inputs":[{"id":"6.2","label":"El\\u0151tag","name":"","choices":[{"text":"Mr.","value":"Mr.","isSelected":false,"price":""},{"text":"Mrs.","value":"Mrs.","isSelected":false,"price":""},{"text":"Miss","value":"Miss","isSelected":false,"price":""},{"text":"Ms.","value":"Ms.","isSelected":false,"price":""},{"text":"Dr.","value":"Dr.","isSelected":false,"price":""},{"text":"Prof.","value":"Prof.","isSelected":false,"price":""},{"text":"Rev.","value":"Rev.","isSelected":false,"price":""}],"isHidden":true,"inputType":"radio"},{"id":"6.3","label":"Vezet\\u00e9kn\\u00e9v","name":"","isHidden":true},{"id":"6.4","label":"K\\u00f6z\\u00e9ps\\u0151 n\\u00e9v","name":"","isHidden":true},{"id":"6.6","label":"Keresztn\\u00e9v","name":"","isHidden":false},{"id":"6.8","label":"Ut\\u00f3tag","name":"","isHidden":true}],"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"phone","id":7,"label":"Kapcsolattart\\u00f3 telefon","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"phoneFormat":"standard","formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","form_id":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"checkbox","id":9,"label":"A kapcsolattart\\u00f3 r\\u00e9sztvev\\u0151 is lesz?","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","choices":[{"text":"","value":"igen","isSelected":false,"price":""}],"inputs":[{"id":"9.1","label":"","name":""}],"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enablePrice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":"","enableChoiceValue":true},{"type":"checkbox","id":10,"label":"Adatok megjegyz\\u00e9se","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","choices":[{"text":"","value":"igen","isSelected":false,"price":""}],"inputs":[{"id":"10.1","label":"","name":""}],"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enablePrice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":"","enableChoiceValue":true},{"type":"page","id":2,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"nextButton":{"type":"text","text":"K\\u00f6vetkez\\u0151","imageUrl":""},"previousButton":{"type":"text","text":"El\\u0151z\\u0151","imageUrl":""},"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":2},{"type":"list","id":11,"label":"R\\u00e9sztvev\\u0151k","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"list","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":[{"text":"N\\u00e9v","value":"N\\u00e9v","isSelected":false,"price":""},{"text":"Email","value":"Email","isSelected":false,"price":""},{"text":"Telefon","value":"Telefon","isSelected":false,"price":""}],"conditionalLogic":"","maxRows":0,"failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"enableColumns":true,"pageNumber":2,"displayOnly":""},{"type":"page","id":12,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"nextButton":{"type":"text","text":"K\\u00f6vetkez\\u0151","imageUrl":""},"previousButton":{"type":"text","text":"El\\u0151z\\u0151","imageUrl":""},"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3},{"type":"html","id":13,"label":"Sz\\u00e1ml\\u00e1z\\u00e1si adatok","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"content":"<h2>-Sz\\u00e1mla\\u00e1z\\u00e1si adatok<\\/h2>","pageNumber":3},{"type":"text","id":16,"label":"N\\u00e9v \\/ c\\u00e9gn\\u00e9v","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"number","id":17,"label":"Ir\\u00e1ny\\u00edt\\u00f3sz\\u00e1m","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"numberFormat":"decimal_dot","formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","enableCalculation":false,"rangeMin":"","failed_validation":"","productField":"","rangeMax":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"text","id":18,"label":"Telep\\u00fcl\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"text","id":19,"label":"Ad\\u00f3sz\\u00e1m (c\\u00e9g eset\\u00e9n)","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"html","id":20,"label":"Post\\u00e1z\\u00e1si adatok","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"content":"<h2>Post\\u00e1z\\u00e1si adatok<\\/h2>","pageNumber":3},{"type":"radio","id":31,"label":"Megegyezik a sz\\u00e1ml\\u00e1z\\u00e1si adatokkal?","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"choices":[{"text":"Igen","value":"Igen","isSelected":false,"price":""},{"text":"Nem","value":"Nem","isSelected":false,"price":""}],"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enableOtherChoice":"","enablePrice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"text","id":22,"label":"N\\u00e9v \\/ c\\u00e9gn\\u00e9v","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":{"actionType":"hide","logicType":"all","rules":[{"fieldId":"31","operator":"is","value":"Igen"}]},"failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"number","id":23,"label":"Ir\\u00e1ny\\u00edt\\u00f3sz\\u00e1m","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"numberFormat":"decimal_dot","formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":{"actionType":"hide","logicType":"all","rules":[{"fieldId":"31","operator":"is","value":"Igen"}]},"enableCalculation":false,"rangeMin":"","failed_validation":"","productField":"","rangeMax":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"text","id":24,"label":"Telep\\u00fcl\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":{"actionType":"hide","logicType":"all","rules":[{"fieldId":"31","operator":"is","value":"Igen"}]},"failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"text","id":25,"label":"Ad\\u00f3sz\\u00e1m (c\\u00e9g eset\\u00e9n)","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":{"actionType":"hide","logicType":"all","rules":[{"fieldId":"31","operator":"is","value":"Igen"}]},"failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":3,"displayOnly":""},{"type":"page","id":26,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"nextButton":{"type":"text","text":"K\\u00f6vetkez\\u0151","imageUrl":""},"previousButton":{"type":"text","text":"El\\u0151z\\u0151","imageUrl":""},"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":4},{"type":"radio","id":30,"label":"Fizet\\u00e9si m\\u00f3d","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"choices":[{"text":"K\\u00e9szp\\u00e9nz","value":"K\\u00e9szp\\u00e9nz","isSelected":false,"price":""},{"text":"\\u00c1tutal\\u00e1s","value":"\\u00c1tutal\\u00e1s","isSelected":false,"price":""}],"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enableOtherChoice":"","enablePrice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":4,"displayOnly":""},{"type":"page","id":28,"label":"","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"nextButton":{"type":"text","text":"K\\u00f6vetkez\\u0151","imageUrl":""},"previousButton":{"type":"text","text":"El\\u0151z\\u0151","imageUrl":""},"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":5},{"type":"html","id":29,"label":"HTML blokk","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"formId":1,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":5,"content":"{all_fields}"}],"version":"2.0.2.3","id":1,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":{"type":"text","text":"El\\u0151z\\u0151","imageUrl":""},"pagination":{"type":"steps","pages":["Kapcsolattart\\u00f3 adatai","R\\u00e9sztvev\\u0151(k) adatai","Sz\\u00e1ml\\u00e1z\\u00e1si \\u00e9s post\\u00e1z\\u00e1si adatok","Fizet\\u00e9si m\\u00f3d","Jelentkez\\u00e9s \\u00f6sszegz\\u00e9se"],"backgroundColor":null,"color":null,"display_progressbar_on_confirmation":null,"progressbar_completion_text":null},"firstPageCssClass":"","notifications":{"5885328e0c72a":{"id":"5885328e0c72a","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}},"confirmations":{"5885328e18f05":{"id":"5885328e18f05","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.\\r\\n\\r\\nA jelentkez\\u00e9si lapot let\\u00f6ltheti <a href=\\"{PDF:34}\\">innen!<\\/a>\\r\\n\\r\\n&nbsp;","url":"","pageId":0,"queryString":"","disableAutoformat":false,"conditionalLogic":[]}},"subLabelPlacement":"below","cssClass":"","enableHoneypot":false,"enableAnimation":false,"save":{"enabled":false,"button":{"type":"link","text":"Ment\\u00e9s \\u00e9s folytat\\u00e1s k\\u00e9s\\u0151bb"}},"limitEntries":false,"limitEntriesCount":"","limitEntriesPeriod":"","limitEntriesMessage":"","scheduleForm":false,"scheduleStart":"","scheduleStartHour":"","scheduleStartMinute":"","scheduleStartAmpm":"","scheduleEnd":"","scheduleEndHour":"","scheduleEndMinute":"","scheduleEndAmpm":"","schedulePendingMessage":"","scheduleMessage":"","requireLogin":false,"requireLoginMessage":""}', '', '{"5885328e18f05":{"id":"5885328e18f05","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.\\r\\n\\r\\nA jelentkez\\u00e9si lapot let\\u00f6ltheti <a href=\\"{PDF:34}\\">innen!<\\/a>\\r\\n\\r\\n&nbsp;","url":"","pageId":0,"queryString":"","disableAutoformat":false,"conditionalLogic":[]}}', '{"5885328e0c72a":{"id":"5885328e0c72a","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}'),
(2, '{"title":"\\u00c9rt\\u00e9kel\\u00e9s","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"select","id":1,"label":"Melyik tanfolyamon vett r\\u00e9szt?","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"choices":[{"text":"V\\u00e1lasszon!","value":"V\\u00e1lasszon!","isSelected":false,"price":""}],"formId":2,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"ertekelheto","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enablePrice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"survey","id":2,"label":"Mennyire felelt meg az elv\\u00e1r\\u00e1sainak a tanfolyam?","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"enableChoiceValue":true,"enablePrice":false,"gsurveyLikertEnableMultipleRows":false,"gsurveyLikertEnableScoring":false,"choices":[{"text":"Egyeltal\\u00e1n nem","value":"glikertcol23aa17887","isSelected":false,"score":"1"},{"text":"Valamennyire","value":"glikertcol237fcc847","isSelected":false,"score":"2"},{"text":"Is-is","value":"glikertcol267066b8b","isSelected":false,"score":"3"},{"text":"T\\u00f6bbnyire","value":"glikertcol2df4cf49d","isSelected":false,"score":"4"},{"text":"Teljesen","value":"glikertcol2cac25931","isSelected":false,"score":"5"}],"gsurveyLikertRows":[{"text":"First row","value":"glikertrow1feb2bba"},{"text":"Second row","value":"glikertrow97947f92"},{"text":"Third row","value":"glikertrowcc99ab09"},{"text":"Fourth row","value":"glikertrow9dac2f1d"},{"text":"Fifth row","value":"glikertrow372b52d0"}],"inputType":"likert","formId":2,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1},{"type":"survey","id":3,"label":"\\u00c9rt\\u00e9kelje a tan\\u00e1rt!","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"enableChoiceValue":true,"enablePrice":false,"gsurveyLikertEnableMultipleRows":false,"gsurveyLikertEnableScoring":false,"choices":[{"text":"Terrible","value":"grating3bd73bc10","isSelected":false,"price":""},{"text":"Not so great","value":"grating386dee87d","isSelected":false,"price":""},{"text":"Neutral","value":"grating391e82464","isSelected":false,"price":""},{"text":"Pretty good","value":"grating34b898d9c","isSelected":false,"price":""},{"text":"Excellent","value":"grating3550c474e","isSelected":false,"price":""}],"gsurveyLikertRows":[{"text":"First row","value":"glikertrow136a9099"},{"text":"Second row","value":"glikertrowcdda087c"},{"text":"Third row","value":"glikertrow30d68d6b"},{"text":"Fourth row","value":"glikertrow9fbc32d1"},{"text":"Fifth row","value":"glikertrowd112be1f"}],"inputType":"rating","formId":2,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"reversed":true,"pageNumber":1}],"version":"2.0.2.3","id":2,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null}', NULL, '{"58892f724f1f2":{"id":"58892f724f1f2","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"58892f724d275":{"id":"58892f724d275","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}'),
(3, '{"title":"V\\u00e1r\\u00f3list\\u00e1sok","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[],"version":"2.0.2.3","id":3}', NULL, '{"58918f8804dd9":{"id":"58918f8804dd9","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"58918f8803c8d":{"id":"58918f8803c8d","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}'),
(4, '{"title":"K\\u00e9rd\\u00e9se van","description":"K\\u00e9rdezn\\u00e9k valamit a tanfolyammal kapcsolatban!","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"email","id":1,"label":"Email","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":4,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","emailConfirmEnabled":"","pageNumber":1,"displayOnly":""},{"type":"text","id":4,"label":"N\\u00e9v","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":4,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":5,"label":"Telefon","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":4,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"textarea","id":6,"label":"K\\u00e9rd\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":4,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","form_id":"","useRichTextEditor":false,"multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":7,"label":"Tanfolyam","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":4,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"kiiras_fill","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""}],"version":"2.0.2.3","id":4,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null,"subLabelPlacement":"below","cssClass":"","enableHoneypot":false,"enableAnimation":false,"save":{"enabled":false,"button":{"type":"link","text":"Ment\\u00e9s \\u00e9s folytat\\u00e1s k\\u00e9s\\u0151bb"}},"limitEntries":false,"limitEntriesCount":"","limitEntriesPeriod":"","limitEntriesMessage":"","scheduleForm":false,"scheduleStart":"","scheduleStartHour":"","scheduleStartMinute":"","scheduleStartAmpm":"","scheduleEnd":"","scheduleEndHour":"","scheduleEndMinute":"","scheduleEndAmpm":"","schedulePendingMessage":"","scheduleMessage":"","requireLogin":false,"requireLoginMessage":""}', '', '{"5891ac9a1be28":{"id":"5891ac9a1be28","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"5891ac9a1ab01":{"id":"5891ac9a1ab01","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}'),
(5, '{"title":"\\u00c9rdekel a tanfolyam egy k\\u00e9s\\u0151bbi id\\u0151pontban","description":"\\u00c9rdekel a tanfolyam, de jelenleg nincs aktu\\u00e1lis id\\u0151pontja, vagy nem felel meg nekem.\\r\\nK\\u00e9rem, hogy \\u00e9rtes\\u00edtsenek a tanfolyam j\\u00f6v\\u0151beni id\\u0151pontjair\\u00f3l!","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"email","id":1,"label":"Email","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":5,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","emailConfirmEnabled":"","pageNumber":1,"displayOnly":""},{"type":"text","id":2,"label":"N\\u00e9v","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":5,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":3,"label":"Telefon","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":5,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"textarea","id":4,"label":"Megjegyz\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":5,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","form_id":"","useRichTextEditor":false,"multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":6,"label":"Tanfolyam","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":5,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"tanfolyam_fill","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1}],"version":"2.0.2.3","id":5,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null,"subLabelPlacement":"below","cssClass":"","enableHoneypot":false,"enableAnimation":false,"save":{"enabled":false,"button":{"type":"link","text":"Ment\\u00e9s \\u00e9s folytat\\u00e1s k\\u00e9s\\u0151bb"}},"limitEntries":false,"limitEntriesCount":"","limitEntriesPeriod":"","limitEntriesMessage":"","scheduleForm":false,"scheduleStart":"","scheduleStartHour":"","scheduleStartMinute":"","scheduleStartAmpm":"","scheduleEnd":"","scheduleEndHour":"","scheduleEndMinute":"","scheduleEndAmpm":"","schedulePendingMessage":"","scheduleMessage":"","requireLogin":false,"requireLoginMessage":""}', '', '{"5891ad1e426c0":{"id":"5891ad1e426c0","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"5891ad1e410bf":{"id":"5891ad1e410bf","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}'),
(6, '{"title":"C\\u00e9ges aj\\u00e1nlatk\\u00e9r\\u00e9s","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"text","id":1,"label":"C\\u00e9g neve","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"email","id":4,"label":"Email","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","emailConfirmEnabled":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":2,"label":"N\\u00e9v","adminLabel":"","isRequired":true,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":3,"label":"Telefon","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"textarea","id":5,"label":"Aj\\u00e1nlatk\\u00e9r\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","form_id":"","useRichTextEditor":false,"multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":6,"label":"V\\u00e1rhat\\u00f3 l\\u00e9tsz\\u00e1m","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":7,"label":"Tanfolyam","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":6,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"tanfolyam_fill","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1}],"version":"2.0.2.3","id":6,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null}', '', '{"5891afff5fd63":{"id":"5891afff5fd63","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"5891afff5ef0f":{"id":"5891afff5ef0f","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}') ;
INSERT INTO `pe_rg_form_meta` ( `form_id`, `display_meta`, `entries_grid_meta`, `confirmations`, `notifications`) VALUES
(7, '{"title":"V\\u00e1r\\u00f3list\\u00e1sok","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"email","id":1,"label":"Email","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":7,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","emailConfirmEnabled":"","pageNumber":1,"displayOnly":""},{"type":"text","id":2,"label":"N\\u00e9v","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":7,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"text","id":3,"label":"Telefon","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":7,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","enablePasswordInput":"","maxLength":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"textarea","id":4,"label":"Megjegyz\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":7,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","form_id":"","useRichTextEditor":false,"multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"pageNumber":1,"displayOnly":""},{"type":"hidden","id":5,"label":"Tanfolyam","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"formId":7,"description":"","allowsPrepopulate":true,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"kiiras_fill","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1}],"version":"2.0.2.3","id":7,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null,"subLabelPlacement":"below","cssClass":"","enableHoneypot":false,"enableAnimation":false,"save":{"enabled":false,"button":{"type":"link","text":"Ment\\u00e9s \\u00e9s folytat\\u00e1s k\\u00e9s\\u0151bb"}},"limitEntries":false,"limitEntriesCount":"","limitEntriesPeriod":"","limitEntriesMessage":"","scheduleForm":false,"scheduleStart":"","scheduleStartHour":"","scheduleStartMinute":"","scheduleStartAmpm":"","scheduleEnd":"","scheduleEndHour":"","scheduleEndMinute":"","scheduleEndAmpm":"","schedulePendingMessage":"","scheduleMessage":"","requireLogin":false,"requireLoginMessage":""}', '', '{"5891ad1e426c0":{"id":"5891ad1e426c0","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"5891ad1e410bf":{"id":"5891ad1e410bf","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}'),
(8, '{"title":"Quiz","description":"","labelPlacement":"top_label","descriptionPlacement":"below","button":{"type":"text","text":"Elk\\u00fcld","imageUrl":""},"fields":[{"type":"html","id":3,"label":"K\\u00e9p","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"displayOnly":true,"formId":8,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","inputType":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","choices":"","conditionalLogic":"","failed_validation":"","productField":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"content":"<img src=\\"http:\\/\\/pentaschool.hu\\/wp-content\\/uploads\\/2016\\/07\\/Imi-Pentaschool-profil.jpg\\" style=\\"max-width:100%;\\" \\/>"},{"type":"quiz","id":1,"label":"Els\\u0151 k\\u00e9rd\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":null,"gquizFieldType":"radio","inputType":"radio","enableChoiceValue":true,"enablePrice":false,"gquizEnableRandomizeQuizChoices":false,"gquizShowAnswerExplanation":false,"gquizAnswerExplanation":"","gquizWeightedScoreEnabled":false,"choices":[{"text":"Els\\u0151 - 1 helyes v\\u00e1lasz","value":"gquiz11f2409e2","isSelected":false,"price":"","gquizIsCorrect":true,"gquizWeight":"0"},{"text":"Els\\u0151 2","value":"gquiz1f3a01080","isSelected":false,"price":"","gquizIsCorrect":false,"gquizWeight":"0"},{"text":"Els\\u0151 3","value":"gquiz19bf78d4c","isSelected":false,"price":"","gquizIsCorrect":false,"gquizWeight":"0"}],"formId":8,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enableOtherChoice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""},{"type":"quiz","id":2,"label":"M\\u00e1sodik k\\u00e9rd\\u00e9s","adminLabel":"","isRequired":false,"size":"medium","errorMessage":"","inputs":[{"id":"2.1","label":"First Choice","name":""},{"id":"2.2","label":"Second Choice - h","name":""},{"id":"2.3","label":"Third Choice - h","name":""}],"gquizFieldType":"checkbox","inputType":"checkbox","enableChoiceValue":true,"enablePrice":false,"gquizEnableRandomizeQuizChoices":false,"gquizShowAnswerExplanation":false,"gquizAnswerExplanation":"","gquizWeightedScoreEnabled":false,"choices":[{"text":"First Choice","value":"gquiz2a3c74d65","isSelected":false,"price":"","gquizIsCorrect":false,"gquizWeight":0},{"text":"Second Choice - h","value":"gquiz23f5c93bd","isSelected":false,"price":"","gquizIsCorrect":true,"gquizWeight":"0"},{"text":"Third Choice - h","value":"gquiz2bd1f30e7","isSelected":false,"price":"","gquizIsCorrect":true,"gquizWeight":"0"}],"formId":8,"description":"","allowsPrepopulate":false,"inputMask":false,"inputMaskValue":"","labelPlacement":"","descriptionPlacement":"","subLabelPlacement":"","placeholder":"","cssClass":"","inputName":"","adminOnly":false,"noDuplicates":false,"defaultValue":"","conditionalLogic":"","failed_validation":"","productField":"","enableOtherChoice":"","multipleFiles":false,"maxFiles":"","calculationFormula":"","calculationRounding":"","enableCalculation":"","disableQuantity":false,"displayAllCategories":false,"useRichTextEditor":false,"pageNumber":1,"displayOnly":""}],"version":"2.0.2.3","id":8,"useCurrentUserAsAuthor":true,"postContentTemplateEnabled":false,"postTitleTemplateEnabled":false,"postTitleTemplate":"","postContentTemplate":"","lastPageButton":null,"pagination":null,"firstPageCssClass":null,"gravityformsquiz":{"shuffleFields":"0","instantFeedback":"0","grades":[{"text":"A","value":90},{"text":"B","value":80},{"text":"C","value":70},{"text":"D","value":60},{"text":"E","value":0}],"grading":"letter","passPercent":"50","passfailDisplayConfirmation":"1","passConfirmationMessage":"<strong>Quiz Results:<\\/strong> You Passed!\\r\\n<strong>Score:<\\/strong> {quiz_score}\\r\\n<strong>Percentage:<\\/strong> {quiz_percent}%","passConfirmationDisableAutoformat":"0","failConfirmationMessage":"<strong>Quiz Results:<\\/strong> You Failed!\\r\\n<strong>Score:<\\/strong> {quiz_score}\\r\\n<strong>Percentage:<\\/strong> {quiz_percent}%","failConfirmationDisableAutoformat":"0","letterDisplayConfirmation":"1","letterConfirmationMessage":"<strong>Quiz Grade:<\\/strong> {quiz_grade}\\r\\n<strong>Score:<\\/strong> {quiz_score}\\r\\n<strong>Percentage:<\\/strong> {quiz_percent}%\\r\\n{quiz:id=1}\\r\\n{quiz:id=2}","letterConfirmationDisableAutoformat":"0"}}', '', '{"589f25f2753d3":{"id":"589f25f2753d3","name":"Alap\\u00e9rtelmezett Visszajelz\\u00e9s","isDefault":true,"type":"message","message":"K\\u00f6sz\\u00f6nj\\u00fck az \\u00fczenetet! Az \\u0171rlap sikeresen elk\\u00fcldve. Hamarosan v\\u00e1laszolunk.","url":"","pageId":"","queryString":""}}', '{"589f25f2732b7":{"id":"589f25f2732b7","to":"{admin_email}","name":"Admin \\u00e9rtes\\u00edt\\u00e9s","event":"form_submission","toType":"email","subject":"\\u00daj \\u00fczenet a {embed_url} oldalr\\u00f3l: {form_title}","message":"{all_fields}"}}') ;

#
# End of data contents of table `pe_rg_form_meta`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_form_view`
#

DROP TABLE IF EXISTS `pe_rg_form_view`;


#
# Table structure of table `pe_rg_form_view`
#

CREATE TABLE `pe_rg_form_view` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` char(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count` mediumint(8) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `date_created` (`date_created`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_form_view`
#
INSERT INTO `pe_rg_form_view` ( `id`, `form_id`, `date_created`, `ip`, `count`) VALUES
(1, 2, '2017-02-09 09:50:51', '127.0.0.1', 8),
(2, 7, '2017-04-13 10:51:15', '127.0.0.1', 1) ;

#
# End of data contents of table `pe_rg_form_view`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_incomplete_submissions`
#

DROP TABLE IF EXISTS `pe_rg_incomplete_submissions`;


#
# Table structure of table `pe_rg_incomplete_submissions`
#

CREATE TABLE `pe_rg_incomplete_submissions` (
  `uuid` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `submission` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `form_id` (`form_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_incomplete_submissions`
#

#
# End of data contents of table `pe_rg_incomplete_submissions`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_lead`
#

DROP TABLE IF EXISTS `pe_rg_lead`;


#
# Table structure of table `pe_rg_lead`
#

CREATE TABLE `pe_rg_lead` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL,
  `post_id` bigint(20) unsigned DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `is_starred` tinyint(1) NOT NULL DEFAULT '0',
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(39) COLLATE utf8_unicode_ci NOT NULL,
  `source_url` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_agent` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_status` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `payment_amount` decimal(19,2) DEFAULT NULL,
  `payment_method` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_fulfilled` tinyint(1) DEFAULT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `transaction_type` tinyint(1) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_lead`
#
INSERT INTO `pe_rg_lead` ( `id`, `form_id`, `post_id`, `date_created`, `is_starred`, `is_read`, `ip`, `source_url`, `user_agent`, `currency`, `payment_status`, `payment_date`, `payment_amount`, `payment_method`, `transaction_id`, `is_fulfilled`, `created_by`, `transaction_type`, `status`) VALUES
(1, 1, NULL, '2017-01-23 19:12:58', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(2, 1, NULL, '2017-01-23 21:33:36', 0, 1, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(3, 1, NULL, '2017-01-23 22:57:37', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(4, 1, NULL, '2017-01-24 11:43:44', 0, 1, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(5, 1, NULL, '2017-01-24 20:14:56', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(6, 1, NULL, '2017-01-24 20:51:22', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(7, 1, NULL, '2017-01-24 20:52:00', 0, 1, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(8, 1, NULL, '2017-01-25 09:26:08', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(9, 1, NULL, '2017-01-25 09:29:16', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(10, 1, NULL, '2017-01-25 09:37:02', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(11, 1, NULL, '2017-01-25 09:43:34', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(12, 1, NULL, '2017-01-25 09:49:04', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus/?online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'trash'),
(13, 7, NULL, '2017-02-04 21:14:53', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(14, 5, NULL, '2017-02-04 21:14:53', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 'active'),
(15, 7, NULL, '2017-02-04 21:17:18', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(16, 5, NULL, '2017-02-04 21:17:18', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 'active'),
(17, 7, NULL, '2017-02-04 21:19:36', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(18, 5, NULL, '2017-02-04 21:19:36', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 'active'),
(19, 7, NULL, '2017-02-04 21:19:36', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 'active'),
(20, 7, NULL, '2017-02-04 21:25:11', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(21, 5, NULL, '2017-02-04 21:25:11', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 'active'),
(22, 7, NULL, '2017-02-04 21:29:41', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(23, 5, NULL, '2017-02-04 21:29:41', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?varolista', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, '', NULL, NULL, 1, NULL, 'active'),
(24, 5, NULL, '2017-02-04 21:32:07', 0, 0, '127.0.0.1', 'http://pentaschool.hu/tanfolyam-kiiras/excel-augusztus?erdeklodes', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(25, 8, NULL, '2017-02-11 15:01:19', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(26, 8, NULL, '2017-02-11 15:06:44', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(27, 8, NULL, '2017-02-11 15:10:15', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(28, 8, NULL, '2017-02-11 15:14:46', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(29, 8, NULL, '2017-02-11 15:15:42', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(30, 8, NULL, '2017-02-11 15:16:30', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(31, 8, NULL, '2017-02-11 15:17:13', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(32, 8, NULL, '2017-02-11 15:18:22', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(33, 8, NULL, '2017-02-11 15:39:57', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(34, 8, NULL, '2017-02-11 15:40:36', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(35, 8, NULL, '2017-02-11 15:40:52', 0, 0, '127.0.0.1', 'http://pentaschool.hu/?gf_page=preview&id=8', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(36, 1, NULL, '2017-10-31 11:36:39', 0, 0, '78.92.45.14', 'http://localhost/pentaschool/tanfolyam-kiiras/excel-augusztus/?jelentkezes&online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(37, 1, NULL, '2017-10-31 11:36:59', 0, 0, '78.92.45.14', 'http://localhost/pentaschool/tanfolyam-kiiras/excel-augusztus/?jelentkezes&online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active'),
(38, 1, NULL, '2017-10-31 11:39:46', 0, 1, '78.92.45.14', 'http://localhost/pentaschool/tanfolyam-kiiras/excel-augusztus/?jelentkezes&online', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36', 'USD', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'active') ;

#
# End of data contents of table `pe_rg_lead`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_lead_detail`
#

DROP TABLE IF EXISTS `pe_rg_lead_detail`;


#
# Table structure of table `pe_rg_lead_detail`
#

CREATE TABLE `pe_rg_lead_detail` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `form_id` mediumint(8) unsigned NOT NULL,
  `field_number` float NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `form_id` (`form_id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_field_number` (`lead_id`,`field_number`),
  KEY `lead_field_value` (`value`(191))
) ENGINE=MyISAM AUTO_INCREMENT=293 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_lead_detail`
#
INSERT INTO `pe_rg_lead_detail` ( `id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
(1, 1, 1, '1', 'Excel augusztus'),
(2, 1, 1, '5', 'holevi96@gmail.com'),
(3, 1, 1, '6.6', 'Levente'),
(4, 1, 1, '7', '(656) 757-6576'),
(5, 1, 1, '16', 'penta'),
(6, 1, 1, '17', '4564'),
(7, 2, 1, '1', 'Excel augusztus'),
(8, 2, 1, '5', 'holevi96@gmail.com'),
(9, 2, 1, '6.6', 'Levente'),
(10, 2, 1, '7', '(121) 231-4353'),
(11, 2, 1, '9.1', 'igen'),
(12, 2, 1, '11', 'a:2:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(121) 231-4353";}i:1;a:3:{s:4:"Név";s:3:"sdf";s:5:"Email";s:6:"fgdfgd";s:7:"Telefon";s:8:"12123123";}}'),
(13, 2, 1, '16', 'penta'),
(14, 2, 1, '17', '4564'),
(15, 2, 1, '18', 'pilis'),
(16, 2, 1, '19', '34324324'),
(19, 3, 1, '1', 'Excel augusztus'),
(20, 3, 1, '5', 'holevi96@gmail.com'),
(21, 3, 1, '6.6', 'Levente'),
(22, 3, 1, '7', '(234) 345-3656'),
(23, 3, 1, '9.1', 'igen'),
(24, 3, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(234) 345-3656";}}'),
(25, 3, 1, '16', 'penta'),
(26, 3, 1, '17', '4564'),
(27, 3, 1, '18', 'pilis'),
(30, 4, 1, '1', 'Excel augusztus'),
(31, 4, 1, '5', 'holevi96@gmail.com'),
(32, 4, 1, '6.6', 'Levente'),
(33, 4, 1, '7', '(121) 212-1212'),
(34, 4, 1, '9.1', 'igen'),
(35, 4, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(121) 212-1212";}}'),
(36, 4, 1, '16', 'penta'),
(37, 4, 1, '17', '4564'),
(38, 4, 1, '18', 'pilis'),
(39, 4, 1, '19', '34324324'),
(42, 5, 1, '1', 'Excel augusztus'),
(43, 5, 1, '5', 'holevi96@gmail.com'),
(44, 5, 1, '6.6', 'Levente'),
(45, 5, 1, '7', '(345) 345-3545'),
(46, 5, 1, '9.1', 'igen'),
(47, 5, 1, '10.1', 'igen'),
(48, 5, 1, '11', 'a:2:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(345) 345-3545";}i:1;a:3:{s:4:"Név";s:5:"Sanyi";s:5:"Email";s:15:"email@email.com";s:7:"Telefon";s:14:"(345) 345-3545";}}'),
(49, 5, 1, '16', 'penta'),
(50, 5, 1, '17', '4564'),
(51, 5, 1, '18', 'pilis'),
(52, 5, 1, '19', '34324324'),
(53, 5, 1, '31', 'Nem'),
(54, 5, 1, '22', 'Horváth'),
(55, 5, 1, '23', '536654'),
(56, 5, 1, '24', 'pillis'),
(57, 5, 1, '25', '3454564567'),
(58, 5, 1, '30', 'Átutalás'),
(59, 6, 1, '1', 'Excel augusztus'),
(60, 6, 1, '5', 'holevi96@gmail.com'),
(61, 6, 1, '6.6', 'Levente'),
(62, 6, 1, '7', '(123) 345-4556'),
(63, 6, 1, '9.1', 'igen'),
(64, 6, 1, '10.1', 'igen'),
(65, 6, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(123) 345-4556";}}'),
(66, 6, 1, '16', 'penta'),
(67, 6, 1, '17', '4564'),
(68, 6, 1, '18', 'pilis'),
(69, 6, 1, '19', '34324324'),
(70, 6, 1, '31', 'Igen'),
(71, 6, 1, '30', 'Készpénz'),
(72, 7, 1, '1', 'Excel augusztus'),
(73, 7, 1, '5', 'holevi96@gmail.com'),
(74, 7, 1, '6.6', 'Levente'),
(75, 7, 1, '7', '(123) 345-4556'),
(76, 7, 1, '9.1', 'igen'),
(77, 7, 1, '10.1', 'igen'),
(78, 7, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(123) 345-4556";}}'),
(79, 7, 1, '16', 'penta'),
(80, 7, 1, '17', '4564'),
(81, 7, 1, '18', 'pilis'),
(82, 7, 1, '19', '34324324'),
(83, 7, 1, '31', 'Igen'),
(84, 7, 1, '30', 'Készpénz'),
(85, 8, 1, '1', 'Excel makróprogramozás - VBA'),
(86, 8, 1, '32', '2017.01.12'),
(87, 8, 1, '33', '20000'),
(88, 8, 1, '34', 'C:wamp64wwwpentaschool//pdf/jelentkezes_1485336368.pdf'),
(89, 8, 1, '5', 'holevi96@gmail.com'),
(90, 8, 1, '6.6', 'Levente'),
(91, 8, 1, '7', '(012) 344-5345'),
(92, 8, 1, '9.1', 'igen'),
(93, 8, 1, '10.1', 'igen'),
(94, 8, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(012) 344-5345";}}'),
(95, 8, 1, '16', 'penta'),
(96, 8, 1, '17', '4564'),
(97, 8, 1, '18', 'pilis'),
(98, 8, 1, '19', '34324324'),
(99, 8, 1, '31', 'Igen'),
(100, 8, 1, '30', 'Készpénz'),
(101, 9, 1, '1', 'Excel makróprogramozás - VBA'),
(102, 9, 1, '32', '2017.01.12'),
(103, 9, 1, '33', '20000'),
(104, 9, 1, '34', 'C:wamp64wwwpentaschoolwp-contentthemestwentysixteen/pdf/jelentkezes_1485336556.pdf'),
(105, 9, 1, '5', 'holevi96@gmail.com'),
(106, 9, 1, '6.6', 'Levente') ;
INSERT INTO `pe_rg_lead_detail` ( `id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
(107, 9, 1, '7', '(234) 234-2342'),
(108, 9, 1, '9.1', 'igen'),
(109, 9, 1, '10.1', 'igen'),
(110, 9, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(234) 234-2342";}}'),
(111, 9, 1, '16', 'penta'),
(112, 9, 1, '17', '4564'),
(113, 9, 1, '18', 'pilis'),
(114, 9, 1, '19', '34324324'),
(115, 9, 1, '31', 'Igen'),
(116, 9, 1, '30', 'Készpénz'),
(117, 10, 1, '1', 'Excel makróprogramozás - VBA'),
(118, 10, 1, '32', '2017.01.12'),
(119, 10, 1, '33', '20000'),
(120, 10, 1, '34', 'C:/wamp64/www/pentaschool/wp-content/themes/twentysixteen/pdf/jelentkezes_1485337022.pdf'),
(121, 10, 1, '5', 'holevi96@gmail.com'),
(122, 10, 1, '6.6', 'Levente'),
(123, 10, 1, '7', '(123) 445-5655'),
(124, 10, 1, '9.1', 'igen'),
(125, 10, 1, '10.1', 'igen'),
(126, 10, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(123) 445-5655";}}'),
(127, 10, 1, '16', 'penta'),
(128, 10, 1, '17', '4564'),
(129, 10, 1, '18', 'pilis'),
(130, 10, 1, '19', '34324324'),
(131, 10, 1, '31', 'Igen'),
(132, 10, 1, '30', 'Átutalás'),
(133, 11, 1, '1', 'Excel makróprogramozás - VBA'),
(134, 11, 1, '32', '2017.01.12'),
(135, 11, 1, '33', '20000'),
(136, 11, 1, '34', 'C:/wamp64/www/pentaschool/wp-content/themes/twentysixteen/pdf/jelentkezes_1485337414.pdf'),
(137, 11, 1, '5', 'holevi96@gmail.com'),
(138, 11, 1, '6.6', 'Levente'),
(139, 11, 1, '7', '(435) 434-5354'),
(140, 11, 1, '9.1', 'igen'),
(141, 11, 1, '10.1', 'igen'),
(142, 11, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(435) 434-5354";}}'),
(143, 11, 1, '16', 'penta'),
(144, 11, 1, '17', '4564'),
(145, 11, 1, '18', 'pilis'),
(146, 11, 1, '19', '34324324'),
(147, 11, 1, '31', 'Igen'),
(148, 11, 1, '30', 'Készpénz'),
(149, 12, 1, '1', 'Excel makróprogramozás - VBA'),
(150, 12, 1, '32', '2017.01.12'),
(151, 12, 1, '33', '20000'),
(152, 12, 1, '34', 'http://pentaschool.hu/wp-content/themes/twentysixteen/style.css/pdf/jelentkezes_1485337744.pdf'),
(153, 12, 1, '5', 'holevi96@gmail.com'),
(154, 12, 1, '6.6', 'Levente'),
(155, 12, 1, '7', '(121) 212-1212'),
(156, 12, 1, '9.1', 'igen'),
(157, 12, 1, '10.1', 'igen'),
(158, 12, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(121) 212-1212";}}'),
(159, 12, 1, '16', 'penta'),
(160, 12, 1, '17', '4564'),
(161, 12, 1, '18', 'pilis'),
(162, 12, 1, '19', '34324324'),
(163, 12, 1, '31', 'Igen'),
(164, 12, 1, '30', 'Készpénz'),
(165, 13, 7, '1', 'holevi96@gmail.com'),
(166, 13, 7, '2', 'Levi'),
(167, 13, 7, '3', '77676676'),
(168, 13, 7, '4', 'Bem u. 3'),
(169, 13, 7, '5', 'Excel makróprogramozás - VBA, 2017.01.12'),
(170, 14, 5, '1', 'holevi96@gmail.com'),
(171, 14, 5, '2', 'Levi'),
(172, 14, 5, '3', '77676676'),
(173, 14, 5, '4', 'Bem u. 3'),
(174, 15, 7, '1', 'holevi96@gmail.com'),
(175, 15, 7, '2', 'Levi'),
(176, 15, 7, '3', '012334'),
(177, 15, 7, '4', 'Bem u. 3'),
(178, 15, 7, '5', 'Excel makróprogramozás - VBA, 2017.01.12'),
(179, 16, 5, '1', 'holevi96@gmail.com'),
(180, 16, 5, '2', 'Levi'),
(181, 16, 5, '3', '012334'),
(182, 16, 5, '4', 'Bem u. 3'),
(183, 17, 7, '1', 'holevi96@gmail.com'),
(184, 17, 7, '2', 'Levi'),
(185, 17, 7, '3', '012334678678'),
(186, 17, 7, '4', 'Bem u. 3'),
(187, 17, 7, '5', 'Excel makróprogramozás - VBA, 2017.01.12'),
(188, 18, 5, '1', 'holevi96@gmail.com'),
(189, 18, 5, '2', 'Levi'),
(190, 18, 5, '3', '012334678678'),
(191, 18, 5, '4', 'Bem u. 3'),
(192, 19, 7, '1', 'holevi96@gmail.com'),
(193, 19, 7, '2', 'Levi'),
(194, 19, 7, '3', '012334678678'),
(195, 19, 7, '4', 'Bem u. 3'),
(196, 19, 7, '5', 'Excel makróprogramozás - VBA, 2017.01.12'),
(197, 20, 7, '1', 'holevi96@gmail.com'),
(198, 20, 7, '2', 'Levi'),
(199, 20, 7, '3', '123'),
(200, 20, 7, '4', 'Bem u. 3'),
(201, 20, 7, '5', 'Excel makróprogramozás - VBA, 2017.01.12'),
(202, 21, 5, '1', 'holevi96@gmail.com'),
(203, 21, 5, '2', 'Levi'),
(204, 21, 5, '3', '123'),
(205, 21, 5, '4', 'Bem u. 3'),
(206, 22, 7, '1', 'holevi96@gmail.com') ;
INSERT INTO `pe_rg_lead_detail` ( `id`, `lead_id`, `form_id`, `field_number`, `value`) VALUES
(207, 22, 7, '2', 'Levi'),
(208, 22, 7, '3', '77676676i888'),
(209, 22, 7, '4', 'Bem u. 3'),
(210, 22, 7, '5', 'Excel makróprogramozás - VBA, 2017.01.12'),
(211, 23, 5, '1', 'holevi96@gmail.com'),
(212, 23, 5, '2', 'Levi'),
(213, 23, 5, '3', '77676676i888'),
(214, 23, 5, '4', 'Bem u. 3'),
(215, 23, 5, '6', 'Excel makróprogramozás - VBA'),
(216, 24, 5, '1', 'holevi96@gmail.com'),
(217, 24, 5, '2', 'Levi'),
(218, 24, 5, '3', '45'),
(219, 24, 5, '4', 'Bem u. 3'),
(220, 24, 5, '6', 'Excel makróprogramozás - VBA'),
(221, 25, 8, '1', 'gquiz11f2409e2'),
(222, 25, 8, '2.2', 'gquiz23f5c93bd'),
(223, 26, 8, '1', 'gquiz19bf78d4c'),
(224, 26, 8, '2.2', 'gquiz23f5c93bd'),
(225, 27, 8, '1', 'gquiz1f3a01080'),
(226, 27, 8, '2.1', 'gquiz2a3c74d65'),
(227, 28, 8, '1', 'gquiz11f2409e2'),
(228, 28, 8, '2.2', 'gquiz23f5c93bd'),
(229, 28, 8, '2.3', 'gquiz2bd1f30e7'),
(230, 29, 8, '1', 'gquiz11f2409e2'),
(231, 29, 8, '2.2', 'gquiz23f5c93bd'),
(232, 29, 8, '2.3', 'gquiz2bd1f30e7'),
(233, 30, 8, '1', 'gquiz11f2409e2'),
(234, 30, 8, '2.2', 'gquiz23f5c93bd'),
(235, 30, 8, '2.3', 'gquiz2bd1f30e7'),
(236, 31, 8, '2.3', 'gquiz2bd1f30e7'),
(237, 31, 8, '1', 'gquiz1f3a01080'),
(238, 32, 8, '1', 'gquiz1f3a01080'),
(239, 32, 8, '2.1', 'gquiz2a3c74d65'),
(240, 33, 8, '1', 'gquiz1f3a01080'),
(241, 33, 8, '2.1', 'gquiz2a3c74d65'),
(242, 33, 8, '2.2', 'gquiz23f5c93bd'),
(243, 34, 8, '1', 'gquiz1f3a01080'),
(244, 34, 8, '2.1', 'gquiz2a3c74d65'),
(245, 34, 8, '2.2', 'gquiz23f5c93bd'),
(246, 35, 8, '1', 'gquiz1f3a01080'),
(247, 35, 8, '2.1', 'gquiz2a3c74d65'),
(248, 36, 1, '1', 'Excel makróprogramozás - VBA'),
(249, 36, 1, '32', '2017.01.12'),
(250, 36, 1, '33', '19000'),
(251, 36, 1, '34', 'http://localhost/pentaschool/wp-content/themes/twentysixteen/pdf/jelentkezes_1509449799.pdf'),
(252, 36, 1, '5', 'holevi96@gmail.com'),
(253, 36, 1, '6.6', 'Levi'),
(254, 36, 1, '7', '(010) 120-1202'),
(255, 36, 1, '9.1', 'igen'),
(256, 36, 1, '11', 'a:2:{i:0;a:3:{s:4:"Név";s:4:"Levi";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(010) 120-1202";}i:1;a:3:{s:4:"Név";s:5:"Géza";s:5:"Email";s:6:"asdasd";s:7:"Telefon";s:6:"234234";}}'),
(257, 36, 1, '16', 'asdas'),
(258, 36, 1, '17', '1232'),
(259, 36, 1, '18', 'asd'),
(260, 36, 1, '19', '234234234'),
(261, 36, 1, '31', 'Igen'),
(262, 36, 1, '30', 'Készpénz'),
(263, 37, 1, '1', 'Excel makróprogramozás - VBA'),
(264, 37, 1, '32', '2017.01.12'),
(265, 37, 1, '33', '19000'),
(266, 37, 1, '34', 'http://localhost/pentaschool/wp-content/themes/twentysixteen/pdf/jelentkezes_1509449819.pdf'),
(267, 37, 1, '5', 'holevi96@gmail.com'),
(268, 37, 1, '6.6', 'Levi'),
(269, 37, 1, '7', '(010) 120-1202'),
(270, 37, 1, '9.1', 'igen'),
(271, 37, 1, '11', 'a:2:{i:0;a:3:{s:4:"Név";s:4:"Levi";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(010) 120-1202";}i:1;a:3:{s:4:"Név";s:5:"Géza";s:5:"Email";s:6:"asdasd";s:7:"Telefon";s:6:"234234";}}'),
(272, 37, 1, '16', 'asdas'),
(273, 37, 1, '17', '1232'),
(274, 37, 1, '18', 'asd'),
(275, 37, 1, '19', '234234234'),
(276, 37, 1, '31', 'Igen'),
(277, 37, 1, '30', 'Készpénz'),
(278, 38, 1, '1', 'Excel makróprogramozás - VBA'),
(279, 38, 1, '32', '2017.01.12'),
(280, 38, 1, '33', '19000'),
(281, 38, 1, '34', 'http://localhost/pentaschool/wp-content/themes/twentysixteen/pdf/jelentkezes_1509449986.pdf'),
(282, 38, 1, '5', 'holevi96@gmail.com'),
(283, 38, 1, '6.6', 'Levente'),
(284, 38, 1, '7', '(566) 756-7567'),
(285, 38, 1, '9.1', 'igen'),
(286, 38, 1, '11', 'a:1:{i:0;a:3:{s:4:"Név";s:7:"Levente";s:5:"Email";s:18:"holevi96@gmail.com";s:7:"Telefon";s:14:"(566) 756-7567";}}'),
(287, 38, 1, '16', 'asdas'),
(288, 38, 1, '17', '1232'),
(289, 38, 1, '18', 'asd'),
(290, 38, 1, '19', '6z87'),
(291, 38, 1, '31', 'Igen'),
(292, 38, 1, '30', 'Készpénz') ;

#
# End of data contents of table `pe_rg_lead_detail`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_lead_detail_long`
#

DROP TABLE IF EXISTS `pe_rg_lead_detail_long`;


#
# Table structure of table `pe_rg_lead_detail_long`
#

CREATE TABLE `pe_rg_lead_detail_long` (
  `lead_detail_id` bigint(20) unsigned NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`lead_detail_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_lead_detail_long`
#

#
# End of data contents of table `pe_rg_lead_detail_long`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_lead_meta`
#

DROP TABLE IF EXISTS `pe_rg_lead_meta`;


#
# Table structure of table `pe_rg_lead_meta`
#

CREATE TABLE `pe_rg_lead_meta` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `lead_id` bigint(20) unsigned NOT NULL,
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `meta_key` (`meta_key`(191)),
  KEY `lead_id` (`lead_id`),
  KEY `form_id_meta_key` (`form_id`,`meta_key`(191))
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_lead_meta`
#
INSERT INTO `pe_rg_lead_meta` ( `id`, `form_id`, `lead_id`, `meta_key`, `meta_value`) VALUES
(1, 8, 25, 'gquiz_score', '2'),
(2, 8, 25, 'gquiz_percent', '100'),
(3, 8, 25, 'gquiz_grade', 'A'),
(4, 8, 25, 'gquiz_is_pass', '1'),
(5, 8, 26, 'gquiz_score', '1'),
(6, 8, 26, 'gquiz_percent', '50'),
(7, 8, 26, 'gquiz_grade', 'E'),
(8, 8, 26, 'gquiz_is_pass', '1'),
(9, 8, 27, 'gquiz_score', '0'),
(10, 8, 27, 'gquiz_percent', '0'),
(11, 8, 27, 'gquiz_grade', 'E'),
(12, 8, 27, 'gquiz_is_pass', '0'),
(13, 8, 28, 'gquiz_score', '1'),
(14, 8, 28, 'gquiz_percent', '50'),
(15, 8, 28, 'gquiz_grade', 'E'),
(16, 8, 28, 'gquiz_is_pass', '1'),
(17, 8, 29, 'gquiz_score', '1'),
(18, 8, 29, 'gquiz_percent', '50'),
(19, 8, 29, 'gquiz_grade', 'E'),
(20, 8, 29, 'gquiz_is_pass', '1'),
(21, 8, 30, 'gquiz_score', '1'),
(22, 8, 30, 'gquiz_percent', '50'),
(23, 8, 30, 'gquiz_grade', 'E'),
(24, 8, 30, 'gquiz_is_pass', '1'),
(25, 8, 31, 'gquiz_score', '0'),
(26, 8, 31, 'gquiz_percent', '0'),
(27, 8, 31, 'gquiz_grade', 'E'),
(28, 8, 31, 'gquiz_is_pass', '0'),
(29, 8, 32, 'gquiz_score', '0'),
(30, 8, 32, 'gquiz_percent', '0'),
(31, 8, 32, 'gquiz_grade', 'E'),
(32, 8, 32, 'gquiz_is_pass', '0'),
(33, 8, 33, 'gquiz_score', '0'),
(34, 8, 33, 'gquiz_percent', '0'),
(35, 8, 33, 'gquiz_grade', 'E'),
(36, 8, 33, 'gquiz_is_pass', '0'),
(37, 8, 34, 'gquiz_score', '0'),
(38, 8, 34, 'gquiz_percent', '0'),
(39, 8, 34, 'gquiz_grade', 'E'),
(40, 8, 34, 'gquiz_is_pass', '0'),
(41, 8, 35, 'gquiz_score', '0'),
(42, 8, 35, 'gquiz_percent', '0'),
(43, 8, 35, 'gquiz_grade', 'E'),
(44, 8, 35, 'gquiz_is_pass', '0') ;

#
# End of data contents of table `pe_rg_lead_meta`
# --------------------------------------------------------



#
# Delete any existing table `pe_rg_lead_notes`
#

DROP TABLE IF EXISTS `pe_rg_lead_notes`;


#
# Table structure of table `pe_rg_lead_notes`
#

CREATE TABLE `pe_rg_lead_notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL,
  `user_name` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci,
  `note_type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `lead_id` (`lead_id`),
  KEY `lead_user_key` (`lead_id`,`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_rg_lead_notes`
#

#
# End of data contents of table `pe_rg_lead_notes`
# --------------------------------------------------------



#
# Delete any existing table `pe_term_relationships`
#

DROP TABLE IF EXISTS `pe_term_relationships`;


#
# Table structure of table `pe_term_relationships`
#

CREATE TABLE `pe_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_term_relationships`
#
INSERT INTO `pe_term_relationships` ( `object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(71, 1, 0),
(73, 1, 0),
(79, 1, 0),
(83, 16, 1),
(84, 17, 1),
(85, 17, 1),
(86, 18, 1),
(87, 19, 1),
(87, 20, 0),
(87, 29, 0),
(88, 19, 1),
(89, 19, 1),
(90, 19, 1),
(91, 19, 1),
(92, 19, 1),
(93, 19, 1),
(94, 19, 1),
(95, 19, 1),
(96, 19, 1),
(97, 20, 1),
(98, 17, 1),
(99, 18, 1),
(100, 21, 1),
(101, 21, 1),
(102, 20, 1),
(103, 16, 1),
(104, 16, 1),
(105, 22, 1),
(106, 18, 1),
(107, 16, 1),
(108, 17, 1),
(109, 17, 1),
(110, 23, 1),
(111, 16, 1),
(112, 19, 1),
(112, 28, 0),
(113, 19, 1),
(114, 23, 1),
(115, 16, 1),
(116, 16, 1),
(117, 24, 1),
(117, 30, 0),
(118, 16, 1),
(119, 16, 1),
(120, 25, 1),
(121, 25, 1),
(122, 25, 1),
(123, 16, 1),
(124, 16, 1),
(125, 16, 1),
(126, 22, 1),
(127, 26, 1),
(128, 17, 1),
(129, 17, 1),
(130, 27, 1),
(131, 24, 1),
(132, 24, 1),
(133, 24, 1),
(134, 24, 1),
(135, 24, 1),
(136, 24, 1),
(137, 16, 1),
(138, 21, 1),
(139, 28, 1),
(140, 16, 1),
(141, 28, 1) ;

#
# End of data contents of table `pe_term_relationships`
# --------------------------------------------------------



#
# Delete any existing table `pe_term_taxonomy`
#

DROP TABLE IF EXISTS `pe_term_taxonomy`;


#
# Table structure of table `pe_term_taxonomy`
#

CREATE TABLE `pe_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_term_taxonomy`
#
INSERT INTO `pe_term_taxonomy` ( `term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(16, 16, 'category', '', 0, 14),
(17, 17, 'category', '', 0, 7),
(18, 18, 'category', '', 0, 3),
(19, 19, 'category', '', 0, 12),
(20, 20, 'category', '', 0, 3),
(21, 21, 'category', '', 0, 3),
(22, 22, 'category', '', 0, 2),
(23, 23, 'category', '', 0, 2),
(24, 24, 'category', '', 0, 7),
(25, 25, 'category', '', 0, 3),
(26, 26, 'category', '', 0, 1),
(27, 27, 'category', '', 0, 1),
(28, 28, 'category', '', 0, 3),
(29, 29, 'marker', '#96D754', 0, 1),
(30, 30, 'marker', '#FFFA74', 0, 1),
(31, 31, 'ajanlas_cat', '', 0, 0) ;

#
# End of data contents of table `pe_term_taxonomy`
# --------------------------------------------------------



#
# Delete any existing table `pe_termmeta`
#

DROP TABLE IF EXISTS `pe_termmeta`;


#
# Table structure of table `pe_termmeta`
#

CREATE TABLE `pe_termmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `term_id` (`term_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_termmeta`
#

#
# End of data contents of table `pe_termmeta`
# --------------------------------------------------------



#
# Delete any existing table `pe_terms`
#

DROP TABLE IF EXISTS `pe_terms`;


#
# Table structure of table `pe_terms`
#

CREATE TABLE `pe_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  `term_order` int(4) DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_terms`
#
INSERT INTO `pe_terms` ( `term_id`, `name`, `slug`, `term_group`, `term_order`) VALUES
(1, 'Egyéb', 'egyeb', 0, 0),
(16, 'Webmester', 'webmester', 0, 0),
(17, 'Linux', 'linux', 0, 0),
(18, 'Windows Server', 'windows-server', 0, 0),
(19, 'Office', 'office', 0, 0),
(20, 'Adatbázis', 'adatbazis', 0, 0),
(21, 'dotNET', 'dotnet', 0, 0),
(22, 'Hálózat', 'halozat', 0, 0),
(23, 'Grafika', 'grafika', 0, 0),
(24, 'Java', 'java', 0, 0),
(25, 'Drupal', 'drupal', 0, 0),
(26, 'Wordpress', 'wordpress', 0, 0),
(27, 'Programozás', 'programozas', 0, 0),
(28, 'Excel', 'excel', 0, 0),
(29, 'Vegleges', 'vegleges', 0, 0),
(30, 'Fuggoben', 'fuggoben', 0, 0),
(31, 'adatbazis-access-halado-tanfolyam', 'adatbazis-access-halado-tanfolyam', 0, 0) ;

#
# End of data contents of table `pe_terms`
# --------------------------------------------------------



#
# Delete any existing table `pe_usermeta`
#

DROP TABLE IF EXISTS `pe_usermeta`;


#
# Table structure of table `pe_usermeta`
#

CREATE TABLE `pe_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_usermeta`
#
INSERT INTO `pe_usermeta` ( `umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 2, 'nickname', 'admin'),
(2, 2, 'first_name', ''),
(3, 2, 'last_name', ''),
(4, 2, 'description', ''),
(5, 2, 'rich_editing', 'true'),
(6, 2, 'comment_shortcuts', 'false'),
(7, 2, 'admin_color', 'fresh'),
(8, 2, 'use_ssl', '0'),
(9, 2, 'show_admin_bar_front', 'true'),
(10, 2, 'pe_capabilities', 'a:1:{s:13:"administrator";b:1;}'),
(11, 2, 'pe_user_level', '10'),
(12, 2, 'dismissed_wp_pointers', 'pksn1,cptp_pointer0871,vc_pointers_backend_editor,vc_grid_item'),
(13, 2, 'show_welcome_panel', '1'),
(14, 2, 'session_tokens', 'a:1:{s:64:"5c656cf9db2325d24e523acc77898e482d5ce869ec7b81a69cb86c611b938f81";a:4:{s:10:"expiration";i:1519382309;s:2:"ip";s:13:"81.183.153.51";s:2:"ua";s:115:"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/64.0.3282.167 Safari/537.36";s:5:"login";i:1519209509;}}'),
(15, 2, 'pe_dashboard_quick_press_last_post_id', '358'),
(16, 2, 'meta-box-order_dashboard', 'a:4:{s:6:"normal";s:38:"dashboard_right_now,dashboard_activity";s:4:"side";s:17:"dashboard_primary";s:7:"column3";s:21:"dashboard_quick_press";s:7:"column4";s:0:"";}'),
(17, 2, 'closedpostboxes_dashboard', 'a:0:{}'),
(18, 2, 'metaboxhidden_dashboard', 'a:0:{}'),
(19, 2, 'closedpostboxes_post', 'a:0:{}'),
(20, 2, 'metaboxhidden_post', 'a:12:{i:0;s:7:"acf_154";i:1;s:7:"acf_146";i:2;s:5:"acf_9";i:3;s:7:"acf_145";i:4;s:7:"acf_144";i:5;s:5:"acf_7";i:6;s:11:"postexcerpt";i:7;s:13:"trackbacksdiv";i:8;s:10:"postcustom";i:9;s:16:"commentstatusdiv";i:10;s:7:"slugdiv";i:11;s:9:"authordiv";}'),
(21, 2, 'meta-box-order_tanfolyamok', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:53:"submitdiv,categorydiv,mark_posts_options,postimagediv";s:6:"normal";s:63:"acf_154,acf_146,acf_9,acf_145,acf_144,meta-box-id,acf_7,slugdiv";s:8:"advanced";s:0:"";}'),
(22, 2, 'screen_layout_tanfolyamok', '2'),
(23, 2, 'pe_user-settings', 'libraryContent=browse&editor=tinymce&template_window_vcUIPanelWidth=1024&template_window_vcUIPanelLeft=119px&template_window_vcUIPanelTop=74px&edit_element_vcUIPanelWidth=650&edit_element_vcUIPanelLeft=443px&edit_element_vcUIPanelTop=59px'),
(24, 2, 'pe_user-settings-time', '1473424649'),
(25, 2, 'meta-box-order_valaszok', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:22:"submitdiv,postimagediv";s:6:"normal";s:199:"acf-group_57c1ccab94e26,acf-group_57c1ccabdda82,acf-group_57c1ccac8b38d,acf-group_57c1ccaccbdf8,acf-group_57c1ccad09b18,acf-group_57c1ccad3ca65,acf-group_57c1ccadee5cf,acf-group_57c1ccaf15ebc,slugdiv";s:8:"advanced";s:0:"";}'),
(26, 2, 'screen_layout_valaszok', '2'),
(27, 2, 'meta-box-order_vc_grid_item', 'a:4:{s:15:"acf_after_title";s:0:"";s:4:"side";s:9:"submitdiv";s:6:"normal";s:267:"wpb_visual_composer,acf-group_57c1ccab94e26,acf-group_57c1ccabdda82,acf-group_57c1ccac8b38d,acf-group_57c1fb2b04b16,acf-group_57c1ccaccbdf8,acf-group_57c1ccad09b18,acf-group_57c1ccad3ca65,acf-group_57c1ccadee5cf,acf-group_57c31bf48336c,acf-group_57c1ccaf15ebc,slugdiv";s:8:"advanced";s:0:"";}'),
(28, 2, 'screen_layout_vc_grid_item', '2'),
(29, 2, 'closedpostboxes_valaszok', 'a:0:{}'),
(30, 2, 'metaboxhidden_valaszok', 'a:9:{i:0;s:23:"acf-group_57c1fb2b04b16";i:1;s:23:"acf-group_57c1ccab94e26";i:2;s:23:"acf-group_57c1ccabdda82";i:3;s:23:"acf-group_57c1ccac8b38d";i:4;s:23:"acf-group_57c1ccaccbdf8";i:5;s:23:"acf-group_57c1ccad09b18";i:6;s:23:"acf-group_57c1ccad3ca65";i:7;s:23:"acf-group_57c1ccadee5cf";i:8;s:7:"slugdiv";}'),
(31, 2, 'gform_recent_forms', 'a:8:{i:0;s:1:"8";i:1;s:1:"7";i:2;s:1:"5";i:3;s:1:"6";i:4;s:1:"4";i:5;s:1:"2";i:6;s:1:"3";i:7;s:1:"1";}'),
(32, 2, 'itsec-settings-view', 'grid'),
(33, 2, 'closedpostboxes_tanfolyam-kiiras', 'a:1:{i:0;s:12:"postimagediv";}'),
(34, 2, 'metaboxhidden_tanfolyam-kiiras', 'a:7:{i:0;s:23:"acf-group_57c1ccab94e26";i:1;s:23:"acf-group_57c1ccac8b38d";i:2;s:23:"acf-group_57c1fb2b04b16";i:3;s:23:"acf-group_57c1ccaccbdf8";i:4;s:23:"acf-group_57c1ccad09b18";i:5;s:23:"acf-group_57c1ccadee5cf";i:6;s:7:"slugdiv";}'),
(35, 2, 'community-events-location', 'a:1:{s:2:"ip";s:12:"81.183.153.0";}'),
(36, 2, 'itsec_user_activity_last_seen', '1519209512') ;

#
# End of data contents of table `pe_usermeta`
# --------------------------------------------------------



#
# Delete any existing table `pe_users`
#

DROP TABLE IF EXISTS `pe_users`;


#
# Table structure of table `pe_users`
#

CREATE TABLE `pe_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`),
  KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


#
# Data contents of table `pe_users`
#
INSERT INTO `pe_users` ( `ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(2, 'holevi96', '$1$nKXLlRjh$/LnQNZwuhSpzQvEwWXbg4/', 'admin', 'holevi96@gmail.com', '', '2016-07-07 09:38:06', '', 0, 'admin') ;

#
# End of data contents of table `pe_users`
# --------------------------------------------------------

#
# Add constraints back in and apply any alter data queries.
#

