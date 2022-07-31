-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th1 20, 2022 lúc 10:30 AM
-- Phiên bản máy phục vụ: 5.7.31
-- Phiên bản PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `webshop`
--
CREATE DATABASE IF NOT EXISTS `webshop` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `webshop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `level`, `created`) VALUES
(1, 'Goo', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 0, 2147483647),
(2, 'Mod đz', 'mod@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 2147483647);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `catalog`
--

DROP TABLE IF EXISTS `catalog`;
CREATE TABLE IF NOT EXISTS `catalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `sort_order` tinyint(4) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `catalog`
--

INSERT INTO `catalog` (`id`, `name`, `description`, `parent_id`, `sort_order`, `created`) VALUES
(1, 'Thời trang', '', 0, 1, '2017-04-22 05:35:21'),
(2, 'Bán chạy', '', 0, 2, '2017-04-22 05:35:48'),
(3, 'Khuyến mại', '', 0, 3, '2017-04-22 05:35:59'),
(4, 'Tin tức', '', 0, 4, '2017-04-22 05:36:13'),
(5, 'Giỏ hàng', '', 0, 6, '2017-04-22 05:36:49'),
(6, 'Liên hệ', '', 0, 5, '2017-04-22 05:37:02'),
(7, 'Nam', '', 1, 1, '2017-04-22 05:37:23'),
(8, 'Nữ', '', 1, 2, '2017-04-22 05:37:36'),
(10, 'Túi xách nam', 'Túi cho nam', 7, 1, '2017-04-22 09:08:19'),
(11, 'Ví da nam', 'Ví da cho nam', 7, 2, '2017-04-22 09:08:36'),
(12, 'Thắt lưng nam ', 'Thắt lưng cho nam', 7, 3, '2017-04-22 09:09:01'),
(13, 'Vali', 'Vali', 7, 4, '2017-04-22 09:09:14'),
(15, 'Túi xách nữ', 'Túi xách cho nữ', 8, 1, '2017-04-22 09:09:46'),
(16, 'Ví nữ', 'Ví cho nữ', 8, 2, '2017-04-22 09:10:10'),
(17, 'Balo', 'Balo nữ', 8, 3, '2017-04-22 09:23:39'),
(18, 'Kính mắt', 'Kính nữ', 8, 4, '2017-04-22 09:23:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_id` int(100) NOT NULL,
  `product_id` int(100) NOT NULL,
  `qty` int(100) NOT NULL DEFAULT '0',
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `transaction_id`, `product_id`, `qty`, `amount`, `status`) VALUES
(1, 3, 12, 1, '360000.00', 0),
(3, 4, 7, 1, '350000.00', 0),
(12, 9, 4, 1, '200000.00', 0),
(13, 10, 17, 1, '450000.00', 0),
(6, 5, 23, 1, '370000.00', 0),
(7, 6, 28, 1, '169000.00', 0),
(8, 6, 25, 1, '300000.00', 0),
(11, 8, 10, 1, '69000.00', 0),
(10, 7, 11, 1, '70000.00', 0),
(14, 11, 25, 1, '300000.00', 0),
(15, 12, 28, 1, '169000.00', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `catalog_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(15,2) NOT NULL DEFAULT '0.00',
  `discount` int(11) DEFAULT '0',
  `amount` int(11) DEFAULT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_list` text COLLATE utf8_unicode_ci NOT NULL,
  `view` int(11) NOT NULL DEFAULT '0',
  `buyed` int(255) NOT NULL,
  `rate_total` int(255) NOT NULL DEFAULT '4',
  `rate_count` int(255) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`id`, `catalog_id`, `name`, `content`, `price`, `discount`, `amount`, `image_link`, `image_list`, `view`, `buyed`, `rate_total`, `rate_count`, `created`) VALUES
