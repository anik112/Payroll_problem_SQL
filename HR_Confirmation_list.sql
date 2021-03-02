SELECT info.cardno, info.empname, info.joining_date, info.designation, (info.grosssalary + info.GROSS_BK)grosssalary, 
       info.lineno, info.SECTIONNM, info.DEPARTMENTNM, info.BIRTH_DATE, 
       info.SALARY_GRADE, edu.LEVEL_DEGREE , other.PERFORMANCE
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu, TB_PERSONAL_INFO_OTHER other
WHERE info.company   = :p_company
AND   info.company   = edu.company
AND   info.company   = other.company
AND   info.cardno    = edu.cardno
AND   info.cardno    = other.cardno
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


-------------- selected  -----------



SELECT info.cardno, info.empname, info.joining_date, info.designation, (info.grosssalary + info.GROSS_BK)grosssalary, 
       info.lineno, info.SECTIONNM, info.DEPARTMENTNM, info.BIRTH_DATE, 
       info.SALARY_GRADE, edu.LEVEL_DEGREE , other.PERFORMANCE
FROM  TB_PERSONAL_INFO info, TB_PERSONAL_EDUCATIONAL edu,
      TB_PERSONAL_INFO_OTHER other, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = mul.company
AND   info.company   = edu.company
AND   info.company   = other.company
AND   mul.USER_NAME  = :p_user
AND   info.cardno    = mul.cardno
AND   info.cardno    = edu.cardno
AND   info.cardno    = other.cardno



