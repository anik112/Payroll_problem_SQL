SELECT info.cardno, info.ENMNAME_BANGLA, info.FATHER_NAME_BAN,  info.SPOUSE_NAME_BAN,  info.MOTHER_NAME_BAN,
	   info.DESIGNATION_BANGLA, info.DEPT_BANGLA, info.SEC_BANGLA, info.PRESENT_ADD_BAN,  info.PRESENT_PO_BAN, 
	   info.PRESENT_PS_BAN,info.PRESENT_DIST_BAN, info.PERMANENT_ADD_BAN,  info.PERMANENT_PO_BAN,  info.PERMANENT_PS_BAN,
	   info.PERMANENT_DIST_BAN,other.REF1, other.OWN_CELLNO, other.EMAIL_ADDRESS, info.joining_date, other.NID, 
	   other.BIRTH_CERTIFICATE_NO, info.MARITAL_STATUS, other.TOTALCHILD, other.MALECHILD, other.FEMALECHILD, info.BIRTH_DATE, INFO.COMPANY,
	   (info.grosssalary + info.GROSS_BK) grosssalary, info.BLOODGROUP  
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other
WHERE info.company = :p_company
AND   info.company = other.company
AND   info.cardno  = other.cardno
AND   TO_CHAR(info.JOINING_DATE,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.DEPARTMENTNM, info.SECTIONNM, info.lineno, info.cardno ASC



SELECT DISTINCT edu.HIGHEST_DEGREE,info.company COMPANY_EDU,info.cardno CARDNO_EDU,
          EDU.LEVEL_DEGREE, EDU.INSTITUTE_NAME, EDU.PASSING_YR, EDU.CLASS_GRADE, EDU.SUBJECT
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu
WHERE info.company = :p_company
AND   info.company = edu.company
AND   info.cardno  = edu.cardno
AND   TO_CHAR(info.JOINING_DATE,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY EDU.PASSING_YR ASC




SELECT emp.COMPANYNAME, emp.START_DATE, emp.END_DATE, emp.DESIGNATION DESIGNATION_exp,
       info.company company_EXP,info.cardno CARD_EXP
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT emp
WHERE info.company = :p_company
AND   info.company = emp.company
AND   info.cardno  = emp.cardno
AND   TO_CHAR(info.JOINING_DATE,'RRRR')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   info.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)	
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY emp.START_DATE ASC


---------- selected  ------------


SELECT info.cardno, info.ENMNAME_BANGLA, info.FATHER_NAME_BAN,  info.SPOUSE_NAME_BAN,  info.MOTHER_NAME_BAN,
	   info.DESIGNATION_BANGLA, info.DEPT_BANGLA, info.SEC_BANGLA, info.PRESENT_ADD_BAN,  info.PRESENT_PO_BAN, 
	   info.PRESENT_PS_BAN,info.PRESENT_DIST_BAN, info.PERMANENT_ADD_BAN,  info.PERMANENT_PO_BAN,  info.PERMANENT_PS_BAN,
	   info.PERMANENT_DIST_BAN,other.REF1, other.OWN_CELLNO, other.EMAIL_ADDRESS, info.joining_date, other.NID, 
	   other.BIRTH_CERTIFICATE_NO, info.MARITAL_STATUS, other.TOTALCHILD, other.MALECHILD, other.FEMALECHILD, info.BIRTH_DATE, INFO.COMPANY,
	   (info.grosssalary + info.GROSS_BK) grosssalary, info.BLOODGROUP  
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = other.company
AND   info.company   = mul.company
AND   mul.USER_NAME  = :p_user
AND   info.cardno    = other.cardno
AND   info.cardno    = mul.cardno



SELECT DISTINCT edu.HIGHEST_DEGREE,info.company COMPANY_EDU,info.cardno CARDNO_EDU,
          EDU.LEVEL_DEGREE, EDU.INSTITUTE_NAME, EDU.PASSING_YR, EDU.CLASS_GRADE, EDU.SUBJECT
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = edu.company
AND   info.company   = mul.company
AND   mul.USER_NAME  = :p_user
AND   info.cardno    = edu.cardno
AND   info.cardno    = mul.cardno


SELECT emp.COMPANYNAME, emp.START_DATE, emp.END_DATE, emp.DESIGNATION DESIGNATION_exp,
       info.company company_EXP,info.cardno CARD_EXP
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EMPLOYMENT emp, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = emp.company
AND   info.company   = mul.company
AND   mul.USER_NAME  = :p_user
AND   info.cardno    = emp.cardno
AND   info.cardno    = mul.cardno
