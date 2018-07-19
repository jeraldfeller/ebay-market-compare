-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 19, 2018 at 07:33 AM
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
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(60) NOT NULL,
  `url` longtext NOT NULL,
  `complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `url`, `complete`) VALUES
(134, 'Motors', 'https://www.ebay.com/b/Auto-Parts-and-Vehicles/6000/bn_1865334', 1),
(135, 'Fashion', 'https://www.ebay.com/b/Fashion/bn_7000259856', 1),
(136, 'Electronics', 'https://www.ebay.com/b/Electronics/bn_7000259124', 1),
(137, 'Collectibles & Art', 'https://www.ebay.com/b/Collectibles-Art/bn_7000259855', 1),
(138, 'Home & Garden', 'https://www.ebay.com/b/Home-Garden/11700/bn_1853126', 1),
(139, 'Sporting Goods', 'https://www.ebay.com/b/Sporting-Goods/888/bn_1865031', 1),
(140, 'Toys & Hobbies', 'https://www.ebay.com/b/Toys-Hobbies/220/bn_1865497', 1),
(141, 'Business & Industrial', 'https://www.ebay.com/b/Business-Industrial/12576/bn_1853744', 1),
(142, 'Music', 'https://www.ebay.com/rpp/music', 1);

-- --------------------------------------------------------

--
-- Table structure for table `market_product_match`
--

CREATE TABLE `market_product_match` (
  `id` int(11) NOT NULL,
  `market_site_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `upc` varchar(60) NOT NULL,
  `market_price` double NOT NULL,
  `ebay_price` double NOT NULL,
  `market_url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `product_name` varchar(120) NOT NULL,
  `product_url` longtext NOT NULL,
  `product_upc` varchar(60) NOT NULL,
  `product_price` double NOT NULL,
  `date_executed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `product_sold_links`
--

CREATE TABLE `product_sold_links` (
  `id` int(11) NOT NULL,
  `sub_category_id` int(11) NOT NULL,
  `url` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_sold` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category` varchar(60) NOT NULL,
  `url` longtext NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT NULL,
  `has_listings` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `category_id`, `category`, `url`, `parent`, `has_child`, `has_listings`, `status`) VALUES
