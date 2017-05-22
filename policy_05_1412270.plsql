Alter Session Set "_ORACLE_SCRIPT"=True;

--stored procedure cap nhat phong ban
Create Or Replace Procedure Sp_capnhatphongban
(
  Pmaphong Char,
  Ptenphong Varchar2,
  Ptruongphong Char,
  Pngaynhanchuc Date,
  Psonhanvien Int,
  pChinhanh Char
)As
Begin
  Update Phongban Set Tenphong=Ptenphong, Truongphong=Ptruongphong, Ngaynhanchuc=Pngaynhanchuc, Sonhanvien=Psonhanvien,
  chinhanh=pchinhanh where maphong=pmaphong;
End;

--grant quyen thuc thi cho cac role--
Grant Execute On Sp_Capnhatphongban To Dw_Truongphong;
Grant Execute On Sp_Capnhatphongban To Dw_Truongchinhanh;

--test tren user la truongphong 

--exec system.sp_capnhatphongban('PB005', 'Phong quang cao', 'NV022', to_date('11/12/2017', 'MM,DD,YYYY'), 22, 'CN003');
--select * from system.phongban;