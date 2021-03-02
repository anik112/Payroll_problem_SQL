SELECT emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO,  emp.shift, emp.CARDNO, emp.EMPNAME, emp.JOINING_DATE, 
       emp.DESIGNATION, emp.SALARY_GRADE, emp.GROSSSALARY, emp.BIRTH_DATE, emp.GENDER,
	   emp.BLOODGROUP, emp.WORKERTYPE, other.PERFORMANCE, other.SPECIAL_MARK, emp.COMPANY, SIGN.empsign
FROM  TB_PERSONAL_INFO emp, TB_PERSONAL_INFO_OTHER other, TB_PERSONAL_INFO_SIGN SIGN
WHERE emp.COMPANY      = :p_company
AND   emp.COMPANY      = other.COMPANY
AND   emp.COMPANY      = SIGN.COMPANY
AND   emp.JOINING_DATE <= :p_date
AND   emp.CARDNO       = other.CARDNO
AND   emp.CARDNO       = SIGN.CARDNO
AND   TO_CHAR(emp.JOINING_DATE,'RRRR') LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   emp.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   emp.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   emp.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   emp.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   emp.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   emp.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   emp.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   emp.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   emp.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO, emp.CARDNO ASC




SELECT lev.LEAVE_TYPE, lev.START_DATE, lev.END_DATE, lev.LEAVEDAY, lev.UPDATEED, lev.REASON , lev.CARDNO lev_card, lev.COMPANY lev_company
FROM   TB_LEAVE_DETAILINFO lev,TB_PERSONAL_INFO emp
WHERE emp.company  = :p_company
AND   emp.COMPANY  = lev.COMPANY
AND   lev.finyear  = :p_year
AND   lev.cardno   = emp.cardno
AND   emp.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   emp.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   emp.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   emp.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   emp.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   emp.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   emp.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   emp.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   emp.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY lev.START_DATE ASC


-------------- selected  -----------


SELECT emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO,  emp.shift, emp.CARDNO, emp.EMPNAME, emp.JOINING_DATE, 
       emp.DESIGNATION, emp.SALARY_GRADE, emp.GROSSSALARY, emp.BIRTH_DATE, emp.GENDER,
	   emp.BLOODGROUP, emp.WORKERTYPE, other.PERFORMANCE, other.SPECIAL_MARK, emp.COMPANY, SIGN.empsign
FROM  TB_PERSONAL_INFO emp, TB_PERSONAL_INFO_OTHER other, 
      TB_PERSONAL_INFO_SIGN SIGN, TB_IDCARD_MULTIPLE mul
WHERE emp.COMPANY      = :p_company
AND   emp.COMPANY      = other.COMPANY
AND   emp.COMPANY      = SIGN.COMPANY
AND   emp.company      = mul.company
AND   emp.JOINING_DATE <= :p_date
AND   mul.USER_NAME    = :p_user
AND   emp.CARDNO       = other.CARDNO
AND   emp.CARDNO       = SIGN.CARDNO
AND   emp.cardno       = mul.cardno
ORDER BY emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO, emp.CARDNO ASC




SELECT lev.LEAVE_TYPE, lev.START_DATE, lev.END_DATE, lev.LEAVEDAY, lev.UPDATEED,
       lev.REASON , lev.CARDNO lev_card, lev.COMPANY lev_company
FROM  TB_LEAVE_DETAILINFO lev,TB_PERSONAL_INFO emp, TB_IDCARD_MULTIPLE mul
WHERE emp.company   = :p_company
AND   emp.COMPANY   = lev.COMPANY
AND   emp.company   = mul.company
AND   lev.finyear   = :p_year
AND   mul.USER_NAME = :p_user
AND   lev.cardno    = emp.cardno
AND   emp.cardno    = mul.cardno