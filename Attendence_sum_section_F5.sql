SELECT a.sectionname, a.designation, a.totalcount total_emp,NVL(b.presentcount,0) total_prsnt,NVL(c.leavecount,0) total_leave, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absent,
       NVL(ROUND((b.presentcount*100)/a.totalcount,2),0)PERCENT 
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname, NVL(designation,'Not Define') designation  
    FROM   tb_personal_info 
    WHERE  company      =:p_company
    AND    active       = 0
    AND    sectionnm    <> 'Sewing'
    AND    otorg = 'Y'
    GROUP BY sectionnm, designation
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname ,NVL(info.designation,'Not Define') designation 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
    AND    mov.finmonth = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.sectionnm    <> 'Sewing'
    AND    info.otorg = 'Y'
    AND    mov.cardno   =info.cardno 
    GROUP BY info.sectionnm, info.designation 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname ,NVL(info.designation,'Not Define') designation 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.sectionnm    <> 'Sewing'
    AND    info.otorg = 'Y'
    AND    lea.cardno   = info.cardno
    GROUP BY info.sectionnm , info.designation
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND   a.sectionname  = c.sectionname(+)
AND   a.designation  = b.designation(+)
AND   a.designation  = c.designation(+)
ORDER BY a.sectionname, a.designation ASC









--------------------------






SELECT a.sectionname sectionname_sew, a.lineno lineno_sew, a.totalcount total_emp_sew,NVL(b.presentcount,0) total_prsnt_sew,NVL(c.leavecount,0) total_leave_sew, 
       NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absent_sew,
       NVL(ROUND((b.presentcount*100)/a.totalcount,2),0)percent_sew 
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname, NVL(lineno,'Not Define') lineno  
    FROM   tb_personal_info 
    WHERE  company      =:p_company
    AND    active       = 0
    AND    sectionnm    = 'Sewing'
    AND    otorg = 'Y'
    GROUP BY sectionnm, lineno
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname ,NVL(info.lineno,'Not Define') lineno 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
    AND    mov.finmonth = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.sectionnm    = 'Sewing'
    AND    info.otorg = 'Y'
    AND    mov.cardno   =info.cardno 
    GROUP BY info.sectionnm, info.lineno 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname ,NVL(info.lineno,'Not Define') lineno 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.sectionnm    = 'Sewing'
    AND    info.otorg = 'Y'
    AND    lea.cardno   = info.cardno
    GROUP BY info.sectionnm , info.lineno
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND   a.sectionname  = c.sectionname(+)
AND   a.lineno  = b.lineno(+)
AND   a.lineno  = c.lineno(+)
ORDER BY a.sectionname, a.lineno ASC



-------------------------------------





SELECT a.sectionname sectionname_st, a.designation designation_st, a.totalcount total_emp_st,
     NVL(b.presentcount,0) total_prsnt_st,NVL(c.leavecount,0) total_leave_st, 
     NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))total_absent_st,
     NVL(ROUND((b.presentcount*100)/a.totalcount,2),0)percent_st 
FROM 
    (SELECT COUNT(cardno) totalcount,NVL(sectionnm,'Not Define') sectionname, NVL(designation,'Not Define') designation  
    FROM   tb_personal_info 
    WHERE  company      =:p_company
    AND    active       = 0
    AND    otorg = 'N'
    GROUP BY sectionnm, designation
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount,NVL(info.sectionnm,'Not Define') sectionname ,NVL(info.designation,'Not Define') designation 
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear  = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
    AND    mov.finmonth = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND    mov.pdate    =:p_date 
    AND    info.otorg = 'N'
    AND    mov.cardno   =info.cardno 
    GROUP BY info.sectionnm, info.designation 
    )b, 
    (SELECT COUNT(lea.cardno) leavecount,NVL(info.sectionnm,'Not Define') sectionname ,NVL(info.designation,'Not Define') designation 
    FROM   tb_leave_detailinfo lea,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    info.company = lea.company
    AND    :p_date BETWEEN start_date AND end_date
    AND    info.otorg = 'N'
    AND    lea.cardno   = info.cardno
    GROUP BY info.sectionnm , info.designation
    )c 
WHERE a.sectionname  = b.sectionname(+)
AND   a.sectionname  = c.sectionname(+)
AND   a.designation  = b.designation(+)
AND   a.designation  = c.designation(+)
ORDER BY a.sectionname, a.designation ASC


------------------------------------------



