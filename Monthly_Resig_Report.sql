SELECT res.departmentnm, res.sectionnm, res.lineno, res.cardno, res.empname, res.father_name, res.mother_name, res.present_address, 
       res.joining_date, res.designation, res.salary_grade, res.grosssalary, res.resignation_date, res.permanentaddress
FROM   TB_PERSONAL_INFO_RESIGNATION  res, TB_PERSONAL_INFO info, TB_RESIGNATION_INFO resinfo
WHERE  res.company  =:p_company
AND    res.company        = info.company
AND    resinfo.company   = info.company
AND    res.resignation_date IS NOT NULL
AND    res.cardno     = info.cardno
AND    resinfo.cardno     = info.cardno
AND    TO_CHAR(res.resignation_date,'RRRR') LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND    RTRIM(TO_CHAR(res.resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm LIKE DECODE(NVL(:p_sect,'all'),'all','%',:p_sect)
AND    info.designation LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.floorno LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno LIKE DECODE (NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    resinfo.resign_status LIKE DECODE(NVL(:p_rstatus,'all'),'all','%',:p_rstatus)
AND    info.shift       LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.cardno LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY res.departmentnm, res.sectionnm, res.lineno, res.cardno ASC
SELECT * FROM dual WHERE dummy=:p_payment_date

