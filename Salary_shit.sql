SELECT 
   TB_MONTH_SALARY.CARDNO,
   TB_PERSONAL_INFO.EMPNAME AS EMPLOY_NAME, 
   TB_PERSONAL_INFO.DESIGNATION,
   TB_PERSONAL_INFO.SALARY_GRADE AS SALARY_GRADE,
   TB_PERSONAL_INFO.JOINING_DATE,
   TB_PERSONAL_INFO.RESIGNATION_DATE,
   TB_MONTH_TOTALDAY.CASUAL AS CL,
   TB_MONTH_TOTALDAY.MEDICAL AS SL,
   TB_MONTH_TOTALDAY.EARNED AS EL,
   TB_MONTH_TOTALDAY.TOTALDAY AS MON,
   TB_MONTH_TOTALDAY.TOTALWORKINGDAY AS WD,
   TB_MONTH_TOTALDAY.WEEK_DAY AS WH,
   TB_MONTH_TOTALDAY.GOVT_DAY AS GH,
   TB_MONTH_TOTALDAY.TOTALABSENT AS ABST,
   TB_MONTH_SALARY.BASICSAL AS BASIC_SALARY, 
   TB_MONTH_SALARY.HOUSERENT AS HOUSE_RENT, 
   TB_MONTH_SALARY.MEDICAL, 
   TB_MONTH_SALARY.TRANSPORT, 
   TB_MONTH_SALARY.FOODALLOW, 
   TB_MONTH_SALARY.OTHERALLOW,
   TB_MONTH_SALARY.GROSSSAL AS GROSS_SALARY,
   TB_PROMOTION_INFO.PROSALARY,
   TB_MONTH_SALARY.ABSENT_DEDUC AS ABSENT_DED,
   TB_MONTH_SALARY.ARREAR_AMT AS ARRAR,
   TB_MONTH_TOTALDAY.LATEDAY AS LD,
   TB_MONTH_SALARY.ATTBONUS AS BONUS,
   TB_MONTH_SALARY.OTRATE AS OT_RATE, 
   TB_MONTH_SALARY.OTAMOUNT AS OT_AMOUNT,
   TB_MONTH_TOTALDAY.HOLIDAY_OT AS HOLI_DAY,
   TB_MONTH_SALARY.WK_HOLI_BILL AS HD_BILL,
   TB_MONTH_TOTALDAY.TIFFIN_DAY,
   TB_MONTH_SALARY.TIFFIN_BILL AS TF_BILL,
   TB_MONTH_SALARY.STAMP,
   TB_MONTH_SALARY.NETPAYABLE AS NET_PAYABLE, 
   TB_MONTH_SALARY.ADVANCE_DEDUC,
   TB_MONTH_SALARY.TAX_DEDUC,
   TB_MONTH_SALARY.NETPAYMENT AS NET_PAYMENT,
   TB_PERSONAL_INFO.DEPARTMENTNM,
   TB_PERSONAL_INFO.SECTIONNM, 
   TB_PERSONAL_INFO.COMPANY,
   TB_MONTH_SALARY.PROCESSDATE,
   TB_MONTH_SALARY.FINYEAR,
   TB_MONTH_SALARY.FINMONTH
   
FROM TB_MONTH_SALARY,TB_PERSONAL_INFO,TB_MONTH_TOTALDAY,TB_PROMOTION_INFO
WHERE TB_MONTH_SALARY.FINYEAR=2019
AND	  TB_MONTH_SALARY.FINMONTH='March'
--AND	  TB_MONTH_SALARY.DESIGNATION='Finishing Assistant'
--AND	  TB_MONTH_SALARY.CARDNO='014503'
AND	  TB_PERSONAL_INFO.CARDNO=TB_MONTH_SALARY.CARDNO
AND	  TB_PERSONAL_INFO.DEPARTMENTNM='Production'
AND	  TB_MONTH_TOTALDAY.CARDNO=TB_MONTH_SALARY.CARDNO
AND	  TB_MONTH_TOTALDAY.FINYEAR=TB_MONTH_SALARY.FINYEAR
AND	  TB_MONTH_TOTALDAY.FINMONTH=TB_MONTH_SALARY.FINMONTH
AND	  TB_PROMOTION_INFO.SLNO=(
	  						  SELECT MAX(SLNO) FROM TB_PROMOTION_INFO 
							  WHERE 
							  TB_PROMOTION_INFO.CARDNO=TB_MONTH_SALARY.CARDNO
							  )
ORDER BY TB_MONTH_SALARY.CARDNO ASC; 
							  
							  
							  
