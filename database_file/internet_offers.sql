-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2024 at 07:26 AM
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
-- Database: `internet_offers`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `permissions` varchar(255) DEFAULT NULL,
  `type` tinyint(4) DEFAULT 1 COMMENT '0= super_admin, 1 = staff user',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `username`, `email`, `password`, `phone_no`, `permissions`, `type`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', '$2y$12$3a8mjCQxD54t89r/w7STAOl3xBFdmmByfEj70DV92knLbkdNfaLU6', NULL, NULL, 0, 1, '2022-04-15 12:25:42', '2023-12-26 12:03:02');

-- --------------------------------------------------------

--
-- Table structure for table `bulk_imports`
--

CREATE TABLE `bulk_imports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `total_records` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bulk_imports`
--

INSERT INTO `bulk_imports` (`id`, `file_name`, `total_records`, `created_at`, `updated_at`) VALUES
(63, '1705480069.xlsx', NULL, '2024-01-17 03:27:49', '2024-01-17 03:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(2, '2024_01_11_122038_create_zip_locations_table', 1),
(3, '2024_01_11_132303_create_providers_table', 2),
(4, '2024_01_12_063507_create_provider_services_table', 3),
(5, '2024_01_12_092941_create_provider_packages_table', 4),
(6, '2024_01_12_111612_create_offers_table', 5),
(7, '2024_01_12_115239_add_pkg_type_to_provider_packages_table', 6),
(8, '2024_01_16_071147_create_bulk_imports_table', 7),
(9, '2024_01_16_101407_add_batch_id_field_to_zip_locations_table', 8),
(10, '2024_01_16_101630_add_batch_id_field_to_offers_table', 9),
(11, '2024_01_16_101743_add_batch_id_field_to_providers_table', 10);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zip` varchar(255) NOT NULL,
  `offer_type` tinyint(4) NOT NULL COMMENT '0=>Internet,1=>TV,2=>Bundle',
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `offer_specs` varchar(255) NOT NULL DEFAULT 'upto 0Mbps',
  `offer_points` tinytext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `zip`, `offer_type`, `provider_id`, `batch_id`, `offer_specs`, `offer_points`, `created_at`, `updated_at`) VALUES
(16480, '01001', 0, 58, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16481, '01001', 1, 58, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16482, '01001', 2, 58, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16483, '01001', 0, 59, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16484, '01001', 1, 59, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16485, '01001', 2, 59, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16486, '01002', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16487, '01002', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16488, '01002', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16489, '01002', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16490, '01002', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16491, '01002', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16492, '01005', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16493, '01005', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16494, '01005', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16495, '01005', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16496, '01005', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16497, '01005', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16498, '01007', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16499, '01007', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16500, '01007', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16501, '01007', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16502, '01007', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16503, '01007', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16504, '01010', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16505, '01010', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16506, '01010', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16507, '01010', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16508, '01010', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16509, '01010', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16510, '01010', 0, 58, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16511, '01010', 1, 58, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16512, '01010', 2, 58, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16513, '01010', 0, 59, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16514, '01010', 1, 59, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16515, '01010', 2, 59, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16516, '01012', 0, 58, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16517, '01012', 1, 58, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16518, '01012', 2, 58, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16519, '01012', 0, 59, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16520, '01012', 1, 59, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16521, '01012', 2, 59, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16522, '01013', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16523, '01013', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16524, '01013', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16525, '01013', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16526, '01013', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16527, '01013', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16528, '01020', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16529, '01020', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16530, '01020', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16531, '01020', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16532, '01020', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16533, '01020', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16534, '01022', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16535, '01022', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16536, '01022', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16537, '01022', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16538, '01022', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16539, '01022', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16540, '01027', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16541, '01027', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16542, '01027', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16543, '01027', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16544, '01027', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16545, '01027', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16546, '01028', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16547, '01028', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16548, '01028', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16549, '01028', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16550, '01028', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16551, '01028', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16552, '01035', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16553, '01035', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16554, '01035', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16555, '01035', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16556, '01035', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16557, '01035', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16558, '01036', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16559, '01036', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16560, '01036', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16561, '01036', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16562, '01036', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16563, '01036', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16564, '01038', 0, 58, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16565, '01038', 1, 58, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16566, '01038', 2, 58, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16567, '01038', 0, 59, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16568, '01038', 1, 59, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16569, '01038', 2, 59, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16570, '01331', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16571, '01331', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16572, '01331', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16573, '01331', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16574, '01331', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16575, '01331', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16576, '01355', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16577, '01355', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16578, '01355', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16579, '01355', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16580, '01355', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16581, '01355', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16582, '01364', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16583, '01364', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16584, '01364', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16585, '01364', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16586, '01364', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16587, '01364', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16588, '01366', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16589, '01366', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16590, '01366', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16591, '01366', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16592, '01366', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16593, '01366', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16594, '01368', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16595, '01368', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16596, '01368', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16597, '01368', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16598, '01368', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16599, '01368', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16600, '01450', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16601, '01450', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16602, '01450', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16603, '01450', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16604, '01450', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16605, '01450', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16606, '01451', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16607, '01451', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16608, '01451', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16609, '01452', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16610, '01452', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16611, '01452', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16612, '01452', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16613, '01452', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16614, '01452', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16615, '01463', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16616, '01463', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16617, '01463', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16618, '01463', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16619, '01463', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16620, '01463', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16621, '01469', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16622, '01469', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16623, '01469', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16624, '01469', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16625, '01469', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16626, '01469', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16627, '01473', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16628, '01473', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16629, '01473', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16630, '01473', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16631, '01473', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16632, '01473', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16633, '01501', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16634, '01501', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16635, '01501', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16636, '01501', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16637, '01501', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16638, '01501', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16639, '01503', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16640, '01503', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16641, '01503', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16642, '01503', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16643, '01503', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16644, '01503', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16645, '01504', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16646, '01504', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(16647, '01504', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16648, '01504', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16649, '01504', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16650, '01504', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16651, '01505', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16652, '01505', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16653, '01505', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16654, '01505', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16655, '01505', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16656, '01505', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16657, '01506', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16658, '01506', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16659, '01506', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16660, '01506', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16661, '01506', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16662, '01506', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16663, '01507', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16664, '01507', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16665, '01507', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16666, '01507', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16667, '01507', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16668, '01507', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16669, '01510', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16670, '01510', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16671, '01510', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16672, '01510', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16673, '01510', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16674, '01510', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16675, '01515', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16676, '01515', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16677, '01515', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04');
INSERT INTO `offers` (`id`, `zip`, `offer_type`, `provider_id`, `batch_id`, `offer_specs`, `offer_points`, `created_at`, `updated_at`) VALUES
(16678, '01515', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16679, '01515', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16680, '01515', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16681, '01516', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16682, '01516', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16683, '01516', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16684, '01518', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16685, '01518', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16686, '01518', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16687, '01518', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16688, '01518', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16689, '01518', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16690, '01519', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16691, '01519', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16692, '01519', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16693, '01519', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16694, '01519', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16695, '01519', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16696, '01520', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16697, '01520', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16698, '01520', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16699, '01521', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16700, '01521', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16701, '01521', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16702, '01521', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16703, '01521', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16704, '01521', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16705, '01522', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16706, '01522', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16707, '01522', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16708, '01522', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16709, '01522', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16710, '01522', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16711, '01524', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16712, '01524', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16713, '01524', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16714, '01524', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16715, '01524', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16716, '01524', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16717, '01527', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16718, '01527', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16719, '01527', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16720, '01527', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16721, '01527', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16722, '01527', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16723, '01529', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16724, '01529', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16725, '01529', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16726, '01529', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16727, '01529', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16728, '01529', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16729, '01531', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16730, '01531', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16731, '01531', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16732, '01531', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16733, '01531', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16734, '01531', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16735, '01532', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16736, '01532', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16737, '01532', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16738, '01532', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16739, '01532', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16740, '01532', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16741, '01534', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16742, '01534', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16743, '01534', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16744, '01534', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16745, '01534', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16746, '01534', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16747, '01535', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16748, '01535', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16749, '01535', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16750, '01535', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16751, '01535', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16752, '01535', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16753, '01536', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16754, '01536', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16755, '01536', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16756, '01536', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16757, '01536', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16758, '01536', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16759, '01537', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16760, '01537', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16761, '01537', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16762, '01537', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16763, '01537', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16764, '01537', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16765, '01540', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16766, '01540', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16767, '01540', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16768, '01541', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16769, '01541', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16770, '01541', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16771, '01541', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16772, '01541', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16773, '01541', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16774, '01542', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16775, '01542', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16776, '01542', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16777, '01542', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16778, '01542', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16779, '01542', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16780, '01543', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16781, '01543', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16782, '01543', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16783, '01543', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16784, '01543', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16785, '01543', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16786, '01545', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16787, '01545', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16788, '01545', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16789, '01545', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16790, '01545', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16791, '01545', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16792, '01550', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16793, '01550', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16794, '01550', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16795, '01550', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16796, '01550', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16797, '01550', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16798, '01560', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16799, '01560', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16800, '01560', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16801, '01560', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16802, '01560', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16803, '01560', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16804, '01562', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16805, '01562', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16806, '01562', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16807, '01562', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16808, '01562', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16809, '01562', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16810, '01566', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16811, '01566', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16812, '01566', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16813, '01566', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16814, '01566', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16815, '01566', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16816, '01568', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16817, '01568', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16818, '01568', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16819, '01568', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16820, '01568', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16821, '01568', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16822, '01569', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16823, '01569', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16824, '01569', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16825, '01569', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16826, '01569', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16827, '01569', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16828, '01570', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16829, '01570', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16830, '01570', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16831, '01570', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16832, '01570', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16833, '01570', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16834, '01571', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16835, '01571', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16836, '01571', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16837, '01571', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16838, '01571', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16839, '01571', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16840, '01581', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16841, '01581', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16842, '01581', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16843, '01581', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16844, '01581', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16845, '01581', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16846, '01583', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16847, '01583', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16848, '01583', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16849, '01583', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16850, '01583', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16851, '01583', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16852, '01585', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16853, '01585', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16854, '01585', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16855, '01585', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16856, '01585', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16857, '01585', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16858, '01588', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16859, '01588', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16860, '01588', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16861, '01588', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16862, '01588', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16863, '01588', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16864, '01590', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16865, '01590', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16866, '01590', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16867, '01590', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16868, '01590', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16869, '01590', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16870, '01602', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16871, '01602', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16872, '01602', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16873, '01602', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16874, '01602', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16875, '01602', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04');
INSERT INTO `offers` (`id`, `zip`, `offer_type`, `provider_id`, `batch_id`, `offer_specs`, `offer_points`, `created_at`, `updated_at`) VALUES
(16876, '01603', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16877, '01603', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16878, '01603', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16879, '01603', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16880, '01603', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16881, '01603', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16882, '01604', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16883, '01604', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16884, '01604', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16885, '01604', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16886, '01604', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16887, '01604', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(16888, '01605', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16889, '01605', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16890, '01605', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16891, '01605', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16892, '01605', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16893, '01605', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16894, '01606', 0, 56, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16895, '01606', 1, 56, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16896, '01606', 2, 56, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16897, '01606', 0, 57, 63, 'High Speed Internet', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16898, '01606', 1, 57, 63, 'More than 200 Channels', '[\"More than 200+ channels including FOX Business, Discovery HD, Disney Junior and more\",\"Select from a variety of local and regional channels\",\"Unlimited storage for cloud DVR\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05'),
(16899, '01606', 2, 57, 63, 'Unlimited Calls', '[\"Blazing fast speed up to 5Gig\",\"End-to-End Encrypted Calls.\",\"Secure Data Connection and streaming Options.\"]', '2024-01-17 03:28:05', '2024-01-17 03:28:05');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `providers`
--

CREATE TABLE `providers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT 'provider.png',
  `short_description` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `providers`
--

INSERT INTO `providers` (`id`, `name`, `image`, `short_description`, `phone`, `email`, `website`, `batch_id`, `created_at`, `updated_at`) VALUES
(56, 'Optimum Internet, TV and Phone Services', '1705480624.svg', 'Optimum Internet, TV and Phone Services is a leading internet service provider in the United States, providing high-speed internet, cable television, and digital phone services to residential and business customers.', '+1-234-123-9181', 'hello@optimum.com', NULL, 63, '2024-01-18 05:38:55', '2024-01-17 03:37:04'),
(57, 'HugesNet', '1705480668.png', 'HugesNet is a leading internet service provider in the United States, providing high-speed internet, cable television, and digital phone services to residential and business customers.', '+1-234-123-6125', 'hello@hughes.net', NULL, 63, '2024-01-19 05:39:05', '2024-01-17 03:37:48'),
(58, 'Viasat Internet, TV and Phone Services', '1706016194.png', 'Viasat Internet, TV and Phone Services is a leading internet service provider in the United States, providing high-speed internet, cable television, and digital phone services to residential and business customers.', '+1-234-123-9967', 'hello@viasat.com', NULL, 63, '2024-01-20 05:39:11', '2024-01-24 00:33:48'),
(59, 'Fidium Internet, TV and Phone Services', '1706074513.png', 'Fidium Internet, TV and Phone Services is a leading internet service provider in the United States, providing high-speed internet, cable television, and digital phone services to residential and business customers.', '+1-432-212-5182', 'hello@fidium.com', NULL, 63, '2024-01-22 05:39:20', '2024-01-24 00:35:13');

-- --------------------------------------------------------

--
-- Table structure for table `provider_packages`
--

CREATE TABLE `provider_packages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `service_id` bigint(20) UNSIGNED NOT NULL,
  `pkg_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=>Basic,1=>Plus,2=>Pro',
  `title` varchar(255) NOT NULL,
  `specs` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `features` tinytext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_packages`
--

INSERT INTO `provider_packages` (`id`, `provider_id`, `service_id`, `pkg_type`, `title`, `specs`, `price`, `duration`, `features`, `created_at`, `updated_at`) VALUES
(166, 56, 56, 0, 'Starter', '50 Mbps - 100 GB Data', '49.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:37:33'),
(167, 56, 56, 1, 'Pro', '100 Mbps - 200 GB Data', '64.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:37:33'),
(168, 56, 56, 2, 'Fusion', '100 Mbps - 200 GB Data', '79.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:37:33'),
(169, 57, 57, 0, 'Starter', 'High Speed Internet', '49.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(170, 57, 57, 1, 'Standard', 'High Speed Fast Internet', '69.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(171, 57, 57, 2, 'Ultra', 'Blazing Fast Internet', '99.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(172, 58, 58, 0, 'Starter', 'High Speed Internet', '49.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(173, 58, 58, 1, 'Standard', 'High Speed Fast Internet', '69.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(174, 58, 58, 2, 'Ultra', 'Blazing Fast Internet', '99.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(175, 59, 59, 0, 'Starter', 'High Speed Internet', '49.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(176, 59, 59, 1, 'Standard', 'High Speed Fast Internet', '69.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(177, 59, 59, 2, 'Ultra', 'Blazing Fast Internet', '99.99', '12 Months', '[\"Limited time $100 cashback on Prepaid Mastercard via rebate\",\"No Hard Data Limits\",\"Secure your devices, data and network for a safer web surfing\"]', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(178, 57, 60, 0, 'Starter', '225 Channels', '64.99', '12 Months', '[\"More than 420 channels including Nick, Fox Business, TNT, ESPN and much more\"]', '2024-01-23 01:05:36', '2024-01-23 01:05:36'),
(179, 57, 60, 1, 'Plus', '290 Channels', '105', '12 Months', '[\"More than 420 channels including Nick, Fox Business, TNT, ESPN and much more\"]', '2024-01-23 01:05:36', '2024-01-23 01:05:36'),
(180, 57, 60, 2, 'Fusion', '340 Channels', '125', '12 Months', '[\"More than 420 channels including Nick, Fox Business, TNT, ESPN and much more\"]', '2024-01-23 01:05:36', '2024-01-23 01:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `provider_services`
--

CREATE TABLE `provider_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `provider_services`
--

INSERT INTO `provider_services` (`id`, `provider_id`, `title`, `created_at`, `updated_at`) VALUES
(56, 56, 'Internet', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(57, 57, 'Internet', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(58, 58, 'Internet', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(59, 59, 'Internet', '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(60, 57, 'TV', '2024-01-23 01:05:36', '2024-01-23 01:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `meta_tag` varchar(255) DEFAULT NULL,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `meta_tag`, `meta_key`, `meta_value`) VALUES
(1, 'project', 'site_title', 'Intenet Offers Now'),
(2, 'project', 'short_site_title', 'ION'),
(3, 'project', 'site_logo', 'logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_no` varchar(255) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `zip` int(5) DEFAULT NULL,
  `image_name` varchar(255) DEFAULT 'user.png',
  `otp` int(4) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0=inactive or del by user, 1=active',
  `device_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_blocked` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `zip_locations`
--

CREATE TABLE `zip_locations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `zip` varchar(255) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `batch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `zip_locations`
--

INSERT INTO `zip_locations` (`id`, `zip`, `city`, `state`, `batch_id`, `created_at`, `updated_at`) VALUES
(8526, '01001', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8527, '01002', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8528, '01005', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8529, '01007', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8530, '01008', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8531, '01010', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8532, '01011', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8533, '01012', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8534, '01013', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8535, '01020', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8536, '01022', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8537, '01026', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8538, '01027', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8539, '01028', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8540, '01030', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8541, '01034', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8542, '01035', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8543, '01036', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8544, '01038', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8545, '01330', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8546, '01331', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8547, '01337', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8548, '01339', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8549, '01340', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8550, '01342', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8551, '01351', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8552, '01354', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8553, '01355', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8554, '01364', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8555, '01366', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8556, '01368', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8557, '01370', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8558, '01373', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8559, '01375', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8560, '01376', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8561, '01420', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8562, '01430', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8563, '01431', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8564, '01432', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8565, '01436', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8566, '01440', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8567, '01450', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8568, '01451', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8569, '01452', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8570, '01453', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8571, '01462', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8572, '01463', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8573, '01468', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8574, '01469', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8575, '01473', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8576, '01475', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8577, '01501', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8578, '01503', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8579, '01504', NULL, NULL, 63, '2024-01-17 03:28:03', '2024-01-17 03:28:03'),
(8580, '01505', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8581, '01506', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8582, '01507', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8583, '01510', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8584, '01515', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8585, '01516', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8586, '01518', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8587, '01519', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8588, '01520', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8589, '01521', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8590, '01522', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8591, '01523', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8592, '01524', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8593, '01527', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8594, '01529', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8595, '01531', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8596, '01532', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8597, '01534', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8598, '01535', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8599, '01536', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8600, '01537', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8601, '01540', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8602, '01541', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8603, '01542', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8604, '01543', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8605, '01545', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8606, '01550', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8607, '01560', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8608, '01562', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8609, '01564', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8610, '01566', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8611, '01568', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8612, '01569', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8613, '01570', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8614, '01571', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8615, '01581', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8616, '01583', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8617, '01585', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8618, '01588', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8619, '01590', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8620, '01602', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8621, '01603', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8622, '01604', NULL, NULL, 63, '2024-01-17 03:28:04', '2024-01-17 03:28:04'),
(8623, '01605', 'Worcester', 'Massachusetts', 63, '2024-01-17 03:28:05', '2024-01-17 04:03:08'),
(8624, '01606', 'Worcester', 'Massachusetts', 63, '2024-01-17 03:28:05', '2024-01-17 04:01:16');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bulk_imports`
--
ALTER TABLE `bulk_imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offers_zip_foreign` (`zip`),
  ADD KEY `offers_provider_id_foreign` (`provider_id`),
  ADD KEY `offers_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `providers_batch_id_foreign` (`batch_id`);

--
-- Indexes for table `provider_packages`
--
ALTER TABLE `provider_packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_packages_provider_id_foreign` (`provider_id`),
  ADD KEY `provider_packages_service_id_foreign` (`service_id`);

--
-- Indexes for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provider_services_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `zip_locations`
--
ALTER TABLE `zip_locations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `zip_locations_zip_unique` (`zip`),
  ADD KEY `zip_locations_batch_id_foreign` (`batch_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `bulk_imports`
--
ALTER TABLE `bulk_imports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16900;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `providers`
--
ALTER TABLE `providers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `provider_packages`
--
ALTER TABLE `provider_packages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=181;

--
-- AUTO_INCREMENT for table `provider_services`
--
ALTER TABLE `provider_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `zip_locations`
--
ALTER TABLE `zip_locations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8625;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `offers`
--
ALTER TABLE `offers`
  ADD CONSTRAINT `offers_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `bulk_imports` (`id`),
  ADD CONSTRAINT `offers_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `offers_zip_foreign` FOREIGN KEY (`zip`) REFERENCES `zip_locations` (`zip`) ON DELETE CASCADE;

--
-- Constraints for table `providers`
--
ALTER TABLE `providers`
  ADD CONSTRAINT `providers_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `bulk_imports` (`id`);

--
-- Constraints for table `provider_packages`
--
ALTER TABLE `provider_packages`
  ADD CONSTRAINT `provider_packages_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `provider_packages_service_id_foreign` FOREIGN KEY (`service_id`) REFERENCES `provider_services` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `provider_services`
--
ALTER TABLE `provider_services`
  ADD CONSTRAINT `provider_services_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `providers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `zip_locations`
--
ALTER TABLE `zip_locations`
  ADD CONSTRAINT `zip_locations_batch_id_foreign` FOREIGN KEY (`batch_id`) REFERENCES `bulk_imports` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
