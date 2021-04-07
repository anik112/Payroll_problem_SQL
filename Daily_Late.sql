SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm           LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.designation        LIKE DECODE(NVL(:p_designation,'all'),'all','%',:p_designation)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                   LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.gender              LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
AND   info.cardno              LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card)
ORDER BY info.lineno,info.cardno ASC


-------------------------------




SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.departmentnm IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.sectionnm IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.designation IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.workertype IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.floorno IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.machineno IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.lineno IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm,info.designation
FROM  tb_data_master  mapp,tb_personal_info info 
WHERE info.company   =:p_company
AND   mapp.company    = :p_com
AND   mapp.finyear        = TO_CHAR(:p_date,'RRRR')
AND   mapp.finmonth     = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate         = :p_date 
AND   mapp.latestatus IS NOT NULL
AND   info.cardno          = mapp.cardno
AND   info.shift IN (SELECT item_name FROM tb_setup_item WHERE company   =:p_company  AND user_name = :p_user AND  item_name IS NOT NULL ) 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.latehr,mapp.latestatus,info.sectionnm,info.departmentnm, info.designation
FROM  tb_data_master  mapp,tb_personal_info info, tb_idcard_multiple mul 
WHERE info.company    =:p_company
AND   info.company     =mul.company
AND   mapp.company  =:p_com
AND   mapp.finyear      = TO_CHAR(:p_date,'rrrr')
AND   mapp.finmonth   = RTRIM(TO_CHAR(:p_date,'Month'))
AND   mapp.pdate       =:p_date
AND   mul.user_name = :p_user
AND   mapp.latestatus IS NOT NULL
AND   info.cardno       = mapp.cardno
AND   info.cardno       =mul.cardno 
AND   info.gender LIKE DECODE(NVL(:p_gender,'all'),'all','%',:p_gender)
ORDER BY lineno, cardno ASC