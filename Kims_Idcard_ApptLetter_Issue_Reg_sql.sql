select cardno,empname,joining_date,designation,lineno,SECTIONNM,DEPARTMENTNM
from tb_personal_info
where company  =:p_company
and   active   = 0
and   DEPARTMENTNM like decode(nvl(:p_deptname,'all'),'all','%',:p_deptname)
and   SECTIONNM    like decode(nvl(:p_section,'all'),'all','%',:p_section)
and   DESIGNATION  like decode(nvl(:p_desig,'all'),'all','%',:p_desig)
and   lineno       like decode(nvl(:p_lineno,'all'),'all','%',:p_lineno)
and   cardno       like decode(nvl(:p_cardno,'all'),'all','%',:p_cardno) 
order by cardno asc


select LENGTH(to_char(:joining_date1,'fmDay')), 
(to_date('01-Jan-2021')+2), 
(to_char(:joining_date1,'Day')),
(to_char(:joining_date1,'RRRR')),
LENGTH(to_char(:joining_date1,'FMMonth')) from dual


select holiday, decode(holiday,to_char(to_date('03-Jan-2020'),'Day'),0,1) 
from TB_WEEKLY_HOLIDAY
where company='Kims Corporation Ltd.'
and	  finyear=2020
and	  finmonth='January'


----------------


declare
v_week_day varchar2(50 byte);
v_idCard_Recv_date date;
begin
	begin
		select holiday into v_week_day
		from TB_WEEKLY_HOLIDAY
		where company='Kims Corporation Ltd.'
		and	  finyear=to_char(:joining_date1,'RRRR')
		and	  finmonth=to_char(:joining_date1,'FMMonth');
	exception
	when no_data_found then v_week_day :='';
	when others then v_week_day :='';
	end;
  
	v_idCard_Recv_date:=(:joining_date1+2);
	
	if v_week_day = (to_char(v_idCard_Recv_date,'FMDay')) then
	   v_idCard_Recv_date := v_idCard_Recv_date+1;
	   dbms_output.put_line(v_idCard_Recv_date);
	else
		v_idCard_Recv_date:=v_idCard_Recv_date;
		dbms_output.put_line('something is wrong |'||LENGTH(to_char(:joining_date1,'Day'))||'|'||v_week_day);
	end if;
  
end;