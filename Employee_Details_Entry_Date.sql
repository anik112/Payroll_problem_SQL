
SELECT info.cardno, info.empname, info.FATHER_NAME, info.designation,  info.joining_date, 
       (info.grosssalary + info.GROSS_BK)GROSSSALARY, info.lineno, info.SECTIONNM, info.DEPARTMENTNM, info.WORKERTYPE, 
       info.PRESENT_ADDRESS, info.BIRTH_DATE, info.GENDER, info.BLOODGROUP, info.SALARY_GRADE,  info.WDAY, info.RELIGION, info.CASH_TYPE,  
       info.BANK_NAME, other.NID, info.NT_STATUS, info.TF_STATUS, info.IFTAR_STATUS,  info.ATTN_BS_STATUS, info.EMERGEN_STATUS,  
       info.WK_DAY_STATUS, info.FS_DAY_STATUS,  info.TS_STATUS,  info.PAY_SAL,  info.PAY_OTHER,  info.OTORG, info.OTCOM,  info.PRODUC_STATUS
FROM  TB_PERSONAL_INFO info , TB_PERSONAL_INFO_OTHER other
WHERE info.company  =:p_company
AND   other.company = info.company
AND   TO_DATE(info.PROCESS_DATE,'DD/MM/RRRR') BETWEEN :p_sdate AND :p_edate
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
ORDER BY info.DEPARTMENTNM, info.SECTIONNM, info.LINENO, info.CARDNO ASC
