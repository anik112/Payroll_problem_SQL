SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.DEPARTMENTNM LIKE DECODE(NVL(:p_deptname,'all'),'all','%',:p_deptname)
AND   info.SECTIONNM    LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION  LIKE DECODE(NVL(:p_desig,'all'),'all','%',:p_desig)
AND   info.WORKERTYPE   LIKE DECODE(NVL(:p_worker,'all'),'all','%',:p_worker)
AND   info.FLOORNO      LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.MACHINENO    LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno       LIKE DECODE(NVL(:p_lineno,'all'),'all','%',:p_lineno)
AND   info.SHIFT        LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND   info.GENDER       LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   info.CASH_TYPE    LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype) 
AND   info.BANK_NAME    LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname)
AND   info.MFT_TYPE     LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type) 
AND   info.cardno       LIKE DECODE(NVL(:p_cardno,'all'),'all','%',:p_cardno) 
AND   info.active       LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
ORDER BY info.cardno ASC




---------------------------- Selected   -------



SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.DEPARTMENTNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.SECTIONNM IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.designation IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.WORKERTYPE IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other 
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.MACHINENO IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.FLOORNO   IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.lineno    IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info,TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   other.cardno  = info.cardno
AND   info.SHIFT     IN ( SELECT ITEM_NAME FROM TB_SETUP_ITEM WHERE company =:p_company AND ITEM_NAME IS NOT NULL AND USER_NAME = :p_user)
AND   info.GENDER    LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.CASH_TYPE LIKE DECODE(NVL(:p_paytype,'all'),'all','%',:p_paytype)
AND   info.BANK_NAME LIKE DECODE(NVL(:p_bkname,'all'),'all','%',:p_bkname) 
AND   info.MFT_TYPE  LIKE DECODE(NVL(:p_mft_type,'all'),'all','%',:p_mft_type)
AND   info.active    LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
UNION
SELECT info.cardno, info.secreteno, info.empname, info.designation, info.BIRTH_DATE, info.joining_date, (info.grosssalary + info.GROSS_BK) GROSSSALARY,
       info.SALARY_GRADE, info.GENDER, info.BLOODGROUP, other.NID, other.OWN_CELLNO, info.SECTIONNM, info.lineno,
       (info.PRESENT_DIST||', '||info.PRESENT_PS||', '||info.PRESENT_PO||', '||info.PRESENT_ADDRESS) present_address, 
       (info.PERMANENT_DIST||', '||info.PERMANENT_PS||', '||info.PERMANENT_PO||', '||info.PERMANENTADDRESS) permanent_address
FROM TB_PERSONAL_INFO info, TB_PERSONAL_INFO_OTHER other, TB_IDCARD_MULTIPLE mul
WHERE info.company  =:p_company
AND   mul.company   = info.company
AND   other.company = info.company
AND   mul.USER_NAME = :p_user
AND   info.cardno   = mul.cardno
AND   other.cardno  = info.cardno
ORDER BY cardno ASC