(49, 15, 'TÚI XÁCH NỮ MIORR MT013-44', '<p>Types of bag: Bucket bag<br />\r\nKiểu t&uacute;i x&aacute;ch thời trang cổ điển, phom thu&ocirc;n tr&ograve;n, c&oacute; d&acirc;y n&uacute;t thắt ở phần nắp t&uacute;i, được kết nối với quai đeo d&agrave;i để bạn c&oacute; thể đeo ch&eacute;o.Mang d&aacute;ng vẻ lạ kỳ l&agrave; thế nhưng ở ch&uacute;ng c&oacute; những tiện &iacute;ch m&agrave; kh&ocirc;ng phải ai cũng biết.<br />\r\nKh&ocirc;ng giống như c&aacute;c mẫu t&uacute;i Bucket kh&aacute;c item thuộc nh&agrave; mốt Miorr c&aacute;ch điệu với họa tiết tr&aacute;i tim hợp kim cao cấp được đ&iacute;nh kết tr&ecirc;n bề mặt t&uacute;i tạo điểm nhấn th&uacute; vị.</p>\r\n', '800000.00', 0, 10, 'MT014.jpg', '[]', 0, 0, 4, 1, 1642669318),
(50, 15, 'TÚI XÁCH NỮ MIORR MT013-44', '<p>Types of bag: SATCHEL BAG<br />\r\nVẻ ngo&agrave;i thanh lịch, nữ t&iacute;nh c&ugrave;ng thiết kế ấn tượng với chi tiết kh&oacute;a hợp kim c&aacute;ch điệu, mặt t&uacute;i mix vải nhung tăm lạ lẫm. Bảng m&agrave;u sắc đa dạng, trẻ trung ph&ugrave; hợp với nhiều phong c&aacute;ch thời trang kh&aacute;ch nhau.</p>\r\n', '850000.00', 0, 10, 'MT013.jpg', '[]', 0, 0, 4, 1, 1642669421),
(57, 17, 'TÚI XÁCH NỮ LEBY LB232', '<p>Types of bag: BALO</p>\r\n\r\n<p>Chất liệu da PU cao cấp&nbsp;c&oacute; tuổi thọ tốt.</p>\r\n\r\n<p>Trong khi nhiều người nghĩ balo chỉ ph&ugrave; hợp với học sinh v&agrave; sinh vi&ecirc;n, n&agrave;ng c&ocirc;ng sở vẫn c&oacute; thể mang balo đến văn ph&ograve;ng m&agrave; vẫn giữ h&igrave;nh ảnh trưởng th&agrave;nh, chuy&ecirc;n nghiệp. Với những lựa chọn m&agrave;u sắc v&agrave; chất liệu ph&ugrave; hợp, balo l&agrave; m&oacute;n đồ c&oacute; t&iacute;nh ứng dụng cao, c&oacute; thể kết hợp nhịp nh&agrave;ng trong đa dạng phong c&aacute;ch.</p>\r\n', '1200000.00', 720000, 10, 'Balo-nu-Leby-LB232110.jpg', '[]', 1, 0, 4, 1, 1642670814),
(56, 16, 'VÍ NỮ LE BY FISHHOOD LB4361', '<p>V&iacute; nữ cầm tay d&aacute;ng gập<br />\r\nThiết kế tối giản,Cấu tr&uacute;c ngăn đa dạng, với nhiều ngăn lớn nhỏ kh&aacute;c nhau.<br />\r\nHứa hẹn sẽ l&agrave; người bạn đồng h&agrave;nh kh&ocirc;ng thể thiếu mỗi khi đi ra ngo&agrave;i của c&aacute;c c&ocirc; g&aacute;i.</p>\r\n', '900000.00', 450000, 10, 'LB43617355S1.jpg', '[\"LB43617355S2.jpg\"]', 0, 0, 4, 1, 1642670650),
(55, 16, 'Ví Cầm Tay Mini Bán Nguyệt', '<p>Types of bag: WRISTLET&nbsp;</p>\r\n\r\n<p>Chất liệu da Monogram canvas cao cấp, chống nước, c&oacute; tuổi thọ cao.&nbsp;</p>\r\n\r\n<p>Với thiết kế t&uacute;i đeo ch&eacute;o ph&ugrave; hợp với những c&ocirc; n&agrave;ng năng động khi đi chơi.&nbsp;Phom t&uacute;i nhỏ t&ocirc;n d&aacute;ng sẽ l&agrave; người bạn đồng h&agrave;nh theo bạn&nbsp;d&ugrave; bất cứ đ&acirc;u. D&aacute;ng t&uacute;i&nbsp; WRISTLET&nbsp;&nbsp;sẽ ph&ugrave; hợp mix với những&nbsp;bộ đồ trẻ trung năng động như quần jean, &aacute;o thun hoặc ch&acirc;n v&aacute;y x&ograve;e&nbsp;hay đầm d&agrave;i liền&nbsp;th&acirc;n cho những buổi hẹn cuối tuần.</p>\r\n', '475000.00', 0, 10, 'vi-cam-tay-mini-ban-nguyet.jpg', '[]', 0, 0, 4, 1, 1642670523),
(54, 16, 'Ví Cầm Tay Nắp Gập Caro', '<p>Types of bag: Clucth</p>\r\n\r\n<p>Chất liệu 100% da thật&nbsp;c&oacute; tuổi thọ tốt.</p>\r\n\r\n<p>Clutch c&oacute; k&iacute;ch thước vừa hay nhỏ, thường c&oacute; h&igrave;nh chữ nhật, c&oacute; quai đeo tay, được thiết kế&nbsp;gọn g&agrave;ng, chuy&ecirc;n d&ugrave;ng cho c&aacute;c sự kiện tiệc tối sau n&agrave;y ng&agrave;y c&agrave;ng trở n&ecirc;n phổ biến</p>\r\n', '795000.00', 0, 10, 'vi-cam-tay-nap-gap-caro-chi-noi.jpg', '[]', 0, 0, 4, 1, 1642670372),
(58, 17, 'BALO NỮ THỜI TRANG MIORR MT006', '<p>Balo nữ thời trang<br />\r\nTrong khi nhiều người nghĩ balo chỉ ph&ugrave; hợp với học sinh v&agrave; sinh vi&ecirc;n, n&agrave;ng c&ocirc;ng sở vẫn c&oacute; thể mang balo đến văn ph&ograve;ng m&agrave; vẫn giữ h&igrave;nh ảnh trưởng th&agrave;nh, chuy&ecirc;n nghiệp. Với những lựa chọn m&agrave;u sắc v&agrave; chất liệu ph&ugrave; hợp, balo l&agrave; m&oacute;n đồ c&oacute; t&iacute;nh ứng dụngcao, c&oacute; thể kết hợp nhịp nh&agrave;ng trong đa dạng phong c&aacute;ch.</p>\r\n', '850000.00', 680000, 10, 'Balo-nu-Miorr-MT006.jpg', '[]', 1, 0, 4, 1, 1642670915),
(59, 17, 'Balo Phối Hologram Vân Da Cá Sấu', '<p>Types of bag: BALO</p>\r\n\r\n<p>Chất liệu da c&aacute; sấu cao cấp, c&oacute; tuổi thọ tốt.</p>\r\n\r\n<p>Trong khi nhiều người nghĩ balo chỉ ph&ugrave; hợp với học sinh v&agrave; sinh vi&ecirc;n, n&agrave;ng c&ocirc;ng sở vẫn c&oacute; thể mang balo đến văn ph&ograve;ng m&agrave; vẫn giữ h&igrave;nh ảnh trưởng th&agrave;nh, chuy&ecirc;n nghiệp. Lựa chọn chất liệu da cao cấp vừa s&agrave;nh điệu vừa chống thấm nước, bền chắc để bảo vệ c&aacute;c vật dụng cần thiết. Da c&aacute; sấu cũng l&agrave; một chất vải phổ biến với những thiết kế balo c&oacute; sức chứa lớn.</p>\r\n', '925000.00', 0, 10, 'balo-phoi-hologram-van.jpg', '[]', 1, 0, 4, 1, 1642671029),
(60, 17, 'BALO NỮ LEBY LEMINO LB232095', '<p>Chất liệu : Da tổng hợp cao cấp</p>\r\n\r\n<p>K&iacute;ch thước : 20cm (d&agrave;i) x 19cm (cao) x 10cm (r&ocirc;̣ng)</p>\r\n\r\n<p>D&acirc;y đeo : Balo đeo vai</p>\r\n\r\n<p>Ngăn t&uacute;i : 01 ngăn ch&iacute;nh lớn v&agrave; 01ngăn phụ nhỏ</p>\r\n\r\n<p>Types of bag: BALO</p>\r\n\r\n<p>Trong khi nhiều người nghĩ balo chỉ ph&ugrave; hợp với học sinh v&agrave; sinh vi&ecirc;n, n&agrave;ng c&ocirc;ng sở vẫn c&oacute; thể mang balo đến văn ph&ograve;ng m&agrave; vẫn giữ h&igrave;nh ảnh trưởng th&agrave;nh, chuy&ecirc;n nghiệp. Với những lựa chọn m&agrave;u sắc v&agrave; chất liệu ph&ugrave; hợp, balo l&agrave; m&oacute;n đồ c&oacute; t&iacute;nh ứng dụngcao, c&oacute; thể kết hợp nhịp nh&agrave;ng trong đa dạng phong c&aacute;ch.</p>\r\n', '680000.00', 360000, 10, 'LB232095.jpg', '[]', 0, 0, 4, 1, 1642671125),
(61, 10, 'TÚI XÁCH NAM fishhood LE124005', '<p>T&uacute;i tote nam<br />\r\nChất liệu da PU cao cấp<br />\r\nT&uacute;i tote thường được thiết kế rất rộng, nhưng đừng v&igrave; thế m&agrave; bạn cố nh&eacute;t hết những thứ linh tinh khiến cho chiếc t&uacute;i trở n&ecirc;n nặng nề v&agrave; mất d&aacute;ng. Đừng đeo t&uacute;i l&ecirc;n vai v&igrave; quai t&uacute;i được thiết kế để x&aacute;ch tay.&nbsp;</p>\r\n', '2000000.00', 1260000, 10, 'tuinam_1.jpg', '[]', 0, 0, 4, 1, 1642671225),
(62, 10, 'Túi Tote Oxford', '<p>Đ&acirc;y l&agrave; chiếc t&uacute;i tote đến từ bộ sưu tập vải Oxford nhập khẩu, một sản phẩm kh&ocirc;ng thể thiếu cho những ai y&ecirc;u th&iacute;ch những chiếc t&uacute;i đa năng c&oacute; thể vừa mang đi học, đi l&agrave;m hoặc đi chơi.</p>\r\n\r\n<ul>\r\n	<li>Chất liệu: Vải Oxford</li>\r\n	<li>K&iacute;ch thước: 30 x 30 x 12 cm</li>\r\n	<li>Để được c&aacute;c loại laptop 15 Inches đổ xuống</li>\r\n	<li>1 ngăn lớn</li>\r\n	<li>2 ngăn nhỏ</li>\r\n</ul>\r\n', '380000.00', 10000, 10, 'tuinam_2.jpg', '[]', 1, 0, 4, 1, 1642671343),
(63, 10, 'TÚI XÁCH NAM fishhod LE128930', '<p>Chất liệu&nbsp;da PU cao cấp, c&oacute; độ đ&agrave;n hồi tốt, m&agrave;u sắc đa dạng...</p>\r\n\r\n<p>Thiết kế với sự tối giản, đem tới ch&agrave;ng một h&igrave;nh ảnh trẻ trung, năng động. T&uacute;i x&aacute;ch nam đeo ch&eacute;o phuph&ugrave; hợp với hầu hết mọi lứa tuổi, từ những cậu bạn học sinh, những anh ch&agrave;ng c&ocirc;ng sở hay những anh ch&agrave;ng ưa sự kh&aacute;m&nbsp;cũng đều c&oacute; thể sử dụng chiếc t&uacute;i hữu dụng n&agrave;y.</p>\r\n', '1700000.00', 980000, 10, 'tuinam_3.jpg', '[]', 1, 0, 4, 1, 1642671431),
(64, 11, 'Ví card Vintage', '<p>V&iacute; Gello được l&agrave;m thủ c&ocirc;ng, thiết kế nhỏ gọn tiện d&ugrave;ng cho h&agrave;ng ng&agrave;y. Sản phẩm c&oacute; 5 m&agrave;u cơ bản ph&ugrave; hợp với nhiều kiểu trang phục v&agrave; sự kiện.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<ul>\r\n		<li>Chất liệu: Da&nbsp;thảo mộc&nbsp;/&nbsp;<a href=\"https://www.leonardo.vn/blogs/news/da-sap-chat-lieu-che-tac-duoc-ca-the-gioi-ua-chuong\">Da s&aacute;p</a></li>\r\n		<li>T&iacute;nh năng: Da trơn mềm, sau một thời gian sẽ để lại những vết xước đặc biệt, độ bền cao</li>\r\n		<li>K&iacute;ch thước: 10.5 x 8 cm</li>\r\n		<li>6 khe thẻ, để được khoảng 15 tờ tiền gấp đ&ocirc;i, CMND/CCCD, thẻ card, c&aacute;c loại giấy tờ dạng thẻ</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n', '295000.00', 10000, 10, 'vidanam_11.jpg', '[\"vidanam_1_1.jpg\"]', 1, 0, 4, 1, 1642671509),
(65, 11, 'Ví Mercury - Taiga', '<p>Lấy cảm hứng từ đại dương s&acirc;u thẳm, v&iacute;</p>\r\n', '530000.00', 0, 10, 'vidanam_2.jpg', '[]', 1, 0, 4, 1, 1642671749),
(66, 11, 'Ví Cosmos - Đứng', '<p>Sử dụng chất da Saffiano nhập khẩu với hai phối m&agrave;u nam t&iacute;nh l&agrave; đen v&agrave; xanh. Đường kẻ sọc trắng ngang v&iacute; l&agrave; một điểm nhấn tinh tế m&agrave; ai cũng kh&ocirc;ng thể rời mắt.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<ul>\r\n		<li>Chất liệu:&nbsp;<a href=\"https://www.leonardo.vn/blogs/news/da-saffiano-ke-thong-linh-trong-the-gioi-chat-lieu-che-tac\">Da Saffiano nhập khẩu</a></li>\r\n		<li>T&iacute;nh năng: Da v&acirc;n xước, trượt nước, độ bền cao</li>\r\n		<li>K&iacute;ch thước: Ngang/Đứng 11 x 9 cm. Xem th&ecirc;m d&aacute;ng v&iacute; ngang&nbsp;<a href=\"https://www.leonardo.vn/products/vi-cosmos-02-ngang?_pos=1&amp;_sid=be5017e8d&amp;_ss=r\">tại đ&acirc;y</a>.&nbsp;</li>\r\n		<li>2 ngăn lớn, 5 khe thẻ, 1 khe b&oacute;ng k&iacute;nh</li>\r\n		<li>Để khoảng 30 tờ tiền thẳng, thẻ card, ảnh, CMND/CCCD, c&aacute;c loại giấy tờ</li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n', '530000.00', 20000, 10, 'vidanam_31.png', '[\"vidanam_32.png\"]', 1, 0, 4, 1, 1642671968),
(67, 12, 'Thắt Lưng THO-01', '<p>Được chăm ch&uacute;t từng đường may tỉ mỉ, kho&aacute;c l&ecirc;n m&igrave;nh 2 lớp da b&ograve; cao cấp c&ugrave;ng mặt hợp kim sang trọng, đ&acirc;y ch&iacute;nh l&agrave; chiếc thắt lưng mọi qu&yacute; &ocirc;ng thật thụ mong muốn.</p>\r\n\r\n<ul>\r\n	<li>Chất liệu: Da b&ograve; nhập khẩu</li>\r\n	<li>K&iacute;ch thước: 3.5 x 105 cm</li>\r\n	<li>Mặt hợp kim cao cấp, sang trọng</li>\r\n</ul>\r\n', '580000.00', 0, 10, 'thatlungnam_11.png', '[\"thatlungnam_1_11.png\",\"thatlungnam_1_21.png\"]', 1, 0, 4, 1, 1642672236),
(68, 12, 'Thắt lưng Epsom mặt R ', '<p>Thắt lưng Epsom được kiến tạo từ chất da Epsom&nbsp;trứ danh&nbsp;về độ bền, sự dẻo dai v&agrave; tuổi thọ tuyệt hảo.</p>\r\n\r\n<p>Da Epsom lu&ocirc;n l&agrave; lựa chọn đầu ti&ecirc;n của c&aacute;c h&atilde;ng thời trang nổi tiếng cho những si&ecirc;u phẩm high-end của m&igrave;nh.&nbsp;Th&ecirc;m b&uacute;c nịt từ th&eacute;p cao cấp kh&ocirc;ng gỉ, thắt lưng Epsom c&oacute; khả năng th&aacute;o rời gi&uacute;p bạn dễ d&agrave;ng thay đổi m&agrave;u d&acirc;y để ph&ugrave; hợp với nhiều outfit.&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Chất liệu:&nbsp;Da Epsom</li>\r\n	<li>T&iacute;nh năng: V&acirc;n hạt, kh&ocirc;ng nứt, g&atilde;y theo thời gian, tuổi thọ cao, chống nước, dễ d&agrave;ng vệ sinh</li>\r\n	<li>K&iacute;ch thước: 3 cm</li>\r\n	<li>2 loại mặt H v&agrave; R (<a href=\"https://www.leonardo.vn/collections/that-lung-nam/products/that-lung-epsom-mat-h-premium\">xem tại đ&acirc;y</a>), th&aacute;o rời dễ d&agrave;ng, thoải m&aacute;i đổi m&agrave;u thắt lưng</li>\r\n</ul>\r\n', '1850000.00', 750000, 10, 'thatlungnam_21.jpg', '[\"thatlungnam_2_1.jpg\",\"thatlungnam_2_2.jpg\",\"thatlungnam_2_3.jpg\"]', 1, 0, 4, 1, 1642672750),
(69, 12, 'Thắt Lưng Mori', '<p>Vẫn l&agrave; phong c&aacute;ch cổ điển đặc trưng của d&ograve;ng Mori, thắt lưng Mori được tạo n&ecirc;n từ chất da Vachetta c&ugrave;ng thiết kế tinh tế sẽ đưa bạn trở về với những ng&agrave;y xưa cũ.</p>\r\n\r\n<p>TH&Ocirc;NG TIN SẢN PHẨM</p>\r\n\r\n<p>- Chất liệu: Da Vachetta nhập khẩu</p>\r\n\r\n<p>- T&iacute;nh năng: da trơn mềm mại, độ bền cao</p>\r\n\r\n<p>- K&iacute;ch thước: 3 cm x 120 cm</p>\r\n\r\n<p>- Đổi trả trong 33 ng&agrave;y v&agrave; bảo h&agrave;nh 12 th&aacute;ng lỗi NSX.</p>\r\n', '680000.00', 0, 10, 'mori_11.jpg', '[\"mori_1_1.jpg\",\"mori_1_2.jpg\",\"mori_1_3.jpg\",\"mori_1_4.jpg\",\"mori_1_5.jpg\"]', 1, 0, 4, 1, 1642673027),
(70, 18, 'KÍNH MẮT NỮ fishhood', '<p>K&iacute;nh m&aacute;t thời trang&nbsp;<br />\r\nK&iacute;nh mắt tr&ograve;n gọng nhựa cao cấp, chỉ số chống tia UV.<br />\r\nTương tự một bộ c&aacute;nh ấn tượng hay lớp trang điểm chỉn chu, k&iacute;nh m&aacute;t c&oacute; thể quyết định c&aacute;ch thế giới nh&igrave;n bạn hay quan trọng hơn l&agrave; c&aacute;ch bạn nh&igrave;n ch&iacute;nh m&igrave;nh. B&ecirc;n cạnh yếu tố c&ocirc;ng năng, một cặp k&iacute;nh m&aacute;t c&oacute; thể thay đổi diện mạo lẫn phong c&aacute;ch thời trang.</p>\r\n', '1200000.00', 400000, 10, 'kinhnu_11.jpg', '[\"kinhnu_1_11.jpg\"]', 1, 0, 4, 1, 1642673454),
(71, 18, '    KÍNH MẮT NỮ LE8526-14', '<p>K&iacute;nh mắt thời trang</p>\r\n\r\n<p>Tươngtự một bộ c&aacute;nh ấn tượng hay lớp trang điểm chỉn chu, k&iacute;nh m&aacute;t c&oacute; thể quyết định c&aacute;ch thế giới nh&igrave;n bạn hay quan trọng hơn l&agrave; c&aacute;ch bạn nh&igrave;n ch&iacute;nh m&igrave;nh. B&ecirc;n cạnh yếu tố c&ocirc;ng năng, một cặp k&iacute;nh m&aacute;t c&oacute; thể thay đổi diện mạo lẫn phong c&aacute;ch thời trang.</p>\r\n', '1200000.00', 300000, 8, 'kinhnu_2.jpg', '[]', 1, 0, 4, 1, 1642673700),
(72, 15, 'TÚI XÁCH NỮ ĐEO CHÉO MIORR', '<p>Types of bag:&nbsp; Crossbody&nbsp;<br />\r\nMẫu t&uacute;i quai lửng x&aacute;ch tay hoặc đeo vai với kiểu tết d&acirc;y vải lạ lẫm, nắp t&uacute;i gập h&uacute;t nam ch&acirc;m chắc chắn. Phom d&aacute;ng cứng c&aacute;p l&agrave; lựa chọn phụ kiện t&uacute;i x&aacute;ch phổ biến, trẻ trung v&agrave; thời thượng.</p>\r\n', '800000.00', 0, 9, 'tuixachnu11.jpg', '[\"tuixachnu12.jpg\"]', 1, 0, 4, 1, 1642673864),
(75, 15, 'TÚI NỮ ĐEO CHÉO MIORR MT003', '<p>Types of bag:&nbsp; Crossbody&nbsp;<br />\r\nChi tiết ổ kh&oacute;a họa tiết tr&aacute;i tim độc đ&aacute;o điểm nhấn th&uacute; vị cho bề mặt t&uacute;i. Mặt t&uacute;i phủ nhũ lấp l&aacute;nh, thu h&uacute;t mọi &aacute;nh nh&igrave;n. Phom d&aacute;ng cứng c&aacute;p l&agrave; lựa chọn phụ kiện t&uacute;i x&aacute;ch phổ biến, sang trọng v&agrave; kh&oacute; lỗi mốt.</p>\r\n', '850000.00', 0, 10, 'tuixanhnu_1.jpg', '[]', 1, 0, 4, 1, 1642674523);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slider`
--

DROP TABLE IF EXISTS `slider`;
CREATE TABLE IF NOT EXISTS `slider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image_link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `link` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `slider`
--

