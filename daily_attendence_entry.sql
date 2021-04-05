SELECT MIN(mov.ptime)AS mintime,info.cardno,info.empname,info.designation,
               info.lineno,info.joining_date,info.departmentnm,info.sectionnm
FROM     TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.departmentnm  LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept)
AND        info.sectionnm        LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND        info.designation      LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND        info.workertype       LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND        info.floorno             LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND        info.machineno      LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND        info.lineno               LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND        info.shift                  LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift) 
AND        info.cardno             LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
GROUP BY info.cardno,info.empname,info.designation,
                    info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
ORDER BY info.lineno,info.cardno ASC



-------------------------------  selected   


SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.departmentnm IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   = :p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND    info.sectionnm IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND       info.designation IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.workertype IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.floorno IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.machineno IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.lineno IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM    TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info
WHERE  info.company  = :p_company 
AND        mov.company = :p_com 
AND        mov.pdate      = :p_date 
AND        mov.cardno    = info.cardno 
AND        info.shift IN (SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno
UNION
SELECT MIN(mov.ptime) AS mintime, info.cardno, info.empname, info.designation,
               info.lineno, info.joining_date, info.departmentnm, info.sectionnm
FROM   TB_DATA_MOVEMENT mov,TB_PERSONAL_INFO info,TB_IDCARD_MULTIPLE mul
WHERE  info.company  = :p_company 
AND       mov.company  = :p_com
AND       mov.pdate       = :p_date 
AND       mov.cardno     = info.cardno 
AND       info.company   = mul.company
AND       info.cardno      = mul.cardno
GROUP BY info.cardno,info.empname,info.designation,
info.lineno,info.joining_date,info.departmentnm,info.sectionnm,info.lineno


