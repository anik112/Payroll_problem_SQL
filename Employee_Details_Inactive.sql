SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY DEPARTMENTNM,SECTIONNM,lineno,cardno ASC


-------------  selected  --


SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   DEPARTMENTNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   SECTIONNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   designation IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   WORKERTYPE IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   FLOORNO   IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   lineno    IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT DEPARTMENTNM,SECTIONNM,lineno,cardno,empname,FATHER_NAME,joining_date,RESIGNATION_DATE,designation,(grosssalary+GROSS_BK) GROSSSALARY 
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   active  = 1
AND   SHIFT     IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   TO_CHAR(resignation_date,'rrrr')         LIKE DECODE(NVL(:p_year,'all'),'all','%',:p_year)
AND   RTRIM(TO_CHAR(resignation_date,'Month')) LIKE DECODE(NVL(:p_month,'all'),'all','%',:p_month)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.DEPARTMENTNM,info.SECTIONNM,info.lineno,info.cardno,info.empname,info.FATHER_NAME,info.joining_date,
info.RESIGNATION_DATE, info.designation,(info.grosssalary+info.GROSS_BK) GROSSSALARY
FROM TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE info.company  = :p_company
AND   info.company  = mul.company
AND   mul.USER_NAME = :p_user
AND   info.active   = 1
AND   info.cardno   = mul.cardno
ORDER BY DEPARTMENTNM, SECTIONNM, lineno, cardno ASC