--- ***** USING INNER JOIN **** -----------					  
						
						
SELECT 
   TB_MONTH_SALARY.CARDNO,
   TB_PERSONAL_INFO.EMPNAME AS EMPLOY_NAME, 
   TB_PERSONAL_INFO.DESIGNATION,
   TB_PERSONAL_INFO.SALARY_GRADE AS SALARY_GRADE,
   TB_PERSONAL_INFO.JOINING_DATE,
   TB_PERSONAL_INFO.RESIGNATION_DATE,
   TB_MONTH_TOTALDAY.CASUAL AS CL,
   TB_MONTH_TOTALDAY.MEDICAL AS SL,
   TB_MONTH_TOTALDAY.EARNED AS EL,
   TB_MONTH_TOTALDAY.TOTALDAY AS MON,
   TB_MONTH_TOTALDAY.TOTALWORKINGDAY AS WD,
   TB_MONTH_TOTALDAY.WEEK_DAY AS WH,
   TB_MONTH_TOTALDAY.GOVT_DAY AS GH,
   TB_MONTH_TOTALDAY.TOTALABSENT AS ABST,
   TB_MONTH_SALARY.BASICSAL AS BASIC_SALARY, 
   TB_MONTH_SALARY.HOUSERENT AS HOUSE_RENT, 
   TB_MONTH_SALARY.MEDICAL, 
   TB_MONTH_SALARY.TRANSPORT, 
   TB_MONTH_SALARY.FOODALLOW, 
   TB_MONTH_SALARY.OTHERALLOW,
   TB_MONTH_SALARY.GROSSSAL AS GROSS_SALARY,
   TB_PROMOTION_INFO.PROSALARY,
   TB_MONTH_SALARY.ABSENT_DEDUC AS ABSENT_DED,
   TB_MONTH_SALARY.ARREAR_AMT AS ARRAR,
   TB_MONTH_TOTALDAY.LATEDAY AS LD,
   TB_MONTH_SALARY.ATTBONUS AS BONUS,
   TB_MONTH_SALARY.OTRATE AS OT_RATE, 
   TB_MONTH_SALARY.OTAMOUNT AS OT_AMOUNT,
   TB_MONTH_TOTALDAY.HOLIDAY_OT AS HOLI_DAY,
   TB_MONTH_SALARY.WK_HOLI_BILL AS HD_BILL,
   TB_MONTH_TOTALDAY.TIFFIN_DAY,
   TB_MONTH_SALARY.TIFFIN_BILL AS TF_BILL,
   TB_MONTH_SALARY.STAMP,
   TB_MONTH_SALARY.NETPAYABLE AS NET_PAYABLE, 
   TB_MONTH_SALARY.ADVANCE_DEDUC,
   TB_MONTH_SALARY.TAX_DEDUC,
   TB_MONTH_SALARY.NETPAYMENT AS NET_PAYMENT,
   TB_PERSONAL_INFO.DEPARTMENTNM,
   TB_PERSONAL_INFO.SECTIONNM,
   TB_PERSONAL_INFO.COMPANY,
   TB_MONTH_SALARY.PROCESSDATE,
   TB_MONTH_SALARY.FINYEAR,
   TB_MONTH_SALARY.FINMONTH
   
FROM TB_MONTH_SALARY
INNER JOIN TB_PERSONAL_INFO ON TB_PERSONAL_INFO.CARDNO=TB_MONTH_SALARY.CARDNO
AND	  TB_PERSONAL_INFO.DEPARTMENTNM='Production'
INNER JOIN TB_MONTH_TOTALDAY ON TB_MONTH_TOTALDAY.CARDNO=TB_MONTH_SALARY.CARDNO
AND	  TB_MONTH_TOTALDAY.FINYEAR=TB_MONTH_SALARY.FINYEAR
AND	  TB_MONTH_TOTALDAY.FINMONTH=TB_MONTH_SALARY.FINMONTH
INNER JOIN TB_PROMOTION_INFO ON TB_PROMOTION_INFO.SLNO=(
	  						  	SELECT MAX(SLNO) FROM TB_PROMOTION_INFO 
							  	WHERE 
							  	TB_PROMOTION_INFO.CARDNO=TB_MONTH_SALARY.CARDNO
							  	)
WHERE TB_MONTH_SALARY.FINYEAR=2019
AND	  TB_MONTH_SALARY.FINMONTH='March'
ORDER BY TB_MONTH_SALARY.CARDNO ASC;
--AND	  TB_MONTH_SALARY.DESIGNATION='Finishing Assistant'
--AND	  TB_MONTH_SALARY.CARDNO='014503';
