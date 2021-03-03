SELECT emp.CARDNO, emp.ENMNAME_BANGLA, other.NID, emp.DESIGNATION_BANGLA, emp.FATHER_NAME, emp.MOTHER_NAME, 
emp.JOINING_DATE, emp.DEPT_BANGLA, emp.SEC_BANGLA, emp.LINENO, emp.BIRTH_DATE, emp.GENDER, emp.PRESENT_ADD_BAN,  
emp.PRESENT_PO_BAN,  emp.PRESENT_PS_BAN,  emp.PRESENT_DIST_BAN, emp.PERMANENT_ADD_BAN,  emp.PERMANENT_PO_BAN,
emp.PERMANENT_PS_BAN,  emp.PERMANENT_DIST_BAN,emp.FATHER_NAME_BAN, emp.SPOUSE_NAME_BAN,  emp.MOTHER_NAME_BAN,
emp.WDAY, emp.SHIFT, emp.SALARY_GRADE
FROM  TB_PERSONAL_INFO emp, TB_PERSONAL_INFO_OTHER other
WHERE emp.company      = :p_company
AND   emp.company      = other.company
AND   emp.JOINING_DATE <= :p_date
AND   emp.CARDNO       = other.CARDNO
AND   TO_CHAR(emp.JOINING_DATE,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(emp.JOINING_DATE,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
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
ORDER BY emp.DEPARTMENTNM, emp.SECTIONNM, emp.lineno, emp.cardno ASC



--- selected --



SELECT emp.CARDNO, emp.ENMNAME_BANGLA, other.NID, emp.DESIGNATION_BANGLA, emp.FATHER_NAME, emp.MOTHER_NAME, 
emp.JOINING_DATE, emp.DEPT_BANGLA, emp.SEC_BANGLA, emp.LINENO, emp.BIRTH_DATE, emp.GENDER, emp.PRESENT_ADD_BAN,  
emp.PRESENT_PO_BAN,  emp.PRESENT_PS_BAN,  emp.PRESENT_DIST_BAN, emp.PERMANENT_ADD_BAN,  emp.PERMANENT_PO_BAN,
emp.PERMANENT_PS_BAN,  emp.PERMANENT_DIST_BAN,emp.FATHER_NAME_BAN, emp.SPOUSE_NAME_BAN,  emp.MOTHER_NAME_BAN,
emp.WDAY, emp.SHIFT, emp.SALARY_GRADE
FROM  TB_PERSONAL_INFO emp, TB_PERSONAL_INFO_OTHER other, TB_IDCARD_MULTIPLE mul
WHERE emp.company      = :p_company
AND   emp.company      = other.company
AND   emp.company      = mul.company
AND   emp.JOINING_DATE <= :p_date
AND   mul.USER_NAME    = :p_user
AND   emp.cardno       = other.cardno
AND   emp.cardno       = mul.cardno


-----------------------------



SELECT emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO, emp.CARDNO, emp.EMPNAME, 
       emp.FATHER_NAME, emp.MOTHER_NAME, emp.JOINING_DATE, emp.DESIGNATION, 
	   emp.SALARY_GRADE, emp.BIRTH_DATE, emp.GENDER, emp.BLOODGROUP, emp.SHIFT, 
	   emp.PERMANENTADDRESS, emp.WDAY, emp.RELIGION, emp.RESIGNATION_DATE,
	   other.BOOK_SL_NO, other.OPEN_DATE, other.NID, other.OWN_CELLNO,
                   emp.ENMNAME_BANGLA, emp.DESIGNATION_BANGLA, emp.DEPT_BANGLA, emp.SEC_BANGLA, 
                  emp.PRESENT_ADD_BAN,  emp.PRESENT_PO_BAN,  emp.PRESENT_PS_BAN,  emp.PRESENT_DIST_BAN, 
                  emp.PERMANENT_ADD_BAN,  emp.PERMANENT_PO_BAN,  emp.PERMANENT_PS_BAN,  emp.PERMANENT_DIST_BAN,
                   emp.FATHER_NAME_BAN,  emp.SPOUSE_NAME_BAN,  emp.MOTHER_NAME_BAN
FROM   TB_PERSONAL_INFO emp, TB_IDCARD_MULTIPLE mul , TB_PERSONAL_INFO_OTHER other
WHERE  emp.company  = :p_company
AND    emp.company    = mul.company
AND    emp.company   = other.company
AND    emp.JOINING_DATE <= :p_date
AND   mul.USER_NAME = :p_user
AND   emp.cardno       = mul.cardno
AND    emp.CARDNO  = other.CARDNO
AND   emp.GENDER LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
ORDER BY emp.DEPARTMENTNM, emp.SECTIONNM, emp.lineno, emp.cardno ASC




SELECT emp.DEPARTMENTNM, emp.SECTIONNM, emp.LINENO, emp.CARDNO, emp.EMPNAME, 
       emp.FATHER_NAME, emp.MOTHER_NAME, emp.JOINING_DATE, emp.DESIGNATION, 
	   emp.SALARY_GRADE, emp.BIRTH_DATE, emp.GENDER, emp.BLOODGROUP, emp.SHIFT, 
	   emp.PERMANENTADDRESS, emp.WDAY, emp.RELIGION, emp.RESIGNATION_DATE,
	   other.BOOK_SL_NO, other.OPEN_DATE, other.NID, other.OWN_CELLNO,
                   
				   emp.ENMNAME_BANGLA, emp.DESIGNATION_BANGLA, emp.DEPT_BANGLA, emp.SEC_BANGLA, 
                  emp.PRESENT_ADD_BAN,  emp.PRESENT_PO_BAN,  emp.PRESENT_PS_BAN,  emp.PRESENT_DIST_BAN, 
                  emp.PERMANENT_ADD_BAN,  emp.PERMANENT_PO_BAN,  emp.PERMANENT_PS_BAN,  emp.PERMANENT_DIST_BAN,
                   emp.FATHER_NAME_BAN,  emp.SPOUSE_NAME_BAN,  emp.MOTHER_NAME_BAN
