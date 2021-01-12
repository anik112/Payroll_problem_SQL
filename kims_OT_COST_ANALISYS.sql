select info.cardno,info.empname,info.lineno,info.SECTIONNM,info.designation,
       info.joining_date, info.DEPARTMENTNM, absent.pDATE
from  tb_personal_info info,TB_EMP_ABSENT_DAYS absent 
where  info.company =:p_company 
AND  info.company   = absent.company
and    info.active       = 0
and    info.CARDNO = absent.CARDNO
and    info.DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept) 
and    info.SECTIONNM 	 like decode(nvl(:p_section,'all'),'all','%',:p_section)
and    info.lineno       like decode(nvl(:p_line,'all'),'all','%',:p_line)
and    info.cardno       like decode(nvl(:p_card,'all'),'all','%',:p_card)
order by info.DEPARTMENTNM,info.SECTIONNM,info.CARDNO,absent.pDATE asc

--- TEST CODE 
declare
v_rate number:=0;
begin
v_rate:=OT_Rate(14000,'Worker');

dbms_output.put_line(v_rate);
end;
/



--- TEST CODE 
(SELECT SECTIONNM,COUNT(CARDNO) OT1 FROM TB_DATA_MASTER 
WHERE COMPANY=1
AND	  FINYEAR=2020
AND	  FINMONTH='December'
AND	  PDATE='06-Dec-2020'
AND	  (OTMIN+OTPART)=60
GROUP BY SECTIONNM)

--- get total man pwr from selected OT hr 
SELECT COUNT(CARDNO) OT2 FROM TB_DATA_MASTER 
WHERE FINYEAR=2020
AND	  FINMONTH='December'
AND	  PDATE='01-Dec-2020'
AND	  (OTMIN+OTPART)=180
AND	  SECTIONNM='Cutting'


SELECT COUNT(CARDNO) OT2 FROM TB_DATA_MASTER 
WHERE FINYEAR=2020
AND	  FINMONTH='December'
AND	  PDATE='01-Dec-2020'
AND	  SECTIONNM='Cutting'


SELECT SECTIONNM FROM TB_SECTION_INFO
WHERE  SECTIONNM IS NOT NULL


---- TEMP CODE 
select count(cardno)
from tb_data_master
where company=(select comid from tb_company_info where company=:p_company)
and	  finyear=:p_year
and	  finmonth=:p_month
and	  pdate=:p_date

select to_date(:p_date)-1 from dual

select comid,COMLOGO
from TB_COMPANY_INFO 
where company =:p_company

--- GET PRIVIOUS OT HR 
SELECT (SUM(OTMIN+OTPART)/60) PRIV_OT 
FROM TB_DATA_MASTER 
WHERE FINYEAR=2020
AND	  FINMONTH='December'
AND	  PDATE BETWEEN '01-Dec-2020' AND '05-Dec-2020'
AND	  SECTIONNM='Store'


--- GET AVG OT RATE 
SELECT ROUND(SUM(OT_RATE(GROSSSALARY, WORKERTYPE))/COUNT(CARDNO),2),COUNT(CARDNO)
FROM   TB_PERSONAL_INFO
WHERE  COMPANY='Kims Corporation Ltd.'
AND	   CARDNO IN (SELECT CARDNO FROM TB_DATA_MASTER 
	   			  WHERE FINYEAR=2020
				  AND	COMPANY=1
				  AND	FINMONTH='December'
				  AND	PDATE='06-Dec-2020'
				  AND	SECTIONNM='Store'
				  AND	OTMIN>0)
				  
				  
SELECT cardno, GROSSSALARY, ROUND((OT_RATE(GROSSSALARY, WORKERTYPE)),2)
FROM   TB_PERSONAL_INFO
WHERE  COMPANY='Kims Corporation Ltd.'
AND	   CARDNO IN (SELECT CARDNO FROM TB_DATA_MASTER 
	   			  WHERE FINYEAR=2020
				  AND	COMPANY=1
				  AND	FINMONTH='December'
				  AND	PDATE='06-Dec-2020'
				  AND	SECTIONNM='Store'
				  AND	OTMIN>0)