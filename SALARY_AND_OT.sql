SELECT sal.GROSSSAL as GROSSSAL, 
	   sal.BASICSAL as BASICSAL, 
	   sal.HOUSERENT as HOUSERENT, 
	   per.CARDNO as CARD_CNT,
   	   sal.MEDICAL as MEDISAL, 
	   sal.TRANSPORT as TRANSPORT, 
	   sal.FOODALLOW as FOODALLOW, 
   	   sal.OTHERALLOW as OTHERALLOW, 
	   sal.ATTBONUS as ATTBONUS,
	   sal.OTAMOUNT as OTAMOUNT,
   	   sal.EXTRA_OTAMT as EXTRA_OTAMT, 
	   sal.ARREAR_AMT as ARREAR_AMT,
	   sal.OTAMOUNT as TOTAL_OTAMT,
   	   sal.PFUND as PFUND, 
	   sal.ABSENT_DEDUC as ABSENT_DEDUC, 
	   sal.ADVANCE_DEDUC as ADVANCE_DEDUC,
   	   sal.OTHER_DEDUC as OTHER_DEDUC,
	   sal.HALF_DUTY_DEDUC as HALF_DUTY_DEDUC, 
   	   sal.LUNCH_DEDUC as LUNCH_DEDUC, 
	   sal.TAX_DEDUC as TAX_DEDUC, 
	   sal.LATE_DEDUC as LATE_DEDUC, 
   	   sal.USELESS as USELESS, 
	   sal.USELESS1 as USELESS1,
	   sal.STAMP as STAMP,  
	   sal.TOT_DEDUCTION as TOT_DEDUCTION,
   	   sal.TOTALSALARY as TOTALSALARY, 
	   sal.NETPAYABLE as NETPAYABLE, 
	   sal.NETPAYMENT as NETPAYMENT,
   	   sal.NT_BILL as NT_BILL, 
	   sal.TIFFIN_BILL as TIFFIN_BILL, 
	   sal.FES_HOLI_BILL as FES_HOLI_BILL, 
   	   sal.WK_HOLI_BILL as WK_HOLI_BILL, 
	   sal.MOBILE_BILL as MOBILE_BILL, 
	   sal.INTERNET_BILL as INTERNET_BILL, 
   	   (sal.OTAMOUNT +sal.EXTRA_OTAMT) as TOTAL_OT_AMT, 
	   mon.TOTALDAY as TOTALDAY, 
	   mon.TOTALHOLIDAY as TOTALHOLIDAY, 
   	   mon.COMPENSIVE as COMPENSIVE, 
	   mon.CASUAL as CASUAL, 
	   mon.EARNED as EARNED, 
	   mon.MEDICAL as MEDICAL,
   	   mon.TOTALLEAVE as TOTALLEAVE, 
	   mon.TOTALWORKINGDAY as TOTALWORKINGDAY, 
	   mon.TOTALATTDENCE as TOTALATTDENCE,
   	   mon.TOTALPRESENT as TOTALPRESENT, 
	   mon.TOTALABSENT as TOTALABSENT, 
	   mon.OTMIN as OTMIN, 
	   mon.OTMINPART as OTMINPART,
   	   mon.LATEDAY as LATEDAY, 
	   mon.NT_DAY as NT_DAY, 
	   mon.TIFFIN_DAY as TIFFIN_DAY, 
	   mon.HALF_DUTYDAY as HALF_DUTYDAY,
   	   mon.HOLIDAY_OT as HOLIDAY_OT, 
	   mon.FS_HOLI_DAY as FS_HOLI_DAY, 
	   mon.WK_HOLI_DAY as WK_HOLI_DAY, 
	   per.SECTIONNM as SEC_NAME,  
	   PER.LINENO as LINE,
   	   mon.OTMIN as TOTAL_OT_HR
	   
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per 
WHERE  mon.company  = :p_company 
and    SAL.company   = PER.company 
and    mon.company   = per.company
AND    mon.finyear       =  :p_year 
AND    mon.finmonth    =  :p_month 
AND    mon.finyear       =  sal.finyear 
AND    mon.finmonth    =  sal.finmonth 
and    (sal.NETPAYMENT+ sal.EXTRA_OTAMT) > 0
AND    SAL.cardno      =  PER.cardno 
AND    mon.cardno      =  per.cardno
AND    per.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND    sal.SAL_STATUS    LIKE DECODE(NVL(:p_status,'all'),'all','%',:p_status)
AND    sal.PAY_STATUS    LIKE DECODE(NVL(:p_pay_sal,'all'),'all','%',:p_pay_sal) 
AND    per.BANK_NAME  LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
order by per.SECTIONNM, PER.LINENO asc