create database cty_bds;
use cty_bds;
-- Tao bang Van_Phong
create table Van_Phong(
	MaVP int primary key,
	DiaChi varchar(250) not null
);
-- Tao bang Chu_So_Huu
create table Chu_So_Huu(
	MaCSH int primary key,
	DiaChi varchar(250) not null,
	HoTen varchar(150) not null,
	SDT varchar(15) unique
);
-- Tao bang BDS
create table BDS(
	MaBDS int primary key,
	DiaChi varchar(250) not null,
    MaVP int,
    MaCSH int
);
-- Tao bang Nhan_Vien
create table Nhan_Vien(
	MaNV int primary key,
	HoTen varchar(150) not null,
    MaVP int
);
-- Tao bang Than_Nhan
create table Than_Nhan(
	HoTen varchar(150) not null,
    NgaySinh date,
    MQH varchar(50) not null, 
    MaNV int,
    primary key (HoTen, MaNV)
);
-- Tao bang Truong_Phong
create table Truong_Phong(
	MaVP int unique,
    MaNV int unique,
	primary key (MaVP, MaNV)
);

-- Cau 2 tao rang buoc
alter table BDS
add constraint FK_VPBDS foreign key(MaVP) references Van_Phong(MaVP),
add constraint FK_CSHBDS foreign key(MaCSH) references Chu_So_Huu(MaCSH);
alter table Nhan_Vien
add constraint FK_VPNV foreign key(MaVP) references Van_Phong(MaVP);
alter table Than_Nhan
add constraint FK_NVTN foreign key(MaNV) references Nhan_Vien(MaNV);
alter table Truong_Phong
add constraint FK_TPVP foreign key(MaVP) references Van_Phong(MaVP),
add constraint FK_TPNV foreign key(MaVP) references Nhan_Vien(MaNV);
