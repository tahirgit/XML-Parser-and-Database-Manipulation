-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 16, 2015 at 06:12 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `realestate2`
--
CREATE DATABASE IF NOT EXISTS `realestate2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `realestate2`;

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE IF NOT EXISTS `agency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_group_id` int(11) unsigned DEFAULT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(10) NOT NULL,
  `abn` varchar(20) DEFAULT NULL,
  `corporation_name` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `phone_alt` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `postal_address` text,
  `logo_160x30` varchar(150) DEFAULT NULL,
  `logo_original` varchar(150) DEFAULT NULL,
  `legacy_pm_identifier` int(11) unsigned DEFAULT NULL,
  `owner_manager_user_id` int(11) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `display_name` (`display_name`),
  UNIQUE KEY `display_abbr` (`display_abbr`),
  UNIQUE KEY `display_name_2` (`display_name`),
  UNIQUE KEY `display_abbr_2` (`display_abbr`),
  UNIQUE KEY `legacy_pm_identifier` (`legacy_pm_identifier`),
  KEY `agency_group_id` (`agency_group_id`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `status_code` (`status_code`),
  KEY `owner_manager_user_id` (`owner_manager_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Triggers `agency`
--
DROP TRIGGER IF EXISTS `agency_modified`;
DELIMITER //
CREATE TRIGGER `agency_modified` BEFORE UPDATE ON `agency`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_agreement_type_code`
--

CREATE TABLE IF NOT EXISTS `agency_agreement_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agency_branding`
--

CREATE TABLE IF NOT EXISTS `agency_branding` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned NOT NULL,
  `agency_branding_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `banner_path` varchar(150) DEFAULT NULL,
  `colour1` varchar(7) NOT NULL DEFAULT '#cccccc',
  `colour2` varchar(7) NOT NULL DEFAULT '#cccccc',
  `colour3` varchar(7) NOT NULL DEFAULT '#cccccc',
  `bg_colour1` varchar(7) NOT NULL DEFAULT '#ffffff',
  `bg_colour2` varchar(7) NOT NULL DEFAULT '#ffffff',
  `bg_colour3` varchar(7) NOT NULL DEFAULT '#ffffff',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_agency_branding_type_code` (`agency_id`,`agency_branding_type_code`),
  KEY `agency_branding_type_code` (`agency_branding_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Triggers `agency_branding`
--
DROP TRIGGER IF EXISTS `agency_branding_modified`;
DELIMITER //
CREATE TRIGGER `agency_branding_modified` BEFORE UPDATE ON `agency_branding`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_branding_type_code`
--

CREATE TABLE IF NOT EXISTS `agency_branding_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `agency_config_default`
--

CREATE TABLE IF NOT EXISTS `agency_config_default` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned NOT NULL,
  `listing_type_code` tinyint(3) unsigned DEFAULT NULL,
  `listing_trade_type_code` tinyint(3) unsigned DEFAULT NULL,
  `price_visibility_code` tinyint(3) unsigned DEFAULT NULL,
  `price_sold_visibility_code` tinyint(3) unsigned DEFAULT NULL,
  `price_leased_visibility_code` tinyint(3) unsigned DEFAULT NULL,
  `commission_type_code` tinyint(3) unsigned DEFAULT NULL,
  `agency_agreement_type_code` tinyint(3) unsigned DEFAULT NULL,
  `agent_id` int(11) unsigned DEFAULT NULL,
  `scheduled_from` timestamp NULL DEFAULT NULL,
  `scheduled_to` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`),
  KEY `listing_type_code` (`listing_type_code`),
  KEY `listing_trade_type_code` (`listing_trade_type_code`),
  KEY `price_visibility_code` (`price_visibility_code`),
  KEY `price_sold_visibility_code` (`price_sold_visibility_code`),
  KEY `price_leased_visibility_code` (`price_leased_visibility_code`),
  KEY `commission_type_code` (`commission_type_code`),
  KEY `agency_agreement_type_code` (`agency_agreement_type_code`),
  KEY `agent_id` (`agent_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `agency_config_default`
--
DROP TRIGGER IF EXISTS `agency_config_default_modified`;
DELIMITER //
CREATE TRIGGER `agency_config_default_modified` BEFORE UPDATE ON `agency_config_default`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_config_export`
--

CREATE TABLE IF NOT EXISTS `agency_config_export` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned NOT NULL,
  `rea_id` varchar(50) DEFAULT NULL,
  `domain_id` varchar(50) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `agency_config_export`
--
DROP TRIGGER IF EXISTS `agency_config_export_modified`;
DELIMITER //
CREATE TRIGGER `agency_config_export_modified` BEFORE UPDATE ON `agency_config_export`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_group`
--

