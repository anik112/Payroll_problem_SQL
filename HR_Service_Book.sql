SELECT emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO, emp.CARDNO, emp.EMPNAME, 
       emp.FATHER_NAME, emp.MOTHER_NAME,emp.HOUSBANDNAME, emp.COMPANY, (emp.grosssalary + emp.GROSS_BK)GROSSSALARY,
	   emp.PRESENT_ADDRESS, emp.PERMANENTADDRESS, emp.JOINING_DATE, other.NID,
	   other.HEIGHT, other.WEIGHT, other.SPECIAL_MARK,	   
       emp.DESIGNATION,emp.SALARY_GRADE, emp.BIRTH_DATE, emp.GENDER, emp.BLOODGROUP, emp.SHIFT, 
	   emp.WDAY, emp.RELIGION, emp.RESIGNATION_DATE, emp.WORKERTYPE,
	   other.BOOK_SL_NO, other.OPEN_DATE,  other.OWN_CELLNO, emp.FATHER_NAME_BAN, emp.SPOUSE_NAME_BAN, emp.MOTHER_NAME_BAN,
	   emp.ENMNAME_BANGLA EMPNAME_ban, emp.DESIGNATION_BANGLA DESIGNATION_ban, emp.DEPT_BANGLA DEPARTMENTNM_ban, 
	   emp.SEC_BANGLA SECTIONNM_ban, pic.EMPPICTURE, SIGN.EMPSIGN, emp.PRESENT_ADD_BAN, emp.PERMANENT_ADD_BAN
FROM   TB_PERSONAL_INFO emp, TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO_PICTURE pic,TB_PERSONAL_INFO_SIGN SIGN
WHERE  emp.company = :p_company
AND    emp.company = other.company
AND    emp.company = pic.company
AND    emp.company = SIGN.company
AND    emp.JOINING_DATE <= :p_date
AND    emp.CARDNO  = other.CARDNO
AND    emp.CARDNO  = pic.CARDNO
AND    emp.CARDNO  = SIGN.CARDNO
AND    emp.cardno  = :p_cardno 
ORDER BY emp.DEPARTMENTNM,emp.SECTIONNM,emp.lineno,emp.cardno ASC




SELECT emp.CARDNO CARDNO_EDU, emp.COMPANY COMPANY_EDU, other.LEVEL_DEGREE, other.INSTITUTE_NAME, other.SUBJECT,
       other.CLASS_GRADE, other.PASSING_YR 
FROM   TB_PERSONAL_INFO emp, TB_PERSONAL_EDUCATIONAL other
WHERE  emp.company = :p_company
AND    emp.company = other.company
AND    emp.JOINING_DATE <= :p_date
AND    emp.CARDNO  = other.CARDNO
AND    emp.cardno = :p_cardno 
ORDER BY emp.DEPARTMENTNM,emp.SECTIONNM,emp.lineno,emp.cardno ASC



SELECT pdate,remarks,company,cardno 
FROM TB_EMP_PUNISHMENT_RECORD
WHERE company = :p_company
AND   cardno  = :cardno
ORDER BY pdate ASC

 

SELECT emp.CARDNO CARDNO_EMP, emp.COMPANY COMPANY_EMP, other.COMPANYNAME, other.START_DATE, other.END_DATE, other.DESIGNATION DESIGNATION_EMP, other.LOCATION ADDRESS
FROM   TB_PERSONAL_INFO emp, TB_PERSONAL_EMPLOYMENT other
WHERE  emp.company = :p_company
AND    emp.company = other.company
AND    emp.JOINING_DATE <= :p_date
AND    emp.CARDNO  = other.CARDNO
AND    emp.cardno = :p_cardno 
ORDER BY emp.DEPARTMENTNM,emp.SECTIONNM,emp.lineno,emp.cardno ASC


SELECT lev.CARDNO Lev_Cardno, lev.START_DATE Lev_SDate, lev.END_DATE Lev_Edate, 
       lev.LEV_DAY Lev_Day, lev.TOTAL_EL_DAY lev_Total_Day
FROM TB_SETUP_SERVICEBOOK_ELEAVE lev, TB_PERSONAL_INFO emp
WHERE lev.company = :p_company
AND   lev.company = emp.company
AND   lev.cardno  = emp.cardno
AND   lev.cardno  = :p_cardno
ORDER BY lev.START_DATE ASC



SELECT  PROM.CARDNO Promotion_Card, PROM.DESIGNATION Promotion_Design, PROM.DESIGNATION_BANGLA Promotion_Design_Bangla, PROM.GROSS_SALARY Promotion_Salry, 
               PROM.EFFECTIVE_DATE Promotion_Date, PROM.COMPANY  Promotion_Company, PER.WORKERTYPE Promotion_Work ,
               prom.BASIC_SAL,  prom.HOUSE_SAL,  prom.MEDICAL_SAL, prom.CONVENCE_SAL, prom.FOODALLOW_SAL, prom.OTHERALLOW_SAL,
               (prom.CONVENCE_SAL + prom.FOODALLOW_SAL +  prom.OTHERALLOW_SAL)Other_Sal, per.JOINING_DATE JOINING_DATE_PROM
FROM TB_SETUP_SERVICEBOOK_PROMOTION PROM, TB_PERSONAL_INFO PER
WHERE  PER.company = :p_company
AND    PER.company     = PROM.company
AND    PER.cardno        = PROM.cardno
AND    PER.cardno        = :p_cardno
ORDER BY PROM.EFFECTIVE_DATE ASC