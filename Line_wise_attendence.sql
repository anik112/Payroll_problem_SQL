SELECT NVL(a.totalcount,0) total_emp, NVL(b.presentcount,0) total_prsnt, NVL(c.leavecount,0) total_lev,
       NVL(a.totalcount,0)-(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absnt , a.sectionnm,a.lineno, a.shift
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(lineno,'Not Define ***')lineno  ,sectionnm, shift
    FROM   TB_PERSONAL_INFO 
    WHERE  company      =:p_company
    AND    active       = 0
    AND    departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    sectionnm    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    floorno      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    shift        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY sectionnm,lineno,shift
	)a, 
    (SELECT COUNT(mov.cardno) presentcount,NVL(info.lineno,'Not Define ***') lineno ,info.sectionnm,info.shift
    FROM   TB_DATA_MASTER mov,TB_PERSONAL_INFO info 
    WHERE  info.company     =:p_company
    AND    mov.company      =:p_com
    AND    mov.finyear      = TO_CHAR(:p_date,'rrrr')
    AND    mov.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate        =:p_date 
    AND    mov.cardno       =info.cardno
    AND    info.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    info.sectionnm    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    info.floorno      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    shift        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY info.sectionnm,info.lineno,info.shift
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.lineno,'Not Define ***') lineno ,info.sectionnm,info.shift
    FROM   TB_LEAVE_DETAILINFO lea,TB_PERSONAL_INFO info 
    WHERE  info.company    =:p_company
    AND    info.company    = lea.company
    AND    :p_date  BETWEEN start_date AND end_date
    AND    lea.cardno      = info.cardno 
    AND    info.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    info.sectionnm    LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section)
    AND    info.floorno      LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno)
    AND    shift        LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY info.sectionnm,info.lineno,info.shift
    )c 
WHERE a.sectionnm = b.sectionnm(+)
AND   a.sectionnm = c.sectionnm(+)
AND   a.lineno    = b.lineno(+)
AND   a.lineno    = c.lineno(+)
AND   a.shift     = b.shift(+)  
AND   a.shift     = c.shift(+)
ORDER BY a.sectionnm,a.lineno, a.shift ASC