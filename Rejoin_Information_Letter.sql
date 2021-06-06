SELECT res.departmentnm, res.sectionnm, res.lineno, res.cardno, res.empname, res.father_name, res.mother_name, res.present_address, 
               res.joining_date, res.designation, res.salary_grade, res.grosssalary, res.resignation_date, res.permanentaddress
FROM   tb_personal_info_resignation  res, tb_personal_info info, tb_resignation_info resinfo
WHERE  res.company    = :p_company
AND    res.company        = info.company
AND    resinfo.company  = info.company
AND    res.resignation_date IS NOT NULL
AND    res.RESIGNATION_DATE BETWEEN :p_sdate AND :p_edate
AND    res.cardno           = info.cardno
AND    resinfo.cardno     = info.cardno

AND    TO_CHAR(res.resignation_date,'RRRR') LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year) 
AND    RTRIM(TO_CHAR(res.resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND    info.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND    info.sectionnm       LIKE DECODE(NVL(:p_sect,'all'),'all','%',:p_sect)
AND    info.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND    info.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    info.floorno             LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    info.machineno      LIKE DECODE (NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    info.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND    resinfo.resign_status LIKE DECODE(NVL(:p_rstatus,'all'),'all','%',:p_rstatus)
AND    info.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    info.cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)

ORDER BY res.departmentnm, res.sectionnm, res.lineno, res.cardno ASC

----------------



SELECT per.departmentnm, per.sectionnm, per.lineno, per.cardno, per.empname, per.father_name, 
               per.mother_name, per.joining_date, per.designation, per.resignation_date, 
               per.housbandname, per.enmname_bangla, per.designation_bangla, per.dept_bangla, per.sec_bangla , per.grosssalary,
               TRUNC(MONTHS_BETWEEN(per.resignation_date, per.joining_date)/12)YEAR, TRUNC(MOD( MONTHS_BETWEEN(per.resignation_date,per.joining_date) ,12))MONTH
FROM   tb_resignation_info reg, tb_personal_info per, tb_emp_card_rejoin rejoin
WHERE  reg.company  = :p_company
AND    reg.company   = per.company
AND    rejoin.company   = per.company
AND    reg.cardno      = per.cardno
AND    rejoin.cardno   = per.cardno
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