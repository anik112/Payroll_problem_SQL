SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   TO_CHAR(info.JOINING_DATE,'RRRR')        =:p_year
AND   RTRIM(TO_CHAR(info.JOINING_DATE,'Month')) =:p_month
AND   info.JOINING_DATE IS NOT NULL
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.DESIGNATION    LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.SECTIONNM,mapp.pdate,info.lineno,info.cardno  


--------------------------------------------


SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   TO_CHAR(info.RESIGNATION_DATE,'RRRR')        =:p_year
AND   RTRIM(TO_CHAR(info.RESIGNATION_DATE,'Month')) =:p_month
AND   info.RESIGNATION_DATE IS NOT NULL
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno  
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION    LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.SECTIONNM,mapp.pdate,info.lineno,info.cardno  


------------------------------------------


SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.DESIGNATION    LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno                LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.SECTIONNM,mapp.pdate,info.lineno,info.cardno ASC


------------------------------------------



SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno
AND   info.sectionnm     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.DESIGNATION  IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.workertype    IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.floorno	     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.machineno	 IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.lineno	     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company                =:p_company 
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   info.cardno                      = mapp.cardno 
AND   info.shift	     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.INTIME,mapp.OUTTIME,
               mapp.LATEHR,mapp.LATESTATUS,info.SECTIONNM,mapp.pdate, info.DESIGNATION
FROM  tb_data_master mapp,tb_personal_info info, tb_idcard_multiple mul
WHERE info.company                =:p_company 
AND   info.company      = mul.company
AND   mapp.company                 = :p_com
AND   info.DEPARTMENTNM    = :p_dept 
AND   mapp.finyear                     = :p_year
AND   mapp.finmonth                  = :p_month
AND   mapp.LATESTATUS IS NOT NULL
AND   mul.user_name    = :p_user
AND   info.cardno                      = mapp.cardno 
AND   info.cardno          = mul.cardno
ORDER BY SECTIONNM,pdate,lineno,cardno ASC