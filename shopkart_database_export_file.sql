-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2022 at 03:36 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopkartdb2021`
--

-- --------------------------------------------------------

--
-- Table structure for table `adminpannel_products`
--

CREATE TABLE `adminpannel_products` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `product_description` varchar(1000) NOT NULL,
  `product_picture` varchar(100) NOT NULL,
  `is_active` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adminpannel_products`
--

INSERT INTO `adminpannel_products` (`id`, `product_name`, `price`, `product_description`, `product_picture`, `is_active`) VALUES
(22, 'dddrw', 100, 'ddddddddddddr', 'p_Y4NL36f.jpg', 1),
(23, 'ss', 100, 'ssss', '', 0),
(25, 'njhgmbj', 690, 'nnnnnnnnnn', 'nuts_bfjIIii.jpg', 1),
(26, 'aaaaaa', 900, 'sssssssss', 'p_WeClRGb.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authtoken_token`
--

INSERT INTO `authtoken_token` (`key`, `created`, `user_id`) VALUES
('1bbd62da52dee9c7c9c50262c7e808233c9ae3da', '2022-01-02 10:18:30.543550', 7),
('a5e320a0f6050ea778065cb0f355c80c59b0a8ba', '2022-01-05 09:51:47.479859', 10),
('d809a1db3cd498641f8221d631e4099e2830dae8', '2022-01-02 10:58:52.689484', 9);

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add products', 7, 'add_products'),
(26, 'Can change products', 7, 'change_products'),
(27, 'Can delete products', 7, 'delete_products'),
(28, 'Can view products', 7, 'view_products'),
(29, 'Can add products', 8, 'add_products'),
(30, 'Can change products', 8, 'change_products'),
(31, 'Can delete products', 8, 'delete_products'),
(32, 'Can view products', 8, 'view_products'),
(33, 'Can add customer cart', 9, 'add_customercart'),
(34, 'Can change customer cart', 9, 'change_customercart'),
(35, 'Can delete customer cart', 9, 'delete_customercart'),
(36, 'Can view customer cart', 9, 'view_customercart'),
(37, 'Can add customer checkout', 10, 'add_customercheckout'),
(38, 'Can change customer checkout', 10, 'change_customercheckout'),
(39, 'Can delete customer checkout', 10, 'delete_customercheckout'),
(40, 'Can view customer checkout', 10, 'view_customercheckout'),
(41, 'Can add customer payed products', 11, 'add_customerpayedproducts'),
(42, 'Can change customer payed products', 11, 'change_customerpayedproducts'),
(43, 'Can delete customer payed products', 11, 'delete_customerpayedproducts'),
(44, 'Can view customer payed products', 11, 'view_customerpayedproducts'),
(45, 'Can add p', 12, 'add_p'),
(46, 'Can change p', 12, 'change_p'),
(47, 'Can delete p', 12, 'delete_p'),
(48, 'Can view p', 12, 'view_p'),
(49, 'Can add Token', 13, 'add_token'),
(50, 'Can change Token', 13, 'change_token'),
(51, 'Can delete Token', 13, 'delete_token'),
(52, 'Can view Token', 13, 'view_token'),
(53, 'Can add token', 14, 'add_tokenproxy'),
(54, 'Can change token', 14, 'change_tokenproxy'),
(55, 'Can delete token', 14, 'delete_tokenproxy'),
(56, 'Can view token', 14, 'view_tokenproxy');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(2, 'pbkdf2_sha256$320000$FBdTHtpDZ8Wte8Utzm8cr6$Nwu3PSs0moqnO+u0rpzzJ/oPDdi1sVHBwZk6JFhqK48=', '2022-01-05 06:46:34.093238', 1, 'shopkartadmin', '', '', 'shopkart@admin.com', 1, 1, '2021-12-17 09:44:07.063943'),
(7, 'pbkdf2_sha256$320000$hfinfAOgVPoPAt84MMsP9e$1/YijQy8NbqRLV2fGjQL9K41YwfpI+i0dF+mgeVdTX4=', '2022-01-05 07:08:18.477777', 0, 'chippy', 'chippy', 'c', 'chippy@gmail.com', 0, 1, '2021-12-22 05:27:14.968507'),
(8, 'pbkdf2_sha256$320000$VTjbF3Ss3RKXC7zX9g0dps$Mh4Dyuy9kcVztw4lBhKws3a9EB7KMVWldW9jAL2O/hE=', '2021-12-23 18:58:09.028927', 0, 'ammu', 'ammu', 'ammu', 'ammu@gmail.com', 0, 1, '2021-12-23 18:57:59.562202'),
(9, 'pbkdf2_sha256$320000$FdVWYdjMQHIaTdbvZizVXL$JOFf3gUmPSwIsctyNS79qUXVKI8tvOzvmmWydwUhBC8=', '2021-12-29 10:30:11.467212', 0, 'devu', 'devu', 'devu', 'devu@d.com', 0, 1, '2021-12-23 19:09:25.241716'),
(10, 'pbkdf2_sha256$320000$ujQLOoTXQIqC9hYZ7qv25n$fVLLOtI3T9TYau2a1BuD+awYQqDNe/2MTgGFOTRSXkk=', NULL, 0, 'ashu', 'ash', 'ash', 'ashu@gmail.com', 0, 1, '2022-01-05 09:48:33.683170'),
(11, 'pbkdf2_sha256$320000$n0f2w6W5FYufWZleMVaNhv$ZocOPdB9qLuuQM9g+Fjil53OLOSHXmX8XHOP3/LY8Ms=', NULL, 0, 'sree', 'sree', 'sree', 'sree@gmail.com', 0, 1, '2022-01-05 14:24:35.674961');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_customercart`
--

CREATE TABLE `customer_customercart` (
  `id` bigint(20) NOT NULL,
  `addedon` datetime(6) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_customercart`
--

INSERT INTO `customer_customercart` (`id`, `addedon`, `customer_id`, `product_id`) VALUES
(27, '2021-12-23 18:41:49.584672', 6, 25),
(43, '2021-12-23 19:06:21.744651', 8, 22),
(44, '2021-12-23 19:06:22.801521', 8, 25);

-- --------------------------------------------------------

--
-- Table structure for table `customer_customercheckout`
--

CREATE TABLE `customer_customercheckout` (
  `id` bigint(20) NOT NULL,
  `order_id` varchar(200) NOT NULL,
  `payment_id` varchar(200) DEFAULT NULL,
  `total_amount` double NOT NULL,
  `payment_signature` varchar(200) DEFAULT NULL,
  `reciept_num` varchar(200) NOT NULL,
  `delivery_address` varchar(2000) NOT NULL,
  `delivery_phone` varchar(20) NOT NULL,
  `payment_complete` int(11) NOT NULL,
  `payedon` datetime(6) NOT NULL,
  `customer_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_customercheckout`
--

INSERT INTO `customer_customercheckout` (`id`, `order_id`, `payment_id`, `total_amount`, `payment_signature`, `reciept_num`, `delivery_address`, `delivery_phone`, `payment_complete`, `payedon`, `customer_id`) VALUES
(1, 'order_Id0UZLQiB7uwRh', '1', 1380, NULL, '9480cd5a-6812-11ec-b944-3468953825bc', 'nnnnnnnnnnnnn', '123455555', 1, '2021-12-28 19:15:57.208632', 7),
(2, 'order_Id0WTgLmPFOAbl', NULL, 1380, NULL, 'd5dd9c80-6812-11ec-8e24-3468953825bc', 'nnnnnnnnnnnnn', '123455555', 0, '2021-12-28 19:17:45.622885', 7),
(3, 'order_Id0ZEckmlt1AXy', NULL, 690, NULL, '3340f9dd-6813-11ec-bd31-3468953825bc', 'mmmmmm', '11111', 0, '2021-12-28 19:20:22.204140', 7),
(4, 'order_IdAKHSgQ2953bY', NULL, 690, NULL, '3625cf60-6863-11ec-a95f-3468953825bc', 'ccccccccccc', '22222222', 0, '2021-12-29 04:53:09.010332', 7),
(5, 'order_IdAOYAVZ7njO8i', NULL, 690, NULL, 'c7d75e2c-6863-11ec-95d9-3468953825bc', 'mmm', '787878787', 0, '2021-12-29 04:57:11.467474', 7),
(6, 'order_IdAOqdxLqkM5N9', NULL, 690, NULL, 'd203eb80-6863-11ec-a639-3468953825bc', 'mmmmm', '232322323', 0, '2021-12-29 04:57:28.408654', 7),
(7, 'order_IdAVwB7n3k2SYc', NULL, 690, NULL, 'c1f737b8-6864-11ec-865b-3468953825bc', 'nnnnnnnnnnnnnnnnnnnn', '323232323', 0, '2021-12-29 05:04:11.066599', 7),
(8, 'order_IdAharCvrpgIyB', NULL, 1590, NULL, '4cb7adb6-6866-11ec-8c56-3468953825bc', 'hsgf', '431887576', 0, '2021-12-29 05:15:13.166227', 7),
(9, 'order_IdAttL5OOx8k8P', NULL, 1590, NULL, 'eceda3ff-6867-11ec-9483-3468953825bc', 'eeeee', '1212121121', 0, '2021-12-29 05:26:51.636053', 7),
(10, 'order_IdBafv90wmyIO0', NULL, 1590, NULL, '955d6c6c-686d-11ec-828c-3468953825bc', 'rrr', '12334333', 0, '2021-12-29 06:07:21.725510', 7),
(11, 'order_IdBobvl86eCjSk', NULL, 1590, NULL, '6d43e0a1-686f-11ec-b3f3-3468953825bc', 'mnnnnn', '454545454', 0, '2021-12-29 06:20:33.266677', 7),
(12, 'order_IdBvlP7npA01Zu', NULL, 1590, NULL, '5f641ea5-6870-11ec-9771-3468953825bc', 'weewew', '444444444', 0, '2021-12-29 06:27:19.534609', 7),
(13, 'order_IdG3UO8YWR7sZO', NULL, 1590, NULL, '30f50333-6892-11ec-adc6-3468953825bc', 'weewew', '444444444', 0, '2021-12-29 10:29:24.592074', 7),
(14, 'order_IdGN42nOcU9OnN', NULL, 1590, NULL, 'c7c96a4b-6894-11ec-8fdf-3468953825bc', 'oioioi', '23848487545', 0, '2021-12-29 10:47:56.427763', 7),
(15, 'order_Idk9uwlTB9VXYv', NULL, 1590, NULL, '057ed1c8-6989-11ec-a119-3468953825bc', 'wewewewe', '111111113', 0, '2021-12-30 15:56:17.882572', 7);

-- --------------------------------------------------------

--
-- Table structure for table `customer_customerpayedproducts`
--

CREATE TABLE `customer_customerpayedproducts` (
  `id` bigint(20) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `product_description` varchar(1000) NOT NULL,
  `checkout_details_id` bigint(20) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_customerpayedproducts`
--

INSERT INTO `customer_customerpayedproducts` (`id`, `product_name`, `price`, `product_description`, `checkout_details_id`, `customer_id`) VALUES
(1, 'njhgmbj', 690, 'nnnnnnnnnn', 1, 7),
(2, 'njhgmbj', 690, 'nnnnnnnnnn', 1, 7),
(3, 'njhgmbj', 690, 'nnnnnnnnnn', 2, 7),
(4, 'njhgmbj', 690, 'nnnnnnnnnn', 2, 7),
(5, 'njhgmbj', 690, 'nnnnnnnnnn', 3, 7),
(6, 'njhgmbj', 690, 'nnnnnnnnnn', 4, 7),
(7, 'njhgmbj', 690, 'nnnnnnnnnn', 5, 7),
(8, 'njhgmbj', 690, 'nnnnnnnnnn', 6, 7),
(9, 'njhgmbj', 690, 'nnnnnnnnnn', 7, 7),
(10, 'njhgmbj', 690, 'nnnnnnnnnn', 8, 7),
(11, 'aaaaaa', 900, 'sssssssss', 8, 7),
(12, 'njhgmbj', 690, 'nnnnnnnnnn', 9, 7),
(13, 'aaaaaa', 900, 'sssssssss', 9, 7),
(14, 'njhgmbj', 690, 'nnnnnnnnnn', 10, 7),
(15, 'aaaaaa', 900, 'sssssssss', 10, 7),
(16, 'njhgmbj', 690, 'nnnnnnnnnn', 11, 7),
(17, 'aaaaaa', 900, 'sssssssss', 11, 7),
(18, 'njhgmbj', 690, 'nnnnnnnnnn', 12, 7),
(19, 'aaaaaa', 900, 'sssssssss', 12, 7),
(20, 'njhgmbj', 690, 'nnnnnnnnnn', 13, 7),
(21, 'aaaaaa', 900, 'sssssssss', 13, 7),
(22, 'njhgmbj', 690, 'nnnnnnnnnn', 14, 7),
(23, 'aaaaaa', 900, 'sssssssss', 14, 7),
(24, 'njhgmbj', 690, 'nnnnnnnnnn', 15, 7),
(25, 'aaaaaa', 900, 'sssssssss', 15, 7);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(7, 'adminpannel', 'products'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(13, 'authtoken', 'token'),
(14, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(9, 'customer', 'customercart'),
(10, 'customer', 'customercheckout'),
(11, 'customer', 'customerpayedproducts'),
(12, 'customer', 'p'),
(8, 'customer', 'products'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-12-15 17:22:50.809193'),
(2, 'auth', '0001_initial', '2021-12-15 17:23:07.340653'),
(3, 'admin', '0001_initial', '2021-12-15 17:23:09.563203'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-12-15 17:23:09.625705'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-12-15 17:23:09.688209'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-12-15 17:23:12.235121'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-12-15 17:23:12.797620'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-12-15 17:23:13.500812'),
(9, 'auth', '0004_alter_user_username_opts', '2021-12-15 17:23:13.547635'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-12-15 17:23:14.016442'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-12-15 17:23:14.063263'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-12-15 17:23:14.110141'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-12-15 17:23:14.735201'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-12-15 17:23:15.282086'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-12-15 17:23:16.157095'),
(16, 'auth', '0011_update_proxy_permissions', '2021-12-15 17:23:16.219559'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-12-15 17:23:16.797727'),
(18, 'sessions', '0001_initial', '2021-12-15 17:23:17.844559'),
(19, 'adminpannel', '0001_initial', '2021-12-17 15:17:08.900176'),
(20, 'customer', '0001_initial', '2021-12-22 06:33:47.409523'),
(21, 'customer', '0002_customercart_customercheckout_customerpayedproducts_and_more', '2021-12-28 12:27:10.956756'),
(22, 'customer', '0003_p', '2021-12-28 17:29:02.019226'),
(23, 'customer', '0002_customercart_delete_products', '2021-12-28 18:48:16.442734'),
(24, 'customer', '0003_customercheckout', '2021-12-28 18:48:16.546758'),
(25, 'customer', '0003_customercheckout_customerpayedproducts', '2021-12-28 18:53:36.341567'),
(26, 'authtoken', '0001_initial', '2022-01-01 11:12:32.978924'),
(27, 'authtoken', '0002_auto_20160226_1747', '2022-01-01 11:12:33.166426'),
(28, 'authtoken', '0003_tokenproxy', '2022-01-01 11:12:33.213300');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2jn1da1ck23vxip8p0htyb5pbl2cwfvx', '.eJxVjDsOwyAQBe9CHSGM-aZM7zOgXRaCkwgkY1dR7h5bcpG0b2bemwXY1hK2npYwE7syzS6_G0J8pnoAekC9Nx5bXZcZ-aHwk3Y-NUqv2-n-HRToZa-N1zpmPXo9WvQIZkDKSalESTihLEorMRINjqJwpKUhAQLtHsksMbPPF-7hOJM:1mzlMy:XRLeOlIM39e1nV-rFa3CtLf-9Flo93y4YDEeauelrA4', '2022-01-04 20:04:20.230968'),
('38uli6nfjnmok611sjf0ljjz92xmr25q', '.eJxVjDsOwjAQBe_iGlnOxl9K-pzB2vUHB5AtxUmFuDuJlALaNzPvzTxua_FbT4ufI7syYJffjTA8Uz1AfGC9Nx5aXZeZ-KHwk3Y-tZhet9P9OyjYy14bsGNwVpoxOptoAJRGgyAlkowqZGd2mDIJAdrlIAaCrACkHiUKQM0-X8CUNuQ:1mzlMw:e0N4z8YnD4TeBmBtn0atancz_iieJs0Dw_rcFx0a9yg', '2022-01-04 20:04:18.774831'),
('oqx72jcsimfhwgl9y74r4g3uf254h9op', 'e30:1mzlFj:AzpZHnLQ1mprCULEGO1yye0w5iv8lUjwc4zK-M0uMPw', '2022-01-04 19:56:51.794190'),
('qw9bw4fm8otghsxptub5p8tkozwnxijx', '.eJxVjDkOwjAUBe_iGlk43inpOYP1N3AAOVKcVIi7Q6QU0L6ZeS9VYF1qWbvMZWR1UlEdfjcEekjbAN-h3SZNU1vmEfWm6J12fZlYnufd_Tuo0Ou3vqKB4MhYk2PAkAJF4sQRnJUshAhmcMmC4aMXJ4ze5yGJY0poxGf1_gD20Thu:1n50PC:eCCQtHEHCRtefHJ5reSCa1IidNAsCZwPChOfQg2uuaY', '2022-01-19 07:08:18.531819'),
('tml797dgp3uib1g8mi48k4m6hrmh29g0', 'e30:1mzlGJ:ROhRe6LiaoVUzAsTSuqIT0HROzBkp0oB0W12nF0kHsI', '2022-01-04 19:57:27.436058'),
('ystia4ohg1fr1v4zggzw1ejqknns7tvy', '.eJxVjDsOwjAQBe_iGlnOxl9K-pzB2vUHB5AtxUmFuDuJlALaNzPvzTxua_FbT4ufI7syYJffjTA8Uz1AfGC9Nx5aXZeZ-KHwk3Y-tZhet9P9OyjYy14bsGNwVpoxOptoAJRGgyAlkowqZGd2mDIJAdrlIAaCrACkHiUKQM0-X8CUNuQ:1mzlMx:P-tJK9H9Fv5cSR7JcRpuMRI1iup-0UITuBHN1eY138o', '2022-01-04 20:04:19.841590'),
('z08wc643z0pdgzjr20wbzuyikicu0f0i', '.eJxVjDsOwjAQBe_iGlngrGNDSc8ZrP2ZBJAtxUmFuDuJlALamXnvbRIu85CWplMaxVxMbw6_jJCfWjYhDyz3armWeRrJbondbbO3Kvq67u3fwYBtWNcnFNUcjl7Z5SxIPkAMTvoYlDskASD20pGLzCsVyA4YOqKMfYCz-XwBJcA5XQ:1n07NW:uoTkHP2pp8372CQlb9_aVZwQ3WAlyv8qp3IfLuIJnlQ', '2022-01-05 19:34:22.683168');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adminpannel_products`
--
ALTER TABLE `adminpannel_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `customer_customercart`
--
ALTER TABLE `customer_customercart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_customercheckout`
--
ALTER TABLE `customer_customercheckout`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_customercheckout_customer_id_168dce3f_fk_auth_user_id` (`customer_id`);

--
-- Indexes for table `customer_customerpayedproducts`
--
ALTER TABLE `customer_customerpayedproducts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_customerpay_checkout_details_id_3457ac62_fk_customer_` (`checkout_details_id`),
  ADD KEY `customer_customerpay_customer_id_8287a04e_fk_auth_user` (`customer_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adminpannel_products`
--
ALTER TABLE `adminpannel_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;
--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `customer_customercart`
--
ALTER TABLE `customer_customercart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;
--
-- AUTO_INCREMENT for table `customer_customercheckout`
--
ALTER TABLE `customer_customercheckout`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `customer_customerpayedproducts`
--
ALTER TABLE `customer_customerpayedproducts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `customer_customercheckout`
--
ALTER TABLE `customer_customercheckout`
  ADD CONSTRAINT `customer_customercheckout_customer_id_168dce3f_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `customer_customerpayedproducts`
--
ALTER TABLE `customer_customerpayedproducts`
  ADD CONSTRAINT `customer_customerpay_checkout_details_id_3457ac62_fk_customer_` FOREIGN KEY (`checkout_details_id`) REFERENCES `customer_customercheckout` (`id`),
  ADD CONSTRAINT `customer_customerpay_customer_id_8287a04e_fk_auth_user` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
