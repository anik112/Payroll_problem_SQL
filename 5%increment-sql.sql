SELECT :PROYEAR, INFO.DEPARTMENTNM, INFO.DEPT_BANGLA, INFO.SECTIONNM, INFO.SEC_BANGLA, 
INFO.LINENO, INFO.CARDNO, INFO.EMPNAME, INFO.DESIGNATION, INFO.DESIGNATION_BANGLA, 
INFO.JOINING_DATE, DES.SALGRADE, INFO.GROSSSALARY, ROUND(((INFO.GROSSSALARY*5)/100)) AS FIVE_PER_INCR, 
(INFO.GROSSSALARY+ROUND(((INFO.GROSSSALARY*5)/100))) AS UPDATE_GROSS, :EFFECTIVE_DATE,
INFO.WORKERTYPE, INFO.COMPANY
FROM TB_PERSONAL_INFO INFO, TB_DESIGNATION_INFO DES
WHERE DES.DESIGNATION=INFO.DESIGNATION

---- insert data in promotion table 

INSERT INTO TB_PROMOTION_INFO PRO_INFO
(SLNO,PROYEAR, CARDNO, EMPNAME, JOININGDATE, CURRDESIGNATION, PRODESIGNATION, CURRSALARY, 
PROSALARY, SALARYGRD, EFFECTIVEDATE, WORKERTYPE, COMPANY, REMARKS, FINMONTH, PROCESSBY, PROCESSDATE, 
PRO_SAL_GRD, PRO_WORKER_TYPE, DESIGNATION_BANGLA, PRO_DESIG_BANGLA, DEPARTMENTNM, DEPT_BANGLA, SECTIONNM, 
SECT_BANGLA, LINENO) 
(SELECT 2020, INFO.CARDNO,INFO.EMPNAME,INFO.JOINING_DATE,INFO.DESIGNATION,INFO.DESIGNATION,INFO.GROSSSALARY,
(INFO.GROSSSALARY+ROUND(((INFO.GROSSSALARY*5)/100))),DES.SALGRADE,:EFFECTIVE_DATE,INFO.WORKERTYPE,INFO.COMPANY,
'YrS Increment','December','factory1','15-DEC-2020',DES.SALGRADE,INFO.WORKERTYPE,INFO.DESIGNATION_BANGLA,
INFO.DESIGNATION_BANGLA,INFO.DEPARTMENTNM,INFO.DEPT_BANGLA,INFO.SECTIONNM, INFO.SEC_BANGLA, 
INFO.LINENO 
FROM TB_PERSONAL_INFO INFO, TB_DESIGNATION_INFO DES
WHERE DES.DESIGNATION=INFO.DESIGNATION
AND	  INFO.ACTIVE=0)



----- update gross 

UPDATE TB_PERSONAL_INFO
SET GROSSSALARY=(GROSSSALARY+ROUND(((GROSSSALARY*5)/100)))
WHERE ACTIVE=0


---- using pl/sql 

declare

v_cardno tb_personal_info.CARDNO%type;
cursor CS_EMP is (select cardno from tb_personal_info where active=0);

begin
open CS_EMP;
loop
fetch CS_EMP into v_cardno;
exit when CS_EMP%notfound;

--- insert in promotion table 
INSERT INTO TB_PROMOTION_INFO PRO_INFO
(SLNO,PROYEAR, CARDNO, EMPNAME, JOININGDATE, CURRDESIGNATION, PRODESIGNATION, CURRSALARY, 
PROSALARY, SALARYGRD, EFFECTIVEDATE, WORKERTYPE, COMPANY, REMARKS, FINMONTH, PROCESSBY, PROCESSDATE, 
PRO_SAL_GRD, PRO_WORKER_TYPE, DESIGNATION_BANGLA, PRO_DESIG_BANGLA, DEPARTMENTNM, DEPT_BANGLA, SECTIONNM, 
SECT_BANGLA, LINENO) 
(SELECT 2020, INFO.CARDNO,INFO.EMPNAME,INFO.JOINING_DATE,INFO.DESIGNATION,INFO.DESIGNATION,INFO.GROSSSALARY,
(INFO.GROSSSALARY+ROUND(((INFO.GROSSSALARY*5)/100))),DES.SALGRADE,:EFFECTIVE_DATE,INFO.WORKERTYPE,INFO.COMPANY,
'YrS Increment','December','factory1','30-DEC-2020',DES.SALGRADE,INFO.WORKERTYPE,INFO.DESIGNATION_BANGLA,
INFO.DESIGNATION_BANGLA,INFO.DEPARTMENTNM,INFO.DEPT_BANGLA,INFO.SECTIONNM, INFO.SEC_BANGLA, 
INFO.LINENO 
FROM TB_PERSONAL_INFO INFO, TB_DESIGNATION_INFO DES
WHERE DES.DESIGNATION=INFO.DESIGNATION
AND	  INFO.ACTIVE=0
AND	  INFO.CARDNO=v_cardno);

