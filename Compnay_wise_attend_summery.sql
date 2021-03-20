SELECT a.company, a.totalcount total_emp, NVL(b.presentcount,0)prsnt_emp, NVL(c.leavecount,0)lev_emp,
              NVL(a.totalcount,0) -(NVL(b.presentcount,0) +NVL(c.leavecount,0))absent
FROM
         (SELECT COUNT(cardno) totalcount,company 
         FROM     TB_PERSONAL_INFO
         WHERE  active  = 0
         GROUP BY company
         )a,
         (SELECT COUNT(mov.cardno) presentcount,info.company 
         FROM   TB_DATA_MASTER mov, TB_PERSONAL_INFO info, TB_COMPANY_INFO com
         WHERE info.company = com.company
         AND      mov.company = com.comid
         AND      mov.finyear     = TO_CHAR(:p_date,'RRRR')
         AND      mov.finmonth  = RTRIM(TO_CHAR(:p_date,'Month'))
         AND      mov.pdate      = :p_date
         AND      mov.cardno    = info.cardno
         GROUP BY info.company 
         )b,
         (SELECT COUNT(lea.cardno) leavecount,info.company 
         FROM TB_LEAVE_DETAILINFO lea,TB_PERSONAL_INFO info
         WHERE  info.company = lea.company
         AND        :p_date BETWEEN start_date AND end_date
         AND        lea.cardno  =  info.cardno
         GROUP BY info.company 
         )c
WHERE a.company  = b.company(+)
AND       a.company  = c.company(+)
ORDER BY a.company ASC