SELECT per.departmentnm, per.sectionnm, per.lineno, per.cardno, per.empname, per.father_name, 
       per.mother_name, per.joining_date, per.designation, per.resignation_date, 
	   per.housbandname, per.enmname_bangla, per.designation_bangla, per.dept_bangla, per.sec_bangla , per.grosssalary
FROM   tb_resignation_info reg, tb_personal_info per
WHERE  reg.company  = :p_company
AND    reg.company   = per.company
AND    TO_CHAR(per.resignation_date,'rrrr')  =  :p_year
AND    reg.cardno   = per.cardno
AND    RTRIM(TO_CHAR(per.resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    per.sectionnm       LIKE DECODE(NVL(:p_sect,'all'),'all','%',:p_sect)
AND    per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE (NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    per.cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY per.departmentnm, per.sectionnm, per.lineno, per.cardno ASC

----------


SELECT cardno,empname,JOININGDATE,RESIGDATE, picture,remarks,designation , PRESENTADDRESS, PERMANENTADDRESS
FROM   TB_RESIGNATION_INFO
WHERE  UPPER(empname) LIKE '%'||UPPER(:ename)||'%'
ORDER BY empname ASC