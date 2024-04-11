Sure, I'll add comments to explain the structure and purpose of each table and its columns. Here's the modified SQL dump with comments:

```sql
-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 12, 2019 at 08:38 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

-- Set SQL mode and autocommit settings
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

-- Create table for storing internship applications
CREATE TABLE `applications` (
  `id` int(11) NOT NULL,
  `cus_id` int(11) NOT NULL,  -- Customer ID who applied
  `int_id` int(11) NOT NULL,  -- Internship ID applied for
  `applied` int(11) NOT NULL DEFAULT '0'  -- Flag indicating if application is submitted
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert data into applications table
INSERT INTO `applications` (`id`, `cus_id`, `int_id`, `applied`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 2, 1, 1),
(4, 2, 2, 1),
(5, 3, 1, 1),
(6, 3, 2, 1);

-- --------------------------------------------------------

-- Create table for storing customer (student/trainee) information
CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` int(100) NOT NULL,
  `phone` text NOT NULL,
  `country` varchar(100) NOT NULL,
  `ip` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert data into customers table
INSERT INTO `customers` (`id`, `fullname`, `email`, `password`, `address1`, `address2`, `city`, `state`, `zipcode`, `phone`, `country`, `ip`) VALUES
(1, 'Om Lahore', 'om.lahore@example.com', 'password1', 'Address1', 'Address2', 'Pune', 'Maharashtra', 411001, '1234567890', 'India', '::1'),
(2, 'Jatin Sathe', 'jatin.sathe@example.com', 'password2', 'Address1', 'Address2', 'Pune', 'Maharashtra', 411001, '1234567890', 'India', '::1'),
(3, 'Atharva Navani', 'atharva.navani@example.com', 'password3', 'Address1', 'Address2', 'Pune', 'Maharashtra', 411001, '1234567890', 'India', '::1');

-- --------------------------------------------------------

-- Create table for storing employer (company) information
CREATE TABLE `employer` (
  `id` int(11) NOT NULL,
  `nameOfCompany` text NOT NULL,
  `aboutCompany` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address1` text NOT NULL,
  `address2` text NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `zipcode` int(100) NOT NULL,
  `phone` text NOT NULL,
  `country` varchar(100) NOT NULL,
  `ip` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Insert data into employer table
INSERT INTO `employer` (`id`, `nameOfCompany`, `aboutCompany`, `email`, `password`, `address1`, `address2`, `city`, `state`, `zipcode`, `phone`, `country`, `ip`, `date`) VALUES
(1, 'Company XYZ', 'About Company XYZ', 'info@example.com', 'password4', 'Address1', 'Address2', 'Pune', 'Maharashtra', 411001, '1234567890', 'India', '::1', '2019-09-04 17:03:24'),
(2, 'Company ABC', 'About Company ABC', 'info@example.com', 'password5', 'Address1', 'Address2', 'Pune', 'Maharashtra', 411001, '1234567890', 'India', '::1', '2019-09-04 18:20:09');

-- --------------------------------------------------------

-- Create table for storing internship details
CREATE TABLE `internships` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) NOT NULL,
  `category` text NOT NULL,
  `postedOn` text NOT NULL,
  `applyBy` text NOT NULL,
  `nameOfCompany` text NOT NULL,
  `aboutCompany` text NOT NULL,
  `aboutInternship` text NOT NULL,
  `location` text NOT NULL,
  `perks` text NOT NULL,
  `duration` int(100) NOT NULL,
  `stipend` int(100) NOT NULL,
  `positions` int(11) NOT NULL,
  `whoCanApply` text NOT NULL,
  `featured` tinyint(4) NOT NULL DEFAULT
);

-- Insert data into internships table
INSERT INTO `internships` (`id`, `emp_id`, `category`, `postedOn`, `applyBy`, `nameOfCompany`, `aboutCompany`, `aboutInternship`, `location`, `perks`, `duration`, `stipend`, `positions`, `whoCanApply`, `featured`) VALUES
(1, 2, 'Web Development', '2019-09-04', '2019-09-20', 'IIT Bombay', 'About IIT Bombay', 'Internship Responsibilities', 'Pune', 'Certificate', 6, 5000, 5, 'Who can apply details', 0),
(2, 1, 'Graphic Designing', '2019-09-05', '2019-09-20', 'NETMATE SOLUTIONS', 'About NETMATE SOLUTIONS', 'Internship Responsibilities', 'Pune', 'Certificate, Recommendation Letter', 3, 10000, 2, 'Who can apply details', 0);

-- --------------------------------------------------------

-- Create table for storing user (admin/editor) information
