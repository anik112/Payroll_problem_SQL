SELECT a.sectionname, a.totalcount not_total_emp, NVL(b.presentcount,0)not_total_prsnt, NVL(c.leavecount,0)not_total_lev, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))not_total_absent
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname  
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND        active      = 0
    AND        otorg        = 'N'
    GROUP BY sectionnm
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  = :p_company
    AND        mov.company = :p_com
    AND        mov.finyear     = TO_CHAR(:p_date,'RRRR')
    AND        mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate      = :p_date 
    AND        info.otorg        = 'N'
    AND        mov.cardno    = info.cardno
    GROUP BY info.sectionnm 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company  = :p_company
    AND        info.company  = lea.company
    AND        :p_date BETWEEN start_date AND end_date 
    AND        info.otorg        = 'N'
    AND        lea.cardno      = info.cardno
    GROUP BY info.sectionnm
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND       a.sectionname  = c.sectionname(+)
ORDER BY a.sectionname ASC

----------------------




SELECT a.sectionname, a.totalcount ot_total_emp,  NVL(b.presentcount,0)ot_total_prsnt, NVL(c.leavecount,0) ot_total_lev, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0)) ot_total_absent
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active       = 0
    AND    otorg   = 'Y'
    GROUP BY sectionnm
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear      = TO_CHAR(:p_date,'RRRR')
    AND    mov.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate       =:p_date 
    AND    info.otorg   = 'Y'
    AND    mov.cardno   =info.cardno 
    GROUP BY info.sectionnm 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company  =:p_company
    AND    info.company    = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.otorg   = 'Y'
    AND    lea.cardno      = info.cardno 
    GROUP BY info.sectionnm
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND   a.sectionname  = c.sectionname(+)
ORDER BY a.sectionname ASC

-----------------------




SELECT a.totalcount total_emp, NVL(b.presentcount,0) total_prsnt ,NVL(c.leavecount,0) total_lev, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0)) total_absent
FROM 
    (SELECT COUNT(cardno) totalcount,company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active       = 0
    GROUP BY company
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,info.company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  =:p_company
    AND    mov.company   =:p_com
    AND    mov.finyear       = TO_CHAR(:p_date,'RRRR')
    AND    mov.finmonth    = RTRIM(TO_CHAR(:p_date,'Month')) 
    AND    mov.pdate        =:p_date 
    AND    mov.cardno      =info.cardno 
    GROUP BY info.company 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,info.company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company   =:p_company
    AND    info.company    = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    lea.cardno        = info.cardno
    GROUP BY info.company
    )c 
WHERE a.company  = b.company(+)
AND   a.company  = c.company(+)
