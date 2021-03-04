SELECT emp.CARDNO, emp.COMPANY, other.LEAVE_TYPE, other.START_DATE, other.END_DATE, 
       other.LEAVEDAY, emp.joining_date, emp.lineno, emp.SEC_BANGLA,  emp.DESIGNATION_BANGLA,
       emp.DEPARTMENTNM, emp.SECTIONNM, emp.DESIGNATION,emp.EMPNAME, SIGN.EMPSIGN,
       emp.FATHER_NAME_BAN,  emp.SPOUSE_NAME_BAN,  emp.MOTHER_NAME_BAN, emp.ENMNAME_BANGLA
FROM   TB_PERSONAL_INFO emp, TB_LEAVE_DETAILINFO other, TB_PERSONAL_INFO_SIGN SIGN
WHERE  emp.company      = :p_company
AND    emp.company      = other.company
AND    emp.company      = SIGN.company
AND    emp.JOINING_DATE <= :p_date
AND    OTHER.FINYEAR    = TO_CHAR(TO_DATE(:p_date,'DD/MM/RRRR'),'rrrr')
AND    other.LEAVE_TYPE IN ('Casual', 'Earned', 'Medical')
AND    emp.CARDNO       = other.CARDNO
AND    emp.CARDNO       = SIGN.CARDNO
AND    emp.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND    emp.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND    emp.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND    emp.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND    emp.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND    emp.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND    emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND    emp.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND    emp.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND    emp.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND    emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY emp.DEPARTMENTNM,emp.SECTIONNM,emp.lineno,emp.cardno,other.START_DATE ASC