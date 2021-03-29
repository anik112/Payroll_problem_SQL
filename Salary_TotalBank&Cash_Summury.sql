SELECT COUNT(sal.cardno)total_emp, sal.sectionnm, sal.sec_bangla, SUM(sal.grosssal_ch + sal.grosssal_bk)grosssal, SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, 
               SUM(sal.total_absent_ded_ch + sal.total_absent_ded_bk)total_absent_ded,  
               SUM(sal.netwages_ch + sal.netwages_bk)netwages, SUM(sal.netwages_ch)netwages_ch, SUM(sal.netwages_bk)netwages_bk,
               SUM(sal.attbonus_ch+sal.attbonus_bk)attbonus,  SUM(sal.attbonus_ch)attbonus_ch,  SUM(sal.attbonus_bk)attbonus_bk,  
               SUM(mon.sal_ot_hr)sal_ot_hr,   SUM(sal.total_benefit_ch + sal.total_benefit_bk)total_benefit,
               SUM(sal.sal_ot_amt_ch + sal.sal_ot_amt_bk)sal_ot_amt, SUM(sal.sal_ot_amt_ch)sal_ot_amt_ch, SUM(sal.sal_ot_amt_bk)sal_ot_amt_bk, 
               SUM(sal.arrear_amt_ch + sal.arrear_amt_bk)arrear_amt, SUM(sal.arrear_amt_ch)arrear_amt_ch, SUM(sal.arrear_amt_bk)arrear_amt_bk, 
               SUM(sal.netpayable_ch + sal.netpayable_bk)netpayable,  SUM(sal.netpayable_ch)netpayable_ch, SUM(sal.netpayable_bk)netpayable_bk,
               SUM(sal.advance_amt_ch + sal.advance_amt_bk)advance, SUM(sal.adv_sal_ch + sal.adv_sal_bk)adv_sal,  
               SUM(sal.advance_amt_ch + sal.adv_sal_ch + sal.advance_amt_bk+sal.adv_sal_bk)total_advance,  SUM(sal.advance_amt_ch + sal.adv_sal_ch)total_advance_ch, SUM(sal.advance_amt_bk + sal.adv_sal_bk)total_advance_bk,
               SUM(sal.stamp_ch + sal.stamp_bk)stamp,  SUM(sal.stamp_ch)stamp_ch,  SUM(sal.stamp_bk)stamp_bk,  
               SUM(sal.netpayment_ch + sal.netpayment_bk)netpayment, 
               SUM(sal.netpayment_ch_rd + sal.netpayment_bk_rd)netpayment_rd,SUM(sal.netpayment_ch_rd)netpayment_rd_ch, SUM(sal.netpayment_bk_rd)netpayment_rd_bk
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  per.company  = :p_company 
AND       sal.company        = per.company 
AND       mon.company     = per.company 
AND       mon.finyear       =  :p_year 
AND       mon.finmonth    =  :p_month 
AND       mon.finyear       =  sal.finyear 
AND       mon.finmonth    =  sal.finmonth 
AND       (sal.netpayment_ch_rd + sal.netpayment_bk_rd) > 0 
AND       sal.cardno        =  per.cardno 
AND       mon.cardno     =  per.cardno 
AND       sal.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND       sal.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND       per.workertype      LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND       sal.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND       sal.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND       sal.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno) 
AND       per.cash_type       LIKE DECODE(NVL(:p_payment_type,'all'),'all','%',:p_payment_type) 
AND       per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND       per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND       sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND       sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND       per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm,sal.sec_bangla 
ORDER BY sal.sectionnm ASC