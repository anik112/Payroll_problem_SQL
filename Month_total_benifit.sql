SELECT sal.cardno, sal.empname, sal.enmname_bangla, sal.designation, sal.designation_ban,  
       (sal.basicsal_ch + sal.basicsal_bk)basicsal, (sal.grosssal_ch + grosssal_bk)grosssal,  
       sal.departmentnm,  sal.dept_bangla,  sal.lineno, sal.sectionnm, sal.sec_bangla, sal.otrate, per.joining_date, per.shift,
       mon.nt_day, mon.tiffin_day,  mon.iftar_day,  mon.dinner_day,  mon.gt_holi_duty,  mon.wk_holi_duty, 
       (sal.nt_bill_ch + sal.nt_bill_bk)nt_bill,  (sal.tiffin_bill_ch + sal.tiffin_bill_bk)tiffin_bill,  (sal.iftar_bill_ch + sal.iftar_bill_bk)iftar_bill, 
       (sal.dinner_bill_ch + sal.dinner_bill_bk)dinner_bill,  (sal.gt_holi_bill_ch + sal.gt_holi_bill_bk)gt_holi_bill, 
       (sal.wk_holi_bill_ch + sal.wk_holi_bill_bk)wk_holi_bill,  (sal.total_benefit_ch + sal.total_benefit_bk)total_benefit
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    sal.company  = per.company
AND    mon.company  = per.company   
AND    mon.finyear  =  :p_year 
AND    mon.finmonth =  :p_month 
AND    mon.finyear  =  sal.finyear 
AND    mon.finmonth =  sal.finmonth 
AND    (sal.total_benefit_ch + sal.total_benefit_bk)  > 0
AND    sal.cardno   =  per.cardno 
AND    mon.cardno   =  per.cardno 
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    per.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.cardno            LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active             LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.lineno,mon.cardno ASC