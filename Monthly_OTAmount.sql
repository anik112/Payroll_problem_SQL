SELECT sal.cardno, sal.empname, sal.enmname_bangla, sal.designation, sal.designation_ban,  (sal.basicsal_ch + sal.basicsal_bk)basicsal, (sal.grosssal_ch + grosssal_bk)grosssal, sal.otamount, 
               sal.departmentnm,  sal.dept_bangla,  sal.lineno, sal.sectionnm, sal.sec_bangla, sal.otrate, mon.othr, per.joining_date, per.shift
FROM   tb_month_salary sal,tb_month_totalday  mon, tb_personal_info per 
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
AND    per.departmentnm LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.sectionnm       LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.designation     LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.workertype      LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND    per.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND    per.machineno       LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND    per.lineno              LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.shift                 LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND    per.cash_type       LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.bank_name     LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND    per.mft_type          LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND    sal.sal_status         LIKE DECODE(NVL(:p_sal_status,'all'),'all','%',:p_sal_status)
AND    sal.pay_status       LIKE DECODE(NVL(:p_pay_status,'all'),'all','%',:p_pay_status)
AND    sal.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
AND    per.active              LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY per.lineno,mon.cardno ASC