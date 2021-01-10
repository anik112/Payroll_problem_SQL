SELECT SAL.CARDNO, SAL.EMPNAME, SAL.DESIGNATION, SAL.GROSSSAL, TDAY.FESTIVAL_DAY FES_DAY, 
SAL.FESTIVAL_BILL FES_BILL 
FROM TB_MONTH_SALARY SAL, TB_MONTH_TOTALDAY TDAY
WHERE SAL.COMPANY=TDAY.COMPANY
AND	  SAL.FINYEAR=TDAY.FINYEAR
AND	  SAL.FINMONTH=TDAY.FINMONTH
AND	  SAL.CARDNO=TDAY.CARDNO
AND	  SAL.COMPANY=:P_COMAPNY
AND	  SAL.FINYEAR=:FIN_YEAR
AND	  SAL.FINMONTH=:FIN_MONTH
AND	  SAL.FESTIVAL_BILL>0
ORDER BY CARDNO ASC