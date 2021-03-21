SELECT a.deptname, a.totalcount total_emp, NVL(b.presentcount,0)prsnt_emp, NVL(c.leavecount,0)lev_emp, 
               NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))absent_emp
FROM 
          (SELECT COUNT(cardno) totalcount,NVL(departmentnm,'Not Define') deptname 
          FROM   TB_PERSONAL_INFO  
          WHERE  company = :p_company
          AND         active     = 0
          GROUP BY departmentnm)a, 
          (
         SELECT COUNT(mov.cardno) presentcount,NVL(info.departmentnm,'Not Define') deptname
         FROM   TB_DATA_MASTER mov,TB_PERSONAL_INFO info 
         WHERE  info.company   = :p_company
         AND    mov.company      = :p_com
         AND    mov.finyear          = TO_CHAR(:p_date,'RRRR')
         AND    mov.finmonth       = RTRIM(TO_CHAR(:p_date,'Month'))
         AND    mov.pdate           = :p_date 
         AND    mov.cardno         = info.cardno 
         GROUP BY info.departmentnm )b, 
         (
         SELECT COUNT(lea.cardno) leavecount,NVL(info.departmentnm,'Not Define') deptname 
         FROM   TB_LEAVE_DETAILINFO lea,TB_PERSONAL_INFO info 
         WHERE  info.company  =:p_company
         AND     info.company     = lea.company
         AND    :p_date  BETWEEN start_date AND end_date
         AND    lea.cardno          = info.cardno 
         GROUP BY info.departmentnm)c  
WHERE a.deptname  = b.deptname(+)
AND       a.deptname  = c.deptname(+)
ORDER BY a.deptname ASC