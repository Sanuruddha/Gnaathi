-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2016 at 07:45 PM
-- Server version: 5.7.11
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gnaathi`
--

-- --------------------------------------------------------

--
-- Table structure for table `acquisitor`
--

CREATE TABLE `acquisitor` (
  `user_id` int(4) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_no` char(10) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `looking_for` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `aquisition`
--

CREATE TABLE `aquisition` (
  `user_id` int(4) NOT NULL,
  `item_id` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `disease`
--

CREATE TABLE `disease` (
  `disease_id` int(4) NOT NULL,
  `description` longtext NOT NULL,
  `symptoms` longtext NOT NULL,
  `first_aid` longtext NOT NULL,
  `remedies` longtext NOT NULL,
  `prevention` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `reg_no` varchar(20) NOT NULL,
  `location` decimal(20,0) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `image` varbinary(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `disease_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation`
--

CREATE TABLE `donation` (
  `user_id` int(4) NOT NULL,
  `item_id` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donation_item`
--

CREATE TABLE `donation_item` (
  `item_id` int(5) NOT NULL,
  `item_name` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `donors`
--

CREATE TABLE `donors` (
  `user_id` int(4) NOT NULL,
  `nic_no` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_no` varchar(10) NOT NULL,
  `blood_group` varchar(10) NOT NULL,
  `donation_type` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friend_list`
--

CREATE TABLE `friend_list` (
  `user_id` int(4) NOT NULL,
  `friend_id` int(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medical_center`
--

CREATE TABLE `medical_center` (
  `user_id` int(4) NOT NULL,
  `reg_no` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `contact_no` char(10) NOT NULL,
  `advertisement` varbinary(1000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reaserch_person`
--

CREATE TABLE `reaserch_person` (
  `user_id` int(4) NOT NULL,
  `field` varchar(20) NOT NULL,
  `post` varbinary(10000) NOT NULL,
  `date` timestamp NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recieved_chat`
--

CREATE TABLE `recieved_chat` (
  `user_id` int(10) NOT NULL,
  `message` varchar(100) NOT NULL,
  `recieved_from` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reply`
--

CREATE TABLE `reply` (
  `thread_id` int(5) NOT NULL,
  `user_id` int(4) NOT NULL,
  `time` timestamp NOT NULL,
  `content` varbinary(20000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `sent_chat`
--

CREATE TABLE `sent_chat` (
  `user_id` int(10) NOT NULL,
  `message` varchar(100) NOT NULL,
  `sent_to` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `thread`
--

CREATE TABLE `thread` (
  `thread_id` int(5) NOT NULL,
  `user_id` int(4) NOT NULL,
  `time` timestamp NOT NULL,
  `subject` varchar(100) NOT NULL,
  `content` varbinary(20000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(5) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_type` int(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_name`, `email`, `password`, `user_type`) VALUES
(1, 'admin', 'shihananuruddha@gmail.com', '123456', 0),
(2, 'regular', 'regularuser@gmail.com', '123456', 1),
(6, 'lokka', 'shihananuruddha2@gmail.com', '123456', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acquisitor`
--
ALTER TABLE `acquisitor`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `aquisition`
--
ALTER TABLE `aquisition`
  ADD KEY `user_id` (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `disease`
--
ALTER TABLE `disease`
  ADD PRIMARY KEY (`disease_id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`reg_no`),
  ADD KEY `disease_id` (`disease_id`);

--
-- Indexes for table `donation`
--
ALTER TABLE `donation`
  ADD KEY `user_id` (`user_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `donation_item`
--
ALTER TABLE `donation_item`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `donors`
--
ALTER TABLE `donors`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `friend_list`
--
ALTER TABLE `friend_list`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `friend_id` (`friend_id`);

--
-- Indexes for table `medical_center`
--
ALTER TABLE `medical_center`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `reaserch_person`
--
ALTER TABLE `reaserch_person`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `reply`
--
ALTER TABLE `reply`
  ADD PRIMARY KEY (`time`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `thread_id` (`thread_id`);

--
-- Indexes for table `thread`
--
ALTER TABLE `thread`
  ADD PRIMARY KEY (`thread_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
