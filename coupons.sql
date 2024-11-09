-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2024 at 09:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coupons`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `brand_name`, `created_on`, `created_by`) VALUES
(1, 'Net Play', '2024-11-06 04:15:17', 1),
(2, 'Jhon Players', '2024-11-06 04:15:20', 1),
(3, 'Puma', '2024-11-06 04:15:56', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `created_on`, `created_by`) VALUES
(1, 'shirts', '2024-11-05 13:49:59', 1),
(2, 'shoes', '2024-11-05 13:50:54', 1),
(3, 't-shirts', '2024-11-05 13:50:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_id` varchar(255) NOT NULL,
  `coupon_type` enum('percentage','flat') NOT NULL,
  `coupon_value` bigint(20) NOT NULL,
  `minimum_price` bigint(20) NOT NULL,
  `coupon_count` int(11) NOT NULL,
  `coupon_used_count` int(11) NOT NULL,
  `coupon_specified` varchar(255) NOT NULL,
  `in_category` text NOT NULL,
  `not_category` text NOT NULL,
  `in_brand` text NOT NULL,
  `not_brand` text NOT NULL,
  `in_product` text NOT NULL,
  `not_product` text NOT NULL,
  `coupon_duration` date NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `coupon_name`, `coupon_id`, `coupon_type`, `coupon_value`, `minimum_price`, `coupon_count`, `coupon_used_count`, `coupon_specified`, `in_category`, `not_category`, `in_brand`, `not_brand`, `in_product`, `not_product`, `coupon_duration`, `created_on`, `created_by`) VALUES
(7, '500 off on all', 'Flat500', 'flat', 500, 1999, 1, 0, '', '', '', '', '', '', '', '2024-11-13', '2024-11-07 02:45:19', 0),
(8, '500 off on shirts and t-shirts', 'Flat500S', 'flat', 500, 999, 2, 0, '', '', '[\"1\",\"3\"]', '[\"2\"]', '', '', '', '2024-11-13', '2024-11-07 04:05:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `category` int(11) NOT NULL,
  `brand` int(11) NOT NULL,
  `price` bigint(20) NOT NULL,
  `produt_description` text NOT NULL,
  `product_image` varchar(255) NOT NULL,
  `created_on` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` int(11) NOT NULL,
  `count_added` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `category`, `brand`, `price`, `produt_description`, `product_image`, `created_on`, `created_by`, `count_added`) VALUES
(1, 'Men Slim Fit Shirt', 1, 1, 699, '', '', '2024-11-06 13:54:14', 1, 1),
(2, 'Men Regular Shirt', 1, 2, 1699, '', '', '2024-11-07 03:59:08', 1, 1),
(3, 'Men checked Shirt', 1, 3, 1199, '', '', '2024-11-07 03:59:11', 1, 2),
(4, 'Black Shoes', 2, 1, 399, '', '', '2024-11-07 04:00:02', 1, 2),
(5, 'Red Shoes', 2, 2, 799, '', '', '2024-11-07 04:25:05', 1, 2),
(6, 'White Shoes', 2, 3, 999, '', '', '2024-11-07 04:01:16', 1, 3),
(7, 'Pattren T-shirt', 3, 1, 199, '', '', '2024-11-07 04:02:48', 1, 2),
(8, '3D T-shirt', 3, 2, 299, '', '', '2024-11-07 04:03:16', 1, 2),
(9, 'Multi-color T-shirt', 3, 3, 499, '', '', '2024-11-07 04:03:51', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
