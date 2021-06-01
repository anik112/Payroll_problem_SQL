SELECT per.cardno,per.empname,per.designation,per.floorno,per.machineno,lev.leave_type,lev.start_date,
       lev.end_date,lev.reason,per.sectionnm,per.departmentnm ,lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  per.company    = :p_company 
AND    lev.company      = per.company
AND    lev.finyear       = :p_year
AND    lev.finmonth   = :p_month
AND    lev.cardno       = per.cardno
AND    per.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    per.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND    per.workertype       LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
AND    per.lineno               LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno) 
AND    per.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    per.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.cardno,levinfo.start_date ASC