INSERT INTO `slider` (`id`, `name`, `image_link`, `link`, `sort_order`, `created`) VALUES
(8, 'slider3', 'slide100.jpg', 'slider3', 3, '2022-01-20 07:20:10'),
(7, 'slider2', 'slide52.jpg', 'silder2', 2, '2022-01-20 07:19:50'),
(6, 'slider1', 'slider3.png', 'slider1', 1, '2022-01-20 07:19:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_phone` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT '0.00',
  `payment` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `transaction`
--

INSERT INTO `transaction` (`id`, `status`, `user_id`, `user_name`, `user_email`, `user_phone`, `user_address`, `message`, `amount`, `payment`, `created`) VALUES
(4, 1, 0, 'An Nhiên', 'annhien@gmail.com', '0166666666', 'Hoàng Mai - Hà Nội', 'Vui lòng trao hàng đến địa chỉ trên...', '350000.00', '', 1493983674),
(3, 1, 5, 'GoO', 'GoO@gmail.com', '01215345336', 'Hải Phòng', 'GUi hang den dia chi tren', '360000.00', '', 1493983674),
(5, 1, 0, 'Bình Nguyễn', 'binh@gmail.com', '0987654321', 'Hà Nội ', 'Gửi đến địa chỉ trên', '370000.00', '', 1494083674),
(6, 0, 0, 'Tô Nam', 'tonam@yahoo.com.vn', '098989876', 'Thủy Nguyên - Hải Phòng', 'Ship đến địa chỉ vào sáng ngày 23/5', '469000.00', '', 1494283674),
(7, 1, 5, 'GoO', 'GoO@gmail.com', '01215345336', 'Hải Phòng', 'Ship vào sáng mai.', '70000.00', '', 1494183674),
(8, 0, 0, 'Linh', 'ling@yahoo.com', '098798787', 'hai Phong', 'ship', '69000.00', '', 1494342674),
(9, 1, 0, 'Nhi', 'nhi@test.com', '0987654321', 'Long Biên - Hà Nội', 'Gửi hàng đến địa chỉ trên vào ngày mai', '200000.00', '', 1493983674),
(10, 0, 0, 'VIP User', 'test@gmail.com', '1234567890', 'Hải Phòng', 'Ship free', '450000.00', '', 1493983674),
(11, 0, 0, 'test', 'test@gmail.com', '1234567890', 'Hải Phòng', 'TESE', '300000.00', '', 1494383674),
(12, 0, 6, 'Nguyen An', 'khachhang1@gmail.com', '01201212222', 'Thủy Nguyên - Hải Phòng', 'SHIP TO', '169000.00', '', 1494407353);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `phone`, `address`, `created`) VALUES
(6, 'Nguyen An', 'khachhang1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01201212222', 'Thủy Nguyên - Hải Phòng', 2147483647),
(5, 'User', 'user@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2147483647),
(7, 'TEST@gmail.com', 'TEST@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '01215345336', 'Hải Phòng', 2017);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
