SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno

AND   per.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   per.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   per.designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   per.workertype         LIKE DECODE(NVL(:p_wtype,'all'),'all','%',:p_wtype) 
AND   per.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno) 
AND   per.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   per.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)  
AND   per.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   per.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)  
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 

ORDER BY per.departmentnm, per.sectionnm, per.lineno, per.cardno ASC


-----------------------------




SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.departmentnm IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.sectionnm  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.designation  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0
AND   per.cardno         = nt.cardno
AND   per.workertype  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.floorno  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.machineno  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.lineno  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND   nt.total_otamt     > 0 
AND   per.cardno         = nt.cardno
AND   per.shift  IN ( SELECT item_name FROM TB_SETUP_ITEM WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL )
AND   per.gender               LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender) 
AND   per.active                 LIKE DECODE(NVL(:p_active,'all'),'all','%',:p_active) 
UNION
SELECT per.departmentnm, per.sectionnm, per.lineno, per.empname, per.designation, per.cardno,
               nt.st_date, nt.ed_date, nt.finyear, nt.total_otamt, nt.total_othr
FROM   TB_PERSONAL_INFO per, TB_CLR_MONTH_OT_DETAIL  nt, TB_IDCARD_MULTIPLE mul
WHERE per.company  = :p_company
AND   per.company      = nt.company
AND	  per.company     = mul.company
AND   nt.total_otamt     > 0 
AND   mul.user_name   = :p_user
AND   per.cardno      = mul.cardno
AND   per.cardno         = nt.cardno
ORDER BY departmentnm, sectionnm, lineno, cardno ASC
