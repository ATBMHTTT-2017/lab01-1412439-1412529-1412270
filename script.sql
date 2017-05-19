
/*create table*/
/*Nhan vien*/
CREATE TABLE NHANVIEN(
	maNV char(5) primary key, 
	hoTen varchar2(30), 
	diaChi varchar2(50), 
	dienThoai varchar2(11), 
	email varchar2(30), 
	maPhong char(5), 
	chiNhanh char(5), 
	luong float
	);

/*Phan cong*/
CREATE TABLE PHANCONG(
	maNV char(5),
	duAn char(5),
	vaiTro varchar2(30),
	phuCap float,
	primary key(maNV, duAn)
	); 

/*Phong ban*/
CREATE TABLE PHONGBAN(
	maPhong char(5) primary key,
	tenPhong varchar2(30),
	truongPhong char(5),
	ngayNhanChuc date,
	soNhanVien int,
	chiNhanh char(5)
	);

/*Du an*/
CREATE TABLE DUAN(
	maDA char(5) primary key,
	tenDA varchar2(30),
	kinhPhi float,
	phongChuTri char(5),
	truongDA char(5)
	);

/*Chi nhanh*/
CREATE TABLE CHINHANH(
	maCN char(5) primary key,
	tenCN nvarchar2(30),
	truongChiNhanh char(5)
	);

/*Chi tieu*/
CREATE TABLE CHITIEU(
	maChiTieu char(5) primary key,
	tenChitieu varchar2(30),
	soTien float,
	duAn char(5)
	);

/*foreign key*/
/*Nhan Vien*/
ALTER  TABLE NHANVIEN ADD CONSTRAINT FK_NhanVien_ChiNhanh FOREIGN KEY(chiNhanh) REFERENCES CHINHANH(maCN);
ALTER  TABLE NHANVIEN ADD CONSTRAINT FK_NhanVien_PhongBan FOREIGN KEY(maPhong) REFERENCES PHONGBAN(maPhong);
	
/*Phan Cong*/
ALTER  TABLE PHANCONG ADD CONSTRAINT FK_PhanCong_NhanVien FOREIGN KEY(maNV) REFERENCES NHANVIEN(maNV);
ALTER  TABLE PHANCONG ADD CONSTRAINT FK_PhanCong_DuAn FOREIGN KEY(duAn) REFERENCES DUAN(maDA);

/*Phong Ban*/
ALTER  TABLE PHONGBAN ADD CONSTRAINT FK_PhongBan_ChiNhanh FOREIGN KEY(chiNhanh) REFERENCES CHINHANH(maCN);

/*Du An*/
ALTER  TABLE DUAN ADD CONSTRAINT FK_DuAn_NhanVien FOREIGN KEY(truongDA) REFERENCES NHANVIEN(maNV);
ALTER  TABLE DUAN ADD CONSTRAINT FK_DuAn_PhongBan FOREIGN KEY(phongChuTri) REFERENCES PHONGBAN(maPhong);

/*Chi Nhanh*/
ALTER  TABLE CHINHANH ADD CONSTRAINT FK_ChiNhanh_NhanVien FOREIGN KEY(truongChiNhanh) REFERENCES NHANVIEN(maNV);

/*Chi Tieu*/
ALTER  TABLE CHITIEU ADD CONSTRAINT FK_ChiTieu_DuAn FOREIGN KEY(duAn) REFERENCES DUAN(maDA);



/*script them du lieu*/
/*Nhan vien*/
INSERT INTO NHANVIEN VALUES('NV001', 'Nguyen Van A', 'Long An', '098888123', 'loveinair@yahoo.com', 'PB001', 'CN001', 20000000);
INSERT INTO NHANVIEN VALUES('NV002', 'Tran Thi B', 'Gia Lai', '098821111', 'sharkiloveu@yahoo.com', 'PB003', 'CN001', 20000000);
INSERT INTO NHANVIEN VALUES('NV003', 'Bui Van A', 'Dak Lak', '098864545', 'longernight@yahoo.com', 'PB001', 'CN001', 40000000);
INSERT INTO NHANVIEN VALUES('NV004', 'Nguyen Ha Hai C', 'Vung Tau', '092288967', 'thebeset@yahoo.com', 'PB003', 'CN004', 50000000);
INSERT INTO NHANVIEN VALUES('NV005', 'Pham Viet A', 'Can Tho', '0985566123', 'huggmid@yahoo.com', 'PB002', 'CN004', 25000000);

/*Phong ban*/
INSERT INTO PHONGBAN VALUES('PB001', 'Phong ke hoach', 'NV001', TO_DATE('03/22/2015', 'MM/DD/YYYY'), 5, 'CN001');
INSERT INTO PHONGBAN VALUES('PB002', 'Phong kinh doanh', 'NV002', TO_DATE('03/14/2014', 'MM/DD/YYYY'), 7, 'CN003');
INSERT INTO PHONGBAN VALUES('PB003', 'Phong nhan su', 'NV003', TO_DATE('07/02/2015', 'MM/DD/YYYY'), 5, 'CN001');
INSERT INTO PHONGBAN VALUES('PB004', 'Phong quan li', 'NV004', TO_DATE('03/28/2014', 'MM/DD/YYYY'), 8, 'CN002');
INSERT INTO PHONGBAN VALUES('PB005', 'Phong truyen thong', 'NV005', TO_DATE('12/17/2015', 'MM/DD/YYYY'), 8, 'CN002');

/*Chi nhanh*/
INSERT INTO CHINHANH VALUES('CN001', 'Chi nhanh Ha Noi', 'NV002');
INSERT INTO CHINHANH VALUES('CN002', 'Chi nhanh tp Ho Chi Minh', 'NV001');
INSERT INTO CHINHANH VALUES('CN003', 'Chi nhanh Da Nang', 'NV007');

/*Du an*/
INSERT INTO DUAN VALUES('DA001', 'Phu xanh Ha Noi', 200, 'PB005', 'NV005');   
INSERT INTO DUAN VALUES('DA002', 'Xay cong vien Cong Phuong', 18000, 'PB003', 'NV002');
INSERT INTO DUAN VALUES('DA003', 'Cap thoat nuoc II', 5000, 'PB003', 'NV003');
INSERT INTO DUAN VALUES('DA004', 'Tai cau truc pho Trang Tien', 85000, 'PB005', 'NV002');
INSERT INTO DUAN VALUES('DA005', 'Xay lai truong KHTN', 200000, 'PB001', 'NV005');

/*Phan cong*/
INSERT INTO PHANCONG VALUES('NV001', 'DA002', 'Bao ve', 3);
INSERT INTO PHANCONG VALUES('NV002', 'DA004', 'Thiet ke', 22);
INSERT INTO PHANCONG VALUES('NV003', 'DA002', 'Thiet ke', 15);
INSERT INTO PHANCONG VALUES('NV004', 'DA002', 'Bao ve', 3);
INSERT INTO PHANCONG VALUES('NV005', 'DA003', 'Len ke hoach', 32);

/*Chi tieu*/
INSERT INTO CHITIEU VALUES('CT001', 'Mua xi mang', 1000000, 'DA005');
INSERT INTO CHITIEU VALUES('CT002', 'Mua sat', 500000, 'DA005');
INSERT INTO CHITIEU VALUES('CT003', 'Xang xe', 500000, 'DA001');
INSERT INTO CHITIEU VALUES('CT004', 'Luong nhan vien', 5000000, 'DA003');
INSERT INTO CHITIEU VALUES('CT005', 'Phi di lai', 1000000, 'DA004');



