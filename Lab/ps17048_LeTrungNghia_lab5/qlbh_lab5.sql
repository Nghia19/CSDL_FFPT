USE quanlibanhang;
-- 1a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
SELECT*
FROM quanlibanhang.khachhang;

-- 1b. Hiển thị 10 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại
SELECT makhachhang,hovatenlot,ten,email,dienthoai
FROM quanlibanhang.khachhang 
LIMIT 10;

-- 1c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm,tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
SELECT masanpham,tensanpham, SUM(soluong*dongia) AS'Tong tien'
FROM quanlibanhang.sanpham;

-- 1d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột:
-- maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột hoVaTenLot và Ten
SELECT makhachhang, concat(hovatenlot,' ',ten) AS'ho va ten', diachi 
FROM quanlibanhang.khachhang WHERE ten LIKE 'H%';

-- 1e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
SELECT* 
FROM khachhang 
WHERE diachi LIKE '%Da Nang%';

-- 1f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
SELECT*
FROM sanpham 
WHERE soluong>=100 AND soluong<=500;
SELECT*
FROM quanlibanhang.sanpham
WHERE soluong BETWEEN 100 AND 500;

-- 1g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng trong năm 2016
SELECT*
FROM quanlibanhang.hoadon
WHERE trangthai='Chua thanh toan' AND year(ngaymuahang)=2016;

-- 1h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003,KH006
SELECT*FROM quanlibanhang.khachhang
WHERE makhachhang='KH001' OR makhachhang='KH003' OR makhachhang='KH006';
SELECT*FROM quanlibanhang.khachhang 
WHERE makhachhang IN('KH001','KH003','KH006');

-- BAI2

-- 2a. Hiển thị số lượng khách hàng có trong bảng khách hàng
SELECT COUNT(*) AS'so luong khach hang' 
FROM quanlibanhang.khachhang;

-- 2b. Hiển thị đơn giá lớn nhất trong bảng SanPham
SELECT MAX(dongia) AS 'don gia lon nhat'
FROM quanlibanhang.sanpham;

-- 2c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
SELECT MIN(soluong)  AS'don gia thap nhat'
FROM quanlibanhang.sanpham;

-- 3d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
SELECT SUM(soluong) AS'tong san pham'
 FROM quanlibanhang.sanpham;

-- 2e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
SELECT COUNT(*) AS'so hoa don'
FROM quanlibanhang.hoadon
WHERE trangthai='Chua thanh toan' 
AND year(ngaymuahang)= 2016
AND month(ngaymuahang)=11;

-- 2f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn
SELECT mahoadon, sum(soluong) AS'so loai san pham'
 FROM quanlibanhang.hoadonchitiet
GROUP BY mahoadon;

-- 2gg. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu
-- chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
SELECT mahoadon, COUNT(*) AS'so loai san pham'
FROM quanlibanhang.hoadonchitiet
GROUP BY mahoadon>=5;

-- 2h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang,
-- maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
SELECT mahoadon, ngaymuahang, makhachhang
FROM quanlibanhang.hoadon
ORDER BY ngaymuahang desc;





