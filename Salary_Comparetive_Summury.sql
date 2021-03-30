--------------Current year  ---


SELECT COUNT(sal.cardno)total_emp_cur, sal.sectionnm sectionnm_cur, sal.sec_bangla sec_bangla_cur, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal_cur, 
               SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal_cur, 
               SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded_cur,  
               SUM(sal.netwages_ch + sal.netwages_bk)netwages_cur, 
               SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus_cur,SUM(mon.sal_ot_hr)sal_ot_hr_cur,   
               SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt_cur,  
               SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance_cur,  
               SUM(sal.stamp_ch + sal.stamp_bk)stamp_cur,  SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment_cur, 
               SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd_cur
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  per.company = :p_company 
AND    sal.company     = per.company 
AND    mon.company  = per.company 
AND    mon.finyear      =  :p_year 
AND    mon.finmonth   =  :p_month 
AND    mon.finyear      =  sal.finyear 
AND    mon.finmonth   =  sal.finmonth 
AND    (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND    sal.cardno       =  per.cardno 
AND    mon.cardno     =  per.cardno 
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


-----------------  Prv year salary 

SELECT COUNT(sal.cardno)total_emp_prv, sal.sectionnm sectionnm_prv, sal.sec_bangla sec_bangla_prv, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal_prv, 
               SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal_prv, 
               SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded_prv,  
               SUM(sal.netwages_ch + sal.netwages_bk)netwages_prv, 
               SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus_prv,SUM(mon.sal_ot_hr)sal_ot_hr_prv,   
               SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt_prv,  
               SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance_prv,  
               SUM(sal.stamp_ch + sal.stamp_bk)stamp_prv,  SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment_prv, 
               SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd_prv
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  per.company  = :p_company 
AND    sal.company  = per.company 
AND    mon.company  = per.company 
AND    mon.finyear  =  :pre_year
AND    mon.finmonth =  :pre_month 
AND    mon.finyear  =  sal.finyear 
AND    mon.finmonth =  sal.finmonth 
AND    (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND    sal.cardno   =  per.cardno 
AND    mon.cardno   =  per.cardno 
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


------------------------ Differients   sal


SELECT a.sectionnm, (a.netwages - b.netwages_prv)netwages_diff, (a.sal_ot_hr - b.sal_ot_hr_prv)sal_ot_hr_diff,
               (a.sal_ot_amt - b.sal_ot_amt_prv)sal_ot_amt_diff, (a.netpayment_rd - b.netpayment_rd_prv)netpayment_rd_diff
FROM
    (SELECT COUNT(sal.cardno)total_emp, sal.sectionnm, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal, 
    SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, 
    SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded,  
    SUM(sal.netwages_ch + sal.netwages_bk)netwages, 
    SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus,SUM(mon.sal_ot_hr)sal_ot_hr,   
    SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt,  
    SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance,  
    SUM(sal.stamp_ch + sal.stamp_bk)stamp,  SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment, 
    SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd
    FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
    WHERE  per.company  = :p_company 
    AND    sal.company  = per.company 
    AND    mon.company  = per.company 
    AND    mon.finyear  =  :p_year 
    AND    mon.finmonth =  :p_month 
    AND    mon.finyear  =  sal.finyear 
    AND    mon.finmonth =  sal.finmonth 
    AND    (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
    AND    sal.cardno   =  per.cardno 
    AND    mon.cardno   =  per.cardno 
    GROUP BY sal.sectionnm
    )a,
    (SELECT COUNT(sal.cardno)total_emp_prv, sal.sectionnm sectionnm_prv, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal_prv, 
    SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal_prv, 
    SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded_prv,  
    SUM(sal.netwages_ch + sal.netwages_bk)netwages_prv, 
    SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus_prv,SUM(mon.sal_ot_hr)sal_ot_hr_prv,   
    SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt_prv,  
    SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance_prv,  
    SUM(sal.stamp_ch + sal.stamp_bk)stamp_prv,  SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment_prv, 
    SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd_prv
    FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
    WHERE  per.company  = :p_company 
    AND    sal.company  = per.company 
    AND    mon.company  = per.company 
    AND    mon.finyear  =  :pre_year
    AND    mon.finmonth =  :pre_month 
    AND    mon.finyear  =  sal.finyear 
    AND    mon.finmonth =  sal.finmonth 
    AND    (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
    AND    sal.cardno   =  per.cardno 
    AND    mon.cardno   =  per.cardno 
    GROUP BY sal.sectionnm
    )b
WHERE a.sectionnm = b.sectionnm_prv(+)
ORDER BY sectionnm ASC