
--DAC--

--Chi truong phong moi duoc phep cap nhat va them thong tin vao du an

  --Start grant role dw_truongphong
  Grant Select, Update, Insert On system.Duan To Dw_Truongphong;
  --End grant role dw_truongphong
  
  --Start test user co roll dw_truongphong
    --select--
    select * from system.DUAN; 

    --insert--
    Insert Into System.Duan Values('DA006', 'Hoan thanh DAC1', 2000, '', '');
    
    --update--
    Update System.Duan Set Tenda='Chong ngap ung TP HCM' Where Mada='DA006';
  --End test user co roll dw_truongphong  

  



