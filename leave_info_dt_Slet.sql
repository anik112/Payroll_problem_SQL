SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.sectionnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.designation IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.workertype IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.floorno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.machineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate]
AND    lev.cardno            = per.cardno
AND    per.lineno IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    lev.cardno            = per.cardno
AND    per.shift IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company    =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
AND    per.active               LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active)
AND    lev.leave_type  LIKE DECODE(NVL(:p_leavetype,'all'),'all','%',:p_leavetype)
UNION
SELECT per.cardno,per.empname,per.designation,lev.leave_type,lev.start_date,lev.end_date,
               lev.reason,per.sectionnm,per.departmentnm, lev.salday, per.lineno
FROM   TB_LEAVE_DETAILINFO lev, TB_PERSONAL_INFO per, TB_IDCARD_MULTIPLE mul
WHERE  lev.company    = :p_company
AND    lev.company        = per.company
AND    lev.company           = mul.company
AND    lev.start_date BETWEEN :p_sdate AND :p_edate
AND    mul.user_name =  :p_user
AND    lev.cardno            = per.cardno
AND    lev.cardno          = mul.cardno