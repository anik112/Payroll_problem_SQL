SELECT COUNT(CARDNO) FROM TB_DATA_MASTER_TEMP
WHERE  COMPANY=(SELECT COMID FORM TB_COMPANY_INFO WHERE COMPANY=:COMPANY)
AND	   FINYEAR=:finYEAR
AND	   FINMONTH=:finMONTH
AND	   CARDNO=:CARDNO


-- for get present 
declare
v_present number:=0;
begin
  SELECT COUNT(CARDNO) PRESENT into v_present FROM TB_DATA_MASTER_TEMP
	WHERE  COMPANY=(SELECT COMID FROM TB_COMPANY_INFO WHERE COMPANY=:COMPANY)
	AND	   FINYEAR=:finYEAR
	AND	   FINMONTH=:finMONTH
	AND	   CARDNO=:CARDNO;
	
	return v_present;
end;


declare
v_leave_day number:=0;
begin
	select sum(leaveday) into v_leave_day 
	from TB_LEAVE_DETAILINFO
	where  company  = :COMPANY
	and    finyear  = :finYEAR
	and    finmonth = :finMONTH
	and    cardno   = :CARDNO
	
	return v_leave_day;
end;
	


---- for leave type 
begin
   	select leave_type into d1 
	from TB_LEAVE_DETAILINFO
	where  company  = p_com
	and    finyear  = to_char(v_start,'RRRR')
	and    finmonth = rtrim(to_char(v_start,'Month'))
	and    v_start between start_date and end_date
	and    cardno   = emp.cardno;
	
	if(v_leave_type = 'Casual') then
	dbms_output.put_line('CL');
	elsif(v_leave_type = 'Earned') then
	dbms_output.put_line('EL');
	elsif(v_leave_type = 'Medical') then
	dbms_output.put_line('ML');
	elsif(v_leave_type = 'Compensive') then
	dbms_output.put_line('SP');
	end if;
	
   exception
   when no_data_found then d1 := d1;
   when others then d1 := d1;
end;


select leave_type from TB_LEAVE_DETAILINFO
where  company  = 'Kims Corporation Ltd.'
and    finyear  = 2020
and    finmonth = 'November'
and    '30-Nov-2020' between start_date and end_date
and    cardno   = '0014'