SELECT a.hp_emp, a.hp, b.op_emp, b.op, c.ir_emp, c.ir, d.pr_emp, d.pr, e.hp_emp_v, f.op_emp_v, g.ir_emp_v, h.pr_emp_v
FROM 
    (SELECT COUNT(cardno)hp_emp ,'HP' hp  
    FROM   tb_personal_info 
    WHERE  company       = :p_company
    AND    joining_date    = :p_date
    AND    active              = 0
    AND    sectionnm  = 'Sewing'
    AND    otorg          = 'Y'
    AND    designation = 'Operator Asst.')
    a,
    (SELECT COUNT(cardno)op_emp ,'OP' op  
    FROM   tb_personal_info 
    WHERE  company       = :p_company
    AND    joining_date   = :p_date
    AND    active            = 0
    AND    sectionnm = 'Sewing'
    AND    otorg         = 'Y'
    AND    designation IN ('Operator','Jr. Operator','Gr. Operator','Sr.Operator'))
    b,
    (SELECT COUNT(cardno)ir_emp ,'IR' ir  
    FROM   tb_personal_info 
    WHERE  company        = :p_company
    AND    joining_date   = :p_date
    AND    active             = 0
    AND    sectionnm = 'Sewing'
    AND    otorg         = 'Y'
    AND    designation IN ('L. Iron Woman','L. Ironman'))
    c,
    (SELECT COUNT(cardno)pr_emp,'In/PR' pr  
    FROM   tb_personal_info 
    WHERE  company       = :p_company
    AND    joining_date   = :p_date
    AND    active             = 0
    AND    sectionnm = 'Sewing'
    AND    otorg         = 'Y'
    AND    designation IN ('Inputman','Input Receiver','Asst. Production Recorder'))
    d,
    (SELECT COUNT(cardno)hp_emp_v   
    FROM   tb_personal_info 
    WHERE  company      = :p_company
    AND    joining_date   = :pp_date
    AND    active            = 0
    AND    sectionnm = 'Sewing'
    AND    otorg     = 'Y'
    AND    designation = 'Operator Asst.')
    e,
    (SELECT COUNT(cardno)op_emp_v   
    FROM   tb_personal_info 
    WHERE  company      = :p_company
    AND    joining_date   = :pp_date
    AND    active            = 0
    AND    sectionnm = 'Sewing'
    AND    otorg     = 'Y'
    AND    designation IN ('Operator','Jr. Operator','Gr. Operator','Sr.Operator'))
    f,
    (SELECT COUNT(cardno)ir_emp_v   
    FROM   tb_personal_info 
    WHERE  company        = :p_company
    AND    joining_date   = :pp_date
    AND    active    = 0
    AND    sectionnm = 'Sewing'
    AND    otorg     = 'Y'
    AND    designation IN ('L. Iron Woman','L. Ironman'))
    g,
    (SELECT COUNT(cardno)pr_emp_v  
    FROM   tb_personal_info 
    WHERE  company        = :p_company
    AND    joining_date   = :pp_date
    AND    active    = 0
    AND    sectionnm = 'Sewing'
    AND    otorg     = 'Y'
    AND    designation IN ('Inputman','Input Receiver','Asst. Production Recorder'))
    h
	
	
	
	----------------------------------------------------
	
	
	
SELECT a.totalcount sum_total_emp,NVL(b.presentcount,0) sum_total_prsnt,  
      (NVL(a.totalcount,0) - NVL(b.presentcount,0))sum_total_absent,
      NVL(ROUND((b.presentcount*100)/a.totalcount,2),0)sum_prsnt_percent,
      ROUND(((NVL(a.totalcount,0) - NVL(b.presentcount,0)) *100)/a.totalcount,2) sum_absnt_percent    
FROM 
    (SELECT COUNT(cardno) totalcount  
    FROM   tb_personal_info 
    WHERE  company  =:p_company
    AND    active        = 0
    )a, 
    (SELECT COUNT(DISTINCT mov.cardno) presentcount  
    FROM   tb_data_master mov,tb_personal_info info 
    WHERE  info.company =:p_company
    AND    mov.company  =:p_com
    AND    mov.finyear     = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'rrrr')
    AND    mov.finmonth  = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND    mov.pdate     =:p_date 
    AND    mov.cardno   =info.cardno 
    )b
	
	
	
	
	-----------------------------------
	
SELECT  a.card_a, a.worker_a, b.card_b, b.worker_b, c.worker_c
FROM 
    (SELECT COUNT(cardno)card_a, workertype worker_a
    FROM   tb_personal_info
    WHERE  company        = :p_company
    AND    joining_date   = :p_date
    AND    active         = 0
    GROUP BY workertype
    ORDER BY workertype ASC
    )a,
    (SELECT COUNT(cardno)card_b, workertype worker_b
    FROM   tb_personal_info
    WHERE  company        = :p_company
    AND    joining_date   = :pp_date 
    AND    active         = 0
    GROUP BY workertype
    ORDER BY workertype ASC
    )b,
    (SELECT COUNT(cardno)card_a, workertype worker_c
    FROM   tb_personal_info
    WHERE  company        = :p_company
    AND    active         = 0
    GROUP BY workertype
    ORDER BY workertype ASC
    )c
WHERE c.worker_c = a.worker_a(+)
AND   c.worker_c = b.worker_b(+)
ORDER BY c.worker_c ASC