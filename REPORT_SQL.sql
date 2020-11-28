
SELECT COUNT_DATA,DATA_LINE,COUNT_PER,PER_LINE FROM
(SELECT COUNT(TB_DATA_MASTER.CARDNO) COUNT_DATA,TB_DATA_MASTER.LINENO DATA_LINE
		FROM TB_DATA_MASTER 
		WHERE PDATE = TO_DATE('02/11/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
		GROUP BY TB_DATA_MASTER.LINENO
),
(SELECT COUNT(TB_PERSONAL_INFO.CARDNO) COUNT_PER,TB_PERSONAL_INFO.LINENO PER_LINE
		FROM TB_PERSONAL_INFO
		WHERE ACTIVE=0
		GROUP BY TB_PERSONAL_INFO.LINENO
)
WHERE DATA_LINE=PER_LINE

SELECT COUNT(CARDNO),LINENO FROM TB_PERSONAL_INFO WHERE ACTIVE=0 GROUP BY LINENO 

SELECT COUNT(CARDNO),LINENO FROM TB_DATA_MASTER WHERE PDATE = TO_DATE('02/11/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
AND SECTIONNM='Admin'
GROUP BY LINENO


SELECT * FROM TB_DATA_MASTER WHERE PDATE=TO_DATE('02/11/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS') 
AND CARDNO IN (SELECT CARDNO FROM TB_PERSONAL_INFO WHERE SECTIONNM='Admin' AND DEPARTMENTNM='Administrator' AND SHIFT='G' AND ACTIVE=0)



SELECT DISTINCT SECTIONNM FROM TB_PERSONAL_INFO WHERE COMPANY='Natural Denims Ltd.'




----------------------------------------------



SELECT PRESENT,
	   DATA_LINE,
	   DATA_SECTION,
	   TOTAL_EMP,
	   PER_LINE,
	   PER_SECTION,
	   PER_DPT FROM
(
SELECT COUNT(TB_DATA_MASTER.CARDNO) PRESENT,
	   TB_DATA_MASTER.LINENO DATA_LINE,
	   TB_DATA_MASTER.SECTIONNM DATA_SECTION
FROM TB_DATA_MASTER 
WHERE PDATE = TO_DATE('02/11/2019 00:00:00', 'MM/DD/YYYY HH24:MI:SS')
AND TB_DATA_MASTER.COMPANY=(
							SELECT COMID 
							FROM TB_COMPANY_INFO
							WHERE COMPANY='Natural Denims Ltd.'
							)
GROUP BY TB_DATA_MASTER.LINENO,
	  	 TB_DATA_MASTER.SECTIONNM
),
(
SELECT COUNT(TB_PERSONAL_INFO.CARDNO) TOTAL_EMP,
	   TB_PERSONAL_INFO.LINENO PER_LINE, 
	   TB_PERSONAL_INFO.SECTIONNM PER_SECTION,
	   TB_PERSONAL_INFO.DEPARTMENTNM PER_DPT
FROM TB_PERSONAL_INFO
WHERE TB_PERSONAL_INFO.ACTIVE=0
AND TB_PERSONAL_INFO.COMPANY='Natural Denims Ltd.'
GROUP BY TB_PERSONAL_INFO.DEPARTMENTNM,
	  TB_PERSONAL_INFO.SECTIONNM,
	  TB_PERSONAL_INFO.LINENO
)
WHERE DATA_LINE=PER_LINE
AND DATA_SECTION=PER_SECTION


-----------------------------------------------------------------


select info.DEPARTMENTNM, info.SECTIONNM,  info.LINENO,info.CARDNO, info.EMPNAME, info.DESIGNATION,
info.BIRTH_DATE, info.JOINING_DATE, info.GROSSSALARY present_sal
from tb_personal_info info
where company='Apparel Plus Limited.'
and	  info.PAY_SAL like decode(nvl(:p_pay_sal,'all'),'all','%',:p_pay_sal)
and	  info.BANK_NAME like decode(nvl(:p_bank_name,'all'),'all','%',:p_bank_name)
--and	  info.JOINING_DATE like decode(nvl(:join_date,'all'),'all','%',:join_date)
and	  info.DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and	  info.SECTIONNM like decode(nvl(:p_section,'all'),'all','%',:p_section)
and	  info.DESIGNATION like decode(nvl(:p_des,'all'),'all','%',:p_des)
and	  info.WORKERTYPE like decode(nvl(:p_worker_type,'all'),'all','%',:p_worker_type)
and	  info.LINENO like decode(nvl(:p_line_no,'all'),'all','%',:p_line_no)
and	  info.SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and	  info.GENDER like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and	  info.CARDNO like decode(nvl(:p_cardno,'all'),'all','%',:p_cardno)
and	  info.ACTIVE = 0
group by  info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO, info.EMPNAME,  info.DESIGNATION,
info.BIRTH_DATE, info.JOINING_DATE, info.GROSSSALARY


select DEPARTMENTNM,SECTIONNM, LINENO, CARDNO, SECRETENO, EMPNAME, DESIGNATION from tb_personal_info
where company='Apparel Plus Limited.'
and	  ACTIVE = 0
and	  PAY_SAL like decode(nvl(:p_pay_sal,'all'),'all','%',:p_pay_sal)
and	  BANK_NAME like decode(nvl(:p_bank_name,'all'),'all','%',:p_bank_name)
and	  DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
and	  SECTIONNM like decode(nvl(:p_section,'all'),'all','%',:p_section)
and	  DESIGNATION like decode(nvl(:p_des,'all'),'all','%',:p_des)
and	  WORKERTYPE like decode(nvl(:p_worker_type,'all'),'all','%',:p_worker_type)
and	  LINENO like decode(nvl(:p_line_no,'all'),'all','%',:p_line_no)
and	  SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
and	  GENDER like decode(nvl(:p_gender,'all'),'all','%',:p_gender)
and	  CARDNO like decode(nvl(:p_cardno,'all'),'all','%',:p_cardno) 
group by  DEPARTMENTNM,SECTIONNM, LINENO, CARDNO, SECRETENO, EMPNAME, DESIGNATION
order by LINENO, CARDNO asc






--------------------------------------------   28-11-2020 


SELECT * FROM
((SELECT INFO.CARDNO, INFO.EMPNAME, INFO.FATHER_NAME, INFO.DESIGNATION,
INFO.BIRTH_DATE, INFO.JOINING_DATE, INFO.GROSSSALARY, DESINFO.SALGRADE, 
INFO.GENDER, INFO.BLOODGROUP
FROM TB_PERSONAL_INFO INFO, TB_DESIGNATION_INFO DESINFO
WHERE INFO.COMPANY=PRINFO.COMPANY
AND	  INFO.DESIGNATION=DESINFO.DESIGNATION
AND	  INFO.CARDNO=PRINFO.CARDNO) A
(SELECT MAX(PRINFO.EFFECTIVEDATE) FROM TB_PROMOTION_INFO PRINFO
ORDER BY PRINFO.EFFECTIVEDATE DESC) B)
WHERE A.CARDNO=B.CARDNO



-------- JOIN MORE TABLE AND MAKE MULTI GROUP TO SINGLE GROUP 
SELECT INFO.CARDNO, INFO.EMPNAME, INFO.FATHER_NAME, INFO.DESIGNATION,
INFO.BIRTH_DATE, INFO.JOINING_DATE, INFO.GROSSSALARY, DESINFO.SALGRADE, 
INFO.GENDER, INFO.BLOODGROUP, PRINFO.EFFECTIVEDATE
FROM TB_PERSONAL_INFO INFO, TB_DESIGNATION_INFO DESINFO, TB_PROMOTION_INFO PRINFO
WHERE INFO.COMPANY='Apparel Plus Limited.'
AND	  PRINFO.COMPANY=INFO.COMPANY
AND	  INFO.ACTIVE=0
AND	  INFO.PAY_SAL like decode(nvl(:p_pay_sal,'all'),'all','%',:p_pay_sal)
AND	  INFO.BANK_NAME like decode(nvl(:p_bank_name,'all'),'all','%',:p_bank_name)
AND	  INFO.DEPARTMENTNM like decode(nvl(:p_dept,'all'),'all','%',:p_dept)
AND	  INFO.SECTIONNM like decode(nvl(:p_section,'all'),'all','%',:p_section)
AND	  INFO.DESIGNATION like decode(nvl(:p_des,'all'),'all','%',:p_des)
AND	  INFO.WORKERTYPE like decode(nvl(:p_worker_type,'all'),'all','%',:p_worker_type)
AND	  INFO.LINENO like decode(nvl(:p_line_no,'all'),'all','%',:p_line_no)
AND	  INFO.SHIFT like decode(nvl(:p_shift,'all'),'all','%',:p_shift)
AND	  INFO.CARDNO like decode(nvl(:p_cardno,'all'),'all','%',:p_cardno) 
AND	  DESINFO.DESIGNATION=INFO.DESIGNATION
AND	  PRINFO.CARDNO=INFO.CARDNO
AND	  PRINFO.EFFECTIVEDATE=(SELECT MAX(EFFECTIVEDATE) FROM TB_PROMOTION_INFO WHERE CARDNO=INFO.CARDNO)
ORDER BY INFO.CARDNO ASC
