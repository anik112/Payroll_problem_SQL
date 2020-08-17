SELECT 
sal.cardno, per.EMPNAME, sal.DESIGNATION, sal.GROSSSAL,
other.nid, other.own_cellno mobile, sal.JOINDATE, sal.NPAYMENT part_payable,
per.AC_NO, per.BANK_NAME
FROM   TB_SALARY_HALF_AMOUNT sal, TB_PERSONAL_INFO per, TB_PERSONAL_INFO_OTHER other
WHERE   sal.company  = per.company 
AND		other.company= sal.company
AND		per.COMPANY	 = 'Natural Denims Ltd.'
and		sal.FINYEAR  = 2020
and 	sal.FINMONTH ='July'
and     sal.NPAYMENT > 0
and 	sal.SAL_STATUS='A'
and		sal.pay_status='Y'
AND    	sal.cardno   = per.cardno 
AND		other.cardno = sal.cardno
ORDER BY sal.cardno ASC

--------and      per.active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 