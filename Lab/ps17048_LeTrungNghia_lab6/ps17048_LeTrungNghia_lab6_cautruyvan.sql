USE ps17048_LeTrungNghia_lab6;
-- lab 6 lấy dữ liệu từ lab 5
-- Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua
-- cach1:
SELECT HD.MaHD, MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD
FROM hoadon HD, hoadonchitiet CT 
WHERE HD.MaHD=CT.MaHD;
-- cach2:
SELECT HD.MaHD, MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD
FROM hoadon HD INNER JOIN hoadonchitiet CT ON HD.MaHD=CT.MaHD;

-- 1bHiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột
-- sau: maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMua với
-- điều kiện maKhachHang = ‘KH001’
-- cach1:
SELECT HD.MaHD, MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD
FROM hoadon HD, hoadonchitiet CT 
WHERE HD.MaHD=CT.MaHD
AND HD.MaKH='KH001';
-- cahs2: 
SELECT HD.MaHD, MaKH,TrangThai,MaSP,SoLuongMua,NgayLapHD 
FROM hoadon HD INNER JOIN hoadonchitiet CT ON HD.MaHD=CT.MaHD
WHERE  HD.MaHD=CT.MaHD AND HD.MaKH='KH001';

-- 1c c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột
-- sau: maHoaDon, ngayMua, tenSP, donGia, soLuong mua trong hoá đơn, thành
-- tiền. Với thành tiền= donGia* soLuong 
-- cachs1:
SELECT HD.MaHD ,NgayLapHD,TenSP,GiaSP,SoLuongMua, SoLuongMua*GiaSP AS'thanh tien' 
FROM hoadon HD, hoadonchitiet CT, sanpham SP
WHERE (HD.MaHD=CT.MaHD) AND (CT.MaSP=SP.MaSP) ;
-- cách 2
SELECT HD.MaHD ,NgayLapHD,TenSP,GiaSP,SoLuongMua, SoLuongMua*GiaSP AS 'thanh tien' 
FROM ((hoadon HD INNER JOIN hoadonchitiet CT on HD.MaHD=CT.MaHD)
 INNER JOIN sanpham SP ON CT.MaSP=SP.MaSP);
 
 -- 1d d. Hiển thị thông tin từ bảng khách hàng, bảng hoá đơn, hoá đơn chi tiết gồm các
-- cột: họ và tên khách hàng, email, điện thoại, mã hoá đơn, trạng thái hoá đơn và
-- tổng tiền đã mua trong hoá đơn. Chỉ hiển thị thông tin các hoá đơn chưa thanh toán
SELECT concat(HoVaTenLot,' ',ten) AS 'Ho va ten',Email,DienThoai,HD.MaHD,TrangThai ,SUM(SoLuongMua*GiaSP) AS 'tong tien'
 FROM khachhang KH, hoadon HD, hoadonchitiet CT,sanpham
 WHERE TrangThai='Chưa thanh toán'
  GROUP BY HD.MaHD;
 -- chammmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm
 -- 1d
 
 SELECT concat(HoVaTenLot,' ',Ten) AS 'Ho va ten',Email,DienThoai,HD.MaHD,TrangThai ,SUM(SoLuongMua*GiaSP) AS 'tong tien'
 FROM (((khachhang KH INNER JOIN hoadon HD ON HD.MaKH=HD.MaKH) 
						INNER JOIN hoadonchitiet CT ON CT.MaHD=HD.MaHD)
							INNER JOIN sanpham SP ON SP.MaSP=CT.MaSP)
 WHERE HD.TrangThai='Chưa thanh toán'
 GROUP BY HD.MaHD;
 
 -- 1.e. Hiển thị maHoaDon, ngàyMuahang, tổng số tiền đã mua trong từng hoá đơn. Chỉ
-- hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần
-- của cột tổng tiền.

SELECT HD.MaHD, NgayLapHD , SUM(GiaSP*SoLuongMua) AS 'Tong tien'
FROM ((hoadon HD INNER JOIN hoadonchitiet CT ON HD.MaHD=CT.MaHD)
					INNER JOIN sanpham SP ON SP.MaSP=CT.MaSP) 
GROUP BY HD.MaHD
HAVING  SUM(GiaSP*SoLuongMua)>=500.000
ORDER BY SUM(GiaSP*SoLuongMua) desc;


-- BAI2
-- 2a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2016
SELECT* FROM khachhang
WHERE maKH NOT IN(SELECT MaKH -- danh sách tất cả các khác hàng mua hóa đơn từ năm 2016
					FROM hoadon WHERE NgayLapHD>='2016-01-01');


-- 2b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
-- hiển thị sp masp, ten san pham

-- 2c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016
SELECT KH.*,SUM(GiaSP*SoLuongMua) AS 'Tổng tiền' -- * tat cả các cột trong tất cả các bảng
FROM khachhang KH
	INNER JOIN hoadon HD ON KH.MaKH=HD.MaKH
    INNER JOIN hoadonchitiet  HDCT ON HDCT.MaHD=HD.MaHD
    INNER JOIN sanpham SP on SP.MaSP=HDCT.MaSP
WHERE year(ngayLapHD)=2016
GROUP BY KH.MaKH
ORDER BY SUM(GiaSP*SoLuongMua) DESC
LIMIT 2;
 -- 2d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên
-- “Iphone 7 32GB” trong tháng 12/2016
SELECT*
FROM khachhang KH
	INNER JOIN hoadon HD ON KH.MaKH=HD.MaKH
		INNER JOIN hoadonchitiet  HDCT ON HDCT.MaHD=HD.MaHD
			INNER JOIN sanpham SP on SP.MaSP=HDCT.MaSP
WHERE KH.DiaChi LIKE'%Đà Nẵng%' 
AND tenSP='Iphone 6 32GB' AND year(NgayLapHD)=2016 AND month(NgayLapHD)=12;
-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản
-- phẩm.
USE ps17048_LeTrungNghia_lab6;
SELECT SP.*,  COUNT(*) AS 'Luot mua'
FROM sanpham SP INNER JOIN hoadonchitiet ON SP.maSP=hoadonchitiet.maSP
GROUP BY SP.MaSP
HAVING COUNT(*)<(SELECT AVG(Luotmua)
					from(SELECT maSP, COUNT(*) AS 'Luotmua'
						FROM hoadonchitiet
						GROUP BY maSP) AS Ten);




 



