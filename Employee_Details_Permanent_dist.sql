SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
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
ORDER BY PERMANENT_DIST, lineno,cardno ASC



-------------- selected  --


SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   DEPARTMENTNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   SECTIONNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   designation IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   WORKERTYPE IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   FLOORNO   IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   lineno    IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT lineno, cardno, empname, designation, joining_date, (grosssalary + GROSS_BK)grosssalary, PERMANENT_DIST
FROM TB_PERSONAL_INFO
WHERE company = :p_company
AND   PERMANENT_DIST IS NOT NULL
AND   SHIFT     IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.lineno, info.cardno, info.empname, info.designation, info.joining_date, (info.grosssalary + info.GROSS_BK) grosssalary, info.PERMANENT_DIST
FROM TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = mul.company
AND   mul.USER_NAME  = :p_user
AND   info.PERMANENT_DIST IS NOT NULL
AND   info.cardno    = mul.cardno
ORDER BY PERMANENT_DIST, lineno,cardno ASC