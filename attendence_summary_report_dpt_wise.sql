
SELECT A.DEPARTMENTNM, A.TOTAL_EMP, B.PRESENT_EMP, 
((A.TOTAL_EMP - B.PRESENT_EMP)-C.LEAVE_EMP) ABSENT_EMP, C.LEAVE_EMP,
ROUND(((B.PRESENT_EMP/A.TOTAL_EMP) * 100)) PRESENT_PRSN
FROM
(SELECT INFO.DEPARTMENTNM, COUNT(INFO.CARDNO) TOTAL_EMP
		FROM TB_PERSONAL_INFO INFO
		WHERE INFO.COMPANY = 'Apparel Plus Limited.'
		AND	  INFO.ACTIVE=0
		GROUP BY INFO.DEPARTMENTNM) A,
(SELECT INFO.DEPARTMENTNM, COUNT(MSTR.CARDNO) PRESENT_EMP
		FROM TB_PERSONAL_INFO INFO, TB_DATA_MASTER MSTR
		WHERE INFO.COMPANY = 'Apparel Plus Limited.'
		AND	  MSTR.COMPANY=(SELECT COMID FROM TB_COMPANY_INFO WHERE COMPANY=INFO.COMPANY)
		AND	  MSTR.PDATE=:p_pdate
		AND	  MSTR.CARDNO=INFO.CARDNO
		GROUP BY INFO.DEPARTMENTNM) B,
(SELECT INFO.DEPARTMENTNM, COUNT(LEV.CARDNO) LEAVE_EMP
		FROM TB_PERSONAL_INFO INFO, TB_LEAVE_DETAILINFO LEV
		WHERE INFO.COMPANY = 'Apparel Plus Limited.'
		AND	  LEV.COMPANY=INFO.COMPANY
		AND	  LEV.END_DATE >=:p_pdate 
		AND	  LEV.START_DATE <=:p_pdate
		AND	  LEV.CARDNO=INFO.CARDNO
		GROUP BY INFO.DEPARTMENTNM) C
WHERE B.DEPARTMENTNM=A.DEPARTMENTNM
AND	  C.DEPARTMENTNM=B.DEPARTMENTNM
