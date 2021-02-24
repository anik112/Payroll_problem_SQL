SELECT emp.cardno, emp.empname, emp.designation, emp.SECTIONNM, emp.joining_date, emp.TEAM_JOIN_DATE, emp.lineno, emp.TEAM_NAME, emp.TEAM_DESIGNATION, 
pic.EMPPICTURE, sing.EMPSIGN
FROM tb_personal_info emp, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN sing
WHERE emp.company   = :p_company
AND   emp.company   = pic.company
AND   emp.company   = sing.company
AND   emp.cardno    = pic.cardno
AND   emp.cardno    = sing.cardno
AND   emp.TEAM_NAME IS NOT NULL
AND   emp.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   emp.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   emp.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   emp.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   emp.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   emp.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   emp.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   emp.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   emp.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   emp.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND   emp.BANK_NAME    LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   emp.MFT_TYPE     LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND   emp.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   emp.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY emp.TEAM_NAME, emp.TEAM_DESIGNATION DESC 




-------------  seletced  --



SELECT a.cardno, a.empname, a.designation, a.SECTIONNM, a.joining_date, a.TEAM_JOIN_DATE, a.lineno, a.TEAM_NAME, a.TEAM_DESIGNATION, pic.EMPPICTURE, sing.EMPSIGN
FROM
(SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   DEPARTMENTNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   SECTIONNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   designation IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   WORKERTYPE IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   FLOORNO   IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   lineno    IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT cardno, empname, designation, SECTIONNM, joining_date, TEAM_JOIN_DATE, lineno, TEAM_NAME, TEAM_DESIGNATION
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   SHIFT     IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.empname, info.designation, info.SECTIONNM, info.joining_date, info.TEAM_JOIN_DATE, info.lineno, info.TEAM_NAME, info.TEAM_DESIGNATION
FROM TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = mul.company
AND   mul.USER_NAME  = :p_user
AND   info.TEAM_NAME IS NOT NULL
AND   info.cardno    = mul.cardno) a, 
TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN sing
WHERE pic.company   = :p_company
AND   sing.company  = pic.company
AND   pic.cardno    = a.cardno
AND   sing.cardno   = a.cardno
ORDER BY a.TEAM_NAME, a.TEAM_DESIGNATION DESC 