--- update gross 
UPDATE TB_PERSONAL_INFO
SET GROSSSALARY=(GROSSSALARY+ROUND(((GROSSSALARY*5)/100)))
WHERE ACTIVE=0
AND CARDNO=v_cardno;


dbms_output.put_line(v_cardno);
end loop;
end;






--------------- update code  
INSERT INTO TB_PROMOTION_INFO PRO_INFO
(SLNO,PROYEAR, CARDNO, EMPNAME, JOININGDATE, CURRDESIGNATION, PRODESIGNATION, CURRSALARY, 
PROSALARY, SALARYGRD, EFFECTIVEDATE, WORKERTYPE, COMPANY, REMARKS, FINMONTH, PROCESSBY, PROCESSDATE, 
PRO_SAL_GRD, PRO_WORKER_TYPE, DESIGNATION_BANGLA, PRO_DESIG_BANGLA, DEPARTMENTNM, DEPT_BANGLA, SECTIONNM, 
SECT_BANGLA, LINENO) 
(SELECT 2020, INFO.CARDNO,INFO.EMPNAME,INFO.JOINING_DATE,INFO.DESIGNATION,INFO.DESIGNATION,INFO.GROSSSALARY,
(,DES.SALGRADE,:EFFECTIVE_DATE,INFO.WORKERTYPE,INFO.COMPANY,
'YrS Increment','December','factory1','30-DEC-2020',DES.SALGRADE,INFO.WORKERTYPE,INFO.DESIGNATION_BANGLA,
INFO.DESIGNATION_BANGLA,INFO.DEPARTMENTNM,INFO.DEPT_BANGLA,INFO.SECTIONNM, INFO.SEC_BANGLA, 
INFO.LINENO 
FROM TB_PERSONAL_INFO INFO, TB_DESIGNATION_INFO DES
WHERE DES.DESIGNATION=INFO.DESIGNATION
AND	  INFO.ACTIVE=0
AND	  INFO.CARDNO=v_cardno);




INSERT INTO TB_PROMOTION_INFO PRO_INFO
(PROYEAR, CARDNO, EMPNAME, JOININGDATE, CURRDESIGNATION, PRODESIGNATION, CURRSALARY, 
PROSALARY, SALARYGRD, EFFECTIVEDATE, WORKERTYPE, COMPANY, REMARKS, FINMONTH, PROCESSBY, PROCESSDATE, 
PRO_SAL_GRD, PRO_WORKER_TYPE, DESIGNATION_BANGLA, PRO_DESIG_BANGLA, DEPARTMENTNM, DEPT_BANGLA, SECTIONNM, 
SECT_BANGLA, LINENO)


select 2020, INFO.CARDNO,INFO.EMPNAME,INFO.JOINING_DATE,INFO.DESIGNATION,INFO.DESIGNATION,INFO.GROSSSALARY,
round(((sal.BASICSAL*5)/100)+((((sal.BASICSAL*5)/100)*50)/100)) incr_amt,DES.SALGRADE,TO_DATE('01-Jan-2021'),INFO.WORKERTYPE,INFO.COMPANY,'Increment', 'December',
'MGL', to_date('30-Dec-2020'), DES.SALGRADE,INFO.WORKERTYPE,INFO.DESIGNATION_BANGLA,
INFO.DESIGNATION_BANGLA,INFO.DEPARTMENTNM,INFO.DEPT_BANGLA,INFO.SECTIONNM, INFO.SEC_BANGLA, info.LINENO
from TB_MONTH_SALARY sal, tb_personal_info info, TB_DESIGNATION_INFO des
where sal.finyear=2020
and	  sal.finmonth='November'
and	  sal.COMPANY=info.COMPANY
and	  sal.cardno=info.cardno
and	  info.JOINING_DATE <= '31-Dec-2018'
and	  info.company='Mascot Fashions Ltd.'
and	  des.DESIGNATION=info.DESIGNATION
and	  info.active=0


--------------



select info.cardno, info.GROSSSALARY, round((info.GROSSSALARY-1850)/1.5) basic, 
((((info.GROSSSALARY-1850)/1.5) *5)/100) incr_amount,
((((((info.GROSSSALARY-1850)/1.5) *5)/100)*50)/100) incr_hr,
round(((((info.GROSSSALARY-1850)/1.5)*5)/100)+((((((info.GROSSSALARY-1850)/1.5)*5)/100)*50)/100)),
round(info.GROSSSALARY+((((info.GROSSSALARY-1850)/1.5)*5)/100)+((((((info.GROSSSALARY-1850)/1.5)*5)/100)*50)/100)) total_amt
from tb_personal_info info
where info.JOINING_DATE <= '31-Dec-2018'
--and	  info.company='Mascot Fashions Ltd.'
and	  info.active=0
