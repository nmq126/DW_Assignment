-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 15, 2021 at 01:22 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `name`, `description`) VALUES
(1, 'Đống Đa', 'Quận Đống Đa nằm ở phía Tây nam của Thành phố Hà Nội, tiếp giáp với 5 quận Hoàn Kiếm, Ba Đình, Cầu Giấy, Thanh Xuân, Hai Bà Trưng.\r\nQuận Đống Đa có diện tích khoảng 9,95km2, gồm 21 phường'),
(2, 'Tây Hồ', 'Quận Tây Hồ nằm ở phía Tây Bắc của Hà Nội. Diện tích 24,0km2, gồm 8 phường: Bưởi, Yên Phụ, Thuỵ Khuê, Tứ Liên, Quảng An, Nhật Tân, Xuân La, Phú Thương. Phía đông giáp quận Long Biên; Phía tây giáp huyện Từ Liêm và quận Cầu Giấy; Phía nam giáp quận Ba Đình; Phía bắc giáp huyện Đông Anh.'),
(3, 'Cầu Giấy', 'Quận Cầu Giấy phía Đông giáp quận Đống Đa và quận Ba Đình, phía Tây giáp hai quận NamTừ Liêm và Bắc Từ Liêm, phía Nam giáp quận Thanh Xuân và phía Bắc giáp quận Tây Hồ. Quận có 8 phường: Phường Dịch Vọng, phường Mai Dịch, phường Nghĩa Đô, phường Nghĩa Tân, phường Quan Hoa, phường Trung Hòa, phường Yên Hòa, phường Dịch Vọng Hậu.'),
(4, 'Hoàng Mai', 'Quận Hoàng Mai nằm ở phía Đông Nam nội thành Hà Nội có diện tích: 4.104,1 ha. Quận Hoàng Mai phía Bắc giáp quận Thanh Xuân, Hai Bà Trưng, phía Tây và Nam giáp huyện Thanh Trì, phía Đông giáp sông Hồng-quận Long Biên.'),
(5, 'Hai Bà Trưng', 'Quận Hai Bà Trưng nằm ở phía Đông Nam nội thành Hà Nội, phía đông giáp quận Long Biên, phía tây giáp quận Đống Đa, phía tây nam giáp quận Thanh Xuân, phía nam giáp quận Hoàng Mai và phía bắc giáp quận Hoàn Kiếm');

-- --------------------------------------------------------

--
-- Table structure for table `streets`
--

CREATE TABLE `streets` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `district_id` int(11) NOT NULL,
  `created_at` date NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `streets`
--

INSERT INTO `streets` (`id`, `name`, `district_id`, `created_at`, `description`, `status`) VALUES
(12, 'Giải Phóng', 5, '2002-10-05', 'Đường Giải Phóng chính là một đoạn của quốc lộ 1A cũ, từ Hà Nội đi vào các tỉnh phía nam. Đây là cửa ngõ phía nam của Hà Nội. Đường Giải Phóng dài 4,6 km, bắt đầu từ đoạn cuối đường Lê Duẩn (ở ngã tư Kim Liên) đến hết đoạn giao cắt với đường vành đai 3 gần bến xe Nước Ngầm.', 1),
(13, 'Hoàng Quốc Việt	', 3, '1996-07-01', 'Đường Hoàng Quốc Việt thuộc địa phận các phường Cổ Nhuế 1 quận Bắc Từ Liêm, Nghĩa Tân, Nghĩa Đô quận Cầu Giấy, Hà Nội. đường Hoàng Quốc Việt khởi đầu từ đường Phạm Văn Đồng, chạy dài giao với các đường Trần Cung, Nguyễn Phong Sắc và kết thúc trên đường Bưởi đoạn giao với đường Võ Chí Công, đường có chiều dài khoảng 2,5km.', 1),
(14, 'Nguyễn Khánh Toàn	', 3, '2005-08-01', 'Đường Nguyễn Khánh Toàn bắt đầu từ cầu Dịch Vọng cắt đường Nguyễn Văn Huyên đến phố Trần Đăng Ninh. Đường Nguyễn Khánh Toàn dài 1.400m, rộng 40m.', 3),
(15, 'Đại Cồ Việt', 5, '2001-03-12', 'Tên tuyến phố được đặt theo tên của nước Việt xưa Đại Cổ Việt dưới triều đại của vua Đinh - Lê. Phố có chiều dài 1081m', 2),
(16, 'Tân Mai', 4, '1999-10-01', 'Đường Tân Mai thuộc địa phận phường Tân Mai và phường Hoàng Văn Thụ quân Hoàng Mai, Hà Nội. Đi từ cầu Kim Đồng ngang qua hồ Đền Lừ tới cầu Đền Lừ bắc sang đường Tam Trinh.\r\nĐường dài 1850m, rộng 35m.', 1),
(17, 'Trương Định', 4, '1990-09-01', 'Đường Trương Định thuộc địa phận 2 quận Hai Bà Trưng và Hoàng Mai, Hà Nội. Đi từ ngã tư Minh Khai đoạn cuối đường Bạch Mai, chạy qua ngã tư Kim Đồng - Tân Mai tới đường Giải Phóng.\r\nĐường dài 2, 4km, rộng 10 -12m.', 3),
(18, 'Âu Cơ', 2, '2006-01-01', 'Đường Âu Cơ nối tiếp đường Nghi Tàm, qua khu hành chính phường Nhật Tân tới ngã ba giao cắt với đường Thanh Niên và đường An Dương Vương.\r\nĐường dài 3, 1km, rộng 12m.', 2),
(19, 'Đặng Thai Mai', 2, '1969-09-06', 'Đường Đặng Thai Mai đi từ ngã ba giao cắt với đường Xuân Diệu tại số nhà 59 (Chung cư D\'Le Roi SoLeil), tới ngã ba giao cắt với đường Quảng An, cạnh khu biệt thự Tây Hồ.\r\nĐường dài 1, 2km, rộng 10, 5m.', 1),
(20, 'Xã Đàn', 1, '2000-01-01', 'Phố Xã Đàn thuộc địa phận các phường Phương Liên, Nam Đồng, Thổ Quan quận Đống Đa - Hà Nội, kéo dài từ ngã tư Đại Cồ Việt - Lê Duẩn - Giải Phóng, chạy qua làng Đồng Lâm và làng Xã Đàn tới Ô Chợ Dừa.\r\nPhố dài 1, 7km, rộng 50m.', 2),
(21, 'Hoàng Cầu', 1, '1999-08-01', 'Đường Hoàng Cầu thuộc địa phận 2 phường Ô Chợ Dừa, Trung Liệt quận Đống Đa - Hà Nội, khởi đầu từ ngã tư La Thành - Hào Nam, chạy qua hồ Đống Đa và kết thúc trên đường Thái Hà.\r\nĐường có chiều dài khoảng 1, 1km, rộng 15 -20m.', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_streets_districs_district_id` (`district_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `streets`
--
ALTER TABLE `streets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `streets`
--
ALTER TABLE `streets`
  ADD CONSTRAINT `fk_streets_districs_district_id` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
