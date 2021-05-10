SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR)othr, SUM(sal.OTAMOUNT)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    sal.company        = per.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno           =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

-----------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR_HNM)othr, SUM(sal.EXTRA_OTAMT)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno           =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


-------------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR_PART)othr, SUM(sal.EXTRA_OTAMT_PT)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno           =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


------------------------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR_PART_PT)othr, SUM(sal.EXTRA_OTAMT_TM)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

-----------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.WK_HOLI_OTHR+mon.GT_HOLI_OTHR)othr, 
			  SUM(sal.WK_HOLI_OT_AMT+sal.GT_HOLI_OT_AMT)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


---------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR_HNM+mon.OTHR_PART)othr, 
			  SUM(sal.EXTRA_OTAMT+sal.EXTRA_OTAMT_PT)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


------------------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR_PART+mon.OTHR_PART_PT)othr, 
              SUM(sal.EXTRA_OTAMT_PT+sal.EXTRA_OTAMT_TM)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

------------------------------------

SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, SUM(mon.OTHR+mon.OTHR_PART+mon.OTHR_PART_PT)othr, 
              SUM(sal.OTAMOUNT+sal.EXTRA_OTAMT_PT+sal.EXTRA_OTAMT_TM)otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC


---------------------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, 
			  SUM(mon.OTHR_PART+mon.OTHR_PART_PT+(mon.WK_HOLI_OTHR+mon.GT_HOLI_OTHR))othr, 
              SUM(sal.EXTRA_OTAMT_PT+sal.EXTRA_OTAMT_TM+(sal.WK_HOLI_OT_AMT+sal.GT_HOLI_OT_AMT))otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC



----------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, 
              SUM(mon.OTHR_HNM+mon.OTHR_PART+mon.OTHR_PART_PT+(mon.WK_HOLI_OTHR+mon.GT_HOLI_OTHR))othr, 
              SUM(sal.EXTRA_OTAMT+sal.EXTRA_OTAMT_PT+sal.EXTRA_OTAMT_TM+(sal.WK_HOLI_OT_AMT+sal.GT_HOLI_OT_AMT))otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC

-------------------------------------


SELECT SUM(sal.basicsal_ch + sal.basicsal_bk)basicsal, SUM(sal.grosssal_ch + grosssal_bk)grosssal,  
              sal.sectionnm, sal.sec_bangla,COUNT(sal.cardno)total_emp, 
              SUM(mon.OTHR+mon.OTHR_HNM+mon.OTHR_PART+mon.OTHR_PART_PT+(mon.WK_HOLI_OTHR+mon.GT_HOLI_OTHR))othr, 
              SUM(sal.OTAMOUNT+sal.EXTRA_OTAMT+sal.EXTRA_OTAMT_PT+sal.EXTRA_OTAMT_TM+(sal.WK_HOLI_OT_AMT+sal.GT_HOLI_OT_AMT))otamt
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
AND    mon.company      = sal.company
AND    mon.company      = per.company   
AND    mon.finyear          =  :p_year 
AND    mon.finmonth       =  :p_month 
AND    mon.finyear          =  sal.finyear 
AND    mon.finmonth       =  sal.finmonth 
AND    sal.otamount > 0
AND    sal.cardno            =  per.cardno 
AND    mon.cardno         =  per.cardno
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status        LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
GROUP BY sal.sectionnm, sal.sec_bangla
ORDER BY sal.sectionnm ASC