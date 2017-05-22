 --create function view data from NHANVIEN
 CREATE OR REPLACE FUNCTION VIEWINFONHANVIEN(
  p_Schema varchar2,
  p_obj varchar2)
  return varchar2
  is
    userid char(5);
    mp char(5);
    temp int;
  begin 
    userid := SYS_CONTEXT('USERENV', 'SESSION_USER');
    select count(*) into temp from PHONGBAN where truongphong = userid;
    if(temp > 0)
      then return '';
      end if;
    select count(*) into temp from DUAN where truongda = userid;
    if(temp > 0)
      then return '';
      end if;
    select count(*) into temp from CHINHANH where truongchinhanh = userid;
    if(temp > 0)
      then return '';
      end if; 
    select maPhong into mp from NHANVIEN where maNV = userid;
    return mp;
  end ;
  
  --Add policy
  BEGIN DBMS_RLS.add_policy
    (object_schema => 'system',
    object_name => 'NHANVIEN',
    function_schema => 'system',
    statement_types => 'SELECT',
    policy_function => 'VIEWINFONHANVIEN',
    policy_name => 'VIEWINFONHANVIEN')
  END;
  
  --crop policy
  BEGIN DBMS_RLS.add_policy
    (object_schema => 'system',
    object_name => 'NHANVIEN',
    policy_name => 'VIEWINFONHANVIEN')
  END;