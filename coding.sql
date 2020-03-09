-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 09, 2020 at 01:19 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(50) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phone_num` int(15) DEFAULT NULL,
  `msg` text,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(50, 'Rohit Chaudhary', 484658869, 'Hello, I am rohit', '2020-03-06 06:32:01', 'rohit626626@gmail.com'),
(51, 'Rohit', 1010101101, 'secound message using flask', '2020-03-06 06:34:31', 'rohit626626@gmail.com'),
(52, 'Rohit', 1010101101, 'secound message using flask', '2020-03-06 06:34:52', 'rohit626626@gmail.com'),
(53, 'Rohit', 20000, 'secound msg', '2020-03-06 06:35:24', 'rohit626626@gmail.com'),
(54, 'Rohit', 3534, 'second msg using flask', '2020-03-06 06:37:56', 'rohit626626@gmail.com'),
(55, 'prince', 0, 'fff', '2020-03-06 11:57:49', 'dds'),
(56, 'prince', 0, 'fff', '2020-03-06 11:58:32', 'dds'),
(57, 'czxc', 0, 'fdf', '2020-03-06 11:58:59', 'sff'),
(58, 'amit', 2147483647, 'dd', '2020-03-06 11:59:27', 'rohit@gmail.com'),
(59, NULL, NULL, NULL, '2020-03-08 10:41:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` varchar(25) NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'slug is a titles for cont', 'this is good work', 'post-slug', 'this is a slug ss', 'content-bg.jpg', '2020-03-09 11:57:05'),
(2, 'new', 'this tag good', 'sec-post', 'This is a secound post in flask . we insert', 'about-bg.jpg', '2020-03-09 11:53:36'),
(3, '.NET', 'apps ', 'web-app', '.Net is a web designing  language', 'about-bg.jpg', '2020-03-08 12:46:42'),
(5, 'PHP OOPs', 'Php ', 'web-app', 'php is a web programing', 'contect-bg.png', '2020-03-08 12:57:54'),
(6, 'This is new', 'it is new post ', 'new-post', 'sa;lklfsk kpsodfopdsmf d', 'contect-bg.png', '2020-03-09 11:44:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
