SELECT a.sectionname,a.totalcount total_emp , NVL(b.presentcount,0)total_prsnt, NVL(c.leavecount,0)total_lev, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absnt
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname 
    FROM   tb_personal_info 
    WHERE  company = :p_company
    AND        active      = 0
    GROUP BY sectionnm
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  = :p_company
    AND        mov.company = :p_com
    AND        mov.finyear     = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate      = :p_date 
    AND        mov.cardno    = info.cardno 
    GROUP BY info.sectionnm 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company  =:p_company
    AND        info.company  = lea.company
    AND        :p_date BETWEEN start_date AND end_date
    AND        lea.cardno      = info.cardno
    GROUP BY info.sectionnm
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND       a.sectionname  = c.sectionname(+)
ORDER BY a.sectionname ASC


-------------



SELECT ROUND(SUM(mas.otmin/60))OTHR,info.sectionnm 
FROM   TB_DATA_MASTER mas, tb_personal_info info
WHERE  info.company  =:p_company
AND    mas.company   =:p_com
AND    mas.finyear       = TO_CHAR(:pp_date,'RRRR') 
AND    mas.finmonth    = RTRIM(TO_CHAR(:pp_date,'Month'))
AND    mas.pdate        =:pp_date
AND    mas.cardno      = info.cardno
GROUP BY info.sectionnm

------------------------------





SELECT NVL(a.total_emp,0)total_emp,NVL(b.total_staff,0)total_staff,NVL(c.total_worker,0)total_worker,
               NVL(d.total_opr,0)total_opr,NVL(e.total_hlp,0)total_hlp,NVL(f.leave_total,0)leave_total,
               NVL(g.leave_staff,0)leave_staff,
               NVL(h.leave_worker,0)leave_worker,NVL(i.leave_opr,0)leave_opr,NVL(j.leave_hlp,0)leave_hlp,
               NVL(k.present_total,0)present_total,NVL(l.present_staff,0)present_staff,NVL(m.present_worker,0)present_worker,
               NVL(n.present_opr,0)present_opr,NVL(o.present_hlp,0)present_hlp,
               (NVL(a.total_emp,0) - (NVL(f.leave_total,0) + NVL(k.present_total,0)))absent_total,
               (NVL(b.total_staff,0) - (NVL(g.leave_staff,0) + NVL(l.present_staff,0)))absent_staff,
               (NVL(c.total_worker,0) - (NVL(h.leave_worker,0) + NVL(m.present_worker,0)))absent_worker,
               (NVL(d.total_opr,0) - (NVL(i.leave_opr,0) + NVL(n.present_opr,0)))absent_opr,
               (NVL(e.total_hlp,0) - (NVL(j.leave_hlp,0) + NVL(o.present_hlp,0)))absent_hlp
