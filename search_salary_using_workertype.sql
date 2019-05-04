SELECT 
	   TB_PERSONAL_INFO.CARDNO,
	   TB_MONTH_SALARY.CARDNO,
	   TB_MONTH_SALARY.EMPNAME AS EMPLOY_NAME, 
   	   TB_MONTH_SALARY.DESIGNATION,
   	   TB_MONTH_SALARY.SALARY_GRD AS SALARY_GRADE,
   	   TB_MONTH_SALARY.GROSSSAL AS GROSS_SALARY, 
   	   TB_MONTH_SALARY.BASICSAL AS BASIC_SALARY,
   	   TB_MONTH_SALARY.OTRATE AS OT_RATE, 
	   TB_MONTH_SALARY.OTAMOUNT AS OT_AMOUNT,
	   TB_MONTH_SALARY.ABSENT_DEDUC AS ABSENT_DEDUCTION, 
	   TB_MONTH_SALARY.TOTALSALARY AS TOTAL_SALARY, 
	   TB_MONTH_SALARY.NETPAYABLE AS NET_PAYABLE, 
	   TB_MONTH_SALARY.NETPAYMENT AS NET_PAYMENT
FROM 
	 TB_MONTH_SALARY,
	 TB_PERSONAL_INFO
WHERE
	 TB_PERSONAL_INFO.WORKERTYPE='Staff'
	 AND TB_PERSONAL_INFO.DEPARTMENTNM='Production'
	 AND TB_PERSONAL_INFO.SECTIONNM= 'Finishing'
	 AND TB_MONTH_SALARY.CARDNO=TB_PERSONAL_INFO.CARDNO
	 AND TB_MONTH_SALARY.FINYEAR=2019
	 AND TB_MONTH_SALARY.FINMONTH='April';