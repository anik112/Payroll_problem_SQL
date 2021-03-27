SELECT NVL(a.total_emp,0)total_emp,NVL(b.total_staff,0)total_staff,NVL(c.total_worker,0)total_worker,
       NVL(d.total_opr,0)total_opr,NVL(e.total_opr_jr,0)total_opr_jr,NVL(f.total_hlp,0)total_hlp,
	   NVL(g.leave_total,0)leave_total, NVL(h.leave_staff,0)leave_staff, NVL(i.leave_worker,0)leave_worker,
	   NVL(j.leave_opr,0)leave_opr, NVL(k.leave_opr_jr,0)leave_opr_jr, NVL(l.leave_hlp,0)leave_hlp,
	   NVL(m.present_total,0)present_total, NVL(n.present_staff,0)present_staff, NVL(o.present_worker,0)present_worker,
	   NVL(p.present_opr,0)present_opr, NVL(q.present_opr_jr,0)present_opr_jr, NVL(r.present_hlp,0)present_hlp,
	   (NVL(a.total_emp,0) - (NVL(g.leave_total,0) + NVL(m.present_total,0)))absent_total,
	   (NVL(b.total_staff,0) - (NVL(h.leave_staff,0) + NVL(n.present_staff,0)))absent_staff,
	   (NVL(c.total_worker,0) - (NVL(i.leave_worker,0) + NVL(o.present_worker,0)))absent_worker,
	   (NVL(d.total_opr,0) - (NVL(j.leave_opr,0) + NVL(p.present_opr,0)))absent_opr,
	   (NVL(e.total_opr_jr,0) - (NVL(k.leave_opr_jr,0) + NVL(q.present_opr_jr,0)))absent_opr_jr,	   
	   (NVL(f.total_hlp,0) - (NVL(l.leave_hlp,0) + NVL(r.present_hlp,0)))absent_hlp
FROM 
    (SELECT COUNT(cardno) total_emp,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    GROUP BY company
    )a,
    (SELECT COUNT(cardno) total_staff,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    otorg   = 'N'
    GROUP BY company
    )b,
    (SELECT COUNT(cardno) total_worker,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    otorg   = 'Y'
    GROUP BY company
    )c,  
    (SELECT COUNT(cardno) total_opr,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    salary_grade IN ('1','2')
    GROUP BY company
    )d,
    (SELECT COUNT(cardno) total_opr_jr,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    salary_grade IN ('3','4','5','6')
    GROUP BY company
    )e,
    (SELECT COUNT(cardno) total_hlp,NVL(company,'Not Define')company 
    FROM   tb_personal_info 
    WHERE  company =:p_company
    AND    active  = 0
    AND    salary_grade = '7'
    GROUP BY company
    )f,
    (SELECT COUNT(lea.cardno) leave_total,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND     :p_date BETWEEN start_date AND end_date
    AND    lea.cardno   = info.cardno
    GROUP BY info.company
    )g,
    (SELECT COUNT(lea.cardno) leave_staff,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND     :p_date BETWEEN start_date AND end_date
    AND    info.otorg   = 'N'
    AND    lea.cardno   = info.cardno
    GROUP BY info.company
    )h,
    (SELECT COUNT(lea.cardno) leave_worker,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.otorg   = 'Y'
    AND    lea.cardno   = info.cardno
    GROUP BY info.company
    )i,
    (SELECT COUNT(lea.cardno) leave_opr,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.salary_grade IN ('1','2')
    AND    lea.cardno   = info.cardno
    GROUP BY info.company
    )j,
    (SELECT COUNT(lea.cardno) leave_opr_jr,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.salary_grade IN ('3','4','5','6')
    AND    lea.cardno   = info.cardno
    GROUP BY info.company
    )k,
    (SELECT COUNT(lea.cardno) leave_hlp,NVL(info.company,'Not Define') company 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.salary_grade = '7'
    AND    lea.cardno   = info.cardno
    GROUP BY info.company
    )l,
    (SELECT COUNT(DISTINCT mov.cardno) present_total,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    mov.cardno   =info.cardno 
    GROUP BY info.company
    )m,
    (SELECT COUNT(DISTINCT mov.cardno) present_staff,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.otorg   = 'N'
    AND    mov.cardno   = info.cardno 
    GROUP BY info.company
    )n,
    (SELECT COUNT(DISTINCT mov.cardno) present_worker,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.otorg   = 'Y'
    AND    mov.cardno   = info.cardno 
    GROUP BY info.company
    )o,
    (SELECT COUNT(DISTINCT mov.cardno) present_opr,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.salary_grade IN ('1','2')
    AND    mov.cardno   =info.cardno 
    GROUP BY info.company
    )p,
    (SELECT COUNT(DISTINCT mov.cardno) present_opr_jr,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.salary_grade IN ('3','4','5','6')
    AND    mov.cardno   =info.cardno 
    GROUP BY info.company
    )q,
    (SELECT COUNT(DISTINCT mov.cardno) present_hlp,NVL(info.company,'Not Define') company 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(:p_date,'RRRR') 
    AND    mov.finmonth = RTRIM(TO_CHAR(:p_date,'Month'))
    AND    mov.pdate    = :p_date 
    AND    info.salary_grade = '7'
    AND    mov.cardno   = info.cardno 
    GROUP BY info.company
    )r
WHERE a.company = b.company(+)
AND   a.company = c.company(+)
AND   a.company = d.company(+)
AND   a.company = e.company(+)
AND   a.company = f.company(+)
AND   a.company = g.company(+)
AND   a.company = h.company(+)
AND   a.company = i.company(+)
AND   a.company = j.company(+)
AND   a.company = k.company(+)
AND   a.company = l.company(+)
AND   a.company = m.company(+)
AND   a.company = n.company(+)
AND   a.company = o.company(+)
AND   a.company = p.company(+)
AND   a.company = q.company(+)
AND   a.company = r.company(+)