FROM 
    (SELECT COUNT(cardno) total_emp,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND       active       = 0
    GROUP BY company
    )a,
    (SELECT COUNT(cardno) total_staff,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND       active       = 0
    AND       otorg         = 'N'
    GROUP BY company
    )b,
    (SELECT COUNT(cardno) total_worker,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND        active      = 0
    AND        otorg        = 'Y'
    GROUP BY company
    )c,  
    (SELECT COUNT(cardno) total_opr,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND        active      = 0
    AND        designation IN ('Gr. Operator','Jr. Operator','Operator','Sr.Operator')
    GROUP BY company
    )d,
    (SELECT COUNT(cardno) total_hlp,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND        active      = 0
    AND        designation IN ('Cutting Asst.','Finishing Asst.','Operator Asst.')
    GROUP BY company
    )e,
    (SELECT COUNT(lea.cardno) leave_total,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND        info.company = lea.company
    AND        :p_date BETWEEN lea.start_date AND lea.end_date
    AND       lea.cardno      = info.cardno
    GROUP BY info.company
    )f,
    (SELECT COUNT(lea.cardno) leave_staff,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND        info.company = lea.company
    AND        :p_date BETWEEN lea.start_date AND lea.end_date
    AND        info.otorg       = 'N'
    AND        lea.cardno     = info.cardno
    GROUP BY info.company
    )g,
    (SELECT COUNT(lea.cardno) leave_worker,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND        info.company = lea.company
    AND        :p_date BETWEEN lea.start_date AND lea.end_date
    AND        info.otorg       = 'Y'
    AND       lea.cardno      = info.cardno
    GROUP BY info.company
    )h,
    (SELECT COUNT(lea.cardno) leave_opr,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND        info.company = lea.company
    AND        :p_date BETWEEN lea.start_date AND lea.end_date
    AND        info.designation IN ('Gr. Operator','Jr. Operator','Operator','Sr.Operator')
    AND        lea.cardno      = info.cardno
    GROUP BY info.company
    )i,
    (SELECT COUNT(lea.cardno) leave_hlp,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND        info.company = lea.company
    AND        :p_date BETWEEN lea.start_date AND lea.end_date
    AND        info.designation IN ('Cutting Asst.','Finishing Asst.','Operator Asst.')
    AND        lea.cardno     = info.cardno
    GROUP BY info.company
    )j,
    (SELECT COUNT(DISTINCT mov.cardno) present_total,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  =:p_company
    AND        mov.company =:p_com
    AND        mov.finyear     = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate      = :p_date 
    AND        mov.cardno    = info.cardno 
    GROUP BY info.company
    )k,
    (SELECT COUNT(DISTINCT mov.cardno) present_staff,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  =:p_company
    AND        mov.company =:p_com
    AND        mov.finyear     = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate      = :p_date 
    AND        info.otorg        = 'N'
    AND        mov.cardno    = info.cardno 
    GROUP BY info.company
    )l,
    (SELECT COUNT(DISTINCT mov.cardno) present_worker,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company   = :p_company
    AND        mov.company  =:p_com
    AND        mov.finyear      = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate       = :p_date 
    AND        info.otorg         = 'Y'
    AND        mov.cardno     = info.cardno 
    GROUP BY info.company
    )m,
    (SELECT COUNT(DISTINCT mov.cardno) present_opr,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  = :p_company
    AND        mov.company = :p_com
    AND        mov.finyear     = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate      = :p_date 
    AND        info.designation IN ('Gr. Operator','Jr. Operator','Operator','Sr.Operator')
    AND        mov.cardno    = info.cardno 
    GROUP BY info.company
    )n,
    (SELECT COUNT(DISTINCT mov.cardno) present_hlp,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company  =:p_company
    AND        mov.company =:p_com
    AND        mov.finyear     = TO_CHAR(:p_date,'RRRR') 
    AND        mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
    AND        mov.pdate      = :p_date 
    AND        info.designation IN ('Cutting Asst.','Finishing Asst.','Operator Asst.')
    AND        mov.cardno    = info.cardno 
    GROUP BY info.company
    )o
WHERE a.company = b.company(+)
AND       a.company = c.company(+)
AND       a.company = d.company(+)
AND       a.company = e.company(+)
AND       a.company = f.company(+)
AND       a.company = g.company(+)
AND       a.company = h.company(+)
AND       a.company = i.company(+)
AND       a.company = j.company(+)
AND       a.company = k.company(+)
AND       a.company = l.company(+)
AND       a.company = m.company(+)
AND       a.company = n.company(+)
AND       a.company = o.company(+)


---------------------------------





SELECT NVL(a.total_new,0)total_new,NVL(b.total_l_new,0)total_l_new,NVL(c.total_p_new,0)total_p_new,
	   (NVL(a.total_new,0) - (NVL(b.total_l_new,0) + NVL(c.total_p_new,0)))total_a_new,
	   a.sectionnm, a.designation
FROM 
    (SELECT COUNT(cardno)total_new,NVL(sectionnm,'N/A')sectionnm,NVL(designation,'N/A')designation  
    FROM   tb_personal_info 
    WHERE  company = :p_company
    AND        active      = 0
    AND        otorg        = 'Y'
    GROUP BY sectionnm,designation
    ORDER BY sectionnm,designation
    )a,
    (SELECT COUNT(lea.cardno)total_l_new,NVL(info.sectionnm,'N/A')sectionnm,NVL(info.designation,'N/A')designation 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company     = :p_company
    AND        info.company     = lea.company
    AND        :p_date BETWEEN start_date AND end_date
    AND        info.otorg           = 'Y'
    AND        lea.cardno         = info.cardno
    GROUP BY info.sectionnm,info.designation
    )b,
    (SELECT COUNT(DISTINCT mov.cardno)total_p_new,NVL(info.sectionnm,'N/A')sectionnm,NVL(info.designation,'N/A')designation
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company = :p_company
    AND    mov.company    = :p_com
    AND    mov.finyear        = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate         = :p_date 
    AND    info.otorg           = 'Y'
    AND    mov.cardno       = info.cardno 
    GROUP BY info.sectionnm,info.designation
    )c
WHERE a.sectionnm = b.sectionnm(+)
AND       a.sectionnm = c.sectionnm(+)
AND       a.designation = b.designation(+)
AND       a.designation = c.designation(+)