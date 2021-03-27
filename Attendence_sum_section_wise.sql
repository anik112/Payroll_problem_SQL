SELECT a.sectionname,a.totalcount total_emp, NVL(b.presentcount,0)prsnt_emp, NVL(c.leavecount,0)lev_emp, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))absent_emp
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active       = 0
    GROUP BY sectionnm
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname  
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear      = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate      =:p_date 
    AND    mov.cardno    =info.cardno 
    GROUP BY info.sectionnm 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_leave_detailinfo lea,tb_personal_info info
    WHERE  info.company =:p_company
    AND    info.company  = lea.company
    AND     :p_date BETWEEN start_date AND end_date
    AND    lea.cardno = info.cardno
    GROUP BY info.sectionnm
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND   a.sectionname   = c.sectionname(+)
ORDER BY a.sectionname ASC

----------------




SELECT a.sectionname,a.totalcount total_emp, NVL(b.presentcount,0)prsnt_emp, NVL(c.leavecount,0)lev_emp, 
               NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))absent_emp
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND        active      = 0
    GROUP BY sectionnm
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname  
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company   =:p_company
    AND        mov.company  = :p_com
    AND        mov.finyear      = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate       = :p_date 
    AND        mov.cardno     = info.cardno 
    GROUP BY info.sectionnm 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_leave_detailinfo lea,tb_personal_info info
    WHERE  info.company  = :p_company
    AND        info.company  = lea.company
    AND        :p_date BETWEEN start_date AND end_date
    AND        lea.cardno      = info.cardno
    GROUP BY info.sectionnm
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND   a.sectionname      = c.sectionname(+)
ORDER BY a.sectionname ASC



SELECT ROUND(SUM(mas.otmin/60))OTHR,info.sectionnm 
FROM   TB_DATA_MASTER mas, tb_personal_info info
WHERE  info.company   = :p_company
AND    mas.company    = :p_com
AND    mas.finyear        = TO_CHAR(:pp_date,'RRRR') 
AND    mas.finmonth     = RTRIM(TO_CHAR(:pp_date,'Month'))
AND    mas.pdate         = :pp_date
AND    mas.cardno       = info.cardno
group by info.sectionnm