SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla, SUM(mon.nt_day)nt_day, SUM(sal.nt_bill_ch + sal.nt_bill_bk)nt_bill, COUNT(sal.cardno)total_emp
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  mon.company  = :p_company 
AND    sal.company     = per.company
AND    mon.company  = per.company   
AND    mon.finyear    = :p_year 
AND    mon.finmonth = :p_month 
AND    mon.finyear   = sal.finyear 
AND    mon.finmonth = sal.finmonth 
AND    (sal.nt_bill_ch + sal.nt_bill_bk)  > 0
AND    sal.cardno   =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC
 
 
 -------------
 
 
SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla, SUM(mon.tiffin_day)tiffin_day, SUM(sal.tiffin_bill_ch + sal.tiffin_bill_bk)tiffin_bill, COUNT(sal.cardno)total_emp
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  mon.company  = :p_company 
AND    sal.company     = per.company
AND    mon.company  = per.company   
AND    mon.finyear    = :p_year 
AND    mon.finmonth = :p_month 
AND    mon.finyear   = sal.finyear 
AND    mon.finmonth = sal.finmonth 
AND    (sal.tiffin_bill_ch + sal.tiffin_bill_bk)  > 0
AND    sal.cardno   =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

--------

SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla, SUM(mon.iftar_day)iftar_day, SUM(sal.iftar_bill_ch + sal.iftar_bill_bk)iftar_bill, COUNT(sal.cardno)total_emp
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  mon.company  = :p_company 
AND    sal.company     = per.company
AND    mon.company  = per.company   
AND    mon.finyear    = :p_year 
AND    mon.finmonth = :p_month 
AND    mon.finyear   = sal.finyear 
AND    mon.finmonth = sal.finmonth 
AND    (sal.iftar_bill_ch + sal.iftar_bill_bk)  > 0
AND    sal.cardno     =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

--------------



SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla, SUM(mon.dinner_day)dinner_day, SUM(sal.dinner_bill_ch + sal.dinner_bill_bk)dinner_bill, COUNT(sal.cardno)total_emp
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
WHERE  mon.company  = :p_company 
AND    sal.company     = per.company
AND    mon.company  = per.company   
AND    mon.finyear    = :p_year 
AND    mon.finmonth = :p_month 
AND    mon.finyear   = sal.finyear 
AND    mon.finmonth = sal.finmonth 
AND    (sal.dinner_bill_ch + sal.dinner_bill_bk)  > 0
AND    sal.cardno     =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

--------------



SELECT SUM(sal.BASICSAL_CH + sal.BASICSAL_BK)BASICSAL, SUM(sal.GROSSSAL_CH + GROSSSAL_BK)GROSSSAL,  
              sal.SECTIONNM, sal.SEC_BANGLA, SUM(mon.WK_HOLI_DUTY)WK_HOLI_DUTY, SUM(sal.WK_HOLI_BILL_CH + sal.WK_HOLI_BILL_BK)WK_HOLI_BILL, COUNT(sal.cardno)Total_Emp
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    sal.company     = per.company
AND    mon.company  = per.company   
AND    mon.finyear    = :p_year 
AND    mon.finmonth = :p_month 
AND    mon.finyear   = sal.finyear 
AND    mon.finmonth = sal.finmonth 
AND    (sal.WK_HOLI_BILL_CH + sal.WK_HOLI_BILL_BK)  > 0
AND    sal.cardno     =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.SECTIONNM, sal.SEC_BANGLA
ORDER BY sal.SECTIONNM ASC