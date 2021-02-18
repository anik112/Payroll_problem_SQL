SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM TB_PERSONAL_INFO
WHERE company =:p_company
AND   DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND   BANK_NAME    LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   MFT_TYPE     LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND   cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY DEPARTMENTNM,SECTIONNM,lineno,cardno ASC


-------------------------------------------------------------------------


SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company  =:p_company
AND    DEPARTMENTNM  IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER        LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND    active        LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company  =:p_company
AND    SECTIONNM  IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER     LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND    active     LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company  =:p_company
AND    DESIGNATION IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER      LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company  =:p_company
AND    WORKERTYPE  IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER      LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active      LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company  =:p_company
AND    FLOORNO  IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER   LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active   LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company   =:p_company
AND    MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company =:p_company
AND    LINENO  IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno,secreteno,empname,joining_date, BIRTH_DATE, designation,lineno,SECTIONNM,DEPARTMENTNM
FROM   TB_PERSONAL_INFO
WHERE  company =:p_company
AND    SHIFT   IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company=:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND    GENDER  LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    active  LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT emp.cardno,emp.secreteno,emp.empname,emp.joining_date,emp.BIRTH_DATE,emp.designation,emp.lineno,emp.SECTIONNM,emp.DEPARTMENTNM
FROM   TB_PERSONAL_INFO emp, TB_IDCARD_MULTIPLE mul
WHERE  emp.company   =:p_company
AND    emp.company   = mul.company
AND    mul.USER_NAME = :p_user
AND    emp.cardno    = mul.cardno
AND    emp.GENDER LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND    emp.active LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY DEPARTMENTNM,SECTIONNM,lineno,cardno ASC