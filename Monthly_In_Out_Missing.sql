SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
       mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE info.company      =:p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   TO_CHAR(info.joining_date,'RRRR')        = TO_CHAR(:p_fromdate,'RRRR')
AND   RTRIM(TO_CHAR(info.joining_date,'Month')) = RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno       LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.sectionnm,mapp.pdate,info.cardno ASC



--------------------------------------------------------------------------


SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp, tb_personal_info info 
WHERE  info.company   = :p_company 
AND   mapp.company     = :p_com
AND   mapp.finyear         =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth      =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   TO_CHAR(info.resignation_date,'RRRR')              = TO_CHAR(:p_fromdate,'RRRR')
AND   RTRIM(TO_CHAR(info.resignation_date,'Month')) = RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno           = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno               LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.sectionnm,mapp.pdate,info.cardno ASC




--------------------------------------------------------------


SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.departmentnm    LIKE DECODE(NVL(:p_dept,'all'),'all','%',:p_dept) 
AND   info.sectionnm          LIKE DECODE(NVL(:p_section,'all'),'all','%',:p_section)
AND   info.workertype         LIKE DECODE(NVL(:p_woker,'all'),'all','%',:p_woker)
AND   info.floorno               LIKE DECODE(NVL(:p_floorno,'all'),'all','%',:p_floorno)
AND   info.machineno         LIKE DECODE(NVL(:p_machineno,'all'),'all','%',:p_machineno)
AND   info.lineno                 LIKE DECODE(NVL(:p_line,'all'),'all','%',:p_line)
AND   info.shift                    LIKE DECODE(NVL(:p_shift,'all'),'all','%',:p_shift)
AND   info.cardno                LIKE DECODE(NVL(:p_card,'all'),'all','%',:p_card) 
ORDER BY info.sectionnm,mapp.pdate,info.cardno ASC


-----------------------------------------


SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.sectionnm     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.departmentnm  IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.workertype    IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.floorno	     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.machineno	 IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.lineno	     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info 
WHERE  info.company = :p_company 
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   info.cardno          = mapp.cardno
AND   info.shift	     IN ( SELECT item_name FROM tb_setup_item WHERE company =:p_company AND item_name IS NOT NULL AND user_name = :p_user)
UNION
SELECT info.cardno,info.empname,info.lineno,mapp.intime,mapp.outtime,
               mapp.duration,mapp.latestatus,info.departmentnm,info.sectionnm, mapp.pdate, info.designation
FROM  tb_data_master mapp,tb_personal_info info, tb_idcard_multiple mul
WHERE  info.company = :p_company 
AND   info.company      = mul.company
AND   mapp.company   = :p_com
AND   mapp.finyear       =  TO_CHAR(:p_fromdate,'RRRR')
AND   mapp.finmonth    =  RTRIM(TO_CHAR(:p_fromdate,'Month'))
AND   mapp.pdate BETWEEN :p_fromdate AND :ptodate
AND   (mapp.intime IS NULL OR mapp.outtime IS NULL)
AND   mul.user_name    = :p_user
AND   info.cardno          = mapp.cardno
AND   info.cardno          = mul.cardno
ORDER BY sectionnm, pdate, cardno ASC