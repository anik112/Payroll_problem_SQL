SELECT a.sectionnm,a.lineno,a.desig_grp_name,NVL(a.totalemp,0)totalemp,NVL(b.per_limit,0)per_limit,
       NVL(c.prsntemp,0)prsntemp,NVL(d.leaveemp,0)leaveemp
FROM
    (SELECT per.sectionnm, per.lineno,COUNT(per.cardno)totalemp,auth.desig_grp_name 
    FROM   tb_personal_info per, tb_designation_auth auth
    WHERE  per.company =:p_company
    AND    per.sectionnm   = auth.sectionnm
    AND    per.lineno          = auth.lineno
    AND    per.active          = 0
    AND    per.designation = auth.designation
    AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section) 
    AND    per.floorno            LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno) 
    AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY per.sectionnm,per.lineno,auth.desig_grp_name
    )a,
    (SELECT auth.sectionnm,auth.lineno,auth.desig_grp_name,SUM(auth.person_limit)per_limit 
    FROM    tb_designation_auth auth
    GROUP BY auth.sectionnm,auth.lineno,auth.desig_grp_name
    )b,
    (SELECT per.sectionnm,per.lineno,auth.desig_grp_name,COUNT(mov.cardno)prsntemp 
    FROM   tb_data_master mov,tb_personal_info per , tb_designation_auth auth 
    WHERE  per.company  = :p_company 
    AND    mov.company    = :p_com
    AND    per.sectionnm    = auth.sectionnm
    AND    per.lineno           = auth.lineno
    AND    per.designation  = auth.designation
    AND    mov.finyear        = TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'RRRR')
    AND    mov.finmonth     = RTRIM(TO_CHAR(TO_DATE(:p_date,'dd/mm/rrrr'),'Month'))
    AND    mov.pdate         =:p_date 
    AND    mov.cardno       = per.cardno
    AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section) 
    AND    per.floorno            LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno) 
    AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY per.sectionnm,per.lineno,auth.desig_grp_name
    )c,
    (SELECT per.sectionnm,per.lineno,auth.desig_grp_name,COUNT(lea.cardno)leaveemp
    FROM   tb_leave_detailinfo lea,tb_personal_info per , tb_designation_auth auth
    WHERE  per.company  =:p_company
    AND    lea.company      = per.company
    AND    per.sectionnm    = auth.sectionnm
    AND    per.lineno           = auth.lineno
    AND    per.designation  = auth.designation
    AND    :p_date  BETWEEN start_date AND end_date
    AND    lea.cardno         = per.cardno 
    AND    per.departmentnm LIKE DECODE (NVL(:p_dept,'all'),'all','%',:p_dept)
    AND    per.sectionnm       LIKE DECODE (NVL(:p_section,'all'),'all','%',:p_section) 
    AND    per.floorno            LIKE DECODE (NVL(:p_floorno,'all'),'all','%',:p_floorno) 
    AND    per.shift                 LIKE DECODE (NVL(:p_shift,'all'),'all','%',:p_shift)
    GROUP BY per.sectionnm,per.lineno,auth.desig_grp_name
    )d
WHERE a.sectionnm        = b.sectionnm(+)
AND   a.lineno                   = b.lineno(+)
AND   a.desig_grp_name  = b.desig_grp_name(+)
AND   a.sectionnm            = c.sectionnm(+)
AND   a.lineno                   = c.lineno(+)
AND   a.desig_grp_name  = c.desig_grp_name(+)
AND   a.sectionnm            = d.sectionnm(+)
AND   a.lineno                   = d.lineno(+)
AND   a.desig_grp_name  = d.desig_grp_name(+)
ORDER BY a.sectionnm,a.lineno,a.desig_grp_name ASC