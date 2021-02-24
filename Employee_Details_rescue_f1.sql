SELECT emp.FLOORNO, emp.TEAM_BOX_NO, emp.cardno, emp.empname, emp.designation, emp.SECTIONNM, emp.joining_date, pic.EMPPICTURE, sing.EMPSIGN
FROM TB_PERSONAL_INFO emp, TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN sing
WHERE emp.company   = :p_company
AND   pic.company   = emp.company
AND   sing.company  = emp.
AND   emp.TEAM_NAME IS NOT NULL
AND   emp.TEAM_NAME = 'First Aider Team'
AND   pic.cardno    = emp.cardno
AND   sing.cardno   = emp.cardno
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
ORDER BY emp.FLOORNO, emp.TEAM_BOX_NO, emp.cardno ASC



------------------------


SELECT a.FLOORNO, a.TEAM_BOX_NO, a.cardno, a.empname, a.designation, a.SECTIONNM, a.joining_date, pic.EMPPICTURE, sing.EMPSIGN
FROM
(SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   DEPARTMENTNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   SECTIONNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   designation IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   WORKERTYPE IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   FLOORNO   IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   lineno    IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT FLOORNO, TEAM_BOX_NO, cardno, empname, designation, SECTIONNM, joining_date
FROM TB_PERSONAL_INFO
WHERE company   = :p_company
AND   TEAM_NAME IS NOT NULL
AND   TEAM_NAME = 'First Aider Team'
AND   SHIFT     IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.FLOORNO, info.TEAM_BOX_NO, info.cardno, info.empname, info.designation, info.SECTIONNM, info.joining_date
FROM TB_PERSONAL_INFO info, TB_IDCARD_MULTIPLE mul
WHERE info.company   = :p_company
AND   info.company   = mul.company
AND   mul.USER_NAME  = :p_user
AND   info.TEAM_NAME IS NOT NULL
AND   info.TEAM_NAME = 'First Aider Team'
AND   info.cardno    = mul.cardno) a, 
TB_PERSONAL_INFO_PICTURE pic, TB_PERSONAL_INFO_SIGN sing
WHERE pic.company   = :p_company
AND   sing.company  = pic.company
AND   pic.cardno    = a.cardno
AND   sing.cardno   = a.cardno
ORDER BY a.FLOORNO, a.TEAM_BOX_NO, a.cardno ASC