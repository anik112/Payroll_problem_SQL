SELECT a.designation, NVL(a.totalcount,0) total_emp, NVL(b.presentcount,0)total_prsnt, NVL(c.leavecount,0)total_lev,
       NVL(a.totalcount,0)-(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absnt , a.sectionnm, a.lineno, a.shift
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(designation,'Not Define ***')designation  ,sectionnm, lineno,shift
    FROM   tb_personal_info 
    WHERE  company  =:p_company
    AND    active   = 0
    AND    departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    sectionnm    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section) 
    AND    floorno      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno) 
    AND    shift        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY designation,sectionnm,lineno,shift
    )a,
    (SELECT COUNT(mov.cardno) presentcount,NVL(info.designation,'Not Define ***') designation ,info.sectionnm,info.lineno,info.shift
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'rrrr')
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    mov.cardno   =info.cardno
    AND    info.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    info.sectionnm    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    info.floorno      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    info.shift        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY info.designation ,info.sectionnm,info.lineno,info.shift
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.designation,'Not Define ***') designation ,info.sectionnm,info.lineno,info.shift
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date  BETWEEN start_date AND end_date
    AND    lea.cardno   = info.cardno 
    AND    info.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    info.sectionnm    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    info.floorno      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    info.shift        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY info.designation,info.sectionnm,info.lineno,info.shift
    )c 
WHERE a.designation  = b.designation(+)
AND   a.designation  = c.designation(+)
AND   a.sectionnm    = b.sectionnm(+)
AND   a.sectionnm    = c.sectionnm(+)
AND   a.lineno       = b.lineno(+)
AND   a.lineno       = c.lineno(+)
AND   a.shift        = b.shift(+)
AND   a.shift        = c.shift(+)
ORDER BY a.sectionnm,a.lineno, a.shift, a.designation ASC