-- Copyright © 2014-2017, Michael Francisco / FCS. All rights reserved.
/*
 GenHotel database scripts for MySQL is licensed under the terms of the GPLv2
 <http://www.gnu.org/licenses/old-licenses/gpl-2.0.html>.

 This program is free software; you can redistribute it and/or modify 
 it under the terms of the GNU General Public License as published 
 by the Free Software Foundation; version 2 of the License.

 This script is distributed in the hope that it will be useful, but 
 WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY 
 or FITNESS FOR A PARTICULAR BUSINESS MODEL. See the GNU General Public License 
 for more details. 
*/

CREATE DATABASE IF NOT EXISTS `genhotel` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE genhotel;

CREATE TABLE IF NOT EXISTS `booking` (
  `booking_id` char(36) NOT NULL,
  `guest_id` char(36) DEFAULT NULL,
  `room_id` char(36) DEFAULT NULL,
  `checkin` datetime DEFAULT NULL,
  `checkout` datetime DEFAULT NULL,
  `status_code` varchar(3) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `staff_id_created` char(36) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `guest` (
  `guest_id` char(36) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `nationality_id` int(2) DEFAULT NULL,
  `passport_no` varchar(10) DEFAULT NULL,
  `email` varchar(245) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `contact_no` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_department` (
  `dept_code` varchar(3) NOT NULL,
  `dept_title` varchar(50) DEFAULT NULL,
  `dept_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_room_type` (
  `room_type_id` char(36) NOT NULL,
  `room_type_description` varchar(45) DEFAULT NULL,
  `default_fee` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`room_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_service_type` (
  `service_type_id` char(36) NOT NULL,
  `service_type_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_serviceitem_type` (
  `serviceitem_type_id` char(36) NOT NULL,
  `service_type_id` char(36) DEFAULT NULL,
  `serviceitem_description` varchar(50) DEFAULT NULL,
  `serviceitem_defaultfee` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`serviceitem_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_stafftype` (
  `stafftype_id` char(36) NOT NULL,
  `dept_code` varchar(3) DEFAULT NULL,
  `pay` decimal(7,2) DEFAULT '0.00',
  PRIMARY KEY (`stafftype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_status` (
  `status_code` varchar(3) NOT NULL,
  `status_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_staff` (
  `staff_id` char(36) NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `contact_no` varchar(12) DEFAULT NULL,
  `stafftype_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mnt_stafftype` (
  `stafftype_id` char(36) NOT NULL,
  `dept_code` varchar(3) DEFAULT NULL,
  `pay` decimal(7,2) DEFAULT '0.00',
  PRIMARY KEY (`stafftype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `reservation` (
  `reservation_id` char(36) NOT NULL,
  `guest_id` char(36) DEFAULT NULL,
  `booking_date` datetime DEFAULT NULL,
  `room_type` varchar(2) DEFAULT NULL,
  `confirmation_code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`reservation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `room` (
  `room_id` char(36) NOT NULL,
  `room_type_id` char(36) DEFAULT NULL,
  `fee` decimal(6,0) DEFAULT NULL,
  `current_booking_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `service` (
  `serviceitem_id` char(36) NOT NULL,
  `booking_id` char(36) DEFAULT NULL,
  `serviceitem_type_id` char(36) DEFAULT NULL,
  `fee` decimal(7,2) DEFAULT NULL,
  `discount` decimal(7,2) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  PRIMARY KEY (`serviceitem_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
