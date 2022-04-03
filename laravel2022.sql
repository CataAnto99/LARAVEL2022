-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2022 at 07:16 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel2022`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Malaika Adero', '1111', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Romana', '', NULL, NULL),
(2, 'Engleza', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2012_03_26_163434_create_user_roles_table', 1),
(2, '2014_10_12_000000_create_users_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2022_03_26_162843_create_publisher_table', 1),
(7, '2022_03_26_162859_create_languages_table', 1),
(8, '2022_03_26_162910_create_authors_table', 1),
(9, '2022_03_27_162310_create_product_type_table', 1),
(10, '2022_03_28_162330_create_products_table', 1),
(11, '2022_03_29_164909_add_paid_to_products_table', 2),
(12, '2022_03_29_172738_add_paid_to_products_table', 3),
(13, '2022_03_30_162122_add_paid_to_users_table', 4),
(14, '2022_03_30_162526_create_pages_table', 5),
(15, '2022_03_30_162953_create_reviews_table', 5),
(16, '2022_03_30_170649_create_product_status_table', 6),
(17, '2022_03_30_170755_add_paid_to_products_table', 7),
(18, '2022_04_03_163050_add_paid_to_products_table', 8);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_type_id` bigint(20) UNSIGNED NOT NULL,
  `language_id` bigint(20) UNSIGNED NOT NULL,
  `author_id` bigint(20) UNSIGNED NOT NULL,
  `publisher_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `nr_pages` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED DEFAULT 1,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `image`, `product_type_id`, `language_id`, `author_id`, `publisher_id`, `created_at`, `updated_at`, `nr_pages`, `user_id`, `status_id`, `amount`) VALUES
(2, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 4, 1, 3),
(4, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(5, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 2, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(6, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(7, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 2, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(8, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(9, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 3, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(10, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 4, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(12, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(13, 'Carte 1', '<p>\r\n    <b>\r\n    A Black Woman Did That! is a celebration of strong, resilient, innovative, and inspiring women of color. Through vibrant illustrations and engaging storytelling, author Malaika Adero spotlights well-known historical figures including Ida B. Wells, Madam CJ Walker, Mae Jemison, and Shirley Chisholm, as well as contemporary stars including Stacey Abrams, Jesmyn Ward, Ava DuVernay, and Amy Sherald.\r\n    </b></p><p>Readers will recognize some names in the book, but will also be introduced to many important Black women who have changed history or who are reshaping the cultural landscape. Theyll learn</p><p>\r\n    <ul>\r\n        <li>\r\n        *how Barbara Harris became the first female bishop of the Episcopal Church\r\n        </li>\r\n<li>\r\n*how Misty Copeland became the first Black principal dancer of the American Ballet Theater\r\n\r\n</li>\r\n*how the work and inventions of Dr. Patricia Bath have saved or restored the eyesight of people around the world\r\n<li></li>\r\n<li>*how Shirley Chisolm changed the face of politics in America\r\n</li>\r\n<li>*how Glory Edim has turned her passion for reading into a thriving online community\r\n</li>\r\n<li>\r\n*and much more!\r\n\r\n</li>\r\n    </ul>\r\n</p>', '100.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-03-25 22:00:00', NULL, 300, 1, 1, 3),
(18, 'fdfs', 'fdsfds', '44.00', 'products/0nyTSxNgOzBWVubAHDXFNfhuThe1vqTM76wExAfJ.jpg', 1, 1, 1, 1, '2022-04-03 13:54:16', '2022-04-03 13:54:16', 44, 4, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_status`
--

CREATE TABLE `product_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_status`
--

INSERT INTO `product_status` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Very good', '', 1, NULL, NULL),
(2, 'Good', '', 1, NULL, NULL),
(3, 'Use ', '', 1, NULL, NULL),
(4, 'With damage', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_type`
--

CREATE TABLE `product_type` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_type`
--

INSERT INTO `product_type` (`id`, `name`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Tip 1', '', 1, NULL, NULL),
(2, 'Tip 2', '', 1, NULL, NULL),
(3, 'Tip 3', '', 1, NULL, NULL),
(4, 'Tip 4', '', 1, NULL, NULL),
(5, 'Tip 5', '', 1, NULL, NULL),
(6, 'Tip 6', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Viz Media LLC', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nr_stars` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `provider_id`, `user_id`, `description`, `nr_stars`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'Acesta este un review.', 3, '2022-03-27 16:34:42', NULL),
(2, 4, 1, 'sfsdfsdfdsfds', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role_id`, `remember_token`, `created_at`, `updated_at`, `image`) VALUES
(1, 'Catalin', 'email@gmail.com', NULL, '$2y$10$kGW7/YRPgvJXoe1rnyaBHOMaMmML5eF3fL4YEtsvFqIj9RrDutviC', NULL, NULL, '2022-03-26 15:29:38', '2022-03-26 15:29:38', 'images/vVW0V61R67ARNnz964B0IcSwA1E5KhHtOFI4H1MF.png'),
(3, 'Anonim', 'anonim', NULL, '$2y$10$kGW7/YRPgvJXoe1rnyaBHOMaMmML5eF3fL4YEtsvFqIj9RrDutviC', 1, NULL, '2022-03-08 17:33:53', NULL, 'images/WzJc10mvU9N1aYbEYbz0pd8oFIcLyurUF9xdcTJz.png'),
(4, 'Catalin', 'catalin@carti.ro', NULL, '$2y$10$HPCD0e3d3kW2uV1X.Guuaei9QVLwqVcIuaf4kMig9Yqo6oLpANDs6', NULL, 'TsJaquQYXcS5jFno1Z7fNfsjGlhjCSL75I6470aW41wuKNDf1LhJUjmEjuCZ', '2022-04-02 12:14:05', '2022-04-02 13:28:55', 'images/aEVfkhxbvrmsE1QlH4stQdhmgNxJveGwJUS15lNQ.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'User', '', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_product_type_id_foreign` (`product_type_id`),
  ADD KEY `products_language_id_foreign` (`language_id`),
  ADD KEY `products_author_id_foreign` (`author_id`),
  ADD KEY `products_publisher_id_foreign` (`publisher_id`),
  ADD KEY `products_user_id_foreign` (`user_id`),
  ADD KEY `products_status_id_foreign` (`status_id`);

--
-- Indexes for table `product_status`
--
ALTER TABLE `product_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_type`
--
ALTER TABLE `product_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_provider_id_foreign` (`provider_id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_status`
--
ALTER TABLE `product_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_type`
--
ALTER TABLE `product_type`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_author_id_foreign` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  ADD CONSTRAINT `products_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `products_product_type_id_foreign` FOREIGN KEY (`product_type_id`) REFERENCES `product_type` (`id`),
  ADD CONSTRAINT `products_publisher_id_foreign` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `products_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `product_status` (`id`),
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `user_roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