(767, 134, 'Apparel &amp; Merchandise', 'https://www.ebay.com/b/Motors-Apparel-Merchandise/6747/bn_583691', NULL, NULL, 1, 1),
(768, 134, 'Exterior', 'https://www.ebay.com/b/Car-Truck-Exterior-Parts/33637/bn_584029', NULL, NULL, 1, 1),
(769, 134, 'Interior', 'https://www.ebay.com/b/Car-Truck-Interior-Parts/33694/bn_584056', NULL, NULL, 1, 1),
(770, 134, 'Lighting &amp; Lamps', 'https://www.ebay.com/b/Car-Truck-Lighting-Lamps/33707/bn_557923', NULL, NULL, 1, 1),
(771, 134, 'Suspension &amp; Steering', 'https://www.ebay.com/b/Car-Truck-Suspension-Steering-Parts/33579/bn_577405', NULL, NULL, 1, 0),
(772, 134, 'Wheels, Tires &amp; Parts', 'https://www.ebay.com/b/Car-Truck-Wheels-Tires-Parts/33743/bn_584076', NULL, NULL, 1, 0),
(773, 134, 'Body &amp; Frame', 'https://www.ebay.com/b/Motorcycle-Body-Frame/35559/bn_557947', NULL, NULL, 1, 0),
(774, 134, 'Engines &amp; Engine Parts', 'https://www.ebay.com/b/Motorcycle-Engines-Parts/171107/bn_561087', NULL, NULL, 1, 0),
(775, 134, 'Motorcycle Accessories', 'https://www.ebay.com/b/Motorcycle-Accessories/25622/bn_78211228', NULL, NULL, 1, 0),
(776, 134, 'Exhausts &amp; Exhaust Systems', 'https://www.ebay.com/b/Motorcycle-Exhausts-Exhaust-System-Parts/180027/bn_558104', NULL, NULL, 1, 0),
(777, 134, 'Wheels, Tires &amp; Tubes', 'https://www.ebay.com/b/Motorcycle-Wheels-Tires-Tubes/180035/bn_574767', NULL, NULL, 1, 0),
(778, 134, 'Hand Tools', 'https://www.ebay.com/b/Automotive-Hand-Tools/43990/bn_1880530', NULL, NULL, 1, 0),
(779, 134, 'Air Tools', 'https://www.ebay.com/b/Automotive-Air-Tools/43985/bn_1880492', NULL, NULL, 1, 0),
(780, 134, 'Shop Equipment', 'https://www.ebay.com/b/Automotive-Shop-Equipment-Supplies/183745/bn_1880567', NULL, NULL, 1, 0),
(781, 134, 'Detailing', 'https://www.ebay.com/b/Automotive-Care-Detailing/179448/bn_1880904', NULL, NULL, 1, 0),
(782, 134, 'Auto Diagnostic Tools', 'https://www.ebay.com/b/Automotive-Diagnostic-Service-Tools/179474/bn_1880617', NULL, NULL, 1, 0),
(783, 134, 'Car &amp; Truck Apparel &amp; Merchandise', 'https://www.ebay.com/b/Car-Truck-Apparel-Merchandise/50428/bn_584453', NULL, NULL, 1, 0),
(784, 134, 'Sport Bike', 'https://www.ebay.com/b/Sport-Bike-Motorcycles/6024/bn_55173421', NULL, NULL, 1, 0),
(785, 134, 'Cruiser', 'https://www.ebay.com/b/Cruiser-Motorcycles/6024/bn_97057653', NULL, NULL, 1, 0),
(786, 134, 'Touring', 'https://www.ebay.com/b/Touring-Motorcycles/6024/bn_97057658', NULL, NULL, 1, 0),
(787, 134, 'Standard', 'https://www.ebay.com/b/Standard-Motorcycles/6024/bn_97057652', NULL, NULL, 1, 0),
(788, 134, 'Naked', 'https://www.ebay.com/b/Naked-Motorcycles/6024/bn_97057657', NULL, NULL, 1, 0),
(789, 134, 'Off-Road', 'https://www.ebay.com/b/Off-Road-Motorcycles/6024/bn_59532319', NULL, NULL, 1, 0),
(790, 134, 'Chopper', 'https://www.ebay.com/b/Type-Chopper/6024/bn_57336502', NULL, NULL, 1, 0),
(791, 134, 'Reverse Trike', 'https://www.ebay.com/b/Reverse-Trike-Motorcycles/6024/bn_97801052', NULL, NULL, 1, 0),
(792, 134, 'Aston Martin', 'https://www.ebay.com/b/Aston-Martin-Cars-and-Trucks/6001/bn_24010350', NULL, NULL, 1, 0),
(793, 134, 'Bentley', 'https://www.ebay.com/b/Bentley-Cars-and-Trucks/6001/bn_24015503', NULL, NULL, 1, 0),
(794, 134, 'Bugatti', 'https://www.ebay.com/b/Bugatti-Cars-and-Trucks/6001/bn_24016659', NULL, NULL, 1, 0),
(795, 134, 'Ferrari', 'https://www.ebay.com/b/Ferrari-Cars-and-Trucks/6001/bn_24013196', NULL, NULL, 1, 0),
(796, 134, 'Lamborghini', 'https://www.ebay.com/b/Lamborghini-Cars-and-Trucks/6001/bn_24013232', NULL, NULL, 1, 0),
(797, 134, 'Maserati', 'https://www.ebay.com/b/Maserati-Cars-and-Trucks/6001/bn_24016720', NULL, NULL, 1, 0),
(798, 134, 'Maybach', 'https://www.ebay.com/b/Maybach-Cars-and-Trucks/6001/bn_24017253', NULL, NULL, 1, 0),
(799, 134, 'Porsche', 'https://www.ebay.com/b/Porsche-Cars-and-Trucks/6001/bn_24014594', NULL, NULL, 1, 0),
(800, 134, 'Rolls-Royce ', 'https://www.ebay.com/b/Rolls-Royce-Cars-and-Trucks/6001/bn_24016968', NULL, NULL, 1, 0),
(975, 135, 'Tops &amp; Blouses', 'https://www.ebay.com/b/Womens-Tops-Blouses/53159/bn_661824', NULL, NULL, 1, 0),
(976, 135, 'Dresses', 'https://www.ebay.com/b/Womens-Dresses/63861/bn_661850', NULL, NULL, 1, 0),
(977, 135, 'Jeans', 'https://www.ebay.com/b/Womens-Jeans/11554/bn_661774', NULL, NULL, 1, 0),
(978, 135, 'Activewear', 'https://www.ebay.com/b/Womens-Athletic-Apparel/137085/bn_661886', NULL, NULL, 1, 0),
(979, 135, 'Swimwear', 'https://www.ebay.com/b/Womens-Swimwear/63867/bn_661856', NULL, NULL, 1, 0),
(980, 135, 'Jumpsuits', 'https://www.ebay.com/b/Curvy-Womens-Style/bn_7000259819', NULL, NULL, 1, 0),
(981, 135, 'Skirts', 'https://www.ebay.com/b/Womens-Skirts/63864/bn_661853', NULL, NULL, 1, 0),
(982, 135, 'Shorts', 'https://www.ebay.com/b/Womens-Shorts/11555/bn_661775', NULL, NULL, 1, 0),
(983, 135, 'Plus Sizes', 'https://www.ebay.com/b/Curvy-Womens-Style/bn_7000259819', NULL, NULL, 1, 0),
(984, 135, 'T-Shirts', 'https://www.ebay.com/b/Mens-T-Shirts/15687/bn_704987', NULL, NULL, 1, 0),
(985, 135, 'Casual Shirts', 'https://www.ebay.com/b/Mens-Casual-Shirts/57990/bn_705424', NULL, NULL, 1, 0),
(986, 135, 'Dress Shirts', 'https://www.ebay.com/b/Mens-Dress-Shirts/57991/bn_694406', NULL, NULL, 1, 0),
(987, 135, 'Pants', 'https://www.ebay.com/b/Mens-Pants/57989/bn_704981', NULL, NULL, 1, 0),
(988, 135, 'Coats &amp; Jackets', 'https://www.ebay.com/b/Mens-Coats-Jackets/57988/bn_704982', NULL, NULL, 1, 0),
(989, 135, 'Big &amp; Tall', 'https://www.ebay.com/b/Big-Tall-Clothing-for-Men/1059/bn_4116887', NULL, NULL, 1, 0),
(990, 135, 'Baby Girls (0M-5T)', 'https://www.ebay.com/b/Girls-Clothing-Newborn-5T/147192/bn_661888', NULL, NULL, 1, 0),
(991, 135, 'Baby Accessories', 'https://www.ebay.com/b/Baby-Clothing-Accessories/163222/bn_661912', NULL, NULL, 1, 0),
(992, 135, 'Girls (4-20)', 'https://www.ebay.com/b/Girls-Clothing-Sizes-4-Up/11462/bn_1650057', NULL, NULL, 1, 0),
(993, 135, 'Girls\' Shoes', 'https://www.ebay.com/b/Girls-Shoes/57974/bn_661842', NULL, NULL, 1, 0),
(994, 135, 'Girls\' Accessories', 'https://www.ebay.com/b/Girls-Accessories/15628/bn_661778', NULL, NULL, 1, 0),
(995, 135, 'Baby Boys (0M-5T)', 'https://www.ebay.com/b/Newborn-5T-Clothing-for-Boys/147317/bn_661897', NULL, NULL, 1, 0),
(996, 135, 'Baby Shoes', 'https://www.ebay.com/b/Baby-Toddler-Shoes/147285/bn_661896', NULL, NULL, 1, 0),
(997, 135, 'Boys (4-20)', 'https://www.ebay.com/b/Boys-Clothing-Sizes-4-Up/11452/bn_661760', NULL, NULL, 1, 0),
(998, 135, 'Boys\' Shoes', 'https://www.ebay.com/b/Boys-Shoes/57929/bn_661841', NULL, NULL, 1, 0),
(999, 135, 'Boys\' Accessories', 'https://www.ebay.com/b/Boys-Accessories/57881/bn_661831', NULL, NULL, 1, 0),
(1000, 135, 'Fine Jewelry', 'https://www.ebay.com/b/Fine-Jewelry/4196/bn_2408477', NULL, NULL, 1, 0),
(1001, 135, 'Fashion Jewelry', 'https://www.ebay.com/b/Fashion-Jewelry/10968/bn_2408529', NULL, NULL, 1, 0),
(1002, 135, 'Vintage &amp; Antique Jewelry', 'https://www.ebay.com/b/Vintage-Antique-Jewelry/48579/bn_7208275', NULL, NULL, 1, 0),
(1003, 135, 'Engagement &amp; Wedding', 'https://www.ebay.com/b/Engagement-Wedding-Jewelry/91427/bn_1309172', NULL, NULL, 1, 0),
(1004, 135, 'Men\'s Jewelry', 'https://www.ebay.com/b/Mens-Jewelry/10290/bn_1639112', NULL, NULL, 1, 0),
(1005, 135, 'Alex and Ani', 'https://www.ebay.com/b/ALEX-AND-ANI/bn_21819111', NULL, NULL, 1, 0),
(1006, 135, 'Kendra Scott', 'https://www.ebay.com/b/Kendra-Scott/bn_21828235', NULL, NULL, 1, 0),
(1007, 135, 'Cartier', 'https://www.ebay.com/b/Cartier-Fine-Jewelry/4196/bn_2194624', NULL, NULL, 1, 0),
(1008, 135, 'David Yurman', 'https://www.ebay.com/b/David-Yurman/bn_21823139', NULL, NULL, 1, 0),
(1009, 135, 'Tiffany &amp; Co. ', 'https://www.ebay.com/b/Tiffany-Co-Fine-Jewelry/4196/bn_2194322', NULL, NULL, 1, 0),
(1010, 135, 'Citizen', 'https://www.ebay.com/b/Citizen-Wristwatches/31387/bn_2968070', NULL, NULL, 1, 0),
(1011, 135, 'Invicta ', 'https://www.ebay.com/b/Invicta-Wristwatches/31387/bn_2982850', NULL, NULL, 1, 0),
(1012, 135, 'Bulova', 'https://www.ebay.com/b/Bulova-Wristwatches/31387/bn_2983376', NULL, NULL, 1, 0),
(1013, 135, 'Movado', 'https://www.ebay.com/b/Movado-Wristwatches/31387/bn_2959649', NULL, NULL, 1, 0),
(1014, 135, 'Seiko', 'https://www.ebay.com/b/Seiko-Wristwatches/31387/bn_2999799', NULL, NULL, 1, 0),
(1015, 135, 'Michael Kors', 'https://www.ebay.com/b/Michael-Kors-Wristwatches/31387/bn_2980771', NULL, NULL, 1, 0),
(1016, 135, 'Frederique Constant', 'https://www.ebay.com/b/Frederique-Constant/bn_21825279', NULL, NULL, 1, 0),
(1017, 135, 'Fossil', 'https://www.ebay.com/b/Fossil-Wristwatches/31387/bn_2960698', NULL, NULL, 1, 0),
(1018, 135, 'TechnoMarine', 'https://www.ebay.com/b/TechnoMarine/bn_21836639', NULL, NULL, 1, 0),
(1019, 135, 'Casio', 'https://www.ebay.com/b/Casio-Wristwatches/31387/bn_2973204', NULL, NULL, 1, 0),
(1020, 135, 'Rolex', 'https://www.ebay.com/b/Rolex-Wristwatches/31387/bn_2989578', NULL, NULL, 1, 0),
(1021, 135, 'Patek Philippe', 'https://www.ebay.com/b/Patek-Philippe-Wristwatches/31387/bn_2975769', NULL, NULL, 1, 0),
(1022, 135, 'Omega ', 'https://www.ebay.com/b/OMEGA-Wristwatches/31387/bn_3000908', NULL, NULL, 1, 0),
(1023, 135, 'Breitling', 'https://www.ebay.com/b/Breitling-Wristwatches/31387/bn_3003445', NULL, NULL, 1, 0),
(1024, 135, 'Sandals', 'https://www.ebay.com/b/Womens-Sandals-Flip-Flops/62107/bn_739476', NULL, NULL, 1, 0),
(1025, 135, 'Athletic', 'https://www.ebay.com/b/Womens-Athletic-Shoes/95672/bn_739133', NULL, NULL, 1, 0),
(1026, 135, 'Heels', 'https://www.ebay.com/b/Womens-Heels/55793/bn_738266', NULL, NULL, 1, 0),
(1027, 135, 'Flats &amp; Oxfords', 'https://www.ebay.com/b/Womens-Flats-Oxfords/45333/bn_738286', NULL, NULL, 1, 0),
(1028, 135, 'Women\'s Boots', 'https://www.ebay.com/b/Womens-Boots/53557/bn_738870', NULL, NULL, 1, 0),
(1029, 135, 'Birkenstock', 'https://www.ebay.com/b/Birkenstock-Shoes-for-Women/3034/bn_725653', NULL, NULL, 1, 0),
(1030, 135, 'Nike', 'https://www.ebay.com/b/Nike-Shoes-for-Women/3034/bn_727563', NULL, NULL, 1, 0),
(1031, 135, 'Steve Madden', 'https://www.ebay.com/b/Steve-Madden-Shoes-for-Women/3034/bn_724222', NULL, NULL, 1, 0),
(1032, 135, 'adidas', 'https://www.ebay.com/b/adidas-Shoes-for-Women/3034/bn_738669', NULL, NULL, 1, 0),
(1033, 135, 'Sam Edelman', 'https://www.ebay.com/b/Sam-Edelman-Shoes-for-Women/3034/bn_716918', NULL, NULL, 1, 0),
(1034, 135, 'Reebok', 'https://www.ebay.com/b/Reebok-Shoes-for-Men/93427/bn_62576', NULL, NULL, 1, 0),
(1035, 135, 'VANS ', 'https://www.ebay.com/b/VANS-Shoes-for-Men/93427/bn_62691', NULL, NULL, 1, 0),
(1036, 135, 'Converse', 'https://www.ebay.com/b/Converse-Shoes-for-Men/93427/bn_62180', NULL, NULL, 1, 0),
(1037, 135, 'PUMA ', 'https://www.ebay.com/b/PUMA-Shoes-for-Men/93427/bn_62561', NULL, NULL, 1, 0),
(1038, 135, 'Timberland', 'https://www.ebay.com/b/Timberland-Shoes-for-Men/93427/bn_62667', NULL, NULL, 1, 0),
(1039, 135, 'Gucci', 'https://www.ebay.com/b/Gucci-Shoes-for-Men/93427/bn_62346', NULL, NULL, 1, 0),
(1040, 135, 'Red Wing', 'https://www.ebay.com/b/Red-Wing-Shoes-for-Men/93427/bn_62574', NULL, NULL, 1, 0),
(1041, 135, 'Longchamp', 'https://www.ebay.com/b/Longchamp-Totes-and-Shopper-Bags-for-Women/169291/bn_726842', NULL, NULL, 1, 0),
(1042, 135, 'Kate Spade', 'https://www.ebay.com/b/Kate-Spade-Womens-Handbags/169291/bn_725729', NULL, NULL, 1, 0),
(1043, 135, 'Dooney &amp; Bourke', 'https://www.ebay.com/b/Dooney-Bourke-Womens-Handbags-Purses/169291/bn_736394', NULL, NULL, 1, 0),
(1044, 135, 'Marc Jacobs', 'https://www.ebay.com/b/Marc-Jacobs-Womens-Handbags-and-Purses/169291/bn_723533', NULL, NULL, 1, 0),
(1045, 135, 'Women\'s Fragrances', 'https://www.ebay.com/b/Fragrances-for-Women/11848/bn_693859', NULL, NULL, 1, 0),
(1046, 135, 'Men\'s Fragrances', 'https://www.ebay.com/b/Mens-Fragrances/29585/bn_699014', NULL, NULL, 1, 0),
(1047, 135, 'Skincare', 'https://www.ebay.com/b/Skin-Care-Products/11863/bn_1856572', NULL, NULL, 1, 0),
(1048, 135, 'Makeup', 'https://www.ebay.com/b/Makeup-Products/31786/bn_1865570', NULL, NULL, 1, 0),
(1049, 135, 'Manicure, Pedicure &amp; Nail Care Products', 'https://www.ebay.com/b/Manicure-Pedicure-Nail-Care-Products/47945/bn_223038', NULL, NULL, 1, 0),
(1050, 135, 'Hair Care &amp; Styling Products', 'https://www.ebay.com/b/Hair-Care-Styling-Products/11854/bn_1855355', NULL, NULL, 1, 0),
(1051, 135, 'Shaving &amp; Hair Removal Products', 'https://www.ebay.com/b/Shaving-Hair-Removal-Products/31762/bn_223821', NULL, NULL, 1, 0),
(1052, 135, 'Bath &amp; Body', 'https://www.ebay.com/b/Bath-Body-Products/11838/bn_1850348', NULL, NULL, 1, 0),
(1053, 135, 'Salon &amp; Spa Equipment', 'https://www.ebay.com/b/Salon-Spa-Equipment/177731/bn_223817', NULL, NULL, 1, 0),
(1054, 135, 'Sun Protection &amp; Tanning Products', 'https://www.ebay.com/b/Sun-Protection-Tanning-Products/31772/bn_1865511', NULL, NULL, 1, 0),
(1055, 135, 'Vitamins', 'https://www.ebay.com/b/Vitamin-Mineral-Health-Supplements/11776/bn_2313780', NULL, NULL, 1, 0),
(1056, 135, 'Dietary Supplements', 'https://www.ebay.com/b/Dietary-Supplements/180960/bn_7203516', NULL, NULL, 1, 0),
(1057, 135, 'Aromatherapy', 'https://www.ebay.com/b/Aromatherapy-Supplies/19258/bn_2309815', NULL, NULL, 1, 0),
(1058, 135, 'Weight Management', 'https://www.ebay.com/b/Weight-Management-Supplements/31817/bn_1865534', NULL, NULL, 1, 0),
(1059, 135, 'Energy Bars, Shakes &amp; Drinks', 'https://www.ebay.com/b/Supplemental-Energy-Bars-Shakes-Drinks/1278/bn_2312569', NULL, NULL, 1, 0),
(1060, 135, 'Herbal Remedies', 'https://www.ebay.com/b/Herbal-Remedies-Resins/180954/bn_7203454', NULL, NULL, 1, 0),
(1061, 135, 'Light Therapy', 'https://www.ebay.com/b/Light-Therapy-Devices/159881/bn_2313662', NULL, NULL, 1, 0),
(1062, 135, 'Sports Supplements', 'https://www.ebay.com/b/Dietary-Sports-Supplements/97033/bn_7203453', NULL, NULL, 1, 0),
(1063, 135, 'Massage Oils &amp; Lotions', 'https://www.ebay.com/b/Massage-Oils-Lotions/36453/bn_2313831', NULL, NULL, 1, 0),
(1064, 135, 'Homeopathic Remedies', 'https://www.ebay.com/b/Homeopathic-Remedies/180955/bn_7203739', NULL, NULL, 1, 0),
(1397, 136, 'Shop All Cell Phones', 'https://www.ebay.com/b/Cell-Phones-Smartphones/9355/bn_320094', NULL, NULL, 1, 0),
(1398, 136, 'Unlocked Cell Phones', 'https://www.ebay.com/b/Unlocked-Smartphones/9355/bn_591735', NULL, NULL, 1, 0),
(1399, 136, 'iPhone', 'https://www.ebay.com/b/Apple-iPhone/9355/bn_319682', NULL, NULL, 1, 0),
(1400, 136, 'Samsung', 'https://www.ebay.com/b/Samsung-Cell-Phones-and-Smartphones/9355/bn_352130', NULL, NULL, 1, 0),
(1401, 136, 'Prepaid Cell Phones', 'https://www.ebay.com/b/Prepaid-Cell-Phones-and-Smartphones/9355/bn_360660', NULL, NULL, 1, 0),
(1402, 136, 'Cell Phone Cases', 'https://www.ebay.com/b/Cell-Phone-Cases-Covers-Skins/20349/bn_317585', NULL, NULL, 1, 0),
(1403, 136, 'Smart Watches', 'https://www.ebay.com/b/Smart-Watches/178893/bn_152365', NULL, NULL, 1, 0),
(1404, 136, 'Bluetooth Headsets', 'https://www.ebay.com/b/Bluetooth-Headsets-for-Cell-Phones/80077/bn_348413', NULL, NULL, 1, 0),
(1405, 136, 'Cell Phone Chargers', 'https://www.ebay.com/b/Cell-Phone-Chargers-Cradles/123417/bn_320030', NULL, NULL, 1, 0),
(1406, 136, 'Cell Phone Cables &amp; Adapters', 'https://www.ebay.com/b/Cell-Phone-Cables-Adapters/123422/bn_317618', NULL, NULL, 1, 0),
(1407, 136, 'Apple', 'https://www.ebay.com/b/Apple-iPhone/9355/bn_319682', NULL, NULL, 1, 0),
(1408, 136, 'Google', 'https://www.ebay.com/b/Google-Cell-Phones-Smartphones/9355/bn_3904160', NULL, NULL, 1, 0),
(1409, 136, 'LG', 'https://www.ebay.com/b/LG-Cell-Phones-and-Smartphones/9355/bn_353985', NULL, NULL, 1, 0),
(1410, 136, 'Huawei', 'https://www.ebay.com/b/Huawei-Smartphones/9355/bn_349965', NULL, NULL, 1, 0),
(1411, 136, 'HTC', 'https://www.ebay.com/b/HTC-Smartphones/9355/bn_350014', NULL, NULL, 1, 0),
(1412, 136, 'OnePlus', 'https://www.ebay.com/b/OnePlus-Cell-Phones-Smartphones/9355/bn_318153', NULL, NULL, 1, 0),
(1413, 136, 'BlackBerry', 'https://www.ebay.com/b/BlackBerry-Cell-Phones-Smartphones/9355/bn_355246', NULL, NULL, 1, 0),
(1414, 136, 'Motorola', 'https://www.ebay.com/b/Motorola-Cell-Phones-Smartphones/9355/bn_355976', NULL, NULL, 1, 0),
(1415, 136, 'Nokia', 'https://www.ebay.com/b/Nokia-Cell-Phones-Smartphones/9355/bn_314658', NULL, NULL, 1, 0),
(1416, 136, 'PC Laptops &amp; Netbooks', 'https://www.ebay.com/b/PC-Laptops-Netbooks/177/bn_317584', NULL, NULL, 1, 0),
(1417, 136, 'MacBooks', 'https://www.ebay.com/b/MacBooks/111422/bn_320025', NULL, NULL, 1, 0),
(1418, 136, 'iPads', 'https://www.ebay.com/b/Apple-Tablets-eReaders/171485/bn_319675', NULL, NULL, 1, 0),
(1419, 136, 'PC Desktops &amp; All-In-Ones', 'https://www.ebay.com/b/PC-Desktops-All-In-Ones/179/bn_661752', NULL, NULL, 1, 0),
(1420, 136, 'iMacs', 'https://www.ebay.com/b/Apple-Desktops-All-In-One-Computers/111418/bn_661869', NULL, NULL, 1, 0),
(1421, 136, 'Laptop &amp; Desktop Accessories', 'https://www.ebay.com/b/Laptop-Desktop-Accessories/31530/bn_661802', NULL, NULL, 1, 0),
(1422, 136, 'Tablet Accessories', 'https://www.ebay.com/b/Tablet-eBook-Reader-Accessories/176970/bn_739209', NULL, NULL, 1, 0),
(1423, 136, 'Printers', 'https://www.ebay.com/b/Computer-Printers/1245/bn_320031', NULL, NULL, 1, 0),
(1424, 136, 'Components &amp; Parts', 'https://www.ebay.com/b/Computer-Components-Parts/175673/bn_1643095', NULL, NULL, 1, 0),
(1425, 136, 'Monitors', 'https://www.ebay.com/b/Computer-Monitors/80053/bn_317528', NULL, NULL, 1, 0),
(1426, 136, 'Alienware Laptops', 'https://www.ebay.com/b/Alienware-Laptops-Netbooks/175672/bn_2780179', NULL, NULL, 1, 0),
(1427, 136, 'Alienware Desktops', 'https://www.ebay.com/b/Alienware-PC-Desktops-and-All-In-Ones/179/bn_646871', NULL, NULL, 1, 0),
(1428, 136, 'Widescreen Monitors', 'https://www.ebay.com/b/Widescreen-Computer-Monitors/80053/bn_27482908', NULL, NULL, 1, 0),
(1429, 136, 'PC Video Games', 'https://www.ebay.com/b/PC-Video-Games/139973/bn_339763', NULL, NULL, 1, 0),
(1430, 136, 'Computer Graphics/Video Cards', 'https://www.ebay.com/b/Computer-Graphics-Video-Cards/27386/bn_661796', NULL, NULL, 1, 0),
(1431, 136, 'PC Gaming Headsets', 'https://www.ebay.com/b/PC-Video-Game-Headsets/171821/bn_3142509', NULL, NULL, 1, 0),
(1432, 136, 'Gaming Keyboards', 'https://www.ebay.com/b/Computer-Gaming-Keyboards-and-Numeric-Keypads/33963/bn_348155', NULL, NULL, 1, 0),
(1433, 136, 'Gaming Mice', 'https://www.ebay.com/b/Gaming-Mice/23160/bn_348154', NULL, NULL, 1, 0),
(1434, 136, 'Gaming Mouse Pads &amp; Wrist Rests', 'https://www.ebay.com/b/Gaming-Mouse-Pads-Wrist-Rests/23895/bn_25445544', NULL, NULL, 1, 0),
(1435, 136, 'Computer Gaming Cases', 'https://www.ebay.com/b/Computer-Gaming-Cases/42014/bn_2699060', NULL, NULL, 1, 0),
(1436, 136, 'Televisions', 'https://www.ebay.com/b/TVs/11071/bn_738302', NULL, NULL, 1, 0),
(1437, 136, 'Home Audio Stereos &amp; Components', 'https://www.ebay.com/b/Home-Audio-Stereos-Components/14969/bn_1642588', NULL, NULL, 1, 0),
(1438, 136, 'Home Speakers &amp; Subwoofers', 'https://www.ebay.com/b/Home-Speakers-Subwoofers/14990/bn_739217', NULL, NULL, 1, 0),
(1439, 136, 'Portable Audio &amp; Headphones', 'https://www.ebay.com/b/Portable-Audio-Headphones/15052/bn_1642614', NULL, NULL, 1, 0),
(1440, 136, 'Internet &amp; Media Streamers', 'https://www.ebay.com/b/Home-Internet-Media-Streamers/168058/bn_739519', NULL, NULL, 1, 0),
(1441, 136, 'Home Surveillance', 'https://www.ebay.com/b/Home-Surveillance-Electronics/48633/bn_1650059', NULL, NULL, 1, 0),
(1442, 136, 'Virtual Reality', 'https://www.ebay.com/b/Virtual-Reality-Headsets-Parts-Accessories/183067/bn_55163233', NULL, NULL, 1, 0),
(1443, 136, 'DVD &amp; Blu-ray Players', 'https://www.ebay.com/b/DVD-Blu-ray-Players/175711/bn_738872', NULL, NULL, 1, 0),
(1444, 136, 'Vintage Electronics', 'https://www.ebay.com/b/Vintage-Electronics/183077/bn_1643015', NULL, NULL, 1, 0),
(1445, 136, 'Sony', 'https://www.ebay.com/b/Sony-TVs/11071/bn_736975', NULL, NULL, 1, 0),
(1446, 136, 'Vizio', 'https://www.ebay.com/b/Vizio-TVs/11071/bn_736868', NULL, NULL, 1, 0),
(1447, 136, 'Sharp', 'https://www.ebay.com/b/Sharp-TVs/11071/bn_736057', NULL, NULL, 1, 0),
(1448, 136, 'More than 60"', 'https://www.ebay.com/b/More-than-60-TVs/11071/bn_752876', NULL, NULL, 1, 0),
(1449, 136, '50" - 60"', 'https://www.ebay.com/b/50-60-TVs/11071/bn_726592', NULL, NULL, 1, 0),
(1450, 136, '40" - 49"', 'https://www.ebay.com/b/40-49-TVs/11071/bn_722088', NULL, NULL, 1, 0),
(1451, 136, '30" - 39"', 'https://www.ebay.com/b/30-39-TVs/11071/bn_722089', NULL, NULL, 1, 0),
(1452, 136, '20" - 29"', 'https://www.ebay.com/b/20-29-TVs/11071/bn_722092', NULL, NULL, 1, 0),
(1453, 136, 'DSLR Cameras', 'https://www.ebay.com/b/DSLR-Cameras/31388/bn_732', NULL, NULL, 1, 0),
(1454, 136, 'Camera Drones', 'https://www.ebay.com/b/Camera-Drones/179697/bn_89951', NULL, NULL, 1, 0),
(1455, 136, 'Mirrorless Digital Cameras', 'https://www.ebay.com/b/Mirrorless-Interchangeable-Lens-Digital-Cameras/31388/bn_729', NULL, NULL, 1, 0),
(1456, 136, 'Point &amp; Shoot Cameras', 'https://www.ebay.com/b/Point-Shoot-Digital-Cameras/31388/bn_730', NULL, NULL, 1, 0),
(1457, 136, 'Action Camcorders', 'https://www.ebay.com/b/Helmet-Action-Camcorders/11724/bn_82', NULL, NULL, 1, 0),
(1458, 136, 'Film Cameras', 'https://www.ebay.com/b/Film-Cameras/15230/bn_80709', NULL, NULL, 1, 0),
(1459, 136, 'Camera Lenses', 'https://www.ebay.com/b/Camera-Lenses/3323/bn_1884683', NULL, NULL, 1, 0),
(1460, 136, 'Photo Studio &amp; Lighting', 'https://www.ebay.com/b/Photo-Studio-Lighting-Equipment/30078/bn_152377', NULL, NULL, 1, 0),
(1461, 136, 'Camera &amp; Photo Accessories', 'https://www.ebay.com/b/Camera-Photo-Accessories/15200/bn_71235', NULL, NULL, 1, 0),
(1462, 136, 'Camcorders', 'https://www.ebay.com/b/Camcorders/11724/bn_42', NULL, NULL, 1, 0),
(1463, 136, 'Nintendo Consoles', 'https://www.ebay.com/b/Nintendo-Consoles/139971/bn_52461057', NULL, NULL, 1, 0),
(1464, 136, 'PlayStation Consoles', 'https://www.ebay.com/b/Sony-Video-Game-Consoles/139971/bn_64861690', NULL, NULL, 1, 0),
(1465, 136, 'Xbox Consoles', 'https://www.ebay.com/b/Microsoft-Video-Game-Consoles/139971/bn_64860329', NULL, NULL, 1, 0),
(1466, 136, 'Handheld Consoles', 'https://www.ebay.com/b/Video-Game-Handheld-Systems/139971/bn_27304401', NULL, NULL, 1, 0),
(1467, 136, 'Alienware', 'https://www.ebay.com/b/Alienware/bn_21819171', NULL, NULL, 1, 0),
(1468, 136, 'Razer', 'https://www.ebay.com/b/Razer/bn_21833811', NULL, NULL, 1, 0),
(1469, 136, 'MSI', 'https://www.ebay.com/b/MSI/bn_21831199', NULL, NULL, 1, 0),
(1470, 136, 'Prepaid Gaming Cards', 'https://www.ebay.com/b/Prepaid-Gaming-Cards/156597/bn_1865283', NULL, NULL, 1, 0),
(1471, 136, 'All Video Games', 'https://www.ebay.com/b/Video-Games/139973/bn_320034', NULL, NULL, 1, 0),
(1472, 136, 'Toys to Life', 'https://www.ebay.com/b/Toys-to-Life-Products/182180/bn_16566156', NULL, NULL, 1, 0),
(1473, 136, 'Controllers', 'https://www.ebay.com/b/Video-Game-Controllers/117042/bn_223803', NULL, NULL, 1, 0),
(1474, 136, 'Computer Components &amp; Parts', 'https://www.ebay.com/b/Computer-Components-Parts/175673/bn_1643095', NULL, NULL, 1, 0),
(1475, 136, 'Gaming Headsets', 'https://www.ebay.com/b/Video-Game-Headsets/171821/bn_223810', NULL, NULL, 1, 0),
(1476, 136, 'Gaming Mouse Pads', 'https://www.ebay.com/b/Gaming-Mouse-Pads-Wrist-Rests/23895/bn_25445544', NULL, NULL, 1, 0),
(1477, 136, 'Computer Cases', 'https://www.ebay.com/b/Computer-Gaming-Cases/42014/bn_2699060', NULL, NULL, 1, 0),
(1478, 136, 'Voice Assistants', 'https://www.ebay.com/b/Voice-Assistants/184435/bn_78213083', NULL, NULL, 1, 0),
(1479, 136, 'Smart Thermostats', 'https://www.ebay.com/b/Wi-Fi-Programmable-Thermostats/115949/bn_81003365', NULL, NULL, 1, 0),
(1480, 136, 'Smart Doorbells', 'https://www.ebay.com/b/Wi-Fi-with-Connected-Home-Product-Doorbells/115975/bn_85180630', NULL, NULL, 1, 0),
(1481, 136, 'August Smart Locks', 'https://www.ebay.com/b/August-Smart-Lock/20593/bn_55187369', NULL, NULL, 1, 0),
(1482, 136, 'Wireless Security Cameras', 'https://www.ebay.com/b/IP-Network-Wireless-Home-Security-Cameras/48638/bn_360128', NULL, NULL, 1, 0),
(1483, 136, 'Smart TVs', 'https://www.ebay.com/b/App-Downloadable-TVs/11071/bn_7982599', NULL, NULL, 1, 0),
(1484, 136, 'Media Streamers', 'https://www.ebay.com/b/Home-Internet-Media-Streamers/168058/bn_739519', NULL, NULL, 1, 0),
(1485, 136, 'Smart Lighting', 'https://www.ebay.com/b/Smart-Bulbs/20706/bn_72322334', NULL, NULL, 1, 0),
(1486, 136, 'Wireless Home Audio', 'https://www.ebay.com/b/Bluetooth-Wireless-Home-Speakers-Subwoofers/14990/bn_56912583', NULL, NULL, 1, 0),
(1487, 136, 'Smart Modules', 'https://www.ebay.com/b/Wi-Fi-Home-Automation-Modules/94879/bn_81088358', NULL, NULL, 1, 0),
(1488, 136, 'Nest', 'https://www.ebay.com/b/Nest/bn_21831531', NULL, NULL, 1, 0),
(1489, 136, 'Philips', 'https://www.ebay.com/b/Philips-Home-Automation-Electronics/50582/bn_88418547', NULL, NULL, 1, 0),
(1490, 136, 'Sonos', 'https://www.ebay.com/b/Sonos-Home-Speakers-and-Subwoofers/14990/bn_8139056', NULL, NULL, 1, 0),
(1491, 136, 'Lutron', 'https://www.ebay.com/b/Lutron/bn_21829787', NULL, NULL, 1, 0),
(1492, 136, 'Zmodo', 'https://www.ebay.com/b/Zmodo/bn_21839111', NULL, NULL, 1, 0),
(1493, 136, 'ecobee', 'https://www.ebay.com/b/ecobee-Programmable-Thermostats/115949/bn_52460881', NULL, NULL, 1, 0),
(1494, 136, 'Roku', 'https://www.ebay.com/b/Roku-Home-Internet-and-Media-Streamers/168058/bn_738495', NULL, NULL, 1, 0),
(1495, 136, 'Amazon', 'https://www.ebay.com/b/Amazon-Voice-Assistants/184435/bn_81043747', NULL, NULL, 1, 0),
(1496, 136, 'Computer Graphics Cards', 'https://www.ebay.com/b/Computer-Graphics-Video-Cards/27386/bn_661796', NULL, NULL, 1, 0),
(1497, 136, 'Laptops &amp; Netbooks', 'https://www.ebay.com/b/Laptops-Netbooks/175672/bn_1648276', NULL, NULL, 1, 0),
(1498, 136, 'Car GPS Units', 'https://www.ebay.com/b/Car-GPS-Units/156955/bn_887051', NULL, NULL, 1, 0),
(1499, 136, 'Car Audio', 'https://www.ebay.com/b/Car-Audio-in-Consumer-Electronics/175716/bn_887048', NULL, NULL, 1, 0),
(1500, 136, 'Car Radar &amp; Laser Detectors', 'https://www.ebay.com/b/Car-Radar-Laser-Detectors/14935/bn_887006', NULL, NULL, 1, 0),
(1501, 136, 'Car Alarms &amp; Security', 'https://www.ebay.com/b/Car-Alarms-Security/48610/bn_887016', NULL, NULL, 1, 0),
(1502, 136, 'Car Electronics Accessories', 'https://www.ebay.com/b/Car-Electronics-Accessories/60207/bn_887021', NULL, NULL, 1, 0),
(1503, 137, 'Comics', 'https://www.ebay.com/b/Collectible-Comics/63/bn_1865459', NULL, NULL, 1, 0),
(1504, 137, 'United States Stamps', 'https://www.ebay.com/b/United-States-Stamps/261/bn_1865259', NULL, NULL, 1, 0),
(1505, 137, 'US Postage Stamps', 'https://www.ebay.com/b/US-Postage-Stamps/47149/bn_2311566', NULL, NULL, 1, 0),
(1506, 137, 'European Stamps', 'https://www.ebay.com/b/European-Stamps/4742/bn_1865606', NULL, NULL, 1, 0),
(1507, 137, 'Asian Stamps', 'https://www.ebay.com/b/Asian-Stamps/181416/bn_7203751', NULL, NULL, 1, 0),
(1508, 137, 'Canadian Stamps', 'https://www.ebay.com/b/Canadian-Stamps/3478/bn_1865394', NULL, NULL, 1, 0),
(1509, 137, 'British Colony-Territory Stamps', 'https://www.ebay.com/b/British-Colony-Territory-Stamps/65174/bn_1865053', NULL, NULL, 1, 0),
(1510, 137, 'British Stamps', 'https://www.ebay.com/b/British-Stamps/3499/bn_1865453', NULL, NULL, 1, 0),
(1511, 137, 'Latin American Stamps', 'https://www.ebay.com/b/Latin-American-Stamps/181417/bn_7203749', NULL, NULL, 1, 0),
(1512, 137, 'Topical Postal Stamps', 'https://www.ebay.com/b/Topical-Postal-Stamps/4752/bn_1848729', NULL, NULL, 1, 0),
(1513, 137, 'Specialty Philately', 'https://www.ebay.com/b/Specialty-Philately/7898/bn_1865079', NULL, NULL, 1, 0),
(1514, 137, 'NFL Autographs', 'https://www.ebay.com/b/NFL-Autographed-Items/27274/bn_2312329', NULL, NULL, 1, 0),
(1515, 137, 'NFL Fan Apparel', 'https://www.ebay.com/b/NFL-Fan-Apparel-Souvenirs/206/bn_2310770', NULL, NULL, 1, 0),
(1516, 137, 'MLB Autographs', 'https://www.ebay.com/b/MLB-Autographed-Items/27259/bn_2310934', NULL, NULL, 1, 0),
(1517, 137, 'MLB Fan Apparel', 'https://www.ebay.com/b/MLB-Fan-Apparel-Souvenirs/24410/bn_2310969', NULL, NULL, 1, 0),
(1518, 137, 'NCAA Fan Apparel', 'https://www.ebay.com/b/NCAA-Fan-Apparel-Souvenirs/24541/bn_2309962', NULL, NULL, 1, 0),
(1519, 137, 'NBA Autographs', 'https://www.ebay.com/b/NBA-Autographed-Items/27267/bn_2309502', NULL, NULL, 1, 0),
(1520, 137, 'NBA Fan Apparel', 'https://www.ebay.com/b/NBA-Fan-Apparel-Souvenirs/24442/bn_2310547', NULL, NULL, 1, 0),
(1521, 137, 'NHL Autographs', 'https://www.ebay.com/b/NHL-Autographed-Items/27283/bn_2313843', NULL, NULL, 1, 0),
(1522, 137, 'NHL Fan Apparel', 'https://www.ebay.com/b/NHL-Fan-Apparel-Souvenirs/24510/bn_2310316', NULL, NULL, 1, 0),
(1523, 137, 'Antique Furniture', 'https://www.ebay.com/b/Antique-Furniture/20091/bn_1865102', NULL, NULL, 1, 0),
(1524, 137, 'Antique Rugs &amp; Carpets', 'https://www.ebay.com/b/Antique-Rugs-Carpets/37978/bn_1860491', NULL, NULL, 1, 0),
(1525, 137, 'Asian Antiques', 'https://www.ebay.com/b/Asian-Antiques/20082/bn_1865025', NULL, NULL, 1, 0),
(1526, 137, 'Antique Silver', 'https://www.ebay.com/b/Antique-Silver/20096/bn_1865522', NULL, NULL, 1, 0),
(1527, 137, 'Antique Decorative Arts', 'https://www.ebay.com/b/Antique-Decorative-Arts/20086/bn_1849288', NULL, NULL, 1, 0),
(1528, 137, 'Architectural &amp; Garden Antiques', 'https://www.ebay.com/b/Architectural-Garden-Antiques/4707/bn_1865433', NULL, NULL, 1, 0),
(1529, 137, 'Antique Chandeliers, Fixtures &amp; Sconces', 'https://www.ebay.com/b/Antique-Chandeliers-Fixtures-Sconces/63516/bn_2310166', NULL, NULL, 1, 0),
(1530, 137, 'Antique Linens &amp; Textiles', 'https://www.ebay.com/b/Antique-Linens-Textiles/181677/bn_1850579', NULL, NULL, 1, 0),
(1531, 137, 'Mid-Century Modernism Style Antiques', 'https://www.ebay.com/b/Mid-Century-Modernism-Antiques/69473/bn_2309691', NULL, NULL, 1, 0),
(1532, 137, 'Antique Ceramics &amp; Porcelain', 'https://www.ebay.com/b/Antique-Ceramics-Porcelain/63521/bn_2313474', NULL, NULL, 1, 0),
(1533, 137, 'Original Autographed Movie Memorabilia', 'https://www.ebay.com/b/Original-Autographed-Movie-Memorabilia/32987/bn_2310524', NULL, NULL, 1, 0),
(1534, 137, 'Movie Props', 'https://www.ebay.com/b/Movie-Props-Memorabilia/60359/bn_2313909', NULL, NULL, 1, 0),
(1535, 137, 'Movie Posters', 'https://www.ebay.com/b/Movie-Posters/18828/bn_2312176', NULL, NULL, 1, 0),
(1536, 137, 'Music Autographs', 'https://www.ebay.com/b/Original-Autographed-Music-Memorabilia/29860/bn_2311367', NULL, NULL, 1, 0),
(1537, 137, 'Music Memorabilia', 'https://www.ebay.com/b/Music-Memorabilia/2329/bn_1861874', NULL, NULL, 1, 0),
(1538, 137, 'World Music Memorabilia', 'https://www.ebay.com/b/World-Music-Memorabilia/91497/bn_2309809', NULL, NULL, 1, 0),
(1539, 137, 'Television Autographs', 'https://www.ebay.com/b/Original-Autographed-TV-Memorabilia/60/bn_2310620', NULL, NULL, 1, 0),
(1540, 137, 'Television Posters', 'https://www.ebay.com/b/TV-Memorabilia-Posters/60380/bn_2310769', NULL, NULL, 1, 0),
(1541, 137, 'Theater Memorabilia', 'https://www.ebay.com/b/Theater-Memorabilia/2362/bn_1865272', NULL, NULL, 1, 0),
(1542, 137, 'Video Game Memorabilia', 'https://www.ebay.com/b/Video-Game-Memorabilia/45101/bn_1848351', NULL, NULL, 1, 0),
(1543, 137, 'Prints', 'https://www.ebay.com/b/Art-Prints/360/bn_2311282', NULL, NULL, 1, 0),
(1544, 137, 'Paintings', 'https://www.ebay.com/b/Art-Paintings/551/bn_2310891', NULL, NULL, 1, 0),
(1545, 137, 'Posters', 'https://www.ebay.com/b/Art-Posters/28009/bn_2310682', NULL, NULL, 1, 0),
(1546, 137, 'Photographs', 'https://www.ebay.com/b/Art-Photographs/2211/bn_2310710', NULL, NULL, 1, 0),
(1547, 137, 'Sculptures ', 'https://www.ebay.com/b/Art-Sculptures/553/bn_2312934', NULL, NULL, 1, 0),
(1548, 137, 'Drawings ', 'https://www.ebay.com/b/Art-Drawings/552/bn_2310986', NULL, NULL, 1, 0),
(1549, 137, 'Folk Art &amp; Primitives', 'https://www.ebay.com/b/Folk-Art-Primitives/357/bn_2312186', NULL, NULL, 1, 0),
(1550, 137, 'Textile Art ', 'https://www.ebay.com/b/Textile-Art-Fiber-Art/156196/bn_2310559', NULL, NULL, 1, 0),
(1551, 137, 'Mixed Media &amp; Collage ', 'https://www.ebay.com/b/Mixed-Media-Art-Collage-Art/554/bn_2310967', NULL, NULL, 1, 0),
(1552, 137, 'Other Art', 'https://www.ebay.com/b/Other-Art/20158/bn_7203502', NULL, NULL, 1, 0),
(1553, 137, 'Rae Dunn', 'https://www.ebay.com/b/Rae-Dunn-Dinnerware-Ceramics/25/bn_95779808', NULL, NULL, 1, 0),
(1554, 137, 'Lenox', 'https://www.ebay.com/b/Lenox-China-Dinnerware/92/bn_16563495', NULL, NULL, 1, 0),
(1555, 137, 'Fiestaware', 'https://www.ebay.com/b/Contemporary-Fiesta-China-Dinnerware/473/bn_16562420', NULL, NULL, 1, 0),
(1556, 137, 'Meissen ', 'https://www.ebay.com/b/Meissen-China-Dinnerware/2809/bn_16563657', NULL, NULL, 1, 0),
(1557, 137, 'Royal Copenhagen', 'https://www.ebay.com/b/Royal-Copenhagen-China-Dinnerware/4228/bn_16565790', NULL, NULL, 1, 0),
(1558, 137, 'Waterford ', 'https://www.ebay.com/b/Waterford-Glassware/7291/bn_16566548', NULL, NULL, 1, 0),
(1559, 137, 'Pyrex ', 'https://www.ebay.com/b/Pyrex-Glassware/4765/bn_16565562', NULL, NULL, 1, 0),
(1560, 137, 'Princess House', 'https://www.ebay.com/b/Princess-House-Contemporary-Glass/2691/bn_16565504', NULL, NULL, 1, 0),
(1561, 137, 'Anchor Hocking Fire-King', 'https://www.ebay.com/b/Anchor-Hocking-Fire-King-40s-50s-60s-Glassware/1019/bn_16561458', NULL, NULL, 1, 0),
(1562, 137, 'Mikasa', 'https://www.ebay.com/b/Mikasa-China-Dinnerware/4226/bn_16563779', NULL, NULL, 1, 0),
(1563, 137, 'Roseville ', 'https://www.ebay.com/b/Roseville-Art-Pottery/96/bn_16565780', NULL, NULL, 1, 0),
(1564, 137, 'Weller', 'https://www.ebay.com/b/Weller-Art-Pottery/461/bn_16566564', NULL, NULL, 1, 0),
(1565, 137, 'Bauer', 'https://www.ebay.com/b/Bauer-China-Dinnerware/442/bn_16562007', NULL, NULL, 1, 0),
(1566, 137, 'Rookwood', 'https://www.ebay.com/b/Rookwood-Art-Pottery/90/bn_16565776', NULL, NULL, 1, 0),
(1567, 137, 'McCoy', 'https://www.ebay.com/b/McCoy-Art-Pottery/89/bn_16563636', NULL, NULL, 1, 0),
(1568, 137, 'Lalique', 'https://www.ebay.com/b/Lalique-Art-Glass/2734/bn_16563458', NULL, NULL, 1, 0),
(1569, 137, 'Fenton', 'https://www.ebay.com/b/Fenton-Art-Glass/2719/bn_16562738', NULL, NULL, 1, 0),
(1570, 137, 'Baccarat', 'https://www.ebay.com/b/Baccarat-Art-Glass/2711/bn_16561968', NULL, NULL, 1, 0),
(1571, 137, 'Blenko', 'https://www.ebay.com/b/Blenko-Art-Glass/18874/bn_16562085', NULL, NULL, 1, 0),
(1572, 137, 'Murano ', 'https://www.ebay.com/b/Murano-Italian-Art-Glass/64932/bn_81183530', NULL, NULL, 1, 0),
(1573, 137, 'Militaria', 'https://www.ebay.com/b/Militaria/13956/bn_1852614', NULL, NULL, 1, 0),
(1574, 137, 'Funko', 'https://www.ebay.com/b/Collectible-Funko-Bobbleheads-1970-Now/149372/bn_3017826', NULL, NULL, 1, 0),
(1575, 137, 'Knives, Swords &amp; Blades', 'https://www.ebay.com/b/Collectible-Knives-Swords-Blades-Armors-Accessories/1401/bn_1854534', NULL, NULL, 1, 0),
(1576, 137, 'Disneyana', 'https://www.ebay.com/b/Disneyana/137/bn_1855080', NULL, NULL, 1, 0),
(1577, 137, 'Animation Art &amp; Characters', 'https://www.ebay.com/b/Collectible-Animation-Art-Characters/13658/bn_1849452', NULL, NULL, 1, 0),
(1578, 137, 'Star Wars Collectibles', 'https://www.ebay.com/b/Star-Wars-Collectibles/29495/bn_2311944', NULL, NULL, 1, 0),
(1579, 137, 'Decorative Collectibles', 'https://www.ebay.com/b/Decorative-Collectible-Brands/156286/bn_2309993', NULL, NULL, 1, 0),
(1580, 137, 'Tobacciana', 'https://www.ebay.com/b/Tobacciana/593/bn_1865289', NULL, NULL, 1, 0),
(1581, 137, 'Science Fiction &amp; Horror', 'https://www.ebay.com/b/Sci-Fi-Horror-Collectibles/152/bn_1856025', NULL, NULL, 1, 0),
(1582, 137, 'Arcade, Jukebox &amp; Pinball', 'https://www.ebay.com/b/Arcade-Jukebox-Pinball-Collectibles/66502/bn_1865425', NULL, NULL, 1, 0),
(1583, 137, 'Radio, Phonograph, TV &amp; Phone', 'https://www.ebay.com/b/Radio-Phonograph-TV-Phone-Collectibles/29832/bn_1865245', NULL, NULL, 1, 0),
(1584, 137, 'Ethnic &amp; Cultural Collectibles', 'https://www.ebay.com/b/Ethnic-Cultural-Collectibles/3913/bn_1865050', NULL, NULL, 1, 0),
(1585, 137, 'Transportation', 'https://www.ebay.com/b/Transportation-Collectibles/417/bn_1865526', NULL, NULL, 1, 0),
(1586, 137, 'Pens &amp; Writing Instruments', 'https://www.ebay.com/b/Collectible-Pens-Writing-Instruments/966/bn_1865414', NULL, NULL, 1, 0),
(1587, 137, 'Historical Memorabilia', 'https://www.ebay.com/b/Historical-Memorabilia/13877/bn_1861345', NULL, NULL, 1, 0),
(1588, 137, 'Rocks, Fossils &amp; Minerals', 'https://www.ebay.com/b/Rocks-Fossils-Minerals/3213/bn_1848694', NULL, NULL, 1, 0),
(1589, 137, 'Non-Sport Trading Cards &amp; Accessories', 'https://www.ebay.com/b/Non-Sport-Trading-Cards-Accessories/182982/bn_1860331', NULL, NULL, 1, 0),
(1590, 137, 'Religion &amp; Spirituality', 'https://www.ebay.com/b/Religion-Spirituality-Collectibles/1446/bn_1853280', NULL, NULL, 1, 0),
(1591, 137, 'Advertising', 'https://www.ebay.com/b/Collectible-Advertising/34/bn_1865483', NULL, NULL, 1, 0),
(1592, 137, 'US Coins', 'https://www.ebay.com/b/US-Coins/253/bn_1848949', NULL, NULL, 1, 0),
(1593, 137, 'World Coins', 'https://www.ebay.com/b/World-Coins/256/bn_1851558', NULL, NULL, 1, 0),
(1594, 137, 'European Coins', 'https://www.ebay.com/b/European-Coins/45148/bn_2311051', NULL, NULL, 1, 0),
(1595, 137, 'US Paper Money', 'https://www.ebay.com/b/US-Paper-Money/3412/bn_1858509', NULL, NULL, 1, 0),
(1596, 137, 'Gold Bullion', 'https://www.ebay.com/b/Gold-Bullion/45134/bn_1642102', NULL, NULL, 1, 0),
(1597, 137, 'US Gold Pre-1933', 'https://www.ebay.com/b/US-Gold-Coins-Pre-1933/39467/bn_2310368', NULL, NULL, 1, 0),
(1598, 137, 'Silver Bullion', 'https://www.ebay.com/b/Silver-Bullion/39487/bn_1642127', NULL, NULL, 1, 0),
(1599, 137, 'Morgan Silver Dollars', 'https://www.ebay.com/b/Morgan-Dollars-1878-1921/39464/bn_16563830', NULL, NULL, 1, 0),
(1600, 137, 'World Paper Money', 'https://www.ebay.com/b/World-Paper-Money/3411/bn_1865540', NULL, NULL, 1, 0),
(1601, 137, 'Baseball Trading Cards', 'https://www.ebay.com/b/Baseball-Trading-Cards/213/bn_2309847', NULL, NULL, 1, 0),
(1602, 137, 'Football Trading Cards', 'https://www.ebay.com/b/Football-Trading-Cards/215/bn_2313620', NULL, NULL, 1, 0),
(1603, 137, 'Basketball Trading Cards', 'https://www.ebay.com/b/Basketball-Trading-Cards/214/bn_2310729', NULL, NULL, 1, 0),
(1604, 137, 'Ice Hockey Trading Cards', 'https://www.ebay.com/b/Ice-Hockey-Trading-Cards/216/bn_2311364', NULL, NULL, 1, 0),
(1605, 137, 'Soccer Trading Cards', 'https://www.ebay.com/b/Soccer-Trading-Cards/183444/bn_2310830', NULL, NULL, 1, 0),
(1606, 137, 'Golf Trading Cards', 'https://www.ebay.com/b/Golf-Trading-Cards/4240/bn_2310914', NULL, NULL, 1, 0),
(1607, 137, 'Tennis Trading Cards', 'https://www.ebay.com/b/Tennis-Trading-Cards/43371/bn_2311293', NULL, NULL, 1, 0),
(1608, 137, 'Auto Racing Trading Cards', 'https://www.ebay.com/b/Auto-Racing-Trading-Cards/666/bn_2313475', NULL, NULL, 1, 0),
(1609, 137, 'Boxing Trading Cards', 'https://www.ebay.com/b/Boxing-Trading-Cards/37795/bn_2311044', NULL, NULL, 1, 0),
(1610, 137, 'Mixed Martial Arts (MMA) Trading Cards', 'https://www.ebay.com/b/Mixed-Martial-Arts-MMA-Trading-Cards/170134/bn_2310635', NULL, NULL, 1, 0),
(1611, 138, 'Gardening Supplies', 'https://www.ebay.com/b/Gardening-Supplies/2032/bn_2309851', NULL, NULL, 1, 0),
(1612, 138, 'Outdoor Power Equipment', 'https://www.ebay.com/b/Outdoor-Power-Equipment/29518/bn_2309717', NULL, NULL, 1, 0),
(1613, 138, 'Lawn Mowers, Parts &amp; Accessories', 'https://www.ebay.com/b/Lawn-Mowers-Parts-Accessories/43560/bn_2312193', NULL, NULL, 1, 0),
(1614, 138, 'Pools &amp; Spas', 'https://www.ebay.com/b/Pools-Spas/20727/bn_2313604', NULL, NULL, 1, 0),
(1615, 138, 'Patio &amp; Garden Furniture', 'https://www.ebay.com/b/Patio-Garden-Furniture/25863/bn_2309488', NULL, NULL, 1, 0),
(1616, 138, 'Plants, Seeds &amp; Bulbs', 'https://www.ebay.com/b/Plants-Seeds-Bulbs/181003/bn_7203635', NULL, NULL, 1, 0),
(1617, 138, 'Garden &amp; Storage Sheds', 'https://www.ebay.com/b/Garden-Storage-Sheds/139956/bn_7524403', NULL, NULL, 1, 0),
(1618, 138, 'BBQs, Grills &amp; Smokers', 'https://www.ebay.com/b/BBQs-Grills-Smokers/151621/bn_7540674', NULL, NULL, 1, 0),
(1619, 138, 'Outdoor Lighting Equipment', 'https://www.ebay.com/b/Outdoor-Lighting-Equipment/42154/bn_2311422', NULL, NULL, 1, 0),
(1620, 138, 'Garden &amp; Patio Umbrellas', 'https://www.ebay.com/b/Garden-Patio-Umbrellas/180998/bn_7498453', NULL, NULL, 1, 0),
(1621, 138, 'Sofa Sets', 'https://www.ebay.com/b/Sofa-Sets-Furniture-Sets/139849/bn_7667979', NULL, NULL, 1, 0),
(1622, 138, 'Dining Sets', 'https://www.ebay.com/b/Dining-Furniture-Sets/139849/bn_7667828', NULL, NULL, 1, 0),
(1623, 138, 'Bistro Sets', 'https://www.ebay.com/b/Bistro-Sets-Furniture-Sets/139849/bn_7667925', NULL, NULL, 1, 0),
(1624, 138, 'Bar Sets', 'https://www.ebay.com/b/Bar-Sets-Furniture-Sets/139849/bn_7667999', NULL, NULL, 1, 0),
(1625, 138, 'Sectional Sets', 'https://www.ebay.com/b/Sectional-Set-Furniture-Sets/139849/bn_72954202', NULL, NULL, 1, 0),
(1626, 138, 'Garden Umbrellas', 'https://www.ebay.com/b/Garden-Patio-Umbrellas/180998/bn_7498453', NULL, NULL, 1, 0),
(1627, 138, 'Lounge Chairs', 'https://www.ebay.com/b/Patio-Lounge-Chairs/79682/bn_98498515', NULL, NULL, 1, 0),
(1628, 138, 'Hammocks', 'https://www.ebay.com/b/Hammocks/20719/bn_7457689', NULL, NULL, 1, 0),
(1629, 138, 'Swings', 'https://www.ebay.com/b/Canopy-Swings/79682/bn_72172182', NULL, NULL, 1, 0),
(1630, 138, 'Swimming Pools', 'https://www.ebay.com/b/Swimming-Pools/181053/bn_7734473', NULL, NULL, 1, 0),
(1631, 138, 'Spas &amp; Hot Tubs', 'https://www.ebay.com/b/Spas-Hot-Tubs/84211/bn_7828249', NULL, NULL, 1, 0),
(1632, 138, 'Pool Toys, Games &amp; Floats', 'https://www.ebay.com/b/Pool-Toys-Games-Floats/159921/bn_7542037', NULL, NULL, 1, 0),
(1633, 138, 'Saunas', 'https://www.ebay.com/b/Saunas/181054/bn_7706038', NULL, NULL, 1, 0),
(1634, 138, 'Pool Equipment &amp; Parts', 'https://www.ebay.com/b/Pool-Equipment-Parts/181067/bn_7680692', NULL, NULL, 1, 0),
(1635, 138, 'Pool Cleaning Tools', 'https://www.ebay.com/b/Pool-Cleaning-Tools/181061/bn_7479910', NULL, NULL, 1, 0),
(1636, 138, 'Pool Chemicals &amp; Clarifiers', 'https://www.ebay.com/b/Pool-Chemicals-Clarifiers/181058/bn_7447267', NULL, NULL, 1, 0),
(1637, 138, 'Pool Water Testing &amp; Kits', 'https://www.ebay.com/b/Pool-Water-Testing-Kits/181059/bn_7538736', NULL, NULL, 1, 0),
(1638, 138, 'Pool &amp; Spa Thermometers', 'https://www.ebay.com/b/Pool-Spa-Thermometers/141482/bn_7509630', NULL, NULL, 1, 0),
(1639, 138, 'Pool Covers &amp; Rollers', 'https://www.ebay.com/b/Pool-Covers-Rollers/181068/bn_7442681', NULL, NULL, 1, 0),
(1640, 138, 'Heating, Cooling &amp; Air', 'https://www.ebay.com/b/Home-Heating-Cooling-Air-Filtering-Equipment/69197/bn_2313822', NULL, NULL, 1, 0),
(1641, 138, 'Plumbing &amp; Fixtures', 'https://www.ebay.com/b/Home-Plumbing-Fixtures/20601/bn_2309995', NULL, NULL, 1, 0),
(1642, 138, 'Electrical &amp; Solar Supplies', 'https://www.ebay.com/b/Electrical-Solar-Supplies/20595/bn_2313948', NULL, NULL, 1, 0),
(1643, 138, 'Building &amp; Hardware Supplies', 'https://www.ebay.com/b/Building-Hardware-Supplies/3187/bn_2313938', NULL, NULL, 1, 0),
(1644, 138, 'Security Equipment', 'https://www.ebay.com/b/Home-Security-Equipment/41968/bn_2312174', NULL, NULL, 1, 0),
(1645, 138, 'Thermostats', 'https://www.ebay.com/b/Thermostats/115947/bn_7479640', NULL, NULL, 1, 0),
(1646, 138, 'Space Heaters', 'https://www.ebay.com/b/Home-Space-Heaters/20613/bn_7477840', NULL, NULL, 1, 0),
(1647, 138, 'Fireplaces', 'https://www.ebay.com/b/Fireplaces/175756/bn_7505363', NULL, NULL, 1, 0),
(1648, 138, 'Dehumidifiers', 'https://www.ebay.com/b/Dehumidifiers/79621/bn_7756040', NULL, NULL, 1, 0),
(1649, 138, 'Air Purifiers', 'https://www.ebay.com/b/Air-Purifiers/43510/bn_7888459', NULL, NULL, 1, 0),
(1650, 138, 'Wi-Fi Thermostats', 'https://www.ebay.com/b/Wi-Fi-Programmable-Thermostats/115949/bn_81003365', NULL, NULL, 1, 0),
(1651, 138, 'Smart Bulbs', 'https://www.ebay.com/b/Smart-Bulbs/20706/bn_72322334', NULL, NULL, 1, 0),
(1652, 138, 'WIFI Doorbell', 'https://www.ebay.com/b/WIFI-Doorbell/115975/bn_55194470', NULL, NULL, 1, 0),
(1653, 138, 'Robotic Vacuum Cleaners', 'https://www.ebay.com/b/Robotic-Vacuum-Cleaners/20614/bn_7522842', NULL, NULL, 1, 0),
(1654, 138, 'Smart Door Lock ', 'https://www.ebay.com/b/Smart-Door-Lock/20593/bn_60793452', NULL, NULL, 1, 0),
(1655, 138, 'Nest Thermostats', 'https://www.ebay.com/b/Nest-Programmable-Thermostats/115949/bn_36839541', NULL, NULL, 1, 0),
(1656, 138, 'Philips Smart Bulbs', 'https://www.ebay.com/b/Philips-Smart-Bulbs/20706/bn_72313002', NULL, NULL, 1, 0),
(1657, 138, 'Ring Doorbell Pro', 'https://www.ebay.com/b/Ring-Doorbell-Pro/115975/bn_57334859', NULL, NULL, 1, 0),
(1658, 138, 'iRobot Vacuum Cleaners', 'https://www.ebay.com/b/iRobot-Vacuum-Cleaners/20614/bn_7522960', NULL, NULL, 1, 0),
(1659, 138, 'August Smart Lock', 'https://www.ebay.com/b/August-Smart-Lock/20593/bn_55187369', NULL, NULL, 1, 0),
(1660, 138, 'Power Tools', 'https://www.ebay.com/b/Power-Tools/3247/bn_2310272', NULL, NULL, 1, 0),
(1661, 138, 'Hand Tools', 'https://www.ebay.com/b/Home-Garden-Hand-Tools/3244/bn_2309686', NULL, NULL, 1, 0),
(1662, 138, 'Generators', 'https://www.ebay.com/b/Generators/33082/bn_2311037', NULL, NULL, 1, 0),
(1663, 138, 'Tool Boxes, Belts &amp; Storage Supplies', 'https://www.ebay.com/b/Home-Tool-Boxes-Belts-Storage-Supplies/42361/bn_2310678', NULL, NULL, 1, 0),
(1664, 138, 'Air Compressors', 'https://www.ebay.com/b/Home-Air-Compressors/30506/bn_2313588', NULL, NULL, 1, 0),
(1665, 138, 'Power Tool Batteries &amp; Chargers', 'https://www.ebay.com/b/Power-Tool-Batteries-Chargers/122840/bn_7539498', NULL, NULL, 1, 0),
(1666, 138, 'Cordless Drills', 'https://www.ebay.com/b/Cordless-Drills/71302/bn_7893682', NULL, NULL, 1, 0),
(1667, 138, 'Power Tool Combination Sets', 'https://www.ebay.com/b/Power-Tool-Combination-Sets/177000/bn_7550971', NULL, NULL, 1, 0),
(1668, 138, 'Measuring &amp; Layout Tools', 'https://www.ebay.com/b/Measuring-Layout-Tools/29523/bn_2309917', NULL, NULL, 1, 0),
(1669, 138, 'Welding &amp; Soldering Tools', 'https://www.ebay.com/b/Welding-Soldering-Tools/46413/bn_2311029', NULL, NULL, 1, 0),
(1670, 138, 'Refrigerators', 'https://www.ebay.com/b/Refrigerators/20713/bn_3238890', NULL, NULL, 1, 0),
(1671, 138, 'Washing Machines', 'https://www.ebay.com/b/Washing-Machines/71256/bn_3241856', NULL, NULL, 1, 0),
(1672, 138, 'Dryers', 'https://www.ebay.com/b/Dryers/71254/bn_3234962', NULL, NULL, 1, 0),
(1673, 138, 'Ranges &amp; Stoves', 'https://www.ebay.com/b/Ranges-Stoves/71250/bn_3165702', NULL, NULL, 1, 0),
(1674, 138, 'Dishwashers', 'https://www.ebay.com/b/Dishwashers/116023/bn_2311972', NULL, NULL, 1, 0),
(1675, 138, 'Microwave Ovens', 'https://www.ebay.com/b/Microwave-Ovens/150138/bn_2309570', NULL, NULL, 1, 0),
(1676, 138, 'Upright &amp; Chest Freezers', 'https://www.ebay.com/b/Upright-Chest-Freezers/71260/bn_3238456', NULL, NULL, 1, 0),
(1677, 138, 'Countertop Ice Makers', 'https://www.ebay.com/b/Countertop-Ice-Makers/122929/bn_3234053', NULL, NULL, 1, 0),
(1678, 138, 'Air Conditioners', 'https://www.ebay.com/b/Air-Conditioners/69202/bn_7897598', NULL, NULL, 1, 0),
(1679, 138, 'Home Water Filters', 'https://www.ebay.com/b/Home-Water-Filters/116400/bn_7478228', NULL, NULL, 1, 0),
(1680, 138, 'Dog Supplies', 'https://www.ebay.com/b/Dog-Supplies/20742/bn_1855885', NULL, NULL, 1, 0),
(1681, 138, 'Cat Supplies', 'https://www.ebay.com/b/Cat-Supplies/20737/bn_1865062', NULL, NULL, 1, 0),
(1682, 138, 'Fish &amp; Aquariums', 'https://www.ebay.com/b/Fish-Aquariums/20754/bn_827534', NULL, NULL, 1, 0),
(1683, 138, 'Small Animal Supplies', 'https://www.ebay.com/b/Small-Animal-Supplies/26696/bn_1856987', NULL, NULL, 1, 0),
(1684, 138, 'Bird Supplies', 'https://www.ebay.com/b/Bird-Supplies/20734/bn_1865523', NULL, NULL, 1, 0),
(1685, 138, 'Backyard Poultry Supplies', 'https://www.ebay.com/b/Backyard-Poultry-Supplies/177801/bn_1865068', NULL, NULL, 1, 0),
(1686, 138, 'Reptile Supplies', 'https://www.ebay.com/b/Reptile-Supplies/1285/bn_1849255', NULL, NULL, 1, 0),
(1687, 138, 'Equestrian Supplies', 'https://www.ebay.com/b/Equestrian-Equipment/3153/bn_1997329', NULL, NULL, 1, 0),
(1688, 138, 'Outdoor Bird &amp; Wildlife Accessories', 'https://www.ebay.com/b/Bird-Wildlife-Accessories/75578/bn_2310618', NULL, NULL, 1, 0),
(1689, 138, 'Clothing &amp; Shoes', 'https://www.ebay.com/b/Dog-Clothing-Shoes/177796/bn_2309543', NULL, NULL, 1, 0),
(1690, 138, 'Kitchen Tools &amp; Gadgets', 'https://www.ebay.com/b/Kitchen-Tools-Gadgets/20635/bn_2310865', NULL, NULL, 1, 0),
(1691, 138, 'Small Kitchen Appliances', 'https://www.ebay.com/b/Small-Kitchen-Appliances/20667/bn_2311275', NULL, NULL, 1, 0),
(1692, 138, 'Dinnerware &amp; Serving Dishes ', 'https://www.ebay.com/b/Dinnerware-Serving-Dishes/36027/bn_2309915', NULL, NULL, 1, 0),
(1693, 138, 'Cookware', 'https://www.ebay.com/b/Cookware/20628/bn_2313621', NULL, NULL, 1, 0),
(1694, 138, 'Knives &amp; Cutlerly ', 'https://www.ebay.com/b/Kitchen-Steak-Knives/177005/bn_2710857', NULL, NULL, 1, 0),
(1695, 138, 'Flatware &amp; Silverware', 'https://www.ebay.com/b/Flatware-Silverware/20693/bn_2710936', NULL, NULL, 1, 0),
(1696, 138, 'Baking Accessories &amp; Cake Decorating ', 'https://www.ebay.com/b/Baking-Accessories-and-Cake-Decorating/177009/bn_2310604', NULL, NULL, 1, 0),
(1697, 138, 'Kitchen Storage ', 'https://www.ebay.com/b/Kitchen-Dining-Bar-Storage-Equipment/20652/bn_2311541', NULL, NULL, 1, 0),
(1698, 138, 'Glassware', 'https://www.ebay.com/b/Glassware-Drinkware/20696/bn_2311255', NULL, NULL, 1, 0),
(1699, 138, 'Bar Tools &amp; Accessories', 'https://www.ebay.com/b/Bar-Tools-Accessories/20687/bn_2313845', NULL, NULL, 1, 0),
(1700, 138, 'Vacuum Cleaners', 'https://www.ebay.com/b/Vacuum-Cleaners/20614/bn_2310596', NULL, NULL, 1, 0),
(1701, 138, 'Home Organization Supplies', 'https://www.ebay.com/b/Home-Organization-Supplies/43502/bn_2311028', NULL, NULL, 1, 0),
(1702, 138, 'Closet Organizers', 'https://www.ebay.com/b/Closet-Organizers/43503/bn_7809005', NULL, NULL, 1, 0),
(1703, 138, 'Laundry Supplies', 'https://www.ebay.com/b/Laundry-Supplies/20620/bn_2313312', NULL, NULL, 1, 0),
(1704, 138, 'Trash Cans &amp; Wastebaskets', 'https://www.ebay.com/b/Trash-Cans-Wastebaskets/20608/bn_2311331', NULL, NULL, 1, 0),
(1705, 138, 'Carpet Shampooers', 'https://www.ebay.com/b/Carpet-Shampooers/177746/bn_2312278', NULL, NULL, 1, 0),
(1706, 138, 'Carpet Steamers', 'https://www.ebay.com/b/Carpet-Steamers/79656/bn_2310458', NULL, NULL, 1, 0),
(1707, 138, 'Carpet &amp; Floor Sweepers', 'https://www.ebay.com/b/Carpet-Floor-Sweepers/79657/bn_2310274', NULL, NULL, 1, 0),
(1708, 138, 'Cleaning Supplies', 'https://www.ebay.com/b/Cleaning-Supplies/20605/bn_2310931', NULL, NULL, 1, 0);
INSERT INTO `sub_categories` (`id`, `category_id`, `category`, `url`, `parent`, `has_child`, `has_listings`, `status`) VALUES
(1709, 138, 'Mops &amp; Brooms', 'https://www.ebay.com/b/Mops-Brooms/20607/bn_2313846', NULL, NULL, 1, 0),
(1710, 138, 'Dyson', 'https://www.ebay.com/b/Home-Heating-Cooling-Air-Filtering-Equipment/69197/bn_2313822', NULL, NULL, 1, 0),
(1711, 138, 'Bissell ', 'https://www.ebay.com/b/Home-Plumbing-Fixtures/20601/bn_2309995', NULL, NULL, 1, 0),
(1712, 138, 'iRobot', 'https://www.ebay.com/b/Electrical-Solar-Supplies/20595/bn_2313948', NULL, NULL, 1, 0),
(1713, 138, 'Hoover', 'https://www.ebay.com/b/Building-Hardware-Supplies/3187/bn_2313938', NULL, NULL, 1, 0),
(1714, 138, 'Shark ', 'https://www.ebay.com/b/Home-Security-Equipment/41968/bn_2312174', NULL, NULL, 1, 0),
(1715, 138, 'Sofa &amp; Love Seats ', 'https://www.ebay.com/b/Sofas-Loveseats-Chaises/38208/bn_1642996', NULL, NULL, 1, 0),
(1716, 138, 'Chairs', 'https://www.ebay.com/b/Chairs/54235/bn_1642567', NULL, NULL, 1, 0),
(1717, 138, 'Tables', 'https://www.ebay.com/b/Tables/38204/bn_1637428', NULL, NULL, 1, 0),
(1718, 138, 'Entertainment Centers &amp; TV Stands', 'https://www.ebay.com/b/Entertainment-Centers-TV-Stands/20488/bn_1637443', NULL, NULL, 1, 0),
(1719, 138, 'Desks &amp; Home Office', 'https://www.ebay.com/b/Home-Office-Furniture/88057/bn_1642240', NULL, NULL, 1, 0),
(1720, 138, 'Dining Furniture Sets', 'https://www.ebay.com/b/Dining-Furniture-Sets/107578/bn_1642062', NULL, NULL, 1, 0),
(1721, 138, 'Stools', 'https://www.ebay.com/b/Bar-Stools/153928/bn_1519339', NULL, NULL, 1, 0),
(1722, 138, 'Dresser &amp; Chest of Drawers', 'https://www.ebay.com/b/Dressers-Chests-of-Drawers/114397/bn_1642027', NULL, NULL, 1, 0),
(1723, 138, 'Beds &amp; Bedframes ', 'https://www.ebay.com/b/Beds-Bed-Frames/175758/bn_1650095', NULL, NULL, 1, 0),
(1724, 138, 'Mattresses', 'https://www.ebay.com/b/Mattresses/131588/bn_1519179', NULL, NULL, 1, 0),
(1725, 138, 'Sheets &amp; Pillowcases', 'https://www.ebay.com/b/Sheets-Pillowcases/20460/bn_2312175', NULL, NULL, 1, 0),
(1726, 138, 'Comforter Sets', 'https://www.ebay.com/b/Comforters-Bedding-Sets/45462/bn_2312287', NULL, NULL, 1, 0),
(1727, 138, 'Duvet Covers &amp; Sets', 'https://www.ebay.com/b/Duvet-Covers-Bedding-Sets/37644/bn_2310939', NULL, NULL, 1, 0),
(1728, 138, 'Quilts &amp; Coverlets', 'https://www.ebay.com/b/Quilts-Bedspreads-Coverlets/175749/bn_2313750', NULL, NULL, 1, 0),
(1729, 138, 'Bed Pillows', 'https://www.ebay.com/b/Bed-Pillows/20445/bn_2310162', NULL, NULL, 1, 0),
(1730, 138, 'Mattress Pads &amp; Feather Beds', 'https://www.ebay.com/b/Mattress-Pads-and-Feather-Beds/175751/bn_2311545', NULL, NULL, 1, 0),
(1731, 138, 'Nursery Bedding', 'https://www.ebay.com/b/Nursery-Bedding/20416/bn_1853279', NULL, NULL, 1, 0),
(1732, 138, 'Kids &amp; Teens Bedding', 'https://www.ebay.com/b/Kids-Teens-Bedding/66725/bn_864716', NULL, NULL, 1, 0),
(1733, 138, 'Beds &amp; Bed Frames', 'https://www.ebay.com/b/Beds-Bed-Frames/175758/bn_1650095', NULL, NULL, 1, 0),
(1734, 138, 'Die Cutting Vinyl', 'https://www.ebay.com/b/Scrapbooking-Die-Cutting-Vinyl/166722/bn_16516806', NULL, NULL, 1, 0),
(1735, 138, 'Beads &amp; Jewelry', 'https://www.ebay.com/b/Beads-Jewelry-Making-Supplies/31723/bn_1860484', NULL, NULL, 1, 0),
(1736, 138, 'Sewing Machines', 'https://www.ebay.com/b/Sewing-Machines-Sergers/3118/bn_7714181', NULL, NULL, 1, 0),
(1737, 138, 'Fabric', 'https://www.ebay.com/b/Fabric/28162/bn_2311333', NULL, NULL, 1, 0),
(1738, 138, 'Kniting &amp; Crochet', 'https://www.ebay.com/b/NeedleCrafts-Yarn/160706/bn_1849283', NULL, NULL, 1, 0),
(1739, 138, 'Scrapbooking &amp; Paper Craft Supplies', 'https://www.ebay.com/b/Scrapbooking-Paper-Craft-Supplies/11788/bn_1849898', NULL, NULL, 1, 0),
(1740, 138, 'Baking', 'https://www.ebay.com/b/Baking-Accessories-and-Cake-Decorating/177009/bn_2310604', NULL, NULL, 1, 0),
(1741, 138, 'Candle &amp; Soap making', 'https://www.ebay.com/b/Other-Candle-Making-Soap-Making-Supplies/3089/bn_2310716', NULL, NULL, 1, 0),
(1742, 138, 'Art Supplies', 'https://www.ebay.com/b/Art-Supplies/11783/bn_1855076', NULL, NULL, 1, 0),
(1743, 138, 'Kids\' Crafts', 'https://www.ebay.com/b/Kids-Crafts/116652/bn_1855399', NULL, NULL, 1, 0),
(1744, 138, 'Lawn Mowers', 'https://www.ebay.com/b/Lawn-Mowers-Parts-Accessories/43560/bn_2312193', NULL, NULL, 1, 0),
(1745, 138, 'Outdoor Lighting', 'https://www.ebay.com/b/Outdoor-Lighting-Equipment/42154/bn_2311422', NULL, NULL, 1, 0),
(1746, 139, 'Baseball &amp; Softball', 'https://www.ebay.com/b/Baseball-Softball-Equipment/16021/bn_1982027', NULL, NULL, 1, 0),
(1747, 139, 'Gloves and Mitts', 'https://www.ebay.com/b/Baseball-Softball-Gloves-Mitts/16030/bn_1941664', NULL, NULL, 1, 0),
(1748, 139, 'Baseball and Softball Bats', 'https://www.ebay.com/b/Baseball-Softball-Bats/181314/bn_15805513', NULL, NULL, 1, 0),
(1749, 139, 'Bowling', 'https://www.ebay.com/b/Bowling-Equipment/20846/bn_1995651', NULL, NULL, 1, 0),
(1750, 139, 'Bowling Balls', 'https://www.ebay.com/b/Bowling-Balls/36105/bn_1980901', NULL, NULL, 1, 0),
(1751, 139, 'Ice &amp; Roller Hockey', 'https://www.ebay.com/b/Ice-Roller-Hockey-Equipment/40154/bn_1970954', NULL, NULL, 1, 0),
(1752, 139, 'Soccer', 'https://www.ebay.com/b/Soccer-Equipment/20862/bn_1941947', NULL, NULL, 1, 0),
(1753, 139, 'Soccer Shoes &amp; Cleats', 'https://www.ebay.com/b/Soccer-Shoes-Cleats/19298/bn_1995093', NULL, NULL, 1, 0),
(1754, 139, 'Football', 'https://www.ebay.com/b/Football-Equipment/21214/bn_1947420', NULL, NULL, 1, 0),
(1755, 139, 'Basketball', 'https://www.ebay.com/b/Basketball-Equipment/21194/bn_1993160', NULL, NULL, 1, 0),
(1756, 139, 'Optics', 'https://www.ebay.com/b/Hunting-Scopes-Optics-Lasers/31710/bn_1865309', NULL, NULL, 1, 0),
(1757, 139, 'Gun Parts', 'https://www.ebay.com/b/Gun-Parts/73943/bn_1865115', NULL, NULL, 1, 0),
(1758, 139, 'Holsters &amp; More', 'https://www.ebay.com/b/Hunting-Holsters-Belts-Pouches/73963/bn_1865264', NULL, NULL, 1, 0),
(1759, 139, 'Range &amp; Shooting Accessories', 'https://www.ebay.com/b/Range-Shooting-Accessories/177904/bn_1864379', NULL, NULL, 1, 0),
(1760, 139, 'Tactical Gear', 'https://www.ebay.com/b/Tactical-Duty-Gear/177890/bn_1865330', NULL, NULL, 1, 0),
(1761, 139, 'Hunting Apparel', 'https://www.ebay.com/b/Hunting-Clothing-Shoes-Accessories/36239/bn_1865060', NULL, NULL, 1, 0),
(1762, 139, 'Trail Cameras', 'https://www.ebay.com/b/Hunting-Game-Trail-Cameras/52505/bn_1864384', NULL, NULL, 1, 0),
(1763, 139, 'Gun Storage', 'https://www.ebay.com/b/Gun-Storage/73937/bn_1849550', NULL, NULL, 1, 0),
(1764, 139, 'Knives &amp; Tools', 'https://www.ebay.com/b/Hunting-Knives-Tools/42574/bn_1848703', NULL, NULL, 1, 0),
(1765, 139, 'Gun Smithing &amp; Maintenance', 'https://www.ebay.com/b/Gun-Smithing-Maintenance/177880/bn_1850248', NULL, NULL, 1, 0),
(1766, 139, 'Camping &amp; Hiking Equipment', 'https://www.ebay.com/b/Camping-Hiking-Equipment/16034/bn_1959887', NULL, NULL, 1, 0),
(1767, 139, 'Tents', 'https://www.ebay.com/b/Camping-Hiking-Tents/179010/bn_7221813', NULL, NULL, 1, 0),
(1768, 139, 'Archery', 'https://www.ebay.com/b/Archery-Equipment/20835/bn_1971493', NULL, NULL, 1, 0),
(1769, 139, 'Compound Bows', 'https://www.ebay.com/b/Archery-Compound-Bows/20838/bn_8207200', NULL, NULL, 1, 0),
(1770, 139, 'Recurve Bows', 'https://www.ebay.com/b/Recurve-Bows/20839/bn_7332774', NULL, NULL, 1, 0),
(1771, 139, 'Paintball', 'https://www.ebay.com/b/Paintball-Markers/16048/bn_1959010', NULL, NULL, 1, 0),
(1772, 139, 'Airsoft Guns', 'https://www.ebay.com/b/Airsoft-Guns/31683/bn_1996447', NULL, NULL, 1, 0),
(1773, 139, 'Skateboarding &amp; Longboarding', 'https://www.ebay.com/b/Skateboarding-Longboarding-Equipment/16262/bn_1988901', NULL, NULL, 1, 0),
(1774, 139, 'Electric Scooters', 'https://www.ebay.com/b/Electric-Scooters/47349/bn_1995803', NULL, NULL, 1, 0),
(1775, 139, 'Equestrian', 'https://www.ebay.com/b/Equestrian-Equipment/3153/bn_1997329', NULL, NULL, 1, 0),
(1776, 139, 'Tactical &amp; Duty Gear', 'https://www.ebay.com/b/Tactical-Duty-Gear/177890/bn_1865330', NULL, NULL, 1, 0),
(1777, 139, 'Scopes, Optics &amp; Lasers', 'https://www.ebay.com/b/Hunting-Scopes-Optics-Lasers/31710/bn_1865309', NULL, NULL, 1, 0),
(1778, 139, 'Gun Holsters, Belts &amp; Pouches', 'https://www.ebay.com/b/Hunting-Holsters-Belts-Pouches/73963/bn_1865264', NULL, NULL, 1, 0),
(1779, 139, 'Gun Reloading Equipment', 'https://www.ebay.com/b/Hunting-Gun-Reloading-Equipment/31823/bn_1860483', NULL, NULL, 1, 0),
(1780, 139, 'Tactical Bags &amp; Packs', 'https://www.ebay.com/b/Tactical-Bags-Packs/177899/bn_1849810', NULL, NULL, 1, 0),
(1781, 139, 'Reels', 'https://www.ebay.com/b/Fishing-Reels/179950/bn_1990224', NULL, NULL, 1, 0),
(1782, 139, 'Rods', 'https://www.ebay.com/b/Fishing-Rods/179946/bn_1943108', NULL, NULL, 1, 0),
(1783, 139, 'Fishfinders', 'https://www.ebay.com/b/Fishfinders/29723/bn_1957588', NULL, NULL, 1, 0),
(1784, 139, 'Fishing Baits, Lures &amp; Flies', 'https://www.ebay.com/b/Fishing-Baits-Lures-Flies/179961/bn_1991492', NULL, NULL, 1, 0),
(1785, 139, 'Fishing Apparel', 'https://www.ebay.com/b/Fishing-Clothing-Shoes-Accessories/179978/bn_1956630', NULL, NULL, 1, 0),
(1786, 139, 'Line &amp; Leaders', 'https://www.ebay.com/b/Fishing-Line-Leaders/179965/bn_1986085', NULL, NULL, 1, 0),
(1787, 139, 'Terminal Tackle', 'https://www.ebay.com/b/Fishing-Terminal-Tackle/179973/bn_1967781', NULL, NULL, 1, 0),
(1788, 139, 'Fishing Equipment', 'https://www.ebay.com/b/Fishing-Equipment/179985/bn_1967639', NULL, NULL, 1, 0),
(1789, 139, 'Rod &amp; Reel Combos', 'https://www.ebay.com/b/Fishing-Rod-Reel-Combos/179953/bn_1976387', NULL, NULL, 1, 0),
(1790, 139, 'Tackle Boxes &amp; Bags', 'https://www.ebay.com/b/Fishing-Tackle-Boxes-Bags/22696/bn_1985630', NULL, NULL, 1, 0),
(1791, 139, 'Men\'s Golf Clubs', 'https://www.ebay.com/b/Men-Golf-Clubs/115280/bn_7247740', NULL, NULL, 1, 0),
(1792, 139, 'Men\'s Golf Clothing', 'https://www.ebay.com/b/Mens-Golf-Clothing-Shoes/181131/bn_7317122', NULL, NULL, 1, 0),
(1793, 139, 'Men\'s Golf Shoes', 'https://www.ebay.com/b/Mens-Golf-Shoes/181136/bn_7423152', NULL, NULL, 1, 0),
(1794, 139, 'Women\'s Golf Clubs', 'https://www.ebay.com/b/Womens-Golf-Clubs/115280/bn_7243554', NULL, NULL, 1, 0),
(1795, 139, 'Women\'s Golf Clothing', 'https://www.ebay.com/b/Womens-Golf-Clothing-Shoes/181142/bn_8230897', NULL, NULL, 1, 0),
(1796, 139, 'Women\'s Golf Shoes', 'https://www.ebay.com/b/Womens-Golf-Shoes/181147/bn_7407036', NULL, NULL, 1, 0),
(1797, 139, 'Juniors Golf Clubs', 'https://www.ebay.com/b/Junior-Golf-Clubs/115280/bn_7235562', NULL, NULL, 1, 0),
(1798, 139, 'Golf Balls', 'https://www.ebay.com/b/Golf-Balls/18924/bn_7426726', NULL, NULL, 1, 0),
(1799, 139, 'Golf Club Bags', 'https://www.ebay.com/b/Golf-Club-Bags/30109/bn_7418494', NULL, NULL, 1, 0),
(1800, 139, 'Golf Accessories', 'https://www.ebay.com/b/Golf-Accessories/181128/bn_7203631', NULL, NULL, 1, 0),
(1801, 139, 'Bicycles', 'https://www.ebay.com/b/Bikes/177831/bn_1865335', NULL, NULL, 1, 0),
(1802, 139, 'Frames', 'https://www.ebay.com/b/Bike-Frames/22679/bn_1865567', NULL, NULL, 1, 0),
(1803, 139, 'Wheels &amp; Wheelsets', 'https://www.ebay.com/b/Bicycle-Wheels-Wheelsets/177830/bn_1861229', NULL, NULL, 1, 0),
(1804, 139, 'Components &amp; Parts', 'https://www.ebay.com/b/Bike-Components-Parts/57262/bn_1865545', NULL, NULL, 1, 0),
(1805, 139, 'Electric Bicycles', 'https://www.ebay.com/b/Electric-Bikes/74469/bn_1968968', NULL, NULL, 1, 0),
(1806, 139, 'Car &amp; Truck Racks', 'https://www.ebay.com/b/Car-Truck-Bicycle-Racks/177849/bn_1865384', NULL, NULL, 1, 0),
(1807, 139, 'Bicyle Accessories', 'https://www.ebay.com/b/Bicycle-Accessories/177832/bn_1848697', NULL, NULL, 1, 0),
(1808, 139, 'Cycling Clothing', 'https://www.ebay.com/b/Cycling-Clothing/158990/bn_1865085', NULL, NULL, 1, 0),
(1809, 139, 'Bicycle Maintenance &amp; Tools', 'https://www.ebay.com/b/Bike-Maintenance-Tools/177844/bn_1865090', NULL, NULL, 1, 0),
(1810, 139, 'Vintage Cycling', 'https://www.ebay.com/b/Vintage-Cycling-Equipment/158999/bn_1861358', NULL, NULL, 1, 0),
(1811, 139, 'Fitness Technology', 'https://www.ebay.com/b/Fitness-Technology/44075/bn_1944181', NULL, NULL, 1, 0),
(1812, 139, 'Fitness Activity Trackers', 'https://www.ebay.com/b/Fitness-Activity-Trackers/179798/bn_1985569', NULL, NULL, 1, 0),
(1813, 139, 'Fitness Equipment &amp; Gear', 'https://www.ebay.com/b/Fitness-Equipment-Gear/28064/bn_1950996', NULL, NULL, 1, 0),
(1814, 139, 'Strength Training Equipment', 'https://www.ebay.com/b/Strength-Training-Equipment/28066/bn_1969806', NULL, NULL, 1, 0),
(1815, 139, 'Dumbbells', 'https://www.ebay.com/b/Dumbbells/137865/bn_1940974', NULL, NULL, 1, 0),
(1816, 139, 'Cardio Equipment', 'https://www.ebay.com/b/Cardio-Equipment/28059/bn_1995691', NULL, NULL, 1, 0),
(1817, 139, 'Rowing Machines', 'https://www.ebay.com/b/Rowing-Machines/28060/bn_1939049', NULL, NULL, 1, 0),
(1818, 139, 'Elliptical Machines', 'https://www.ebay.com/b/Elliptical-Machines/72602/bn_1958214', NULL, NULL, 1, 0),
(1819, 139, 'Treadmills', 'https://www.ebay.com/b/Treadmills/15280/bn_1988834', NULL, NULL, 1, 0),
(1820, 139, 'Exercise Bikes', 'https://www.ebay.com/b/Exercise-Bikes/58102/bn_1943809', NULL, NULL, 1, 0),
(1821, 139, 'Billiards', 'https://www.ebay.com/b/Billiards/21567/bn_1957044', NULL, NULL, 1, 0),
(1822, 139, 'Billiard Tables', 'https://www.ebay.com/b/Billiard-Tables/21213/bn_1975261', NULL, NULL, 1, 0),
(1823, 139, 'Billiard Cues', 'https://www.ebay.com/b/Billiard-Cues/21568/bn_1943868', NULL, NULL, 1, 0),
(1824, 139, 'Pool Table Lights', 'https://www.ebay.com/b/Billiard-Table-Lights-Lamps/75189/bn_1989265', NULL, NULL, 1, 0),
(1825, 139, 'Darts', 'https://www.ebay.com/b/Darts/26328/bn_1959810', NULL, NULL, 1, 0),
(1826, 139, 'Air Hockey', 'https://www.ebay.com/b/Air-Hockey-Equipment/36275/bn_1947299', NULL, NULL, 1, 0),
(1827, 139, 'Foosball', 'https://www.ebay.com/b/Foosball-Equipment/36276/bn_1991587', NULL, NULL, 1, 0),
(1828, 139, 'Table Tennis &amp; Ping Pong', 'https://www.ebay.com/b/Table-Tennis-Equipment/97072/bn_1958176', NULL, NULL, 1, 0),
(1829, 139, 'Shuffleboard', 'https://www.ebay.com/b/Shuffleboards-Equipment/79777/bn_1960988', NULL, NULL, 1, 0),
(1830, 139, 'Indoor Roller Skating', 'https://www.ebay.com/b/Indoor-Roller-Skating/165938/bn_1965255', NULL, NULL, 1, 0),
(1831, 139, 'Kayaks', 'https://www.ebay.com/b/Kayaks/36122/bn_1946846', NULL, NULL, 1, 0),
(1832, 139, 'Canoes', 'https://www.ebay.com/b/Canoes/23800/bn_1969767', NULL, NULL, 1, 0),
(1833, 139, 'Stand Up Paddleboards', 'https://www.ebay.com/b/Stand-Up-Paddleboards/177504/bn_1965548', NULL, NULL, 1, 0),
(1834, 139, 'Surfboards', 'https://www.ebay.com/b/Surfboards/22710/bn_1976435', NULL, NULL, 1, 0),
(1835, 139, 'Kitesurfing', 'https://www.ebay.com/b/Kitesurfing-Equipment/114262/bn_1946168', NULL, NULL, 1, 0),
(1836, 139, 'SCUBA &amp; Snorkeling', 'https://www.ebay.com/b/SCUBA-Snorkeling-Equipment/16052/bn_1965122', NULL, NULL, 1, 0),
(1837, 139, 'Wakeboarding &amp; Waterskiing', 'https://www.ebay.com/b/Wakeboarding-Waterskiing-Equipment/23806/bn_1985261', NULL, NULL, 1, 0),
(1838, 139, 'Life Jackets &amp; Preservers', 'https://www.ebay.com/b/Life-Jackets-Preservers/15262/bn_1968363', NULL, NULL, 1, 0),
(1839, 139, 'Wetsuits', 'https://www.ebay.com/b/Wetsuits/47354/bn_1958250', NULL, NULL, 1, 0),
(1840, 139, 'Swimming Equipment', 'https://www.ebay.com/b/Swimming-Equipment/74050/bn_1968654', NULL, NULL, 1, 0),
(1841, 140, 'TV, Movies &amp; Games', 'https://www.ebay.com/b/TV-Movie-Video-Game-Action-Figures/75708/bn_223372', NULL, NULL, 1, 0),
(1842, 140, 'Comic Book Heroes', 'https://www.ebay.com/b/Comic-Book-Hero-Action-Figures/158671/bn_221281', NULL, NULL, 1, 0),
(1843, 140, 'Military &amp; Adventure', 'https://www.ebay.com/b/Military-Adventure-Action-Figures/158679/bn_223805', NULL, NULL, 1, 0),
(1844, 140, 'Robots &amp; More', 'https://www.ebay.com/b/Transformers-Robot-Action-Figures/83732/bn_223040', NULL, NULL, 1, 0),
(1845, 140, 'Sports', 'https://www.ebay.com/b/Sports-Action-Figures/754/bn_223371', NULL, NULL, 1, 0),
(1846, 140, 'Star Wars', 'https://www.ebay.com/b/Star-Wars-TV-Movie-and-Video-Game-Action-Figures/75708/bn_229260', NULL, NULL, 1, 0),
(1847, 140, 'Marvel Universe', 'https://www.ebay.com/b/Marvel-Universe-Comic-Book-Hero-Action-Figures/158671/bn_222076', NULL, NULL, 1, 0),
(1848, 140, 'DC Universe', 'https://www.ebay.com/b/DC-Universe-Comic-Book-Hero-Action-Figures/158671/bn_221713', NULL, NULL, 1, 0),
(1849, 140, 'G.I. Joe', 'https://www.ebay.com/b/GI-Joe-Military-and-Adventure-Action-Figures/158679/bn_229230', NULL, NULL, 1, 0),
(1850, 140, 'Funko', 'https://www.ebay.com/b/FUNKO-Designer-and-Urban-Vinyl-Action-Figures/158672/bn_220989', NULL, NULL, 1, 0),
(1851, 140, 'American Girl', 'https://www.ebay.com/b/American-Girl-Dolls/95230/bn_16561431', NULL, NULL, 1, 0),
(1852, 140, 'Doll House Furniture', 'https://www.ebay.com/b/Doll-Furniture/18810/bn_2313851', NULL, NULL, 1, 0),
(1853, 140, 'Reborn Dolls &amp; Clothing', 'https://www.ebay.com/b/Reborn-Dolls-Clothing/122721/bn_2310901', NULL, NULL, 1, 0),
(1854, 140, 'Barbie Contemporary Dolls', 'https://www.ebay.com/b/Barbie-Contemporary-Dolls-1973-Now/15949/bn_2311256', NULL, NULL, 1, 0),
(1855, 140, 'Barbie Vintage Dolls', 'https://www.ebay.com/b/Barbie-Vintage-Dolls-Pre-1973/15965/bn_2311136', NULL, NULL, 1, 0),
(1856, 140, 'Shop All Dolls', 'https://www.ebay.com/b/Dolls/238/bn_1849735', NULL, NULL, 1, 0),
(1857, 140, 'Doll Houses', 'https://www.ebay.com/b/Doll-Houses/2458/bn_1865478', NULL, NULL, 1, 0),
(1858, 140, 'Dollhouse Miniatures', 'https://www.ebay.com/b/Dollhouse-Miniatures/1202/bn_1859745', NULL, NULL, 1, 0),
(1859, 140, 'Paper Dolls', 'https://www.ebay.com/b/Paper-Dolls/2440/bn_1865313', NULL, NULL, 1, 0),
(1860, 140, 'Teddy Bears', 'https://www.ebay.com/b/Teddy-Bears/386/bn_1865267', NULL, NULL, 1, 0),
(1861, 140, 'Board &amp; Traditional Games', 'https://www.ebay.com/b/Board-Traditional-Games/2550/bn_1642741', NULL, NULL, 1, 0),
(1862, 140, 'Card Games &amp; Poker', 'https://www.ebay.com/b/Card-Games-Poker/180350/bn_1922003', NULL, NULL, 1, 0),
(1863, 140, 'Electronic Games', 'https://www.ebay.com/b/Electronic-Games/2540/bn_1926150', NULL, NULL, 1, 0),
(1864, 140, 'Miniatures &amp; War Games', 'https://www.ebay.com/b/Miniatures-War-Games/16486/bn_1892503', NULL, NULL, 1, 0),
(1865, 140, 'Role Playing Games', 'https://www.ebay.com/b/Role-Playing-Games/2543/bn_1917981', NULL, NULL, 1, 0),
(1866, 140, 'LEGO', 'https://www.ebay.com/b/LEGO-Building-Toys/183447/bn_1937200', NULL, NULL, 1, 0),
(1867, 140, 'Mega Bloks', 'https://www.ebay.com/b/Mega-Bloks/52338/bn_1906690', NULL, NULL, 1, 0),
(1868, 140, 'K\'NEX', 'https://www.ebay.com/b/KNEX-Building-Toys/21254/bn_1921445', NULL, NULL, 1, 0),
(1869, 140, 'Erector Sets', 'https://www.ebay.com/b/Meccano-Erector-Building-Sets/28811/bn_1905332', NULL, NULL, 1, 0),
(1870, 140, 'Lincoln Logs', 'https://www.ebay.com/b/Lincoln-Logs-Building-Toys/19013/bn_1921559', NULL, NULL, 1, 0),
(1871, 140, 'Quadcopters', 'https://www.ebay.com/b/Other-RC-Model-Vehicles-Kits/182186/bn_1928098', NULL, NULL, 1, 0),
(1872, 140, 'Vehicles &amp; Kits', 'https://www.ebay.com/b/RC-Model-Vehicles-Kits/182181/bn_1913367', NULL, NULL, 1, 0),
(1873, 140, 'RC Plans &amp; Manuals', 'https://www.ebay.com/b/Hobby-RC-Model-Plans-Templates-Manuals/182212/bn_1923033', NULL, NULL, 1, 0),
(1874, 140, 'Non-RC Planes', 'https://www.ebay.com/b/Control-Line-Freeflight-Models-Kits/34054/bn_1930288', NULL, NULL, 1, 0),
(1875, 140, 'RC Simulators', 'https://www.ebay.com/b/Hobby-RC-Simulators/171145/bn_1930130', NULL, NULL, 1, 0),
(1876, 140, 'HO Scale', 'https://www.ebay.com/b/HO-Scale-Model-Railroads-Trains/19128/bn_1648402', NULL, NULL, 1, 0),
(1877, 140, 'O Scale', 'https://www.ebay.com/b/O-Scale-Model-Railroads-Trains/19145/bn_1637442', NULL, NULL, 1, 0),
(1878, 140, 'N Scale', 'https://www.ebay.com/b/N-Scale-Model-Railroads-Trains/19119/bn_1650078', NULL, NULL, 1, 0),
(1879, 140, 'S Scale', 'https://www.ebay.com/b/S-Scale-Model-Railroads-Trains/19143/bn_1637603', NULL, NULL, 1, 0),
(1880, 140, 'G Scale', 'https://www.ebay.com/b/G-Scale-Model-Railroads-Trains/19151/bn_1648401', NULL, NULL, 1, 0),
(1881, 140, 'Magic: The Gathering', 'https://www.ebay.com/b/Collectible-Magic-The-Gathering-Card-Games/19107/bn_1929791', NULL, NULL, 1, 0),
(1882, 140, 'PokÃ©mon Trading Game', 'https://www.ebay.com/b/Pokemon-Trading-Game-Cards/183466/bn_1904919', NULL, NULL, 1, 0),
(1883, 140, 'Yu-Gi-Oh! Trading Game', 'https://www.ebay.com/b/Yu-Gi-Oh-Trading-Card-Game-Cards-Merchandise/31393/bn_1914130', NULL, NULL, 1, 0),
(1884, 140, 'CCG Individual Cards', 'https://www.ebay.com/b/Individual-Collectible-Card-Game-Cards/183454/bn_1893526', NULL, NULL, 1, 0),
(1885, 140, 'Other CCG Items', 'https://www.ebay.com/b/Other-Collectible-Card-Game-Items/2535/bn_7203477', NULL, NULL, 1, 0),
(1886, 140, 'Hot Wheels', 'https://www.ebay.com/b/Hot-Wheels-Diecast-and-Toy-Vehicles/222/bn_1853227', NULL, NULL, 1, 0),
(1887, 140, 'Matchbox', 'https://www.ebay.com/b/Matchbox-Diecast-and-Toy-Vehicles/222/bn_1863788', NULL, NULL, 1, 0),
(1888, 140, 'Action', 'https://www.ebay.com/b/Action-Diecast-and-Toy-Vehicles/222/bn_1852941', NULL, NULL, 1, 0),
(1889, 140, 'Tonka', 'https://www.ebay.com/b/Tonka-Diecast-and-Toy-Vehicles/222/bn_1854350', NULL, NULL, 1, 0),
(1890, 140, 'Jada Toys', 'https://www.ebay.com/b/Jada-Toys-Diecast-Toy-Vehicles/222/bn_1862720', NULL, NULL, 1, 0),
(1891, 140, 'Johnny Lightning', 'https://www.ebay.com/b/Johnny-Lightning-Toys/222/bn_1854714', NULL, NULL, 1, 0),
(1892, 140, 'Maisto', 'https://www.ebay.com/b/Maisto-Diecast-and-Toy-Vehicles/222/bn_1851529', NULL, NULL, 1, 0),
(1893, 140, 'Danbury Mint', 'https://www.ebay.com/b/Danbury-Mint-Diecast-and-Toy-Vehicles/222/bn_1856713', NULL, NULL, 1, 0),
(1894, 140, 'Franklin Mint', 'https://www.ebay.com/b/Franklin-Mint-Diecast-and-Toy-Vehicles/222/bn_1865691', NULL, NULL, 1, 0),
(1895, 140, 'Corgi', 'https://www.ebay.com/b/Corgi-Diecast-and-Toy-Vehicles/222/bn_1856749', NULL, NULL, 1, 0),
(1896, 140, 'Outdoor Toys', 'https://www.ebay.com/b/Outdoor-Toys-Structures/11743/bn_1849278', NULL, NULL, 1, 0),
(1897, 140, 'Vintage Toys', 'https://www.ebay.com/b/Vintage-Antique-Toys/717/bn_1860860', NULL, NULL, 1, 0),
(1898, 141, 'Excavators', 'https://www.ebay.com/b/Excavators/97122/bn_1511523', NULL, NULL, 1, 0),
(1899, 141, 'Skid Steer Loaders', 'https://www.ebay.com/b/Skid-Steer-Loaders/95494/bn_1511519', NULL, NULL, 1, 0),
(1900, 141, 'Wheel Loaders', 'https://www.ebay.com/b/Wheel-Loaders/58161/bn_1511508', NULL, NULL, 1, 0),
(1901, 141, 'Construction Equipment Parts', 'https://www.ebay.com/b/Construction-Equipment-Parts/41490/bn_7208209', NULL, NULL, 1, 0),
(1902, 141, 'Tractor Parts', 'https://www.ebay.com/b/Tractor-Parts/121876/bn_7208274', NULL, NULL, 1, 0),
(1903, 141, 'Fork Attachments', 'https://www.ebay.com/b/Heavy-Equipment-Fork-Attachments/41488/bn_1309156', NULL, NULL, 1, 0),
(1904, 141, 'Backhoe Attachments', 'https://www.ebay.com/b/Heavy-Equipment-Backhoe-Attachments/66926/bn_1309170', NULL, NULL, 1, 0),
(1905, 141, 'Scissor &amp; Boom Lifts', 'https://www.ebay.com/b/Scissor-Boom-Lifts/97123/bn_1511511', NULL, NULL, 1, 0),
(1906, 141, 'Lab Equipment', 'https://www.ebay.com/b/Lab-Equipment/26231/bn_2311646', NULL, NULL, 1, 0),
(1907, 141, 'Lab Supplies', 'https://www.ebay.com/b/Lab-Supplies/26413/bn_2313593', NULL, NULL, 1, 0),
(1908, 141, 'Dental Equipment', 'https://www.ebay.com/b/Dental-Equipment/63991/bn_2311917', NULL, NULL, 1, 0),
(1909, 141, 'Dental Supplies', 'https://www.ebay.com/b/Dental-Supplies/106371/bn_16562557', NULL, NULL, 1, 0),
(1910, 141, 'Medical Equipment', 'https://www.ebay.com/b/Medical-Equipment/159692/bn_2310532', NULL, NULL, 1, 0),
(1911, 141, 'Medical Specialty Supplies', 'https://www.ebay.com/b/Medical-Specialty-Supplies/92073/bn_2311009', NULL, NULL, 1, 0),
(1912, 141, 'Analytical Instruments', 'https://www.ebay.com/b/Analytical-Instruments/26230/bn_16561449', NULL, NULL, 1, 0),
(1913, 141, 'Medical Instruments', 'https://www.ebay.com/b/Medical-Instruments/11823/bn_2313888', NULL, NULL, 1, 0),
(1914, 141, 'Medical Monitoring Systems', 'https://www.ebay.com/b/Patient-Monitors/100006/bn_16563652', NULL, NULL, 1, 0),
(1915, 141, 'Endoscopy &amp; Laparoscopy Equipment', 'https://www.ebay.com/b/Endoscopy-Laparoscopy-Equipment/31460/bn_16562680', NULL, NULL, 1, 0),
(1916, 141, 'Industrial Metalworking Tooling', 'https://www.ebay.com/b/Metalworking-Tooling/92084/bn_2311921', NULL, NULL, 1, 0),
(1917, 141, 'Welding Equipment', 'https://www.ebay.com/b/Welding-Equipment/34095/bn_2312181', NULL, NULL, 1, 0),
(1918, 141, 'Manufacturing Process Equipment', 'https://www.ebay.com/b/Manufacturing-Metalworking-Process-Equipment/45038/bn_2309930', NULL, NULL, 1, 0),
(1919, 141, 'Industrial Woodworking', 'https://www.ebay.com/b/Business-Industrial-Woodworking/42935/bn_2311423', NULL, NULL, 1, 0),
(1920, 141, 'Semiconductor &amp; PCB Equipment', 'https://www.ebay.com/b/Semiconductor-PCB-Equipment/58290/bn_2310616', NULL, NULL, 1, 0),
(1921, 141, 'Textile &amp; Apparel Manufacturing Equipment', 'https://www.ebay.com/b/Textile-Apparel-Manufacturing-Equipment/45033/bn_2311561', NULL, NULL, 1, 0),
(1922, 141, 'Mailers', 'https://www.ebay.com/b/Other-Envelopes-Mailers/184267/bn_2313784', NULL, NULL, 1, 0),
(1923, 141, 'Packing &amp; Shipping Bags', 'https://www.ebay.com/b/Other-Packing-Shipping-Bags/109698/bn_2311402', NULL, NULL, 1, 0),
(1924, 141, 'Shipping &amp; Moving Boxes', 'https://www.ebay.com/b/Shipping-Moving-Boxes/109740/bn_2311435', NULL, NULL, 1, 0),
(1925, 141, 'Packing Tape &amp; Dispensers', 'https://www.ebay.com/b/Packing-Tapes-Sealants/109735/bn_2310900', NULL, NULL, 1, 0),
(1926, 141, 'Shipping &amp; Postal Scales', 'https://www.ebay.com/b/Other-Packaging-Shipping/1290/bn_2310593', NULL, NULL, 1, 0),
(1927, 141, 'Packing &amp; Shipping Cushioning Supplies', 'https://www.ebay.com/b/Shipping-Cushioning-Supplies/109699/bn_2313314', NULL, NULL, 1, 0),
(1928, 141, 'Access Control Equipment', 'https://www.ebay.com/b/Access-Control-Equipment/183810/bn_78212982', NULL, NULL, 1, 0),
(1929, 141, 'Facility Lighting', 'https://www.ebay.com/b/Facility-Lighting/183838/bn_78213255', NULL, NULL, 1, 0),
(1930, 141, 'Facility Bathroom &amp; Refuse', 'https://www.ebay.com/b/Facility-Bathroom-Refuse/183951/bn_78213424', NULL, NULL, 1, 0),
(1931, 141, 'Facility Safety Equipment', 'https://www.ebay.com/b/Facility-Safety-Equipment/183841/bn_78213197', NULL, NULL, 1, 0),
(1932, 141, 'Personal Protective Equipment (PPE)', 'https://www.ebay.com/b/Personal-Protective-Equipment-PPE/183970/bn_78213405', NULL, NULL, 1, 0),
(1933, 141, 'Commercial Kitchen Equipment', 'https://www.ebay.com/b/Commercial-Kitchen-Equipment/25367/bn_2309960', NULL, NULL, 1, 0),
(1934, 141, 'Restaurant Refrigeration &amp; Ice Machines', 'https://www.ebay.com/b/Restaurant-Refrigeration-Ice-Machines/25375/bn_2309931', NULL, NULL, 1, 0),
(1935, 141, 'Commercial Food Preparation Equipment', 'https://www.ebay.com/b/Commercial-Food-Preparation-Equipment/95078/bn_7701780', NULL, NULL, 1, 0),
(1936, 141, 'Commercial Bar &amp; Beverage Equipment', 'https://www.ebay.com/b/Commercial-Bar-Beverage-Equipment/25362/bn_2310520', NULL, NULL, 1, 0),
(1937, 141, 'Food Trucks, Trailers &amp; Carts', 'https://www.ebay.com/b/Catering-Food-Trucks-Trailers-Carts/67145/bn_2311099', NULL, NULL, 1, 0),
(1938, 141, 'Commercial Kitchen Mixers', 'https://www.ebay.com/b/Commercial-Kitchen-Mixers/25373/bn_7681224', NULL, NULL, 1, 0),
(1939, 141, 'Restaurant Serving, Buffet &amp; Catering Supplies', 'https://www.ebay.com/b/Restaurant-Serving-Buffet-Catering-Supplies/55835/bn_7665503', NULL, NULL, 1, 0),
(1940, 141, 'Commercial Food Storage &amp; Handling Equipment', 'https://www.ebay.com/b/Commercial-Food-Storage-Handling-Equipment/57100/bn_7619162', NULL, NULL, 1, 0),
(1941, 141, 'Commercial Kitchen Cleaning &amp; Warewashing Equipment', 'https://www.ebay.com/b/Commercial-Kitchen-Cleaning-Warewashing-Equipment/57106/bn_7565524', NULL, NULL, 1, 0),
(1942, 141, 'Meat Grinders', 'https://www.ebay.com/b/Meat-Grinders/66751/bn_2711327', NULL, NULL, 1, 0),
(1943, 141, 'Food Trucks &amp; Concession Trailers', 'https://www.ebay.com/b/Food-Trucks-Concession-Trailers/184249/bn_7717994', NULL, NULL, 1, 0),
(1944, 141, 'Catering Carts, Stands and Kiosks', 'https://www.ebay.com/b/Catering-Carts-Stands-and-Kiosks/67146/bn_7665408', NULL, NULL, 1, 0),
(1945, 141, 'Commercial Food Storage Containers', 'https://www.ebay.com/b/Commercial-Food-Storage-Containers/57102/bn_7563511', NULL, NULL, 1, 0),
(1946, 141, 'Restaurant Furniture, Signs &amp; DÃ©cor', 'https://www.ebay.com/b/Restaurant-Furniture-Signs-Decor/57093/bn_2311231', NULL, NULL, 1, 0),
(1947, 141, 'Food Truck Parts &amp; Accessories', 'https://www.ebay.com/b/Food-Truck-Parts-Accessories/183952/bn_16564327', NULL, NULL, 1, 0),
(1948, 141, 'Cleaners &amp; Disinfectants', 'https://www.ebay.com/b/Cleaners-Disinfectants/183869/bn_78213236', NULL, NULL, 1, 0),
(1949, 141, 'Manual Cleaning Equipment', 'https://www.ebay.com/b/Manual-Cleaning-Equipment/183935/bn_78213020', NULL, NULL, 1, 0),
(1950, 141, 'Laundry Carts, Bags &amp; Cleaners', 'https://www.ebay.com/b/Laundry-Carts-Bags-Cleaners/184297/bn_78213381', NULL, NULL, 1, 0),
(1951, 141, 'Janitorial &amp; Housekeeping Carts', 'https://www.ebay.com/b/Janitorial-Housekeeping-Carts/184306/bn_78213470', NULL, NULL, 1, 0),
(1952, 141, 'Sanitation Steam Cleaners', 'https://www.ebay.com/b/Sanitation-Steam-Cleaners/184308/bn_78214612', NULL, NULL, 1, 0),
(1953, 141, 'Extractors &amp; Steam Cleaners', 'https://www.ebay.com/b/Extractors-Steam-Cleaners/184327/bn_78213056', NULL, NULL, 1, 0),
(1954, 141, 'Floor &amp; Carpet Sweepers', 'https://www.ebay.com/b/Floor-Carpet-Sweepers/183754/bn_78213452', NULL, NULL, 1, 0),
(1955, 141, 'Corded Scrubbers, Buffers &amp; Polishers', 'https://www.ebay.com/b/Corded-Scrubbers-Buffers-Polishers/46535/bn_16562642', NULL, NULL, 1, 0),
(1956, 141, 'Blowers, Air Movers &amp; Dryers', 'https://www.ebay.com/b/Blowers-Air-Movers-Dryers/109459/bn_16562239', NULL, NULL, 1, 0),
(1957, 141, 'Vacuum Cleaners, Parts &amp; Accessories', 'https://www.ebay.com/b/Vacuum-Cleaners-Parts-Accessories/184313/bn_78213080', NULL, NULL, 1, 0),
(1958, 141, ' Refrigeration Equipment and Accessories', 'https://www.ebay.com/b/Industrial-Refrigerant/183973/bn_78213235', NULL, NULL, 1, 0),
(1959, 141, 'Industrial Blowers and Accessories', 'https://www.ebay.com/b/Industrial-HVAC-Fans-Blowers/53297/bn_16563135', NULL, NULL, 1, 0),
(1960, 141, 'Industrial Central Air Conditioning Units', 'https://www.ebay.com/b/Industrial-Central-Air-Conditioning-Units/183953/bn_78213170', NULL, NULL, 1, 0),
(1961, 141, 'Industrial HVAC Gauges', 'https://www.ebay.com/b/Industrial-HVAC-Gauges/66998/bn_16563136', NULL, NULL, 1, 0),
(1962, 141, 'Industrial HVAC Thermostats', 'https://www.ebay.com/b/Industrial-HVAC-Thermostats/53302/bn_16563145', NULL, NULL, 1, 0),
(1963, 141, 'Tractors', 'https://www.ebay.com/b/Tractors/91953/bn_1511512', NULL, NULL, 1, 0),
(1964, 141, 'Forestry Equipment', 'https://www.ebay.com/b/Forestry-Equipment-Supplies/61787/bn_2310527', NULL, NULL, 1, 0),
(1965, 141, 'Livestock Supplies', 'https://www.ebay.com/b/Livestock-Supplies/46526/bn_2310764', NULL, NULL, 1, 0),
(1966, 141, 'Poultry Supplies', 'https://www.ebay.com/b/Poultry-Supplies/46532/bn_16565486', NULL, NULL, 1, 0),
(1967, 141, 'GPS &amp; Guidance Equipment', 'https://www.ebay.com/b/Agriculture-Forestry-GPS-and-Guidance-Equipment/159685/bn_2313319', NULL, NULL, 1, 0),
(1968, 142, 'Electric Guitars', 'https://www.ebay.com/b/Electric-Guitars/33034/bn_2312182', NULL, NULL, 1, 0),
(1969, 142, 'Acoustic Guitars', 'https://www.ebay.com/b/Acoustic-Guitars/33021/bn_2311663', NULL, NULL, 1, 0),
(1970, 142, 'Bass Guitars', 'https://www.ebay.com/b/Bass-Guitars/4713/bn_2313818', NULL, NULL, 1, 0),
(1971, 142, 'Classical Guitars', 'https://www.ebay.com/b/Classical-Guitars/119544/bn_2309659', NULL, NULL, 1, 0),
(1972, 142, 'Vintage Guitars &amp; Basses', 'https://www.ebay.com/b/Vintage-Guitars-Basses/181163/bn_7203726', NULL, NULL, 1, 0),
(1973, 142, 'Guitar Amplifiers', 'https://www.ebay.com/b/Guitar-Amplifiers/38072/bn_2309763', NULL, NULL, 1, 0),
(1974, 142, 'Guitar Effects Pedals', 'https://www.ebay.com/b/Guitar-Effects-Pedals/181222/bn_7439940', NULL, NULL, 1, 0),
(1975, 142, 'Guitar Packages for Beginners', 'https://www.ebay.com/b/Guitar-Packages-for-Beginners/84659/bn_2312351', NULL, NULL, 1, 0),
(1976, 142, 'Bass Guitar Amplifiers', 'https://www.ebay.com/b/Bass-Guitar-Amplifiers/38072/bn_7527815', NULL, NULL, 1, 0),
(1977, 142, 'Guitar Building &amp; Luthier Supplies', 'https://www.ebay.com/b/Guitar-Building-Luthier-Supplies/47067/bn_2312001', NULL, NULL, 1, 0),
(1978, 142, 'Speakers &amp; Monitors', 'https://www.ebay.com/b/Pro-Audio-Speakers-Monitors/47091/bn_2310786', NULL, NULL, 1, 0),
(1979, 142, 'Microphones &amp; Wireless Systems', 'https://www.ebay.com/b/Pro-Audio-Microphones-Wireless-Systems/29946/bn_2312970', NULL, NULL, 1, 0),
(1980, 142, 'Amplifiers', 'https://www.ebay.com/b/Pro-Audio-Amplifiers/163896/bn_2311649', NULL, NULL, 1, 0),
(1981, 142, 'Cables, Snakes &amp; Interconnects', 'https://www.ebay.com/b/Pro-Audio-Cables-Snakes-Interconnects/41459/bn_2313574', NULL, NULL, 1, 0),
(1982, 142, 'Audio/MIDI Interfaces', 'https://www.ebay.com/b/Audio-MIDI-Interfaces/123445/bn_2312089', NULL, NULL, 1, 0),
(1983, 142, 'Live &amp; Studio Mixers', 'https://www.ebay.com/b/Live-Studio-Mixers/4785/bn_2310888', NULL, NULL, 1, 0),
(1984, 142, 'DJ Headphones', 'https://www.ebay.com/b/DJ-Monitoring-Headphones/14985/bn_2313770', NULL, NULL, 1, 0),
(1985, 142, 'DJ Mixers', 'https://www.ebay.com/b/DJ-Mixers/19699/bn_2311393', NULL, NULL, 1, 0),
(1986, 142, 'DJ Controllers', 'https://www.ebay.com/b/DJ-Controllers/182111/bn_2313749', NULL, NULL, 1, 0),
(1987, 142, 'DJ Equipment Packages', 'https://www.ebay.com/b/DJ-Equipment-Packages/157158/bn_2311486', NULL, NULL, 1, 0),
(1988, 142, 'DJ Equipment', 'https://www.ebay.com/b/DJ-Equipment/48458/bn_16562590', NULL, NULL, 1, 0),
(1989, 142, 'Pianos & Keyboards', 'https://www.ebay.com/b/Pianos-Keyboards-Organs/180010/bn_1865100', NULL, NULL, 1, 0),
(1990, 142, 'Percussion', 'https://www.ebay.com/b/Percussion-Instruments/180012/bn_1853035', NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `third_level_categories`
--

CREATE TABLE `third_level_categories` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `category` varchar(60) NOT NULL,
  `url` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `third_level_categories`
--

INSERT INTO `third_level_categories` (`id`, `category_id`, `category`, `url`) VALUES
(17, 134, 'Aircraft', 'https://www.ebay.com/sch/Aircraft/63676/bn_16581754/i.html?_fsrp=1'),
(18, 134, 'Boats', 'https://www.ebay.com/sch/Boats/26429/bn_1865510/i.html?_fsrp=1'),
(19, 134, 'RVs &amp; Campers', 'https://www.ebay.com/sch/RVs-Campers/50054/bn_16581882/i.html?_fsrp=1'),
(20, 134, 'Commercial Trucks', 'https://www.ebay.com/sch/Commercial-Trucks/63732/bn_16581784/i.html?_fsrp=1'),
(21, 134, 'Other Vehicles, Trailers', 'https://www.ebay.com/sch/Other-Vehicles-Trailers/6737/bn_16581863/i.html?_fsrp=1'),
(22, 134, 'Custom', 'https://www.ebay.com/b/Custom-Built-Motorcycles/147899/bn_50574829'),
(23, 134, 'ATVs', 'https://www.ebay.com/b/ATVs/6723/bn_16581818'),
(24, 134, 'UTVs', 'https://www.ebay.com/b/UTVs/173665/bn_16582079'),
(25, 134, 'Dune Buggies &amp; Sand Rails', 'https://www.ebay.com/b/Dune-Buggies-Sand-Rails/133220/bn_16581800'),
(26, 134, 'Snowmobiles', 'https://www.ebay.com/b/Snowmobiles/42595/bn_16582086'),
(27, 134, 'Personal Watercraft', 'https://www.ebay.com/b/Personal-Watercraft/1295/bn_16581866'),
(28, 134, 'Boat &amp; Watercraft Trailers', 'https://www.ebay.com/b/Boat-Watercraft-Trailers/66469/bn_16581767'),
(29, 134, 'Car Trailers', 'https://www.ebay.com/b/Car-Trailers/80769/bn_16581775'),
(30, 134, 'Cargo &amp; Utility Trailers', 'https://www.ebay.com/b/Cargo-Utility-Trailers/80770/bn_16581776'),
(31, 134, 'Other Vehicle Trailers', 'https://www.ebay.com/b/Other-Vehicle-Trailers/66470/bn_16581862'),
(32, 134, 'Motorcycle Trailers', 'https://www.ebay.com/b/Motorcycle-Trailers/80768/bn_16581828'),
(40, 135, 'T-Shirts', 'http://www.ebay.com/b/T-Shirts/undefined/bn_661857'),
(41, 135, 'Yeezy', 'http://www.ebay.com/b/Yeezy/undefined/bn_8492741'),
(42, 135, 'Coach', 'http://www.ebay.com/b/Coach/undefined/bn_715424'),
(43, 135, 'Rebecca Minkoff', 'http://www.ebay.com/b/Rebecca-Minkoff/undefined/bn_737257'),
(44, 135, 'Tory Burch', 'http://www.ebay.com/b/Tory-Burch/undefined/bn_750180'),
(45, 135, 'Vera Bradley', 'http://www.ebay.com/b/Vera-Bradley/undefined/bn_734519'),
(46, 135, 'Furla', 'http://www.ebay.com/b/Furla/undefined/bn_722527'),
(48, 138, 'Patio Chairs', 'http://www.ebay.com/b/Patio-Chairs/undefined/bn_7772432');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `market_product_match`
--
ALTER TABLE `market_product_match`
  ADD PRIMARY KEY (`id`),
  ADD KEY `market_site_id` (`market_site_id`);

--
-- Indexes for table `market_sites`
--
ALTER TABLE `market_sites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `product_sold_links`
--
ALTER TABLE `product_sold_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_category_id` (`sub_category_id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `third_level_categories`
--
ALTER TABLE `third_level_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;
--
-- AUTO_INCREMENT for table `market_product_match`
--
ALTER TABLE `market_product_match`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `market_sites`
--
ALTER TABLE `market_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `product_sold_links`
--
ALTER TABLE `product_sold_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=860;
--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1991;
--
-- AUTO_INCREMENT for table `third_level_categories`
--
ALTER TABLE `third_level_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `market_product_match`
--
ALTER TABLE `market_product_match`
  ADD CONSTRAINT `market_product_match_ibfk_1` FOREIGN KEY (`market_site_id`) REFERENCES `market_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
