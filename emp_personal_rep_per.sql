select departmentnm, sectionnm, lineno, shift, cardno, empname, designation, JOINING_DATE from tb_personal_info where active=0 and company='9 Star Apparels Industries Ltd.'
and cardno not in (select cardno from tb_data_master where pdate='11-May-2020')
group by departmentnm, sectionnm,lineno, shift, cardno, empname, designation, JOINING_DATE
order by departmentnm asc



declare
total_emp number;
present_emp number;
absent_emp number;
absent_prsnt number;
present_prsnt number;
begin

select count(*) into total_emp from tb_personal_info 
where company='9 Star Apparels Industries Ltd.' 
and active=0;

select count(*) into present_emp from tb_data_master
where company=2
and pdate='11-May-2020';

absent_emp:=total_emp-present_emp;
absent_prsnt:=(absent_emp/total_emp)*100;
present_prsnt:=(present_emp/total_emp)*100;

dbms_output.put_line('Total: '||total_emp||' Present: '||present_emp||' Absent: '||absent_emp||
' -- Absent: '||round(absent_prsnt)||'% Present: '||round(present_prsnt)||'%');

end;
