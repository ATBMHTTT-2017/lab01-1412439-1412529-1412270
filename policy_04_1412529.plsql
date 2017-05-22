
--DAC--

--Giam doc duoc phep xem cac thong tin cua du an

--start create view--
create view v_chitietduan as 
	select Duan.Mada as Mada, Duan.Tenda as Tenda, Duan.Kinhphi as Kinhphi, Phongban.Tenphong as Tenphong,
    Chinhanh.Tencn as Tencn, Nhanvien.Hoten as Tentruongduan
  From Phongban, Duan, Chinhanh, Nhanvien 
  Where Duan.Phongchutri = Phongban.Maphong 
  And Duan.Truongda = Nhanvien.Manv
  And Chinhanh.Macn = Nhanvien.Chinhanh;
--end create view--

--drop view v_chitietduan;

  
  --grant cho role dw_giamdoc--
  Grant Select On v_chitietduan To Dw_Giamdoc;
  
  --test--
  select * from system.v_chitietduan;

  
  
  



