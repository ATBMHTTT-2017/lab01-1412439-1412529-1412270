  --create function view data from CHITIEU
  CREATE OR REPLACE FUNCTION TTCHITIEU(
  p_schema varchar2,
  p_obj varchar2)
  return VARCHAR2
  as
    USERID char(5);
    DA VARCHAR2(20);
    MP VARCHAR2(5);
  begin 
    USERID := SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT MAPHONG INTO MP FROM PHONGBAN WHERE TRUONGPHONG = 	USERID;
    IF(DA = NULL)
	 THEN RETURN '';
	 END IF;
    SELECT MADA INTO DA FROM DUAN WHERE PHONGCHUTRI = MP 
    RETURN DA := 'DUAN = ' || DA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('No Data Found');
  end;
  
  --add policy08
  BEGIN DBMS_RLS.add_policy
    (object_schema => 'system',
    object_name => 'CHITIEU',
    function_schema => 'system',
    statement_types => 'SELECT',
    policy_function => 'TTCHITIEU',
    policy_name => 'P_CHITIEU2');
  END;
  
  --drop policy08
  BEGIN 
    DBMS_RLS.DROP_POLICY
    (OBJECT_NAME  => 'CHITIEU',
    POLICY_NAME => 'P_CHITIEU2',
    OBJECT_SCHEMA => 'SYSTEM');
  END;