SELECT 
sal.EMPNAME EMPNAME_SAL, sal.DESIGNATION DESIGNATION_SAL, 

sal.SALARY_GRD, sal.GROSSSAL, sal.BASICSAL, sal.HOUSERENT, 

sal.MEDICAL MEDISAL, sal.TRANSPORT, sal.FOODALLOW, 

sal.OTHERALLOW, sal.ATTBONUS, sal.OTRATE, 

sal.OTAMOUNT, sal.EXTRA_OTAMT, sal.ARREAR_AMT, 

sal.PFUND, sal.ABSENT_DEDUC, sal.ADVANCE_DEDUC, 

sal.OTHER_DEDUC, sal.HALF_DUTY_DEDUC, sal.LUNCH_DEDUC, 

sal.TAX_DEDUC, sal.LATE_DEDUC, sal.USELESS, 

sal.USELESS1, sal.STAMP,  (sal.STAMP + sal.TRADE_SUBSCRIPTION)Stamp_Trade,

sal.TOTALSALARY, sal.NETPAYABLE, (sal.NETPAYMENT- sal.OTAMOUNT)NETPAYMENT, 

sal.COMPANY,  sal.FS_BONUS, sal.TOT_DEDUCTION,sal.PROCESSDATE, 

sal.NT_BILL, sal.TIFFIN_BILL, sal.FES_HOLI_BILL, sal.WK_HOLI_BILL, 

sal.MOBILE_BILL, sal.INTERNET_BILL, sal.DESIGNATION_BAN,

(sal.OTAMOUNT +sal.EXTRA_OTAMT)Total_OT_Amt,mon.TOTALDAY, mon.TOTALHOLIDAY, 

mon.COMPENSIVE, mon.CASUAL, mon.EARNED, mon.MEDICAL,

mon.TOTALLEAVE, mon.TOTALWORKINGDAY, mon.TOTALATTDENCE,

mon.TOTALPRESENT, mon.TOTALABSENT, mon.OTHR,

mon.OTMIN,mon.OTMINPART,mon.LATEDAY,mon.COMPANY,mon.NT_DAY,

mon.TIFFIN_DAY,mon.HALF_DUTYDAY,mon.HOLIDAY_OT, mon.FS_HOLI_DAY,mon.WK_HOLI_DAY,

per.DEPARTMENTNM,per.SECTIONNM,per.LINENO,per.CARDNO, per.JOINING_DATE, per.DESIGNATION DESIGNATION_PER,

per.RESIGNATION_DATE,per.EMPNAME EMPNAME_PER, per.SALARY_GRADE SAL_GRD_PER, per.AC_NO,

(mon.OTMIN + mon.OTMINPART)Total_OT_Hr, PER.DEPT_BANGLA, PER.SEC_BANGLA, per.ENMNAME_BANGLA, per.BANK_NAME,

mon.WEEK_DAY, mon.GOVT_DAY, sal.TRADE_SUBSCRIPTION

FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
and      sal.company    = per.company 
and      mon.company  = per.company
AND    mon.finyear      =  :p_year 
AND    mon.finmonth   =  :p_month 
AND    mon.finyear      =  sal.finyear 
AND    mon.finmonth   =  sal.finmonth
-------AND    SAL.SAL_STATUS = :P_STATUS
and     sal.NETPAYMENT > 0
AND    sal.cardno      =  per.cardno 
AND    mon.cardno    =  per.cardno 
--------and      per.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
AND    per.DEPARTMENTNM LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND    per.SECTIONNM   LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section) 
AND    per.DESIGNATION    LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND    per.lineno    LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line) 
AND    per.SHIFT    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    per.WORKERTYPE    LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker) 
AND    mon.cardno    LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
AND    sal.SAL_STATUS    LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status) 
AND    sal.PAY_STATUS    LIKE DECODE(NVL(:p_pay_sal,'all'),'all','%',:p_pay_sal) 
AND    per.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    per.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
ORDER BY per.DEPARTMENTNM,per.SECTIONNM,per.lineno,mon.cardno ASC