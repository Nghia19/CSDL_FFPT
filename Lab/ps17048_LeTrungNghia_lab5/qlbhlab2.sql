CREATE DATABASE quanlibanhang;
USE quanlibanhang;

CREATE TABLE `hoadon` (
  `mahoadon` int(11) NOT NULL,
  `ngaymuahang` datetime DEFAULT NULL,
  `makhachhang` varchar(5) DEFAULT NULL,
  `trangthai` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hoadon`
--

INSERT INTO `hoadon` (`mahoadon`, `ngaymuahang`, `makhachhang`, `trangthai`) VALUES
(1, '2016-11-30 00:00:00', 'A', 'Da thanh toan'),
(2, '2016-11-30 00:00:00', 'B', 'Chua thanh toan'),
(3, '2016-11-30 00:00:00', 'C', 'Da thanh toan');

-- --------------------------------------------------------

--
-- Table structure for table `hoadonchitiet`
--

CREATE TABLE `hoadonchitiet` (
  `mahoadon` int(11) NOT NULL,
  `masanpham` int(11) NOT NULL,
  `soluong` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hoadonchitiet`
--

INSERT INTO `hoadonchitiet` (`mahoadon`, `masanpham`, `soluong`) VALUES
(1, 1, 5),
(2, 2, 10),
(3, 3, 25);

-- --------------------------------------------------------

--
-- Table structure for table `khachhang`
--

CREATE TABLE `khachhang` (
  `makhachhang` varchar(5) NOT NULL,
  `hovatenlot` varchar(50) DEFAULT NULL,
  `ten` varchar(50) DEFAULT NULL,
  `diachi` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `dienthoai` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `khachhang`
--

INSERT INTO `khachhang` (`makhachhang`, `hovatenlot`, `ten`, `diachi`, `email`, `dienthoai`) VALUES
('A', 'NGUYEN VAN', 'A', 'Sai Gon', 'A@gmail.com', '0123456781'),
('B', 'NGUYEN VAN', 'B', 'Sai Gon', 'B@gmail.com', '01234567892'),
('C', 'NGUYEN VAN', 'C', 'Binh Duong', 'C@gmail.com', '0123456789'),
('E', 'NGUYEN VAN', 'E', 'Vung Tau', 'E@gmail.com', '0123456789'),
('F', 'NGUYEN VAN', 'F', 'Sai Gon', 'F@gmail.com', '0123456789'),
('G', 'NGUYEN VAN', 'G', 'Dong Nai', 'G@gmail.com', '0123456789'),
('H', 'NGUYEN VAN', 'H', 'Ang Giang', 'H@gmail.com', '0123456789'),
('I', 'NGUYEN VAN', 'I', 'Sai Gon', 'I@gmail.com', '0123456789'),
('J', 'NGUYEN VAN', 'J', 'Long An', 'J@gmail.com', '0123456789'),
('K', 'NGUYEN VAN', 'K', 'Da Nang', 'K@gmail.com', '0123456789'),
('KH001', 'NGUYEN VAN', 'M', 'Da Nang', 'L@gmail.com', '0123886789'),
('KH003', 'NGUYEN VAN', 'N', 'Da Nang', 'L@gmail.com', '0123886789'),
('KH006', 'NGUYEN VAN', 'O', 'Da Nang', 'L@gmail.com', '0123886789'),
('L', 'NGUYEN VAN', 'L', 'Da Nang', 'L@gmail.com', '0123886789');

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `masanpham` int(11) NOT NULL,
  `mota` varchar(255) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `dongia` decimal(15,2) DEFAULT NULL,
  `tensanpham` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`masanpham`, `mota`, `soluong`, `dongia`, `tensanpham`) VALUES
(1, 'mo ta1', 10, '10000.00', 'cocacola'),
(2, 'mota 2', 4, '444444.00', 'pepsi'),
(3, 'mo ta 3', 10, '54855.00', 'kẹo'),
(4, 'mo ta 4', 4, '233334.00', 'cafe');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`mahoadon`),
  ADD KEY `makhachhang` (`makhachhang`);

--
-- Indexes for table `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
  ADD PRIMARY KEY (`mahoadon`,`masanpham`),
  ADD KEY `masanpham` (`masanpham`);

--
-- Indexes for table `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`makhachhang`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`masanpham`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `masanpham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD CONSTRAINT `hoadon_ibfk_1` FOREIGN KEY (`makhachhang`) REFERENCES `khachhang` (`makhachhang`);

--
-- Constraints for table `hoadonchitiet`
--
ALTER TABLE `hoadonchitiet`
  ADD CONSTRAINT `hoadonchitiet_ibfk_1` FOREIGN KEY (`mahoadon`) REFERENCES `hoadon` (`mahoadon`),
  ADD CONSTRAINT `hoadonchitiet_ibfk_2` FOREIGN KEY (`masanpham`) REFERENCES `sanpham` (`masanpham`);
COMMIT;

