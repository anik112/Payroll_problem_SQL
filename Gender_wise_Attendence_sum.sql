SELECT a.company, a.totalcount total_emp, NVL(b.presentcount,0)prsnt_emp, NVL(c.leavecount,0)lev_emp,
              NVL(a.totalcount,0)-(NVL(b.presentcount,0) +NVL(c.leavecount,0))absent_emp , a.gender
FROM
          (SELECT COUNT(cardno) totalcount,company ,gender
          FROM   tb_personal_info 
          WHERE  active = 0
          GROUP BY company,gender
          )a,
          (SELECT COUNT(mov.cardno) presentcount,info.company ,info.gender
          FROM   tb_data_master mov,tb_personal_info info, tb_company_info com
          WHERE  info.company = com.company
          AND    mov.company    = com.comid 
          AND    mov.finyear        = TO_CHAR(:p_date,'RRRR')
          AND    mov.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
          AND    mov.pdate         = :p_date
          AND    mov.cardno       = info.cardno
          GROUP BY info.company,info.gender 
          )b,
          (SELECT COUNT(lea.cardno) leavecount,info.company ,info.gender 
          FROM tb_leave_detailinfo lea,tb_personal_info info
          WHERE  info.company  = lea.company 
          AND    :p_date BETWEEN start_date AND end_date
          AND    lea.cardno    = info.cardno
          GROUP BY info.company,info.gender
          )c
WHERE a.company  = b.company(+)
AND   a.company  = c.company(+)
AND   a.gender   = b.gender(+)
AND   a.gender   = c.gender (+) 
ORDER BY a.company ASC