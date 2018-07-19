-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2018 at 07:16 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eby_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `market_sites`
--

CREATE TABLE `market_sites` (
  `id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `url` longtext NOT NULL,
  `serach_url` longtext NOT NULL,
  `offset` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `market_sites`
--

INSERT INTO `market_sites` (`id`, `name`, `url`, `serach_url`, `offset`) VALUES
(1, 'walmart', 'https://www.walmart.com/', 'https://www.walmart.com/search/?query=', 0),
(2, 'tigerdirect', 'http://www.tigerdirect.com', 'http://www.tigerdirect.com/applications/SearchTools/search.asp?keywords=', 0),
(3, 'target', 'https://www.target.com', 'https://redsky.target.com/v1/plp/search/?count=1&offset=0&keyword=', 0),
(5, 'newegg', 'https://www.newegg.com', 'https://www.newegg.com/Product/ProductList.aspx?Submit=ENE&DEPA=0&Order=BESTMATCH&N=-1&isNodeId=1&Description=', 0),
(6, 'homedepot', 'https://www.homedepot.com', 'https://www.homedepot.com/s/0693690569058', 0),
(7, 'amazon', 'https://www.amazon.com', 'https://www.amazon.com/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=', 0),
(8, 'csv', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTmDBoYQfltY3KdvSA6Z1_w4yyl2vbqXSqLmVG5TJV1-5Y_nf6VdgzH_h2KoXJ0rQNaVIuzrMbb_aVO/pub?output=csv', 'https://docs.google.com/spreadsheets/d/e/2PACX-1vTmDBoYQfltY3KdvSA6Z1_w4yyl2vbqXSqLmVG5TJV1-5Y_nf6VdgzH_h2KoXJ0rQNaVIuzrMbb_aVO/pub?output=csv', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `market_sites`
--
ALTER TABLE `market_sites`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `market_sites`
--
ALTER TABLE `market_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
