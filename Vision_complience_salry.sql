SELECT per.DEPARTMENTNM, per.SECTIONNM, per.LINENO,per.cardno,sal.empname,sal.designation,
       per.JOINING_DATE, SAL.SAL_GRD,
	   sal.BASICSAL,sal.houserent,sal.medical medisal,sal.TRANSPORT,sal.FOOD_ALLOW,
	   sal.GROSSSAL, mon.GOVTDAY, mon.HOLIDAY, mon.compensive, mon.casual, mon.earned, mon.medical,
	   mon.totalpresent, mon.totalabsent, mon.ABSENT_DAY, mon.ABSENT_DAY1 ,
	   sal.absent_deduc, sal.ABSENT_DED1, sal.TOT_ABS_DED,
	   sal.totalsalary,  mon.totalholiday, mon.totalleave,
	   mon.totalworkingday,(MON.OTMIN)Total_OtHr, 
	   (sal.OTAMOUNT)Total_OTAmt, 
	   sal.TF_BILL_PT TF_BILL, (sal.ATTBONUS)ATTBONUS,
	   sal.useless Total_Ded, sal.OTRATE,
       (sal.NETPAYMENT+sal.TF_BILL_PT)NETPAYMENT, 
	   sal.ADVANCE_DEDUC, sal.ARREAR_AMT, per.GENDER,
       other.OWN_CELLNO, other.NID,  other.BIRTH_CERTIFICATE_NO, per.BANKNAME, 
	   per.DEPARTMENTNM, per.SECTIONNM, per.LINENO, per.ACNO, per.PAYMENT_TYPE, per.WORKERTYPE
FROM   TB_MONTH_SALARY sal,TB_MONTH_TOTALDAY  mon, TB_PERSONAL_INFO per , TB_PERSONAL_INFO_OTHER Other 
WHERE  mon.company    ='Vision Apparels (Pvt.) Ltd.-1'
and    mon.company    = sal.company
and    mon.company    = per.company
and    mon.company    = other.company
AND    mon.finyear    = 2021
AND    mon.finmonth   = 'January' 
AND    mon.finyear    = sal.finyear 
AND    mon.finmonth   = sal.finmonth 
AND    mon.cardno     = sal.cardno 
AND    mon.cardno     = per.cardno
AND    mon.cardno     = other.cardno 
and    per.active     = 0  
and    per.PAYMENT_TYPE LIKE DECODE(NVL(:p_PayType,'all'),'all','%',:p_PayType)
ORDER BY per.lineno,mon.cardno, per.DESIGNATION ASC