SELECT a.DEPARTMENTNM, a.SECTIONNM, a.FLOORNO, a.total_Emp, NVL(b.total_emp_male,0)total_emp_male, NVL(c.total_emp_female,0)total_emp_female, 
       NVL(d.Total_present,0)Total_present, NVL(e.Total_leave,0)Total_leave, 
       NVL(a.total_Emp,0) - (NVL(d.Total_present,0) +NVL(e.Total_leave,0))Total_absent,
       NVL(ROUND((d.Total_present*100)/a.total_Emp,2),0)PERCENT 
FROM 
    (SELECT COUNT(cardno) total_Emp, DEPARTMENTNM, SECTIONNM, FLOORNO
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    DEPARTMENTNM LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    SECTIONNM    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    FLOORNO      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    SHIFT        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY DEPARTMENTNM, SECTIONNM, FLOORNO
    )a, 
    (SELECT COUNT(cardno) total_emp_male, DEPARTMENTNM, SECTIONNM, FLOORNO
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    gender  = 'Male'
    AND    DEPARTMENTNM LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    SECTIONNM    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    FLOORNO      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    SHIFT        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY DEPARTMENTNM, SECTIONNM, FLOORNO
    )b,
    (SELECT COUNT(cardno) total_emp_female, DEPARTMENTNM, SECTIONNM, FLOORNO
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    gender  = 'Female'
    AND    DEPARTMENTNM LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    SECTIONNM    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    FLOORNO      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    SHIFT        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY DEPARTMENTNM, SECTIONNM, FLOORNO
    )c,
    (SELECT COUNT(DISTINCT mov.cardno) Total_present, info.DEPARTMENTNM, info.SECTIONNM, info.FLOORNO
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    mov.cardno   =info.cardno 
    AND    info.DEPARTMENTNM LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    info.SECTIONNM    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    info.FLOORNO      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    info.SHIFT        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY info.DEPARTMENTNM, info.SECTIONNM, info.FLOORNO
    )d, 
    (SELECT COUNT(lea.cardno) Total_leave, DEPARTMENTNM, SECTIONNM, FLOORNO
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    lea.cardno   = info.cardno
    AND    info.DEPARTMENTNM LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    info.SECTIONNM    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    info.FLOORNO      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    info.SHIFT        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY DEPARTMENTNM, SECTIONNM, FLOORNO
    )e 
WHERE a.DEPARTMENTNM  = b.DEPARTMENTNM(+)
AND   a.DEPARTMENTNM  = c.DEPARTMENTNM(+)
AND   a.DEPARTMENTNM  = d.DEPARTMENTNM(+)
AND   a.DEPARTMENTNM  = e.DEPARTMENTNM(+)
AND   a.SECTIONNM     = b.SECTIONNM(+)
AND   a.SECTIONNM     = c.SECTIONNM(+)
AND   a.SECTIONNM     = d.SECTIONNM(+)
AND   a.SECTIONNM     = e.SECTIONNM(+)
AND   a.FLOORNO       = b.FLOORNO(+)
AND   a.FLOORNO       = c.FLOORNO(+)
AND   a.FLOORNO       = d.FLOORNO(+)
AND   a.FLOORNO       = e.FLOORNO(+)
ORDER BY a.FLOORNO,a.DEPARTMENTNM, a.SECTIONNM ASC