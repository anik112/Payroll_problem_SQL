SELECT a.designation,NVL(a.totalcount,0)total_emp , NVL(b.presentcount,0)total_prsnt , NVL(c.leavecount,0) total_lev,
          NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0)) total_absnt
FROM 
      (SELECT COUNT(cardno) totalcount,NVL(designation,'Not Define ***')designation  
FROM   TB_PERSONAL_INFO 
WHERE  company    =:p_company
AND      active        = 0
GROUP BY designation)a, 
(
SELECT COUNT(mov.cardno) presentcount,NVL(info.designation,'Not Define ***') designation 
FROM   TB_DATA_MASTER mov,TB_PERSONAL_INFO info 
WHERE  info.company  =:p_company
AND    mov.company   =:p_com
AND    mov.finyear       = TO_CHAR(:p_date,'rrrr')
AND    mov.finmonth    = RTRIM(TO_CHAR(:p_date,'Month'))
AND    mov.pdate        =:p_date 
AND    mov.cardno      =info.cardno 
GROUP BY info.designation )b, 
(
SELECT COUNT(lea.cardno) leavecount,NVL(info.designation,'Not Define ***') designation 
FROM   TB_LEAVE_DETAILINFO lea,TB_PERSONAL_INFO info 
WHERE  info.company   =:p_company
AND     info.company    = lea.company
AND     :p_date  BETWEEN start_date AND end_date
AND    lea.cardno              = info.cardno 
GROUP BY info.designation)c 
WHERE a.designation  = b.designation(+)
AND   a.designation  = c.designation(+)
ORDER BY a.designation ASC