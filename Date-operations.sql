SELECT SYSDATE AS current_date,
       SYSDATE + 1 AS plus_1_day
FROM   dual


SELECT
  (to_date(:p_to_date,'DD-MM-YYYY') - level + 1) AS day
FROM
  dual
CONNECT BY LEVEL <= (to_date(:p_to_date,'DD-MM-YYYY') - to_date(:p_from_date,'DD-MM-YYYY') + 1);



SELECT (to_date('12-Sep-2020')) + level
FROM Dual 
CONNECT BY Level <= 5 




declare
v_date_list varchar2(250 byte):='';
v_leaveday TB_LEAVE_DETAILINFO.leaveday%type;
v_startdate TB_LEAVE_DETAILINFO.START_DATE%type;
begin
  
  select leaveday, start_date into v_leaveday, v_startdate 
  from TB_LEAVE_DETAILINFO
  where finyear=2020
  and		finmonth='September'
  and		cardno='10000891';
  
  for  v_count in 1..v_leaveday loop
  v_date_list := v_date_list||' '||to_char((v_startdate+v_count),'dd-MON');
  end loop;
  
  dbms_output.put_line(v_date_list);
  
end;