CREATE TABLE IF NOT EXISTS `agency_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(10) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `phone_alt` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `postal_address` text,
  `logo_path` varchar(150) DEFAULT NULL,
  `logo_path_original` varchar(150) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `display_name` (`display_name`),
  UNIQUE KEY `display_abbr` (`display_abbr`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `agency_group`
--
DROP TRIGGER IF EXISTS `agency_group_modified`;
DELIMITER //
CREATE TRIGGER `agency_group_modified` BEFORE UPDATE ON `agency_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_locality`
--

CREATE TABLE IF NOT EXISTS `agency_locality` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned NOT NULL,
  `locality_type_code` tinyint(3) unsigned NOT NULL,
  `locality_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`locality_type_code`,`locality_id`),
  KEY `locality_type_code` (`locality_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=86 ;

--
-- Triggers `agency_locality`
--
DROP TRIGGER IF EXISTS `agency_locality_modified`;
DELIMITER //
CREATE TRIGGER `agency_locality_modified` BEFORE UPDATE ON `agency_locality`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agency_misc`
--

CREATE TABLE IF NOT EXISTS `agency_misc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned NOT NULL,
  `trading_hours` text,
  `languages_spoken` text,
  `specialties` text,
  `video` varchar(150) DEFAULT NULL,
  `external_links` text,
  `home_searcher_settings` varchar(300) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`),
  UNIQUE KEY `agency_id_2` (`agency_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Triggers `agency_misc`
--
DROP TRIGGER IF EXISTS `agency_misc_modified`;
DELIMITER //
CREATE TRIGGER `agency_misc_modified` BEFORE UPDATE ON `agency_misc`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent`
--

CREATE TABLE IF NOT EXISTS `agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(4) NOT NULL,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `position` varchar(75) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `url_twitter` varchar(150) DEFAULT NULL,
  `url_facebook` varchar(150) DEFAULT NULL,
  `url_linkedin` varchar(150) DEFAULT NULL,
  `introduction` text,
  `languages_spoken` text,
  `enable_team_view` tinyint(1) NOT NULL DEFAULT '0',
  `enable_listing_links` tinyint(1) NOT NULL DEFAULT '0',
  `photo_path` varchar(200) NOT NULL,
  `photo_path_original` varchar(200) NOT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`reference_number`),
  UNIQUE KEY `agency_id_3` (`agency_id`,`display_name`),
  KEY `salutation_code` (`salutation_code`),
  KEY `status_code` (`status_code`),
  KEY `agency_id_2` (`agency_id`,`display_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Triggers `agent`
--
DROP TRIGGER IF EXISTS `agent_modified`;
DELIMITER //
CREATE TRIGGER `agent_modified` BEFORE UPDATE ON `agent`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `agent_reference_number_order`;
DELIMITER //
CREATE TRIGGER `agent_reference_number_order` BEFORE INSERT ON `agent`
 FOR EACH ROW BEGIN
SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM agent WHERE agency_id = NEW.agency_id);
SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM agent WHERE agency_id = NEW.agency_id);
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent_hit`
--

CREATE TABLE IF NOT EXISTS `agent_hit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `audit` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agent_id` (`agent_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `agent_hit`
--
DROP TRIGGER IF EXISTS `agent_hit_modified`;
DELIMITER //
CREATE TRIGGER `agent_hit_modified` BEFORE UPDATE ON `agent_hit`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent_language`
--

CREATE TABLE IF NOT EXISTS `agent_language` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL,
  `language_spoken_id` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_id` (`agent_id`,`language_spoken_id`),
  KEY `language_spoken_id` (`language_spoken_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `agent_language`
--
DROP TRIGGER IF EXISTS `agent_language_modified`;
DELIMITER //
CREATE TRIGGER `agent_language_modified` BEFORE UPDATE ON `agent_language`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `agent_service`
--

CREATE TABLE IF NOT EXISTS `agent_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL,
  `service_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agent_id` (`agent_id`,`service_code`),
  KEY `service_code` (`service_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `agent_service`
--
DROP TRIGGER IF EXISTS `agent_service_modified`;
DELIMITER //
CREATE TRIGGER `agent_service_modified` BEFORE UPDATE ON `agent_service`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `auction_status_code`
--

CREATE TABLE IF NOT EXISTS `auction_status_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_authassignment`
--

CREATE TABLE IF NOT EXISTS `blog_authassignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` varchar(64) NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_authitem`
--

CREATE TABLE IF NOT EXISTS `blog_authitem` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_authitemchild`
--

CREATE TABLE IF NOT EXISTS `blog_authitemchild` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_comment`
--

CREATE TABLE IF NOT EXISTS `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `author` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `url` varchar(128) DEFAULT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_lookup`
--

CREATE TABLE IF NOT EXISTS `blog_lookup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post`
--

CREATE TABLE IF NOT EXISTS `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `tags` text,
  `status` int(11) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_rights`
--

CREATE TABLE IF NOT EXISTS `blog_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tag`
--

CREATE TABLE IF NOT EXISTS `blog_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `frequency` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `blog_user`
--

CREATE TABLE IF NOT EXISTS `blog_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salt` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `profile` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `brochure`
--

CREATE TABLE IF NOT EXISTS `brochure` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) DEFAULT NULL,
  `description` text,
  `path` varchar(150) DEFAULT NULL,
  `template_path` varchar(150) DEFAULT NULL,
  `brochure_code` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `brochure_code` (`brochure_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Triggers `brochure`
--
DROP TRIGGER IF EXISTS `brochure_modified`;
DELIMITER //
CREATE TRIGGER `brochure_modified` BEFORE UPDATE ON `brochure`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brochure_agency`
--

CREATE TABLE IF NOT EXISTS `brochure_agency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned NOT NULL,
  `brochure_id` int(11) unsigned NOT NULL,
  `active` tinyint(1) DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`brochure_id`),
  KEY `brochure_id` (`brochure_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Triggers `brochure_agency`
--
DROP TRIGGER IF EXISTS `brochure_agency_modified`;
DELIMITER //
CREATE TRIGGER `brochure_agency_modified` BEFORE UPDATE ON `brochure_agency`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `brochure_code`
--

CREATE TABLE IF NOT EXISTS `brochure_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `business_accommodation_tourism_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_accommodation_tourism_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_automotive_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_automotive_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_beauty_health_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_beauty_health_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_education_training_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_education_training_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_food_hospitality_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_food_hospitality_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_home_garden_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_home_garden_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_import_export_whole_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_import_export_whole_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_industrial_manufacture_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_industrial_manufacture_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_leisure_entertainment_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_leisure_entertainment_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_professional_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_professional_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_retail_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_retail_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_rural_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_rural_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_services_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_services_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

-- --------------------------------------------------------

--
-- Table structure for table `business_transport_distribution_property_type_code`
--

CREATE TABLE IF NOT EXISTS `business_transport_distribution_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `commission_type_code`
--

CREATE TABLE IF NOT EXISTS `commission_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(4) NOT NULL,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `position` varchar(75) DEFAULT NULL,
  `phone_mobile` varchar(15) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `introduction` text,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `postal_address` text,
  `photo_115x140` varchar(150) DEFAULT NULL,
  `photo_original` varchar(150) DEFAULT NULL,
  `note` text,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `enable_login` tinyint(1) NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`reference_number`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `agency_id_2` (`agency_id`,`display_name`,`company`),
  KEY `salutation_code` (`salutation_code`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `status_code` (`status_code`),
  KEY `agency_id_3` (`agency_id`,`display_name`),
  KEY `agency_id_4` (`agency_id`,`display_abbr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `contact`
--
DROP TRIGGER IF EXISTS `contact_modified`;
DELIMITER //
CREATE TRIGGER `contact_modified` BEFORE UPDATE ON `contact`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `contact_reference_number`;
DELIMITER //
CREATE TRIGGER `contact_reference_number` BEFORE INSERT ON `contact`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM contact WHERE agency_id = NEW.agency_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_group`
--

CREATE TABLE IF NOT EXISTS `contact_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(4) NOT NULL,
  `note` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`reference_number`),
  UNIQUE KEY `agency_id_2` (`agency_id`,`display_name`),
  UNIQUE KEY `agency_id_3` (`agency_id`,`display_abbr`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `contact_group`
--
DROP TRIGGER IF EXISTS `contact_group_modified`;
DELIMITER //
CREATE TRIGGER `contact_group_modified` BEFORE UPDATE ON `contact_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `contact_group_reference_number`;
DELIMITER //
CREATE TRIGGER `contact_group_reference_number` BEFORE INSERT ON `contact_group`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM contact_group WHERE agency_id = NEW.agency_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_grouping`
--

CREATE TABLE IF NOT EXISTS `contact_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `contact_group_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contact_group_id` (`contact_group_id`,`contact_id`),
  KEY `contact_id` (`contact_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `contact_grouping`
--
DROP TRIGGER IF EXISTS `contact_grouping_modified`;
DELIMITER //
CREATE TRIGGER `contact_grouping_modified` BEFORE UPDATE ON `contact_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contact_type_code`
--

CREATE TABLE IF NOT EXISTS `contact_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `messagable` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cp_contact`
--

CREATE TABLE IF NOT EXISTS `cp_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` varchar(75) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `salutation_code` (`salutation_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `cp_contact`
--
DROP TRIGGER IF EXISTS `cp_contact_modified`;
DELIMITER //
CREATE TRIGGER `cp_contact_modified` BEFORE UPDATE ON `cp_contact`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_contact_entity`
--

CREATE TABLE IF NOT EXISTS `cp_contact_entity` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cp_contact_id` int(11) unsigned NOT NULL,
  `entity` varchar(25) NOT NULL,
  `entity_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cp_contact_id` (`cp_contact_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `cp_contact_entity`
--
DROP TRIGGER IF EXISTS `cp_contact_entity_modified`;
DELIMITER //
CREATE TRIGGER `cp_contact_entity_modified` BEFORE UPDATE ON `cp_contact_entity`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_contact_history`
--

CREATE TABLE IF NOT EXISTS `cp_contact_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cp_contact_entity_id` int(11) unsigned NOT NULL,
  `cp_contact_medium_code` tinyint(3) unsigned NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `description` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cp_contact_entity_id` (`cp_contact_entity_id`),
  KEY `cp_contact_medium_code` (`cp_contact_medium_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `cp_contact_history`
--
DROP TRIGGER IF EXISTS `cp_contact_history_modified`;
DELIMITER //
CREATE TRIGGER `cp_contact_history_modified` BEFORE UPDATE ON `cp_contact_history`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_contact_history_attachment`
--

CREATE TABLE IF NOT EXISTS `cp_contact_history_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cp_contact_history_id` int(11) unsigned NOT NULL,
  `path` varchar(150) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cp_contact_history_id` (`cp_contact_history_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `cp_contact_history_attachment`
--
DROP TRIGGER IF EXISTS `cp_contact_history_attachment_modified`;
DELIMITER //
CREATE TRIGGER `cp_contact_history_attachment_modified` BEFORE UPDATE ON `cp_contact_history_attachment`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_contact_medium_code`
--

CREATE TABLE IF NOT EXISTS `cp_contact_medium_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_log`
--

CREATE TABLE IF NOT EXISTS `cp_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk_id` int(11) unsigned DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `model_backup` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cp_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cp_user_id` (`cp_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2405 ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_user`
--

CREATE TABLE IF NOT EXISTS `cp_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(4) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `position` varchar(75) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `colour` varchar(7) NOT NULL DEFAULT '#cccccc',
  `session_hash` varchar(128) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `display_name` (`display_name`),
  UNIQUE KEY `display_abbr` (`display_abbr`),
  KEY `salutation_code` (`salutation_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Triggers `cp_user`
--
DROP TRIGGER IF EXISTS `cp_user_modified`;
DELIMITER //
CREATE TRIGGER `cp_user_modified` BEFORE UPDATE ON `cp_user`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `cp_user_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `cp_user_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cp_user_auth_item`
--

CREATE TABLE IF NOT EXISTS `cp_user_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cp_user_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `cp_user_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cp_user_auth_rights`
--

CREATE TABLE IF NOT EXISTS `cp_user_auth_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cp_user_login_log`
--

CREATE TABLE IF NOT EXISTS `cp_user_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cp_user_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `audit` text,
  `authenticated` tinyint(1) NOT NULL DEFAULT '0',
  `logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cp_user_id` (`cp_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=415 ;

-- --------------------------------------------------------

--
-- Table structure for table `crontab`
--

CREATE TABLE IF NOT EXISTS `crontab` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `crontab_name` varchar(100) NOT NULL,
  `description` text,
  `path` varchar(200) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Triggers `crontab`
--
DROP TRIGGER IF EXISTS `crontab_modified`;
DELIMITER //
CREATE TRIGGER `crontab_modified` BEFORE UPDATE ON `crontab`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `crontab_log`
--

CREATE TABLE IF NOT EXISTS `crontab_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `crontab_id` int(11) unsigned NOT NULL,
  `description` text,
  `started` timestamp NULL DEFAULT NULL,
  `finished` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `crontab_id` (`crontab_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62345 ;

--
-- Triggers `crontab_log`
--
DROP TRIGGER IF EXISTS `crontab_log_modified`;
DELIMITER //
CREATE TRIGGER `crontab_log_modified` BEFORE UPDATE ON `crontab_log`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `duration_code`
--

CREATE TABLE IF NOT EXISTS `duration_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `export_portal`
--

CREATE TABLE IF NOT EXISTS `export_portal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `display_name` varchar(100) NOT NULL,
  `description` text,
  `documentation` varchar(100) NOT NULL,
  `ftp_host` varchar(50) NOT NULL,
  `ftp_username` varchar(50) NOT NULL,
  `ftp_password` varchar(50) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Triggers `export_portal`
--
DROP TRIGGER IF EXISTS `export_portal_modified`;
DELIMITER //
CREATE TRIGGER `export_portal_modified` BEFORE UPDATE ON `export_portal`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `export_portal_agency`
--

CREATE TABLE IF NOT EXISTS `export_portal_agency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `export_portal_id` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `agency_identifier` varchar(50) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `export_portal_id` (`export_portal_id`,`agency_id`),
  KEY `agency_id` (`agency_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Triggers `export_portal_agency`
--
DROP TRIGGER IF EXISTS `export_portal_agency_modified`;
DELIMITER //
CREATE TRIGGER `export_portal_agency_modified` BEFORE UPDATE ON `export_portal_agency`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `export_portal_listing`
--

CREATE TABLE IF NOT EXISTS `export_portal_listing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `export_portal_agency_id` int(11) unsigned NOT NULL,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_export_status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `exported` timestamp NULL DEFAULT NULL,
  `listing_identifier` varchar(50) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `export_portal_agency_id` (`export_portal_agency_id`,`listing_id`),
  KEY `listing_id` (`listing_id`),
  KEY `listing_export_status_code` (`listing_export_status_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1747 ;

--
-- Triggers `export_portal_listing`
--
DROP TRIGGER IF EXISTS `export_portal_listing_modified`;
DELIMITER //
CREATE TRIGGER `export_portal_listing_modified` BEFORE UPDATE ON `export_portal_listing`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `feature_cross_over_type_code`
--

CREATE TABLE IF NOT EXISTS `feature_cross_over_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feature_heating_type_code`
--

CREATE TABLE IF NOT EXISTS `feature_heating_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `feature_hot_water_service_type_code`
--

CREATE TABLE IF NOT EXISTS `feature_hot_water_service_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `frequency_code`
--

CREATE TABLE IF NOT EXISTS `frequency_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_accuracy_code`
--

CREATE TABLE IF NOT EXISTS `geo_accuracy_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_source_code`
--

CREATE TABLE IF NOT EXISTS `geo_source_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_code_translation`
--

CREATE TABLE IF NOT EXISTS `l10n_code_translation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`,`model`,`code`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_manager_translation`
--

CREATE TABLE IF NOT EXISTS `l10n_manager_translation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `language` varchar(5) NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`,`model`,`pk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `l10n_website_translation`
--

CREATE TABLE IF NOT EXISTS `l10n_website_translation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `language` varchar(5) NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk` int(11) unsigned NOT NULL,
  `data` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `language` (`language`,`model`,`pk`),
  KEY `website_id` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `language_code`
--

CREATE TABLE IF NOT EXISTS `language_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `language_spoken`
--

CREATE TABLE IF NOT EXISTS `language_spoken` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing`
--

CREATE TABLE IF NOT EXISTS `listing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `locality_address_visibility_code` tinyint(3) unsigned NOT NULL,
  `listing_type_code` tinyint(3) unsigned DEFAULT NULL,
  `listing_trade_type_code` tinyint(3) unsigned DEFAULT NULL,
  `listing_market_status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `listing_marketed` timestamp NULL DEFAULT NULL,
  `listing_publish_status_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `listing_published` timestamp NULL DEFAULT NULL,
  `map_publisher_code` tinyint(3) unsigned DEFAULT '0',
  `map_no` smallint(5) unsigned DEFAULT NULL,
  `map_ref` varchar(5) DEFAULT NULL,
  `streetview_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `headline` varchar(150) DEFAULT NULL,
  `summary` text,
  `description` text,
  `hot_property` tinyint(3) unsigned DEFAULT '0',
  `external_reference_id` varchar(50) DEFAULT NULL,
  `external_reference_address` text,
  `plot_id` varchar(25) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`reference_number`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `locality_address_visibility_code` (`locality_address_visibility_code`),
  KEY `listing_type_code` (`listing_type_code`),
  KEY `listing_trade_type_code` (`listing_trade_type_code`),
  KEY `listing_market_status_code` (`listing_market_status_code`),
  KEY `listing_publish_status_code` (`listing_publish_status_code`),
  KEY `map_publisher_code` (`map_publisher_code`),
  KEY `streetview_visibility_code` (`streetview_visibility_code`),
  KEY `status_code` (`status_code`),
  KEY `external_reference_id` (`external_reference_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=2808 ;

--
-- Triggers `listing`
--
DROP TRIGGER IF EXISTS `listing_market_history_log_insert`;
DELIMITER //
CREATE TRIGGER `listing_market_history_log_insert` AFTER INSERT ON `listing`
 FOR EACH ROW BEGIN
INSERT INTO `listing_market_history` (listing_id,listing_market_history_code,listing_marketed) VALUES (NEW.id, NEW.listing_market_status_code, NEW.listing_marketed);
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_market_history_log_update`;
DELIMITER //
CREATE TRIGGER `listing_market_history_log_update` AFTER UPDATE ON `listing`
 FOR EACH ROW BEGIN
IF (OLD.listing_market_status_code <> NEW.listing_market_status_code) THEN
INSERT INTO `listing_market_history` (listing_id,listing_market_history_code,listing_marketed) VALUES (NEW.id, NEW.listing_market_status_code, NEW.listing_marketed);
END IF;
END
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_modified`;
DELIMITER //
CREATE TRIGGER `listing_modified` BEFORE UPDATE ON `listing`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_reference_number`;
DELIMITER //
CREATE TRIGGER `listing_reference_number` BEFORE INSERT ON `listing`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM listing WHERE agency_id = NEW.agency_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_agent`
--

CREATE TABLE IF NOT EXISTS `listing_agent` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `agent_id` int(11) unsigned NOT NULL,
  `commission` decimal(5,2) unsigned DEFAULT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`agent_id`),
  KEY `listing_id_2` (`listing_id`,`agent_id`,`display_order`),
  KEY `agent_id` (`agent_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2792 ;

--
-- Triggers `listing_agent`
--
DROP TRIGGER IF EXISTS `listing_agent_display_order`;
DELIMITER //
CREATE TRIGGER `listing_agent_display_order` BEFORE INSERT ON `listing_agent`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM listing_agent WHERE listing_id = NEW.listing_id)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_agent_modified`;
DELIMITER //
CREATE TRIGGER `listing_agent_modified` BEFORE UPDATE ON `listing_agent`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_asset`
--

CREATE TABLE IF NOT EXISTS `listing_asset` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_asset_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(200) NOT NULL,
  `path_original` varchar(200) NOT NULL,
  `mime_type` varchar(200) NOT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_asset_type_code` (`listing_asset_type_code`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`listing_asset_type_code`,`display_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15461 ;

--
-- Triggers `listing_asset`
--
DROP TRIGGER IF EXISTS `listing_asset_display_order`;
DELIMITER //
CREATE TRIGGER `listing_asset_display_order` BEFORE INSERT ON `listing_asset`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM listing_asset WHERE listing_id = NEW.listing_id AND listing_asset_type_code = NEW.listing_asset_type_code)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_asset_modified`;
DELIMITER //
CREATE TRIGGER `listing_asset_modified` BEFORE UPDATE ON `listing_asset`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_asset_cdn`
--

CREATE TABLE IF NOT EXISTS `listing_asset_cdn` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_asset_id` int(11) unsigned NOT NULL,
  `listing_asset_cdn_host_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_asset_id` (`listing_asset_id`,`listing_asset_cdn_host_id`),
  KEY `listing_asset_cdn_host_id` (`listing_asset_cdn_host_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `listing_asset_cdn`
--
DROP TRIGGER IF EXISTS `listing_asset_cdn_modified`;
DELIMITER //
CREATE TRIGGER `listing_asset_cdn_modified` BEFORE UPDATE ON `listing_asset_cdn`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_asset_cdn_host`
--

CREATE TABLE IF NOT EXISTS `listing_asset_cdn_host` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `listing_asset_cdn_host`
--
DROP TRIGGER IF EXISTS `listing_asset_cdn_host_modified`;
DELIMITER //
CREATE TRIGGER `listing_asset_cdn_host_modified` BEFORE UPDATE ON `listing_asset_cdn_host`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_asset_external`
--

CREATE TABLE IF NOT EXISTS `listing_asset_external` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_asset_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(150) NOT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_asset_type_code` (`listing_asset_type_code`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`listing_asset_type_code`,`display_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=317 ;

--
-- Triggers `listing_asset_external`
--
DROP TRIGGER IF EXISTS `listing_asset_external_display_order`;
DELIMITER //
CREATE TRIGGER `listing_asset_external_display_order` BEFORE INSERT ON `listing_asset_external`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM listing_asset_external WHERE listing_id = NEW.listing_id AND listing_asset_type_code = NEW.listing_asset_type_code)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_asset_external_modified`;
DELIMITER //
CREATE TRIGGER `listing_asset_external_modified` BEFORE UPDATE ON `listing_asset_external`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_asset_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_asset_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_contact`
--

CREATE TABLE IF NOT EXISTS `listing_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `listing_contact_type_code` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`contact_id`,`listing_contact_type_code`),
  KEY `contact_id` (`contact_id`),
  KEY `listing_contact_type_code` (`listing_contact_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `listing_contact`
--
DROP TRIGGER IF EXISTS `listing_contact_modified`;
DELIMITER //
CREATE TRIGGER `listing_contact_modified` BEFORE UPDATE ON `listing_contact`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_contact_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_contact_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_email_friend`
--

CREATE TABLE IF NOT EXISTS `listing_email_friend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_source_code` tinyint(3) unsigned NOT NULL,
  `source_id` int(11) unsigned NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(100) NOT NULL,
  `recipient` text NOT NULL,
  `subject` varchar(150) NOT NULL,
  `message` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_source_code` (`listing_source_code`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`listing_source_code`,`source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=187 ;

--
-- Triggers `listing_email_friend`
--
DROP TRIGGER IF EXISTS `listing_email_friend_modified`;
DELIMITER //
CREATE TRIGGER `listing_email_friend_modified` BEFORE UPDATE ON `listing_email_friend`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_enquiry`
--

CREATE TABLE IF NOT EXISTS `listing_enquiry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned DEFAULT NULL,
  `listing_source_code` tinyint(3) unsigned NOT NULL,
  `source_id` int(11) unsigned NOT NULL,
  `agent_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enquiry` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_source_code` (`listing_source_code`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`listing_source_code`,`source_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=168 ;

--
-- Triggers `listing_enquiry`
--
DROP TRIGGER IF EXISTS `listing_enquiry_modified`;
DELIMITER //
CREATE TRIGGER `listing_enquiry_modified` BEFORE UPDATE ON `listing_enquiry`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_export_status_code`
--

CREATE TABLE IF NOT EXISTS `listing_export_status_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_extent_code`
--

CREATE TABLE IF NOT EXISTS `listing_extent_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_feature`
--

CREATE TABLE IF NOT EXISTS `listing_feature` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_feature_code` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`listing_feature_code`),
  KEY `listing_feature_code` (`listing_feature_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14937 ;

--
-- Triggers `listing_feature`
--
DROP TRIGGER IF EXISTS `listing_feature_modified`;
DELIMITER //
CREATE TRIGGER `listing_feature_modified` BEFORE UPDATE ON `listing_feature`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_feature_code`
--

CREATE TABLE IF NOT EXISTS `listing_feature_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=92 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_hit`
--

CREATE TABLE IF NOT EXISTS `listing_hit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_source_code` tinyint(3) unsigned NOT NULL,
  `source_id` int(11) unsigned NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `audit` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_source_code` (`listing_source_code`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`listing_source_code`,`source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1167860 ;

--
-- Triggers `listing_hit`
--
DROP TRIGGER IF EXISTS `listing_hit_modified`;
DELIMITER //
CREATE TRIGGER `listing_hit_modified` BEFORE UPDATE ON `listing_hit`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_hit_statistics`;
DELIMITER //
CREATE TRIGGER `listing_hit_statistics` AFTER INSERT ON `listing_hit`
 FOR EACH ROW BEGIN
SET @x = NULL;
SELECT id INTO @x FROM `listing_statistics` WHERE listing_id=NEW.listing_id AND source_id=NEW.source_id AND listing_source_code=NEW.listing_source_code LIMIT 1;
IF (@x IS NULL) THEN
 INSERT INTO `listing_statistics` (listing_id, source_id, listing_source_code, hits) VALUES (NEW.listing_id, NEW.source_id, NEW.listing_source_code, 1);
ELSE
 UPDATE `listing_statistics` SET hits=hits+1 WHERE id = @x;
END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_hit_email`
--

CREATE TABLE IF NOT EXISTS `listing_hit_email` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_source_code` tinyint(3) unsigned NOT NULL,
  `source_id` int(11) unsigned NOT NULL,
  `favourites_user_id` int(11) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `audit` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_source_code` (`listing_source_code`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`listing_source_code`,`source_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=514 ;

--
-- Triggers `listing_hit_email`
--
DROP TRIGGER IF EXISTS `listing_hit_email_modified`;
DELIMITER //
CREATE TRIGGER `listing_hit_email_modified` BEFORE UPDATE ON `listing_hit_email`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_hit_email_statistics`;
DELIMITER //
CREATE TRIGGER `listing_hit_email_statistics` AFTER INSERT ON `listing_hit_email`
 FOR EACH ROW BEGIN
SET @x = NULL;
SELECT id INTO @x FROM `listing_statistics` WHERE listing_id=NEW.listing_id AND source_id=NEW.source_id AND listing_source_code=NEW.listing_source_code LIMIT 1;
IF (@x IS NULL) THEN
 INSERT INTO `listing_statistics` (listing_id, source_id, listing_source_code, hits_email) VALUES (NEW.listing_id, NEW.source_id, NEW.listing_source_code, 1);
ELSE
 UPDATE `listing_statistics` SET hits_email=hits_email+1 WHERE id = @x;
END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_ideal`
--

CREATE TABLE IF NOT EXISTS `listing_ideal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_ideal_code` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`listing_ideal_code`),
  KEY `listing_ideal_code` (`listing_ideal_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Triggers `listing_ideal`
--
DROP TRIGGER IF EXISTS `listing_ideal_modified`;
DELIMITER //
CREATE TRIGGER `listing_ideal_modified` BEFORE UPDATE ON `listing_ideal`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_ideal_code`
--

CREATE TABLE IF NOT EXISTS `listing_ideal_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_inspection`
--

CREATE TABLE IF NOT EXISTS `listing_inspection` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `scheduled_from` timestamp NULL DEFAULT NULL,
  `scheduled_to` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5394 ;

--
-- Triggers `listing_inspection`
--
DROP TRIGGER IF EXISTS `listing_inspection_modified`;
DELIMITER //
CREATE TRIGGER `listing_inspection_modified` BEFORE UPDATE ON `listing_inspection`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_land_code`
--

CREATE TABLE IF NOT EXISTS `listing_land_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_link`
--

CREATE TABLE IF NOT EXISTS `listing_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `url` varchar(150) NOT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`),
  KEY `listing_id` (`listing_id`,`display_order`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Triggers `listing_link`
--
DROP TRIGGER IF EXISTS `listing_link_display_order`;
DELIMITER //
CREATE TRIGGER `listing_link_display_order` BEFORE INSERT ON `listing_link`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM listing_link WHERE listing_id = NEW.listing_id)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `listing_link_modified`;
DELIMITER //
CREATE TRIGGER `listing_link_modified` BEFORE UPDATE ON `listing_link`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_log`
--

CREATE TABLE IF NOT EXISTS `listing_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk_id` int(11) unsigned DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `model_backup` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manager_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_id` (`manager_user_id`),
  KEY `model` (`model`,`pk_id`,`action`),
  KEY `model_2` (`model`,`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_market_history`
--

CREATE TABLE IF NOT EXISTS `listing_market_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_market_history_code` tinyint(3) unsigned NOT NULL,
  `listing_marketed` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  KEY `listing_market_history_code` (`listing_market_history_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=3350 ;

--
-- Triggers `listing_market_history`
--
DROP TRIGGER IF EXISTS `listing_market_history_modified`;
DELIMITER //
CREATE TRIGGER `listing_market_history_modified` BEFORE UPDATE ON `listing_market_history`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_market_history_code`
--

CREATE TABLE IF NOT EXISTS `listing_market_history_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_market_status_code`
--

CREATE TABLE IF NOT EXISTS `listing_market_status_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_publish_status_code`
--

CREATE TABLE IF NOT EXISTS `listing_publish_status_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_source_code`
--

CREATE TABLE IF NOT EXISTS `listing_source_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_statistics`
--

CREATE TABLE IF NOT EXISTS `listing_statistics` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_source_code` tinyint(3) unsigned NOT NULL,
  `source_id` int(11) unsigned NOT NULL,
  `hits` int(11) unsigned NOT NULL DEFAULT '0',
  `hits_email` int(11) unsigned NOT NULL DEFAULT '0',
  `enquiries` int(11) unsigned NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`listing_source_code`,`source_id`),
  KEY `listing_source_code` (`listing_source_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2568 ;

--
-- Triggers `listing_statistics`
--
DROP TRIGGER IF EXISTS `listing_statistics_modified`;
DELIMITER //
CREATE TRIGGER `listing_statistics_modified` BEFORE UPDATE ON `listing_statistics`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_text`
--

CREATE TABLE IF NOT EXISTS `listing_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_text_type_code` tinyint(3) unsigned NOT NULL,
  `language` varchar(5) NOT NULL,
  `listing_text` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`listing_text_type_code`,`language`),
  KEY `listing_text_type_code` (`listing_text_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `listing_text`
--
DROP TRIGGER IF EXISTS `listing_text_modified`;
DELIMITER //
CREATE TRIGGER `listing_text_modified` BEFORE UPDATE ON `listing_text`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_text_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_text_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_business`
--

CREATE TABLE IF NOT EXISTS `listing_trade_business` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_trade_business_property_type_code` tinyint(3) unsigned DEFAULT NULL,
  `listing_trade_business_sub_type_code` tinyint(3) unsigned DEFAULT NULL,
  `building_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area_display_unit_code` tinyint(3) unsigned DEFAULT '1',
  `land_frontage` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_left` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_right` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_rear` decimal(10,2) unsigned DEFAULT NULL,
  `car_space` smallint(5) unsigned DEFAULT NULL,
  `age` smallint(5) unsigned DEFAULT NULL,
  `zoning` varchar(100) DEFAULT NULL,
  `energy_rating` float unsigned DEFAULT NULL,
  `water_rates` varchar(100) DEFAULT NULL,
  `council_rates` varchar(100) DEFAULT NULL,
  `strata_levies` varchar(100) DEFAULT NULL,
  `land_tax` varchar(100) DEFAULT NULL,
  `insurance` varchar(100) DEFAULT NULL,
  `takings` varchar(100) DEFAULT NULL,
  `strata_agent` varchar(100) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `terms` varchar(300) DEFAULT NULL,
  `franchise` tinyint(1) NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  KEY `listing_trade_business_property_type_code` (`listing_trade_business_property_type_code`),
  KEY `land_area_display_unit_code` (`land_area_display_unit_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_business_property_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_trade_business_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `table` varchar(50) NOT NULL,
  `relation` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_commercial`
--

CREATE TABLE IF NOT EXISTS `listing_trade_commercial` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_trade_commercial_property_type_code` tinyint(3) unsigned DEFAULT NULL,
  `listing_extent_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `building_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area_display_unit_code` tinyint(3) unsigned DEFAULT '1',
  `land_frontage` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_left` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_right` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_rear` decimal(10,2) unsigned DEFAULT NULL,
  `feature_cross_over_type_code` tinyint(3) unsigned DEFAULT NULL,
  `tenanted_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `car_space` smallint(5) unsigned DEFAULT NULL,
  `parking_comments` varchar(255) DEFAULT NULL,
  `age` smallint(5) unsigned DEFAULT NULL,
  `zoning` varchar(100) DEFAULT NULL,
  `energy_rating` float unsigned DEFAULT NULL,
  `water_rates` varchar(100) DEFAULT NULL,
  `council_rates` varchar(100) DEFAULT NULL,
  `strata_levies` varchar(100) DEFAULT NULL,
  `land_tax` varchar(100) DEFAULT NULL,
  `insurance` varchar(100) DEFAULT NULL,
  `outgoings` int(11) unsigned DEFAULT NULL,
  `strata_agent` varchar(100) DEFAULT NULL,
  `site` varchar(50) DEFAULT NULL,
  `estate` varchar(100) DEFAULT NULL,
  `stage` varchar(15) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  KEY `listing_trade_commercial_property_type_code` (`listing_trade_commercial_property_type_code`),
  KEY `land_area_display_unit_code` (`land_area_display_unit_code`),
  KEY `status_code` (`status_code`),
  KEY `feature_cross_over_type_code` (`feature_cross_over_type_code`),
  KEY `listing_extent_code` (`listing_extent_code`),
  KEY `tenanted_code` (`tenanted_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_commercial_property_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_trade_commercial_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_holiday`
--

CREATE TABLE IF NOT EXISTS `listing_trade_holiday` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_trade_holiday_property_type_code` tinyint(3) unsigned DEFAULT NULL,
  `feature_hot_water_service_type_code` tinyint(3) unsigned DEFAULT NULL,
  `feature_heating_type_code` tinyint(3) unsigned DEFAULT NULL,
  `bed` smallint(5) unsigned DEFAULT NULL,
  `bath` smallint(5) unsigned DEFAULT NULL,
  `garage` smallint(5) unsigned DEFAULT NULL,
  `car_port` smallint(5) unsigned DEFAULT NULL,
  `building_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area_display_unit_code` tinyint(3) unsigned DEFAULT '1',
  `land_frontage` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_left` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_right` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_rear` decimal(10,2) unsigned DEFAULT NULL,
  `age` smallint(5) unsigned DEFAULT NULL,
  `zoning` varchar(100) DEFAULT NULL,
  `energy_rating` float unsigned DEFAULT NULL,
  `water_rates` varchar(100) DEFAULT NULL,
  `council_rates` varchar(100) DEFAULT NULL,
  `strata_levies` varchar(100) DEFAULT NULL,
  `land_tax` varchar(100) DEFAULT NULL,
  `insurance` varchar(100) DEFAULT NULL,
  `strata_agent` varchar(100) DEFAULT NULL,
  `url_availability` varchar(150) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  KEY `listing_trade_holiday_property_type_code` (`listing_trade_holiday_property_type_code`),
  KEY `land_area_display_unit_code` (`land_area_display_unit_code`),
  KEY `status_code` (`status_code`),
  KEY `feature_heating_type_code` (`feature_heating_type_code`),
  KEY `feature_hot_water_service_type_code` (`feature_hot_water_service_type_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_holiday_property_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_trade_holiday_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_residential`
--

CREATE TABLE IF NOT EXISTS `listing_trade_residential` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_trade_residential_property_type_code` tinyint(3) unsigned DEFAULT NULL,
  `bed` smallint(5) unsigned DEFAULT NULL,
  `bath` smallint(5) unsigned DEFAULT NULL,
  `ensuite` smallint(5) unsigned DEFAULT NULL,
  `car` smallint(5) unsigned DEFAULT NULL,
  `garage` smallint(5) unsigned DEFAULT NULL,
  `car_port` smallint(5) unsigned DEFAULT NULL,
  `car_space` smallint(5) unsigned DEFAULT NULL,
  `energy_rating` float unsigned DEFAULT NULL,
  `building_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area` decimal(10,2) unsigned DEFAULT NULL,
  `land_area_display_unit_code` tinyint(3) unsigned DEFAULT '1',
  `land_frontage` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_left` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_right` decimal(10,2) unsigned DEFAULT NULL,
  `land_depth_rear` decimal(10,2) unsigned DEFAULT NULL,
  `age` smallint(5) unsigned DEFAULT NULL,
  `zoning` varchar(100) DEFAULT NULL,
  `water_rates` varchar(100) DEFAULT NULL,
  `council_rates` varchar(100) DEFAULT NULL,
  `strata_levies` varchar(100) DEFAULT NULL,
  `land_tax` varchar(100) DEFAULT NULL,
  `insurance` varchar(100) DEFAULT NULL,
  `strata_agent` varchar(100) DEFAULT NULL,
  `new_construction` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `listing_land_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `estate` varchar(100) DEFAULT NULL,
  `stage` varchar(15) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  UNIQUE KEY `listing_id_2` (`listing_id`),
  KEY `listing_trade_residential_property_type_code` (`listing_trade_residential_property_type_code`),
  KEY `land_area_display_unit_code` (`land_area_display_unit_code`),
  KEY `listing_land_code` (`listing_land_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2714 ;

--
-- Triggers `listing_trade_residential`
--
DROP TRIGGER IF EXISTS `listing_trade_residential_modified`;
DELIMITER //
CREATE TRIGGER `listing_trade_residential_modified` BEFORE UPDATE ON `listing_trade_residential`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_residential_property_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_trade_residential_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_rural`
--

CREATE TABLE IF NOT EXISTS `listing_trade_rural` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_trade_rural_property_type_code` tinyint(3) unsigned DEFAULT NULL,
  `bed` smallint(5) unsigned DEFAULT NULL,
  `bath` smallint(5) unsigned DEFAULT NULL,
  `ensuite` smallint(5) unsigned DEFAULT NULL,
  `car` smallint(5) unsigned DEFAULT NULL,
  `garage` smallint(5) unsigned DEFAULT NULL,
  `car_port` smallint(5) unsigned DEFAULT NULL,
  `car_space` smallint(5) unsigned DEFAULT NULL,
  `energy_rating` float unsigned DEFAULT NULL,
  `building_area` float unsigned DEFAULT NULL,
  `land_area` float unsigned DEFAULT NULL,
  `land_area_display_unit_code` tinyint(3) unsigned DEFAULT '1',
  `land_frontage` float unsigned DEFAULT NULL,
  `land_depth_left` float unsigned DEFAULT NULL,
  `land_depth_right` float unsigned DEFAULT NULL,
  `land_depth_rear` float unsigned DEFAULT NULL,
  `feature_cross_over_type_code` tinyint(3) unsigned DEFAULT '1',
  `feature_hot_water_service_type_code` tinyint(3) unsigned DEFAULT '1',
  `feature_heating_type_code` tinyint(3) unsigned DEFAULT '1',
  `fencing` text,
  `services` text,
  `carrying_capacity` text,
  `irrigation` text,
  `improvements` text,
  `soil_types` text,
  `annual_rainfall` text,
  `council_rates` varchar(100) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  KEY `listing_trade_rural_property_type_code` (`listing_trade_rural_property_type_code`),
  KEY `land_area_display_unit_code` (`land_area_display_unit_code`),
  KEY `feature_heating_type_code` (`feature_heating_type_code`),
  KEY `feature_hot_water_service_type_code` (`feature_hot_water_service_type_code`),
  KEY `feature_cross_over_type_code` (`feature_cross_over_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Triggers `listing_trade_rural`
--
DROP TRIGGER IF EXISTS `listing_trade_rural_modified`;
DELIMITER //
CREATE TRIGGER `listing_trade_rural_modified` BEFORE UPDATE ON `listing_trade_rural`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_rural_property_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_trade_rural_property_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_trade_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_trade_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `table` varchar(50) NOT NULL,
  `relation` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_type_auction`
--

CREATE TABLE IF NOT EXISTS `listing_type_auction` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `price_display` varchar(50) DEFAULT NULL,
  `price_numeric` int(11) unsigned DEFAULT NULL,
  `price_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `price_search_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_search_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_sold_display` varchar(50) DEFAULT NULL,
  `price_sold_numeric` int(11) unsigned DEFAULT NULL,
  `price_sold_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sold_type_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price_vendor_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_vendor_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_agent_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_agent_numeric_to` int(11) unsigned DEFAULT NULL,
  `commission_type_code` tinyint(3) unsigned DEFAULT NULL,
  `commission` float unsigned DEFAULT NULL,
  `price_potential_rent_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_potential_rent_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_lease_numeric` int(11) unsigned DEFAULT NULL,
  `price_lease_duration_code` tinyint(3) unsigned DEFAULT '1',
  `lease_expiry` timestamp NULL DEFAULT NULL,
  `lease_expiry_reminder` tinyint(1) DEFAULT '0',
  `agency_agreement_type_code` tinyint(3) unsigned DEFAULT '1',
  `agency_agreement_note` text,
  `auction_status_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `auction_from` timestamp NULL DEFAULT NULL,
  `auction_location` text,
  `note` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  KEY `price_visibility_code` (`price_visibility_code`),
  KEY `price_sold_visibility_code` (`price_sold_visibility_code`),
  KEY `sold_type_code` (`sold_type_code`),
  KEY `commission_type_code` (`commission_type_code`),
  KEY `price_lease_duration_code` (`price_lease_duration_code`),
  KEY `agency_agreement_type_code` (`agency_agreement_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=723 ;

--
-- Triggers `listing_type_auction`
--
DROP TRIGGER IF EXISTS `listing_type_auction_modified`;
DELIMITER //
CREATE TRIGGER `listing_type_auction_modified` BEFORE UPDATE ON `listing_type_auction`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_type_code`
--

CREATE TABLE IF NOT EXISTS `listing_type_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `table` varchar(50) NOT NULL,
  `relation` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_type_lease`
--

CREATE TABLE IF NOT EXISTS `listing_type_lease` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `price_display` varchar(50) DEFAULT NULL,
  `price_numeric` int(11) unsigned DEFAULT NULL,
  `price_duration_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `price_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `price_search_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_search_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_leased_display` varchar(50) DEFAULT NULL,
  `price_leased_numeric` int(11) unsigned DEFAULT NULL,
  `price_leased_duration_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `price_leased_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `price_landlord_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_landlord_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_landlord_duration_code` tinyint(3) unsigned DEFAULT '1',
  `price_agent_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_agent_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_agent_duration_code` tinyint(3) unsigned DEFAULT '1',
  `commission_type_code` tinyint(3) unsigned DEFAULT NULL,
  `commission` float unsigned DEFAULT NULL,
  `bond` int(11) unsigned DEFAULT NULL,
  `lease_period` varchar(100) DEFAULT NULL,
  `lease_available` timestamp NULL DEFAULT NULL,
  `lease_expiry` timestamp NULL DEFAULT NULL,
  `lease_expiry_reminder` tinyint(1) DEFAULT '0',
  `agency_agreement_type_code` tinyint(3) unsigned DEFAULT '1',
  `agency_agreement_note` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  KEY `price_duration_code` (`price_duration_code`),
  KEY `price_visibility_code` (`price_visibility_code`),
  KEY `price_leased_duration_code` (`price_leased_duration_code`),
  KEY `price_leased_visibility_code` (`price_leased_visibility_code`),
  KEY `price_landlord_duration_code` (`price_landlord_duration_code`),
  KEY `price_agent_duration_code` (`price_agent_duration_code`),
  KEY `commission_type_code` (`commission_type_code`),
  KEY `agency_agreement_type_code` (`agency_agreement_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=666 ;

--
-- Triggers `listing_type_lease`
--
DROP TRIGGER IF EXISTS `listing_type_lease_modified`;
DELIMITER //
CREATE TRIGGER `listing_type_lease_modified` BEFORE UPDATE ON `listing_type_lease`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_type_sale`
--

CREATE TABLE IF NOT EXISTS `listing_type_sale` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `price_display` varchar(50) DEFAULT NULL,
  `price_numeric` int(11) unsigned DEFAULT NULL,
  `price_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `price_search_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_search_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_sold_display` varchar(50) DEFAULT NULL,
  `price_sold_numeric` int(11) unsigned DEFAULT NULL,
  `price_sold_visibility_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sold_type_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `price_vendor_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_vendor_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_agent_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_agent_numeric_to` int(11) unsigned DEFAULT NULL,
  `commission_type_code` tinyint(3) unsigned DEFAULT NULL,
  `commission` float unsigned DEFAULT NULL,
  `price_potential_rent_numeric_from` int(11) unsigned DEFAULT NULL,
  `price_potential_rent_numeric_to` int(11) unsigned DEFAULT NULL,
  `price_lease_numeric` int(11) unsigned DEFAULT NULL,
  `price_lease_duration_code` tinyint(3) unsigned DEFAULT '1',
  `lease_expiry` timestamp NULL DEFAULT NULL,
  `lease_expiry_reminder` tinyint(1) DEFAULT '0',
  `agency_agreement_type_code` tinyint(3) unsigned DEFAULT '1',
  `agency_agreement_note` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`),
  KEY `price_visibility_code` (`price_visibility_code`),
  KEY `price_sold_visibility_code` (`price_sold_visibility_code`),
  KEY `sold_type_code` (`sold_type_code`),
  KEY `commission_type_code` (`commission_type_code`),
  KEY `price_lease_duration_code` (`price_lease_duration_code`),
  KEY `agency_agreement_type_code` (`agency_agreement_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1396 ;

--
-- Triggers `listing_type_sale`
--
DROP TRIGGER IF EXISTS `listing_type_sale_modified`;
DELIMITER //
CREATE TRIGGER `listing_type_sale_modified` BEFORE UPDATE ON `listing_type_sale`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_views`
--

CREATE TABLE IF NOT EXISTS `listing_views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `listing_views_code` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `listing_id` (`listing_id`,`listing_views_code`),
  KEY `listing_views_code` (`listing_views_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Triggers `listing_views`
--
DROP TRIGGER IF EXISTS `listing_views_modified`;
DELIMITER //
CREATE TRIGGER `listing_views_modified` BEFORE UPDATE ON `listing_views`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `listing_views_code`
--

CREATE TABLE IF NOT EXISTS `listing_views_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_address`
--

CREATE TABLE IF NOT EXISTS `locality_address` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(150) NOT NULL,
  `url` varchar(150) DEFAULT NULL,
  `lot_number` varchar(15) DEFAULT NULL,
  `sub_number` varchar(15) DEFAULT NULL,
  `unit_number` varchar(15) DEFAULT NULL,
  `street_number` varchar(15) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `locality_street_id` int(11) unsigned DEFAULT NULL,
  `locality_street_type_id` tinyint(3) unsigned DEFAULT NULL,
  `locality_suburb_id` int(11) unsigned DEFAULT NULL,
  `locality_region_id` int(11) unsigned DEFAULT NULL,
  `locality_state_id` int(11) unsigned DEFAULT NULL,
  `locality_council_id` int(11) unsigned DEFAULT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `locality_street_id` (`locality_street_id`),
  KEY `locality_council_id` (`locality_council_id`),
  KEY `locality_state_id` (`locality_state_id`),
  KEY `locality_region_id` (`locality_region_id`),
  KEY `locality_suburb_id` (`locality_suburb_id`),
  KEY `locality_street_type_id` (`locality_street_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2555 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_address_visibility_code`
--

CREATE TABLE IF NOT EXISTS `locality_address_visibility_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `locality_area`
--

CREATE TABLE IF NOT EXISTS `locality_area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `area` varchar(50) NOT NULL,
  `locality_state_id` int(11) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `area` (`area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_city`
--

CREATE TABLE IF NOT EXISTS `locality_city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `locality_state_id` int(11) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`,`locality_state_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_council`
--

CREATE TABLE IF NOT EXISTS `locality_council` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `council` varchar(50) NOT NULL,
  `locality_state_id` int(11) unsigned NOT NULL,
  `locality_area_id` int(11) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `param` varchar(50) NOT NULL,
  `label` varchar(150) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `council` (`council`,`locality_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_council_text`
--

CREATE TABLE IF NOT EXISTS `locality_council_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `label` (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_country`
--

CREATE TABLE IF NOT EXISTS `locality_country` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `country_abbr` varchar(3) NOT NULL,
  `url` varchar(3) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country` (`country`),
  UNIQUE KEY `country_abbr` (`country_abbr`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_region`
--

CREATE TABLE IF NOT EXISTS `locality_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `region` varchar(50) NOT NULL,
  `locality_state_id` int(11) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `region` (`region`,`locality_state_id`),
  UNIQUE KEY `url` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_state`
--

CREATE TABLE IF NOT EXISTS `locality_state` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  `state_abbr` varchar(3) NOT NULL,
  `url` varchar(3) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `gmt_offset` tinyint(3) unsigned DEFAULT '0',
  `locality_country_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `state` (`state`),
  UNIQUE KEY `state_abbr` (`state_abbr`),
  UNIQUE KEY `url` (`url`),
  KEY `locality_country_id` (`locality_country_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_street`
--

CREATE TABLE IF NOT EXISTS `locality_street` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `street` varchar(50) NOT NULL,
  `locality_street_type_id` tinyint(3) unsigned NOT NULL,
  `locality_suburb_id` int(11) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `param` varchar(50) NOT NULL,
  `label` varchar(150) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `street` (`street`,`locality_street_type_id`,`locality_suburb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_street_text`
--

CREATE TABLE IF NOT EXISTS `locality_street_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `label` (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_street_type`
--

CREATE TABLE IF NOT EXISTS `locality_street_type` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `is_common` tinyint(1) NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=203 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_street_type_alias`
--

CREATE TABLE IF NOT EXISTS `locality_street_type_alias` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `locality_street_type_id` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_suburb`
--

CREATE TABLE IF NOT EXISTS `locality_suburb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `suburb` varchar(50) NOT NULL,
  `postcode` varchar(4) NOT NULL,
  `locality_state_id` int(11) unsigned NOT NULL,
  `locality_area_id` int(11) unsigned NOT NULL,
  `url` varchar(50) NOT NULL,
  `param` varchar(50) NOT NULL,
  `label` varchar(150) NOT NULL,
  `latitude` decimal(18,15) DEFAULT NULL,
  `longitude` decimal(18,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `boundary` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `suburb` (`suburb`,`postcode`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15971 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_suburb_region`
--

CREATE TABLE IF NOT EXISTS `locality_suburb_region` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `locality_suburb_id` int(11) unsigned NOT NULL,
  `locality_region_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locality_suburb_id` (`locality_suburb_id`,`locality_region_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_suburb_surrounding`
--

CREATE TABLE IF NOT EXISTS `locality_suburb_surrounding` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `locality_suburb_id` int(11) unsigned NOT NULL,
  `surrounding_locality_suburb_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locality_suburb_id` (`locality_suburb_id`,`surrounding_locality_suburb_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_suburb_text`
--

CREATE TABLE IF NOT EXISTS `locality_suburb_text` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `label` (`label`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `locality_type_code`
--

CREATE TABLE IF NOT EXISTS `locality_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_log`
--

CREATE TABLE IF NOT EXISTS `manager_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk_id` int(11) unsigned DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `model_backup` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manager_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_id` (`manager_user_id`),
  KEY `model` (`model`,`pk_id`,`action`),
  KEY `model_2` (`model`,`pk_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27976 ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user`
--

CREATE TABLE IF NOT EXISTS `manager_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `display_name` varchar(100) NOT NULL,
  `display_abbr` varchar(4) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `position` varchar(75) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `photo_path` varchar(200) NOT NULL,
  `photo_path_original` varchar(200) NOT NULL,
  `timezone_code` tinyint(3) unsigned NOT NULL DEFAULT '31',
  `colour` varchar(7) NOT NULL DEFAULT '#cccccc',
  `session_hash` varchar(128) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `agreement` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`reference_number`),
  UNIQUE KEY `username` (`username`),
  KEY `salutation_code` (`salutation_code`),
  KEY `timezone_code` (`timezone_code`),
  KEY `status_code` (`status_code`),
  KEY `username_2` (`username`,`password`,`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=23 ;

--
-- Triggers `manager_user`
--
DROP TRIGGER IF EXISTS `manager_user_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_modified` BEFORE UPDATE ON `manager_user`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `manager_user_reference_number`;
DELIMITER //
CREATE TRIGGER `manager_user_reference_number` BEFORE INSERT ON `manager_user`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM manager_user WHERE agency_id = NEW.agency_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_agreement`
--

CREATE TABLE IF NOT EXISTS `manager_user_agreement` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(200) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_user_agreement`
--
DROP TRIGGER IF EXISTS `manager_user_agreement_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_agreement_modified` BEFORE UPDATE ON `manager_user_agreement`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `manager_user_auth_assignment` (
  `itemname` varchar(64) NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`itemname`,`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_auth_item`
--

CREATE TABLE IF NOT EXISTS `manager_user_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `bizrule` text,
  `data` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `manager_user_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_auth_rights`
--

CREATE TABLE IF NOT EXISTS `manager_user_auth_rights` (
  `itemname` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_location`
--

CREATE TABLE IF NOT EXISTS `manager_user_location` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manager_user_id` int(11) unsigned NOT NULL,
  `latitude` decimal(20,15) DEFAULT NULL,
  `longitude` decimal(20,15) DEFAULT NULL,
  `point` geometry DEFAULT NULL,
  `geo_source_code` tinyint(3) unsigned DEFAULT NULL,
  `geo_accuracy_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `geo_source_code` (`geo_source_code`),
  KEY `geo_accuracy_code` (`geo_accuracy_code`),
  KEY `status_code` (`status_code`),
  KEY `manager_user_id` (`manager_user_id`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_user_location`
--
DROP TRIGGER IF EXISTS `manager_user_location_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_location_modified` BEFORE UPDATE ON `manager_user_location`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_login_log`
--

CREATE TABLE IF NOT EXISTS `manager_user_login_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_user_id` int(10) unsigned DEFAULT NULL,
  `username` varchar(100) NOT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `audit` text,
  `authenticated` tinyint(1) NOT NULL DEFAULT '0',
  `logged` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `manager_user_id` (`manager_user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3021 ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_reminder`
--

CREATE TABLE IF NOT EXISTS `manager_user_reminder` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `manager_user_id` int(11) unsigned NOT NULL,
  `manager_user_task_id` int(11) unsigned NOT NULL,
  `manager_user_reminder_type_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `remind_from` timestamp NULL DEFAULT NULL,
  `remind_to` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_user_id` (`manager_user_id`,`reference_number`),
  KEY `manager_user_task_id` (`manager_user_task_id`),
  KEY `manager_user_reminder_type_code` (`manager_user_reminder_type_code`),
  KEY `status_code` (`status_code`),
  KEY `manager_user_id_2` (`manager_user_id`,`manager_user_reminder_type_code`,`remind_from`,`remind_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_user_reminder`
--
DROP TRIGGER IF EXISTS `manager_user_reminder_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_reminder_modified` BEFORE UPDATE ON `manager_user_reminder`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `manager_user_reminder_reference_number`;
DELIMITER //
CREATE TRIGGER `manager_user_reminder_reference_number` BEFORE INSERT ON `manager_user_reminder`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM manager_user_reminder WHERE manager_user_id = NEW.manager_user_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_reminder_interval`
--

CREATE TABLE IF NOT EXISTS `manager_user_reminder_interval` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manager_user_reminder_id` int(11) unsigned NOT NULL,
  `remind_interval` int(11) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_reminder_id` (`manager_user_reminder_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_user_reminder_interval`
--
DROP TRIGGER IF EXISTS `manager_user_reminder_interval_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_reminder_interval_modified` BEFORE UPDATE ON `manager_user_reminder_interval`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_reminder_type_code`
--

CREATE TABLE IF NOT EXISTS `manager_user_reminder_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_task`
--

CREATE TABLE IF NOT EXISTS `manager_user_task` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `manager_user_id` int(11) unsigned NOT NULL,
  `manager_user_task_type_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `scheduled_all_day` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `scheduled_from` timestamp NULL DEFAULT NULL,
  `scheduled_to` timestamp NULL DEFAULT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `completed` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_user_id` (`manager_user_id`,`reference_number`),
  KEY `manager_user_task_type_code` (`manager_user_task_type_code`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `status_code` (`status_code`),
  KEY `manager_user_id_2` (`manager_user_id`,`scheduled_from`,`scheduled_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_user_task`
--
DROP TRIGGER IF EXISTS `manager_user_task_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_task_modified` BEFORE UPDATE ON `manager_user_task`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `manager_user_task_reference_number`;
DELIMITER //
CREATE TRIGGER `manager_user_task_reference_number` BEFORE INSERT ON `manager_user_task`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM manager_user_task WHERE manager_user_id = NEW.manager_user_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_task_contact`
--

CREATE TABLE IF NOT EXISTS `manager_user_task_contact` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manager_user_task_id` int(11) unsigned NOT NULL,
  `contact_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_task_id` (`manager_user_task_id`),
  KEY `contact_id` (`contact_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_user_task_contact`
--
DROP TRIGGER IF EXISTS `manager_user_task_contact_modified`;
DELIMITER //
CREATE TRIGGER `manager_user_task_contact_modified` BEFORE UPDATE ON `manager_user_task_contact`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `manager_user_task_type_code`
--

CREATE TABLE IF NOT EXISTS `manager_user_task_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `colour` varchar(7) NOT NULL DEFAULT '#cccccc',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `manager_video`
--

CREATE TABLE IF NOT EXISTS `manager_video` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(200) NOT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `manager_video`
--
DROP TRIGGER IF EXISTS `manager_video_display_order`;
DELIMITER //
CREATE TRIGGER `manager_video_display_order` BEFORE INSERT ON `manager_video`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM manager_video )
//
DELIMITER ;
DROP TRIGGER IF EXISTS `manager_video_modified`;
DELIMITER //
CREATE TRIGGER `manager_video_modified` BEFORE UPDATE ON `manager_video`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `map_publisher_code`
--

CREATE TABLE IF NOT EXISTS `map_publisher_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `market_appraisal`
--

CREATE TABLE IF NOT EXISTS `market_appraisal` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `home_phone` varchar(50) NOT NULL,
  `work_phone` varchar(50) NOT NULL,
  `appraisal_type` enum('rent','sale') DEFAULT 'sale',
  `email` varchar(100) NOT NULL,
  `property_address` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `residential_address` varchar(255) NOT NULL,
  `additional_information` varchar(255) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=89 ;

-- --------------------------------------------------------

--
-- Table structure for table `misc_browser_code`
--

CREATE TABLE IF NOT EXISTS `misc_browser_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `misc_os_code`
--

CREATE TABLE IF NOT EXISTS `misc_os_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `new_development`
--

CREATE TABLE IF NOT EXISTS `new_development` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `reference_number` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `heading` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `developer_logo` varchar(250) DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `agency_id` (`agency_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Triggers `new_development`
--
DROP TRIGGER IF EXISTS `new_development_modified`;
DELIMITER //
CREATE TRIGGER `new_development_modified` BEFORE UPDATE ON `new_development`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `new_development_reference_number`;
DELIMITER //
CREATE TRIGGER `new_development_reference_number` BEFORE INSERT ON `new_development`
 FOR EACH ROW SET NEW.reference_number = (SELECT IFNULL(MAX(reference_number)+1,1) FROM new_development WHERE agency_id = NEW.agency_id)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `new_development_asset`
--

CREATE TABLE IF NOT EXISTS `new_development_asset` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `new_development_id` int(11) unsigned NOT NULL,
  `listing_asset_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(200) NOT NULL,
  `path_original` varchar(200) NOT NULL,
  `mime_type` varchar(200) NOT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_asset_type_code` (`listing_asset_type_code`),
  KEY `status_code` (`status_code`),
  KEY `new_development_id` (`new_development_id`,`listing_asset_type_code`,`display_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `new_development_asset`
--
DROP TRIGGER IF EXISTS `new_development_asset_display_order`;
DELIMITER //
CREATE TRIGGER `new_development_asset_display_order` BEFORE INSERT ON `new_development_asset`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM new_development_asset WHERE new_development_id = NEW.new_development_id AND listing_asset_type_code = NEW.listing_asset_type_code)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `new_development_asset_modified`;
DELIMITER //
CREATE TRIGGER `new_development_asset_modified` BEFORE UPDATE ON `new_development_asset`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `new_development_listing`
--

CREATE TABLE IF NOT EXISTS `new_development_listing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `listing_id` int(11) unsigned NOT NULL,
  `new_development_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listing_id` (`listing_id`),
  KEY `new_development_id` (`new_development_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `new_development_listing`
--
DROP TRIGGER IF EXISTS `new_development_listing_modified`;
DELIMITER //
CREATE TRIGGER `new_development_listing_modified` BEFORE UPDATE ON `new_development_listing`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal`
--

CREATE TABLE IF NOT EXISTS `portal` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_config_locality_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `portal_config_url_format_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `portal_name` varchar(150) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `portal_url` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `setup` text,
  `menu_config` text,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `api_key_google` varchar(150) DEFAULT NULL,
  `api_key_walkscore` varchar(150) DEFAULT NULL,
  `email_default` varchar(100) NOT NULL,
  `email_helpdesk` varchar(100) DEFAULT NULL,
  `email_subscribe` varchar(100) DEFAULT NULL,
  `email_import` varchar(100) DEFAULT NULL,
  `email_export` varchar(100) DEFAULT NULL,
  `email_alert` varchar(100) DEFAULT NULL,
  `url_www` varchar(150) NOT NULL,
  `url_static` varchar(150) DEFAULT NULL,
  `url_mobile` varchar(150) DEFAULT NULL,
  `url_facebook` varchar(150) DEFAULT NULL,
  `url_twitter` varchar(150) DEFAULT NULL,
  `analytics_www` varchar(150) DEFAULT NULL,
  `analytics_mobile` varchar(150) DEFAULT NULL,
  `allow_import` tinyint(1) NOT NULL DEFAULT '0',
  `allow_export` tinyint(1) NOT NULL DEFAULT '0',
  `allow_favourites` tinyint(1) NOT NULL DEFAULT '0',
  `allow_alerts` tinyint(1) NOT NULL DEFAULT '0',
  `allow_sitemap` tinyint(1) NOT NULL DEFAULT '0',
  `allow_statistics` tinyint(1) NOT NULL DEFAULT '0',
  `allow_awstats` tinyint(1) NOT NULL DEFAULT '0',
  `allow_locality_sites` tinyint(1) NOT NULL DEFAULT '0',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `is_live` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_url` (`portal_url`),
  KEY `status_code` (`status_code`),
  KEY `portal_config_locality_type_code` (`portal_config_locality_type_code`),
  KEY `portal_config_url_format_code` (`portal_config_url_format_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Triggers `portal`
--
DROP TRIGGER IF EXISTS `portal_modified`;
DELIMITER //
CREATE TRIGGER `portal_modified` BEFORE UPDATE ON `portal`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_ad`
--

CREATE TABLE IF NOT EXISTS `portal_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) unsigned NOT NULL,
  `path` varchar(250) NOT NULL,
  `menu_label` varchar(50) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `link` varchar(250) DEFAULT NULL,
  `display_order` tinyint(4) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_id` (`portal_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Triggers `portal_ad`
--
DROP TRIGGER IF EXISTS `portal_ad_modified`;
DELIMITER //
CREATE TRIGGER `portal_ad_modified` BEFORE UPDATE ON `portal_ad`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;
DROP TRIGGER IF EXISTS `portal_add_display_order`;
DELIMITER //
CREATE TRIGGER `portal_add_display_order` BEFORE INSERT ON `portal_ad`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM portal_ad WHERE portal_id = NEW.portal_id AND menu_label = NEW.menu_label AND status_code = NEW.status_code)
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_branding`
--

CREATE TABLE IF NOT EXISTS `portal_branding` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) unsigned NOT NULL,
  `portal_branding_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `banner_path` varchar(150) DEFAULT NULL,
  `colour1` varchar(7) NOT NULL DEFAULT '#cccccc',
  `colour2` varchar(7) NOT NULL DEFAULT '#cccccc',
  `colour3` varchar(7) NOT NULL DEFAULT '#cccccc',
  `bg_colour1` varchar(7) NOT NULL DEFAULT '#ffffff',
  `bg_colour2` varchar(7) NOT NULL DEFAULT '#ffffff',
  `bg_colour3` varchar(7) NOT NULL DEFAULT '#ffffff',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_id` (`portal_id`,`portal_branding_type_code`),
  KEY `portal_branding_type_code` (`portal_branding_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_branding`
--
DROP TRIGGER IF EXISTS `portal_branding_modified`;
DELIMITER //
CREATE TRIGGER `portal_branding_modified` BEFORE UPDATE ON `portal_branding`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_branding_type_code`
--

CREATE TABLE IF NOT EXISTS `portal_branding_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_agency`
--

CREATE TABLE IF NOT EXISTS `portal_config_agency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_id` (`portal_id`),
  KEY `agency_id` (`agency_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Triggers `portal_config_agency`
--
DROP TRIGGER IF EXISTS `portal_config_agency_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_agency_modified` BEFORE UPDATE ON `portal_config_agency`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_cdn_host`
--

CREATE TABLE IF NOT EXISTS `portal_config_cdn_host` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_config_cdn_host`
--
DROP TRIGGER IF EXISTS `portal_config_cdn_host_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_cdn_host_modified` BEFORE UPDATE ON `portal_config_cdn_host`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_group`
--

CREATE TABLE IF NOT EXISTS `portal_config_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Triggers `portal_config_group`
--
DROP TRIGGER IF EXISTS `portal_config_group_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_group_modified` BEFORE UPDATE ON `portal_config_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_grouping`
--

CREATE TABLE IF NOT EXISTS `portal_config_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_config_group_id` int(11) unsigned NOT NULL,
  `portal_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_config_group_id` (`portal_config_group_id`,`portal_id`),
  KEY `portal_id` (`portal_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Triggers `portal_config_grouping`
--
DROP TRIGGER IF EXISTS `portal_config_grouping_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_grouping_modified` BEFORE UPDATE ON `portal_config_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_locality`
--

CREATE TABLE IF NOT EXISTS `portal_config_locality` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) unsigned NOT NULL,
  `locality_type` varchar(25) NOT NULL,
  `locality_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_id` (`portal_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_config_locality`
--
DROP TRIGGER IF EXISTS `portal_config_locality_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_locality_modified` BEFORE UPDATE ON `portal_config_locality`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_locality_type_code`
--

CREATE TABLE IF NOT EXISTS `portal_config_locality_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_theme`
--

CREATE TABLE IF NOT EXISTS `portal_config_theme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_config_theme`
--
DROP TRIGGER IF EXISTS `portal_config_theme_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_theme_modified` BEFORE UPDATE ON `portal_config_theme`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_theme_attribute`
--

CREATE TABLE IF NOT EXISTS `portal_config_theme_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) unsigned NOT NULL,
  `portal_config_theme_id` int(11) unsigned NOT NULL,
  `page_name` varchar(150) NOT NULL,
  `attribute_name` varchar(150) NOT NULL,
  `attribute_value` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_id` (`portal_id`),
  KEY `portal_config_theme_id` (`portal_config_theme_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_config_theme_attribute`
--
DROP TRIGGER IF EXISTS `portal_config_theme_attribute_modified`;
DELIMITER //
CREATE TRIGGER `portal_config_theme_attribute_modified` BEFORE UPDATE ON `portal_config_theme_attribute`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_config_url_format_code`
--

CREATE TABLE IF NOT EXISTS `portal_config_url_format_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_enquiry`
--

CREATE TABLE IF NOT EXISTS `portal_enquiry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_id` int(11) unsigned NOT NULL,
  `portal_enquiry_type_code` tinyint(3) unsigned NOT NULL,
  `website_favourites_user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enquiry` text NOT NULL,
  `user_agent` text NOT NULL,
  `misc_browser_code` tinyint(3) unsigned NOT NULL,
  `misc_os_code` tinyint(3) unsigned NOT NULL,
  `portal_enquiry_source_code` tinyint(3) unsigned NOT NULL,
  `portal_enquiry_rating_code` tinyint(3) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_id` (`portal_id`),
  KEY `portal_enquiry_type_code` (`portal_enquiry_type_code`),
  KEY `portal_favourites_user_id` (`website_favourites_user_id`),
  KEY `misc_browser_code` (`misc_browser_code`),
  KEY `misc_os_code` (`misc_os_code`),
  KEY `portal_enquiry_source_code` (`portal_enquiry_source_code`),
  KEY `portal_enquiry_rating_code` (`portal_enquiry_rating_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_enquiry`
--
DROP TRIGGER IF EXISTS `portal_enquiry_modified`;
DELIMITER //
CREATE TRIGGER `portal_enquiry_modified` BEFORE UPDATE ON `portal_enquiry`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_enquiry_rating_code`
--

CREATE TABLE IF NOT EXISTS `portal_enquiry_rating_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_enquiry_source_code`
--

CREATE TABLE IF NOT EXISTS `portal_enquiry_source_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_enquiry_type_code`
--

CREATE TABLE IF NOT EXISTS `portal_enquiry_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_send_alert_code`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_send_alert_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_config_group_id` int(11) unsigned NOT NULL,
  `portal_id` int(11) unsigned NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `postal_address` text,
  `portal_favourites_user_type_code` tinyint(3) unsigned DEFAULT NULL,
  `portal_favourites_user_marketing_code` tinyint(3) unsigned DEFAULT NULL,
  `portal_favourites_user_source_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `note` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_config_group_id` (`portal_config_group_id`,`email`),
  KEY `salutation_code` (`salutation_code`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `portal_favourites_user_type_code` (`portal_favourites_user_type_code`),
  KEY `portal_favourites_user_marketing_code` (`portal_favourites_user_marketing_code`),
  KEY `portal_favourites_user_source_code` (`portal_favourites_user_source_code`),
  KEY `status_code` (`status_code`),
  KEY `portal_id` (`portal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_modified` BEFORE UPDATE ON `portal_favourites_user`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_listing`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_listing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_id` int(11) unsigned NOT NULL,
  `listing_id` int(11) unsigned NOT NULL,
  `note` text,
  `rating_code` tinyint(3) unsigned DEFAULT NULL,
  `portal_favourites_send_alert_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_favourites_user_id` (`portal_favourites_user_id`,`listing_id`),
  KEY `listing_id` (`listing_id`),
  KEY `rating_code` (`rating_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_listing`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_listing_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_listing_modified` BEFORE UPDATE ON `portal_favourites_user_listing`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_listing_group`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_listing_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_id` int(11) unsigned NOT NULL,
  `group_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_favourites_user_id` (`portal_favourites_user_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_listing_group`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_listing_group_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_listing_group_modified` BEFORE UPDATE ON `portal_favourites_user_listing_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_listing_grouping`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_listing_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_listing_group_id` int(11) unsigned NOT NULL,
  `portal_favourites_user_listing_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_favourites_user_listing_group_id` (`portal_favourites_user_listing_group_id`,`portal_favourites_user_listing_id`),
  KEY `portal_favourites_user_listing_id` (`portal_favourites_user_listing_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_listing_grouping`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_listing_grouping_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_listing_grouping_modified` BEFORE UPDATE ON `portal_favourites_user_listing_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_marketing_code`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_marketing_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_search`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_id` int(11) unsigned NOT NULL,
  `search_name` varchar(128) NOT NULL,
  `search_criteria` text NOT NULL,
  `portal_favourites_send_alert_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_favourites_user_id` (`portal_favourites_user_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_search`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_search_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_search_modified` BEFORE UPDATE ON `portal_favourites_user_search`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_search_criteria`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_search_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_search_id` int(11) unsigned NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_favourites_user_search_id` (`portal_favourites_user_search_id`,`attribute`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_search_criteria`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_search_criteria_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_search_criteria_modified` BEFORE UPDATE ON `portal_favourites_user_search_criteria`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_search_group`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_search_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_id` int(11) unsigned NOT NULL,
  `group_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `portal_favourites_user_id` (`portal_favourites_user_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_search_group`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_search_group_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_search_group_modified` BEFORE UPDATE ON `portal_favourites_user_search_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_search_grouping`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_search_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `portal_favourites_user_search_group_id` int(11) unsigned NOT NULL,
  `portal_favourites_user_search_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `portal_favourites_user_search_group_id` (`portal_favourites_user_search_group_id`,`portal_favourites_user_search_id`),
  KEY `portal_favourites_user_search_id` (`portal_favourites_user_search_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `portal_favourites_user_search_grouping`
--
DROP TRIGGER IF EXISTS `portal_favourites_user_search_grouping_modified`;
DELIMITER //
CREATE TRIGGER `portal_favourites_user_search_grouping_modified` BEFORE UPDATE ON `portal_favourites_user_search_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_source_code`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_source_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_favourites_user_type_code`
--

CREATE TABLE IF NOT EXISTS `portal_favourites_user_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `portal_log`
--

CREATE TABLE IF NOT EXISTS `portal_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk_id` int(11) unsigned DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `model_backup` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `manager_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_id` (`manager_user_id`),
  KEY `model` (`model`,`pk_id`,`action`),
  KEY `model_2` (`model`,`pk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `rating_code`
--

CREATE TABLE IF NOT EXISTS `rating_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `repair_request`
--

CREATE TABLE IF NOT EXISTS `repair_request` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) NOT NULL,
  `street_address` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `phone_business` varchar(50) NOT NULL,
  `phone_mobile` varchar(50) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `repairs_required` text,
  `access_for_trades_person` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `repair_request_agent`
--

CREATE TABLE IF NOT EXISTS `repair_request_agent` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) unsigned NOT NULL,
  `repair_request_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repair_request_id` (`repair_request_id`,`agent_id`),
  KEY `agent_id` (`agent_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `salutation_code`
--

CREATE TABLE IF NOT EXISTS `salutation_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `service_code`
--

CREATE TABLE IF NOT EXISTS `service_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sold_type_code`
--

CREATE TABLE IF NOT EXISTS `sold_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `status_code`
--

CREATE TABLE IF NOT EXISTS `status_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tax_type_code`
--

CREATE TABLE IF NOT EXISTS `tax_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tenancy_application`
--

CREATE TABLE IF NOT EXISTS `tenancy_application` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rental_property_address` varchar(255) NOT NULL,
  `commencement_date` date NOT NULL,
  `date_inspected` date DEFAULT NULL,
  `length_of_tenancy` varchar(255) NOT NULL,
  `tenants_full_name` varchar(255) NOT NULL,
  `current_address` varchar(255) NOT NULL,
  `date_of_birth` date NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `bank_details` varchar(255) NOT NULL,
  `bank_details_expiry` date DEFAULT NULL,
  `drivers_licence_no` varchar(255) NOT NULL,
  `drivers_licence_expiry` date NOT NULL,
  `passport_no` varchar(255) DEFAULT NULL,
  `passport_no_expiry` date DEFAULT NULL,
  `home_phone` varchar(50) NOT NULL,
  `business_phone` varchar(50) NOT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email_address` varchar(100) NOT NULL,
  `previous_address` varchar(255) DEFAULT NULL,
  `current_rent` varchar(255) DEFAULT NULL,
  `current_period_of_lease` date DEFAULT NULL,
  `agent_landlord` varchar(255) DEFAULT NULL,
  `agent_landlord_phone` varchar(50) DEFAULT NULL,
  `reason_for_leaving` varchar(255) DEFAULT NULL,
  `current_employer` varchar(255) NOT NULL,
  `employee_position` varchar(255) NOT NULL,
  `length_of_employment` varchar(255) NOT NULL,
  `employer_contact_name` varchar(255) NOT NULL,
  `employer_contact_phone` varchar(50) NOT NULL,
  `number_of_occupants` tinyint(3) unsigned NOT NULL,
  `number_of_children` tinyint(3) unsigned DEFAULT NULL,
  `pets` tinyint(1) DEFAULT NULL,
  `type_of_pets` varchar(255) DEFAULT NULL,
  `emergency_contact_name` varchar(255) NOT NULL,
  `emergency_contact_address` varchar(255) NOT NULL,
  `emergency_contact_relationship` varchar(255) NOT NULL,
  `emergency_contact_daytime_phone` varchar(50) NOT NULL,
  `reference1_name` varchar(255) NOT NULL,
  `reference1_occupation` varchar(255) DEFAULT NULL,
  `reference1_daytime_phone` varchar(50) NOT NULL,
  `reference2_name` varchar(255) NOT NULL,
  `reference2_occupation` varchar(255) DEFAULT NULL,
  `reference2_daytime_phone` varchar(50) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tenanted_code`
--

CREATE TABLE IF NOT EXISTS `tenanted_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `timezone_code`
--

CREATE TABLE IF NOT EXISTS `timezone_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

-- --------------------------------------------------------

--
-- Table structure for table `unit_area_code`
--

CREATE TABLE IF NOT EXISTS `unit_area_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `unit_length_code`
--

CREATE TABLE IF NOT EXISTS `unit_length_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  `label` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `visibility_code`
--

CREATE TABLE IF NOT EXISTS `visibility_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website`
--

CREATE TABLE IF NOT EXISTS `website` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_config_group_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `website_name` varchar(150) NOT NULL,
  `description` varchar(150) DEFAULT NULL,
  `website_url` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `setup` text,
  `menu_config` text,
  `phone` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `api_key_google` varchar(150) DEFAULT NULL,
  `api_key_walkscore` varchar(150) DEFAULT NULL,
  `email_default` varchar(100) NOT NULL,
  `email_helpdesk` varchar(100) DEFAULT NULL,
  `email_subscribe` varchar(100) DEFAULT NULL,
  `email_import` varchar(100) DEFAULT NULL,
  `email_export` varchar(100) DEFAULT NULL,
  `email_alert` varchar(100) DEFAULT NULL,
  `url_www` varchar(150) DEFAULT NULL,
  `url_static` varchar(150) DEFAULT NULL,
  `url_mobile` varchar(150) DEFAULT NULL,
  `url_facebook` varchar(150) DEFAULT NULL,
  `url_twitter` varchar(150) DEFAULT NULL,
  `analytics_www` varchar(150) DEFAULT NULL,
  `analytics_mobile` varchar(150) DEFAULT NULL,
  `allow_import` tinyint(1) NOT NULL DEFAULT '0',
  `allow_export` tinyint(1) NOT NULL DEFAULT '0',
  `allow_favourites` tinyint(1) NOT NULL DEFAULT '0',
  `allow_alerts` tinyint(1) NOT NULL DEFAULT '0',
  `allow_sitemap` tinyint(1) NOT NULL DEFAULT '0',
  `allow_statistics` tinyint(1) NOT NULL DEFAULT '0',
  `allow_awstats` tinyint(1) NOT NULL DEFAULT '0',
  `website_config_url_format_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `is_live` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_url` (`website_url`),
  KEY `status_code` (`status_code`),
  KEY `website_config_group_code` (`website_config_group_code`),
  KEY `website_config_url_format_code` (`website_config_url_format_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Triggers `website`
--
DROP TRIGGER IF EXISTS `website_modified`;
DELIMITER //
CREATE TRIGGER `website_modified` BEFORE UPDATE ON `website`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_branding`
--

CREATE TABLE IF NOT EXISTS `website_branding` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `website_branding_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `banner_path` varchar(150) DEFAULT NULL,
  `colour1` varchar(7) NOT NULL DEFAULT '#cccccc',
  `colour2` varchar(7) NOT NULL DEFAULT '#cccccc',
  `colour3` varchar(7) NOT NULL DEFAULT '#cccccc',
  `bg_colour1` varchar(7) NOT NULL DEFAULT '#ffffff',
  `bg_colour2` varchar(7) NOT NULL DEFAULT '#ffffff',
  `bg_colour3` varchar(7) NOT NULL DEFAULT '#ffffff',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`website_branding_type_code`),
  KEY `website_branding_type_code` (`website_branding_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_branding`
--
DROP TRIGGER IF EXISTS `website_branding_modified`;
DELIMITER //
CREATE TRIGGER `website_branding_modified` BEFORE UPDATE ON `website_branding`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_branding_type_code`
--

CREATE TABLE IF NOT EXISTS `website_branding_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_agency`
--

CREATE TABLE IF NOT EXISTS `website_config_agency` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `agency_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id_2` (`website_id`,`agency_id`),
  KEY `website_id` (`website_id`),
  KEY `agency_id` (`agency_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Triggers `website_config_agency`
--
DROP TRIGGER IF EXISTS `website_config_agency_modified`;
DELIMITER //
CREATE TRIGGER `website_config_agency_modified` BEFORE UPDATE ON `website_config_agency`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_cdn_host`
--

CREATE TABLE IF NOT EXISTS `website_config_cdn_host` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `url` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_config_cdn_host`
--
DROP TRIGGER IF EXISTS `website_config_cdn_host_modified`;
DELIMITER //
CREATE TRIGGER `website_config_cdn_host_modified` BEFORE UPDATE ON `website_config_cdn_host`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_group`
--

CREATE TABLE IF NOT EXISTS `website_config_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Triggers `website_config_group`
--
DROP TRIGGER IF EXISTS `website_config_group_modified`;
DELIMITER //
CREATE TRIGGER `website_config_group_modified` BEFORE UPDATE ON `website_config_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_grouping`
--

CREATE TABLE IF NOT EXISTS `website_config_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_config_group_id` int(11) unsigned NOT NULL,
  `website_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_config_group_id` (`website_config_group_id`,`website_id`),
  KEY `website_id` (`website_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Triggers `website_config_grouping`
--
DROP TRIGGER IF EXISTS `website_config_grouping_modified`;
DELIMITER //
CREATE TRIGGER `website_config_grouping_modified` BEFORE UPDATE ON `website_config_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_group_code`
--

CREATE TABLE IF NOT EXISTS `website_config_group_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_locality`
--

CREATE TABLE IF NOT EXISTS `website_config_locality` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `locality_type` varchar(25) NOT NULL,
  `locality_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_config_locality`
--
DROP TRIGGER IF EXISTS `website_config_locality_modified`;
DELIMITER //
CREATE TRIGGER `website_config_locality_modified` BEFORE UPDATE ON `website_config_locality`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_theme`
--

CREATE TABLE IF NOT EXISTS `website_config_theme` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_config_theme`
--
DROP TRIGGER IF EXISTS `website_config_theme_modified`;
DELIMITER //
CREATE TRIGGER `website_config_theme_modified` BEFORE UPDATE ON `website_config_theme`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_theme_attribute`
--

CREATE TABLE IF NOT EXISTS `website_config_theme_attribute` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `website_config_theme_id` int(11) unsigned NOT NULL,
  `page_name` varchar(150) NOT NULL,
  `attribute_name` varchar(150) NOT NULL,
  `attribute_value` varchar(150) NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`),
  KEY `website_config_theme_id` (`website_config_theme_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_config_theme_attribute`
--
DROP TRIGGER IF EXISTS `website_config_theme_attribute_modified`;
DELIMITER //
CREATE TRIGGER `website_config_theme_attribute_modified` BEFORE UPDATE ON `website_config_theme_attribute`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_config_url_format_code`
--

CREATE TABLE IF NOT EXISTS `website_config_url_format_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_enquiry`
--

CREATE TABLE IF NOT EXISTS `website_enquiry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `website_enquiry_type_code` tinyint(3) unsigned NOT NULL,
  `website_favourites_user_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(150) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `enquiry` text NOT NULL,
  `user_agent` text NOT NULL,
  `misc_browser_code` tinyint(3) unsigned DEFAULT NULL,
  `misc_os_code` tinyint(3) unsigned DEFAULT NULL,
  `website_enquiry_source_code` tinyint(3) unsigned DEFAULT NULL,
  `website_enquiry_rating_code` tinyint(3) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_id` (`website_id`),
  KEY `website_enquiry_type_code` (`website_enquiry_type_code`),
  KEY `website_favourites_user_id` (`website_favourites_user_id`),
  KEY `misc_browser_code` (`misc_browser_code`),
  KEY `misc_os_code` (`misc_os_code`),
  KEY `website_enquiry_source_code` (`website_enquiry_source_code`),
  KEY `website_enquiry_rating_code` (`website_enquiry_rating_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=132 ;

--
-- Triggers `website_enquiry`
--
DROP TRIGGER IF EXISTS `website_enquiry_modified`;
DELIMITER //
CREATE TRIGGER `website_enquiry_modified` BEFORE UPDATE ON `website_enquiry`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_enquiry_rating_code`
--

CREATE TABLE IF NOT EXISTS `website_enquiry_rating_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_enquiry_source_code`
--

CREATE TABLE IF NOT EXISTS `website_enquiry_source_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_enquiry_type_code`
--

CREATE TABLE IF NOT EXISTS `website_enquiry_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_send_alert_code`
--

CREATE TABLE IF NOT EXISTS `website_favourites_send_alert_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `agency_id` int(11) unsigned DEFAULT NULL,
  `agent_id` int(11) unsigned DEFAULT NULL,
  `source_id` int(11) unsigned DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(128) NOT NULL,
  `salutation_code` tinyint(3) unsigned NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `skype_name` varchar(100) DEFAULT NULL,
  `locality_address_id` int(11) unsigned DEFAULT NULL,
  `postal_address` text,
  `website_favourites_user_type_code` tinyint(3) unsigned DEFAULT NULL,
  `website_favourites_user_marketing_code` tinyint(3) unsigned DEFAULT NULL,
  `website_favourites_user_source_code` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `note` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `agency_id` (`agency_id`,`website_favourites_user_source_code`,`email`),
  KEY `salutation_code` (`salutation_code`),
  KEY `locality_address_id` (`locality_address_id`),
  KEY `website_favourites_user_type_code` (`website_favourites_user_type_code`),
  KEY `website_favourites_user_marketing_code` (`website_favourites_user_marketing_code`),
  KEY `website_favourites_user_source_code` (`website_favourites_user_source_code`),
  KEY `status_code` (`status_code`),
  KEY `website_id` (`source_id`),
  KEY `agent_id` (`agent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 ;

--
-- Triggers `website_favourites_user`
--
DROP TRIGGER IF EXISTS `website_favourites_user_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_modified` BEFORE UPDATE ON `website_favourites_user`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_agreement_code`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_agreement_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(150) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_contact_history`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_contact_history` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `manager_user_id` int(11) unsigned NOT NULL,
  `website_favourites_user_id` int(11) unsigned NOT NULL,
  `contact_type_code` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `sender` varchar(200) NOT NULL,
  `recipient` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text,
  `description` text,
  `sent` timestamp NULL DEFAULT NULL,
  `sent_log` text,
  `read` timestamp NULL DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `manager_user_id` (`manager_user_id`),
  KEY `website_favourites_user_id` (`website_favourites_user_id`),
  KEY `contact_type_code` (`contact_type_code`),
  KEY `status_code` (`status_code`),
  KEY `sent` (`sent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Triggers `website_favourites_user_contact_history`
--
DROP TRIGGER IF EXISTS `website_favourites_user_contact_history_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_contact_history_modified` BEFORE UPDATE ON `website_favourites_user_contact_history`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_listing`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_listing` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_id` int(11) unsigned NOT NULL,
  `listing_id` int(11) unsigned NOT NULL,
  `note` text,
  `rating_code` tinyint(3) unsigned DEFAULT NULL,
  `website_favourites_send_alert_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_favourites_user_id` (`website_favourites_user_id`,`listing_id`),
  KEY `listing_id` (`listing_id`),
  KEY `rating_code` (`rating_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- Triggers `website_favourites_user_listing`
--
DROP TRIGGER IF EXISTS `website_favourites_user_listing_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_listing_modified` BEFORE UPDATE ON `website_favourites_user_listing`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_listing_group`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_listing_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_id` int(11) unsigned NOT NULL,
  `group_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_favourites_user_id` (`website_favourites_user_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_favourites_user_listing_group`
--
DROP TRIGGER IF EXISTS `website_favourites_user_listing_group_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_listing_group_modified` BEFORE UPDATE ON `website_favourites_user_listing_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_listing_grouping`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_listing_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_listing_group_id` int(11) unsigned NOT NULL,
  `website_favourites_user_listing_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_favourites_user_listing_group_id` (`website_favourites_user_listing_group_id`,`website_favourites_user_listing_id`),
  KEY `website_favourites_user_listing_id` (`website_favourites_user_listing_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_favourites_user_listing_grouping`
--
DROP TRIGGER IF EXISTS `website_favourites_user_listing_grouping_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_listing_grouping_modified` BEFORE UPDATE ON `website_favourites_user_listing_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_marketing_code`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_marketing_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_search`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_search` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_id` int(11) unsigned NOT NULL,
  `search_name` varchar(128) NOT NULL,
  `search_criteria` text NOT NULL,
  `website_favourites_send_alert_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `frequency_code` tinyint(3) unsigned DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_favourites_user_id` (`website_favourites_user_id`),
  KEY `status_code` (`status_code`),
  KEY `frequency_code` (`frequency_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Triggers `website_favourites_user_search`
--
DROP TRIGGER IF EXISTS `website_favourites_user_search_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_search_modified` BEFORE UPDATE ON `website_favourites_user_search`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_search_criteria`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_search_criteria` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_search_id` int(11) unsigned NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_favourites_user_search_id` (`website_favourites_user_search_id`,`attribute`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=181 ;

--
-- Triggers `website_favourites_user_search_criteria`
--
DROP TRIGGER IF EXISTS `website_favourites_user_search_criteria_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_search_criteria_modified` BEFORE UPDATE ON `website_favourites_user_search_criteria`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_search_group`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_search_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_id` int(11) unsigned NOT NULL,
  `group_name` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_favourites_user_id` (`website_favourites_user_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_favourites_user_search_group`
--
DROP TRIGGER IF EXISTS `website_favourites_user_search_group_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_search_group_modified` BEFORE UPDATE ON `website_favourites_user_search_group`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_search_grouping`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_search_grouping` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_favourites_user_search_group_id` int(11) unsigned NOT NULL,
  `website_favourites_user_search_id` int(11) unsigned NOT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_favourites_user_search_group_id` (`website_favourites_user_search_group_id`,`website_favourites_user_search_id`),
  KEY `website_favourites_user_search_id` (`website_favourites_user_search_id`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_favourites_user_search_grouping`
--
DROP TRIGGER IF EXISTS `website_favourites_user_search_grouping_modified`;
DELIMITER //
CREATE TRIGGER `website_favourites_user_search_grouping_modified` BEFORE UPDATE ON `website_favourites_user_search_grouping`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_source_code`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_source_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_favourites_user_type_code`
--

CREATE TABLE IF NOT EXISTS `website_favourites_user_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_log`
--

CREATE TABLE IF NOT EXISTS `website_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `action` varchar(20) DEFAULT NULL,
  `model` varchar(45) DEFAULT NULL,
  `pk_id` int(11) unsigned DEFAULT NULL,
  `field` varchar(45) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `model_backup` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `website_favourites_user_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_favourites_user_id` (`website_favourites_user_id`),
  KEY `model` (`model`,`pk_id`,`action`),
  KEY `model_2` (`model`,`pk_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2161 ;

-- --------------------------------------------------------

--
-- Table structure for table `website_media`
--

CREATE TABLE IF NOT EXISTS `website_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_media_type_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `path` varchar(150) NOT NULL,
  `path_original` varchar(150) NOT NULL,
  `mime_type` varchar(200) NOT NULL,
  `height` int(10) unsigned DEFAULT NULL,
  `width` int(10) unsigned DEFAULT NULL,
  `file_size` int(10) unsigned DEFAULT NULL,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_media_type_code` (`website_media_type_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_media`
--
DROP TRIGGER IF EXISTS `website_media_modified`;
DELIMITER //
CREATE TRIGGER `website_media_modified` BEFORE UPDATE ON `website_media`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_media_type_code`
--

CREATE TABLE IF NOT EXISTS `website_media_type_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  `path` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_page`
--

CREATE TABLE IF NOT EXISTS `website_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `website_template_page_id` int(11) unsigned NOT NULL,
  `parent_website_page_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `url` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `page_heading` varchar(150) NOT NULL,
  `website_page_publish_status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`url`),
  UNIQUE KEY `website_id_2` (`website_id`,`website_template_page_id`),
  KEY `website_template_page_id` (`website_template_page_id`),
  KEY `parent_website_page_id` (`parent_website_page_id`),
  KEY `website_page_publish_status_code` (`website_page_publish_status_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Triggers `website_page`
--
DROP TRIGGER IF EXISTS `website_page_modified`;
DELIMITER //
CREATE TRIGGER `website_page_modified` BEFORE UPDATE ON `website_page`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_component`
--

CREATE TABLE IF NOT EXISTS `website_page_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_page_id` int(11) unsigned NOT NULL,
  `website_template_page_component_id` int(11) unsigned NOT NULL,
  `value` text,
  `setup` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_page_id` (`website_page_id`,`website_template_page_component_id`),
  KEY `status_code` (`status_code`),
  KEY `website_template_page_component_id` (`website_template_page_component_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=120 ;

--
-- Triggers `website_page_component`
--
DROP TRIGGER IF EXISTS `website_page_component_modified`;
DELIMITER //
CREATE TRIGGER `website_page_component_modified` BEFORE UPDATE ON `website_page_component`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_component_code`
--

CREATE TABLE IF NOT EXISTS `website_page_component_code` (
  `code` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `label` varchar(50) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_custom`
--

CREATE TABLE IF NOT EXISTS `website_page_custom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `website_template_page_custom_id` int(11) unsigned NOT NULL,
  `parent_website_page_custom_id` int(11) unsigned DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `url` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `page_heading` varchar(150) NOT NULL,
  `website_page_publish_status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`url`),
  KEY `website_template_page_custom_id` (`website_template_page_custom_id`),
  KEY `parent_website_page_custom_id` (`parent_website_page_custom_id`),
  KEY `website_page_publish_status_code` (`website_page_publish_status_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=35 ;

--
-- Triggers `website_page_custom`
--
DROP TRIGGER IF EXISTS `website_page_custom_modified`;
DELIMITER //
CREATE TRIGGER `website_page_custom_modified` BEFORE UPDATE ON `website_page_custom`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_custom_component`
--

CREATE TABLE IF NOT EXISTS `website_page_custom_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_page_custom_id` int(11) unsigned NOT NULL,
  `website_template_page_custom_component_id` int(11) unsigned NOT NULL,
  `value` text,
  `setup` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_page_custom_id` (`website_page_custom_id`,`website_template_page_custom_component_id`),
  KEY `status_code` (`status_code`),
  KEY `website_template_page_custom_component_id` (`website_template_page_custom_component_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=125 ;

--
-- Triggers `website_page_custom_component`
--
DROP TRIGGER IF EXISTS `website_page_custom_component_modified`;
DELIMITER //
CREATE TRIGGER `website_page_custom_component_modified` BEFORE UPDATE ON `website_page_custom_component`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_list`
--

CREATE TABLE IF NOT EXISTS `website_page_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_id` int(11) unsigned NOT NULL,
  `website_template_page_list_id` int(11) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `url` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `page_heading` varchar(150) NOT NULL,
  `website_page_publish_status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_id` (`website_id`,`url`),
  KEY `website_template_page_list_id` (`website_template_page_list_id`),
  KEY `website_page_publish_status_code` (`website_page_publish_status_code`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- Triggers `website_page_list`
--
DROP TRIGGER IF EXISTS `website_page_list_modified`;
DELIMITER //
CREATE TRIGGER `website_page_list_modified` BEFORE UPDATE ON `website_page_list`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_list_entry`
--

CREATE TABLE IF NOT EXISTS `website_page_list_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_page_list_id` int(11) unsigned NOT NULL,
  `website_page_publish_status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `display_order` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `website_page_publish_status_code` (`website_page_publish_status_code`),
  KEY `website_page_list_id` (`website_page_list_id`,`display_order`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=171 ;

--
-- Triggers `website_page_list_entry`
--
DROP TRIGGER IF EXISTS `website_page_list_entry_display_order`;
DELIMITER //
CREATE TRIGGER `website_page_list_entry_display_order` BEFORE INSERT ON `website_page_list_entry`
 FOR EACH ROW SET NEW.display_order = (SELECT IFNULL(MAX(display_order)+1,1) FROM website_page_list_entry WHERE website_page_list_id = NEW.website_page_list_id)
//
DELIMITER ;
DROP TRIGGER IF EXISTS `website_page_list_entry_modified`;
DELIMITER //
CREATE TRIGGER `website_page_list_entry_modified` BEFORE UPDATE ON `website_page_list_entry`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_list_entry_component`
--

CREATE TABLE IF NOT EXISTS `website_page_list_entry_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_page_list_entry_id` int(11) unsigned NOT NULL,
  `website_template_page_list_entry_component_id` int(11) unsigned NOT NULL,
  `value` text,
  `setup` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_page_list_entry_id` (`website_page_list_entry_id`,`website_template_page_list_entry_component_id`),
  KEY `status_code` (`status_code`),
  KEY `website_template_page_list_entry_component_id` (`website_template_page_list_entry_component_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=736 ;

--
-- Triggers `website_page_list_entry_component`
--
DROP TRIGGER IF EXISTS `website_page_list_entry_component_modified`;
DELIMITER //
CREATE TRIGGER `website_page_list_entry_component_modified` BEFORE UPDATE ON `website_page_list_entry_component`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_media`
--

CREATE TABLE IF NOT EXISTS `website_page_media` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_page_id` int(11) unsigned NOT NULL,
  `path` varchar(150) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status_code` (`status_code`),
  KEY `website_page_id` (`website_page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Triggers `website_page_media`
--
DROP TRIGGER IF EXISTS `website_page_media_modified`;
DELIMITER //
CREATE TRIGGER `website_page_media_modified` BEFORE UPDATE ON `website_page_media`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_page_publish_status_code`
--

CREATE TABLE IF NOT EXISTS `website_page_publish_status_code` (
  `code` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `website_template_page`
--

CREATE TABLE IF NOT EXISTS `website_template_page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `url` varchar(150) NOT NULL,
  `title` varchar(150) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `page_heading` varchar(150) NOT NULL,
  `path` varchar(150) NOT NULL,
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`,`is_mobile`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- Triggers `website_template_page`
--
DROP TRIGGER IF EXISTS `website_template_page_modified`;
DELIMITER //
CREATE TRIGGER `website_template_page_modified` BEFORE UPDATE ON `website_template_page`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_template_page_component`
--

CREATE TABLE IF NOT EXISTS `website_template_page_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_template_page_id` int(11) unsigned NOT NULL,
  `website_page_component_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `label` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `value` text,
  `setup` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_template_page_id` (`website_template_page_id`,`label`),
  UNIQUE KEY `website_template_page_id_2` (`website_template_page_id`,`name`),
  KEY `status_code` (`status_code`),
  KEY `website_page_component_code` (`website_page_component_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Triggers `website_template_page_component`
--
DROP TRIGGER IF EXISTS `website_template_page_component_modified`;
DELIMITER //
CREATE TRIGGER `website_template_page_component_modified` BEFORE UPDATE ON `website_template_page_component`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_template_page_custom`
--

CREATE TABLE IF NOT EXISTS `website_template_page_custom` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `path` varchar(150) NOT NULL,
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Triggers `website_template_page_custom`
--
DROP TRIGGER IF EXISTS `website_template_page_custom_modified`;
DELIMITER //
CREATE TRIGGER `website_template_page_custom_modified` BEFORE UPDATE ON `website_template_page_custom`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_template_page_custom_component`
--

CREATE TABLE IF NOT EXISTS `website_template_page_custom_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_template_page_custom_id` int(11) unsigned NOT NULL,
  `website_page_component_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `label` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `value` text,
  `setup` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_template_page_custom_id` (`website_template_page_custom_id`,`label`),
  UNIQUE KEY `website_template_page_custom_i_2` (`website_template_page_custom_id`,`name`),
  KEY `status_code` (`status_code`),
  KEY `website_page_component_code` (`website_page_component_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Triggers `website_template_page_custom_component`
--
DROP TRIGGER IF EXISTS `website_template_page_custom_component_modified`;
DELIMITER //
CREATE TRIGGER `website_template_page_custom_component_modified` BEFORE UPDATE ON `website_template_page_custom_component`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_template_page_list`
--

CREATE TABLE IF NOT EXISTS `website_template_page_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(100) NOT NULL,
  `path` varchar(150) NOT NULL,
  `is_mobile` tinyint(1) NOT NULL DEFAULT '0',
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `status_code` (`status_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Triggers `website_template_page_list`
--
DROP TRIGGER IF EXISTS `website_template_page_list_modified`;
DELIMITER //
CREATE TRIGGER `website_template_page_list_modified` BEFORE UPDATE ON `website_template_page_list`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `website_template_page_list_entry_component`
--

CREATE TABLE IF NOT EXISTS `website_template_page_list_entry_component` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `website_template_page_list_id` int(11) unsigned NOT NULL,
  `website_page_component_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `label` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` text,
  `value` text,
  `setup` text,
  `status_code` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `website_template_page_list_id` (`website_template_page_list_id`,`label`),
  UNIQUE KEY `website_template_page_list_id_2` (`website_template_page_list_id`,`name`),
  KEY `status_code` (`status_code`),
  KEY `website_page_component_code` (`website_page_component_code`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- Triggers `website_template_page_list_entry_component`
--
DROP TRIGGER IF EXISTS `website_template_page_list_entry_component_modified`;
DELIMITER //
CREATE TRIGGER `website_template_page_list_entry_component_modified` BEFORE UPDATE ON `website_template_page_list_entry_component`
 FOR EACH ROW SET NEW.modified = CURRENT_TIMESTAMP
//
DELIMITER ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agency`
--
ALTER TABLE `agency`
  ADD CONSTRAINT `agency_ibfk_1` FOREIGN KEY (`agency_group_id`) REFERENCES `agency_group` (`id`),
  ADD CONSTRAINT `agency_ibfk_2` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `agency_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `agency_ibfk_4` FOREIGN KEY (`owner_manager_user_id`) REFERENCES `manager_user` (`id`);

--
-- Constraints for table `agency_branding`
--
ALTER TABLE `agency_branding`
  ADD CONSTRAINT `agency_branding_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `agency_branding_ibfk_2` FOREIGN KEY (`agency_branding_type_code`) REFERENCES `agency_branding_type_code` (`code`),
  ADD CONSTRAINT `agency_branding_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agency_config_default`
--
ALTER TABLE `agency_config_default`
  ADD CONSTRAINT `agency_config_default_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `agency_config_default_ibfk_10` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_2` FOREIGN KEY (`listing_type_code`) REFERENCES `listing_type_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_3` FOREIGN KEY (`listing_trade_type_code`) REFERENCES `listing_trade_type_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_4` FOREIGN KEY (`price_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_5` FOREIGN KEY (`price_sold_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_6` FOREIGN KEY (`price_leased_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_7` FOREIGN KEY (`commission_type_code`) REFERENCES `commission_type_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_8` FOREIGN KEY (`agency_agreement_type_code`) REFERENCES `agency_agreement_type_code` (`code`),
  ADD CONSTRAINT `agency_config_default_ibfk_9` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `agency_config_export`
--
ALTER TABLE `agency_config_export`
  ADD CONSTRAINT `agency_config_export_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `agency_config_export_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agency_group`
--
ALTER TABLE `agency_group`
  ADD CONSTRAINT `agency_group_ibfk_1` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `agency_group_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agency_locality`
--
ALTER TABLE `agency_locality`
  ADD CONSTRAINT `agency_locality_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `agency_locality_ibfk_2` FOREIGN KEY (`locality_type_code`) REFERENCES `locality_type_code` (`code`),
  ADD CONSTRAINT `agency_locality_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agency_misc`
--
ALTER TABLE `agency_misc`
  ADD CONSTRAINT `agency_misc_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `agency_misc_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agent`
--
ALTER TABLE `agent`
  ADD CONSTRAINT `agent_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `agent_ibfk_2` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `agent_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agent_hit`
--
ALTER TABLE `agent_hit`
  ADD CONSTRAINT `agent_hit_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `agent_hit_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agent_language`
--
ALTER TABLE `agent_language`
  ADD CONSTRAINT `agent_language_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `agent_language_ibfk_2` FOREIGN KEY (`language_spoken_id`) REFERENCES `language_spoken` (`id`),
  ADD CONSTRAINT `agent_language_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `agent_service`
--
ALTER TABLE `agent_service`
  ADD CONSTRAINT `agent_service_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `agent_service_ibfk_2` FOREIGN KEY (`service_code`) REFERENCES `service_code` (`code`),
  ADD CONSTRAINT `agent_service_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `blog_authassignment`
--
ALTER TABLE `blog_authassignment`
  ADD CONSTRAINT `blog_authassignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `blog_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blog_rights`
--
ALTER TABLE `blog_rights`
  ADD CONSTRAINT `blog_rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `blog_authitem` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brochure`
--
ALTER TABLE `brochure`
  ADD CONSTRAINT `brochure_ibfk_1` FOREIGN KEY (`brochure_code`) REFERENCES `brochure_code` (`code`),
  ADD CONSTRAINT `brochure_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `brochure_agency`
--
ALTER TABLE `brochure_agency`
  ADD CONSTRAINT `brochure_agency_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `brochure_agency_ibfk_2` FOREIGN KEY (`brochure_id`) REFERENCES `brochure` (`id`),
  ADD CONSTRAINT `brochure_agency_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `contact_ibfk_3` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `contact_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `contact_group`
--
ALTER TABLE `contact_group`
  ADD CONSTRAINT `contact_group_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `contact_group_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `contact_grouping`
--
ALTER TABLE `contact_grouping`
  ADD CONSTRAINT `contact_grouping_ibfk_1` FOREIGN KEY (`contact_group_id`) REFERENCES `contact_group` (`id`),
  ADD CONSTRAINT `contact_grouping_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  ADD CONSTRAINT `contact_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `cp_contact`
--
ALTER TABLE `cp_contact`
  ADD CONSTRAINT `cp_contact_ibfk_1` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `cp_contact_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `cp_contact_entity`
--
ALTER TABLE `cp_contact_entity`
  ADD CONSTRAINT `cp_contact_entity_ibfk_1` FOREIGN KEY (`cp_contact_id`) REFERENCES `cp_contact` (`id`),
  ADD CONSTRAINT `cp_contact_entity_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `cp_contact_history`
--
ALTER TABLE `cp_contact_history`
  ADD CONSTRAINT `cp_contact_history_ibfk_1` FOREIGN KEY (`cp_contact_entity_id`) REFERENCES `cp_contact_entity` (`id`),
  ADD CONSTRAINT `cp_contact_history_ibfk_2` FOREIGN KEY (`cp_contact_medium_code`) REFERENCES `cp_contact_medium_code` (`code`),
  ADD CONSTRAINT `cp_contact_history_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `cp_contact_history_attachment`
--
ALTER TABLE `cp_contact_history_attachment`
  ADD CONSTRAINT `cp_contact_history_attachment_ibfk_1` FOREIGN KEY (`cp_contact_history_id`) REFERENCES `cp_contact_history` (`id`),
  ADD CONSTRAINT `cp_contact_history_attachment_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `cp_log`
--
ALTER TABLE `cp_log`
  ADD CONSTRAINT `cp_log_ibfk_1` FOREIGN KEY (`cp_user_id`) REFERENCES `cp_user` (`id`);

--
-- Constraints for table `cp_user`
--
ALTER TABLE `cp_user`
  ADD CONSTRAINT `cp_user_ibfk_1` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `cp_user_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `cp_user_auth_assignment`
--
ALTER TABLE `cp_user_auth_assignment`
  ADD CONSTRAINT `cp_user_auth_assignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `cp_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cp_user_auth_assignment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `cp_user` (`id`);

--
-- Constraints for table `cp_user_auth_item_child`
--
ALTER TABLE `cp_user_auth_item_child`
  ADD CONSTRAINT `cp_user_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `cp_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cp_user_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `cp_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cp_user_auth_rights`
--
ALTER TABLE `cp_user_auth_rights`
  ADD CONSTRAINT `cp_user_auth_rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `cp_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cp_user_login_log`
--
ALTER TABLE `cp_user_login_log`
  ADD CONSTRAINT `cp_user_login_log_ibfk_1` FOREIGN KEY (`cp_user_id`) REFERENCES `cp_user` (`id`);

--
-- Constraints for table `crontab`
--
ALTER TABLE `crontab`
  ADD CONSTRAINT `crontab_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `crontab_log`
--
ALTER TABLE `crontab_log`
  ADD CONSTRAINT `crontab_log_ibfk_1` FOREIGN KEY (`crontab_id`) REFERENCES `crontab` (`id`),
  ADD CONSTRAINT `crontab_log_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `export_portal`
--
ALTER TABLE `export_portal`
  ADD CONSTRAINT `export_portal_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `export_portal_agency`
--
ALTER TABLE `export_portal_agency`
  ADD CONSTRAINT `export_portal_agency_ibfk_1` FOREIGN KEY (`export_portal_id`) REFERENCES `export_portal` (`id`),
  ADD CONSTRAINT `export_portal_agency_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `export_portal_agency_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `export_portal_listing`
--
ALTER TABLE `export_portal_listing`
  ADD CONSTRAINT `export_portal_listing_ibfk_1` FOREIGN KEY (`export_portal_agency_id`) REFERENCES `export_portal_agency` (`id`),
  ADD CONSTRAINT `export_portal_listing_ibfk_2` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `export_portal_listing_ibfk_3` FOREIGN KEY (`listing_export_status_code`) REFERENCES `listing_export_status_code` (`code`),
  ADD CONSTRAINT `export_portal_listing_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `l10n_website_translation`
--
ALTER TABLE `l10n_website_translation`
  ADD CONSTRAINT `l10n_website_translation_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`);

--
-- Constraints for table `listing`
--
ALTER TABLE `listing`
  ADD CONSTRAINT `listing_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `listing_ibfk_10` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_2` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `listing_ibfk_3` FOREIGN KEY (`locality_address_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_4` FOREIGN KEY (`listing_type_code`) REFERENCES `listing_type_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_5` FOREIGN KEY (`listing_trade_type_code`) REFERENCES `listing_trade_type_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_6` FOREIGN KEY (`listing_market_status_code`) REFERENCES `listing_market_status_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_7` FOREIGN KEY (`listing_publish_status_code`) REFERENCES `listing_publish_status_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_8` FOREIGN KEY (`map_publisher_code`) REFERENCES `map_publisher_code` (`code`),
  ADD CONSTRAINT `listing_ibfk_9` FOREIGN KEY (`streetview_visibility_code`) REFERENCES `locality_address_visibility_code` (`code`);

--
-- Constraints for table `listing_agent`
--
ALTER TABLE `listing_agent`
  ADD CONSTRAINT `listing_agent_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_agent_ibfk_2` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `listing_agent_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_asset`
--
ALTER TABLE `listing_asset`
  ADD CONSTRAINT `listing_asset_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_asset_ibfk_2` FOREIGN KEY (`listing_asset_type_code`) REFERENCES `listing_asset_type_code` (`code`),
  ADD CONSTRAINT `listing_asset_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_asset_cdn`
--
ALTER TABLE `listing_asset_cdn`
  ADD CONSTRAINT `listing_asset_cdn_ibfk_1` FOREIGN KEY (`listing_asset_id`) REFERENCES `listing_asset` (`id`),
  ADD CONSTRAINT `listing_asset_cdn_ibfk_2` FOREIGN KEY (`listing_asset_cdn_host_id`) REFERENCES `listing_asset_cdn_host` (`id`),
  ADD CONSTRAINT `listing_asset_cdn_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_asset_cdn_host`
--
ALTER TABLE `listing_asset_cdn_host`
  ADD CONSTRAINT `listing_asset_cdn_host_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_asset_external`
--
ALTER TABLE `listing_asset_external`
  ADD CONSTRAINT `listing_asset_external_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_asset_external_ibfk_2` FOREIGN KEY (`listing_asset_type_code`) REFERENCES `listing_asset_type_code` (`code`),
  ADD CONSTRAINT `listing_asset_external_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_contact`
--
ALTER TABLE `listing_contact`
  ADD CONSTRAINT `listing_contact_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_contact_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  ADD CONSTRAINT `listing_contact_ibfk_3` FOREIGN KEY (`listing_contact_type_code`) REFERENCES `listing_contact_type_code` (`code`),
  ADD CONSTRAINT `listing_contact_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_email_friend`
--
ALTER TABLE `listing_email_friend`
  ADD CONSTRAINT `listing_email_friend_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_email_friend_ibfk_2` FOREIGN KEY (`listing_source_code`) REFERENCES `listing_source_code` (`code`),
  ADD CONSTRAINT `listing_email_friend_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_enquiry`
--
ALTER TABLE `listing_enquiry`
  ADD CONSTRAINT `listing_enquiry_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_enquiry_ibfk_2` FOREIGN KEY (`listing_source_code`) REFERENCES `listing_source_code` (`code`),
  ADD CONSTRAINT `listing_enquiry_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `listing_enquiry_ibfk_4` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `listing_feature`
--
ALTER TABLE `listing_feature`
  ADD CONSTRAINT `listing_feature_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_feature_ibfk_2` FOREIGN KEY (`listing_feature_code`) REFERENCES `listing_feature_code` (`code`),
  ADD CONSTRAINT `listing_feature_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_hit`
--
ALTER TABLE `listing_hit`
  ADD CONSTRAINT `listing_hit_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_hit_ibfk_2` FOREIGN KEY (`listing_source_code`) REFERENCES `listing_source_code` (`code`),
  ADD CONSTRAINT `listing_hit_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_hit_email`
--
ALTER TABLE `listing_hit_email`
  ADD CONSTRAINT `listing_hit_email_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_hit_email_ibfk_2` FOREIGN KEY (`listing_source_code`) REFERENCES `listing_source_code` (`code`),
  ADD CONSTRAINT `listing_hit_email_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_ideal`
--
ALTER TABLE `listing_ideal`
  ADD CONSTRAINT `listing_ideal_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_ideal_ibfk_2` FOREIGN KEY (`listing_ideal_code`) REFERENCES `listing_ideal_code` (`code`),
  ADD CONSTRAINT `listing_ideal_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_inspection`
--
ALTER TABLE `listing_inspection`
  ADD CONSTRAINT `listing_inspection_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_inspection_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_link`
--
ALTER TABLE `listing_link`
  ADD CONSTRAINT `listing_link_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_link_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_log`
--
ALTER TABLE `listing_log`
  ADD CONSTRAINT `listing_log_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`);

--
-- Constraints for table `listing_market_history`
--
ALTER TABLE `listing_market_history`
  ADD CONSTRAINT `listing_market_history_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_market_history_ibfk_2` FOREIGN KEY (`listing_market_history_code`) REFERENCES `listing_market_history_code` (`code`),
  ADD CONSTRAINT `listing_market_history_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_statistics`
--
ALTER TABLE `listing_statistics`
  ADD CONSTRAINT `listing_statistics_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_statistics_ibfk_2` FOREIGN KEY (`listing_source_code`) REFERENCES `listing_source_code` (`code`),
  ADD CONSTRAINT `listing_statistics_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_text`
--
ALTER TABLE `listing_text`
  ADD CONSTRAINT `listing_text_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_text_ibfk_2` FOREIGN KEY (`listing_text_type_code`) REFERENCES `listing_text_type_code` (`code`),
  ADD CONSTRAINT `listing_text_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_trade_business`
--
ALTER TABLE `listing_trade_business`
  ADD CONSTRAINT `listing_trade_business_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_trade_business_ibfk_2` FOREIGN KEY (`land_area_display_unit_code`) REFERENCES `unit_area_code` (`code`),
  ADD CONSTRAINT `listing_trade_business_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `listing_trade_business_ibfk_4` FOREIGN KEY (`listing_trade_business_property_type_code`) REFERENCES `listing_trade_business_property_type_code` (`code`);

--
-- Constraints for table `listing_trade_commercial`
--
ALTER TABLE `listing_trade_commercial`
  ADD CONSTRAINT `listing_trade_commercial_ibfk_1` FOREIGN KEY (`listing_extent_code`) REFERENCES `listing_extent_code` (`code`),
  ADD CONSTRAINT `listing_trade_commercial_ibfk_2` FOREIGN KEY (`feature_cross_over_type_code`) REFERENCES `feature_cross_over_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_commercial_ibfk_3` FOREIGN KEY (`tenanted_code`) REFERENCES `tenanted_code` (`code`),
  ADD CONSTRAINT `listing_trade_commercial_ibfk_4` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_trade_commercial_ibfk_5` FOREIGN KEY (`listing_trade_commercial_property_type_code`) REFERENCES `listing_trade_commercial_property_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_commercial_ibfk_6` FOREIGN KEY (`land_area_display_unit_code`) REFERENCES `unit_area_code` (`code`),
  ADD CONSTRAINT `listing_trade_commercial_ibfk_7` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_trade_holiday`
--
ALTER TABLE `listing_trade_holiday`
  ADD CONSTRAINT `listing_trade_holiday_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_trade_holiday_ibfk_2` FOREIGN KEY (`listing_trade_holiday_property_type_code`) REFERENCES `listing_trade_holiday_property_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_holiday_ibfk_3` FOREIGN KEY (`land_area_display_unit_code`) REFERENCES `unit_area_code` (`code`),
  ADD CONSTRAINT `listing_trade_holiday_ibfk_4` FOREIGN KEY (`feature_heating_type_code`) REFERENCES `feature_heating_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_holiday_ibfk_5` FOREIGN KEY (`feature_hot_water_service_type_code`) REFERENCES `feature_hot_water_service_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_holiday_ibfk_6` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_trade_residential`
--
ALTER TABLE `listing_trade_residential`
  ADD CONSTRAINT `listing_trade_residential_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_trade_residential_ibfk_2` FOREIGN KEY (`listing_trade_residential_property_type_code`) REFERENCES `listing_trade_residential_property_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_residential_ibfk_3` FOREIGN KEY (`land_area_display_unit_code`) REFERENCES `unit_area_code` (`code`),
  ADD CONSTRAINT `listing_trade_residential_ibfk_4` FOREIGN KEY (`listing_land_code`) REFERENCES `listing_land_code` (`code`),
  ADD CONSTRAINT `listing_trade_residential_ibfk_5` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_trade_rural`
--
ALTER TABLE `listing_trade_rural`
  ADD CONSTRAINT `listing_trade_rural_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_trade_rural_ibfk_2` FOREIGN KEY (`listing_trade_rural_property_type_code`) REFERENCES `listing_trade_rural_property_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_rural_ibfk_3` FOREIGN KEY (`land_area_display_unit_code`) REFERENCES `unit_area_code` (`code`),
  ADD CONSTRAINT `listing_trade_rural_ibfk_4` FOREIGN KEY (`feature_heating_type_code`) REFERENCES `feature_heating_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_rural_ibfk_5` FOREIGN KEY (`feature_hot_water_service_type_code`) REFERENCES `feature_hot_water_service_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_rural_ibfk_6` FOREIGN KEY (`feature_cross_over_type_code`) REFERENCES `feature_cross_over_type_code` (`code`),
  ADD CONSTRAINT `listing_trade_rural_ibfk_7` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_type_auction`
--
ALTER TABLE `listing_type_auction`
  ADD CONSTRAINT `listing_type_auction_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_type_auction_ibfk_2` FOREIGN KEY (`price_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_type_auction_ibfk_3` FOREIGN KEY (`price_sold_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_type_auction_ibfk_4` FOREIGN KEY (`sold_type_code`) REFERENCES `sold_type_code` (`code`),
  ADD CONSTRAINT `listing_type_auction_ibfk_5` FOREIGN KEY (`commission_type_code`) REFERENCES `commission_type_code` (`code`),
  ADD CONSTRAINT `listing_type_auction_ibfk_6` FOREIGN KEY (`price_lease_duration_code`) REFERENCES `duration_code` (`code`),
  ADD CONSTRAINT `listing_type_auction_ibfk_7` FOREIGN KEY (`agency_agreement_type_code`) REFERENCES `agency_agreement_type_code` (`code`),
  ADD CONSTRAINT `listing_type_auction_ibfk_8` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_type_lease`
--
ALTER TABLE `listing_type_lease`
  ADD CONSTRAINT `listing_type_lease_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_type_lease_ibfk_10` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_2` FOREIGN KEY (`price_duration_code`) REFERENCES `duration_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_3` FOREIGN KEY (`price_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_4` FOREIGN KEY (`price_leased_duration_code`) REFERENCES `duration_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_5` FOREIGN KEY (`price_leased_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_6` FOREIGN KEY (`price_landlord_duration_code`) REFERENCES `duration_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_7` FOREIGN KEY (`price_agent_duration_code`) REFERENCES `duration_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_8` FOREIGN KEY (`commission_type_code`) REFERENCES `commission_type_code` (`code`),
  ADD CONSTRAINT `listing_type_lease_ibfk_9` FOREIGN KEY (`agency_agreement_type_code`) REFERENCES `agency_agreement_type_code` (`code`);

--
-- Constraints for table `listing_type_sale`
--
ALTER TABLE `listing_type_sale`
  ADD CONSTRAINT `listing_type_sale_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_type_sale_ibfk_2` FOREIGN KEY (`price_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_type_sale_ibfk_3` FOREIGN KEY (`price_sold_visibility_code`) REFERENCES `visibility_code` (`code`),
  ADD CONSTRAINT `listing_type_sale_ibfk_4` FOREIGN KEY (`sold_type_code`) REFERENCES `sold_type_code` (`code`),
  ADD CONSTRAINT `listing_type_sale_ibfk_5` FOREIGN KEY (`commission_type_code`) REFERENCES `commission_type_code` (`code`),
  ADD CONSTRAINT `listing_type_sale_ibfk_6` FOREIGN KEY (`price_lease_duration_code`) REFERENCES `duration_code` (`code`),
  ADD CONSTRAINT `listing_type_sale_ibfk_7` FOREIGN KEY (`agency_agreement_type_code`) REFERENCES `agency_agreement_type_code` (`code`),
  ADD CONSTRAINT `listing_type_sale_ibfk_8` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `listing_views`
--
ALTER TABLE `listing_views`
  ADD CONSTRAINT `listing_views_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `listing_views_ibfk_2` FOREIGN KEY (`listing_views_code`) REFERENCES `listing_views_code` (`code`),
  ADD CONSTRAINT `listing_views_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `locality_address`
--
ALTER TABLE `locality_address`
  ADD CONSTRAINT `locality_address_ibfk_1` FOREIGN KEY (`locality_street_id`) REFERENCES `locality_street` (`id`),
  ADD CONSTRAINT `locality_address_ibfk_2` FOREIGN KEY (`locality_council_id`) REFERENCES `locality_council` (`id`),
  ADD CONSTRAINT `locality_address_ibfk_3` FOREIGN KEY (`locality_state_id`) REFERENCES `locality_state` (`id`),
  ADD CONSTRAINT `locality_address_ibfk_4` FOREIGN KEY (`locality_region_id`) REFERENCES `locality_region` (`id`),
  ADD CONSTRAINT `locality_address_ibfk_5` FOREIGN KEY (`locality_suburb_id`) REFERENCES `locality_suburb` (`id`),
  ADD CONSTRAINT `locality_address_ibfk_6` FOREIGN KEY (`locality_street_type_id`) REFERENCES `locality_street_type` (`id`);

--
-- Constraints for table `locality_state`
--
ALTER TABLE `locality_state`
  ADD CONSTRAINT `locality_state_ibfk_1` FOREIGN KEY (`locality_country_id`) REFERENCES `locality_country` (`id`);

--
-- Constraints for table `manager_log`
--
ALTER TABLE `manager_log`
  ADD CONSTRAINT `manager_log_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`);

--
-- Constraints for table `manager_user`
--
ALTER TABLE `manager_user`
  ADD CONSTRAINT `manager_user_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `manager_user_ibfk_2` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `manager_user_ibfk_3` FOREIGN KEY (`timezone_code`) REFERENCES `timezone_code` (`code`),
  ADD CONSTRAINT `manager_user_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `manager_user_agreement`
--
ALTER TABLE `manager_user_agreement`
  ADD CONSTRAINT `manager_user_agreement_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `manager_user_auth_assignment`
--
ALTER TABLE `manager_user_auth_assignment`
  ADD CONSTRAINT `manager_user_auth_assignment_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `manager_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manager_user_auth_assignment_ibfk_2` FOREIGN KEY (`userid`) REFERENCES `manager_user` (`id`);

--
-- Constraints for table `manager_user_auth_item_child`
--
ALTER TABLE `manager_user_auth_item_child`
  ADD CONSTRAINT `manager_user_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `manager_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `manager_user_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `manager_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager_user_auth_rights`
--
ALTER TABLE `manager_user_auth_rights`
  ADD CONSTRAINT `manager_user_auth_rights_ibfk_1` FOREIGN KEY (`itemname`) REFERENCES `manager_user_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager_user_location`
--
ALTER TABLE `manager_user_location`
  ADD CONSTRAINT `manager_user_location_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`),
  ADD CONSTRAINT `manager_user_location_ibfk_2` FOREIGN KEY (`geo_source_code`) REFERENCES `geo_source_code` (`code`),
  ADD CONSTRAINT `manager_user_location_ibfk_3` FOREIGN KEY (`geo_accuracy_code`) REFERENCES `geo_accuracy_code` (`code`),
  ADD CONSTRAINT `manager_user_location_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `manager_user_login_log`
--
ALTER TABLE `manager_user_login_log`
  ADD CONSTRAINT `manager_user_login_log_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`);

--
-- Constraints for table `manager_user_reminder`
--
ALTER TABLE `manager_user_reminder`
  ADD CONSTRAINT `manager_user_reminder_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`),
  ADD CONSTRAINT `manager_user_reminder_ibfk_2` FOREIGN KEY (`manager_user_task_id`) REFERENCES `manager_user_task` (`id`),
  ADD CONSTRAINT `manager_user_reminder_ibfk_3` FOREIGN KEY (`manager_user_reminder_type_code`) REFERENCES `manager_user_reminder_type_code` (`code`),
  ADD CONSTRAINT `manager_user_reminder_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `manager_user_reminder_interval`
--
ALTER TABLE `manager_user_reminder_interval`
  ADD CONSTRAINT `manager_user_reminder_interval_ibfk_1` FOREIGN KEY (`manager_user_reminder_id`) REFERENCES `manager_user_reminder` (`id`),
  ADD CONSTRAINT `manager_user_reminder_interval_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `manager_user_task`
--
ALTER TABLE `manager_user_task`
  ADD CONSTRAINT `manager_user_task_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`),
  ADD CONSTRAINT `manager_user_task_ibfk_2` FOREIGN KEY (`manager_user_task_type_code`) REFERENCES `manager_user_task_type_code` (`code`),
  ADD CONSTRAINT `manager_user_task_ibfk_3` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `manager_user_task_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `manager_user_task_contact`
--
ALTER TABLE `manager_user_task_contact`
  ADD CONSTRAINT `manager_user_task_contact_ibfk_1` FOREIGN KEY (`manager_user_task_id`) REFERENCES `manager_user_task` (`id`),
  ADD CONSTRAINT `manager_user_task_contact_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contact` (`id`),
  ADD CONSTRAINT `manager_user_task_contact_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `market_appraisal`
--
ALTER TABLE `market_appraisal`
  ADD CONSTRAINT `market_appraisal_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `new_development`
--
ALTER TABLE `new_development`
  ADD CONSTRAINT `new_development_ibfk_1` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `new_development_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `new_development_asset`
--
ALTER TABLE `new_development_asset`
  ADD CONSTRAINT `new_development_asset_ibfk_1` FOREIGN KEY (`new_development_id`) REFERENCES `new_development` (`id`),
  ADD CONSTRAINT `new_development_asset_ibfk_2` FOREIGN KEY (`listing_asset_type_code`) REFERENCES `listing_asset_type_code` (`code`),
  ADD CONSTRAINT `new_development_asset_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `new_development_listing`
--
ALTER TABLE `new_development_listing`
  ADD CONSTRAINT `new_development_listing_ibfk_1` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `new_development_listing_ibfk_2` FOREIGN KEY (`new_development_id`) REFERENCES `new_development` (`id`),
  ADD CONSTRAINT `new_development_listing_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal`
--
ALTER TABLE `portal`
  ADD CONSTRAINT `portal_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `portal_ibfk_2` FOREIGN KEY (`portal_config_locality_type_code`) REFERENCES `portal_config_locality_type_code` (`code`),
  ADD CONSTRAINT `portal_ibfk_3` FOREIGN KEY (`portal_config_url_format_code`) REFERENCES `portal_config_url_format_code` (`code`);

--
-- Constraints for table `portal_ad`
--
ALTER TABLE `portal_ad`
  ADD CONSTRAINT `portal_ad_ibfk_1` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`),
  ADD CONSTRAINT `portal_ad_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_branding`
--
ALTER TABLE `portal_branding`
  ADD CONSTRAINT `portal_branding_ibfk_1` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`),
  ADD CONSTRAINT `portal_branding_ibfk_2` FOREIGN KEY (`portal_branding_type_code`) REFERENCES `portal_branding_type_code` (`code`),
  ADD CONSTRAINT `portal_branding_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_agency`
--
ALTER TABLE `portal_config_agency`
  ADD CONSTRAINT `portal_config_agency_ibfk_1` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`),
  ADD CONSTRAINT `portal_config_agency_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `portal_config_agency_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_cdn_host`
--
ALTER TABLE `portal_config_cdn_host`
  ADD CONSTRAINT `portal_config_cdn_host_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_group`
--
ALTER TABLE `portal_config_group`
  ADD CONSTRAINT `portal_config_group_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_grouping`
--
ALTER TABLE `portal_config_grouping`
  ADD CONSTRAINT `portal_config_grouping_ibfk_1` FOREIGN KEY (`portal_config_group_id`) REFERENCES `portal_config_group` (`id`),
  ADD CONSTRAINT `portal_config_grouping_ibfk_2` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`),
  ADD CONSTRAINT `portal_config_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_locality`
--
ALTER TABLE `portal_config_locality`
  ADD CONSTRAINT `portal_config_locality_ibfk_1` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`),
  ADD CONSTRAINT `portal_config_locality_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_theme`
--
ALTER TABLE `portal_config_theme`
  ADD CONSTRAINT `portal_config_theme_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_config_theme_attribute`
--
ALTER TABLE `portal_config_theme_attribute`
  ADD CONSTRAINT `portal_config_theme_attribute_ibfk_1` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`),
  ADD CONSTRAINT `portal_config_theme_attribute_ibfk_2` FOREIGN KEY (`portal_config_theme_id`) REFERENCES `portal_config_theme` (`id`),
  ADD CONSTRAINT `portal_config_theme_attribute_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_enquiry`
--
ALTER TABLE `portal_enquiry`
  ADD CONSTRAINT `portal_enquiry_ibfk_10` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `portal_enquiry_ibfk_2` FOREIGN KEY (`portal_enquiry_type_code`) REFERENCES `portal_enquiry_type_code` (`code`),
  ADD CONSTRAINT `portal_enquiry_ibfk_4` FOREIGN KEY (`misc_browser_code`) REFERENCES `misc_browser_code` (`code`),
  ADD CONSTRAINT `portal_enquiry_ibfk_5` FOREIGN KEY (`misc_os_code`) REFERENCES `misc_os_code` (`code`),
  ADD CONSTRAINT `portal_enquiry_ibfk_6` FOREIGN KEY (`portal_enquiry_source_code`) REFERENCES `portal_enquiry_source_code` (`code`),
  ADD CONSTRAINT `portal_enquiry_ibfk_7` FOREIGN KEY (`portal_enquiry_rating_code`) REFERENCES `portal_enquiry_rating_code` (`code`),
  ADD CONSTRAINT `portal_enquiry_ibfk_8` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `portal_enquiry_ibfk_9` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`);

--
-- Constraints for table `portal_favourites_user`
--
ALTER TABLE `portal_favourites_user`
  ADD CONSTRAINT `portal_favourites_user_ibfk_1` FOREIGN KEY (`portal_config_group_id`) REFERENCES `portal_config_group` (`id`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_2` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_3` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_4` FOREIGN KEY (`portal_favourites_user_type_code`) REFERENCES `portal_favourites_user_type_code` (`code`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_5` FOREIGN KEY (`portal_favourites_user_marketing_code`) REFERENCES `portal_favourites_user_marketing_code` (`code`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_6` FOREIGN KEY (`portal_favourites_user_source_code`) REFERENCES `portal_favourites_user_source_code` (`code`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_7` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `portal_favourites_user_ibfk_8` FOREIGN KEY (`portal_id`) REFERENCES `portal` (`id`);

--
-- Constraints for table `portal_favourites_user_listing`
--
ALTER TABLE `portal_favourites_user_listing`
  ADD CONSTRAINT `portal_favourites_user_listing_ibfk_1` FOREIGN KEY (`portal_favourites_user_id`) REFERENCES `portal_favourites_user` (`id`),
  ADD CONSTRAINT `portal_favourites_user_listing_ibfk_2` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `portal_favourites_user_listing_ibfk_3` FOREIGN KEY (`rating_code`) REFERENCES `rating_code` (`code`),
  ADD CONSTRAINT `portal_favourites_user_listing_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_favourites_user_listing_group`
--
ALTER TABLE `portal_favourites_user_listing_group`
  ADD CONSTRAINT `portal_favourites_user_listing_group_ibfk_1` FOREIGN KEY (`portal_favourites_user_id`) REFERENCES `portal_favourites_user` (`id`),
  ADD CONSTRAINT `portal_favourites_user_listing_group_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_favourites_user_listing_grouping`
--
ALTER TABLE `portal_favourites_user_listing_grouping`
  ADD CONSTRAINT `portal_favourites_user_listing_grouping_ibfk_1` FOREIGN KEY (`portal_favourites_user_listing_group_id`) REFERENCES `portal_favourites_user_listing_group` (`id`),
  ADD CONSTRAINT `portal_favourites_user_listing_grouping_ibfk_2` FOREIGN KEY (`portal_favourites_user_listing_id`) REFERENCES `portal_favourites_user_listing` (`id`),
  ADD CONSTRAINT `portal_favourites_user_listing_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_favourites_user_search`
--
ALTER TABLE `portal_favourites_user_search`
  ADD CONSTRAINT `portal_favourites_user_search_ibfk_1` FOREIGN KEY (`portal_favourites_user_id`) REFERENCES `portal_favourites_user` (`id`),
  ADD CONSTRAINT `portal_favourites_user_search_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_favourites_user_search_criteria`
--
ALTER TABLE `portal_favourites_user_search_criteria`
  ADD CONSTRAINT `portal_favourites_user_search_criteria_ibfk_1` FOREIGN KEY (`portal_favourites_user_search_id`) REFERENCES `portal_favourites_user_search` (`id`),
  ADD CONSTRAINT `portal_favourites_user_search_criteria_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_favourites_user_search_group`
--
ALTER TABLE `portal_favourites_user_search_group`
  ADD CONSTRAINT `portal_favourites_user_search_group_ibfk_1` FOREIGN KEY (`portal_favourites_user_id`) REFERENCES `portal_favourites_user` (`id`),
  ADD CONSTRAINT `portal_favourites_user_search_group_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_favourites_user_search_grouping`
--
ALTER TABLE `portal_favourites_user_search_grouping`
  ADD CONSTRAINT `portal_favourites_user_search_grouping_ibfk_1` FOREIGN KEY (`portal_favourites_user_search_group_id`) REFERENCES `portal_favourites_user_search_group` (`id`),
  ADD CONSTRAINT `portal_favourites_user_search_grouping_ibfk_2` FOREIGN KEY (`portal_favourites_user_search_id`) REFERENCES `portal_favourites_user_search` (`id`),
  ADD CONSTRAINT `portal_favourites_user_search_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `portal_log`
--
ALTER TABLE `portal_log`
  ADD CONSTRAINT `portal_log_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`);

--
-- Constraints for table `repair_request`
--
ALTER TABLE `repair_request`
  ADD CONSTRAINT `repair_request_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `repair_request_agent`
--
ALTER TABLE `repair_request_agent`
  ADD CONSTRAINT `repair_request_agent_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`),
  ADD CONSTRAINT `repair_request_agent_ibfk_2` FOREIGN KEY (`repair_request_id`) REFERENCES `repair_request` (`id`),
  ADD CONSTRAINT `repair_request_agent_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `tenancy_application`
--
ALTER TABLE `tenancy_application`
  ADD CONSTRAINT `tenancy_application_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website`
--
ALTER TABLE `website`
  ADD CONSTRAINT `website_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_ibfk_2` FOREIGN KEY (`website_config_group_code`) REFERENCES `website_config_group_code` (`code`),
  ADD CONSTRAINT `website_ibfk_3` FOREIGN KEY (`website_config_url_format_code`) REFERENCES `website_config_url_format_code` (`code`);

--
-- Constraints for table `website_branding`
--
ALTER TABLE `website_branding`
  ADD CONSTRAINT `website_branding_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_branding_ibfk_2` FOREIGN KEY (`website_branding_type_code`) REFERENCES `website_branding_type_code` (`code`),
  ADD CONSTRAINT `website_branding_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_agency`
--
ALTER TABLE `website_config_agency`
  ADD CONSTRAINT `website_config_agency_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_config_agency_ibfk_2` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `website_config_agency_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_cdn_host`
--
ALTER TABLE `website_config_cdn_host`
  ADD CONSTRAINT `website_config_cdn_host_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_group`
--
ALTER TABLE `website_config_group`
  ADD CONSTRAINT `website_config_group_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_grouping`
--
ALTER TABLE `website_config_grouping`
  ADD CONSTRAINT `website_config_grouping_ibfk_1` FOREIGN KEY (`website_config_group_id`) REFERENCES `website_config_group` (`id`),
  ADD CONSTRAINT `website_config_grouping_ibfk_2` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_config_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_locality`
--
ALTER TABLE `website_config_locality`
  ADD CONSTRAINT `website_config_locality_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_config_locality_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_theme`
--
ALTER TABLE `website_config_theme`
  ADD CONSTRAINT `website_config_theme_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_config_theme_attribute`
--
ALTER TABLE `website_config_theme_attribute`
  ADD CONSTRAINT `website_config_theme_attribute_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_config_theme_attribute_ibfk_2` FOREIGN KEY (`website_config_theme_id`) REFERENCES `website_config_theme` (`id`),
  ADD CONSTRAINT `website_config_theme_attribute_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_enquiry`
--
ALTER TABLE `website_enquiry`
  ADD CONSTRAINT `website_enquiry_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_enquiry_ibfk_2` FOREIGN KEY (`website_enquiry_type_code`) REFERENCES `website_enquiry_type_code` (`code`),
  ADD CONSTRAINT `website_enquiry_ibfk_3` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `website_enquiry_ibfk_4` FOREIGN KEY (`misc_browser_code`) REFERENCES `misc_browser_code` (`code`),
  ADD CONSTRAINT `website_enquiry_ibfk_5` FOREIGN KEY (`misc_os_code`) REFERENCES `misc_os_code` (`code`),
  ADD CONSTRAINT `website_enquiry_ibfk_6` FOREIGN KEY (`website_enquiry_source_code`) REFERENCES `website_enquiry_source_code` (`code`),
  ADD CONSTRAINT `website_enquiry_ibfk_7` FOREIGN KEY (`website_enquiry_rating_code`) REFERENCES `website_enquiry_rating_code` (`code`),
  ADD CONSTRAINT `website_enquiry_ibfk_8` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user`
--
ALTER TABLE `website_favourites_user`
  ADD CONSTRAINT `website_favourites_user_ibfk_2` FOREIGN KEY (`salutation_code`) REFERENCES `salutation_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_ibfk_3` FOREIGN KEY (`locality_address_id`) REFERENCES `locality_address` (`id`),
  ADD CONSTRAINT `website_favourites_user_ibfk_4` FOREIGN KEY (`website_favourites_user_type_code`) REFERENCES `website_favourites_user_type_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_ibfk_5` FOREIGN KEY (`website_favourites_user_marketing_code`) REFERENCES `website_favourites_user_marketing_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_ibfk_6` FOREIGN KEY (`website_favourites_user_source_code`) REFERENCES `website_favourites_user_source_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_ibfk_7` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_ibfk_8` FOREIGN KEY (`agency_id`) REFERENCES `agency` (`id`),
  ADD CONSTRAINT `website_favourites_user_ibfk_9` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`id`);

--
-- Constraints for table `website_favourites_user_contact_history`
--
ALTER TABLE `website_favourites_user_contact_history`
  ADD CONSTRAINT `website_favourites_user_contact_history_ibfk_1` FOREIGN KEY (`manager_user_id`) REFERENCES `manager_user` (`id`),
  ADD CONSTRAINT `website_favourites_user_contact_history_ibfk_2` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `website_favourites_user_contact_history_ibfk_3` FOREIGN KEY (`contact_type_code`) REFERENCES `contact_type_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_contact_history_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user_listing`
--
ALTER TABLE `website_favourites_user_listing`
  ADD CONSTRAINT `website_favourites_user_listing_ibfk_1` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `website_favourites_user_listing_ibfk_2` FOREIGN KEY (`listing_id`) REFERENCES `listing` (`id`),
  ADD CONSTRAINT `website_favourites_user_listing_ibfk_3` FOREIGN KEY (`rating_code`) REFERENCES `rating_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_listing_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user_listing_group`
--
ALTER TABLE `website_favourites_user_listing_group`
  ADD CONSTRAINT `website_favourites_user_listing_group_ibfk_1` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `website_favourites_user_listing_group_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user_listing_grouping`
--
ALTER TABLE `website_favourites_user_listing_grouping`
  ADD CONSTRAINT `website_favourites_user_listing_grouping_ibfk_1` FOREIGN KEY (`website_favourites_user_listing_group_id`) REFERENCES `website_favourites_user_listing_group` (`id`),
  ADD CONSTRAINT `website_favourites_user_listing_grouping_ibfk_2` FOREIGN KEY (`website_favourites_user_listing_id`) REFERENCES `website_favourites_user_listing` (`id`),
  ADD CONSTRAINT `website_favourites_user_listing_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user_search`
--
ALTER TABLE `website_favourites_user_search`
  ADD CONSTRAINT `website_favourites_user_search_ibfk_1` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `website_favourites_user_search_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_favourites_user_search_ibfk_3` FOREIGN KEY (`frequency_code`) REFERENCES `frequency_code` (`code`);

--
-- Constraints for table `website_favourites_user_search_criteria`
--
ALTER TABLE `website_favourites_user_search_criteria`
  ADD CONSTRAINT `website_favourites_user_search_criteria_ibfk_1` FOREIGN KEY (`website_favourites_user_search_id`) REFERENCES `website_favourites_user_search` (`id`),
  ADD CONSTRAINT `website_favourites_user_search_criteria_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user_search_group`
--
ALTER TABLE `website_favourites_user_search_group`
  ADD CONSTRAINT `website_favourites_user_search_group_ibfk_1` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`),
  ADD CONSTRAINT `website_favourites_user_search_group_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_favourites_user_search_grouping`
--
ALTER TABLE `website_favourites_user_search_grouping`
  ADD CONSTRAINT `website_favourites_user_search_grouping_ibfk_1` FOREIGN KEY (`website_favourites_user_search_group_id`) REFERENCES `website_favourites_user_search_group` (`id`),
  ADD CONSTRAINT `website_favourites_user_search_grouping_ibfk_2` FOREIGN KEY (`website_favourites_user_search_id`) REFERENCES `website_favourites_user_search` (`id`),
  ADD CONSTRAINT `website_favourites_user_search_grouping_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_log`
--
ALTER TABLE `website_log`
  ADD CONSTRAINT `website_log_ibfk_1` FOREIGN KEY (`website_favourites_user_id`) REFERENCES `website_favourites_user` (`id`);

--
-- Constraints for table `website_media`
--
ALTER TABLE `website_media`
  ADD CONSTRAINT `website_media_ibfk_1` FOREIGN KEY (`website_media_type_code`) REFERENCES `website_media_type_code` (`code`),
  ADD CONSTRAINT `website_media_ibfk_2` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_page`
--
ALTER TABLE `website_page`
  ADD CONSTRAINT `website_page_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_page_ibfk_2` FOREIGN KEY (`website_template_page_id`) REFERENCES `website_template_page` (`id`),
  ADD CONSTRAINT `website_page_ibfk_3` FOREIGN KEY (`parent_website_page_id`) REFERENCES `website_page` (`id`),
  ADD CONSTRAINT `website_page_ibfk_4` FOREIGN KEY (`website_page_publish_status_code`) REFERENCES `website_page_publish_status_code` (`code`),
  ADD CONSTRAINT `website_page_ibfk_5` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_page_component`
--
ALTER TABLE `website_page_component`
  ADD CONSTRAINT `website_page_component_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_page_component_ibfk_2` FOREIGN KEY (`website_page_id`) REFERENCES `website_page` (`id`),
  ADD CONSTRAINT `website_page_component_ibfk_3` FOREIGN KEY (`website_template_page_component_id`) REFERENCES `website_template_page_component` (`id`);

--
-- Constraints for table `website_page_custom`
--
ALTER TABLE `website_page_custom`
  ADD CONSTRAINT `website_page_custom_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_page_custom_ibfk_2` FOREIGN KEY (`website_template_page_custom_id`) REFERENCES `website_template_page_custom` (`id`),
  ADD CONSTRAINT `website_page_custom_ibfk_3` FOREIGN KEY (`parent_website_page_custom_id`) REFERENCES `website_page_custom` (`id`),
  ADD CONSTRAINT `website_page_custom_ibfk_4` FOREIGN KEY (`website_page_publish_status_code`) REFERENCES `website_page_publish_status_code` (`code`),
  ADD CONSTRAINT `website_page_custom_ibfk_5` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_page_custom_component`
--
ALTER TABLE `website_page_custom_component`
  ADD CONSTRAINT `website_page_custom_component_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_page_custom_component_ibfk_2` FOREIGN KEY (`website_page_custom_id`) REFERENCES `website_page_custom` (`id`),
  ADD CONSTRAINT `website_page_custom_component_ibfk_3` FOREIGN KEY (`website_template_page_custom_component_id`) REFERENCES `website_template_page_custom_component` (`id`);

--
-- Constraints for table `website_page_list`
--
ALTER TABLE `website_page_list`
  ADD CONSTRAINT `website_page_list_ibfk_1` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`),
  ADD CONSTRAINT `website_page_list_ibfk_2` FOREIGN KEY (`website_template_page_list_id`) REFERENCES `website_template_page_list` (`id`),
  ADD CONSTRAINT `website_page_list_ibfk_3` FOREIGN KEY (`website_page_publish_status_code`) REFERENCES `website_page_publish_status_code` (`code`),
  ADD CONSTRAINT `website_page_list_ibfk_4` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_page_list_entry`
--
ALTER TABLE `website_page_list_entry`
  ADD CONSTRAINT `website_page_list_entry_ibfk_1` FOREIGN KEY (`website_page_list_id`) REFERENCES `website_page_list` (`id`),
  ADD CONSTRAINT `website_page_list_entry_ibfk_2` FOREIGN KEY (`website_page_publish_status_code`) REFERENCES `website_page_publish_status_code` (`code`),
  ADD CONSTRAINT `website_page_list_entry_ibfk_3` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_page_list_entry_component`
--
ALTER TABLE `website_page_list_entry_component`
  ADD CONSTRAINT `website_page_list_entry_component_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_page_list_entry_component_ibfk_2` FOREIGN KEY (`website_page_list_entry_id`) REFERENCES `website_page_list_entry` (`id`),
  ADD CONSTRAINT `website_page_list_entry_component_ibfk_3` FOREIGN KEY (`website_template_page_list_entry_component_id`) REFERENCES `website_template_page_list_entry_component` (`id`);

--
-- Constraints for table `website_page_media`
--
ALTER TABLE `website_page_media`
  ADD CONSTRAINT `website_page_media_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_page_media_ibfk_2` FOREIGN KEY (`website_page_id`) REFERENCES `website_page` (`id`);

--
-- Constraints for table `website_template_page`
--
ALTER TABLE `website_template_page`
  ADD CONSTRAINT `website_template_page_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_template_page_component`
--
ALTER TABLE `website_template_page_component`
  ADD CONSTRAINT `website_template_page_component_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_template_page_component_ibfk_2` FOREIGN KEY (`website_template_page_id`) REFERENCES `website_template_page` (`id`),
  ADD CONSTRAINT `website_template_page_component_ibfk_3` FOREIGN KEY (`website_page_component_code`) REFERENCES `website_page_component_code` (`code`);

--
-- Constraints for table `website_template_page_custom`
--
ALTER TABLE `website_template_page_custom`
  ADD CONSTRAINT `website_template_page_custom_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_template_page_custom_component`
--
ALTER TABLE `website_template_page_custom_component`
  ADD CONSTRAINT `website_template_page_custom_component_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_template_page_custom_component_ibfk_2` FOREIGN KEY (`website_template_page_custom_id`) REFERENCES `website_template_page_custom` (`id`),
  ADD CONSTRAINT `website_template_page_custom_component_ibfk_3` FOREIGN KEY (`website_page_component_code`) REFERENCES `website_page_component_code` (`code`);

--
-- Constraints for table `website_template_page_list`
--
ALTER TABLE `website_template_page_list`
  ADD CONSTRAINT `website_template_page_list_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`);

--
-- Constraints for table `website_template_page_list_entry_component`
--
ALTER TABLE `website_template_page_list_entry_component`
  ADD CONSTRAINT `website_template_page_list_entry_component_ibfk_1` FOREIGN KEY (`status_code`) REFERENCES `status_code` (`code`),
  ADD CONSTRAINT `website_template_page_list_entry_component_ibfk_2` FOREIGN KEY (`website_template_page_list_id`) REFERENCES `website_template_page_list` (`id`),
  ADD CONSTRAINT `website_template_page_list_entry_component_ibfk_3` FOREIGN KEY (`website_page_component_code`) REFERENCES `website_page_component_code` (`code`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
