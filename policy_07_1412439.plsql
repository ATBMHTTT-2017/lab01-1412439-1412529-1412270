  --create function view data from duan
  CREATE OR REPLACE FUNCTION TTDUAN(
  p_schema varchar2,
  p_obj varchar2)
  return VARCHAR2
  as
    USERID char(5);
    DA VARCHAR2(20);
  begin 
    USERID := SYS_CONTEXT('USERENV', 'SESSION_USER');
    SELECT MADA INTO DA FROM DUAN WHERE TRUONGDA = USERID;
    RETURN 'DUAN = ' || DA;
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('No Data Found');
  end;
  
  --add policy07
  BEGIN DBMS_RLS.add_policy
    (object_schema => 'system',
    object_name => 'CHITIEU',
    function_schema => 'system',
    statement_types => 'SELECT, INSERT, UPDATE',
    policy_function => 'TTDUAN',
    policy_name => 'P_DUAN');
  END;
  
  --drop policy07
  BEGIN 
    DBMS_RLS.DROP_POLICY
    (OBJECT_NAME  => 'CHITIEU',
    POLICY_NAME => 'P_DUAN',
    OBJECT_SCHEMA => 'SYSTEM');
  END;